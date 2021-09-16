Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600A340ECA0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1107C6EA4E;
	Thu, 16 Sep 2021 21:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A65B6E93E;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 0482B2B011FA;
 Thu, 16 Sep 2021 17:16:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 16 Sep 2021 17:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RqF2Gla2XhI9m
 prps508DrdpwyciwaRKEB2FwzxqOi0=; b=UwPnE7X4zxy+qg3JPQDeKNTnE/b4u
 MvDMpm5++SYIo10YK52Qnjr/xU3RPIn2gRPABy5PX+RF4FIWSC50mTixX9jasj60
 wxKtRmHQprtDWqTjJwL6D4vOVBL5aLrPwlEpbH+Lp0E21xEaSqI7T2a1uuIYVZYS
 UkI0d8R6vN+a/PjbygfKmogg9Fz0k/3TWcGmT5ngKDnWO+Q57VfqSzS7+LUSbMeT
 vMtQr4ITaniLBpSC1niiN9vjOTPbWodBK8WYahs4eszgjZSbN9LGw/83SPmY3fO+
 ICOYG5hZaYFvjf4Nq90nJtA/6ZS65nJgyKs46DxeoZ3JkrDYBknqESv6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=RqF2Gla2XhI9mprps508DrdpwyciwaRKEB2FwzxqOi0=; b=usiSwk+4
 P/UjUIXnDBiWHuSGxZKDwbQsIqF4vKNP6aE9l6ezB/oJoVH5spI1eO8Bi1GOQN1z
 wmrLRqnvms7ofJTjAXsYRQdAOtTX0v6G6wEZftHz++JqV9plKhEAJNJJQkPnnw8r
 6Pj7sdQ+63i4NyOCNw5PwYRZGWWRD0ER0NUJDRJOgwcxuX5vZNX5ClJU0vz17dff
 sDkcYQY6qkQWLHhTY865+UX4Yo4QFT+XVryb0kVobD0fqeVTsE4rEr9ngoo2PIb+
 Po2m00K+i8t7ct3lQ7rKsJpZlVxjJUbX4YCnsFB51iBXMBcC5I0UC7MtOI2UACYo
 NugxTd03REQjdg==
X-ME-Sender: <xms:R7RDYYKggGlvJfaocuvduMKsghrvXR24AldXorFYlf4TFLaU_ybTWA>
 <xme:R7RDYYI_x3dxK8lt-c-FI4xZLKhJw5_jwcmPXR3nBOrZxtTCAhVT0Qk0u9i1rhYeH
 CJczg5v7cR38BkZ7Q>
X-ME-Received: <xmr:R7RDYYsuHUKnzy4FTEVIvc2VFf1_oJpBAI5rEmZe6UcgA5zDm3LFMDMjT2UizdJxObyd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:R7RDYVYfRRXWgy7WfviELGXjfs8rz4hiYJymAmDPpChiC4q5fDFMog>
 <xmx:R7RDYfZfIdwfgnro-NaeEqdyl9j3WIc0IOjwv6Djh9pconC06HaGIw>
 <xmx:R7RDYRB8GwITT1SKLxWujqJNtI_gtlVxENRhrgdYJjXgev05LIsuuA>
 <xmx:R7RDYZnB2IBgIZgcnAxUp0prOlA2aPblvwEWvWuNCmGJ7xvhV9-Eyo9UoxM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:52 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 13/15] drm/gma500: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:50 +0200
Message-Id: <20210916211552.33490-14-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/gma500/psb_device.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 951725a0f7a3..4e27f65a1f16 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -8,6 +8,7 @@
 #include <linux/backlight.h>
 
 #include <drm/drm.h>
+#include <drm/drm_drv.h>
 
 #include "gma_device.h"
 #include "intel_bios.h"
@@ -169,8 +170,10 @@ static int psb_save_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
+	int ret;
 
 	/* Display arbitration control + watermarks */
 	regs->saveDSPARB = PSB_RVDC32(DSPARB);
@@ -183,7 +186,7 @@ static int psb_save_display_registers(struct drm_device *dev)
 	regs->saveCHICKENBIT = PSB_RVDC32(DSPCHICKENBIT);
 
 	/* Save crtc and output state */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->save_crtc(crtc);
@@ -193,7 +196,8 @@ static int psb_save_display_registers(struct drm_device *dev)
 		if (connector->save)
 			connector->save(&connector->base);
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
 	return 0;
 }
 
@@ -207,8 +211,10 @@ static int psb_restore_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	struct gma_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
+	int ret;
 
 	/* Display arbitration + watermarks */
 	PSB_WVDC32(regs->saveDSPARB, DSPARB);
@@ -223,7 +229,7 @@ static int psb_restore_display_registers(struct drm_device *dev)
 	/*make sure VGA plane is off. it initializes to on after reset!*/
 	PSB_WVDC32(0x80000000, VGACNTRL);
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->restore_crtc(crtc);
@@ -232,7 +238,7 @@ static int psb_restore_display_registers(struct drm_device *dev)
 		if (connector->restore)
 			connector->restore(&connector->base);
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	return 0;
 }
 
-- 
2.33.0

