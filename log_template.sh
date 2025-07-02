#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'
WHITE='\033[1;97m'

DEBUG_COLOR='\033[1;36m'
INFO_COLOR='\033[1;32m'
WARNING_COLOR='\033[1;33m'
ERROR_COLOR='\033[1;31m' 

# Alignement
LEVEL_WIDTH=7
MODULE_WIDTH=12

log() {
    local level="$1"
    local module="$2"
    local message="$3"

    case "$level" in
        DEBUG) color="$DEBUG_COLOR" ;;
        INFO) color="$INFO_COLOR" ;;
        WARNING) color="$WARNING_COLOR" ;;
        ERROR) color="$ERROR_COLOR" ;;
        *) color="$BOLD" ;;  # Default bold
    esac

    printf "$(date) ${WHITE}[${color}%-${LEVEL_WIDTH}s${WHITE}] [%-${MODULE_WIDTH}s]${RESET} %s\n" "$level" "$module" "$message"
}

# Demonstration of logging
log DEBUG "Internet" "Pinging google.com..."
log INFO "Internet" "Internet is reachable."
log WARNING "Internet" "Internet is not reachable."
log ERROR "Download" "Can't download file. Check your internet connection."
