Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB88A4DAD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF20D10E311;
	Mon, 15 Apr 2024 11:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dxsNNE8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3984610E311
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:27:35 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-516cbf3fd3dso3850520e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713180453; x=1713785253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9RrWZvmlXurdeISwKYW5FWnmUFYNQimN/t786ma8dqg=;
 b=dxsNNE8GyRYAJ2Ya8HRehjXfGQpdAHTf7cmwqFR64/+cR5493pkwwZyzb7MLdJtLl9
 klKXyna5bvmutN0dCumR2fr7t4IotNsieLrALgDwtRT61EpezaJ9goxBZXUAUUQ2Unwr
 /I81c7vQfDfaPKFu5zvoJhAlFqTmixOndYaVru9iOgYl/ygnUsJ6UGDZB9ylAw83PA4q
 aQF4M+KVnAhsFlwa96712u+chTLZDO6ZcZrv4VUZ5LiMoWjS5JYUohvMhrSUBTe70WeW
 UoPbsLojvT5Yle/5D730oPre2XKCkmuRnRX3frrAg7HDQhGkPIZelCnP6GVM1o/LH8lZ
 fCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713180453; x=1713785253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9RrWZvmlXurdeISwKYW5FWnmUFYNQimN/t786ma8dqg=;
 b=ExWdgMBWWE241RsGEGuPyw9QsJYcpAX36JWP95COJGvMFuaEkw5bV0OfAsK0K/MVrQ
 eefXc1qcbWDZQjXwY/skYYMC/AB91QAazvPAy4U32f3Ix7Jj/KAZTVbcutk/sDH1EWzr
 uqsmBnAL9mYc11+F/ReyqQ5leyD5kLIVGLtaugWnTcKptUM4dxLKfQWKTQDK6RKLuu6q
 MxgCT6p8Jpq2fJSwMCWgwPZH+3oQhpCMamd2EiKQLS/xVpuIEYvWsbHX3SKN0aykSWUi
 qpnkBN2kIeHfF+z2T7qUVxoNy0Gs6F653wtw/0jsxodk4wORWecIYXaMIeTe0SEtI20K
 HoQg==
X-Gm-Message-State: AOJu0YwNbTHBk6qqeA7ksx3JXSNSC9i4ikCkbLLBn+hwXVudoM9mjk4f
 QROXDgPQzlqVb3FWccs1fegOCZRpsuRNDTNLi1t/uRMdM2/zSE4Q84wuDg==
X-Google-Smtp-Source: AGHT+IHZ5lbUauiyKf19fgR8Hj283fF5zaQM9epZb1BRX2e5evyvlg3iUwgXXdOf/+ZmZdT4ENmzmw==
X-Received: by 2002:a05:6512:6cb:b0:518:d64c:73ae with SMTP id
 u11-20020a05651206cb00b00518d64c73aemr3098495lff.49.1713180452953; 
 Mon, 15 Apr 2024 04:27:32 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 s7-20020a056512214700b00516d58590e1sm1228100lfr.250.2024.04.15.04.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 04:27:32 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Enrico Bartky <enrico.bartky@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gma500: Remove lid code
Date: Mon, 15 Apr 2024 13:27:31 +0200
Message-ID: <20240415112731.31841-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.44.0
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

Due to a change in the order of initialization, the lid timer got
started before proper setup was made. This resulted in a crash during
boot.

The lid switch is handled by gma500 through a timer that periodically
polls the opregion for changes. These types of ACPI events shouldn't be
handled by the graphics driver so let's get rid of the lid code.  This
fixes the crash during boot.

Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev emulation")
Cc: Enrico Bartky <enrico.bartky@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/Makefile     |  1 -
 drivers/gpu/drm/gma500/psb_device.c |  5 +-
 drivers/gpu/drm/gma500/psb_drv.h    |  9 ----
 drivers/gpu/drm/gma500/psb_lid.c    | 80 -----------------------------
 4 files changed, 1 insertion(+), 94 deletions(-)
 delete mode 100644 drivers/gpu/drm/gma500/psb_lid.c

diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index 4f302cd5e1a6..58fed80c7392 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -34,7 +34,6 @@ gma500_gfx-y += \
 	  psb_intel_lvds.o \
 	  psb_intel_modes.o \
 	  psb_intel_sdvo.o \
-	  psb_lid.o \
 	  psb_irq.o
 
 gma500_gfx-$(CONFIG_ACPI) +=  opregion.o
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index dcfcd7b89d4a..6dece8f0e380 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -73,8 +73,7 @@ static int psb_backlight_setup(struct drm_device *dev)
 	}
 
 	psb_intel_lvds_set_brightness(dev, PSB_MAX_BRIGHTNESS);
-	/* This must occur after the backlight is properly initialised */
-	psb_lid_timer_init(dev_priv);
+
 	return 0;
 }
 
@@ -259,8 +258,6 @@ static int psb_chip_setup(struct drm_device *dev)
 
 static void psb_chip_teardown(struct drm_device *dev)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	psb_lid_timer_takedown(dev_priv);
 	gma_intel_teardown_gmbus(dev);
 }
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index c5edfa4aa4cc..83c17689c454 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -162,7 +162,6 @@
 #define PSB_NUM_VBLANKS 2
 
 #define PSB_WATCHDOG_DELAY (HZ * 2)
-#define PSB_LID_DELAY (HZ / 10)
 
 #define PSB_MAX_BRIGHTNESS		100
 
@@ -491,11 +490,7 @@ struct drm_psb_private {
 	/* Hotplug handling */
 	struct work_struct hotplug_work;
 
-	/* LID-Switch */
-	spinlock_t lid_lock;
-	struct timer_list lid_timer;
 	struct psb_intel_opregion opregion;
-	u32 lid_last_state;
 
 	/* Watchdog */
 	uint32_t apm_reg;
@@ -591,10 +586,6 @@ struct psb_ops {
 	int i2c_bus;		/* I2C bus identifier for Moorestown */
 };
 
-/* psb_lid.c */
-extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
-extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
-
 /* modesetting */
 extern void psb_modeset_init(struct drm_device *dev);
 extern void psb_modeset_cleanup(struct drm_device *dev);
diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/gma500/psb_lid.c
deleted file mode 100644
index 58a7fe392636..000000000000
--- a/drivers/gpu/drm/gma500/psb_lid.c
+++ /dev/null
@@ -1,80 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/**************************************************************************
- * Copyright (c) 2007, Intel Corporation.
- *
- * Authors: Thomas Hellstrom <thomas-at-tungstengraphics-dot-com>
- **************************************************************************/
-
-#include <linux/spinlock.h>
-
-#include "psb_drv.h"
-#include "psb_intel_reg.h"
-#include "psb_reg.h"
-
-static void psb_lid_timer_func(struct timer_list *t)
-{
-	struct drm_psb_private *dev_priv = from_timer(dev_priv, t, lid_timer);
-	struct drm_device *dev = (struct drm_device *)&dev_priv->dev;
-	struct timer_list *lid_timer = &dev_priv->lid_timer;
-	unsigned long irq_flags;
-	u32 __iomem *lid_state = dev_priv->opregion.lid_state;
-	u32 pp_status;
-
-	if (readl(lid_state) == dev_priv->lid_last_state)
-		goto lid_timer_schedule;
-
-	if ((readl(lid_state)) & 0x01) {
-		/*lid state is open*/
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) | POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while ((pp_status & PP_ON) == 0 &&
-			 (pp_status & PP_SEQUENCE_MASK) != 0);
-
-		if (REG_READ(PP_STATUS) & PP_ON) {
-			/*FIXME: should be backlight level before*/
-			psb_intel_lvds_set_brightness(dev, 100);
-		} else {
-			DRM_DEBUG("LVDS panel never powered up");
-			return;
-		}
-	} else {
-		psb_intel_lvds_set_brightness(dev, 0);
-
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) & ~POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while ((pp_status & PP_ON) == 0);
-	}
-	dev_priv->lid_last_state =  readl(lid_state);
-
-lid_timer_schedule:
-	spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
-	if (!timer_pending(lid_timer)) {
-		lid_timer->expires = jiffies + PSB_LID_DELAY;
-		add_timer(lid_timer);
-	}
-	spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
-}
-
-void psb_lid_timer_init(struct drm_psb_private *dev_priv)
-{
-	struct timer_list *lid_timer = &dev_priv->lid_timer;
-	unsigned long irq_flags;
-
-	spin_lock_init(&dev_priv->lid_lock);
-	spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
-
-	timer_setup(lid_timer, psb_lid_timer_func, 0);
-
-	lid_timer->expires = jiffies + PSB_LID_DELAY;
-
-	add_timer(lid_timer);
-	spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
-}
-
-void psb_lid_timer_takedown(struct drm_psb_private *dev_priv)
-{
-	del_timer_sync(&dev_priv->lid_timer);
-}
-
-- 
2.44.0

