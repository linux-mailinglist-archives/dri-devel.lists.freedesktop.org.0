Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380328B6284
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE0110FFA2;
	Mon, 29 Apr 2024 19:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ka80K7hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40BE10E479;
 Mon, 29 Apr 2024 19:39:32 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7ded607b62bso26393939f.0; 
 Mon, 29 Apr 2024 12:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419572; x=1715024372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vg38OZx3YLIwABtnQGkinhhYjsiQa4opg6MoojqE7Ag=;
 b=Ka80K7hr2YoRhvOBu1iZn93MW1I0fcho/LGVnkLjwueIaJrOqldo5TR7sgfbCjbMSE
 I4Y1sA3uwwIQrSrb1CApadxVYpJhPkQvM6W1Tum6WCLtbFAgrDM4CL98jB+4dBphpaVT
 qi7QVKVVx3Dfu7aeetg+HPsafXlfCCgJkZN6PUXf6g6bKYjnG06DtGNfGCZ5vsaoL5N8
 y2oJ2bjAPY4m3nQGPkFruDKltPqKNs7slEF2lSzNWXj9mvgeYPP7yPa7KxcjgwHYrD1X
 YxCx9e2qrkWK2NrfFRzkHKIFofarF491UNmatpDLtN285qa8nwypyNTahTyuClhxi6RI
 xURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419572; x=1715024372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vg38OZx3YLIwABtnQGkinhhYjsiQa4opg6MoojqE7Ag=;
 b=xIvOmeDlIFba68kbwezU6rnnlJu1J6f96DJ005ikw2prUsDmamSgZnDV+enWFrHtP+
 dC9TO5NUyCB3IqIw2Ia8wJKjkRq8ODbRFZH3uduIIed1h0t99jshcpEVl8o3aR52sheQ
 h/0lUVLdr1vJZcXx8EjtAu7S+aanFM1FXWB6qs5NKfizNZCzHMQGw7YgW2/PhIThxIMs
 hZmXwngTCK18rx2ufUc96wLPDFzqiuZooFxFTQIqwKEPhD18yBH4n2cSNEqgQ6EV7taM
 BIlOfrs4TOthuqZOP96QatOcy+6Izy6vi22L3YGb7GVW5Qp8HtQ1t0J2huaK9TWmFAtJ
 fFWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvz1+Dn/YMNbDJpUUcP6vLY8nJSeUQLfO+dJvvxKiflDaelgFjGx+hUaqo6pZxljBPBvvg1Uid0c+n2BJEWewxJnDiMTZZ1/yuC3pxOnZWCMF66AxNe8tjRpuK805Mb5NINQnxU9jN0JqvhJ9FoMLq6iRCbIHRApvZZQunMcnTNANhdGkjmOjWASfPjKSO28wACH3nCIgYCVxzI/+Mw1Qi7QjvccJ7L4r4Gv+P2XJa6KjUyY8=
X-Gm-Message-State: AOJu0Yx5lurAyAqK7zptMbo2hG+GMP/k0MeK9HBdonTYKzAis+8icxUh
 Wj6qDW0cIl2Xh/PQMjZWjERa8NZ75zGDJYPsKgekTZpdKQMi9IPD
X-Google-Smtp-Source: AGHT+IFXbmxQz+e05jyizma4wMrqd8m0n5WRNSC7YJxpdev35A3a5dS216xqpdnTF1y2LwkPes/sYQ==
X-Received: by 2002:a6b:cf14:0:b0:7de:cb34:98ad with SMTP id
 o20-20020a6bcf14000000b007decb3498admr583501ioa.1.1714419572068; 
 Mon, 29 Apr 2024 12:39:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:31 -0700 (PDT)
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
Subject: [PATCH v8 24/35] selftests-dyndbg: test_percent_splitting multi-cmds
 on module classes
Date: Mon, 29 Apr 2024 13:39:10 -0600
Message-ID: <20240429193921.66648-5-jim.cromie@gmail.com>
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

New fn tests multi-queries composed with % splitters.  It uses both
test_dynamic_debug and test_dynamic_debug_submod, and manipulates
several classes at once.  So despite the syntactic-oriented name, it
also tests classmaps.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 7a7d437e948b..ddb04c0a7fd2 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -231,9 +231,29 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.44.0

