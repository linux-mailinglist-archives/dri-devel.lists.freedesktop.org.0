Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6E8416C63
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BB26EE37;
	Fri, 24 Sep 2021 06:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16CE6EDF4;
 Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 146B858105A;
 Fri, 24 Sep 2021 02:43:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 24 Sep 2021 02:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gI1USBF13b/WC
 9GWwIX4Z1gzLGplb53rIeUu1Mo8b4o=; b=D0x7zw1JXwx7CoS+GIttUAVpXJNri
 9RutguKJ5/bA5QBCVNooj+UJVmN8/SeycK8+eHBCl1MSWC54E+7JLRZ+v3stJl82
 bK37taAM5pTTmmMAkrXYP7WqqM8yUjz4QHTG1duJemcyNgyfbXwdMLA8bdjfjPo6
 bNsf/Y89r2ujS/IjkXLUmyq6rNU6gsCZLpdmQHpaifPjchyP8RnJDXEiIgCeRqz/
 OlWaIxsW6oCOgU62v4tkxBRGGwuZkCZSJIu6Yw5y/NXn9aCWiMQ1cjzNZr53Ggj2
 gqXpJUziJRZHzuq4SmUUDVXsnRZbRDTATyzsnlsaZ2rlIjrmbdvNLM56g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gI1USBF13b/WC9GWwIX4Z1gzLGplb53rIeUu1Mo8b4o=; b=VmgsT00D
 So6sLP/s7+MvXRtB/P4vks7IsiEO2ho4PmQ0XQaU8+KioM3Z4i1Q8lrUpDXiqLOq
 7NXTv7Gm4C1FKDKjzY6fv2AfyhRelcUqrUXqBEqWXB3BKK5rcPVGJsxm3rVSs5xu
 6Pg0rmMGnkPrsYD+dZp5IJxp9ClXUu27QyTkz4HKdt3iCSXMw998ugCbksxVaX1e
 k6xD//mlEcuJEzCjJf+s8Tp1HvbbxBDI5/cD3Nu0SyywxuSk/nEoDipF0jN9p2ky
 Ai2vIlTyEMK1bAlzZP9rGvhqMZddq8MbwGZxW6pzH8IYqCOIcUvdQEZuGl/eyErn
 Ay32K5QMcti87A==
X-ME-Sender: <xms:n3NNYbZ6FEtneoYHQiJ2uaLteVBUXqCJSGy2tOzt4dc5ys7giiVANQ>
 <xme:n3NNYabftZnGlR8uNBDHDvpAW-17ombYn6aDcqfVAtxl60TExK9yfX225NzmXrVxv
 Rxof1Ks8_CXPHugQw>
X-ME-Received: <xmr:n3NNYd-1x_HvXC18arMggXCD1187YE-tnQ7trC_bgNJIlXTHHHAZw6l9-Bks0qzv6TRy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:n3NNYRo25q8PdmT-EmsdL9yrEUZuydJt6kbg6_Iu47SDERpBfuRfyQ>
 <xmx:n3NNYWop3GGchQn5xl7zKLNZV13mzOiSGliI_Eb7tkRXALRXCg6Hlw>
 <xmx:n3NNYXR6kRLJnWccfsrbRIp9XkSKEYVQYYRFWqRLn38XDQxDGSpwdw>
 <xmx:oHNNYV0RvdbZ61w0BUpIWuRcZL-bmcnsa_3trz6UWp78MxtKTUasmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:41 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 04/17] drm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:11 +0200
Message-Id: <20210924064324.229457-5-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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
index 3ab078321045..6860223f0068 100644
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

