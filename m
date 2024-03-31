Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062298935C8
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E094A10E9F4;
	Sun, 31 Mar 2024 20:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e4GCYDzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8832710E9EF
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:12 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-515a97846b5so3618474e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916951; x=1712521751; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hSjZJV2J4iFvn9E2c3TLDDuj0HnPcaUsZUNdMjQiU+w=;
 b=e4GCYDzcnmXT2Cycb+eZbzlbZXAVVYS2lQxeqcF2TkafBj8EGLxMxTkRg/2sVHnOBV
 +SChoYj55uL+RdX6Zmyb65h3eGzf+SRX3ZJJDpJpeG99nDimOhvUxLRJkiS66R3Edfia
 rF7ryUrYnBirHMiWIsdKSS8RTVo1MQtoBp0WgPVrS6T86cAYsElK8GXSRiJTkUgSw6q4
 4uDcU+KsALwBzeTDfOa441vOuPrcxWNcd0g4B56jei6L/OgviLnnM89vioV435PPvJl/
 tdzPi0+JHeeVcceeV5xO/UIXriiSgZtPyT9uR4a2ZHCXVehDRg1/6T38pzaEI76uerTs
 GX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916951; x=1712521751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSjZJV2J4iFvn9E2c3TLDDuj0HnPcaUsZUNdMjQiU+w=;
 b=q+py9yJZYI2nnvkP/jE5K4oA1J+Z3bO4dQdKukwYTEF4v9xF20ZG+c5OQ4rwpvYy/i
 /o0TDcWaCNSofEatNZ2tRLZKDsIX5LPLseWioJurR/WQpGDrJ3kgBJdeHCu7HJUfg++N
 ndxWQNqFDs+qfLs0AtQbnamT8J7zEnrvzs5w3so04baCYU/Prf3oZvkVMXB83y4OPkRN
 9ZCPolboNTLNER8/qfUTgtnfWVqpfAULijZuVipq3B5e2F/lGePjQexk8M43Nie/n3IZ
 dpuA+HoTHiE6cZTBki+64FIdwcX0NMLV/btsi2KQVsB6fn5cES8Ze0R7fFQ0uMhS//5b
 Giwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvdzzjEhJCVyL4H8hdgBSjGLiKiVwTRE9vrpr+nPqOnCbb403xKikwhHzlt62BgxZVB+fuGkJi0JRA9aGgvOHuYcmsLvxS/sdoFu7bA7OQ
X-Gm-Message-State: AOJu0YylkxLNQ7vlCdj9msUF55US+S64RYGgzGyL+efdqIpYUtchmexz
 B+8EnWIdchNh8S61re7P1Wz2McD9OXL6dtaaxIVoNHCngCVWxqr6a+aIE3DWJ4E=
X-Google-Smtp-Source: AGHT+IGqWCIntvZiDosEJKnaReDexnGbEOGV3zzmMDNnyKgFK5V75oXRqdmj5ESqD0OGA1YI49V6rg==
X-Received: by 2002:ac2:4145:0:b0:516:9f4d:1fc4 with SMTP id
 c5-20020ac24145000000b005169f4d1fc4mr2503140lfi.49.1711916950855; 
 Sun, 31 Mar 2024 13:29:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:03 +0300
Subject: [PATCH v2 06/12] drm/imx: ldb: drop custom DDC bus support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-6-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m11CFuEduJHyQCwHyCLs0Yco+X7++CQ3XEHXdiz1Oro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceP6jh5TC7QL9R2rkAKAR3NbgOh5kblFwSSO
 NB3cIuFeTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjwAKCRCLPIo+Aiko
 1Sn/B/4rtFlV/3QWDuIppX9zgfbSNwSC+NhwTRudvbiadZy5sknecwH7XCIyNEg3mhrf1G12oXq
 aIiyOr0cJBSMYa7TfCGSTN5CESr+cKDJ1WqKhLVAh5KalY6304ITWgCQnCnvnS/5j+cm8cZuoFz
 2rdF0h073DMilAaoCko5laOPnvkuot3ZG1KYLPy3BZQWn+mTL0NT9/O1xZOnBKXb2rJyv9XR3gP
 ZU8zMokbcM4DF22m1TahdWnyO9AnKVtk+96WHD9XGwORBorkXnTRb1svaVfzizSVaHcPBEdmHVP
 EHyhHEt16GVtCxcctL3wZ2DCfiHjttm/DLtmibsaCllST2ce
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

None of the boards ever supported by the upstream kernel used the custom
DDC bus support with the LDB connector. If a need arises to do so, one
should use panel-simple and its DDC bus code. Drop ddc-i2c-bus support
from the imx-ldb driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 72 ++++++-------------------------------
 1 file changed, 10 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 1924d8921c62..380edc1c4507 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -70,7 +70,6 @@ struct imx_ldb_channel {
 	struct drm_bridge *bridge;
 
 	struct device_node *child;
-	struct i2c_adapter *ddc;
 	int chno;
 	struct drm_display_mode mode;
 	int mode_valid;
@@ -141,18 +140,6 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (imx_ldb_ch->ddc) {
-		const struct drm_edid *edid = drm_edid_read_ddc(connector,
-								imx_ldb_ch->ddc);
-
-		if (edid) {
-			drm_edid_connector_update(connector, edid);
-			drm_edid_free(edid);
-
-			return drm_edid_connector_add_modes(connector);
-		}
-	}
-
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
@@ -481,10 +468,9 @@ static int imx_ldb_register(struct drm_device *drm,
 		 */
 		drm_connector_helper_add(connector,
 					 &imx_ldb_connector_helper_funcs);
-		drm_connector_init_with_ddc(drm, connector,
-					    &imx_ldb_connector_funcs,
-					    DRM_MODE_CONNECTOR_LVDS,
-					    imx_ldb_ch->ddc);
+		drm_connector_init(drm, connector,
+				   &imx_ldb_connector_funcs,
+				   DRM_MODE_CONNECTOR_LVDS);
 		drm_connector_attach_encoder(connector, encoder);
 	}
 
@@ -551,39 +537,6 @@ static const struct of_device_id imx_ldb_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, imx_ldb_dt_ids);
 
-static int imx_ldb_panel_ddc(struct device *dev,
-		struct imx_ldb_channel *channel, struct device_node *child)
-{
-	struct device_node *ddc_node;
-	int ret;
-
-	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
-	if (ddc_node) {
-		channel->ddc = of_find_i2c_adapter_by_node(ddc_node);
-		of_node_put(ddc_node);
-		if (!channel->ddc) {
-			dev_warn(dev, "failed to get ddc i2c adapter\n");
-			return -EPROBE_DEFER;
-		}
-	}
-
-	if (!channel->ddc) {
-		/* if no DDC available, fallback to hardcoded EDID */
-		dev_dbg(dev, "no ddc available\n");
-
-		if (!channel->panel) {
-			/* fallback to display-timings node */
-			ret = of_get_drm_display_mode(child,
-						      &channel->mode,
-						      &channel->bus_flags,
-						      OF_USE_NATIVE_MODE);
-			if (!ret)
-				channel->mode_valid = 1;
-		}
-	}
-	return 0;
-}
-
 static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
@@ -694,11 +647,15 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		if (ret && ret != -ENODEV)
 			goto free_child;
 
-		/* panel ddc only if there is no bridge */
-		if (!channel->bridge) {
-			ret = imx_ldb_panel_ddc(dev, channel, child);
+		if (!channel->bridge && !channel->panel) {
+			ret = of_get_drm_display_mode(child,
+						      &channel->mode,
+						      &channel->bus_flags,
+						      OF_USE_NATIVE_MODE);
 			if (ret)
 				goto free_child;
+
+			channel->mode_valid = 1;
 		}
 
 		bus_format = of_get_bus_format(dev, child);
@@ -732,15 +689,6 @@ static int imx_ldb_probe(struct platform_device *pdev)
 
 static void imx_ldb_remove(struct platform_device *pdev)
 {
-	struct imx_ldb *imx_ldb = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
-
-		i2c_put_adapter(channel->ddc);
-	}
-
 	component_del(&pdev->dev, &imx_ldb_ops);
 }
 

-- 
2.39.2

