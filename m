Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374576C112
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E4E10E46E;
	Tue,  1 Aug 2023 23:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1522B10E463
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:45 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-790cadee81bso30435039f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932944; x=1691537744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqTzNELHRtLIMmnQe4IjBi2Pg9cHOtSAwPPFPZ1pbxQ=;
 b=XKRSVjtkGlHX2/DQX3kzzuA8uZ6KdBySMTZetRfAswPQbuwSWIpMFFWuBJFHkqssQV
 vZtaaW9hlAVowtZaRgEUnbV6CXPVCn7Lp2gCz9gMIJfuAN2fWsF8WSq+0DHd2eZRjtNG
 74tgmgx8EZl5V0i3GuZZ3A5Y0WkszHBeFQUqWqRx8gCD61s4Vo8WZzUzYyFqo1c7n8g5
 mAuRUE2VHsRUs/f7bTyC9hiKqz7FW99Jn5Y8/FZfHdHzH0vn3tMJwYWBLqV6DzbiuX4p
 2Z78iifiHSerP9RYw6Sa4C9rvsbTDRhbtAXGvw0iPxPnWn+W7LGsfwK2xCJNDh/0GWTS
 NY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932944; x=1691537744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqTzNELHRtLIMmnQe4IjBi2Pg9cHOtSAwPPFPZ1pbxQ=;
 b=j+0e8n19dp1eCMT3rJBTfhrNuyT/SVBUKb11RGeuTKdD9VxQZtRBCO00ZI4GocmMQI
 HPgSfoPX88Hb/dluDvJS8EFf1tK/0G9DcaXNFunEXKOWCbXbE4rTLm8fLsY6D3FtJHkM
 HvbK6TRV9QRtH5KEbEXBqV+efUxc4uVviTfY/j97uto7kDE5dMCQQKclFUt5iw+sLtye
 +G3JjXzwULRZ+E8uh/YRgrzBn8Td2z6Kwf3PiBbrbgDUHihdqx+LMd8i2rcRz68I2gPk
 rTfK2tI5V4EgErFNYKNkFQl8gEtaXPL4PbCXNNrYa7KPF7t0sUmb5qqRrYLA/9NCDhYe
 n33g==
X-Gm-Message-State: ABy/qLaXbcXKjRTgVOR7181zwnjixMxvtaKaHrDk6vI1wEXZ6DpwPz26
 dtYhgY3AE5qhWhbdJDbXNQA=
X-Google-Smtp-Source: APBJJlEFwb6HndIwTHtisZHLhXxRnyyA43uhdcB/Aynnm/D/qI5WROYkoG7hk0iZYbZ10v1+wWCQYg==
X-Received: by 2002:a92:c26d:0:b0:345:8373:bf68 with SMTP id
 h13-20020a92c26d000000b003458373bf68mr13558429ild.25.1690932944291; 
 Tue, 01 Aug 2023 16:35:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 18/22] dyndbg-test: build it with just
 CONFIG_DYNAMIC_DEBUG_CORE
Date: Tue,  1 Aug 2023 17:35:05 -0600
Message-ID: <20230801233515.166971-20-jim.cromie@gmail.com>
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

