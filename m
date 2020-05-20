Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A0D1DB1F9
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 13:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A426E7D4;
	Wed, 20 May 2020 11:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146966E7D3;
 Wed, 20 May 2020 11:42:09 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x2so1419090pfx.7;
 Wed, 20 May 2020 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dKXzWhu+iFDbZVZX01MEhKWZN1XL+SAEWrAks0ZBIaY=;
 b=C7A/Z8ijmJS3emxjDt0Rl1yt9Gwhnb2K6HtJgynS6ev0QY/kT1M9KjV3nXkHvhcwj+
 JN63xyk9+pMYyyuuMLRA3Hznk8U8QNSmOtW0KVmFydM3NcaCdKObI6v8Z3JbjKXz8y/S
 T1frAhHCzi4356lXy52ThG/ohKiJtIq4EGos8+W4VB0eV+r6CRVDig+HuNgbhdy3rquz
 vUuHbMKvsmDra2KORC4sQSDAw8W7I//vSsQdTvf9jlVnxgrNByZjK/7+NVO8w4Bor3LS
 XaxaTrSKKKJnVLAM5b8jr7qeWSWUn+HO8kB6AHh+FdnYOemXnEFR4BvlUfwpRn9gckcN
 qESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dKXzWhu+iFDbZVZX01MEhKWZN1XL+SAEWrAks0ZBIaY=;
 b=nursYRBUlLmVzWqvMqFd+3WsCu9mwHtWkzdmq/H4S4KBCdnqIc2UykbzTC7RKw+ubR
 hVIhrCvLg5byBu6/f+bi8jpru6rKj5bYixK0h8RPcebqq5Lx3WagZtuvs1xMmb+lA7gx
 L3/rJvx/FziJHbg2ACD7vqFDV3frAPnYCrMZAzcSnXj0rpH5rEcHK2k4E3LYiiDIv327
 MMgzSL47n2kKTY3JRR62Q/Nzq6vHrLPLhYbf2tNkPcZEVw6j/NqeE9uK+vuBHGv6NOA5
 xm3xFXXo0OuP1F58ycfdsBo+2JrJ5IYtwMFkEEKXVeEaQesxbD9jJCk1s1bvnsFapKPG
 9pdA==
X-Gm-Message-State: AOAM532WWH8dZcp39LyWWJIoIim3JLP1VlgsX+iL2RZqJvRKHYRKzS1G
 65c5gopgdqqqKZ5N8i8SgVM=
X-Google-Smtp-Source: ABdhPJxaAdJx2bktnsQOfRncfFbAGb2TcQ6dQaypHVTQuqvd+1pVnW5EjUbIHBaXY5FFqodXHkD2Zw==
X-Received: by 2002:a63:b904:: with SMTP id z4mr3804221pge.25.1589974928484;
 Wed, 20 May 2020 04:42:08 -0700 (PDT)
Received: from localhost.localdomain ([106.254.212.20])
 by smtp.gmail.com with ESMTPSA id x6sm2104450pfn.90.2020.05.20.04.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:42:07 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: Replace deprecated function in drm_crtc_helper
Date: Wed, 20 May 2020 20:41:56 +0900
Message-Id: <20200520114156.26480-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gfx@lists.freedesktop.org, Sidong Yang <realwakka@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace deprecated function drm_modeset_lock/unlock_all with
helper function DRM_MODESET_LOCK_ALL_BEGIN/END.

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index a4d36aca45ea..c7379c719952 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -217,11 +217,14 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
  */
 void drm_helper_disable_unused_functions(struct drm_device *dev)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
+
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 	__drm_helper_disable_unused_functions(dev);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 }
 EXPORT_SYMBOL(drm_helper_disable_unused_functions);
 
@@ -938,13 +941,14 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
+	struct drm_modeset_acquire_ctx ctx;
 	const struct drm_crtc_helper_funcs *crtc_funcs;
 	int encoder_dpms;
-	bool ret;
+	int ret;
 
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 	drm_for_each_crtc(crtc, dev) {
 
 		if (!crtc->enabled)
@@ -979,7 +983,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 
 	/* disable the unused connectors while restoring the modesetting */
 	__drm_helper_disable_unused_functions(dev);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 }
 EXPORT_SYMBOL(drm_helper_resume_force_mode);
 
@@ -999,9 +1003,10 @@ EXPORT_SYMBOL(drm_helper_resume_force_mode);
 int drm_helper_force_disable_all(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 	drm_for_each_crtc(crtc, dev)
 		if (crtc->enabled) {
 			struct drm_mode_set set = {
@@ -1013,7 +1018,7 @@ int drm_helper_force_disable_all(struct drm_device *dev)
 				goto out;
 		}
 out:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 	return ret;
 }
 EXPORT_SYMBOL(drm_helper_force_disable_all);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
