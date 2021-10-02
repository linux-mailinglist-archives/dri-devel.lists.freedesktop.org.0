Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E990C41FCD8
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E651F6F4B0;
	Sat,  2 Oct 2021 15:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180176F4B2
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:46:02 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id n6so7447030qvp.7
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTNw2YMEXoH/mgbT1Zrk1/SV+kbOfqnN+Iv25LvBHNM=;
 b=YqVAvkIQhDYK4VlusHjndYDflqQ4aMDs5NidBExEBE9S6KoANwLaQqNMvkM4Iaj1xB
 vCiGBcEKbu5xaQh6VCODX7T5j8np3ThXAJCunr73KMvKT2JlpqfTS2WKM3ye8xRGGd4o
 dEMn96uVwHIxWlx19o0EG2sCk5+JodVbVBNxfUYX7PPf+GUV4Wz1TEozU2xdorQcjTkU
 YLuxj8fXPv2lM3p/Gh+L8Pe6XEuy0zGE2Jq/QYakrgUJSkVJRWowqqoIqbMf3It4hioy
 wBFDDSwxpstrUbzOlg/jZlGLTglh+Wvag78but/p8oq1BPAPGPcmcMc53Uir2QSySMxN
 GkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTNw2YMEXoH/mgbT1Zrk1/SV+kbOfqnN+Iv25LvBHNM=;
 b=14f/7KtVqr5AALdaYS0Z13qJq1/T9k0U9u+e173YwjGPgzIwoWVlSP7nW/uW7HcsGS
 8vp9AaxdiLsrRzz3xNXpQiJnGA4kBDQiZZHJUb3V6sKvoK9fOUIh1LBfloD5GIorrRBh
 DlQWKGE4teDurg3MAfRFMvDFgWEubLadeWX7qlkOwU+Uogf5reYnb6myUh4ZYwB76BJb
 YRrRcsnpjyhHhvhVlpkTXTs+4RtPiz8kwE/ekiv+x+9ZrBrMpMwzjs3suFs1p8WCJ4J0
 tx9dVyE+b1H5/thbeJIChNy6BImrjkaAeVTHbnGPNfPYH3ZEoY5Rkted8uzTQgo8mYIf
 njyg==
X-Gm-Message-State: AOAM5337i+ChxQXgtAV8TpxGKlt19UhZC0ztZ4t1WQTT4Nal1J/ODc1v
 yGKDvlQI0yMXker83DFEvfP2UvwOFOn2LA==
X-Google-Smtp-Source: ABdhPJw6AGwI0rWLODncQ//cViX0H50Cam+jcWxRoqKqeqJlfXwkJeyGv6X1Ua7mqk2Uwjv/lGHnJQ==
X-Received: by 2002:a0c:e310:: with SMTP id s16mr2703038qvl.11.1633189560909; 
 Sat, 02 Oct 2021 08:46:00 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l7sm5456942qth.81.2021.10.02.08.46.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:46:00 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 13/16] Revert "drm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:39 -0400
Message-Id: <20211002154542.15800-13-sean@poorly.run>
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

This reverts commit 7c5f2eecc21f44fba1b1f13ce09c2533db9d781a.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_client_modeset.c |  5 ++---
 drivers/gpu/drm/drm_crtc_helper.c    | 18 ++++++------------
 drivers/gpu/drm/drm_fb_helper.c      | 10 ++++------
 drivers/gpu/drm/drm_framebuffer.c    |  6 ++----
 4 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 43f772543d2a..5f5184f071ed 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1062,10 +1062,9 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
 	struct drm_device *dev = client->dev;
 	struct drm_mode_set *mode_set;
 	struct drm_plane *plane;
-	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	drm_for_each_plane(plane, dev) {
 		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
 			drm_plane_force_disable(plane);
@@ -1094,7 +1093,7 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
 			goto out;
 	}
 out:
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index f3ce073dff79..bff917531f33 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -218,14 +218,11 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
  */
 void drm_helper_disable_unused_functions(struct drm_device *dev)
 {
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
-
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	__drm_helper_disable_unused_functions(dev);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 }
 EXPORT_SYMBOL(drm_helper_disable_unused_functions);
 
@@ -945,14 +942,12 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
 	const struct drm_crtc_helper_funcs *crtc_funcs;
-	struct drm_modeset_acquire_ctx ctx;
 	int encoder_dpms;
 	bool ret;
-	int err;
 
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
+	drm_modeset_lock_all(dev);
 	drm_for_each_crtc(crtc, dev) {
 
 		if (!crtc->enabled)
@@ -987,7 +982,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 
 	/* disable the unused connectors while restoring the modesetting */
 	__drm_helper_disable_unused_functions(dev);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
+	drm_modeset_unlock_all(dev);
 }
 EXPORT_SYMBOL(drm_helper_resume_force_mode);
 
@@ -1007,10 +1002,9 @@ EXPORT_SYMBOL(drm_helper_resume_force_mode);
 int drm_helper_force_disable_all(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	drm_for_each_crtc(crtc, dev)
 		if (crtc->enabled) {
 			struct drm_mode_set set = {
@@ -1022,7 +1016,7 @@ int drm_helper_force_disable_all(struct drm_device *dev)
 				goto out;
 		}
 out:
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 EXPORT_SYMBOL(drm_helper_force_disable_all);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 6860223f0068..3ab078321045 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -940,11 +940,10 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_mode_set *modeset;
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
 	u16 *r, *g, *b;
 	int ret = 0;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(fb_helper->dev, ctx, 0, ret);
+	drm_modeset_lock_all(fb_helper->dev);
 	drm_client_for_each_modeset(modeset, &fb_helper->client) {
 		crtc = modeset->crtc;
 		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
@@ -971,7 +970,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 			goto out;
 	}
 out:
-	DRM_MODESET_LOCK_ALL_END(fb_helper->dev, ctx, ret);
+	drm_modeset_unlock_all(fb_helper->dev);
 
 	return ret;
 }
@@ -1442,11 +1441,10 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_mode_set *modeset;
-	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
 	mutex_lock(&client->modeset_mutex);
-	DRM_MODESET_LOCK_ALL_BEGIN(fb_helper->dev, ctx, 0, ret);
+	drm_modeset_lock_all(fb_helper->dev);
 	drm_client_for_each_modeset(modeset, client) {
 		modeset->x = var->xoffset;
 		modeset->y = var->yoffset;
@@ -1459,7 +1457,7 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
 			}
 		}
 	}
-	DRM_MODESET_LOCK_ALL_END(fb_helper->dev, ctx, ret);
+	drm_modeset_unlock_all(fb_helper->dev);
 	mutex_unlock(&client->modeset_mutex);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 205e9aa9a409..07f5abc875e9 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1059,10 +1059,8 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
 	struct drm_device *dev = fb->dev;
 	struct drm_crtc *crtc;
 	struct drm_plane *plane;
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	/* remove from any CRTC */
 	drm_for_each_crtc(crtc, dev) {
 		if (crtc->primary->fb == fb) {
@@ -1084,7 +1082,7 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
 			drm_plane_force_disable(plane);
 		}
 	}
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 }
 
 /**
-- 
Sean Paul, Software Engineer, Google / Chromium OS

