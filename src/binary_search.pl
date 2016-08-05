#!/usr/bin/env perl
use strict; 
use warnings; 
use feature qw(say); 

# Implementing binary search
# Usage : ./binary_search.pl number_to_search
# Prerequisite : Array should be sorted 

sub binarySearch {
    my($array, $toSearch, $low, $high) = @_ ;
   
    # base case 
    if ($low > $high) {
        return -1; 
    }

    # get the middle element 
    my $mid = int (($low + $high) / 2); 

    # return the index if found 
    if ($toSearch == $array->[$mid])  {
        return $mid; 
    }
    elsif ($toSearch > $array->[$mid])  { 
        binarySearch($array, $toSearch, $mid + 1, $high); 
    }
    elsif ($toSearch < $array->[$mid])  {
        binarySearch($array, $toSearch, $low, $mid - 1); 
    }

}

# dummy sorted Array
my @dummySortedArray =  (3, 5 , 9, 20 , 54, 73);

# For binary search, we will maintain a window
my ($low, $high) = (0, $#dummySortedArray)
;
# Pass to the sub routine 
# Sorted Array 
# Number to search 
# lowest point of the window
# highest point of the window 
my $status = binarySearch(\@dummySortedArray, $ARGV[0], $low, $high);

if ($status == -1) {
    say "Can't find " . $ARGV[0] . " in the array "; 
}
 else {
    say "Found " . $ARGV[0] . " at index " . $status ;
}
