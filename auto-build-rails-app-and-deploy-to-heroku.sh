#!/bin/bash

useage()
{
    echo "Useage: `basename $0` <appname>"
}


if [ $# -ne 1 ] ; then
    useage
    exit 1
fi

NAME="$1"

if [ "x" = "x$NAME" ] ; then
    echo "*** Error: 'appname' should'n be null."
    useage
    exit 1
fi

echo "appname you inputed is $NAME."
echo "Start building and deploying ..."

rails new $NAME && cd $NAME && git init && git add . && git commit -m 'Initial commit.' && heroku create $NAME && git push heroku master && heroku open && cd .. && ls -l && echo $NAME

if [[ $? -eq 0 ]] ; then
    echo "Successful."
else
    echo "Failed."
fi
