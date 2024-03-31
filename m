Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E028935D8
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E6C10E9F7;
	Sun, 31 Mar 2024 20:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pB/MuFZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EC210EA06
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:14 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516a97b3139so278380e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916952; x=1712521752; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2NWUO8Sy6JPSgwKkrutWi5HBoELv9lWKNmrIdWaVqOA=;
 b=pB/MuFZPOfVO7VhqA2G4qhQwzTrOLRqYC1FPvHrccEUTiwuPmL65P3S81MsjuoYmSx
 TDCsMNGb/82tHwg7EcWx1gIYEsZpVxIbzfIoR/YV5irgph7siyDwIdi/vWZJAfQO+6ha
 NmW6TJg52XqWq7augcN1G8YYO/74XBz4UZ0NzhvAhikHaZhMnA0B5LyK8WcEytMG9TOF
 owAitiAxSQyASZmM2aHDRVPDrk+0tKKgYmvl5y9FKc+nGa/YxlqQ2K8CqWwvdocaG/Ps
 EPK4EoEP1iJ+EtiC6DAyrSpa0ATteCFKa5TEP+NtoTwamzho6Sasj//oSmKOkaR1xpzl
 nVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916952; x=1712521752;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NWUO8Sy6JPSgwKkrutWi5HBoELv9lWKNmrIdWaVqOA=;
 b=jTT30TuBp34ELO2BYaTsYzSvAubsKFcix41uGrFCTRc8RlVOtiGE3C4ylsJQ0N8i45
 gfQgLITsjCXoomYPQois2FQ6hcDr6gzPGY3ioWX2lkxrG141kiy2kIYEXADosxyL83Nj
 vyHbz94N4WVQL08b0cYpJTmT/5EvuC1PHE6zlG8D23dtXW2gHlHdpWwIAJGFJSFkdasw
 50y7cuOxeZzSC78GU5G0Rb9m+jkp/cLjo+MmxjuaXRJm3kZxAkdxl/NoeFVxso4vI6kq
 s6t/X2FZoapcG7+zNuj45yLiOnEy+iHem9NAhGm/JYl9/V3TmoJqZFDFtYPjbg2fO/6X
 zQ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZU1oyTs14I0kv5ATwfHBUZzII/574TzSeg1jGPzgZx7vyHf7VHh4xKVCmKhy0R2/f9JQYwUKEMXJ8ezRnS9MNEy/FNlRJnvFMGmxLl5jF
X-Gm-Message-State: AOJu0Yy3b8PMeLc5lTL2253nLTEYkyWYzD69ocvZ/ytT5jET656FkMKC
 mIgWFe/wNMvIsbl89j90dS8H7eB32X22tMdhAgT3ve2W5sRAEG8shBS0mo8P3gw=
X-Google-Smtp-Source: AGHT+IF/gwVAQwbfxLT+LCIBhCaRg+FxT10/Jh8nnHOQd/9xJ4bySdg9cI4XUR3gXC85ea19gCneCg==
X-Received: by 2002:ac2:5eca:0:b0:513:da24:fc0b with SMTP id
 d10-20020ac25eca000000b00513da24fc0bmr5142760lfq.33.1711916952439; 
 Sun, 31 Mar 2024 13:29:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:05 +0300
Subject: [PATCH v2 08/12] drm/imx: parallel-display: switch to drm_panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-8-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pi9W5qgy4T7+J9hP9AVFepGfzI8GpfyO2Ku1B6h2Uks=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceP58j4g6V4EltAY/XhET22h9ioI6gibKjLi
 hKvmJUXjKqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjwAKCRCLPIo+Aiko
 1fEiB/9T1bnL+hT0p34ArbfJieqfBkbDb+2ZxrhzWsW6faJ9TPDPbi2BzBS5OVUPiLcj9/oAVew
 /tn/sGqoEGOrF92bR61BAKbHftzP4+5SrFsr6Az/ZTxsw8hYvyNlf/YjqwX85Nl4wOhEnropG5o
 C9/wgT79YfIvzN+jlMN7yADPKHiBB9DiOXD40bvqfBbo1Upf9KyzvmFWAt2/wCTOSxdnYWiU0xv
 Wg0CMH8K4178p8BkPwC613/e3u/SjQ5p9KokbOBMozXM2iFmrq84hPXGrVFZm+Xx1aALV34Sd6k
 3TrVuFLbRtilldWxJFk6JBv6d0pyObAZDTv33enq71W6La0x
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

Defer panel handling to drm_panel_bridge, unifying codepaths for the
panel and bridge cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig            |  2 ++
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 35 +++++++---------------------
 2 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 4e41611c8532..8aaf2441bcef 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,8 @@ config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	select DRM_PANEL
 	depends on DRM_IMX
+	depends on DRM_BRIDGE
+	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 
 config DRM_IMX_TVE
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 4d17fb96e77c..b7743b30475a 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -36,7 +36,6 @@ struct imx_parallel_display {
 	u32 bus_format;
 	u32 bus_flags;
 	struct drm_display_mode mode;
-	struct drm_panel *panel;
 	struct drm_bridge *next_bridge;
 };
 
@@ -56,10 +55,6 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	struct device_node *np = imxpd->dev->of_node;
 	int num_modes;
 
-	num_modes = drm_panel_get_modes(imxpd->panel, connector);
-	if (num_modes > 0)
-		return num_modes;
-
 	if (np) {
 		struct drm_display_mode *mode = drm_mode_create(connector->dev);
 		int ret;
@@ -84,22 +79,6 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	return num_modes;
 }
 
-static void imx_pd_bridge_enable(struct drm_bridge *bridge)
-{
-	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
-
-	drm_panel_prepare(imxpd->panel);
-	drm_panel_enable(imxpd->panel);
-}
-
-static void imx_pd_bridge_disable(struct drm_bridge *bridge)
-{
-	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
-
-	drm_panel_disable(imxpd->panel);
-	drm_panel_unprepare(imxpd->panel);
-}
-
 static const u32 imx_pd_bus_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_BGR888_1X24,
@@ -237,8 +216,6 @@ static const struct drm_connector_helper_funcs imx_pd_connector_helper_funcs = {
 };
 
 static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
-	.enable = imx_pd_bridge_enable,
-	.disable = imx_pd_bridge_disable,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -315,10 +292,14 @@ static int imx_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* port@1 is the output port */
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel,
-					  &imxpd->next_bridge);
-	if (ret && ret != -ENODEV)
-		return ret;
+	imxpd->next_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (IS_ERR(imxpd->next_bridge)) {
+		ret = PTR_ERR(imxpd->next_bridge);
+		if (ret != -ENODEV)
+			return ret;
+
+		imxpd->next_bridge = NULL;
+	}
 
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {

-- 
2.39.2

