Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AFBCF93D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAF110E333;
	Sat, 11 Oct 2025 17:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="C/8zFjj0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Rirzo6Jk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3819310E334
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:51 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLt0Nlbz9shj;
 Sat, 11 Oct 2025 19:03:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rU2uW428ktg/uxsgiMNm1NL8lLaVYtjPeqSyv7MQiE=;
 b=C/8zFjj05BpbotuwML1zjgnFQOx9AkrTIlEAocFvOizE/MwvYbr82jfyLiycql1Y6d0RUt
 bOHqXJ9EGjv4sR/IKIqOvUTkggYjiKDGEOdOpJrD0LFFVYpX6QhmVwgvpbBr1yNGcFZB7o
 NwSycCSyWwKf2/rDiD/23c9yq1GBGMZM6cDQr7mpi//DkdjdIjKaAEPRlp753LvHUnlKNl
 7T7ejTM1nPuEYcUAvhmlpOAiLhYvR/WnNz1H7egbsvkB8rDs/fKGUxpJfab4ld/tDIHlKk
 HmxyAzFQGEaLOIpo/JH+NWUuwhyeZE4V1tY/FmF7KY3X/kdbAJwwlBHsfEGfMg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Rirzo6Jk;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rU2uW428ktg/uxsgiMNm1NL8lLaVYtjPeqSyv7MQiE=;
 b=Rirzo6JkXei6eUVVxdZkoz8wvLiS90hNJP6Nsn8pVR0M8eR+CRQ6FpnwItkcoQO/dg6jiT
 8ert0iRpFvSKFSlQcn/vve9mIzlw+Ua3QyVIiFtsgtZa1oF4c7q2A3M0ZkhigscJUQeeSo
 KKQuuElaSxtFqfVoKmJUrm2+bBQvVHdvM8XYXdPgIVwqlPuFfsb9HStntZ6vdzJsbTKaaU
 Cu4BZH2XSejHIZ8zJAjIWC1K1SVxfKFFtbKO0RAYKBIEoOP42oQiB1s4wez8D74yHn9j5/
 /NCzJZ5MbB6w3GEdxeGKXhLqS4fLNEpbCNB2RZzBBMA3GLLtZ8VxObba8RetJw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 20/39] drm/imx: dc: Configure display CSR clock feed select
Date: Sat, 11 Oct 2025 18:51:35 +0200
Message-ID: <20251011170213.128907-21-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: p5ockmyrs7gnzi5p6cb89izymgsh9ses
X-MBO-RS-ID: 14437a3bb9e69744023
X-Rspamd-Queue-Id: 4ckVLt0Nlbz9shj
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

Configure DISPLAY_CSR clock feed selector on i.MX95 accordingly
for either DSI and LVDS serializers. This is especially important
to make LVDS displays operational, the default selector setting
of 0 only works for DSI serializer.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-drv.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 2717c92aba6c5..dec8ad19bad42 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -7,6 +7,7 @@
 #include <linux/component.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -29,8 +30,15 @@
 #include "dc-drv.h"
 #include "dc-pe.h"
 
+#define DISPLAY_ENGINES_CLOCK_CONTROL	0x00
+#define  DISP_CLK1_SEL			GENMASK(3, 2)
+#define  DISP_CLK0_SEL			GENMASK(1, 0)
+#define  DISP_CLK_SEL_CCM		0
+#define  DISP_CLK_SEL_LVDS		2
+
 struct dc_priv {
 	struct drm_device *drm;
+	struct regmap *regmap;
 	struct clk_bulk_data *clk_cfg;
 	int clk_cfg_count;
 };
@@ -119,6 +127,17 @@ static int dc_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (priv->regmap) {
+		regmap_write_bits(priv->regmap, DISPLAY_ENGINES_CLOCK_CONTROL,
+				  DISP_CLK0_SEL | DISP_CLK1_SEL,
+				  FIELD_PREP(DISP_CLK0_SEL,
+				             ((dc_drm->encoder[0].encoder_type == DRM_MODE_ENCODER_DSI) ?
+					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)) |
+				  FIELD_PREP(DISP_CLK1_SEL,
+				             ((dc_drm->encoder[1].encoder_type == DRM_MODE_ENCODER_DSI) ?
+					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)));
+	}
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "failed to register drm device: %d\n", ret);
@@ -157,6 +176,7 @@ static const struct component_master_ops dc_drm_ops = {
 static int dc_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
+	struct device_node *np = pdev->dev.of_node;
 	struct dc_priv *priv;
 	int ret;
 
@@ -170,6 +190,12 @@ static int dc_probe(struct platform_device *pdev)
 				     "failed to get cfg clock\n");
 	priv->clk_cfg_count = ret;
 
+	if (of_device_is_compatible(np, "fsl,imx95-dc")) {
+		priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
+		if (IS_ERR(priv->regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(priv->regmap), "failed to get regmap\n");
+	}
+
 	dev_set_drvdata(&pdev->dev, priv);
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-- 
2.51.0

