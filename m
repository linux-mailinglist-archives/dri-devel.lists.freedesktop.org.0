Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1093425BD1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6C46F3DD;
	Thu,  7 Oct 2021 19:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223326F3DD;
 Thu,  7 Oct 2021 19:38:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 203D72B009FD;
 Thu,  7 Oct 2021 15:38:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Oct 2021 15:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RbQsnaBKIXFPV
 U9maqxyMso97f+XJODL9KEdEEoLowg=; b=FvyDGSDnATaCd8VZyMyktfeTmlfUN
 0sr5OBVyrD5jfX4mjS5gz33wYNvUMEtf02PegaAsLvFgjonR+WCCA0TC2oaIsqsf
 Y9KtesHzUqVF0WDLzkWNy1ZpHVvWQPARbDe8+u04PpBcrA036yCfr/t5NRj4zcGb
 G/shBV3WX9iJCUj7onTpDFvCMRZfBZAOaetk/jKU/t97GPLC1/GqGqW8pVsRTIEH
 W+icoE9lLsXWgnul0inpekLKmBBr+3MVighMLO9532xzyjGHnWtyoVwup0/Jf9Ry
 N4m8T+Nfl33cmBOmkWOKQVJoCgiFo4KTpfStrUb1RagafATDMF9ypDJww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RbQsnaBKIXFPVU9maqxyMso97f+XJODL9KEdEEoLowg=; b=Z9jch1rg
 R99kyN+PbB6CqpaVmlLswhafwuAJT4b/26J84YKZpeeu8uXm4FcC266RP7qZP9xb
 eBcO+yFIumVk+SMi3OxHuhw7F6C931g0TISAU3aXp4MlqeWpzHr/cD2eQRxCITPw
 PHTI5KZfeGTJ3sxraCOKEZkm0bD8GL+2pSdwtyGV5OhFtoy8+u7BnCCQfL/lVmgu
 r9Ha4xkysEuVeSY8pNGZSqlA8sCpDHHCYaKSOC1NeJPQwDrj5DjORckysUFwvk24
 DfbRk3i5hsr8GVU0rIKJjPa8Rfb2jyvql3vqJztvSiHMxMqmp4tgDXmrcv6A2JwP
 5JYCdwEeYG+uhw==
X-ME-Sender: <xms:qkxfYVmep0HZIwirvTTc6jlfFQzc-kh6vdjhyO0TstJBzumcCPTDbg>
 <xme:qkxfYQ1-pPxoWEJlKucJVUeJ-iNwiUgAgnx0beS8h36fJ3BEOGDBawBSStKUk8cwf
 zCUGk60EBxG6jOFMg>
X-ME-Received: <xmr:qkxfYbqxpczllW8gQsj-L42UxrKPrX98s00gvuT8-NLIgwpo7t7ffa17zz4kdyou9N6M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:qkxfYVk0lWhSdE1rWDeyLmV1R9TwZyho6xpAdUE_m7vYV1o3ZfjOYw>
 <xmx:qkxfYT0E30Cl68uG0l5PddGCQQM_UX0dqQ0Ski6JiZwqtesQdFUGMQ>
 <xmx:qkxfYUs45kvL4l99NN9VnG3oXc0S26wzlvHSMD3Fk5qPNTdI78C7gQ>
 <xmx:qkxfYVwdtO1pEHOYw1BQiyTexlMppknaRsCxMEgSMnu2T2sf1x7w5jWWQCo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:16 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 04/20] drm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:39 +0200
Message-Id: <20211007193755.29579-5-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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

