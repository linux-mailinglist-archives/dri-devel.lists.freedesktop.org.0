Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD9924A6D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B534310E6D0;
	Tue,  2 Jul 2024 21:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggNXmQrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB12210E6E7;
 Tue,  2 Jul 2024 21:58:44 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7f3d59ff826so173097939f.3; 
 Tue, 02 Jul 2024 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957524; x=1720562324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJdYoevwZB2aGfv474+weXhid0sQKo8sv3F+UqQdL9E=;
 b=ggNXmQrn2ll5FPQv8EHN9AtEEGZ16oNHj6yJtHot0eOkakJGElv84NaonGDisCK68o
 HUnl4aa1A6Lwn94/tNn+LnZ5Kxntk+0czFMnR5uEtjT66IRlfJMtmlKh1LCixao7qEDi
 StS3HzYHOz7g+b5rjjMqbIPjGBMd1lwIFvM6MuMG5J45KCB5BwqMaJS+NYYUfbdoZBqj
 KqBLyNI5qPBnjjyzkE4S1ZQS+tXQim0nVtfy4Z/U70NDYZIKF14++vKvZMjCATHQzpom
 dZkKiXZ/uct/ZgfzjYEMAFUvBEbJDrG/UXMUZzskvgsXgjxri+auYanYdYaFUO9PMJXk
 yaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957524; x=1720562324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJdYoevwZB2aGfv474+weXhid0sQKo8sv3F+UqQdL9E=;
 b=bho90CBEWGMn8fJY9UJUB9KRr3CM+6tcPgAZ1WmapESYLIhqezClGFuWeMlpEI/h69
 Tg+5FS7bZn2J/28uQZ7SEoCIkpCjDUsHXw8g48CoMOePGDamsZQtfnupbVsG1AmeXh9r
 9Ypf/OQkPWx30JTsMLko1dpQ3B9icKq2/mjqNqqF4xIksq2nq8zGi6j7Kg6hVzp5Q6Rt
 AVlbTut9IrzaZrMniwfyQZjcAnTzLgYaWVC0Kqok3A4XMM6xDmL4x9/73O35Oh/uoBrU
 BNq9Fpeq/oW7qhv7OeEnIN/AgYP+N9l5vf/+VeLa/xT5Z7gcmAYzxEWQk4naWK49p2b9
 hBdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlc6bKPGVlQ8tH7EJE2GBZ1QEWbhZTnQCG7flTbnVw1XOWea16SZ5WuVMJMvCfYzJzo8a4JWrjHQTVjMk5qStFwfQuhUOYc+KafCneg1EPL0xVhDNGtNLllGHxJQKmHQhd2kKzIXS0BbgFnp+TDePfJ2fcJJGazpes/POeIOdFUQdIQfURwc8d440by815LmrjQ1WfpqQKY8IF9mjrgs2ZBB1BeXlgyGyY1InQRU+UTnrMS84=
X-Gm-Message-State: AOJu0Yw+4nZ29DYoE6RrSCMIv39OGvVnd7Rv6w5JXeq+Boi+AOwpsaVr
 R512UaDJS8NEPd8uytB0uAMAzc/5g014dJk/uRGlsipyP57GAYVR
X-Google-Smtp-Source: AGHT+IEgboiDOACnMDW/LW0FiCtZfq/bakC9SgKt/T+YKx18pvft97POgcA+NAVH1NrTKBqUsmzF2g==
X-Received: by 2002:a5e:d606:0:b0:7eb:d640:274 with SMTP id
 ca18e2360f4ac-7f62ee622b1mr1057775039f.10.1719957524024; 
 Tue, 02 Jul 2024 14:58:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 24/52] selftests-dyndbg: add test_mod_submod
Date: Tue,  2 Jul 2024 15:57:14 -0600
Message-ID: <20240702215804.2201271-25-jim.cromie@gmail.com>
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

