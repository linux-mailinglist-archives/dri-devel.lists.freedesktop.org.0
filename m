Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B60740EC84
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509F26E9B8;
	Thu, 16 Sep 2021 21:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233D96E925;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id D32692B011E7;
 Thu, 16 Sep 2021 17:16:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 17:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=mxnMCYMkrpFu8
 uBuQbLz4CaqpDNfEU0EA8xYA6C17NI=; b=aVzfP+Z4rb/qbFZ+hi6QGO+qZ46h1
 o4WG+vbw94OTuMYLvLuAifi0DcVn9v4eMxlPh2jrJhsBrHz9Z3FJ11LHX6aciWf7
 DpAn2ILLvka+4dT0ebmL5gq+XfYs4cF3Wc0/LFzVb+uY3DiabqfJa+Mg75Mwfp28
 qonTSReleUre2GUl86IiNrFTeND2wZpkSLMmFetMdIRfdF5USvTw6feprBqBMZyM
 jhd38kQz2aVA7817wx/kyCvqhZG/HRs/cdfKA+gxmdhb8Xe277fiEEHENqD0KHaC
 96tHYdpHluk/fEfqQL/MxxAKPaeSaNygUP5K/YNUDLxoch1EsMRyu1qDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=mxnMCYMkrpFu8uBuQbLz4CaqpDNfEU0EA8xYA6C17NI=; b=jReoXMtZ
 l36z5BrGGqu4ZmEnwa2CfrsMkHOdFV6Ifi/d4XM64dVdRoZdtKxzD2rDC1dHaIdB
 4eyoN68LD0ZTvgyYEd4YauNQV9NZeaelWVZAAfCSrM7XJ+Is8aSxWe0KgmMRsti0
 2ACbt40hyPEB1/WhILLIMPLCc4wLqLq8rhBExsg5H46h80DUUmBy5e0k0PYFPP3U
 74O+cSSM4VZBOc5hhlCXj702+1acKJ+u+5NbNpWo9XKqA2rfzTtef0HpmKCUHbh8
 7Lp4xoD01fN/nJqFBxfFEiGex2vfC6es+FL1YbDIB4mP3jLPX2N+Kt0w8EM466nv
 koViIwDXZE0f1g==
X-ME-Sender: <xms:ILRDYR9cYOBRgT1cDyfylTR6iNf5iaMKT3VvWiuTd5WO230kerMMZQ>
 <xme:ILRDYVsvVTIKQ8Uq5kWWkeVTppPHEfzCbG96PP5o6b6-nGh3AsrWIyd0kOF4-1ZEI
 MYDN2vHIdAJPLXXOw>
X-ME-Received: <xmr:ILRDYfBDFYBuR4Zy1V78MJcFEoJOQrTWdeU33mHuBXDjnmvap_W73_IGFDby8xspd9dB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:ILRDYVf5OqqJtMQLgjfuZuop65ABmj1nctA-B1cC5AXzt-469BJJAQ>
 <xmx:ILRDYWMYmAH7Ts6HzU7QUO4I2pzoQsJ2aa2ilF-qIILu2WkY8xyHTA>
 <xmx:ILRDYXnw1Sn_VlyrQ4yxV-KUS5-kfAVNflGiNAXXIF6mLDGbSi-feg>
 <xmx:ILRDYdodbWeN0QBAd-CaVP7aK3oA7YkE6VuctahcWuvpl7zDKwLbwDLsdUk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:14 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 04/15] drm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:41 +0200
Message-Id: <20210916211552.33490-5-greenfoo@u92.eu>
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

