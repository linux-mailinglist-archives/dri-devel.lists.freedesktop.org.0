Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E3A01CCD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 01:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEC510E13A;
	Mon,  6 Jan 2025 00:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="if+cI+e5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5A510E13A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 00:05:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso11774425f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 16:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736121859; x=1736726659; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SqFp9oEdnNDKOyuZj8QnSw2xBwNslvKmM9i/zZ7uRZM=;
 b=if+cI+e5MYWZ5uYm1752dDy9BCY2OHNowAdgAHZ8tUBwNrBfeQHFnJ4iWLmIBlfNJN
 gbGnUq3Kw2PBtG9orWgMk5aWgc/Umoac986Ix6s4/ajJCnbS4u5eleWgDAi62oVu78eR
 z1HR72jAhlc5OlVze9caIbjOBeHY6pE/bsejWhqu1Q2AJQ0nwRilJBAMvuTQ3UMuvoFB
 8dtG9+RaAnHdNrIxTsYhhR47SgXWtxyOIp3jKNDtb1jBWBUPVDtXFs0CB7PZfyCkqHYN
 oaaiBC7Sg5afri7e7WptMywIlBh6vjv7q46apFbJuXrBnLRQoIO/Nuw6/YmQHvQFrP9n
 vUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736121859; x=1736726659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SqFp9oEdnNDKOyuZj8QnSw2xBwNslvKmM9i/zZ7uRZM=;
 b=ZyO3eYCib1WYBhE3w96RuegECda7ujkHxLjPcs8gFNB/4amIty864Vt8Co4TXxFWXm
 IjsOsYwthPXBVQfXaZj1U/7fNOBNgaTf9naSNGUUtojfBp82cc7dQRRAvjbq/uW5d9Te
 hyv6Chm+nA+vtMIxkC/GOtq5GfvTDqnXm4nBhfLSbY/nBeiB08Ptu/qMM3L2xmRR0/kh
 wqVaeO+Q4enXweC55jeBVaoQEyp0E16HI5xxOTcjADXAaFUmXcxU4K2QRtLy2yzRhLNI
 sdjb20yh3fD1zrJyxsIEnfoaVQpbA4LixWewXk3V8cb8R7taXGue54Oku5xb2jxoGmkI
 PIOw==
X-Gm-Message-State: AOJu0Yw4rQ8muLNxNbLFAOc4VDaleKnirMcZzwQoDd8M35OnEh26Jam7
 SxHQPRZR1CXWezAQftqMNBXmU/w5rwy1Q2NBMdtb+34gB1N8PYDI9dJgrVGA2akrbSHaAh3Mbxm
 wdvk=
X-Gm-Gg: ASbGncuGVuRT5vUm1r3sE38ofhAUIW6iyBv5qNszvI3ZeRmXUtFN84/Lk2wvqXMyEhE
 94pfd7j9TJxWvoZL0WQY0uLBklVxV0Tiw0YM8y+M36liiUYwwnjV6ZNPbWxLMjTIxZ6gSKLkt32
 8lfgWzQgCb6S7fKm9p+dI/Gm/e4neQfYbmX9HzCdlJe5jJfDCCdS14qtmOBMzLpy1RtudS+VHoQ
 Rljg60Iw85HKGzsFCiCvLXH3rrODh7hBXLjMyinPagTTai3JwGaqzxB1/bLWwCH
X-Google-Smtp-Source: AGHT+IH3mfFnzwiN3//AFgnNq+GU0NQheb5OAmQLdsv0LVvHOf8yxrwk11QmVVxwnpJVM3WQ49gebw==
X-Received: by 2002:a05:6512:68e:b0:540:3566:5397 with SMTP id
 2adb3069b0e04-54229530300mr18402689e87.22.1736118024299; 
 Sun, 05 Jan 2025 15:00:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223821583sm4614034e87.203.2025.01.05.15.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 15:00:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 01:00:14 +0200
Subject: [PATCH v3 2/2] drm/nouveau: vendor in drm_encoder_slave API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-nouveau-encoder-slave-v3-2-1d37d2f2c67f@linaro.org>
References: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
In-Reply-To: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=39492;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5GwJPys9GzZMtV3mVaB8UggNMioJ7exi5D+YVS6dg3U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnew8AUCvH66qLq0Jg7U+I0XsPzVsfo8U0MH2kh
 QY+lTmdgiuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3sPAAAKCRCLPIo+Aiko
 1b24CACNjv0ubCDoewHUosinLmwGRam7jSUZxrsGDKjHW6H1115Gw606w4+jT3utyWO4zxI2EC4
 eA6fyxQxQ4AT03etQY3I0yiyQ4GE/Hxban1CCYm3FsIScCxEyssMuultKF9KAsD3UKWTiiSPDtB
 67di/TOb/7iPJoaGxcW7Qfjh64O/2d2ZhvEQxEOzm0PJHsB6Yl+9vtUVxRE4/C+58gXm6FCYDsb
 RfAH95514femZHzBA4PDzkejdOD0+Ul0xmqCWORCmKzJ+G1GjhXFoJaq+lsixGs7nnR8h8sPN0P
 woIn5zITk9YNCr8H6TIjXNNVXuUzG2NdEncIIBD1mVZLep/y
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
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  15 +--
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c  |  30 ++---
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c |   8 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h |   4 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c  |  30 ++---
 .../dispnv04/nouveau_i2c_encoder.c}                |  95 +++++-----------
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  22 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 121 +++++++++------------
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  10 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
 13 files changed, 147 insertions(+), 207 deletions(-)

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
index 25fa41edcb3c75a1f8d6ae42617c76640baa27b4..c724bacc67f87d89ce9e8497ba2eb990ab98a584 100644
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
@@ -473,8 +473,9 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
 	/* Init external transmitters */
 	slave_encoder = get_tmds_slave(encoder);
 	if (slave_encoder)
-		get_slave_funcs(slave_encoder)->mode_set(
-			slave_encoder, &nv_encoder->mode, &nv_encoder->mode);
+		get_encoder_i2c_funcs(slave_encoder)->mode_set(slave_encoder,
+							       &nv_encoder->mode,
+							       &nv_encoder->mode);
 
 	helper->dpms(encoder, DRM_MODE_DPMS_ON);
 
@@ -614,8 +615,8 @@ static void nv04_dfp_destroy(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 
-	if (get_slave_funcs(encoder))
-		get_slave_funcs(encoder)->destroy(encoder);
+	if (get_encoder_i2c_funcs(encoder))
+		get_encoder_i2c_funcs(encoder)->destroy(encoder);
 
 	drm_encoder_cleanup(encoder);
 	kfree(nv_encoder);
@@ -649,8 +650,8 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
 	if (type < 0)
 		return;
 
-	drm_i2c_encoder_init(dev, to_encoder_slave(encoder),
-			     &bus->i2c, &info[type].dev);
+	nouveau_i2c_encoder_init(dev, to_encoder_i2c(encoder),
+				 &bus->i2c, &info[type].dev);
 }
 
 static const struct drm_encoder_helper_funcs nv04_lvds_helper_funcs = {
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
index fcb0fcd6c89718bc8613ab63482ccc005ace079b..296a14b5484042faa484eb8d1247ab9eee937471 100644
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
index d7a91e17510f7ea6bd2f087078dee73f85de53ee..5ad5157a2c027f20269a8d09621cb21daea3e7ac 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
@@ -27,9 +27,9 @@
 #ifndef __NOUVEAU_I2C_CH7006_PRIV_H__
 #define __NOUVEAU_I2C_CH7006_PRIV_H__
 
-#include <drm/drm_encoder_slave.h>
 #include <drm/drm_probe_helper.h>
 
+#include <dispnv04/i2c/encoder_i2c.h>
 #include <dispnv04/i2c/ch7006.h>
 
 typedef int64_t fixed;
@@ -100,7 +100,7 @@ struct ch7006_priv {
 };
 
 #define to_ch7006_priv(x) \
-	((struct ch7006_priv *)to_encoder_slave(x)->slave_priv)
+	((struct ch7006_priv *)to_encoder_i2c(x)->encoder_i2c_priv)
 
 extern int ch7006_debug;
 extern char *ch7006_tv_norm;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
index ca488f52a84a02773dac4a270b63544901a0e232..ec8ffeddefa9f13a84dfa76d2fb13a1090e959a5 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
@@ -27,10 +27,10 @@
 #include <linux/module.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_encoder_slave.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <dispnv04/i2c/encoder_i2c.h>
 #include <dispnv04/i2c/sil164.h>
 
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
similarity index 54%
rename from drivers/gpu/drm/drm_encoder_slave.c
rename to drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c
index e464429d32df6e2eeb541d92c5a486b4ee7a21ec..e2bf99c433366b48b2b090073eb14d9e0eb82f7b 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c
@@ -26,10 +26,10 @@
 
 #include <linux/module.h>
 
-#include <drm/drm_encoder_slave.h>
+#include <dispnv04/i2c/encoder_i2c.h>
 
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
-			 struct i2c_adapter *adap,
-			 const struct i2c_board_info *info)
+int nouveau_i2c_encoder_init(struct drm_device *dev,
+			     struct nouveau_i2c_encoder *encoder,
+			     struct i2c_adapter *adap,
+			     const struct i2c_board_info *info)
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
+bool nouveau_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
+				    const struct drm_display_mode *mode,
+				    struct drm_display_mode *adjusted_mode)
 {
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
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode)
-{
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
-	    struct drm_connector *connector)
+enum drm_connector_status nouveau_i2c_encoder_detect(struct drm_encoder *encoder,
+						     struct drm_connector *connector)
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
index 4ffd8af6bf8bff6f688f87ffede7a815bfc0789c..c61ab083f62e063a31d94f68e556fb8e7d8458d1 100644
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
-				   &bus->i2c,
-				   &nv04_tv_encoder_info[type].dev);
+	ret = nouveau_i2c_encoder_init(dev, to_encoder_i2c(encoder),
+				       &bus->i2c,
+				       &nv04_tv_encoder_info[type].dev);
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
diff --git a/include/drm/drm_encoder_slave.h b/drivers/gpu/drm/nouveau/include/dispnv04/i2c/encoder_i2c.h
similarity index 59%
rename from include/drm/drm_encoder_slave.h
rename to drivers/gpu/drm/nouveau/include/dispnv04/i2c/encoder_i2c.h
index 49172166a164474f43e4afb2eeeb3cde8ae7c61a..edbe8b57ac193c007280ba46dcb0a12357540eb5 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/drivers/gpu/drm/nouveau/include/dispnv04/i2c/encoder_i2c.h
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
@@ -120,54 +119,60 @@ struct drm_encoder_slave_funcs {
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
 
-int drm_i2c_encoder_init(struct drm_device *dev,
-			 struct drm_encoder_slave *encoder,
-			 struct i2c_adapter *adap,
-			 const struct i2c_board_info *info);
+#define to_encoder_i2c(x) container_of((x), struct nouveau_i2c_encoder, base)
 
+int nouveau_i2c_encoder_init(struct drm_device *dev,
+			     struct nouveau_i2c_encoder *encoder,
+			     struct i2c_adapter *adap,
+			     const struct i2c_board_info *info);
+
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
@@ -175,67 +180,41 @@ struct drm_i2c_encoder_driver {
 
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
+
+#define to_nouveau_i2c_encoder_driver(x) container_of((x),			\
+						  struct nouveau_i2c_encoder_driver, \
 						  i2c_driver)
 
 /**
- * drm_i2c_encoder_get_client - Get the I2C client corresponding to an encoder
+ * nouveau_i2c_encoder_get_client - Get the I2C client corresponding to an encoder
  * @encoder: The encoder
  */
-static inline struct i2c_client *drm_i2c_encoder_get_client(struct drm_encoder *encoder)
+static inline struct i2c_client *nouveau_i2c_encoder_get_client(struct drm_encoder *encoder)
 {
-	return (struct i2c_client *)to_encoder_slave(encoder)->bus_priv;
+	return to_encoder_i2c(encoder)->i2c_client;
 }
 
-/**
- * drm_i2c_encoder_register - Register an I2C encoder driver
- * @owner:	Module containing the driver.
- * @driver:	Driver to be registered.
- */
-static inline int drm_i2c_encoder_register(struct module *owner,
-					   struct drm_i2c_encoder_driver *driver)
-{
-	return i2c_register_driver(owner, &driver->i2c_driver);
-}
-
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
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode);
-void drm_i2c_encoder_prepare(struct drm_encoder *encoder);
-void drm_i2c_encoder_commit(struct drm_encoder *encoder);
-void drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode);
-enum drm_connector_status drm_i2c_encoder_detect(struct drm_encoder *encoder,
-	    struct drm_connector *connector);
-void drm_i2c_encoder_save(struct drm_encoder *encoder);
-void drm_i2c_encoder_restore(struct drm_encoder *encoder);
+bool nouveau_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
+				    const struct drm_display_mode *mode,
+				    struct drm_display_mode *adjusted_mode);
+enum drm_connector_status nouveau_i2c_encoder_detect(struct drm_encoder *encoder,
+						     struct drm_connector *connector);
+void nouveau_i2c_encoder_save(struct drm_encoder *encoder);
+void nouveau_i2c_encoder_restore(struct drm_encoder *encoder);
 
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 8d5c9c74cbb90927036cee75f173f687617f14ec..63e160f09f311006ed9193301b5b1e7817b871e1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -797,8 +797,10 @@ nouveau_connector_set_property(struct drm_connector *connector,
 						    property, value);
 	if (ret) {
 		if (nv_encoder && nv_encoder->dcb->type == DCB_OUTPUT_TV)
-			return get_slave_funcs(encoder)->set_property(
-				encoder, connector, property, value);
+			return get_encoder_i2c_funcs(encoder)->set_property(encoder,
+									    connector,
+									    property,
+									    value);
 		return ret;
 	}
 
@@ -1015,7 +1017,7 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 		nouveau_connector_detect_depth(connector);
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_TV)
-		ret = get_slave_funcs(encoder)->get_modes(encoder, connector);
+		ret = get_encoder_i2c_funcs(encoder)->get_modes(encoder, connector);
 
 	if (nv_connector->type == DCB_CONNECTOR_LVDS ||
 	    nv_connector->type == DCB_CONNECTOR_LVDS_SPWG ||
@@ -1100,7 +1102,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 			max_clock = 350000;
 		break;
 	case DCB_OUTPUT_TV:
-		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
+		return get_encoder_i2c_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
 		return nv50_dp_mode_valid(nv_encoder, mode, NULL);
 	default:
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 333042fc493faec360b8d9713ab687836b986431..dce8e5d9d4964842adcc7725ae4e12a36c4beb5a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -31,7 +31,8 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
-#include <drm/drm_encoder_slave.h>
+
+#include <dispnv04/i2c/encoder_i2c.h>
 
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

