Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DB76C118
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7151D10E471;
	Tue,  1 Aug 2023 23:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE0710E46D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:47 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3490ebe5286so13507985ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932947; x=1691537747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqTzNELHRtLIMmnQe4IjBi2Pg9cHOtSAwPPFPZ1pbxQ=;
 b=IqKZrZw2xTT0+Ay/BxJW/kbIoKcf0h0Z8mlGMC2l7Z4pfF0w1EtKETlAB6LnedbNJ2
 lKDDCOBiBokmnLoS8OtQtYxSi/E4BPTgv5ZPpaSbpkBVZroSqHbjNL76cLasVsfXsYtK
 6hdHyLmtmC29nanr9c94xBt5JtVrE+D7wOfezEIFQar3uVOFsSgNxAhlAVcFTxkhIW+i
 Mgo71CnkqERgL4k3UFb3eTq+tNEze6F23oYaIRZtXXEW6199xnf4TBzzbdbHU6yBZ+p7
 Aj3Bj5V1hxdz4sAjo01Q3FijWynOQp/XiK+zQ9OLrVMZ1hVRXzHWCxB8051K/JQyn4p9
 dv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932947; x=1691537747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqTzNELHRtLIMmnQe4IjBi2Pg9cHOtSAwPPFPZ1pbxQ=;
 b=CDveXMuV4lyYml+SsPUrZCDMffcoVdy5TBCcJeJlfk/XIsC9TsSNKyRWMPvhMuqjPR
 hmJ0GARwTUvGYDayp2W2iVac8k8n5OquTVcUodfeBDGcergaFYXkKN8hviXkQRBlrflC
 PokH62EQRjztXsRIjufaBkpSlCuX/JzkVNYjyl9ZoHhSSOQcr6Lh32Yn6qJ2eSCo9YLS
 1updnnsTIDznqtcGKMwa5BRfcymqzpWIjqA2jxh9mn1UrfzTCNORLa9vB84laqWjZE/u
 paLmOFhMrMLAJ9fFpUiUg0rW2riu5F21+bh/5hhclKhY/fQPCI24RrlkRwXvsv65kadv
 NhNA==
X-Gm-Message-State: ABy/qLbcpogJo7hEMrA78rSIeYSoylGCcNE+GWtZE/u3VG+7q3KS5ffu
 F4WJLG7kJjTzYDuNgHAM9cOyvrdwMGyRVQ==
X-Google-Smtp-Source: APBJJlEEwhxO4SP3yKr4OHVEEGRyFgEtBtUqvKFVJ2J7z78Fw8tppHmer7AAb1QwBCbd9CvA9JIztA==
X-Received: by 2002:a05:6e02:1c25:b0:349:2d1d:e463 with SMTP id
 m5-20020a056e021c2500b003492d1de463mr5954953ilh.13.1690932947069; 
 Tue, 01 Aug 2023 16:35:47 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 19/23] dyndbg-test: build it with just
 CONFIG_DYNAMIC_DEBUG_CORE
Date: Tue,  1 Aug 2023 17:35:08 -0600
Message-ID: <20230801233515.166971-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

Make the test-module buildable with CONFIG_DYNAMIC_DEBUG_CORE; add
CFLAGS_$ofile defns to supply -DDYNAMIC_DEBUG_MODULE to cc.  Change
the Kconfig entry to allow building with just _CORE, and fix the help
text.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/Kconfig.debug | 10 +++++-----
 lib/Makefile      |  2 ++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ce51d4dc6803..22e022ceb9a1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2695,12 +2695,12 @@ config TEST_STATIC_KEYS
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
index f36048371dd2..8411015a57c1 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -233,6 +233,8 @@ obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
 CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
-- 
2.41.0

