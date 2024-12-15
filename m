Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B29F231E
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 11:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE23B10E2C3;
	Sun, 15 Dec 2024 10:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KgkXRKX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A37910E376
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 10:19:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-300392cc4caso38444241fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 02:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734257975; x=1734862775; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yMp9ECjcCizbaBfmL+KANtoThCCesGXXmkJHkGhdU8M=;
 b=KgkXRKX7GWYawGRkSkyd3wquIz6Fujca46cWjaFSuCIuMJ7hQfsEB48UockSarZ8c9
 rXoRNSTa8FSSaReW7v/ue+ms6M2g0u9mKjP2cMYy+qLo0YgmEZkcUstfFKjNdbdkzqCm
 /y8hozyV+rDerCijjx7IAtsVZcCdBPvbkWgFC0Zt9hVlK03INVs7U1JgKdA9pjWe2JdQ
 FzK2x9qIwkkhQfBv4fdPtf3nNaHtA7iGGqmrz7IxpINvsMEYqaZhmRL0yzvRdu4yNp9/
 wrJnhBGvz7yG6++bKLz9l49JXAd6usZA2/KVNZ/rJl3n1ks8tckT1iRiSwxLKP5MwCnT
 BCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257975; x=1734862775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMp9ECjcCizbaBfmL+KANtoThCCesGXXmkJHkGhdU8M=;
 b=ufUi7GD4gHe2fisrx9GwsduCpU6bpf76uM0bxRjGgjW7jAumrjZ5wxKUQwh6Sin2LL
 xT7nnBtWI+KSJ17OG+ZHyY2kPhycqOr5CGohR6OWwJJQKpSMWBPZ98bkFbuswZAGepbp
 Eg8LxSvnj1Q2RgduQtMF5PUaqUFn6mZD+7pApbmHeSqhS5qNFfiFhqAjggzS9cGy6OPI
 UXkdhxqfqqhaxFtBM1kD+h1EHz3xKTVkg9sLSoTFCh+0j87kOQdq7d+wVUuTlhtcr7b0
 9wFPLffz0Qr/cxM1xPPPNrfw1JuB2cABfz/EWBKRqykbw8EeJFVLBwUEAKW2HyHksDA6
 I/HQ==
X-Gm-Message-State: AOJu0YzJxUatN2Z919kDWZGbUv9rpuHlXgmLUEqm41LxM6OvyZjOcUJe
 JOtsDyltjy4EIyGrzH19zG3OPdyeDEjD3aCwr864tRM0U/kt3oAHJes0Tv5/lbSjUh0TlKeQ3eu
 q
X-Gm-Gg: ASbGncuDSOGjLxrEd+Bs8K70n1lFTcJrQy7worMQh/pl55Y1Wo92dV1Lx59UNHu1rA9
 dJEkQ7VHnDRikSUtRZm7PzKU+pbAUg/IPXyHbj8qL6GE1uBwQjn5qMIibhbsBIkCOgbmNCnYQVi
 JJdR7jRT/g+OMkXdJ3j2cs3AQK/1onpqIFKQYToxsKiY/S+77XXeBvQAnKPuaLP+g3UdN34VeHa
 LSmi1FsRCciVHqHh1eiy44/URDiM5p86SIhKjaEfzPiaWBE9053sDvEEv/eyHfh
X-Google-Smtp-Source: AGHT+IHUlLPNgg9w4rON7IoCnabAPJLReu5NtyAO857RgPH8pf9oDAACH8KjER50Za1HyZUxPAWZ+g==
X-Received: by 2002:a2e:3c06:0:b0:302:3355:f756 with SMTP id
 38308e7fff4ca-30254502ce0mr27564211fa.35.1734257974493; 
 Sun, 15 Dec 2024 02:19:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034401d546sm5270851fa.11.2024.12.15.02.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:19:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 12:19:24 +0200
Subject: [PATCH v2 2/2] drm/nouveau: vendor in drm_encoder_slave API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-nouveau-encoder-slave-v2-2-ef7a0e687242@linaro.org>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
In-Reply-To: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=38592;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=d6gprNWDxigG9xxClmEoB2rp5ZzNAigVcV/fmzc7g3k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXq0vWTjB0wy4eN/ag54SUPUcNyS9oRgfq27ei
 iOCgjiw8EqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ16tLwAKCRCLPIo+Aiko
 1ZzAB/0Y6ASjVeZSXgfN0CbeZx+FZlNyXRWWZjfjl3KxliOOQ6IHc9XhxrPVL94IeHZmxbIwI0H
 MGA7C4pY0lsIJH7cQ9tPeYq18FXLKJ7gedKQy1F4UDY5rFwrJ4jGRdlBYNT1cjNJAmjpY5VpHrs
 y9rKV2/KS4bbu2b+GV8Cz5/N+yVd874sgkvFvXwoyeWPp3VS1YifascCC0C1kb7QdA5+jGliOj/
 OsHjbAaTNsnkI03J8mkcnYyv12H1uiPE4ykKefXzl+G6iwN3NM8mJZndfhxXVFXYn9vG8SAR5P/
 Lq5ubatL0MPEEfw4bXN5HN2SlmG/YeKMaJ4NbGwQaLFzCFpL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Nouveau driver is the only user of the drm_encoder_slave API. Rework
necessary bits of drm_encoder_slave into the nouveau_i2c_encoder API and
drop drm_encoder_slave.c from the DRM KMS helper.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   1 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  10 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c  |  30 +++---
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c |   8 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h |   4 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c  |  30 +++---
 .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  18 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
 .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 109 ++++++++-------------
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
 13 files changed, 127 insertions(+), 192 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc56772077973c864df71e4b8e0bf99b..85af94bb907d6cdbad7078e2667426e479b1069f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -135,7 +135,6 @@ drm_kms_helper-y := \
 	drm_atomic_state_helper.o \
 	drm_crtc_helper.o \
 	drm_damage_helper.o \
-	drm_encoder_slave.o \
 	drm_flip_work.o \
 	drm_format_helper.o \
 	drm_gem_atomic_helper.o \
diff --git a/drivers/gpu/drm/nouveau/dispnv04/Kbuild b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
index 949802882ebd53c15e124c218a092af9693d36bc..4c7bc6bb81b325ac22286372b0a3e4f1390e78be 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/Kbuild
+++ b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
@@ -6,6 +6,7 @@ nouveau-y += dispnv04/dac.o
 nouveau-y += dispnv04/dfp.o
 nouveau-y += dispnv04/disp.o
 nouveau-y += dispnv04/hw.o
+nouveau-y += dispnv04/nouveau_i2c_encoder.o
 nouveau-y += dispnv04/overlay.o
 nouveau-y += dispnv04/tvmodesnv17.o
 nouveau-y += dispnv04/tvnv04.o
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index 28a42ab5cb900ebe8a526e154f9e90598333356c..e211602298a5fb9f513203720b3ee5d37cd21122 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -171,7 +171,7 @@ static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
 	list_for_each_entry(slave, &dev->mode_config.encoder_list, head) {
 		struct dcb_output *slave_dcb = nouveau_encoder(slave)->dcb;
 
-		if (slave_dcb->type == DCB_OUTPUT_TMDS && get_slave_funcs(slave) &&
+		if (slave_dcb->type == DCB_OUTPUT_TMDS && get_encoder_i2c_funcs(slave) &&
 		    slave_dcb->tmdsconf.slave_addr == dcb->tmdsconf.slave_addr)
 			return slave;
 	}
@@ -473,7 +473,7 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
 	/* Init external transmitters */
 	slave_encoder = get_tmds_slave(encoder);
 	if (slave_encoder)
-		get_slave_funcs(slave_encoder)->mode_set(
+		get_encoder_i2c_funcs(slave_encoder)->mode_set(
 			slave_encoder, &nv_encoder->mode, &nv_encoder->mode);
 
 	helper->dpms(encoder, DRM_MODE_DPMS_ON);
@@ -614,8 +614,8 @@ static void nv04_dfp_destroy(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 
-	if (get_slave_funcs(encoder))
-		get_slave_funcs(encoder)->destroy(encoder);
+	if (get_encoder_i2c_funcs(encoder))
+		get_encoder_i2c_funcs(encoder)->destroy(encoder);
 
 	drm_encoder_cleanup(encoder);
 	kfree(nv_encoder);
@@ -649,7 +649,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
 	if (type < 0)
 		return;
 
-	drm_i2c_encoder_init(dev, to_encoder_slave(encoder),
+	nouveau_i2c_encoder_init(dev, to_encoder_i2c(encoder),
 			     &bus->i2c, &info[type].dev);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
index 131512a5f3bd996ad1e2eb869ffa09837daba0c7..c9249b58e65459ae61898a246c36da2c3bfe0844 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
@@ -47,14 +47,14 @@ static void ch7006_encoder_destroy(struct drm_encoder *encoder)
 	drm_property_destroy(encoder->dev, priv->scale_property);
 
 	kfree(priv);
-	to_encoder_slave(encoder)->slave_priv = NULL;
+	to_encoder_i2c(encoder)->encoder_i2c_priv = NULL;
 
-	drm_i2c_encoder_destroy(encoder);
+	nouveau_i2c_encoder_destroy(encoder);
 }
 
 static void  ch7006_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_state *state = &priv->state;
 
@@ -71,7 +71,7 @@ static void  ch7006_encoder_dpms(struct drm_encoder *encoder, int mode)
 
 static void ch7006_encoder_save(struct drm_encoder *encoder)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 
 	ch7006_dbg(client, "\n");
@@ -81,7 +81,7 @@ static void ch7006_encoder_save(struct drm_encoder *encoder)
 
 static void ch7006_encoder_restore(struct drm_encoder *encoder)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 
 	ch7006_dbg(client, "\n");
@@ -116,7 +116,7 @@ static void ch7006_encoder_mode_set(struct drm_encoder *encoder,
 				     struct drm_display_mode *drm_mode,
 				     struct drm_display_mode *adjusted_mode)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_encoder_params *params = &priv->params;
 	struct ch7006_state *state = &priv->state;
@@ -179,7 +179,7 @@ static void ch7006_encoder_mode_set(struct drm_encoder *encoder,
 static enum drm_connector_status ch7006_encoder_detect(struct drm_encoder *encoder,
 						       struct drm_connector *connector)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_state *state = &priv->state;
 	int det;
@@ -285,7 +285,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 				       struct drm_property *property,
 				       uint64_t val)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_state *state = &priv->state;
 	struct drm_mode_config *conf = &encoder->dev->mode_config;
@@ -370,7 +370,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 	return 0;
 }
 
-static const struct drm_encoder_slave_funcs ch7006_encoder_funcs = {
+static const struct nouveau_i2c_encoder_funcs ch7006_encoder_funcs = {
 	.set_config = ch7006_encoder_set_config,
 	.destroy = ch7006_encoder_destroy,
 	.dpms = ch7006_encoder_dpms,
@@ -437,7 +437,7 @@ static int ch7006_resume(struct device *dev)
 
 static int ch7006_encoder_init(struct i2c_client *client,
 			       struct drm_device *dev,
-			       struct drm_encoder_slave *encoder)
+			       struct nouveau_i2c_encoder *encoder)
 {
 	struct ch7006_priv *priv;
 	int i;
@@ -448,8 +448,8 @@ static int ch7006_encoder_init(struct i2c_client *client,
 	if (!priv)
 		return -ENOMEM;
 
-	encoder->slave_priv = priv;
-	encoder->slave_funcs = &ch7006_encoder_funcs;
+	encoder->encoder_i2c_priv = priv;
+	encoder->encoder_i2c_funcs = &ch7006_encoder_funcs;
 
 	priv->norm = TV_NORM_PAL;
 	priv->select_subconnector = DRM_MODE_SUBCONNECTOR_Automatic;
@@ -495,7 +495,7 @@ static const struct dev_pm_ops ch7006_pm_ops = {
 	.resume = ch7006_resume,
 };
 
-static struct drm_i2c_encoder_driver ch7006_driver = {
+static struct nouveau_i2c_encoder_driver ch7006_driver = {
 	.i2c_driver = {
 		.probe = ch7006_probe,
 		.remove = ch7006_remove,
@@ -516,12 +516,12 @@ static struct drm_i2c_encoder_driver ch7006_driver = {
 
 static int __init ch7006_init(void)
 {
-	return drm_i2c_encoder_register(THIS_MODULE, &ch7006_driver);
+	return i2c_add_driver(&ch7006_driver.i2c_driver);
 }
 
 static void __exit ch7006_exit(void)
 {
-	drm_i2c_encoder_unregister(&ch7006_driver);
+	i2c_del_driver(&ch7006_driver.i2c_driver);
 }
 
 int ch7006_debug;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
index 6afe6d0ee6306db57c3e3bafe2bf1b0b1b49aea5..e58d94451959a2afc01f570ea620d8e6721cb7af 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
@@ -198,7 +198,7 @@ const struct ch7006_mode *ch7006_lookup_mode(struct drm_encoder *encoder,
 
 void ch7006_setup_levels(struct drm_encoder *encoder)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	uint8_t *regs = priv->state.regs;
 	const struct ch7006_tv_norm_info *norm = &ch7006_tv_norms[priv->norm];
@@ -229,7 +229,7 @@ void ch7006_setup_levels(struct drm_encoder *encoder)
 
 void ch7006_setup_subcarrier(struct drm_encoder *encoder)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_state *state = &priv->state;
 	const struct ch7006_tv_norm_info *norm = &ch7006_tv_norms[priv->norm];
@@ -253,7 +253,7 @@ void ch7006_setup_subcarrier(struct drm_encoder *encoder)
 
 void ch7006_setup_pll(struct drm_encoder *encoder)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	uint8_t *regs = priv->state.regs;
 	const struct ch7006_mode *mode = priv->mode;
@@ -324,7 +324,7 @@ void ch7006_setup_power_state(struct drm_encoder *encoder)
 
 void ch7006_setup_properties(struct drm_encoder *encoder)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_state *state = &priv->state;
 	const struct ch7006_tv_norm_info *norm = &ch7006_tv_norms[priv->norm];
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
index 8136f8cd8f9b859ccf915e295c783f9fc8321c2e..70c4fc8a181035b8960a8fcce12b5a1ad76e58b7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
@@ -27,9 +27,9 @@
 #ifndef __NOUVEAU_I2C_CH7006_PRIV_H__
 #define __NOUVEAU_I2C_CH7006_PRIV_H__
 
-#include <drm/drm_encoder_slave.h>
 #include <drm/drm_probe_helper.h>
 
+#include <i2c/encoder_i2c.h>
 #include <i2c/ch7006.h>
 
 typedef int64_t fixed;
@@ -100,7 +100,7 @@ struct ch7006_priv {
 };
 
 #define to_ch7006_priv(x) \
-	((struct ch7006_priv *)to_encoder_slave(x)->slave_priv)
+	((struct ch7006_priv *)to_encoder_i2c(x)->encoder_i2c_priv)
 
 extern int ch7006_debug;
 extern char *ch7006_tv_norm;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
index 74fc961c0d0de06f1fe8dd93d351452cd20cead7..80758e796b5d794f8e05c1b68b3383e1af3d0df5 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
@@ -27,10 +27,10 @@
 #include <linux/module.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_encoder_slave.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <i2c/encoder_i2c.h>
 #include <i2c/sil164.h>
 
 struct sil164_priv {
@@ -42,7 +42,7 @@ struct sil164_priv {
 };
 
 #define to_sil164_priv(x) \
-	((struct sil164_priv *)to_encoder_slave(x)->slave_priv)
+	((struct sil164_priv *)to_encoder_i2c(x)->encoder_i2c_priv)
 
 #define sil164_dbg(client, format, ...) do {				\
 		if (drm_debug_enabled(DRM_UT_KMS))			\
@@ -222,7 +222,7 @@ sil164_encoder_dpms(struct drm_encoder *encoder, int mode)
 	bool on = (mode == DRM_MODE_DPMS_ON);
 	bool duallink = (on && encoder->crtc->mode.clock > 165000);
 
-	sil164_set_power_state(drm_i2c_encoder_get_client(encoder), on);
+	sil164_set_power_state(nouveau_i2c_encoder_get_client(encoder), on);
 
 	if (priv->duallink_slave)
 		sil164_set_power_state(priv->duallink_slave, duallink);
@@ -233,7 +233,7 @@ sil164_encoder_save(struct drm_encoder *encoder)
 {
 	struct sil164_priv *priv = to_sil164_priv(encoder);
 
-	sil164_save_state(drm_i2c_encoder_get_client(encoder),
+	sil164_save_state(nouveau_i2c_encoder_get_client(encoder),
 			  priv->saved_state);
 
 	if (priv->duallink_slave)
@@ -246,7 +246,7 @@ sil164_encoder_restore(struct drm_encoder *encoder)
 {
 	struct sil164_priv *priv = to_sil164_priv(encoder);
 
-	sil164_restore_state(drm_i2c_encoder_get_client(encoder),
+	sil164_restore_state(nouveau_i2c_encoder_get_client(encoder),
 			     priv->saved_state);
 
 	if (priv->duallink_slave)
@@ -278,7 +278,7 @@ sil164_encoder_mode_set(struct drm_encoder *encoder,
 	struct sil164_priv *priv = to_sil164_priv(encoder);
 	bool duallink = adjusted_mode->clock > 165000;
 
-	sil164_init_state(drm_i2c_encoder_get_client(encoder),
+	sil164_init_state(nouveau_i2c_encoder_get_client(encoder),
 			  &priv->config, duallink);
 
 	if (priv->duallink_slave)
@@ -292,7 +292,7 @@ static enum drm_connector_status
 sil164_encoder_detect(struct drm_encoder *encoder,
 		      struct drm_connector *connector)
 {
-	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(encoder);
 
 	if (sil164_read(client, SIL164_DETECT) & SIL164_DETECT_HOTPLUG_STAT)
 		return connector_status_connected;
@@ -331,10 +331,10 @@ sil164_encoder_destroy(struct drm_encoder *encoder)
 	i2c_unregister_device(priv->duallink_slave);
 
 	kfree(priv);
-	drm_i2c_encoder_destroy(encoder);
+	nouveau_i2c_encoder_destroy(encoder);
 }
 
-static const struct drm_encoder_slave_funcs sil164_encoder_funcs = {
+static const struct nouveau_i2c_encoder_funcs sil164_encoder_funcs = {
 	.set_config = sil164_encoder_set_config,
 	.destroy = sil164_encoder_destroy,
 	.dpms = sil164_encoder_dpms,
@@ -394,7 +394,7 @@ sil164_detect_slave(struct i2c_client *client)
 static int
 sil164_encoder_init(struct i2c_client *client,
 		    struct drm_device *dev,
-		    struct drm_encoder_slave *encoder)
+		    struct nouveau_i2c_encoder *encoder)
 {
 	struct sil164_priv *priv;
 	struct i2c_client *slave_client;
@@ -403,8 +403,8 @@ sil164_encoder_init(struct i2c_client *client,
 	if (!priv)
 		return -ENOMEM;
 
-	encoder->slave_priv = priv;
-	encoder->slave_funcs = &sil164_encoder_funcs;
+	encoder->encoder_i2c_priv = priv;
+	encoder->encoder_i2c_funcs = &sil164_encoder_funcs;
 
 	slave_client = sil164_detect_slave(client);
 	if (!IS_ERR(slave_client))
@@ -419,7 +419,7 @@ static const struct i2c_device_id sil164_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, sil164_ids);
 
-static struct drm_i2c_encoder_driver sil164_driver = {
+static struct nouveau_i2c_encoder_driver sil164_driver = {
 	.i2c_driver = {
 		.probe = sil164_probe,
 		.driver = {
@@ -435,13 +435,13 @@ static struct drm_i2c_encoder_driver sil164_driver = {
 static int __init
 sil164_init(void)
 {
-	return drm_i2c_encoder_register(THIS_MODULE, &sil164_driver);
+	return i2c_add_driver(&sil164_driver.i2c_driver);
 }
 
 static void __exit
 sil164_exit(void)
 {
-	drm_i2c_encoder_unregister(&sil164_driver);
+	i2c_del_driver(&sil164_driver.i2c_driver);
 }
 
 MODULE_AUTHOR("Francisco Jerez <currojerez@riseup.net>");
diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c
similarity index 57%
rename from drivers/gpu/drm/drm_encoder_slave.c
rename to drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c
index e464429d32df6e2eeb541d92c5a486b4ee7a21ec..58270719cc3db6a2a0205196bf18aba139da2df4 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c
@@ -26,10 +26,10 @@
 
 #include <linux/module.h>
 
-#include <drm/drm_encoder_slave.h>
+#include <i2c/encoder_i2c.h>
 
 /**
- * drm_i2c_encoder_init - Initialize an I2C slave encoder
+ * nouveau_i2c_encoder_init - Initialize an I2C slave encoder
  * @dev:	DRM device.
  * @encoder:    Encoder to be attached to the I2C device. You aren't
  *		required to have called drm_encoder_init() before.
@@ -40,7 +40,7 @@
  *
  * Create an I2C device on the specified bus (the module containing its
  * driver is transparently loaded) and attach it to the specified
- * &drm_encoder_slave. The @slave_funcs field will be initialized with
+ * &nouveau_i2c_encoder. The @encoder_i2c_funcs field will be initialized with
  * the hooks provided by the slave driver.
  *
  * If @info.platform_data is non-NULL it will be used as the initial
@@ -49,14 +49,14 @@
  * Returns 0 on success or a negative errno on failure, in particular,
  * -ENODEV is returned when no matching driver is found.
  */
-int drm_i2c_encoder_init(struct drm_device *dev,
-			 struct drm_encoder_slave *encoder,
+int nouveau_i2c_encoder_init(struct drm_device *dev,
+			 struct nouveau_i2c_encoder *encoder,
 			 struct i2c_adapter *adap,
 			 const struct i2c_board_info *info)
 {
 	struct module *module = NULL;
 	struct i2c_client *client;
-	struct drm_i2c_encoder_driver *encoder_drv;
+	struct nouveau_i2c_encoder_driver *encoder_drv;
 	int err = 0;
 
 	request_module("%s%s", I2C_MODULE_PREFIX, info->type);
@@ -73,16 +73,16 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 		goto fail_unregister;
 	}
 
-	encoder->bus_priv = client;
+	encoder->i2c_client = client;
 
-	encoder_drv = to_drm_i2c_encoder_driver(to_i2c_driver(client->dev.driver));
+	encoder_drv = to_nouveau_i2c_encoder_driver(to_i2c_driver(client->dev.driver));
 
 	err = encoder_drv->encoder_init(client, dev, encoder);
 	if (err)
 		goto fail_module_put;
 
 	if (info->platform_data)
-		encoder->slave_funcs->set_config(&encoder->base,
+		encoder->encoder_i2c_funcs->set_config(&encoder->base,
 						 info->platform_data);
 
 	return 0;
@@ -93,90 +93,53 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 	i2c_unregister_device(client);
 	return err;
 }
-EXPORT_SYMBOL(drm_i2c_encoder_init);
 
 /**
- * drm_i2c_encoder_destroy - Unregister the I2C device backing an encoder
+ * nouveau_i2c_encoder_destroy - Unregister the I2C device backing an encoder
  * @drm_encoder:	Encoder to be unregistered.
  *
  * This should be called from the @destroy method of an I2C slave
  * encoder driver once I2C access is no longer needed.
  */
-void drm_i2c_encoder_destroy(struct drm_encoder *drm_encoder)
+void nouveau_i2c_encoder_destroy(struct drm_encoder *drm_encoder)
 {
-	struct drm_encoder_slave *encoder = to_encoder_slave(drm_encoder);
-	struct i2c_client *client = drm_i2c_encoder_get_client(drm_encoder);
+	struct nouveau_i2c_encoder *encoder = to_encoder_i2c(drm_encoder);
+	struct i2c_client *client = nouveau_i2c_encoder_get_client(drm_encoder);
 	struct module *module = client->dev.driver->owner;
 
 	i2c_unregister_device(client);
-	encoder->bus_priv = NULL;
+	encoder->i2c_client = NULL;
 
 	module_put(module);
 }
-EXPORT_SYMBOL(drm_i2c_encoder_destroy);
+EXPORT_SYMBOL(nouveau_i2c_encoder_destroy);
 
 /*
  * Wrapper fxns which can be plugged in to drm_encoder_helper_funcs:
  */
 
-static inline const struct drm_encoder_slave_funcs *
-get_slave_funcs(struct drm_encoder *enc)
-{
-	return to_encoder_slave(enc)->slave_funcs;
-}
-
-void drm_i2c_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	get_slave_funcs(encoder)->dpms(encoder, mode);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_dpms);
-
-bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
+bool nouveau_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
 {
-	if (!get_slave_funcs(encoder)->mode_fixup)
+	if (!get_encoder_i2c_funcs(encoder)->mode_fixup)
 		return true;
 
-	return get_slave_funcs(encoder)->mode_fixup(encoder, mode, adjusted_mode);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_mode_fixup);
-
-void drm_i2c_encoder_prepare(struct drm_encoder *encoder)
-{
-	drm_i2c_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_prepare);
-
-void drm_i2c_encoder_commit(struct drm_encoder *encoder)
-{
-	drm_i2c_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
-}
-EXPORT_SYMBOL(drm_i2c_encoder_commit);
-
-void drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode)
-{
-	get_slave_funcs(encoder)->mode_set(encoder, mode, adjusted_mode);
+	return get_encoder_i2c_funcs(encoder)->mode_fixup(encoder, mode, adjusted_mode);
 }
-EXPORT_SYMBOL(drm_i2c_encoder_mode_set);
 
-enum drm_connector_status drm_i2c_encoder_detect(struct drm_encoder *encoder,
+enum drm_connector_status nouveau_i2c_encoder_detect(struct drm_encoder *encoder,
 	    struct drm_connector *connector)
 {
-	return get_slave_funcs(encoder)->detect(encoder, connector);
+	return get_encoder_i2c_funcs(encoder)->detect(encoder, connector);
 }
-EXPORT_SYMBOL(drm_i2c_encoder_detect);
 
-void drm_i2c_encoder_save(struct drm_encoder *encoder)
+void nouveau_i2c_encoder_save(struct drm_encoder *encoder)
 {
-	get_slave_funcs(encoder)->save(encoder);
+	get_encoder_i2c_funcs(encoder)->save(encoder);
 }
-EXPORT_SYMBOL(drm_i2c_encoder_save);
 
-void drm_i2c_encoder_restore(struct drm_encoder *encoder)
+void nouveau_i2c_encoder_restore(struct drm_encoder *encoder)
 {
-	get_slave_funcs(encoder)->restore(encoder);
+	get_encoder_i2c_funcs(encoder)->restore(encoder);
 }
-EXPORT_SYMBOL(drm_i2c_encoder_restore);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index 67f3e0ac0e109b223ca8ec4ddc4e688247373b2e..0ce369d7b773ac3753fe907acdee3b402644cc0e 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -99,7 +99,7 @@ static void nv04_tv_dpms(struct drm_encoder *encoder, int mode)
 
 	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_PLL_COEFF_SELECT, state->pllsel);
 
-	get_slave_funcs(encoder)->dpms(encoder, mode);
+	get_encoder_i2c_funcs(encoder)->dpms(encoder, mode);
 }
 
 static void nv04_tv_bind(struct drm_device *dev, int head, bool bind)
@@ -158,7 +158,7 @@ static void nv04_tv_mode_set(struct drm_encoder *encoder,
 	regp->tv_vskew = 1;
 	regp->tv_vsync_delay = 1;
 
-	get_slave_funcs(encoder)->mode_set(encoder, mode, adjusted_mode);
+	get_encoder_i2c_funcs(encoder)->mode_set(encoder, mode, adjusted_mode);
 }
 
 static void nv04_tv_commit(struct drm_encoder *encoder)
@@ -178,7 +178,7 @@ static void nv04_tv_commit(struct drm_encoder *encoder)
 
 static void nv04_tv_destroy(struct drm_encoder *encoder)
 {
-	get_slave_funcs(encoder)->destroy(encoder);
+	get_encoder_i2c_funcs(encoder)->destroy(encoder);
 	drm_encoder_cleanup(encoder);
 
 	kfree(encoder->helper_private);
@@ -191,11 +191,11 @@ static const struct drm_encoder_funcs nv04_tv_funcs = {
 
 static const struct drm_encoder_helper_funcs nv04_tv_helper_funcs = {
 	.dpms = nv04_tv_dpms,
-	.mode_fixup = drm_i2c_encoder_mode_fixup,
+	.mode_fixup = nouveau_i2c_encoder_mode_fixup,
 	.prepare = nv04_tv_prepare,
 	.commit = nv04_tv_commit,
 	.mode_set = nv04_tv_mode_set,
-	.detect = drm_i2c_encoder_detect,
+	.detect = nouveau_i2c_encoder_detect,
 };
 
 int
@@ -226,8 +226,8 @@ nv04_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 			 NULL);
 	drm_encoder_helper_add(encoder, &nv04_tv_helper_funcs);
 
-	nv_encoder->enc_save = drm_i2c_encoder_save;
-	nv_encoder->enc_restore = drm_i2c_encoder_restore;
+	nv_encoder->enc_save = nouveau_i2c_encoder_save;
+	nv_encoder->enc_restore = nouveau_i2c_encoder_restore;
 
 	encoder->possible_crtcs = entry->heads;
 	encoder->possible_clones = 0;
@@ -235,14 +235,14 @@ nv04_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 	nv_encoder->or = ffs(entry->or) - 1;
 
 	/* Run the slave-specific initialization */
-	ret = drm_i2c_encoder_init(dev, to_encoder_slave(encoder),
+	ret = nouveau_i2c_encoder_init(dev, to_encoder_i2c(encoder),
 				   &bus->i2c,
 				   &nv04_tv_encoder_info[type].dev);
 	if (ret < 0)
 		goto fail_cleanup;
 
 	/* Attach it to the specified connector. */
-	get_slave_funcs(encoder)->create_resources(encoder, connector);
+	get_encoder_i2c_funcs(encoder)->create_resources(encoder, connector);
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 3ecb101d23e949b753b873d24eec01ad6fe7f5d6..50326691444322f282729e108b4ab88bd9cbc14a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -779,7 +779,7 @@ static const struct drm_encoder_helper_funcs nv17_tv_helper_funcs = {
 	.detect = nv17_tv_detect,
 };
 
-static const struct drm_encoder_slave_funcs nv17_tv_slave_funcs = {
+static const struct nouveau_i2c_encoder_funcs nv17_tv_encoder_i2c_funcs = {
 	.get_modes = nv17_tv_get_modes,
 	.mode_valid = nv17_tv_mode_valid,
 	.create_resources = nv17_tv_create_resources,
@@ -818,7 +818,7 @@ nv17_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 	drm_encoder_init(dev, encoder, &nv17_tv_funcs, DRM_MODE_ENCODER_TVDAC,
 			 NULL);
 	drm_encoder_helper_add(encoder, &nv17_tv_helper_funcs);
-	to_encoder_slave(encoder)->slave_funcs = &nv17_tv_slave_funcs;
+	to_encoder_i2c(encoder)->encoder_i2c_funcs = &nv17_tv_encoder_i2c_funcs;
 
 	tv_enc->base.enc_save = nv17_tv_save;
 	tv_enc->base.enc_restore = nv17_tv_restore;
diff --git a/include/drm/drm_encoder_slave.h b/drivers/gpu/drm/nouveau/include/i2c/encoder_i2c.h
similarity index 62%
rename from include/drm/drm_encoder_slave.h
rename to drivers/gpu/drm/nouveau/include/i2c/encoder_i2c.h
index 49172166a164474f43e4afb2eeeb3cde8ae7c61a..f12f44415b79c336e6ecfa163cc780a0bcbc5ca5 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/drivers/gpu/drm/nouveau/include/i2c/encoder_i2c.h
@@ -24,8 +24,8 @@
  *
  */
 
-#ifndef __DRM_ENCODER_SLAVE_H__
-#define __DRM_ENCODER_SLAVE_H__
+#ifndef __NOUVEAU_ENCODER_I2C_H__
+#define __NOUVEAU_ENCODER_I2C_H__
 
 #include <linux/i2c.h>
 
@@ -33,7 +33,7 @@
 #include <drm/drm_encoder.h>
 
 /**
- * struct drm_encoder_slave_funcs - Entry points exposed by a slave encoder driver
+ * struct nouveau_i2c_encoder_funcs - Entry points exposed by a I2C encoder driver
  *
  * Most of its members are analogous to the function pointers in
  * &drm_encoder_helper_funcs and they can optionally be used to
@@ -41,7 +41,7 @@
  * @set_property) will typically be wrapped around and only be called
  * if the encoder is the currently selected one for the connector.
  */
-struct drm_encoder_slave_funcs {
+struct nouveau_i2c_encoder_funcs {
 	/**
 	 * @set_config: Initialize any encoder-specific modesetting parameters.
 	 * The meaning of the @params parameter is implementation dependent. It
@@ -58,24 +58,23 @@ struct drm_encoder_slave_funcs {
 	void (*destroy)(struct drm_encoder *encoder);
 
 	/**
-	 * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback. Wrapped
-	 * by drm_i2c_encoder_dpms().
+	 * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback.
 	 */
 	void (*dpms)(struct drm_encoder *encoder, int mode);
 
 	/**
-	 * @save: Save state. Wrapped by drm_i2c_encoder_save().
+	 * @save: Save state. Wrapped by nouveau_i2c_encoder_save().
 	 */
 	void (*save)(struct drm_encoder *encoder);
 
 	/**
-	 * @restore: Restore state. Wrapped by drm_i2c_encoder_restore().
+	 * @restore: Restore state. Wrapped by nouveau_i2c_encoder_restore().
 	 */
 	void (*restore)(struct drm_encoder *encoder);
 
 	/**
 	 * @mode_fixup: Analogous to &drm_encoder_helper_funcs @mode_fixup
-	 * callback. Wrapped by drm_i2c_encoder_mode_fixup().
+	 * callback. Wrapped by nouveau_i2c_encoder_mode_fixup().
 	 */
 	bool (*mode_fixup)(struct drm_encoder *encoder,
 			   const struct drm_display_mode *mode,
@@ -88,7 +87,7 @@ struct drm_encoder_slave_funcs {
 			  struct drm_display_mode *mode);
 	/**
 	 * @mode_set: Analogous to &drm_encoder_helper_funcs @mode_set
-	 * callback. Wrapped by drm_i2c_encoder_mode_set().
+	 * callback.
 	 */
 	void (*mode_set)(struct drm_encoder *encoder,
 			 struct drm_display_mode *mode,
@@ -96,7 +95,7 @@ struct drm_encoder_slave_funcs {
 
 	/**
 	 * @detect: Analogous to &drm_encoder_helper_funcs @detect
-	 * callback. Wrapped by drm_i2c_encoder_detect().
+	 * callback. Wrapped by nouveau_i2c_encoder_detect().
 	 */
 	enum drm_connector_status (*detect)(struct drm_encoder *encoder,
 					    struct drm_connector *connector);
@@ -120,54 +119,59 @@ struct drm_encoder_slave_funcs {
 };
 
 /**
- * struct drm_encoder_slave - Slave encoder struct
+ * struct nouveau_i2c_encoder - I2C encoder struct
  *
- * A &drm_encoder_slave has two sets of callbacks, @slave_funcs and the
+ * A &nouveau_i2c_encoder has two sets of callbacks, @encoder_i2c_funcs and the
  * ones in @base. The former are never actually called by the common
  * CRTC code, it's just a convenience for splitting the encoder
  * functions in an upper, GPU-specific layer and a (hopefully)
  * GPU-agnostic lower layer: It's the GPU driver responsibility to
- * call the slave methods when appropriate.
+ * call the nouveau_i2c_encoder methods when appropriate.
  *
- * drm_i2c_encoder_init() provides a way to get an implementation of
+ * nouveau_i2c_encoder_init() provides a way to get an implementation of
  * this.
  */
-struct drm_encoder_slave {
+struct nouveau_i2c_encoder {
 	/**
 	 * @base: DRM encoder object.
 	 */
 	struct drm_encoder base;
 
 	/**
-	 * @slave_funcs: Slave encoder callbacks.
+	 * @encoder_i2c_funcs: I2C encoder callbacks.
 	 */
-	const struct drm_encoder_slave_funcs *slave_funcs;
+	const struct nouveau_i2c_encoder_funcs *encoder_i2c_funcs;
 
 	/**
-	 * @slave_priv: Slave encoder private data.
+	 * @encoder_i2c_priv: I2C encoder private data.
 	 */
-	void *slave_priv;
+	void *encoder_i2c_priv;
 
 	/**
-	 * @bus_priv: Bus specific data.
+	 * @i2c_client: corresponding I2C client structure
 	 */
-	void *bus_priv;
+	struct i2c_client *i2c_client;
 };
-#define to_encoder_slave(x) container_of((x), struct drm_encoder_slave, base)
+#define to_encoder_i2c(x) container_of((x), struct nouveau_i2c_encoder, base)
 
-int drm_i2c_encoder_init(struct drm_device *dev,
-			 struct drm_encoder_slave *encoder,
+int nouveau_i2c_encoder_init(struct drm_device *dev,
+			 struct nouveau_i2c_encoder *encoder,
 			 struct i2c_adapter *adap,
 			 const struct i2c_board_info *info);
 
+static inline const struct nouveau_i2c_encoder_funcs *
+get_encoder_i2c_funcs(struct drm_encoder *enc)
+{
+	return to_encoder_i2c(enc)->encoder_i2c_funcs;
+}
 
 /**
- * struct drm_i2c_encoder_driver
+ * struct nouveau_i2c_encoder_driver
  *
  * Describes a device driver for an encoder connected to the GPU through an I2C
  * bus.
  */
-struct drm_i2c_encoder_driver {
+struct nouveau_i2c_encoder_driver {
 	/**
 	 * @i2c_driver: I2C device driver description.
 	 */
@@ -175,67 +179,40 @@ struct drm_i2c_encoder_driver {
 
 	/**
 	 * @encoder_init: Callback to allocate any per-encoder data structures
-	 * and to initialize the @slave_funcs and (optionally) @slave_priv
+	 * and to initialize the @encoder_i2c_funcs and (optionally) @encoder_i2c_priv
 	 * members of @encoder.
 	 */
 	int (*encoder_init)(struct i2c_client *client,
 			    struct drm_device *dev,
-			    struct drm_encoder_slave *encoder);
+			    struct nouveau_i2c_encoder *encoder);
 
 };
-#define to_drm_i2c_encoder_driver(x) container_of((x),			\
-						  struct drm_i2c_encoder_driver, \
+#define to_nouveau_i2c_encoder_driver(x) container_of((x),			\
+						  struct nouveau_i2c_encoder_driver, \
 						  i2c_driver)
 
 /**
- * drm_i2c_encoder_get_client - Get the I2C client corresponding to an encoder
+ * nouveau_i2c_encoder_get_client - Get the I2C client corresponding to an encoder
  * @encoder: The encoder
  */
-static inline struct i2c_client *drm_i2c_encoder_get_client(struct drm_encoder *encoder)
-{
-	return (struct i2c_client *)to_encoder_slave(encoder)->bus_priv;
-}
-
-/**
- * drm_i2c_encoder_register - Register an I2C encoder driver
- * @owner:	Module containing the driver.
- * @driver:	Driver to be registered.
- */
-static inline int drm_i2c_encoder_register(struct module *owner,
-					   struct drm_i2c_encoder_driver *driver)
+static inline struct i2c_client *nouveau_i2c_encoder_get_client(struct drm_encoder *encoder)
 {
-	return i2c_register_driver(owner, &driver->i2c_driver);
+	return to_encoder_i2c(encoder)->i2c_client;
 }
 
-/**
- * drm_i2c_encoder_unregister - Unregister an I2C encoder driver
- * @driver:	Driver to be unregistered.
- */
-static inline void drm_i2c_encoder_unregister(struct drm_i2c_encoder_driver *driver)
-{
-	i2c_del_driver(&driver->i2c_driver);
-}
-
-void drm_i2c_encoder_destroy(struct drm_encoder *encoder);
-
+void nouveau_i2c_encoder_destroy(struct drm_encoder *encoder);
 
 /*
  * Wrapper fxns which can be plugged in to drm_encoder_helper_funcs:
  */
 
-void drm_i2c_encoder_dpms(struct drm_encoder *encoder, int mode);
-bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
+bool nouveau_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode);
-void drm_i2c_encoder_prepare(struct drm_encoder *encoder);
-void drm_i2c_encoder_commit(struct drm_encoder *encoder);
-void drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode);
-enum drm_connector_status drm_i2c_encoder_detect(struct drm_encoder *encoder,
+enum drm_connector_status nouveau_i2c_encoder_detect(struct drm_encoder *encoder,
 	    struct drm_connector *connector);
-void drm_i2c_encoder_save(struct drm_encoder *encoder);
-void drm_i2c_encoder_restore(struct drm_encoder *encoder);
+void nouveau_i2c_encoder_save(struct drm_encoder *encoder);
+void nouveau_i2c_encoder_restore(struct drm_encoder *encoder);
 
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 8d5c9c74cbb90927036cee75f173f687617f14ec..c69a57d8d9ec456de510e5c1bb195c9dcc91b595 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -797,7 +797,7 @@ nouveau_connector_set_property(struct drm_connector *connector,
 						    property, value);
 	if (ret) {
 		if (nv_encoder && nv_encoder->dcb->type == DCB_OUTPUT_TV)
-			return get_slave_funcs(encoder)->set_property(
+			return get_encoder_i2c_funcs(encoder)->set_property(
 				encoder, connector, property, value);
 		return ret;
 	}
@@ -1015,7 +1015,7 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 		nouveau_connector_detect_depth(connector);
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_TV)
-		ret = get_slave_funcs(encoder)->get_modes(encoder, connector);
+		ret = get_encoder_i2c_funcs(encoder)->get_modes(encoder, connector);
 
 	if (nv_connector->type == DCB_CONNECTOR_LVDS ||
 	    nv_connector->type == DCB_CONNECTOR_LVDS_SPWG ||
@@ -1100,7 +1100,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 			max_clock = 350000;
 		break;
 	case DCB_OUTPUT_TV:
-		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
+		return get_encoder_i2c_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
 		return nv50_dp_mode_valid(nv_encoder, mode, NULL);
 	default:
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 333042fc493faec360b8d9713ab687836b986431..a7d06564f4c46cb766d6907f47ded3f8a7f5d33f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -31,7 +31,8 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
-#include <drm/drm_encoder_slave.h>
+
+#include <i2c/encoder_i2c.h>
 
 #include "dispnv04/disp.h"
 
@@ -43,7 +44,7 @@ struct nouveau_connector;
 struct nvkm_i2c_port;
 
 struct nouveau_encoder {
-	struct drm_encoder_slave base;
+	struct nouveau_i2c_encoder base;
 
 	struct dcb_output *dcb;
 	struct nvif_outp outp;
@@ -137,7 +138,7 @@ find_encoder(struct drm_connector *connector, int type);
 
 static inline struct nouveau_encoder *nouveau_encoder(struct drm_encoder *enc)
 {
-	struct drm_encoder_slave *slave = to_encoder_slave(enc);
+	struct nouveau_i2c_encoder *slave = to_encoder_i2c(enc);
 
 	return container_of(slave, struct nouveau_encoder, base);
 }
@@ -147,12 +148,6 @@ static inline struct drm_encoder *to_drm_encoder(struct nouveau_encoder *enc)
 	return &enc->base.base;
 }
 
-static inline const struct drm_encoder_slave_funcs *
-get_slave_funcs(struct drm_encoder *enc)
-{
-	return to_encoder_slave(enc)->slave_funcs;
-}
-
 /* nouveau_dp.c */
 enum nouveau_dp_status {
 	NOUVEAU_DP_NONE,

-- 
2.39.5

