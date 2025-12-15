Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5873CBD404
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DBC10E3C0;
	Mon, 15 Dec 2025 09:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g6CaVmjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F97C10E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:47:45 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-59581e32163so3711212e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765792064; x=1766396864; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SDgTtvl+RBHpILPhZonQKwu9nxIYlCiGLZNaksqSUeE=;
 b=g6CaVmjT7SO7AwXYsBgPXBICy/ZvH9A7xL/yBSTjBJTjJw+wOcvz0Wod3aAF1v987g
 5fDLSwX2D5a/UfjlDSngyT5yI+X02ZJR2Kua+/D8EVS1Or4Im3rECA3cQciJTYgN6aSl
 eI/nQt8JLdWHtHtvaVjD67EzUVlgXyN6YFb1qqKYwvWn5SkJG+ufe++4sOqhR7MPnvra
 0tHLNjE3KWHpOs8XZlChIBynNBLbwI6wDGvCzfNGliIMyyHZF2UHzOU5hfeeWSbShRPL
 EC4w0XwtOd79mAWrtjvw4xiPl5yyElVwJ9HzZ4QF2n+pK18RjD5j9CDgRtH0BvoskHMw
 4UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765792064; x=1766396864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SDgTtvl+RBHpILPhZonQKwu9nxIYlCiGLZNaksqSUeE=;
 b=lXuRvMkgSAc8s+Rif9nm6vLe2LGBdOSvqHBtmawAtSuK+Z8sf98SELB+xqZuvBt4SN
 F1Kmtyz2noFU/T99TLB4HWsfy96M6kWEDoD9T6K8kDDew3lO/3mrDySUSHq5xvq61RCJ
 e1nRf0yW3A4DrX/e1v5hqSWsoqyUJa4rjG3QS18DMozVNnbk+jt+ZfnL+I3GQ1fuqvPf
 8/Y2QkY2mKAEAtDPERHcjxSAMQj0V+CnDTSa6NhZkVRk7kgKg3K9jERKIyf8G0p7pzKS
 usn2kn8xwO3BD6ePjDZ5vzeVskMmCldz/xzslwO3DnuiHORW0d/rym2LjXCDDyHlWLuF
 oiog==
X-Gm-Message-State: AOJu0YweCz02sCt84XbpIIXVozuq1evJxBenVwo0U0ZbkmBNnz6Rvtjg
 NOQ36y4jWnSX03JNaSYzA+miYn//JvHLZsc+ex0pPUWLnLA9VleUXP8m
X-Gm-Gg: AY/fxX41YYB5UQHRV3TvTAsbR784rh9P13gP0WUtib0pIIT/3AWvI9EsE/ZLXISZcXu
 RieLuI6Y/OHdsJfTwkevWtHobEp98lb/N3IDm8Xt0i53j7XOU2FYvlEfNLrYCut3zDYwcA5zHRV
 ZlLSkCOXHZrWAZmmvEG4XXB9B6ORjH3/qgmu4bVbOLJV9S/NDZ5QqnFILjy07HsedGMxsg9ahW1
 aBQOmrK40zrH4Ic3e9ruRZfp39dowECkKo97MCBn8ap/LhduGK402VPuGwnT6b9iYBvyC9dp204
 lJeiWt7FODCUUgJa5+HGYoTRWVn/Aydf8ZZbNDwXo6v42cKSjUSo8aCGA4N6UrLU1OUOUSMMLA9
 gePjK/4gO1vhD2HkdKh7dNM7r6PhSMktEPg/kNJoa8/UNzga4hEu9hW45yqs8yA1J8UYFmc/Ssn
 Kmear2Utgl5kVAVr5+E6hda8rsJpiSw0u28Gm+p4N2ghcD5vNJdorYtbZ7fr9boFd4YPM=
X-Google-Smtp-Source: AGHT+IHdUfqXczYyj1Cly0PG2XtJ/rJFxO0ARb+sa77t/57wN4yHBcgga29yLFYYO+CC/kcqJd+Gyg==
X-Received: by 2002:ac2:530c:0:b0:598:fac0:497d with SMTP id
 2adb3069b0e04-598fac04a37mr2223121e87.15.1765792063467; 
 Mon, 15 Dec 2025 01:47:43 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f37ae8sm5397546e87.15.2025.12.15.01.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:47:42 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 15 Dec 2025 10:46:43 +0100
Subject: [PATCH v3 1/7] drm/sitronix/st7571-i2c: rename 'struct drm_device'
 in st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-st7571-split-v3-1-d5f3205c3138@gmail.com>
References: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
In-Reply-To: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7034;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=j1XkYhWQ1IN9JL+Wb1Eozaof9eyPZLQtwZeEnUcZ+0s=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpP9kcj6ovR5fjkalkgb6odPj6NkozJ1jONh1N1
 s5kmRMgkQuJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaT/ZHAAKCRCIgE5vWV1S
 MsUkEADaiXrbKZdRg81hP/WC8znvUiliXA384R8U6N0NXYvtq4ISoFyLO+vvT/PRgtX75G1cwPn
 bHL3yPu7RSg+T+Ah3h2nH6KavExYUoAhnp12D22UPOSvn39Nnuh7IP70Os2FPMN6TaZpdx7lwNj
 kpE6/DRiCOtH4mkjMNWJMApOl7FAoQWY9I9d5WmUKXZXu47h/K380cg5rcFCZOeF+rO0j2Ppb+G
 gaY3MhhohSl+SjVZg2pWwRiXuKQ5WLfxGtQQGOkeMTcneJPXaWLUtI7XpAkv9qIZluKVkoIBq+B
 owUb109M3HZsA9Gx3AD9BdMPthRCbJNASnsTFVStO4zfOTS3noK2wmHkVddVmveuGDo4mdPf/cm
 9Em/xIxC9xt+Esa7/ZeJlyU/4lqAOcMr9Ng3g1dbLfo7vrN5SqKXIFNoAIzJJq7M9BdwcCZhGRb
 jGEwSAdN6i6dTpi4d2tp+EE841A9uPi7ZXBy6JkPjQy/XaxWR48V+Yo6mZAxFYzd/28brwFi7R3
 U8AYm/554hY+AAZYeh2qsoGErp4UfJoGAfc8gxtkZQN0u0khChLgqyL1vt3e4UkOJeo7HPxpz5J
 WfepSRf0Ev1DTr95RmisOydrWhvkGPBiAjI7WTNXvHz0kOUSa9cI9Lx5Sn4hJer3cduk4E4RYFH
 khCTQTME27nUy6Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Rename st7571_device.dev to st7571_device.drm in preparation to
introduce a 'struct device' member to this structure.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 60 +++++++++++++++++------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 4e73c8b415d6..71814a3eb93b 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -112,7 +112,7 @@ struct st7571_panel_format {
 };
 
 struct st7571_device {
-	struct drm_device dev;
+	struct drm_device drm;
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
@@ -166,9 +166,9 @@ struct st7571_device {
 	u8 *row;
 };
 
-static inline struct st7571_device *drm_to_st7571(struct drm_device *dev)
+static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 {
-	return container_of(dev, struct st7571_device, dev);
+	return container_of(drm, struct st7571_device, drm);
 }
 
 static int st7571_regmap_write(void *context, const void *data, size_t count)
@@ -467,7 +467,7 @@ static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
-	struct drm_device *dev = plane->dev;
+	struct drm_device *drm = plane->dev;
 	struct drm_rect damage;
 	struct st7571_device *st7571 = drm_to_st7571(plane->dev);
 	int ret, idx;
@@ -479,7 +479,7 @@ static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (ret)
 		return;
 
-	if (!drm_dev_enter(dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		goto out_drm_gem_fb_end_cpu_access;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
@@ -501,11 +501,11 @@ static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
 static void st7571_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						       struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *drm = plane->dev;
 	struct st7571_device *st7571 = drm_to_st7571(plane->dev);
 	int idx;
 
-	if (!drm_dev_enter(dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
 	st7571_fb_clear_screen(st7571);
@@ -621,20 +621,20 @@ static struct drm_display_mode st7571_mode(struct st7571_device *st7571)
 
 static int st7571_mode_config_init(struct st7571_device *st7571)
 {
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	const struct st7571_panel_constraints *constraints = &st7571->pdata->constraints;
 	int ret;
 
-	ret = drmm_mode_config_init(dev);
+	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
 
-	dev->mode_config.min_width = constraints->min_ncols;
-	dev->mode_config.min_height = constraints->min_nlines;
-	dev->mode_config.max_width = constraints->max_ncols;
-	dev->mode_config.max_height = constraints->max_nlines;
-	dev->mode_config.preferred_depth = 24;
-	dev->mode_config.funcs = &st7571_mode_config_funcs;
+	drm->mode_config.min_width = constraints->min_ncols;
+	drm->mode_config.min_height = constraints->min_nlines;
+	drm->mode_config.max_width = constraints->max_ncols;
+	drm->mode_config.max_height = constraints->max_nlines;
+	drm->mode_config.preferred_depth = 24;
+	drm->mode_config.funcs = &st7571_mode_config_funcs;
 
 	return 0;
 }
@@ -643,10 +643,10 @@ static int st7571_plane_init(struct st7571_device *st7571,
 			     const struct st7571_panel_format *pformat)
 {
 	struct drm_plane *primary_plane = &st7571->primary_plane;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_universal_plane_init(dev, primary_plane, 0,
+	ret = drm_universal_plane_init(drm, primary_plane, 0,
 				       &st7571_primary_plane_funcs,
 				       pformat->formats,
 				       pformat->nformats,
@@ -665,10 +665,10 @@ static int st7571_crtc_init(struct st7571_device *st7571)
 {
 	struct drm_plane *primary_plane = &st7571->primary_plane;
 	struct drm_crtc *crtc = &st7571->crtc;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 					&st7571_crtc_funcs, NULL);
 	if (ret)
 		return ret;
@@ -682,10 +682,10 @@ static int st7571_encoder_init(struct st7571_device *st7571)
 {
 	struct drm_encoder *encoder = &st7571->encoder;
 	struct drm_crtc *crtc = &st7571->crtc;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_encoder_init(dev, encoder, &st7571_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init(drm, encoder, &st7571_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ret;
 
@@ -700,10 +700,10 @@ static int st7571_connector_init(struct st7571_device *st7571)
 {
 	struct drm_connector *connector = &st7571->connector;
 	struct drm_encoder *encoder = &st7571->encoder;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_connector_init(dev, connector, &st7571_connector_funcs,
+	ret = drm_connector_init(drm, connector, &st7571_connector_funcs,
 				 DRM_MODE_CONNECTOR_Unknown);
 	if (ret)
 		return ret;
@@ -934,15 +934,15 @@ static int st7571_lcd_init(struct st7571_device *st7571)
 static int st7571_probe(struct i2c_client *client)
 {
 	struct st7571_device *st7571;
-	struct drm_device *dev;
+	struct drm_device *drm;
 	int ret;
 
 	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
-				    struct st7571_device, dev);
+				    struct st7571_device, drm);
 	if (IS_ERR(st7571))
 		return PTR_ERR(st7571);
 
-	dev = &st7571->dev;
+	drm = &st7571->drm;
 	st7571->client = client;
 	i2c_set_clientdata(client, st7571);
 	st7571->pdata = device_get_match_data(&client->dev);
@@ -1010,14 +1010,14 @@ static int st7571_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to initialize connector\n");
 
-	drm_mode_config_reset(dev);
+	drm_mode_config_reset(drm);
 
-	ret = drm_dev_register(dev, 0);
+	ret = drm_dev_register(drm, 0);
 	if (ret)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to register DRM device\n");
 
-	drm_client_setup(dev, NULL);
+	drm_client_setup(drm, NULL);
 	return 0;
 }
 
@@ -1025,7 +1025,7 @@ static void st7571_remove(struct i2c_client *client)
 {
 	struct st7571_device *st7571 = i2c_get_clientdata(client);
 
-	drm_dev_unplug(&st7571->dev);
+	drm_dev_unplug(&st7571->drm);
 }
 
 static const struct st7571_panel_data st7567_config = {

-- 
2.51.2

