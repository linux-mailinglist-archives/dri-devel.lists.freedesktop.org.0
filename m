Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE3AC7C070
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 01:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443D210E0A5;
	Sat, 22 Nov 2025 00:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S/JSPOOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E729E10E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 00:50:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so26852945e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763772600; x=1764377400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OFi0sAyKoBCnKFhTmWWYtrg2wpuTBa2Vsv6Uy0z7Gaw=;
 b=S/JSPOOgKf3Sf8AIsv+rjnJZFujYz7HMU8CeXKM8j0lib0BuKy6tJryYyxnieIJ5th
 bXyboClkluANCYANrLn4BcweP3N6HlWEUqbYmOl5z7AwxhNzfTvTJSylGnYtcnyKvFzM
 vMnKhwhJVDRn6gFC+LcCeHcSTPgnQihAqO2+8LAc02x9NfgUf1B+bR87mOfsD5ACegUo
 bkOpnGt2aLD+t9MpkguFB0NySGqWxdd3iYoJ5i8bCunA8BRXIYB2bBDwZPAuZrmctbP/
 1ghmNSDUs3qEVKCnK1GslSV0mjg1pKIShzvcjI0vYyphEiCnwb8zXfyOmsQJHEBn800d
 CC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763772600; x=1764377400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFi0sAyKoBCnKFhTmWWYtrg2wpuTBa2Vsv6Uy0z7Gaw=;
 b=LVccs59rVXjRGDJN66TjTwQYIdOrvl9GZQXIOUjPT1r27NCqHFWnuB+ETtZAeEfFOu
 EPUDwfF6X4kthRkJjHwxkUaTd7Tn9c6EzLIaya6V30AFrQNuBEjdnx979IW8hJZEL4KM
 O6+mCGnev0hzaPU21J9CLTUv3gcG66mSChid5OTMUZWA9iERlBKWy/xpw0AMmHW3MXow
 Yq76+fSb0ovNWpOTT3mtPryHbBt0NnT+SEZRB82Sx4GWW0c7LKmob7wZyFq2jXz0LH/V
 KYZHSXsjdOG63M4N6wSieOV3aSeHBc4GTr8qXwGYn1M+v3aSgqCC73UEkir3tdEoerY/
 BAXg==
X-Gm-Message-State: AOJu0YygKGQORAo6hQn+dmSjXTA24r919i/tMDceL89EFfZZrHUj8HBq
 lZkGFIlK9bnm8tPJyEn+iInIigoz4K8gSprx5pLiLkYs9c6ylvyPEFZ3
X-Gm-Gg: ASbGncvQRoei5MHp+ERXqB1YABPFeCMxambUrcbO1syS6JKeoUYwSA/as5+AylR4eCb
 0CY8kHt0fVc2uWbDzECzRK+XKdDYA3AQr84mYCh7SH7FEDCxW3tHX7PV4NnAKSX2/QMFciDMoem
 29+gB1IbAc03ws4Gl+y3aey5hen3RKoq85pgHEo0ItR08r5UK1R/QMAWEpyUvh7Qf+ErU0LpiU1
 MRPPDMOerUYg01LZBGlSqsYBW5mv27I98/sjeHJUuzyTk3/U6XAv6WhYD/VMWsJRs2l2WOxIOqE
 UBDv4Nx40d7pMp4eFpyC9CcVPgrzfVeYjsFhRci6HXriRnoONNItoUUtorl2XWBZWDgRYHdGvPr
 ZAWDhqGSampn00eU+toiKaMeuTgbVWfI1T0yH0x/a23+C/N/J4NHal0C3noiHlq7J9hG1qE5uA/
 c1PRx9WdjGtG1f3fx1952nkCgtVNQs
X-Google-Smtp-Source: AGHT+IE1Ij3FmOCeQhyu/1SsXF3RwTcxJwSVuC230NZC4KKII/eNM3pKh0gKbIzTK53w+ZXJ53UBGQ==
X-Received: by 2002:a05:600c:a07:b0:477:a3d1:aafb with SMTP id
 5b1f17b1804b1-477c115c657mr42319275e9.29.1763772600096; 
 Fri, 21 Nov 2025 16:50:00 -0800 (PST)
Received: from ekhafagy-ROG-Strix.. ([197.46.88.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm13398036f8f.21.2025.11.21.16.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 16:49:59 -0800 (PST)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: linus.walleij@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eslam Khafagy <eslam.medhat1993@gmail.com>
Subject: [PATCH RESEND] drm: pl111: replace dev_* print functions with drm_*
 variants
Date: Sat, 22 Nov 2025 02:49:51 +0200
Message-ID: <20251122004951.567753-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Update the PL111 CLCD driver to use DRM print macros drm_*() instead of
dev_*(). This change ensures consistency with DRM subsystem
logging conventions [1].

[1]
Link: https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 drivers/gpu/drm/pl111/pl111_display.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_drv.c       | 28 ++++++-------
 drivers/gpu/drm/pl111/pl111_nomadik.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_nomadik.h   |  4 +-
 drivers/gpu/drm/pl111/pl111_versatile.c | 52 ++++++++++++-------------
 drivers/gpu/drm/pl111/pl111_versatile.h |  2 +-
 6 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8..bc7acb3a2810 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -137,7 +137,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_set_rate(priv->clk, mode->clock * 1000);
 	if (ret) {
-		dev_err(drm->dev,
+		drm_err(drm,
 			"Failed to set pixel clock rate to %d: %d\n",
 			mode->clock * 1000, ret);
 	}
@@ -549,7 +549,7 @@ pl111_init_clock_divider(struct drm_device *drm)
 	int ret;
 
 	if (IS_ERR(parent)) {
-		dev_err(drm->dev, "CLCD: unable to get clcdclk.\n");
+		drm_err(drm, "CLCD: unable to get clcdclk.\n");
 		return PTR_ERR(parent);
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 56ff6a3fb483..4833d18b4040 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -98,7 +98,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		struct drm_panel *tmp_panel;
 		struct drm_bridge *tmp_bridge;
 
-		dev_dbg(dev->dev, "checking endpoint %d\n", i);
+		drm_dbg(dev, "checking endpoint %d\n", i);
 
 		ret = drm_of_find_panel_or_bridge(dev->dev->of_node,
 						  0, i,
@@ -114,18 +114,18 @@ static int pl111_modeset_init(struct drm_device *dev)
 				defer = true;
 			} else if (ret != -ENODEV) {
 				/* Continue, maybe something else is working */
-				dev_err(dev->dev,
+				drm_err(dev,
 					"endpoint %d returns %d\n", i, ret);
 			}
 		}
 
 		if (tmp_panel) {
-			dev_info(dev->dev,
+			drm_info(dev,
 				 "found panel on endpoint %d\n", i);
 			panel = tmp_panel;
 		}
 		if (tmp_bridge) {
-			dev_info(dev->dev,
+			drm_info(dev,
 				 "found bridge on endpoint %d\n", i);
 			bridge = tmp_bridge;
 		}
@@ -149,9 +149,9 @@ static int pl111_modeset_init(struct drm_device *dev)
 			goto finish;
 		}
 	} else if (bridge) {
-		dev_info(dev->dev, "Using non-panel bridge\n");
+		drm_info(dev, "Using non-panel bridge\n");
 	} else {
-		dev_err(dev->dev, "No bridge, exiting\n");
+		drm_err(dev, "No bridge, exiting\n");
 		return -ENODEV;
 	}
 
@@ -163,7 +163,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 
 	ret = pl111_display_init(dev);
 	if (ret != 0) {
-		dev_err(dev->dev, "Failed to init display\n");
+		drm_err(dev, "Failed to init display\n");
 		goto out_bridge;
 	}
 
@@ -175,7 +175,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	if (!priv->variant->broken_vblank) {
 		ret = drm_vblank_init(dev, 1);
 		if (ret != 0) {
-			dev_err(dev->dev, "Failed to init vblank\n");
+			drm_err(dev, "Failed to init vblank\n");
 			goto out_bridge;
 		}
 	}
@@ -255,13 +255,13 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 	ret = of_reserved_mem_device_init(dev);
 	if (!ret) {
-		dev_info(dev, "using device-specific reserved memory\n");
+		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
 	}
 
 	if (of_property_read_u32(dev->of_node, "max-memory-bandwidth",
 				 &priv->memory_bw)) {
-		dev_info(dev, "no max memory bandwidth specified, assume unlimited\n");
+		drm_info(drm, "no max memory bandwidth specified, assume unlimited\n");
 		priv->memory_bw = 0;
 	}
 
@@ -276,17 +276,17 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 	priv->regs = devm_ioremap_resource(dev, &amba_dev->res);
 	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "%s failed mmio\n", __func__);
+		drm_err(drm, "%s failed mmio\n", __func__);
 		ret = PTR_ERR(priv->regs);
 		goto dev_put;
 	}
 
 	/* This may override some variant settings */
-	ret = pl111_versatile_init(dev, priv);
+	ret = pl111_versatile_init(drm, priv);
 	if (ret)
 		goto dev_put;
 
-	pl111_nomadik_init(dev);
+	pl111_nomadik_init(drm);
 
 	/* turn off interrupts before requesting the irq */
 	writel(0, priv->regs + priv->ienb);
@@ -294,7 +294,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	ret = devm_request_irq(dev, amba_dev->irq[0], pl111_irq, 0,
 			       variant->name, priv);
 	if (ret != 0) {
-		dev_err(dev, "%s failed irq %d\n", __func__, ret);
+		drm_err(drm, "%s failed irq %d\n", __func__, ret);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.c b/drivers/gpu/drm/pl111/pl111_nomadik.c
index 6f385e59be22..f3218d59c5f1 100644
--- a/drivers/gpu/drm/pl111/pl111_nomadik.c
+++ b/drivers/gpu/drm/pl111/pl111_nomadik.c
@@ -9,7 +9,7 @@
 #define PMU_CTRL_OFFSET 0x0000
 #define PMU_CTRL_LCDNDIF BIT(26)
 
-void pl111_nomadik_init(struct device *dev)
+void pl111_nomadik_init(struct drm_device *dev)
 {
 	struct regmap *pmu_regmap;
 
@@ -31,6 +31,6 @@ void pl111_nomadik_init(struct device *dev)
 			   PMU_CTRL_OFFSET,
 			   PMU_CTRL_LCDNDIF,
 			   0);
-	dev_info(dev, "set Nomadik PMU mux to CLCD mode\n");
+	drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
 }
 EXPORT_SYMBOL_GPL(pl111_nomadik_init);
diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.h b/drivers/gpu/drm/pl111/pl111_nomadik.h
index 47ccf5c839fc..b2c9f7cc1c8c 100644
--- a/drivers/gpu/drm/pl111/pl111_nomadik.h
+++ b/drivers/gpu/drm/pl111/pl111_nomadik.h
@@ -8,11 +8,11 @@ struct device;
 
 #ifdef CONFIG_ARCH_NOMADIK
 
-void pl111_nomadik_init(struct device *dev);
+void pl111_nomadik_init(struct drm_device *dev);
 
 #else
 
-static inline void pl111_nomadik_init(struct device *dev)
+static inline void pl111_nomadik_init(struct drm_device *dev)
 {
 }
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 5f460b296c0c..ec8683a1b5fc 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -116,7 +116,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable Integrator CLCD connectors\n");
+	drm_info(drm, "enable Integrator CLCD connectors\n");
 
 	/* FIXME: really needed? */
 	val = INTEGRATOR_CLCD_LCD_STATIC1 | INTEGRATOR_CLCD_LCD_STATIC2 |
@@ -134,7 +134,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 		val |= INTEGRATOR_CLCD_LCDMUX_VGA555;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Integrator 0x%08x\n",
+		drm_err(drm, "unhandled format on Integrator 0x%08x\n",
 			format);
 		break;
 	}
@@ -156,7 +156,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "enable IM-PD1 CLCD connectors\n");
 	val = IMPD1_CTRL_DISP_VGA | IMPD1_CTRL_DISP_ENABLE;
 
 	regmap_update_bits(versatile_syscon_map,
@@ -167,7 +167,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 
 static void pl111_impd1_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "disable IM-PD1 CLCD connectors\n");
 
 	regmap_update_bits(versatile_syscon_map,
 			   IMPD1_CTRL_OFFSET,
@@ -194,7 +194,7 @@ static void pl111_impd1_disable(struct drm_device *drm)
 
 static void pl111_versatile_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable Versatile CLCD connectors\n");
+	drm_info(drm, "disable Versatile CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -205,7 +205,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 {
 	u32 val = 0;
 
-	dev_info(drm->dev, "enable Versatile CLCD connectors\n");
+	drm_info(drm, "enable Versatile CLCD connectors\n");
 
 	switch (format) {
 	case DRM_FORMAT_ABGR8888:
@@ -227,7 +227,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 		val |= SYS_CLCD_MODE_5551;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Versatile 0x%08x\n",
+		drm_err(drm, "unhandled format on Versatile 0x%08x\n",
 			format);
 		break;
 	}
@@ -247,7 +247,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 
 static void pl111_realview_clcd_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable RealView CLCD connectors\n");
+	drm_info(drm, "disable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -256,7 +256,7 @@ static void pl111_realview_clcd_disable(struct drm_device *drm)
 
 static void pl111_realview_clcd_enable(struct drm_device *drm, u32 format)
 {
-	dev_info(drm->dev, "enable RealView CLCD connectors\n");
+	drm_info(drm, "enable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -376,7 +376,7 @@ static const struct pl111_variant_data pl111_vexpress = {
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
 
-static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
+static int pl111_vexpress_clcd_init(struct drm_device *dev, struct device_node *np,
 				    struct pl111_drm_dev_private *priv)
 {
 	struct platform_device *pdev;
@@ -433,22 +433,22 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
 		mux_motherboard = false;
 
 	if (mux_motherboard) {
-		dev_info(dev, "DVI muxed to motherboard CLCD\n");
+		drm_info(dev, "DVI muxed to motherboard CLCD\n");
 		val = VEXPRESS_FPGAMUX_MOTHERBOARD;
-	} else if (ct_clcd == dev->of_node) {
-		dev_info(dev,
+	} else if (ct_clcd == dev->dev->of_node) {
+		drm_info(dev,
 			 "DVI muxed to daughterboard 1 (core tile) CLCD\n");
 		val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
 	} else {
-		dev_info(dev, "core tile graphics present\n");
-		dev_info(dev, "this device will be deactivated\n");
+		drm_info(dev, "core tile graphics present\n");
+		drm_info(dev, "this device will be deactivated\n");
 		return -ENODEV;
 	}
 
 	/* Call into deep Vexpress configuration API */
 	pdev = of_find_device_by_node(np);
 	if (!pdev) {
-		dev_err(dev, "can't find the sysreg device, deferring\n");
+		drm_err(dev, "can't find the sysreg device, deferring\n");
 		return -EPROBE_DEFER;
 	}
 
@@ -461,17 +461,17 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
 	ret = regmap_write(map, 0, val);
 	platform_device_put(pdev);
 	if (ret) {
-		dev_err(dev, "error setting DVI muxmode\n");
+		drm_err(dev, "error setting DVI muxmode\n");
 		return -ENODEV;
 	}
 
 	priv->variant = &pl111_vexpress;
-	dev_info(dev, "initializing Versatile Express PL111\n");
+	drm_info(dev, "initializing Versatile Express PL111\n");
 
 	return 0;
 }
 
-int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
+int pl111_versatile_init(struct drm_device *dev, struct pl111_drm_dev_private *priv)
 {
 	const struct of_device_id *clcd_id;
 	enum versatile_clcd versatile_clcd_type;
@@ -492,7 +492,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		int ret = pl111_vexpress_clcd_init(dev, np, priv);
 		of_node_put(np);
 		if (ret)
-			dev_err(dev, "Versatile Express init failed - %d", ret);
+			drm_err(dev, "Versatile Express init failed - %d", ret);
 		return ret;
 	}
 
@@ -511,7 +511,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 	map = syscon_node_to_regmap(np);
 	of_node_put(np);
 	if (IS_ERR(map)) {
-		dev_err(dev, "no Versatile syscon regmap\n");
+		drm_err(dev, "no Versatile syscon regmap\n");
 		return PTR_ERR(map);
 	}
 
@@ -520,14 +520,14 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		versatile_syscon_map = map;
 		priv->variant = &pl110_integrator;
 		priv->variant_display_enable = pl111_integrator_enable;
-		dev_info(dev, "set up callbacks for Integrator PL110\n");
+		drm_info(dev, "set up callbacks for Integrator PL110\n");
 		break;
 	case INTEGRATOR_IMPD1:
 		versatile_syscon_map = map;
 		priv->variant = &pl110_impd1;
 		priv->variant_display_enable = pl111_impd1_enable;
 		priv->variant_display_disable = pl111_impd1_disable;
-		dev_info(dev, "set up callbacks for IM-PD1 PL110\n");
+		drm_info(dev, "set up callbacks for IM-PD1 PL110\n");
 		break;
 	case VERSATILE_CLCD:
 		versatile_syscon_map = map;
@@ -542,7 +542,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		 */
 		priv->ienb = CLCD_PL111_IENB;
 		priv->ctrl = CLCD_PL111_CNTL;
-		dev_info(dev, "set up callbacks for Versatile PL110\n");
+		drm_info(dev, "set up callbacks for Versatile PL110\n");
 		break;
 	case REALVIEW_CLCD_EB:
 	case REALVIEW_CLCD_PB1176:
@@ -553,10 +553,10 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		priv->variant = &pl111_realview;
 		priv->variant_display_enable = pl111_realview_clcd_enable;
 		priv->variant_display_disable = pl111_realview_clcd_disable;
-		dev_info(dev, "set up callbacks for RealView PL111\n");
+		drm_info(dev, "set up callbacks for RealView PL111\n");
 		break;
 	default:
-		dev_info(dev, "unknown Versatile system controller\n");
+		drm_info(dev, "unknown Versatile system controller\n");
 		break;
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.h b/drivers/gpu/drm/pl111/pl111_versatile.h
index 143877010042..7a15c5f7efe8 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.h
+++ b/drivers/gpu/drm/pl111/pl111_versatile.h
@@ -7,6 +7,6 @@
 struct device;
 struct pl111_drm_dev_private;
 
-int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv);
+int pl111_versatile_init(struct drm_device *dev, struct pl111_drm_dev_private *priv);
 
 #endif
-- 
2.43.0

