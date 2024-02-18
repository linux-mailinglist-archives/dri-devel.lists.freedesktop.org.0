Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510D985984D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 18:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A7410E031;
	Sun, 18 Feb 2024 17:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Od+u0ccf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CDA10E031
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 17:50:42 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d22b8801b9so18019421fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 09:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1708278640; x=1708883440;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjpbxfuUN8ClVWyejRT9z307tEN2okR2Dj3IppGtU+I=;
 b=Od+u0ccfkPDUMqhmoQTsRygVYkbB9e6UpZvE18nVodi+roITomOaM6u3yVwBc8raq9
 Q+8ZCzHtos6ON/UZiNpd1cboMZcu+AqhMt10AMw6JQIX5b/F92h3oV/f2y9Zf7G8LDSw
 JRA16U2mJk76PmY1IUDa06VqnYgK6VnmEUUN9mvCVmfe97/lBQVnHd/4JCIf4wqz00ii
 UZyE2GML3vwwdALhOu66iLQvj3g6kf1Im5VK+erDa9GpiwC2CK0aqsMrrPts2pykYUlh
 BvGIQc9zh1fIIUTFKaNIT4N+vYdO+fiVeHS3lbG38/fga1VBIu9kHp1P3Y/Xqq54uFyg
 QKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708278640; x=1708883440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjpbxfuUN8ClVWyejRT9z307tEN2okR2Dj3IppGtU+I=;
 b=VyBfZbQLGbAOhObvOm5Kr2IJVsCvjPpRoUX/ipkcG0OuNbxxcBE6rfMclPsGOhROq/
 OMX9Ae+Bl/2XrYKJH24cphU5mrf4NlukUltvHEDgBnLvs2ktzO4eWWbSNqWba9ecR06p
 Nl/689nfVLjIjPd2iMUdGFZ4D32YuhFAxtp9pM6SC68NznW/AbEbSleZn4YRR9AIUFwi
 vuEzoDsTHYDrOWKYgpBE7Ko5P9yT+75mn3GT7pr+2T0XQ8GTIeymrcLn5Ot9Z9S0noa0
 +KqZR637mpbl4nxZmYfUUX6ZCAOcs2Tp32rMTNXk7pLKyqmyBKpUBk3VnEKTQZX9g+Ht
 g2oQ==
X-Gm-Message-State: AOJu0YzXdpsLdCdBoMNg4AstvsqjkPoh5614gowLaOx12pOObiro5CgQ
 F6YNP3TnRN0sztyjsr/zA0Z9QX1hZijmtOeGOjjtus6prUeewJ6qSp8S/2JQ
X-Google-Smtp-Source: AGHT+IF+k6EDEC5TlndQFlEFI46CiqTKLip+fjyqgK9pMQUYRRCGzERWQTf0G82WXK5WrbdSBKZ4+A==
X-Received: by 2002:a2e:854e:0:b0:2d0:9a93:1fe0 with SMTP id
 u14-20020a2e854e000000b002d09a931fe0mr6234553ljj.11.1708278639558; 
 Sun, 18 Feb 2024 09:50:39 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de.
 [2a01:c22:7b37:4900::e63]) by smtp.googlemail.com with ESMTPSA id
 ck8-20020a0564021c0800b0056452477a5esm829283edb.24.2024.02.18.09.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 09:50:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1] drm/meson: improve encoder probe / initialization error
 handling
Date: Sun, 18 Feb 2024 18:50:35 +0100
Message-ID: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
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

Rename meson_encoder_{cvbs,dsi,hdmi}_init() to
meson_encoder_{cvbs,dsi,hdmi}_probe() so it's clear that these functions
are used at probe time during driver initialization. Also switch all
error prints inside those functions to use dev_err_probe() for
consistency.

This makes the code more straight forward to read and makes the error
prints within those functions consistent (by logging all -EPROBE_DEFER
with dev_dbg(), while actual errors are logged with dev_err() and get
the error value printed).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This is meant to be applied on top of my other patch called
"drm/meson: Don't remove bridges which are created by other drivers" [0]


[0] https://lore.kernel.org/dri-devel/20240215220442.1343152-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_drv.c          |  6 +++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 24 ++++++++++------------
 drivers/gpu/drm/meson/meson_encoder_cvbs.h |  2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 23 +++++++++------------
 drivers/gpu/drm/meson/meson_encoder_dsi.h  |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++-------
 drivers/gpu/drm/meson/meson_encoder_hdmi.h |  2 +-
 7 files changed, 35 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index cb674966e9ac..17a5cca007e2 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -312,7 +312,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	/* Encoder Initialization */
 
-	ret = meson_encoder_cvbs_init(priv);
+	ret = meson_encoder_cvbs_probe(priv);
 	if (ret)
 		goto exit_afbcd;
 
@@ -326,12 +326,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		}
 	}
 
-	ret = meson_encoder_hdmi_init(priv);
+	ret = meson_encoder_hdmi_probe(priv);
 	if (ret)
 		goto exit_afbcd;
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
-		ret = meson_encoder_dsi_init(priv);
+		ret = meson_encoder_dsi_probe(priv);
 		if (ret)
 			goto exit_afbcd;
 	}
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 3407450435e2..d1191de855d9 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -219,7 +219,7 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
-int meson_encoder_cvbs_init(struct meson_drm *priv)
+int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
 	struct meson_encoder_cvbs *meson_encoder_cvbs;
@@ -240,10 +240,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 
 	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
 	of_node_put(remote);
-	if (!meson_encoder_cvbs->next_bridge) {
-		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
-		return -EPROBE_DEFER;
-	}
+	if (!meson_encoder_cvbs->next_bridge)
+		return dev_err_probe(priv->dev, -EPROBE_DEFER,
+				     "Failed to find CVBS Connector bridge\n");
 
 	/* CVBS Encoder Bridge */
 	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
@@ -259,10 +258,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 	/* Encoder */
 	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
 				      DRM_MODE_ENCODER_TVDAC);
-	if (ret) {
-		dev_err(priv->dev, "Failed to init CVBS encoder: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to init CVBS encoder\n");
 
 	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
 
@@ -276,10 +274,10 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 
 	/* Initialize & attach Bridge Connector */
 	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
-	if (IS_ERR(connector)) {
-		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
-		return PTR_ERR(connector);
-	}
+	if (IS_ERR(connector))
+		return dev_err_probe(priv->dev, PTR_ERR(connector),
+				     "Unable to create CVBS bridge connector\n");
+
 	drm_connector_attach_encoder(connector, &meson_encoder_cvbs->encoder);
 
 	priv->encoders[MESON_ENC_CVBS] = meson_encoder_cvbs;
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
index 09710fec3c66..7b7bc85c03f7 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
@@ -24,7 +24,7 @@ struct meson_cvbs_mode {
 /* Modes supported by the CVBS output */
 extern struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT];
 
-int meson_encoder_cvbs_init(struct meson_drm *priv);
+int meson_encoder_cvbs_probe(struct meson_drm *priv);
 void meson_encoder_cvbs_remove(struct meson_drm *priv);
 
 #endif /* __MESON_VENC_CVBS_H */
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 311b91630fbe..7816902f5907 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -100,7 +100,7 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
-int meson_encoder_dsi_init(struct meson_drm *priv)
+int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;
 	struct device_node *remote;
@@ -118,10 +118,9 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
-	if (!meson_encoder_dsi->next_bridge) {
-		dev_dbg(priv->dev, "Failed to find DSI transceiver bridge\n");
-		return -EPROBE_DEFER;
-	}
+	if (!meson_encoder_dsi->next_bridge)
+		return dev_err_probe(priv->dev, -EPROBE_DEFER,
+				     "Failed to find DSI transceiver bridge\n");
 
 	/* DSI Encoder Bridge */
 	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
@@ -135,19 +134,17 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
 	/* Encoder */
 	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
 				      DRM_MODE_ENCODER_DSI);
-	if (ret) {
-		dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to init DSI encoder\n");
 
 	meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
 
 	/* Attach DSI Encoder Bridge to Encoder */
 	ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
-	if (ret) {
-		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to attach bridge\n");
 
 	/*
 	 * We should have now in place:
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/meson/meson_encoder_dsi.h
index 9277d7015193..85d5b61805f2 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.h
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
@@ -7,7 +7,7 @@
 #ifndef __MESON_ENCODER_DSI_H
 #define __MESON_ENCODER_DSI_H
 
-int meson_encoder_dsi_init(struct meson_drm *priv);
+int meson_encoder_dsi_probe(struct meson_drm *priv);
 void meson_encoder_dsi_remove(struct meson_drm *priv);
 
 #endif /* __MESON_ENCODER_DSI_H */
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4686568c9ca..22e07847a9a7 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -354,7 +354,7 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
-int meson_encoder_hdmi_init(struct meson_drm *priv)
+int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
 	struct platform_device *pdev;
@@ -374,8 +374,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 
 	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
 	if (!meson_encoder_hdmi->next_bridge) {
-		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
-		ret = -EPROBE_DEFER;
+		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
+				    "Failed to find HDMI transceiver bridge\n");
 		goto err_put_node;
 	}
 
@@ -393,7 +393,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
-		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
+		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;
 	}
 
@@ -403,7 +403,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
-		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
+		dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
 		goto err_put_node;
 	}
 
@@ -411,8 +411,9 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
 							&meson_encoder_hdmi->encoder);
 	if (IS_ERR(meson_encoder_hdmi->connector)) {
-		dev_err(priv->dev, "Unable to create HDMI bridge connector\n");
-		ret = PTR_ERR(meson_encoder_hdmi->connector);
+		ret = dev_err_probe(priv->dev,
+				    PTR_ERR(meson_encoder_hdmi->connector),
+				    "Unable to create HDMI bridge connector\n");
 		goto err_put_node;
 	}
 	drm_connector_attach_encoder(meson_encoder_hdmi->connector,
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.h b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
index a6cd38eb5f71..fd5485875db8 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.h
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
@@ -7,7 +7,7 @@
 #ifndef __MESON_ENCODER_HDMI_H
 #define __MESON_ENCODER_HDMI_H
 
-int meson_encoder_hdmi_init(struct meson_drm *priv);
+int meson_encoder_hdmi_probe(struct meson_drm *priv);
 void meson_encoder_hdmi_remove(struct meson_drm *priv);
 
 #endif /* __MESON_ENCODER_HDMI_H */
-- 
2.43.2

