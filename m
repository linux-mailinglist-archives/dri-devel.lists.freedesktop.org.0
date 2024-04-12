Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983368A27E4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 09:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C916110E0E3;
	Fri, 12 Apr 2024 07:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jJ+r1WDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBA410E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 07:24:13 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso464479e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712906651; x=1713511451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8pYbcULmApkeibT6ZmZHKb3pgiYUDHo2CRg/7dnEbO8=;
 b=jJ+r1WDgPQCHuqDIXstM7ezgQrm6CkH3CvS2BxhzatKPKXm1vq/9v74Jydoe0LFtF0
 XpwCk+rB6ePrEoDdvQG0slbKKoouNzD/CV8M7HQNwPGk2O18pb6VOwwP6ggseOnD8+lv
 /GFBB1QCwAO1O7tV5Km4TxbCIDxfs92kJagVBPWLpsMrGgvyWAeUNpAc4krz1k22lZCy
 AdcbWqSQztcw8qqNJ59QWMYpDNest1+iLBaX8FwYU8iWy0a3sxPjJHRHtiW78L9nL3Tv
 6Ur0QC2cAa0M580sq7L4p08ndB9Wtl95SKgLZ3bBsjSKsUwZgffwFGmqOMnWQD7bnk/f
 otkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712906651; x=1713511451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pYbcULmApkeibT6ZmZHKb3pgiYUDHo2CRg/7dnEbO8=;
 b=Y8bpsGakO/gxJGGkhhMJNiMhePFB+RoGnPXpwYgu4IjZ8EPREUra8z93mn+YAA3KGD
 4kEaBYXYUJHSyk1PDB8SZOF7lRVjSPrVg27v55lrA3Ro0Xbf1xRIVKDAkMkExU2dzvpM
 PgmYUT0uXPXCkaTTiCurKAPUUSxSXBJpYrMHvptBUyvtpZG+BoG+2UDpE0F63Zdm5rKf
 DFK/S4FCm0/neA+r2wzQmvLZeDQTSgmy9inU+Nz8R+qfoFyA1bKJhwX95TccXLwiUytb
 wCiKLKvF/x/d9UePRq/De7WIVflB8xL3bGeiGiTypDIsXKtw8M1w+xuaNTFUpnw6awWV
 D7AA==
X-Gm-Message-State: AOJu0Yw9NcQ+CCpQy896Alo1j1MR/9l+klkQij1oDNOAdh0Z6lN8+PjD
 NEd0D486mVusb+EQdgavNsTAz0XPLiwlnZa4ax/3AYdYbl/GYNMrC4Tw7w==
X-Google-Smtp-Source: AGHT+IHL9BzTyddZP7s7jbhu8DNG/fbmdA6rfsPa6wDzqRoG4jx768QryTVmwWBCp9glKJQ5h4Sa1g==
X-Received: by 2002:a05:6512:3f1f:b0:518:930d:17c7 with SMTP id
 y31-20020a0565123f1f00b00518930d17c7mr33358lfa.29.1712906651094; 
 Fri, 12 Apr 2024 00:24:11 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2ea490000000b002d6c88b9addsm439450lji.50.2024.04.12.00.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 00:24:10 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Enrico Bartky <enrico.bartky@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gma500: Check power status before accessing lid data in
 opregion
Date: Fri, 12 Apr 2024 09:24:09 +0200
Message-ID: <20240412072409.27650-1-patrik.r.jakobsson@gmail.com>
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

Due to changes in the order of initialization the psb_lid_timer_func
could get called without the device being powered. Fix this by checking
the power status before accessing the opregion.

Cc: Enrico Bartky <enrico.bartky@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/psb_lid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/gma500/psb_lid.c
index 58a7fe392636..eeb91d11336e 100644
--- a/drivers/gpu/drm/gma500/psb_lid.c
+++ b/drivers/gpu/drm/gma500/psb_lid.c
@@ -10,6 +10,7 @@
 #include "psb_drv.h"
 #include "psb_intel_reg.h"
 #include "psb_reg.h"
+#include "power.h"
 
 static void psb_lid_timer_func(struct timer_list *t)
 {
@@ -20,9 +21,12 @@ static void psb_lid_timer_func(struct timer_list *t)
 	u32 __iomem *lid_state = dev_priv->opregion.lid_state;
 	u32 pp_status;
 
-	if (readl(lid_state) == dev_priv->lid_last_state)
+	if (!gma_power_begin(dev, false))
 		goto lid_timer_schedule;
 
+	if (readl(lid_state) == dev_priv->lid_last_state)
+		goto power_end;
+
 	if ((readl(lid_state)) & 0x01) {
 		/*lid state is open*/
 		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) | POWER_TARGET_ON);
@@ -36,6 +40,7 @@ static void psb_lid_timer_func(struct timer_list *t)
 			psb_intel_lvds_set_brightness(dev, 100);
 		} else {
 			DRM_DEBUG("LVDS panel never powered up");
+			gma_power_end(dev);
 			return;
 		}
 	} else {
@@ -48,6 +53,9 @@ static void psb_lid_timer_func(struct timer_list *t)
 	}
 	dev_priv->lid_last_state =  readl(lid_state);
 
+power_end:
+	gma_power_end(dev);
+
 lid_timer_schedule:
 	spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
 	if (!timer_pending(lid_timer)) {
-- 
2.44.0

