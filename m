Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A28B6289
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F15E10FFAB;
	Mon, 29 Apr 2024 19:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XgWhOyZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA86E10F0B9;
 Mon, 29 Apr 2024 19:39:35 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7dad81110cfso207101739f.1; 
 Mon, 29 Apr 2024 12:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419575; x=1715024375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7XDhXTeJoMWhkzTMSqQ0RhDu3HmDRaZUb49U4GCNsc=;
 b=XgWhOyZezg8NXQTZv+o2Z9Pr4dWCVoVWSvJQ4ApK8Ra6n/ULLXjUbbZEvyehYlLQak
 SOo0Ypl7/XV3jcAkuAFaG/TIMzfI/l7LODD3vynUAUPvJFibbliZunpLov+WZ3mZTgPh
 rJ8PHhuTe+QMtuGcidPm5D13MrxHO83q1c7mJeFA5GSEWs5qWQdU+BIPRwBYt8RT3LN6
 EXZw6+D0TEMcRD2hioqmhwgiMDhckBAIPaXw8tYUFv9B67O6YxEpBBNU78iK1/enf/vm
 7d8ky/nzuV5Pqdv8vSEQPrmZFdjMrUJs0CNYQKZGDFQNJ294wFG9eJ4SkZRix1KQoovG
 ZbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419575; x=1715024375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f7XDhXTeJoMWhkzTMSqQ0RhDu3HmDRaZUb49U4GCNsc=;
 b=E1iTSdSNcXW57BQx1ZkZNdRpproIuuYxVs3TJsFwUntZU3Y8mJgYd9LPsaJRis8S8x
 LGGMDKPKc7Jm0FxZ52lWg6e1RqjD6rMxPSajeNubsxJAq4PTN0WotGB2SqDJdEM9y4Lb
 pDOKCfTlljiVr0Vn0bc232BDJr23Y/qsNMKD630dMCOXs3r/77v4kWBhLDgz0Hf5lljx
 BT8ckR1FnN9dsj2qGFJ7EUtIJ6WejNrFMV2m2tndQN7ecuOD8VFayBWcR/Ib6tTlksnr
 aRJkqkCgQyZnwYDIL3SyunVIUNGPxwj4e1wl/AN4D19c/JFkeZb9B2CGZW8Z/OBHcnNb
 5HCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1f3+Jl9idoh6jMiJQUUXq1DrRq0OijbnT60+nmn0YYo4WMhxubHOWP9UQIrRVDJrFUVx31yUZc3+Md3z/Jm4ghAHvyrZB+dSPLonDi3BNwkt5o7z8QJf7kxdmYgp9kFAQqHfdcE2iiTH84oa9WxOCaKfnNcrqCsJUxlsEya/UAhrxMDw4hZy2ZLpaHFinqGVU+VcAijKzC4HPIA52y4TKEJ2X10cEhkfNCUbIL5K+J630/lo=
X-Gm-Message-State: AOJu0YzHltSqBvAtdqVJNCkqdlmjtaOGEyMCNHpFWvKslPK32wI2q9hb
 xv6K/xG+M+Ys24v2b61sx7liOnr/4hXSSR8E/s2Y/k20sM2psZuT
X-Google-Smtp-Source: AGHT+IHJ/J5CefPQItxbTqpcVctn5XpjkZ7VwJHP2udddod5gEHQAu9X47g8K13Y1gCMh2a+kWL2bg==
X-Received: by 2002:a5e:d717:0:b0:7de:da98:4d10 with SMTP id
 v23-20020a5ed717000000b007deda984d10mr998566iom.17.1714419575074; 
 Mon, 29 Apr 2024 12:39:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:33 -0700 (PDT)
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
Subject: [PATCH v8 26/35] selftests-dyndbg: add test_mod_submod
Date: Mon, 29 Apr 2024 13:39:12 -0600
Message-ID: <20240429193921.66648-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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
 .../dynamic_debug/dyndbg_selftest.sh          | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index ddb04c0a7fd2..54acee58cb4e 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -250,10 +250,70 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
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
2.44.0

