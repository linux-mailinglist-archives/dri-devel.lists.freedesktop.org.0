Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F135B924A70
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1441B10E6E8;
	Tue,  2 Jul 2024 21:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCNcOtD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1223010E6D8;
 Tue,  2 Jul 2024 21:58:48 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7f6309e9f29so165188839f.0; 
 Tue, 02 Jul 2024 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957527; x=1720562327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gt92vv+l+QrwNWjlUzQRBip24zXOkaNnGwWlphVTLFQ=;
 b=lCNcOtD60z6/lffkqzbQGu2EP4n7jyaR8sVCweWiKQRsIt/hxvJTRSYwzAQo4SQ0Dv
 WwUWihlHT88PpHSnFf7ZhU/zk5wZ8cyzBqzFRRVzxdYA6z2Phf9on1g6cOL619LtpZGr
 5qXz4lwUsYOLDPliSTrlf1GXXJopZDyhVuEFR/yVIuL6F7EHYR5chValxYV8y3HyEaj2
 io7wahKLST9cc8LSfmwi8YClqgssYq479WPKGCUQtBLRwJO5B1ozZLEnxKDTqkTVhZuf
 fj2aRNhB9JYMUQ7uX2iWPpND7kzZHkcxRKfzx2DTPGvazujb+JSTqYbKRgD8uhuVvqbX
 0ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957527; x=1720562327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gt92vv+l+QrwNWjlUzQRBip24zXOkaNnGwWlphVTLFQ=;
 b=e1uRV6ZHs6s95eo6pS02jY2ZXJrT3TF5elZtJiuiW3BME+v4KuM//xoHaTXvVA6O+h
 V6lcHWU59bd6UTePBiQdQy9FpkzxedFGHw0seJJD/j9XGAPIRVYYPtJRxttHOmxmk7cH
 UoD6oVAIPScXVwUw9ID6I7caaskLGdTvc+RReZfIfYXALFno8HJm8IbXWvK0b2cvsdFU
 GVXmtL1tSbblaIFORB4BNjGwzKFSowNNig2futbBY1C5G8+aPw+wCiGUYoRyDsa/z/OR
 YDeCGXgmjJkD4suOG79hOGBo1npZdMuPAFXS/7hbPCqLYj+VnfiiyyvYkCtydYX/rZzV
 RQOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsamb5oV8SGnUetxu7ayEtXWAybUw7l9SoPFdwNuoqJs6nn6WN+oElEcj98JWag/xIVyCFFGwK7lZ2xPy26Qs52DnbmUklqAOfewusCEfktWQdaWzwDbqQ5BbLlvaBvf34k1SpPloLYuIzHNIYTeu20LtU608ujkcfBJeDplcDUV+hWvD4ezz5JNoZRcuWzLFzKTG5+M7S/9xCpp4CrpBasJ47fZN4SP3XzRDka4HRAdO0BE8=
X-Gm-Message-State: AOJu0YxhX7ylJtAAJiHt2sWA8tYM40w/4deTws+JoQY8r2cvB0Y+P58L
 JradkL8nbIuI0drffGN9T8TvAOKJCNvkOKdvVI76WIGn3lEaKwVz
X-Google-Smtp-Source: AGHT+IF3h87zduF7F4ddnH2q9ze+NFD9i3fNyFNxg/0ttCijjGWkOENGZRuQmey084nqd6Ft/oa1CQ==
X-Received: by 2002:a5e:de4c:0:b0:7f6:20dd:7117 with SMTP id
 ca18e2360f4ac-7f62ed4675fmr1103892639f.0.1719957527247; 
 Tue, 02 Jul 2024 14:58:47 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 27/52] selftests-dyndbg: check KCONFIG_CONFIG to avoid
 silly fails
Date: Tue,  2 Jul 2024 15:57:17 -0600
Message-ID: <20240702215804.2201271-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

Several tests are dependent upon config choices. Lets avoid failing
where that is noise.

The KCONFIG_CONFIG var exists to convey the config-file around.  If
the var names a file, read it and extract the relevant CONFIG items,
and use them to skip the dependent tests, thus avoiding the fails that
would follow, and the disruption to whatever CI is running these
selftests.

If the envar doesn't name a config-file, ".config" is assumed.

CONFIG_DYNAMIC_DEBUG=y:

basic-tests() and comma-terminator-tests() test for the presence of
the builtin pr_debugs in module/main.c, which I deemed stable and
therefore safe to count.  That said, the test fails if only
CONFIG_DYNAMIC_DEBUG_CORE=y is set.  It could be rewritten to test
against test-dynamic-debug.ko, but that just trades one config
dependence for another.

CONFIG_TEST_DYNAMIC_DEBUG=m

As written, test_percent_splitting() modprobes test_dynamic_debug,
enables several classes, and count them.  It could be re-written to
work for the builtin module also, but builtin test modules are not a
common or desirable build/config.

CONFIG_TEST_DYNAMIC_DEBUG=m && CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m

test_mod_submod() recaps the bug found in DRM-CI where drivers werent
enabled by drm.debug=<bits>.  It modprobes both test_dynamic_debug &
test_dynamic_debug_submod, so it depends on a loadable modules config.

It could be rewritten to work in a builtin parent config; DRM=y is
common enough to be pertinent, but testing that config also wouldn't
really test anything more fully than all-loadable modules, since they
default together.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

fixup-kconfig
---
 .../dynamic_debug/dyndbg_selftest.sh          | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index fccd2012b548..d09ef26b2308 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -11,6 +11,30 @@ CYAN="\033[0;36m"
 NC="\033[0;0m"
 error_msg=""
 
+[ -e /proc/dynamic_debug/control ] || {
+    echo -e "${RED}: this test requires CONFIG_DYNAMIC_DEBUG=y ${NC}"
+    exit 0 # nothing to test here, no good reason to fail.
+}
+
+# need info to avoid failures due to untestable configs
+
+[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=".config"
+if [ -f "$KCONFIG_CONFIG" ]; then
+    echo "# consulting KCONFIG_CONFIG: $KCONFIG_CONFIG"
+    grep -q "CONFIG_DYNAMIC_DEBUG=y" $KCONFIG_CONFIG ; LACK_DD_BUILTIN=$?
+    grep -q "CONFIG_TEST_DYNAMIC_DEBUG=m" $KCONFIG_CONFIG ; LACK_TMOD=$?
+    grep -q "CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m" $KCONFIG_CONFIG ; LACK_TMOD_SUBMOD=$?
+    if [ $V -eq 1 ]; then
+	echo LACK_DD_BUILTIN: $LACK_DD_BUILTIN
+	echo LACK_TMOD: $LACK_TMOD
+	echo LACK_TMOD_SUBMOD: $LACK_TMOD_SUBMOD
+    fi
+else
+    LACK_DD_BUILTIN=0
+    LACK_TMOD=0
+    LACK_TMOD_SUBMOD=0
+fi
+
 function vx () {
     echo $1 > /sys/module/dynamic_debug/parameters/verbose
 }
@@ -192,6 +216,10 @@ function check_err_msg() {
 
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     ddcmd =_ # zero everything (except class'd sites)
     check_match_ct =p 0
     # there are several main's :-/
@@ -214,6 +242,10 @@ EOF
 
 function comma_terminator_tests {
     echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     # try combos of spaces & commas
     check_match_ct '\[params\]' 4 -r
     ddcmd module,params,=_		# commas as spaces
@@ -226,9 +258,12 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
-    
 function test_percent_splitting {
     echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     ifrmmod test_dynamic_debug_submod
     ifrmmod test_dynamic_debug
     ddcmd =_
@@ -248,6 +283,14 @@ function test_percent_splitting {
 
 function test_mod_submod {
     echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
+    if [ $LACK_TMOD_SUBMOD -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     ifrmmod test_dynamic_debug_submod
     ifrmmod test_dynamic_debug
     ddcmd =_
-- 
2.45.2

