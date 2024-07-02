Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62D924A66
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D24210E6EE;
	Tue,  2 Jul 2024 21:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JohSz+iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CF810E6DD;
 Tue,  2 Jul 2024 21:58:42 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7eb895539e3so191276539f.2; 
 Tue, 02 Jul 2024 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957522; x=1720562322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFcSRVkNrMoAaN9TOyRvWGwNcmbCrlZN4vnmf8E27Go=;
 b=JohSz+iwUD38DJY3ee3bwH4AGn+XA7g88Ra4Y7DtP9RA3Vznl9HfN7RMbnC44zIJHm
 cb1V8Gq3ChFF77DNR4d13dYAh7mbR4otZfUkO8HJ2ayWTGXNpTj7aV5m4HwNL8WlHdsp
 PdJL0reWzoh17wbkIcqlGtsAoDa9iuSjMAiQr5h3XUr+2698mgvfCPOWLUHIkUJdPgm2
 Fx3548KfvDpNaW76/eUVxow54T4TysBRlGKbTYB6lB2OP2aYx5H1R7/GRfC0c3GQOmwK
 sjA2ckrAF73SO+J32TQ8qptLGz0nbbJKJb4PQsBeL8qfKFYN8f9pFoEm3z53D4ZEjt+G
 YfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957522; x=1720562322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFcSRVkNrMoAaN9TOyRvWGwNcmbCrlZN4vnmf8E27Go=;
 b=Wh18UOL7HztEF/TaslOFLQHVuEHvFYn9/R0UISi/jq171qAkld+N5LTBGbmF3F+Ykq
 mpVsqlMAGCB5nlGdmmKHH4X1itT5TlgZWxQg5bAm6FRl+yq1e2e6hzT4Dwp2OcOaXUVU
 oDK27pPUEv081Bkzun8kglYuXY75wlzrKTgtWyxgRJBGjYWLvk9FBgXctPt4NhjgKfWD
 KiKyPgUxynAODJvBivZe9Oh3v9yDk40AN5Nmr6MTOhyVT8fFC+xRC5fttSgZMEQz1JqC
 I5ykMkeWgR30jCDtmYqoS8DdXQRp/Q8qxO4vohCGtO051K82vIhyr1gea5Q605FXabEF
 pqVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRNanGOmrYas85OFuiDQJNwzWirPLZHneQxbaHjcMVGGYCZ+O0sC1Ft7yp2myevH76eeEigEXTf7haNS9NtCYe0yOERV3UF4KTTsELJairpkDbPCQ/hPXh5LVv/5a5dy4xYn53yMrD9xiHVUQ4CUeICuix1jzHki17QHg65FOef7J35JtAc66qWDCRravz0B0pe8PAJMEtUR3CyOl48hYS5kM7srsFbQkdLht5iAMtX0iMfQU=
X-Gm-Message-State: AOJu0Ywk2aWzfefU7yu2iy+3R1DBJte4/BntLjr6Ne4NDK9tNc4F1Zbz
 gUXcDukDu/06IkhjI6sLAyFqpOXPO25sWvCk2PLR4lvKynBaEcCseMFfMQ==
X-Google-Smtp-Source: AGHT+IF5HPTrp3Ibm1axLqWBCHtlXKaMWg0JUdhWqqnYWUpVoXtgbCh5izMMhwYMrBWm7qH5p9dPSw==
X-Received: by 2002:a05:6602:da:b0:7f6:1542:4e94 with SMTP id
 ca18e2360f4ac-7f62ee9d603mr1046263839f.20.1719957522025; 
 Tue, 02 Jul 2024 14:58:42 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 22/52] selftests-dyndbg: test_percent_splitting
Date: Tue,  2 Jul 2024 15:57:12 -0600
Message-ID: <20240702215804.2201271-23-jim.cromie@gmail.com>
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

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index b4ba293ab227..996e6fdcfb52 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -226,9 +226,30 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+    
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
2.45.2

