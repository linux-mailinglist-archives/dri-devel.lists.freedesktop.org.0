Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC1942CBE0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9746EB51;
	Wed, 13 Oct 2021 20:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A6D6EB4D;
 Wed, 13 Oct 2021 20:49:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4AE68581176;
 Wed, 13 Oct 2021 16:49:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 16:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=PuRwF9Ft3UyWB
 Jf64PRaXhYohKvgAVW28ATMLUMmKjo=; b=TeNRBD6swzkG79I9b7TXSsHo33CRX
 Gsm+GcPGgDFQXMEyqf65VKjDd8gwa4dADG13lk8skjou25p8QV/d3q2+Mvv3pYJx
 kki+sSEjwKdQF2ihuzdBjuhotdt0SsPOS9aD+Q7ufOGJAAU7h6DRYW8gtoClN74+
 ay2lpN4YxznXxbPcTdSW66PK3RK0vWRJU28d09J6klPD2bPfR/5R91SN2kAbTqdb
 fBbXONHgFYxzvxV6gnsg30JMzbV3271HaZfnJ+hFQXQV/HUa810oVbTXTacv/+TX
 lloqyy/7Y3AkRQDhYbi1xnDuheWCVPRenyLcqZf84khS6rLfa1RqtV0aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PuRwF9Ft3UyWBJf64PRaXhYohKvgAVW28ATMLUMmKjo=; b=iOCBCgVY
 QLlMxtfhB0e3TIoRzHX8iKMXkYWWUHgZmwuG9+SdtL6J7qUW2MMInBerBWPlEWsU
 OueKWNTxLVYR4L+hrV8VRaaK8Q1lb+e5550vgxfzGZH3tz6gxPVPWsZ/tkUoXo0p
 nCjVar4De24RqwzyGifD6QyKhHxwfG/sxbx+A50PnjhQWUjOjXrV2aNeDS+G3a9i
 BZZj2HwGQMegLD5d56Z+JA/HAlFxMRIPx/F1YyQu2UF4E78Hr/XrR8iZNI5OOdyk
 cEinoGuAfW5JiUuLCHX6YMPDlGa8h6dg9ibg/UFcKCdeJuZNYStwQxuD9rKGSZ02
 v+6CqtUXYecZKg==
X-ME-Sender: <xms:YUZnYYRBE_WHaHad1ctBI6yEkl-spypqj4k0GVLMr7mmX8o7iUG_RA>
 <xme:YUZnYVyZtctjoNsBBKR8NyM-hA36T13Qe8L-OHCLdvtNz-7DL96TboeaSEWwVD3zI
 9zqj7PXEGnumrDJ_w>
X-ME-Received: <xmr:YUZnYV1MSwT2EaLZ21J7wV2J8_mA4USbDvQbWpor6mByTWRV972haXnOhM6BoLTqinwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:YUZnYcB9SstTsGsxADXkSUaKr8wEV_QdSUXzcz1JC6ziDZVdF_2wMQ>
 <xmx:YUZnYRjP9SRvf5prFx-0H88EnKhnWzXKvgm3fnvvAAz7YzfmtKBfaA>
 <xmx:YUZnYYpZv89_aBFVM_WvHDHiION8hnxYS_jD1vcbQFwBoBX7x2Woaw>
 <xmx:YUZnYYOO-kq-wzh-mwwf44333sOlLn7JCm5MQNyGr2_RuVl4AN5GmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:34 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 15/20] drm/gma500: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:41 +0200
Message-Id: <20211013204846.90026-16-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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
 drivers/gpu/drm/gma500/psb_device.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 3030f18ba022..021a7238508f 100644
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
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
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
@@ -193,8 +196,9 @@ static int psb_save_display_registers(struct drm_device *dev)
 		if (connector->save)
 			connector->save(&connector->base);
 
-	drm_modeset_unlock_all(dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	return ret;
 }
 
 /**
@@ -207,8 +211,10 @@ static int psb_restore_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
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
@@ -232,8 +238,8 @@ static int psb_restore_display_registers(struct drm_device *dev)
 		if (connector->restore)
 			connector->restore(&connector->base);
 
-	drm_modeset_unlock_all(dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	return ret;
 }
 
 static int psb_power_down(struct drm_device *dev)
-- 
2.33.0

