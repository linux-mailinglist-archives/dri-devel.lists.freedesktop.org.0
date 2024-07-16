Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23E933121
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE16810E853;
	Tue, 16 Jul 2024 19:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nNn/qiiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344210E82A;
 Tue, 16 Jul 2024 18:59:01 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-807687b6652so6221339f.0; 
 Tue, 16 Jul 2024 11:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156341; x=1721761141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUz2fuyNm0/W+cer/IlT8tdUcSLjwR0swYFnYz1+7bA=;
 b=nNn/qiiELLQ+nbG3i9pWl2ZL9wvqwelcPtaA1jbq+ApTnFWxmXlbmH+e6Csslq/ygP
 G5In60t6/TS3ubtUBqJ1+XNkkA6wLXJkzJVAxvCweBMcE7jS1QT1eGZx+DJKDYHlmLqV
 ClDbwQXXG72FYoMCiJGsHtnAWjh0Zrm5QvgJvXJbnJi+QtR6HFhTNsAATptBUUYHNJTX
 w4C8qYfDqtPMjnu2N+K4CdtYNUgW1cSxlZni23NotfQENEr7mmCeqeSEj56s4GDTJ2Da
 zn+ZKnAP2ZDTGzChQiAij/9jX3mo334/ZktLfYN8X3dlslyIgwlU04rNc/vfexInOHam
 mduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156341; x=1721761141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUz2fuyNm0/W+cer/IlT8tdUcSLjwR0swYFnYz1+7bA=;
 b=e1aFL781a74YEVt+BQvYIbsxV13UZtAJOvDCv9lLV3NcNPXUrVXb4o1CZUFmJWg4nA
 wGp/SJgo7VRQQuANHdoQcEJNNQiB6ZITGCHTl0jU3qUqfN9zlGVr/W5iM2HTckqshgre
 /0NK16B3U7IosZnZhpVEuKy1ny6vLF7zRn3ehaMWavpEwelvTJpsV680vhlxi0DwsF22
 NM3HqTKJdjGb+3dHKXZOiLt/ATLLTOvb2egKO5Iia7FeRzPsGGuaKB1qNmRYAkmb2gkU
 179quW04JuVLzMl3MU+mKFuqiQT2EcCW2NbrKrPUv0dWzferZZFJO70GLoVN+VDr5SHW
 Yj4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURoUgAFHja3X6MSpIj0Nv++HVEFvp7odyafhPpj1gMA3/gdcKtJs+/nZBZhLwfZWRloa0xzuqscEg1XIE3tFWmA4J9XqNQ/Jx9IYewL5NEAcXkUS9eKBm2kOIG/6p36Bu6lnUBaFOY0g2MV4bQ0CYAnRow1cQZO/EBB/PYTYAEBIOqfAj524gLdxSRSdc/mZf0W9PfgQ3J6gSY6nb1Ln3myfAjeo6jKzS9KpaXEu8Djq/g4ks=
X-Gm-Message-State: AOJu0YzfwNGB2RCuqp0EctWKVtcEscngUex1Kf+h6/ikiUnGOJUfOwpH
 qvZJbc4OxELa1ENakBgNoyGxq1dvTWoEY+N0/T1ipZNAQSJSVxID
X-Google-Smtp-Source: AGHT+IF4Unf7gwTLxZgnHey2dXasTlyxLHDEt1SBVRbfc0oATB2X5dpSsvnnnOAQb/XIyfd8CFvaag==
X-Received: by 2002:a05:6602:3c6:b0:7f6:1cd3:9659 with SMTP id
 ca18e2360f4ac-816c4c041ecmr47881339f.6.1721156341182; 
 Tue, 16 Jul 2024 11:59:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:00 -0700 (PDT)
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
Subject: [PATCH v9-resend 28/54] dyndbg-selftest: reduce default verbosity
Date: Tue, 16 Jul 2024 12:57:40 -0600
Message-ID: <20240716185806.1572048-29-jim.cromie@gmail.com>
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

Remove the '-v' arg from the tests in test_mod_submod().
Setting V=1 in the environment turns it back on, for all tests.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index d09ef26b2308..b3d7155cb45c 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -168,7 +168,6 @@ function error_log_ref {
 }
 
 function ifrmmod {
-    lsmod | grep $1 2>&1>/dev/null || echo $1 not there
     lsmod | grep $1 2>&1>/dev/null && rmmod $1
 }
 
@@ -316,13 +315,13 @@ function test_mod_submod {
 
     # change classes again, this time submod too
     ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
-    check_match_ct =pmf 1 -v
-    check_match_ct =plt 1 -v
-    check_match_ct =pml 1 -v
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
     #  submod changed too
-    check_match_ct =mf 1 -v
-    check_match_ct =lt 1 -v
-    check_match_ct =ml 1 -v
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
 
     # now work the classmap-params
     # fresh start, to clear all above flags (test-fn limits)
@@ -333,25 +332,25 @@ function test_mod_submod {
     echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
     echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
     # 2 mods * ( V1-3 + D2_CORE )
-    check_match_ct =p 8 -v
+    check_match_ct =p 8
     echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
     echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
     # 2 mods * ( D2_CORE, D2_DRIVER )
-    check_match_ct =p 4 -v
+    check_match_ct =p 4
     echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
     echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
     # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
-    check_match_ct =p 6 -v
+    check_match_ct =p 6
 
     # recap DRM_USE_DYNAMIC_DEBUG regression
     ifrmmod test_dynamic_debug_submod
     ifrmmod test_dynamic_debug
     # set super-mod params
     modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
-    check_match_ct =p 7 -v
+    check_match_ct =p 7
     modprobe test_dynamic_debug_submod
     # see them picked up by submod
-    check_match_ct =p 14 -v
+    check_match_ct =p 14
 }
 
 tests_list=(
-- 
2.45.2

