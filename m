Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE18B6230
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37DC10FF81;
	Mon, 29 Apr 2024 19:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TGP22HaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15D210EA94;
 Mon, 29 Apr 2024 19:32:34 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7d86adab5a7so221874739f.3; 
 Mon, 29 Apr 2024 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419154; x=1715023954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pq4ZiJLK6BcfE4voyEu9rBYsxQO4F/Ao/sRtoPa9Ovs=;
 b=TGP22HaN/usDCHuz0ulZVY3TWktOIO8xHq838dIko36ZEVJIwirPdZ/6H/f9i3QRXH
 hADv0TRW+TwB0SXZKRiguW9UIZH7dmAy4s1HD0+2vI7NG9hOgnHkD5VVK1pCmpTcsoEN
 mgmGNtG9boxPOGLtNDVt7UYt/bJk+RnbnfzcQv3tc/cw6VO7cYBlWpqnIEo61m6KY4RF
 +RNeh9WLnxbChDKNwYivQmabAuHwxXWt7/vNUueVN0uheHzBwx23KXlHC6EsqR9/c8G3
 3P6EcsltV4TQVC50uFxOyhSaNGSlvVxwFUAVas47CXH5Q5j9aREtvAPsb/YnH/spHMnt
 GNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419154; x=1715023954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pq4ZiJLK6BcfE4voyEu9rBYsxQO4F/Ao/sRtoPa9Ovs=;
 b=edk0vdcob2llE4b4RIFjZAfE6mbm7nRKoSGmXpX/W7jYE/RNtnCmixAq6cdYjd/UAd
 JGhSdcAHAi12GBPBN7fYdHykdYpvQs3qQ8Gzhe8WPTqGLD8XbGrmq7HKJlSPYtgDqa3G
 W8IzHCmk6BCnskfTmlV3PFXDnG604++gIkIvyecAoYRsGxLaUJGUEijqaOd6AOcbedWl
 H5vI/a3cuNJ13yGF8QXnvCPSCvRJ3LgCoGF6VKnXwYqvee5igkSOmrPsSHsTktx0790R
 vSwpLmmGFoltZUIJ9Mi4hJ3WVJ/prM5rNr+m9j+4cPzi3wbysAtE2XpGXUB4+fJJPBD6
 0VrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr+vVQND+iSaVMpHXQ+wDskpoVrUp8hhSZBJA/vAfVjydnmlsLcC4/A3oBiZG7yhMh0QoF50PHPLFITIMvlyRD3Ny8Jpx5BII6KziUFX3sHWnHIrOfx4So+wi9jNho8ur/Qvd3XHrf8YPXqfWpc03CG56r9zeisCfCNU3T1slihkzMJ6wNU4NHRHdtsjtWuQQ1S03X6pJaqxuyT6m+qUu2Lgvjsg1rYjXWPMrh4pWlz7UDxQ4=
X-Gm-Message-State: AOJu0YwslSzzUvYtL2zhMTaT8ZFnKXgp0wEYFwjkwa025KoxDbTQgym1
 CdIsZS7pGPoqNg5UU72GfUMKdwDZc6cdEN0WnjRJK6ozen+OBu7A8j70X4QB
X-Google-Smtp-Source: AGHT+IGAaW2hRrsuvMwXdBuIGg+/zrn5i3v85bBCFlcLaGwnfFoSRbELkeRfypbWLxxyGFwSQSUPJg==
X-Received: by 2002:a05:6602:2bef:b0:7de:cd12:ed2d with SMTP id
 d15-20020a0566022bef00b007decd12ed2dmr4826083ioy.3.1714419153929; 
 Mon, 29 Apr 2024 12:32:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 17/35] selftests-dyndbg: add
 tools/testing/selftests/dynamic_debug/*
Date: Mon, 29 Apr 2024 13:31:27 -0600
Message-ID: <20240429193145.66543-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a selftest script for dynamic-debug.  The config requires
CONFIG_TEST_DYNAMIC_DEBUG=m (and CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m),
which tacitly requires either CONFIG_DYNAMIC_DEBUG=y or
CONFIG_DYNAMIC_DEBUG_CORE=y

ATM this has just basic_tests(), it modifies pr_debug flags in a few
builtins (init/main, params), counts the callsite flags changed, and
verifies against expected values.

This is backported from another feature branch; the support-fns (thx
Lukas) have unused features at the moment, they'll get used shortly.

The script enables simple virtme-ng testing:

  $> vng --verbose --name v6.8-32-g30d431000676 --user root \
     --cwd ../.. -a dynamic_debug.verbose=2 -p 4 \
     ./tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

virtme: waiting for virtiofsd to start
virtme: use 'microvm' QEMU architecture
...
[    4.136168] virtme-init: Setting hostname to v6.8-32-g30d431000676...
[    4.240874] virtme-init: starting script
test_dynamic_debug_submod not there
test_dynamic_debug not there
...
[    4.474435] virtme-init: script returned {0}
Powering off.
[    4.529318] ACPI: PM: Preparing to enter system sleep state S5
[    4.529991] kvm: exiting hardware virtualization
[    4.530428] reboot: Power down

And add dynamic_debug to TARGETS, so `make run_tests` sees it properly

for the impatient, set TARGETS explicitly:

bash-5.2# make TARGETS=dynamic_debug run_tests
make[1]: ...
TAP version 13
1..1
[   35.552922] dyndbg: read 3 bytes from userspace
[   35.553099] dyndbg: query 0: "=_" mod:*
[   35.553544] dyndbg: processed 1 queries, with 1778 matches, 0 errs
...

TLDR:

This selftest is slightly naive wrt the init state of call-site flags.

In particular, it fails if class'd pr_debugs have been set

  $ cat /etc/modprobe.d/drm-test.conf
  options drm dyndbg=class,DRM_UT_CORE,+mfslt%class,DRM_UT_KMS,+mf

By Contract, class'd pr_debugs are protected from alteration by
default (only by direct "class FOO" queries), so the "=_" logged above
(TAP version 13) cannot affect the DRM_UT_CORE,KMS pr_debugs.

These class'd flag-settings, added by modprobe, alter the counts of
flag-matching patterns, breaking the tests' expectations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   2 +
 .../dynamic_debug/dyndbg_selftest.sh          | 231 ++++++++++++++++++
 5 files changed, 244 insertions(+)
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index cf9fccbc6bde..bdffd192d3df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7526,6 +7526,7 @@ S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
 F:	lib/test_dynamic_debug*.c
+F:	tools/testing/selftest/dynamic_debug/*
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index e1504833654d..84edf0bd8e80 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -20,6 +20,7 @@ TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net/bonding
 TARGETS += drivers/net/team
 TARGETS += dt
+TARGETS += dynamic_debug
 TARGETS += efivarfs
 TARGETS += exec
 TARGETS += fchmodat2
diff --git a/tools/testing/selftests/dynamic_debug/Makefile b/tools/testing/selftests/dynamic_debug/Makefile
new file mode 100644
index 000000000000..6d06fa7f1040
--- /dev/null
+++ b/tools/testing/selftests/dynamic_debug/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# borrowed from Makefile for user memory selftests
+
+# No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
+all:
+
+TEST_PROGS := dyndbg_selftest.sh
+
+include ../lib.mk
diff --git a/tools/testing/selftests/dynamic_debug/config b/tools/testing/selftests/dynamic_debug/config
new file mode 100644
index 000000000000..d080da571ac0
--- /dev/null
+++ b/tools/testing/selftests/dynamic_debug/config
@@ -0,0 +1,2 @@
+CONFIG_TEST_DYNAMIC_DEBUG=m
+CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
new file mode 100755
index 000000000000..1be70af26a38
--- /dev/null
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -0,0 +1,231 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+
+V=${V:=0}  # invoke as V=1 $0  for global verbose
+RED="\033[0;31m"
+GREEN="\033[0;32m"
+YELLOW="\033[0;33m"
+BLUE="\033[0;34m"
+MAGENTA="\033[0;35m"
+CYAN="\033[0;36m"
+NC="\033[0;0m"
+error_msg=""
+
+function vx () {
+    echo $1 > /sys/module/dynamic_debug/parameters/verbose
+}
+
+function ddgrep () {
+    grep $1 /proc/dynamic_debug/control
+}
+
+function doprints () {
+    cat /sys/module/test_dynamic_debug/parameters/do_prints
+}
+
+function ddcmd () {
+    exp_exit_code=0
+    num_args=$#
+    if [ "${@:$#}" = "pass" ]; then
+	num_args=$#-1
+    elif [ "${@:$#}" = "fail" ]; then
+        num_args=$#-1
+	exp_exit_code=1
+    fi
+    args=${@:1:$num_args}
+    output=$((echo "$args" > /proc/dynamic_debug/control) 2>&1)
+    exit_code=$?
+    error_msg=$(echo $output | cut -d ":" -f 5 | sed -e 's/^[[:space:]]*//')
+    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
+}
+
+function handle_exit_code() {
+    local exp_exit_code=0
+    [ $# == 4 ] && exp_exit_code=$4
+    if [ $3 -ne $exp_exit_code ]; then
+        echo -e "${RED}: $BASH_SOURCE:$1 $2() expected to exit with code $exp_exit_code"
+	[ $3 == 1 ] && echo "Error: '$error_msg'"
+        exit
+    fi
+}
+
+# $1 - pattern to match, pattern in $1 is enclosed by spaces for a match ""\s$1\s"
+# $2 - number of times the pattern passed in $1 is expected to match
+# $3 - optional can be set either to "-r" or "-v"
+#       "-r" means relaxed matching in this case pattern provided in $1 is passed
+#       as is without enclosing it with spaces
+#       "-v" prints matching lines
+# $4 - optional when $3 is set to "-r" then $4 can be used to pass "-v"
+function check_match_ct {
+    pattern="\s$1\s"
+    exp_cnt=0
+
+    [ "$3" == "-r" ] && pattern="$1"
+    let cnt=$(ddgrep "$pattern" | wc -l)
+    if [ $V -eq 1 ] || [ "$3" == "-v" ] || [ "$4" == "-v" ]; then
+        echo -ne "${BLUE}" && ddgrep $pattern && echo -ne "${NC}"
+    fi
+    [ $# -gt 1 ] && exp_cnt=$2
+    if [ $cnt -ne $exp_cnt ]; then
+        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO check failed expected $exp_cnt on $1, got $cnt"
+        exit
+    else
+        echo ": $cnt matches on $1"
+    fi
+}
+
+# $1 - trace instance name
+# #2 - if > 0 then directory is expected to exist, if <= 0 then otherwise
+# $3 - "-v" for verbose
+function check_trace_instance_dir {
+    if [ -e /sys/kernel/tracing/instances/$1 ]; then
+        if [ "$3" == "-v" ] ; then
+            echo "ls -l /sys/kernel/tracing/instances/$1: "
+            ls -l /sys/kernel/tracing/instances/$1
+        fi
+	if [ $2 -le 0 ]; then
+            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace instance \
+		    '/sys/kernel/tracing/instances/$1' does exist"
+	    exit
+	fi
+    else
+	if [ $2 -gt 0 ]; then
+            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace instance \
+		    '/sys/kernel/tracing/instances/$1' does not exist"
+	    exit
+        fi
+    fi
+}
+
+function tmark {
+    echo $* > /sys/kernel/tracing/trace_marker
+}
+
+# $1 - trace instance name
+# $2 - line number
+# $3 - if > 0 then the instance is expected to be opened, otherwise
+# the instance is expected to be closed
+function check_trace_instance {
+    output=$(tail -n9 /proc/dynamic_debug/control | grep ": Opened trace instances" \
+	    | xargs -n1 | grep $1)
+    if [ "$output" != $1 ] && [ $3 -gt 0 ]; then
+        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not opened"
+        exit
+    fi
+    if [ "$output" == $1 ] && [ $3 -le 0 ]; then
+        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not closed"
+        exit
+    fi
+}
+
+function is_trace_instance_opened {
+    check_trace_instance $1 $BASH_LINENO 1
+}
+
+function is_trace_instance_closed {
+    check_trace_instance $1 $BASH_LINENO 0
+}
+
+# $1 - trace instance directory to delete
+# $2 - if > 0 then directory is expected to be deleted successfully, if <= 0 then otherwise
+function del_trace_instance_dir() {
+    exp_exit_code=1
+    [ $2 -gt 0 ] && exp_exit_code=0
+    output=$((rmdir /sys/kernel/debug/tracing/instances/$1) 2>&1)
+    exit_code=$?
+    error_msg=$(echo $output | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//')
+    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
+}
+
+function error_log_ref {
+    # to show what I got
+    : echo "# error-log-ref: $1"
+    : echo cat \$2
+}
+
+function ifrmmod {
+    lsmod | grep $1 2>&1>/dev/null || echo $1 not there
+    lsmod | grep $1 2>&1>/dev/null && rmmod $1
+}
+
+# $1 - text to search for
+function search_trace() {
+    search_trace_name 0 1 $1
+}
+
+# $1 - trace instance name, 0 for global event trace
+# $2 - line number counting from the bottom
+# $3 - text to search for
+function search_trace_name() {
+	if [ "$1" = "0" ]; then
+	    buf=$(cat /sys/kernel/debug/tracing/trace)
+	    line=$(tail -$2 /sys/kernel/debug/tracing/trace | head -1 | sed -e 's/^[[:space:]]*//')
+	else
+	    buf=$(cat /sys/kernel/debug/tracing/instances/$1/trace)
+	    line=$(tail -$2 /sys/kernel/debug/tracing/instances/$1/trace | head -1 | \
+		   sed -e 's/^[[:space:]]*//')
+	fi
+	if [ $2 = 0 ]; then
+	    # whole-buf check
+	    output=$(echo $buf | grep "$3")
+	else
+	    output=$(echo $line | grep "$3")
+	fi
+	if [ "$output" = "" ]; then
+            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO search for '$3' failed \
+		    in line '$line' or '$buf'"
+	    exit
+	fi
+	if [ $V = 1 ]; then
+	    echo -e "${MAGENTA}: search_trace_name in $1 found: \n$output \nin:${BLUE} $buf ${NC}"
+        fi
+}
+
+# $1 - error message to check
+function check_err_msg() {
+    if [ "$error_msg" != "$1" ]; then
+        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error message '$error_msg' \
+		does not match with '$1'"
+        exit
+    fi
+}
+
+function basic_tests {
+    echo -e "${GREEN}# BASIC_TESTS ${NC}"
+    ddcmd =_ # zero everything (except class'd sites)
+    check_match_ct =p 0
+    # there are several main's :-/
+    ddcmd module main file */module/main.c +p
+    check_match_ct =p 14
+    ddcmd =_
+    check_match_ct =p 0
+    # multi-cmd input, newline separated, with embedded comments
+    cat <<"EOF" > /proc/dynamic_debug/control
+      module main +mf                   # multi-query
+      module main file init/main.c +ml  # newline separated
+EOF
+    # the intersection of all those main's is hard to track/count
+    # esp when mixed with overlapping greps
+    check_match_ct =mf 21
+    check_match_ct =ml 0
+    check_match_ct =mfl 6
+    ddcmd =_
+}
+
+
+tests_list=(
+    basic_tests
+)
+
+# Run tests
+
+ifrmmod test_dynamic_debug_submod
+ifrmmod test_dynamic_debug
+
+for test in "${tests_list[@]}"
+do
+    $test
+    echo ""
+done
+echo -en "${GREEN}# Done on: "
+date
-- 
2.44.0

