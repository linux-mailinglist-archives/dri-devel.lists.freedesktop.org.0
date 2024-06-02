Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BC8D753D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEF710E175;
	Sun,  2 Jun 2024 12:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X+bZmOzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893FC10E141
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:57 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso3121964e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329895; x=1717934695; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7bW+dexLEyW8/fiHalshdZSXyhb6haaJOjwgGuObPKc=;
 b=X+bZmOzikQTCt062w90tJpETRFUL6cYmndo4Pxf+UNJDhYsO/N5uocVCCFGcnPL/vf
 LiUfeENPX1KUhPGThkMBBUB4DgD/GEtMo16PeLfrmHDmFlyOq4Qmio2Y28OUrhY0V4/O
 msit20dml6hnuq2BCjiq0nb5KoCsPF7Pdt2bZ6eCrUWnqMERStUKjEU86GwPpUUUTC0N
 SEo4G6489WaWQajwCKtehy5PAb8L0vBZcj+C+Im/5Kz/B1wZYGnNLWvJ5vFxPXk6r9CR
 zLP3bi2qnulXa2MxxepezVhz+D8pT93ePvPHdm33np2xB9lh5aCc6Sn4QXqH0uID3j3v
 FzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329895; x=1717934695;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7bW+dexLEyW8/fiHalshdZSXyhb6haaJOjwgGuObPKc=;
 b=EwIFDAFAJVVYl30hkCrmDJQf7cB4N5uRBGojhmpPYh7203sygIkd8/J1uJFhOEODGb
 ZKl6FW62fspfLxnfM6DQ+VUS4CCr8r1bd3cJFy7ebQO0++Yg/rkI9Kj+V0Er3Etq8VUW
 kAqzFqQwSk4W/2LLB74t1eH1TFYRh6JOj81iwQcw3KhL9DSpX2is1IcX/Ox/hNVNzYR0
 mLXb2w+ymSmATuy4r9/Rgri/2dobi9rGPG1RvdCa45ZYHdH9ebrkkS7OE+wUNqjkpocT
 j5MSD+2SfPw4WxJ0OoBORSSPB/512S74kahqLnaVMXEB/pIu5nVBZwEKwA/UFzKg829z
 1ptg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ9k2BDVizBA0406kWCWHctx6PA2UKKHGe+MXpzyd3DRnSphwg2duKaSrsVYwaYAqQbl7VnKOaP5KIdeuqG/TR94OCWBr2OpsudlqG/aT5
X-Gm-Message-State: AOJu0YwOneAKttFzqw+E+nCf70eFvZzfngd3G71KgOMc5OispHEh+FHH
 jG/seSV8yz7iY564RS4eX0P97EUDry0UXOjz1lHrRZOMqFsC2Z4X9eeawfMhVtw=
X-Google-Smtp-Source: AGHT+IGFycV3aMGXXM7w38pYECCY2FQ381zT2HIaEMAjxO6NjwdIhauSI5+GR2ppjSfXkK6p3d9QBw==
X-Received: by 2002:a19:f00a:0:b0:52b:7a10:4690 with SMTP id
 2adb3069b0e04-52b896d4665mr3819559e87.61.1717329895551; 
 Sun, 02 Jun 2024 05:04:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:51 +0300
Subject: [PATCH v3 11/12] drm/imx: parallel-display: switch to
 imx_legacy_bridge / drm_bridge_connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-11-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6706;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IEi5tB9QWsMTs4OU15teLStUW+XzV63LDKlz+9Z8mwk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/eQ/9pfC4pxC633xsYpJpN7E8dltC541CrS
 uWvFa8Cfo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3gAKCRCLPIo+Aiko
 1bJnB/9ewG044cOJ9Z+3XAr5es1ilKXbDqOsgBLdk076O5JbhBtEYaRuBn4Vvzdkfb6Q1lqpseb
 ylaiIKj/bMVU0nPIFRz08DChVmSH6AAw36JD5yeJpYNFEc/ICcXqVLD7rNbxOkXrOzB4e03IqO9
 ALbl0kJy88/wF641MPMzCIa0mmj4bD5rvSZA5xFMls+bPAjtpVvqbROgRokyRdv+vOvlw8mXCad
 HzSupGBWUhuLI6NQFiHzzscWXTsHJXf9LM0Nn8EVyiMPixZfSQ7WzotZAiAuqrggrkZBZ6FQBgH
 2esFVqL6t/X7G3AKWuPR3SdfHEOWX8PBtF9USQRR/yZhNZrT
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
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 100 ++++++---------------------
 1 file changed, 20 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 9ac2a94fa62b..70f62e89622e 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -12,19 +12,18 @@
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 
-#include <video/of_display_timing.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/bridge/imx.h>
 
 #include "imx-drm.h"
 
 struct imx_parallel_display_encoder {
-	struct drm_connector connector;
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct imx_parallel_display *pd;
@@ -33,51 +32,14 @@ struct imx_parallel_display_encoder {
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
-			return 0;
-
-		ret = of_get_drm_display_mode(np, &imxpd->mode,
-					      &imxpd->bus_flags,
-					      OF_USE_NATIVE_MODE);
-		if (ret) {
-			drm_mode_destroy(connector->dev, mode);
-			return 0;
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
@@ -171,7 +133,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
 {
 	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
 	struct drm_display_info *di = &conn_state->connector->display_info;
-	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
 	struct drm_bridge_state *next_bridge_state = NULL;
 	struct drm_bridge *next_bridge;
 	u32 bus_flags, bus_fmt;
@@ -183,10 +144,8 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
 
 	if (next_bridge_state)
 		bus_flags = next_bridge_state->input_bus_cfg.flags;
-	else if (di->num_bus_formats)
-		bus_flags = di->bus_flags;
 	else
-		bus_flags = imxpd->bus_flags;
+		bus_flags = di->bus_flags;
 
 	bus_fmt = bridge_state->input_bus_cfg.format;
 	if (!imx_pd_format_supported(bus_fmt))
@@ -202,19 +161,16 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
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
@@ -239,7 +195,6 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(imxpd_encoder);
 
 	imxpd_encoder->pd = imxpd;
-	connector = &imxpd_encoder->connector;
 	encoder = &imxpd_encoder->encoder;
 	bridge = &imxpd_encoder->bridge;
 
@@ -247,28 +202,14 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
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
-	drm_bridge_attach(encoder, bridge, NULL, 0);
-
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
+	drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector))
+		return PTR_ERR(connector);
+
+	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
@@ -292,12 +233,11 @@ static int imx_pd_probe(struct platform_device *pdev)
 
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

