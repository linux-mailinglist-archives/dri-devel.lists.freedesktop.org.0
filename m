Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2015877EE3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A04112811;
	Mon, 11 Mar 2024 11:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rcPcNX2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74841127BD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:49 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d2991e8c12so40234181fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156048; x=1710760848; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ir6wjm8QQpOyHKpQvjmYeKZYvCMVaJ8Hym4a6JbZZhY=;
 b=rcPcNX2e40Bb+RGhTCNkLSgNbkjofM2mstCT+8KsCuhdZEdcWLeEbAhy15IWQP78cQ
 XTb3dkiLLW3bBlcs04D3m+ULI9+CX2RqtEX3mGOs/hCW3LSKO9KtgO8xEoBkcQ8MQzS+
 LYSojj5RT4o5wNBTvXQe2+voE7YQ9JGQFw59Lg0EZBcnrDd2qHU9s9eiI6oVrR+ekxwC
 x+TvYYl+MWfaV1y+eGmreh+PMs/D8QyiYWjhCUyzyWqzuqrsiqsYVtcU54V5mtNZGM1Y
 csfmY2tI5ecRy/nvcli7+Bjj/l604nPHoI/q4EkjqsJuCYze/26DLnnyzJ1rt2r/JKfH
 4D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156048; x=1710760848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ir6wjm8QQpOyHKpQvjmYeKZYvCMVaJ8Hym4a6JbZZhY=;
 b=SP8vAQ/8qY/PHB8HJkdiaPm2yP3OYic3Ok1cH1ppdnbsdNMbCrL1bDSj/5euQvmQSy
 3kfAWN6bqK/hhkDMM044wAKHlsIgpG/iyFF2cO2/VWx9TqT3sFwIWchuN+qpp1UwDKl8
 34KdbZ59QoDt3wAzFrrFbJmCB0lxUkfIshoEYk0G6GAB+Kh5DWN47zQOZmJC7WuPVmPs
 05BSZ5eRu24aProvV448iQZo19RZ3dPKfz2+dnO8aBLg5tvTYGQhSiunWMWb95iyL7fl
 ZTbBqn4u1nKTaQQu2+1/hS/NKqNBF72AqX8Jqbfi43a48s+j0aHQUrA4J/AmvPlZ2qrW
 uFfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+/O3HK2QWjswqpiYx8FDHBKd0gvKBKioiQ0RutSLWWm62fhZ6VH6WcJD0hVcQJN9Sa2mqHBNedqNJpObkja47HncAcKOfPys0Zc0YPdnk
X-Gm-Message-State: AOJu0YyOafQqtO4FoefKaoVgzazzvV8SfdbIcFwTTJi3cyse5gF9hm4+
 tTLNtRmJwrr360DWk5wOEL7T+2s/5EtJ+wV62whsfCl8vAB1Hepm9zw9w/KLsJE=
X-Google-Smtp-Source: AGHT+IG8I9e7J8MhWtK/uQN/BtnjXiwRwT4R6zmncYgRe1Vo6oUrPDJcAiXzYb1GWXR3/jtCNFtdKg==
X-Received: by 2002:a2e:920b:0:b0:2d4:2c7b:8e6f with SMTP id
 k11-20020a2e920b000000b002d42c7b8e6fmr1956353ljg.2.1710156048131; 
 Mon, 11 Mar 2024 04:20:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:19 +0200
Subject: [PATCH 11/12] drm/imx: parallel-display: switch to
 imx_legacy_bridge / drm_bridge_connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-11-e104f05caa51@linaro.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6571;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o4jvT4e8JMjMr+7h9dCacXDKcAcJGfFUAAJSEb3xtzs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukEPLE1jx/shBH0781Hl+LKKxa3V1C5owSy1
 EczEpwuuRCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pBAAKCRCLPIo+Aiko
 1ecxB/wMFqq8sHjpPb+hDxOt1trAs/tejtGoWgVKUPjdxjWBAfzTA2snbN5GEPclxaulAuTT8EB
 s92f9XLL2B/jN8iZ645Zr4x7sGl3cef4aEIgHFQHS7rUuo2djOWN33JKWJBcD8jokp0FXT9Plph
 nHONKTHZ8YmQHXd6w+lI4Ai5u829kD7DptdJKd841Q1Rbm36R/ZskG7JKjvNoSiuUNJ3ec5iFbX
 0aBr5SLq9NP3Dehz7Gd7Hc2Tvia/2i3NgpK1EngXgnZj29qeCHZj5vqiLBOddja5H4aa8pij1AU
 IFTbHj7vmLaOXLnwqcbwvU0y40BWcye52UDi3NRHqs0nr9tL
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

Use the imx_legacy bridge driver instead of handlign display modes via
the connector node.

All existing usecases already support attaching using
the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, while the imx_legacy bridge
doesn't support creating connector at all. Switch to
drm_bridge_connector at the same time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 95 +++++-----------------------
 1 file changed, 17 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 9b60bfbd16e6..73a15259c93c 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -12,10 +12,9 @@
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 
-#include <video/of_display_timing.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +24,6 @@
 #include "imx-drm.h"
 
 struct imx_parallel_display_encoder {
-	struct drm_connector connector;
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct imx_parallel_display *pd;
@@ -34,51 +32,14 @@ struct imx_parallel_display_encoder {
 struct imx_parallel_display {
 	struct device *dev;
 	u32 bus_format;
-	u32 bus_flags;
-	struct drm_display_mode mode;
 	struct drm_bridge *next_bridge;
 };
 
-static inline struct imx_parallel_display *con_to_imxpd(struct drm_connector *c)
-{
-	return container_of(c, struct imx_parallel_display_encoder, connector)->pd;
-}
-
 static inline struct imx_parallel_display *bridge_to_imxpd(struct drm_bridge *b)
 {
 	return container_of(b, struct imx_parallel_display_encoder, bridge)->pd;
 }
 
-static int imx_pd_connector_get_modes(struct drm_connector *connector)
-{
-	struct imx_parallel_display *imxpd = con_to_imxpd(connector);
-	struct device_node *np = imxpd->dev->of_node;
-	int num_modes;
-
-	if (np) {
-		struct drm_display_mode *mode = drm_mode_create(connector->dev);
-		int ret;
-
-		if (!mode)
-			return -EINVAL;
-
-		ret = of_get_drm_display_mode(np, &imxpd->mode,
-					      &imxpd->bus_flags,
-					      OF_USE_NATIVE_MODE);
-		if (ret) {
-			drm_mode_destroy(connector->dev, mode);
-			return ret;
-		}
-
-		drm_mode_copy(mode, &imxpd->mode);
-		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-		drm_mode_probed_add(connector, mode);
-		num_modes++;
-	}
-
-	return num_modes;
-}
-
 static const u32 imx_pd_bus_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_BGR888_1X24,
@@ -172,7 +133,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
 {
 	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
 	struct drm_display_info *di = &conn_state->connector->display_info;
-	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
 	struct drm_bridge_state *next_bridge_state = NULL;
 	struct drm_bridge *next_bridge;
 	u32 bus_flags, bus_fmt;
@@ -184,10 +144,8 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
 
 	if (next_bridge_state)
 		bus_flags = next_bridge_state->input_bus_cfg.flags;
-	else if (di->num_bus_formats)
-		bus_flags = di->bus_flags;
 	else
-		bus_flags = imxpd->bus_flags;
+		bus_flags = di->bus_flags;
 
 	bus_fmt = bridge_state->input_bus_cfg.format;
 	if (!imx_pd_format_supported(bus_fmt))
@@ -203,19 +161,16 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
-static const struct drm_connector_funcs imx_pd_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = imx_drm_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
+static int imx_pd_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
 
-static const struct drm_connector_helper_funcs imx_pd_connector_helper_funcs = {
-	.get_modes = imx_pd_connector_get_modes,
-};
+	return drm_bridge_attach(bridge->encoder, imxpd->next_bridge, bridge, flags);
+}
 
 static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
+	.attach = imx_pd_bridge_attach,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -240,7 +195,6 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(imxpd_encoder);
 
 	imxpd_encoder->pd = imxpd;
-	connector = &imxpd_encoder->connector;
 	encoder = &imxpd_encoder->encoder;
 	bridge = &imxpd_encoder->bridge;
 
@@ -248,28 +202,14 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	/* set the connector's dpms to OFF so that
-	 * drm_helper_connector_dpms() won't return
-	 * immediately since the current state is ON
-	 * at this point.
-	 */
-	connector->dpms = DRM_MODE_DPMS_OFF;
-
 	bridge->funcs = &imx_pd_bridge_funcs;
 	drm_bridge_attach(encoder, bridge, NULL, 0);
 
-	if (imxpd->next_bridge) {
-		ret = drm_bridge_attach(encoder, imxpd->next_bridge, bridge, 0);
-		if (ret < 0)
-			return ret;
-	} else {
-		drm_connector_helper_add(connector,
-					 &imx_pd_connector_helper_funcs);
-		drm_connector_init(drm, connector, &imx_pd_connector_funcs,
-				   DRM_MODE_CONNECTOR_DPI);
-
-		drm_connector_attach_encoder(connector, encoder);
-	}
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector))
+		return PTR_ERR(connector);
+
+	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
@@ -293,12 +233,11 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	/* port@1 is the output port */
 	imxpd->next_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (imxpd->next_bridge == ERR_PTR(-ENODEV))
+		imxpd->next_bridge = devm_imx_drm_legacy_bridge(dev, np, DRM_MODE_CONNECTOR_DPI);
 	if (IS_ERR(imxpd->next_bridge)) {
 		ret = PTR_ERR(imxpd->next_bridge);
-		if (ret != -ENODEV)
-			return ret;
-
-		imxpd->next_bridge = NULL;
+		return ret;
 	}
 
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);

-- 
2.39.2

