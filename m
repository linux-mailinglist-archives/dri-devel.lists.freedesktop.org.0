Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062042CB8C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349886EB1B;
	Wed, 13 Oct 2021 20:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E876EB1B;
 Wed, 13 Oct 2021 20:49:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 43EAF581176;
 Wed, 13 Oct 2021 16:49:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 13 Oct 2021 16:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RbQsnaBKIXFPV
 U9maqxyMso97f+XJODL9KEdEEoLowg=; b=ZGe7MJoRW9x422ATVg461e2YIhh+z
 MceO2vb2GsgQK/WNPC2GAkKMhqzr03ITTnfGEXbnNNJw4hvDkgR/vAhpfsfRxfkN
 4TiMczdpuVzTTdC8bF0Guy8bv24afttF2VLDVG7vHYr4Jcv3giVahnGk6EiX7te1
 D+i7+sj5OkVh0uiIM4NAzue52erGWifmNVxH4RFHSa6s/8M7PJmdHj7PH3+ai8Fa
 EkZ5JJqI5mKHALYFqLeXinWSN9+ZrpgsNU4WrjhBedqSuB7fn+nkrGipKkSVMK3u
 FUxgoAJ2sgJ+eiHq1wPYDQDdpwXaFaOTDSlbdaTT0vplg+wqmFnI8v5pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RbQsnaBKIXFPVU9maqxyMso97f+XJODL9KEdEEoLowg=; b=UTvVmxB3
 GyfKxlco7NgMZkBZqeJWuqf75HZa5Bbv0N3wHX+hCcR/CIJdNeQU0wbS07Mi7PzL
 NRv4u1ZWnPbNN/HEjDcQKFGMxPdGTT1JT7y++7AhUF+rzH0hl3mLxYVanh6qeN67
 hLm7bvT/IDScIyOgO/jJIqzMK3JBBCbEk0ACTIEsY+dTr5fwkmQstVhkb48AniFg
 rAh1CzB9XBdeLyTvIO6L8uJCiYdX84/i3BtkK4v8l7vK9EJCblhgGfNDY1Qov6GP
 9pnzSoRNjqKO0GeLqHNngDZWVIOsceX1CfYqGXGXc2WsXw5Qs65nCTvU5HrdlQ9i
 t/u9m/VwlKTiJA==
X-ME-Sender: <xms:QUZnYeO8GusQeTf8nuHjPTONGdu8QlJZ4fHefH2M7HaviYA88-xdCw>
 <xme:QUZnYc96UGNDH6DPKF-mKACKY2y1t48pGDf_WaJ5z5DYdH4mnZERcfgY8vkxz6AZ9
 PUqnKvFDh_7N0Vmkg>
X-ME-Received: <xmr:QUZnYVSczkdgBGB5p70bCW6X_Rp3M9e_KlTv2asaYDEW0OpDU8w0Rj-WVs3HX4dPy6kl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:QUZnYetzv22mc8LmZbArIaqm1U1ifZsYY50D4WqGmuAO8cbsQcNRZA>
 <xmx:QUZnYWdBkZ9GotaCrnnL2nalOUTIQYjuqmiJqyIBB7SesKNz6-wQNQ>
 <xmx:QUZnYS3_dY_CN4SG2BX83HcLCSy-qdNMkOkVEYZrZDQOCGHd4Z82cw>
 <xmx:QUZnYW5lFSCSmj1JKcFRVFXL3rjK2ekQkMDSDlce2fxZZEJIa3GO_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:02 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 04/20] drm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:30 +0200
Message-Id: <20211013204846.90026-5-greenfoo@u92.eu>
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
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_client_modeset.c |  5 +++--
 drivers/gpu/drm/drm_crtc_helper.c    | 18 ++++++++++++------
 drivers/gpu/drm/drm_fb_helper.c      | 10 ++++++----
 drivers/gpu/drm/drm_framebuffer.c    |  6 ++++--
 4 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 5f5184f071ed..43f772543d2a 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1062,9 +1062,10 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
 	struct drm_device *dev = client->dev;
 	struct drm_mode_set *mode_set;
 	struct drm_plane *plane;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_for_each_plane(plane, dev) {
 		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
 			drm_plane_force_disable(plane);
@@ -1093,7 +1094,7 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
 			goto out;
 	}
 out:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index bff917531f33..f3ce073dff79 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -218,11 +218,14 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
  */
 void drm_helper_disable_unused_functions(struct drm_device *dev)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
+
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	__drm_helper_disable_unused_functions(dev);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 EXPORT_SYMBOL(drm_helper_disable_unused_functions);
 
@@ -942,12 +945,14 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
 	const struct drm_crtc_helper_funcs *crtc_funcs;
+	struct drm_modeset_acquire_ctx ctx;
 	int encoder_dpms;
 	bool ret;
+	int err;
 
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
 	drm_for_each_crtc(crtc, dev) {
 
 		if (!crtc->enabled)
@@ -982,7 +987,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 
 	/* disable the unused connectors while restoring the modesetting */
 	__drm_helper_disable_unused_functions(dev);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
 }
 EXPORT_SYMBOL(drm_helper_resume_force_mode);
 
@@ -1002,9 +1007,10 @@ EXPORT_SYMBOL(drm_helper_resume_force_mode);
 int drm_helper_force_disable_all(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_for_each_crtc(crtc, dev)
 		if (crtc->enabled) {
 			struct drm_mode_set set = {
@@ -1016,7 +1022,7 @@ int drm_helper_force_disable_all(struct drm_device *dev)
 				goto out;
 		}
 out:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	return ret;
 }
 EXPORT_SYMBOL(drm_helper_force_disable_all);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8e7a124d6c5a..3b5661cf6c2b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -940,10 +940,11 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_mode_set *modeset;
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	u16 *r, *g, *b;
 	int ret = 0;
 
-	drm_modeset_lock_all(fb_helper->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(fb_helper->dev, ctx, 0, ret);
 	drm_client_for_each_modeset(modeset, &fb_helper->client) {
 		crtc = modeset->crtc;
 		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
@@ -970,7 +971,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 			goto out;
 	}
 out:
-	drm_modeset_unlock_all(fb_helper->dev);
+	DRM_MODESET_LOCK_ALL_END(fb_helper->dev, ctx, ret);
 
 	return ret;
 }
@@ -1441,10 +1442,11 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_mode_set *modeset;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
 	mutex_lock(&client->modeset_mutex);
-	drm_modeset_lock_all(fb_helper->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(fb_helper->dev, ctx, 0, ret);
 	drm_client_for_each_modeset(modeset, client) {
 		modeset->x = var->xoffset;
 		modeset->y = var->yoffset;
@@ -1457,7 +1459,7 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
 			}
 		}
 	}
-	drm_modeset_unlock_all(fb_helper->dev);
+	DRM_MODESET_LOCK_ALL_END(fb_helper->dev, ctx, ret);
 	mutex_unlock(&client->modeset_mutex);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 07f5abc875e9..205e9aa9a409 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1059,8 +1059,10 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
 	struct drm_device *dev = fb->dev;
 	struct drm_crtc *crtc;
 	struct drm_plane *plane;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	/* remove from any CRTC */
 	drm_for_each_crtc(crtc, dev) {
 		if (crtc->primary->fb == fb) {
@@ -1082,7 +1084,7 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
 			drm_plane_force_disable(plane);
 		}
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 /**
-- 
2.33.0

