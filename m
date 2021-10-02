Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCF41FCCB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9A789EB4;
	Sat,  2 Oct 2021 15:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5A76E831
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:48 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id i132so12239993qke.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=scxqgPmCF5BwnZ04IxRaI5D6qVw+TuBLKWOKYCisQ9Y=;
 b=DfsfK+EHdc+1+nEvdFePjkTst9sIfld/9zTB88XqsF6IHQ0PT7rsoQZAbZuSg92g/D
 5j5o6VjAueRLqcWIJkUIRn3HPovBUMRe2PqgCWazAD+d88jceBPNnDTrWOk9QOUmIkGT
 a1XujwHJbxk86/edoWcJWWa3TRrPrxn81dtoYf8n33pS+rvht4oGLhnofBH6tRXyyW8z
 Ns4XlobOfClqXddFHLja44KFAFuhTNSbQdmAL5nd/UiWb6LbaAKCct5glXIkjI59zntv
 mWhKs0iVfLx0PCmnvRS4SGP4Ntxjh0Oyks/BnqQbXWf+DJBWqlHxrJBJkkqtGwK4QPEo
 uZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=scxqgPmCF5BwnZ04IxRaI5D6qVw+TuBLKWOKYCisQ9Y=;
 b=gg0XtuP7o+mBUa7bkIOFIgJlhxyGt9VWkhw0uU3v/3B5HBaU2pjvXUmZzm5/QrC6bl
 prQq10Y1f5E8Tf3yAiDpFEUJz+IavW7KTJVBHa429MsKWmGSiXZplCzVFia3RGYuOLzz
 j/K8nDZEFVsOXbGg1dhgXqs+VKYR7/R7igWNLtseT5r4FcROQbarL97ru1Dj+1W/jujU
 oSj5XRjJCks6ef2gZehv92nku7vxXUJL647SExB5TMYziyvoyewANBWwaVFlSH08khqg
 2g2EjwfCVlVT0AyPVRjVcbBWSp6thTR3eo6Xendxk0tNiKeokYNgbd3jnEXcQnIUe3iH
 +CAw==
X-Gm-Message-State: AOAM532LpuZEV7QHrm53QicOwexkn1kwlRACg845ModGYFds/1EZnaZ/
 Mvtte6Z6TU4R4izp9ZP2Ld28cQ3wCO4m7A==
X-Google-Smtp-Source: ABdhPJwCwg/8ZOzqgq1aHXMJbR/z5n5u5IrCqX/HWLUgwQZswXvRYY60SydOErdbYSGnFiAFrbldTw==
X-Received: by 2002:a37:8ac6:: with SMTP id m189mr2970494qkd.66.1633189546997; 
 Sat, 02 Oct 2021 08:45:46 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id m11sm4671601qkm.88.2021.10.02.08.45.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:46 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 03/16] Revert "drm/gma500: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:29 -0400
Message-Id: <20211002154542.15800-3-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211002154542.15800-1-sean@poorly.run>
References: <20211002154542.15800-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 4f9e860e6ad65ff4ea8ce165a1407d96ff1b2211.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/gma500/psb_device.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 021a7238508f..3030f18ba022 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -8,7 +8,6 @@
 #include <linux/backlight.h>
 
 #include <drm/drm.h>
-#include <drm/drm_drv.h>
 
 #include "gma_device.h"
 #include "intel_bios.h"
@@ -170,10 +169,8 @@ static int psb_save_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
-	int ret;
 
 	/* Display arbitration control + watermarks */
 	regs->saveDSPARB = PSB_RVDC32(DSPARB);
@@ -186,7 +183,7 @@ static int psb_save_display_registers(struct drm_device *dev)
 	regs->saveCHICKENBIT = PSB_RVDC32(DSPCHICKENBIT);
 
 	/* Save crtc and output state */
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->save_crtc(crtc);
@@ -196,9 +193,8 @@ static int psb_save_display_registers(struct drm_device *dev)
 		if (connector->save)
 			connector->save(&connector->base);
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-
-	return ret;
+	drm_modeset_unlock_all(dev);
+	return 0;
 }
 
 /**
@@ -211,10 +207,8 @@ static int psb_restore_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
-	int ret;
 
 	/* Display arbitration + watermarks */
 	PSB_WVDC32(regs->saveDSPARB, DSPARB);
@@ -229,7 +223,7 @@ static int psb_restore_display_registers(struct drm_device *dev)
 	/*make sure VGA plane is off. it initializes to on after reset!*/
 	PSB_WVDC32(0x80000000, VGACNTRL);
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->restore_crtc(crtc);
@@ -238,8 +232,8 @@ static int psb_restore_display_registers(struct drm_device *dev)
 		if (connector->restore)
 			connector->restore(&connector->base);
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-	return ret;
+	drm_modeset_unlock_all(dev);
+	return 0;
 }
 
 static int psb_power_down(struct drm_device *dev)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

