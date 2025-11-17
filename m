Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BCC63083
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E56F10E30C;
	Mon, 17 Nov 2025 09:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yrs07f8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031EF10E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:04:22 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37a5ab1e81fso33668351fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 01:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763370261; x=1763975061; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ehk/EozwE7/cxfYnvgp9ayPWLUem+ZdJVcEwqK4yNNQ=;
 b=Yrs07f8FbymB8jZLTF5wTdcmdQ7Mtk4dKhWLfh5QQhkNvkhIUN0asY96dWT2WnZP7r
 RSDA2Sb1aixRbxt8siVljipHfUTpUUeMJeGq35/7JPGlLqLd64oOeFk2JjhY0DivUl3j
 fE3nRWTytsCNMbl4nncNOXG5y3r9r7i7uQGMqzDxX5D81RaWIai1q9xhI5T8kXExBfQY
 vQ0y/brVljdn75DN5kut4i2bpdCnTFFXF/aWvbz6IbvaV55jLPJmROS7PcnRJjLjSvvR
 8ujxeoP828dllOtYdTRKHpuBIHAr4hDXEjBBxSKNeUV5Vy6g4Sayt2vPzZqhKhOXQz8x
 jSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370261; x=1763975061;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ehk/EozwE7/cxfYnvgp9ayPWLUem+ZdJVcEwqK4yNNQ=;
 b=N6Kyg60N1SLr1fuZfVpUu9reqt408FyaPs9zXEyedCreuDHk2a4rXAlyiEk84S5yuy
 0+ihunZpSMyg61oOw1PK319+TqoiKtqtf9oyncMzOm3MnW5Ip5+mQ0O9O96nRqIrqOQD
 q7UrXKCLCvi/WGdmcm288BpXtgauRAaXax+HE037XApofuYt0eWqtXoaG5sRTxX7DkMj
 4YBHsBQDfKHzmLpd44CM3dpOL6XHBOICptHcouQ/abfzv9O1wgMtG7axi37BcJeBFhUB
 UW2/OVVAdilthkjO8iXXgYja58L1twkTk3Y64eU3uczfTHWBcx4CO5uW2Ahxq9mFdJ80
 0wQw==
X-Gm-Message-State: AOJu0Yz/PUIu2ezudlg/8BRj6Kbw/wZZYGcSnL1WClBWujoFU1X94woL
 pw8fd1oS7SUyC7WwOtv2Ao+6lHMxf/vmbijTVt7bDPDA0M4rabYqyOTR
X-Gm-Gg: ASbGncunfK95IhlUIcvMvpejFdHeRqpya7ePcWGt6Fx4x6SgpZdYKZYYzYmG8s3rRAa
 Txi++J6x6BSODeXlM8n7CZEFzywi9t4fH9BF5wsDG6eQPc/MDJxmvVZAVya0P3GWyJsfbilYgqi
 JkCHNFdzmdRbnsQDjHE6l2XXOjY7xFCxZODfv0Uc5UpHo7R8CqNb9gLvi/PaW+v48eVzHCdunXc
 e9faZpOWWBV7U/5/fYHzsopT2MkbQIhbHM1dTIwFfM5obI5Mlid0X4mfGvW/JqMNXAPdo6uL4ZW
 v6VEhuTKmtt+5vikKwejcpwADi93NZRbxuSRjsncJ0YairvYNit4P/MSvzUZDgFdrebwSVLHtoa
 1XvkTJRdsH0xllvnsUO3RimR2grGjGaw5pZwDdx7O66PmbSI8YxUgCExVkQ3XLgmWxX4ZitkMPL
 4qofrL/fAplhRRcnl82ZuF/m/NqaPuWcYZhl3T8Xz96ZVznHqcABABU23R
X-Google-Smtp-Source: AGHT+IELavp6ALa1YIbZ9iay4QMBUdUiCg6KW3BGaizvP3d5EwN6VvQx/N2OqemVhxKmqvMnVf7Egw==
X-Received: by 2002:a05:6512:4028:b0:595:7e73:995c with SMTP id
 2adb3069b0e04-59584211dd2mr3226563e87.44.1763370260709; 
 Mon, 17 Nov 2025 01:04:20 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b77e5sm2982498e87.42.2025.11.17.01.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 01:04:20 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:03:43 +0100
Subject: [PATCH RESEND v2 1/6] drm/sitronix/st7571-i2c: rename 'struct
 drm_device' in st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-st7571-split-v2-1-13189da95265@gmail.com>
References: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
In-Reply-To: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6974;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=pz5GhbAytN7MzkdHAjHi7UGCmM26Ce8ielPk5ZKAau4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuT16ofEyQwFo6DFoJ2GjMlgrmMlBype2mZVg
 CQ2RuoQHWKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrk9QAKCRCIgE5vWV1S
 MhkGEAC6egudrdBhe5XMqueXGEPy8m2csWu+L7Qu1YXtW8cz0rRSVDZJrXFFmQ7pfsecjCQRCrM
 0gseoXJZ9dnimEIaSAMNklCZ5at2VbV1ji6ApUkwBnd8mgm/YAnQdPEtOUabHT0AWbUUfZNkgR2
 TyuS+C3LUMohLpVJne5alAp9+JQzMXwrT2BzW/eLyYXO+UQA0vKV09yM25NtrEwXpbbmRfLZEKk
 sLhgSxiE8apt8ebFa4T25hszzBxqmYa40L6eHA47sLl8OgHldbvoSgldyv0eisRSBG3LnVbABEc
 k+JQ6JgSib3pnYP2+CEXRmLOOBMNxHp1fn9fESZboZofcHSSxe0kDvoUU4tfy9eu8bP5jUA+u7T
 H5J2frcr8KyDdWcgVlqelcq4Dp0QwnBe/QvJGqL7cWJmZBBMFG7u/viMvtABGaqlgjxgjDgm8jE
 qVAJ87Bs8PqvPLhy+DX8cITPdnLY8sTl4UqAIj3lWIDGUKbZG4f7JLBVn3sMSp7gbQ6Pkt7IWjI
 mQkhdKV0f11nt7SU1tU9thStryT3bHl2jZHw9QybTbXhn4C7RZVEEyon3ajRX47gSxied8h2n9j
 vLmz+B6Fz49iCrtJN2v9ClXFh/nYFL1D2UgGAnrtDWaVy2RuRwL2nq5G+uWlyba/tIOI4oBJ90+
 ntpqe3467Hd6xvw==
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

