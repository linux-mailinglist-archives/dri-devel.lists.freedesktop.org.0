Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADD99330F4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B577E10E847;
	Tue, 16 Jul 2024 18:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KKfBXGtW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284310E832;
 Tue, 16 Jul 2024 18:58:56 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-8076cee8088so5538039f.0; 
 Tue, 16 Jul 2024 11:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156336; x=1721761136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJdYoevwZB2aGfv474+weXhid0sQKo8sv3F+UqQdL9E=;
 b=KKfBXGtWBDn0mrrBIcxaIMsr4p67Fhm/rcVJpAi5UckuJfoAgkbpwiJZA8LgkxNMEG
 dh7qgiAiY2eoWNn3EgRZw/zHl1HUbN41pKApQHFjroHbaOdzdeRKPEUbrADhY2thRHXu
 6ZY6JN8CApQOxDJe+Fuja9zSJsSz+pBrkih7Gi1egDyv/NXBs7gh6BuwdORRKmCliWaY
 K8fPYnWR4vWPMb04tHE0cY5CWf5MlQWd1+xLg/txJAZzYL/B5lD9n+huDtPEjZwS5uUw
 MsjECtivRj6D8drweHhama/pZVznr/4GJacUhSAULa2vXNa+CL8nXl3BMFj2sSVmESl/
 ta5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156336; x=1721761136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJdYoevwZB2aGfv474+weXhid0sQKo8sv3F+UqQdL9E=;
 b=ACJ456X2Wd5eizqH5Sz71Iqx3H94UdR/3SgRVu4mZ0S+vzozaH1B1TxGE0C/X8BfYN
 PR5I+A+hekca3npLtE17JXEWI2Ia5vxtmN4HdgLxbq+RINY82Ed+aDpu/FRh9VQV7H+v
 yUZj8Vx93KR4taIuCPfzmNv4YcVAZnTVT5EgUP7mBvSbyN36eZQo9u5MshY6bmxRmJzW
 +0cbLIH8MYV+OKBXnctcybTjFL6AcOErnZHSTHaUtVO0Bj84aadFbteFn3OVF/EOkwIo
 jKEU+vz5mqlAAvJN4imURJu/Kne4ylYtCw16lfuh3SCoFM0YcKolRkYPClIqcxf1OPV9
 vHkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDy+IqUDvgmVXb+zZHCa5C0taz+9utFVy0ClxzatnD83hem2MbkophxMZUhPOy4dIibf8saqWHFCJprNLo5EjvXTelr/+7st7Bopv18P4EdsImFVQnuchSIAAAJbvk83qK5TZYf6TLFrEaCQ5iHxBmPuI7rqYBqCgYTKW9FjR9mq9CTyJ4a4vPf4LFwBUJvv4xicBhFL7V1jbwn14bMH1omXEThly52egwvZmByYB3RsnErZs=
X-Gm-Message-State: AOJu0YxR8VFI2gtS065bXTg1hlT0fRf52MYHJSsFTmtcfj4jsSaIWTGB
 vLZh4l4epiQzmZzxIQPb8n7eI2gFXXz9xInuOKhs2QY/ElcXr/Df
X-Google-Smtp-Source: AGHT+IEznmXe0kK0CoynYcYtF+WgxWhQ96VOhaEo0TmnyPyzHHCMylbYsvdKD2W05mtvEUB7RgFdSA==
X-Received: by 2002:a05:6602:2b91:b0:807:82c2:5247 with SMTP id
 ca18e2360f4ac-816c34e59b4mr35528239f.6.1721156335827; 
 Tue, 16 Jul 2024 11:58:55 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 24/54] selftests-dyndbg: add test_mod_submod
Date: Tue, 16 Jul 2024 12:57:36 -0600
Message-ID: <20240716185806.1572048-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 996e6fdcfb52..fccd2012b548 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -246,10 +246,77 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1 -v
+    check_match_ct =plt 1 -v
+    check_match_ct =pml 1 -v
+    #  submod changed too
+    check_match_ct =mf 1 -v
+    check_match_ct =lt 1 -v
+    check_match_ct =ml 1 -v
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8 -v
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4 -v
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6 -v
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7 -v
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14 -v
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.45.2

