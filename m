Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03179AC65
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24E010E383;
	Mon, 11 Sep 2023 23:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A346C10E375;
 Mon, 11 Sep 2023 23:09:02 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-792965813e7so188158439f.2; 
 Mon, 11 Sep 2023 16:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473742; x=1695078542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXZWG/nA8iNczDldd6SjpWfFw/ABPHN8JU5LNr6qz3s=;
 b=c0eT2OJ43DQFaCrxkCALrvZDnjGXbLlN84L6M1ttbiFNgF75q8zdNNc2MDh32JL052
 tB9UDKEP782MN6sOFYpJb9DFZ6R6T1PQQyuBkb6bN8RD+xhttncAYeo1Ombm0sKOnBjX
 E7LaStdwwXQC/ajjb2AcF1GdkFVYuBIY2TK+QQi650Ko/u+O0G3NYfwn1nNJ682Cpa0F
 Gd5sR2FGLE4w+aDNSTSxnxTwaBRdG3BcqLF02FRNwG6lPhfQrK+9C7fsGEusW9TeStze
 TYautONgqmv60ompxNRhWG5mlKQqRmB+rnZI5Mv7ssA3t0Q61iPOARydi/9oxZv9OsKu
 G2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473742; x=1695078542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXZWG/nA8iNczDldd6SjpWfFw/ABPHN8JU5LNr6qz3s=;
 b=TWg/6tGM/BHNZ8+QO0k/aCLs1isuITveuiUhTk4XoURHGggqWijBNtcqoBrQJF4kVT
 k6ZY7d4VNRZ/osDaucAeTKO2lSSUTCTwmzwFqSUrICbpD85oMwWaS9VcTTA5kNmQf/xW
 45/T5Jw/Vx8mlL9aUTCN8Np04+6UGy6v7QcAx79tppK/f9Zc45sqzqzUAPBfSrtuVcoi
 93WeUIXdLr1Nsajw+whA9GDYgxyGWMCkZ/2nLzKqzjY0zaVAhnBXvEOrgGgB2fej278D
 ZHkty1+AhcKKF4jo/Q3TAhkBL2l6fMaVO0L9l7ROlfiHYDeLNBKPXKgGevDxf0JJuvAC
 uRKg==
X-Gm-Message-State: AOJu0YzXtOH42FxQ7T623aYBluOSIKLpYMgqbjgtMXQ1S1s3fW05IfbE
 mTCxvybqHZQZ5BjdZFmIRIMh8Xgd5g2PBQ==
X-Google-Smtp-Source: AGHT+IGY+Y9DO+vyrjnMRL7HVOugzwFjUd7HmRNBSMbrU8a8Upu6hXUK9+5a2CqGJ5tFV3wuipMVBQ==
X-Received: by 2002:a05:6602:388c:b0:798:2665:8939 with SMTP id
 br12-20020a056602388c00b0079826658939mr5726278iob.20.1694473741943; 
 Mon, 11 Sep 2023 16:09:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 16/22] dyndbg-test: build it with just
 CONFIG_DYNAMIC_DEBUG_CORE
Date: Mon, 11 Sep 2023 17:08:32 -0600
Message-ID: <20230911230838.14461-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the test-module buildable with just CONFIG_DYNAMIC_DEBUG_CORE;
add CFLAGS_$ofile defns to supply -DDYNAMIC_DEBUG_MODULE to cc.
Change the Kconfig entry to allow building with just _CORE, and fix
the help text.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/Kconfig.debug | 10 +++++-----
 lib/Makefile      |  2 ++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d6798513a8c2..a40bc9ab689a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2794,12 +2794,12 @@ config TEST_STATIC_KEYS
 	  If unsure, say N.
 
 config TEST_DYNAMIC_DEBUG
-	tristate "Test DYNAMIC_DEBUG"
-	depends on DYNAMIC_DEBUG
+	tristate "Build test-dynamic-debug module"
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	help
-	  This module registers a tracer callback to count enabled
-	  pr_debugs in a 'do_debugging' function, then alters their
-	  enablements, calls the function, and compares counts.
+	  This module works/demo's the dyndbg's classmap API, by
+	  creating 2 classes: a DISJOINT classmap (like DRM.debug)
+	  and a LEVELS/VERBOSE classmap (like verbose2 > verbose1).
 
 	  If unsure, say N.
 
diff --git a/lib/Makefile b/lib/Makefile
index 31195c75f5a0..943492d94771 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -239,6 +239,8 @@ obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
 CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
-- 
2.41.0

