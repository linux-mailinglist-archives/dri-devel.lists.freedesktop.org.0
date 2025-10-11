Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31860BCF94F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB2110E334;
	Sat, 11 Oct 2025 17:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="v4oC2Ohv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ODJt3a8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7924410E334
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:59 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVM21xsXz9skc;
 Sat, 11 Oct 2025 19:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lG8pBYZgGqzL2/6tEY+5yRHPwfpOE212ijGNR6COvHc=;
 b=v4oC2OhvpdUAitdZKs/vZ34uaNFx3JIe2kMDtV4bGAGGZxmaMj/oPgolJuuu0OR7g/d8Bc
 k77qnXQsHOhB+qIu4uetKO9/TezQy/mvJub76mKJEI0wAOOKz7pnl8HZ4PEuYfra03bPpM
 +9znxjujp1KEO3gRFOB5spr/C43kpjRgd4x8TxPCS0hlvTFkYhnzVeKbY+JTlAY2lLzq6I
 IEqvoq6w8XefdQsp18v1+z2tLgtht0lGYGNdr8FFKRQDRE2J1p9C3KxVA23fJoYs9SdjPV
 DGS8WbVnOnJ4IxzBGxOCZYQ7k+65VxiYnMdYlKKp+HsjfWu2bIjoLUdS0MYy/Q==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ODJt3a8O;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lG8pBYZgGqzL2/6tEY+5yRHPwfpOE212ijGNR6COvHc=;
 b=ODJt3a8OlvBvIF3nfkM4Ze8MN/jVdnFEZHv6jseI//eoSjAChAsYKEQ1nouLty4Hn0kmxP
 ijJB2Kaqm52rB1dqwDnx71+rnHyMVFekKyTzVqKHrRrR2crWJLZ4UX0x4hzWCnTCnLwJAd
 SH9hevQXgOX4ciPPw4rePHUve4zDBiNk3uy+njMTowDgCE1U61S6sCdHL+VIgCR21ni8mb
 yc9+1kK/2/Nl8aWl0GT3EAbfpTKXyCdoQASxjcptYVRxeF/NdqLjOmzRmErNxNApWgUHvd
 WSeIgWuNFJE9AczER8HptsCGmjMbAmhUeNlUnRHQyXFU89O4SgeI9B4E6awyHQ==
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
Subject: [PATCH 23/39] drm/imx: dc: Add OF match data for i.MX95
Date: Sat, 11 Oct 2025 18:51:38 +0200
Message-ID: <20251011170213.128907-24-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6ehoaw8um1wzbjr7rqex9fpdx8zqmqz3
X-MBO-RS-ID: c99c38571aac143d72e
X-Rspamd-Queue-Id: 4ckVM21xsXz9skc
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

Fill in OF match data for i.MX95, so the drivers can bind on this SoC.

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
 drivers/gpu/drm/imx/dc/Kconfig  |  4 +--
 drivers/gpu/drm/imx/dc/dc-cf.c  | 15 ++++++++
 drivers/gpu/drm/imx/dc/dc-de.c  | 34 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  4 ++-
 drivers/gpu/drm/imx/dc/dc-ed.c  | 25 ++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 48 ++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c  | 41 +++++++++++++++++++++-
 drivers/gpu/drm/imx/dc/dc-ic.c  | 61 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/imx/dc/dc-lb.c  | 52 +++++++++++++++++++++++++++-
 drivers/gpu/drm/imx/dc/dc-pe.h  | 11 +++++-
 drivers/gpu/drm/imx/dc/dc-tc.c  | 12 +++++++
 11 files changed, 299 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 415993207f2e3..95fddf38066b0 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,5 +1,5 @@
 config DRM_IMX8_DC
-	tristate "Freescale i.MX8 Display Controller Graphics"
+	tristate "Freescale i.MX8Q/i.MX95 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
@@ -10,4 +10,4 @@ config DRM_IMX8_DC
 	select REGMAP
 	select REGMAP_MMIO
 	help
-	  enable Freescale i.MX8 Display Controller(DC) graphics support
+	  enable Freescale i.MX8Q/i.MX95 Display Controller(DC) graphics support
diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 1d3602c5d4230..1d409146f8b99 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -39,12 +39,26 @@ static const struct dc_subdev_info dc_cf_info_imx8qxp[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_subdev_info dc_cf_info_imx95[] = {
+	{ .reg_start = 0x4b4f1000, .id = 0, },
+	{ .reg_start = 0x4b531000, .id = 1, },
+	{ .reg_start = 0x4b501000, .id = 4, },
+	{ .reg_start = 0x4b541000, .id = 5, },
+	{ /* sentinel */ },
+};
+
 static const struct dc_cf_subdev_match_data dc_cf_match_data_imx8qxp = {
 	.link_cf4 = LINK_ID_CONSTFRAME4_MX8QXP,
 	.link_cf5 = LINK_ID_CONSTFRAME5_MX8QXP,
 	.info = dc_cf_info_imx8qxp,
 };
 
+static const struct dc_cf_subdev_match_data dc_cf_match_data_imx95 = {
+	.link_cf4 = LINK_ID_CONSTFRAME4_MX95,
+	.link_cf5 = LINK_ID_CONSTFRAME5_MX95,
+	.info = dc_cf_info_imx95,
+};
+
 static const struct regmap_range dc_cf_regmap_ranges[] = {
 	regmap_reg_range(STATICCONTROL, CONSTANTCOLOR),
 };
@@ -173,6 +187,7 @@ static void dc_cf_remove(struct platform_device *pdev)
 
 static const struct of_device_id dc_cf_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-constframe", .data = &dc_cf_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-constframe", .data = &dc_cf_match_data_imx95 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_cf_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
index 6331b2f3b622c..5ee54c65e23f6 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.c
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -16,6 +16,7 @@
 #include "dc-de.h"
 #include "dc-drv.h"
 
+#define POLARITYCTRL_IMX95	0x8
 #define POLARITYCTRL_IMX8QXP	0xc
 #define  POLEN_HIGH		BIT(2)
 
@@ -57,6 +58,38 @@ static const struct dc_de_subdev_match_data dc_de_match_data_imx8qxp = {
 	.info = dc_de_info_imx8qxp,
 };
 
+static const struct dc_subdev_info dc_de_info_imx95[] = {
+	{ .reg_start = 0x4b711000, .id = 0, },
+	{ .reg_start = 0x4b771000, .id = 1, },
+	{ /* sentinel */ },
+};
+
+static const struct regmap_range dc_de_regmap_ranges_imx95[] = {
+	regmap_reg_range(POLARITYCTRL_IMX95, POLARITYCTRL_IMX95),
+};
+
+static const struct regmap_access_table dc_de_regmap_access_table_imx95 = {
+	.yes_ranges = dc_de_regmap_ranges_imx95,
+	.n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges_imx95),
+};
+
+static const struct regmap_config dc_de_top_regmap_config_imx95 = {
+	.name = "top",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_de_regmap_access_table_imx95,
+	.rd_table = &dc_de_regmap_access_table_imx95,
+	.max_register = POLARITYCTRL_IMX95,
+};
+
+static const struct dc_de_subdev_match_data dc_de_match_data_imx95 = {
+	.regmap_config = &dc_de_top_regmap_config_imx95,
+	.reg_polarityctrl = POLARITYCTRL_IMX95,
+	.info = dc_de_info_imx95,
+};
+
 static inline void dc_dec_init(struct dc_de *de)
 {
 	regmap_write_bits(de->reg_top, de->reg_polarityctrl, de->reg_polarityctrl, POLEN_HIGH);
@@ -180,6 +213,7 @@ static const struct dev_pm_ops dc_de_pm_ops = {
 
 static const struct of_device_id dc_de_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-display-engine", .data = &dc_de_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-display-engine", .data = &dc_de_match_data_imx95 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index dec8ad19bad42..b09fd8d6a2c52 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -64,7 +64,8 @@ dc_add_components(struct device *dev, struct component_match **matchptr)
 
 	for_each_available_child_of_node(dev->of_node, child) {
 		/* The interrupt controller is not a component. */
-		if (of_device_is_compatible(child, "fsl,imx8qxp-dc-intc"))
+		if (of_device_is_compatible(child, "fsl,imx8qxp-dc-intc") ||
+		    of_device_is_compatible(child, "fsl,imx95-dc-intc"))
 			continue;
 
 		drm_of_component_match_add(dev, matchptr, component_compare_of,
@@ -274,6 +275,7 @@ static const struct dev_pm_ops dc_pm_ops = {
 
 static const struct of_device_id dc_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc", },
+	{ .compatible = "fsl,imx95-dc", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 63dcad30ecced..a2f89dabd2b58 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -49,6 +49,14 @@ static const struct dc_subdev_info dc_ed_info_imx8qxp[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_subdev_info dc_ed_info_imx95[] = {
+	{ .reg_start = 0x4b511000, .id = 0, },
+	{ .reg_start = 0x4b551000, .id = 1, },
+	{ .reg_start = 0x4b521000, .id = 4, },
+	{ .reg_start = 0x4b561000, .id = 5, },
+	{ /* sentinel */ },
+};
+
 static const struct regmap_range dc_ed_pec_regmap_write_ranges[] = {
 	regmap_reg_range(PIXENGCFG_STATIC, PIXENGCFG_STATIC),
 	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
@@ -125,11 +133,27 @@ static const enum dc_link_id src_sels_imx8qxp[] = {
 	LINK_ID_LAST	/* sentinel */
 };
 
+static const enum dc_link_id src_sels_imx95[] = {
+	LINK_ID_NONE,
+	LINK_ID_LAYERBLEND5_MX95,
+	LINK_ID_LAYERBLEND4_MX95,
+	LINK_ID_LAYERBLEND3_MX95,
+	LINK_ID_LAYERBLEND2_MX95,
+	LINK_ID_LAYERBLEND1_MX95,
+	LINK_ID_LAYERBLEND0_MX95,
+	LINK_ID_LAST	/* sentinel */
+};
+
 static const struct dc_ed_subdev_match_data dc_ed_match_data_imx8qxp = {
 	.src_sels = src_sels_imx8qxp,
 	.info = dc_ed_info_imx8qxp,
 };
 
+static const struct dc_ed_subdev_match_data dc_ed_match_data_imx95 = {
+	.src_sels = src_sels_imx95,
+	.info = dc_ed_info_imx95,
+};
+
 static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
 {
 	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SHDEN, SHDEN);
@@ -289,6 +313,7 @@ static void dc_ed_remove(struct platform_device *pdev)
 
 static const struct of_device_id dc_ed_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-extdst", .data = &dc_ed_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-extdst", .data = &dc_ed_match_data_imx95 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_ed_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index e13b057a92ffb..b2477461faff5 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -51,6 +51,7 @@
 #define  COL(x)			FIELD_PREP(GENMASK(13, 0), (x))
 
 #define OFFSET_MX8QXP		0x00
+#define OFFSET_MX95		0x24
 
 #define PACFG(o)		(0x54 + (o))
 #define SACFG(o)		(0x58 + (o))
@@ -104,6 +105,12 @@ static const struct dc_subdev_info dc_fg_info_imx8qxp[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_subdev_info dc_fg_info_imx95[] = {
+	{ .reg_start = 0x4b6b0000, .id = 0, },
+	{ .reg_start = 0x4b730000, .id = 1, },
+	{ /* sentinel */ },
+};
+
 static const struct regmap_range dc_fg_regmap_write_ranges_imx8qxp[] = {
 	regmap_reg_range(FGSTCTRL, VTCFG2),
 	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
@@ -144,6 +151,46 @@ static const struct dc_fg_subdev_match_data dc_fg_match_data_imx8qxp = {
 	.info = dc_fg_info_imx8qxp,
 };
 
+static const struct regmap_range dc_fg_regmap_write_ranges_imx95[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG(OFFSET_MX95), FGSLR(OFFSET_MX95)),
+	regmap_reg_range(FGCHSTATCLR(OFFSET_MX95), FGCHSTATCLR(OFFSET_MX95)),
+};
+
+static const struct regmap_range dc_fg_regmap_read_ranges_imx95[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG(OFFSET_MX95), FGENABLE(OFFSET_MX95)),
+	regmap_reg_range(FGTIMESTAMP(OFFSET_MX95), FGCHSTAT(OFFSET_MX95)),
+};
+
+static const struct regmap_access_table dc_fg_regmap_write_table_imx95 = {
+	.yes_ranges = dc_fg_regmap_write_ranges_imx95,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges_imx95),
+};
+
+static const struct regmap_access_table dc_fg_regmap_read_table_imx95 = {
+	.yes_ranges = dc_fg_regmap_read_ranges_imx95,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges_imx95),
+};
+
+static const struct regmap_config dc_fg_regmap_config_imx95 = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fg_regmap_write_table_imx95,
+	.rd_table = &dc_fg_regmap_read_table_imx95,
+	.max_register = FGCHSTATCLR(OFFSET_MX95),
+};
+
+static const struct dc_fg_subdev_match_data dc_fg_match_data_imx95 = {
+	.regmap_config = &dc_fg_regmap_config_imx95,
+	.reg_offset = OFFSET_MX95,
+	.info = dc_fg_info_imx95,
+};
+
 static inline void dc_fg_enable_shden(struct dc_fg *fg)
 {
 	regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
@@ -380,6 +427,7 @@ static void dc_fg_remove(struct platform_device *pdev)
 
 static const struct of_device_id dc_fg_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-framegen", .data = &dc_fg_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-framegen", .data = &dc_fg_match_data_imx95 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 53647e3a395b4..3aa437120b11d 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -8,6 +8,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_fourcc.h>
@@ -27,6 +28,7 @@
 #define CONSTANTCOLOR			0x30
 #define LAYERPROPERTY			0x34
 #define FRAMEDIMENSIONS_IMX8QXP		0x150
+#define FRAMEDIMENSIONS_IMX95		0x1d8
 
 struct dc_fl {
 	struct dc_fu fu;
@@ -47,6 +49,12 @@ static const struct dc_subdev_info dc_fl_info_imx8qxp[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_subdev_info dc_fl_info_imx95[] = {
+	{ .reg_start = 0x4b5d1000, .id = 0, },
+	{ .reg_start = 0x4b5e1000, .id = 1, },
+	{ /* sentinel */ },
+};
+
 static const struct regmap_range dc_fl_regmap_ranges_imx8qxp[] = {
 	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS_IMX8QXP),
 };
@@ -77,6 +85,36 @@ static const struct dc_fl_subdev_match_data dc_fl_match_data_imx8qxp = {
 	.info = dc_fl_info_imx8qxp,
 };
 
+static const struct regmap_range dc_fl_regmap_ranges_imx95[] = {
+	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS_IMX95),
+};
+
+static const struct regmap_access_table dc_fl_regmap_access_table_imx95 = {
+	.yes_ranges = dc_fl_regmap_ranges_imx95,
+	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges_imx95),
+};
+
+static const struct regmap_config dc_fl_cfg_regmap_config_imx95 = {
+	.name = "cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fl_regmap_access_table_imx95,
+	.rd_table = &dc_fl_regmap_access_table_imx95,
+	.max_register = FRAMEDIMENSIONS_IMX95,
+};
+
+static const struct dc_fl_subdev_match_data dc_fl_match_data_imx95 = {
+	.regmap_config = &dc_fl_cfg_regmap_config_imx95,
+	.reg_offset_bbm = 0x4,
+	.reg_offset_base = 0x8,
+	.reg_offset_rest = 0x14,
+	.reg_framedimensions = FRAMEDIMENSIONS_IMX95,
+	.reg_frac_offset = 0x38,
+	.info = dc_fl_info_imx95,
+};
+
 static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
 			  const struct drm_format_info *format)
 {
@@ -152,7 +190,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	fu->link_id = LINK_ID_FETCHLAYER0;
-	fu->id = DC_FETCHUNIT_FL0;
+	fu->id = DC_FETCHUNIT_FL0 + id;
 	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
 		off = i * dc_fl_match_data->reg_frac_offset;
 		off_base = off + dc_fl_match_data->reg_offset_base;
@@ -202,6 +240,7 @@ static void dc_fl_remove(struct platform_device *pdev)
 
 static const struct of_device_id dc_fl_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-fetchlayer", .data = &dc_fl_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-fetchlayer", .data = &dc_fl_match_data_imx95 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_fl_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index c3d7e5aa4ae23..ac83642cbe4c8 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -24,8 +24,13 @@
 #define USERINTERRUPTCLEAR(n)	(0x50 + 4 * (n))
 #define USERINTERRUPTSTATUS(n)	(0x58 + 4 * (n))
 
-#define IRQ_COUNT_MAX	49
-#define REG_NUM_MAX	2
+#define INTERRUPTENABLE_MX95(n)	(0x8 + 4 * (n))
+#define INTERRUPTPRESET_MX95(n)	(0x14 + 4 * (n))
+#define INTERRUPTCLEAR_MX95(n)	(0x20 + 4 * (n))
+#define INTERRUPTSTATUS_MX95(n)	(0x2c + 4 * (n))
+
+#define IRQ_COUNT_MAX	86
+#define REG_NUM_MAX	3
 
 struct dc_ic_data {
 	struct regmap		*regs;
@@ -109,6 +114,57 @@ static const struct dc_ic_subdev_match_data dc_ic_match_data_imx8qxp = {
 	.reserved_irq = 35,
 };
 
+static const struct regmap_range dc_ic_regmap_write_ranges_imx95[] = {
+	regmap_reg_range(INTERRUPTENABLE_MX95(0), INTERRUPTCLEAR_MX95(2)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_write_table_imx95 = {
+	.yes_ranges = dc_ic_regmap_write_ranges_imx95,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_write_ranges_imx95),
+};
+
+static const struct regmap_range dc_ic_regmap_read_ranges_imx95[] = {
+	regmap_reg_range(INTERRUPTENABLE_MX95(0), INTERRUPTENABLE_MX95(2)),
+	regmap_reg_range(INTERRUPTSTATUS_MX95(0), INTERRUPTSTATUS_MX95(2)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_read_table_imx95 = {
+	.yes_ranges = dc_ic_regmap_read_ranges_imx95,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_read_ranges_imx95),
+};
+
+static const struct regmap_range dc_ic_regmap_volatile_ranges_imx95[] = {
+	regmap_reg_range(INTERRUPTPRESET_MX95(0), INTERRUPTCLEAR_MX95(2)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_volatile_table_imx95 = {
+	.yes_ranges = dc_ic_regmap_volatile_ranges_imx95,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_volatile_ranges_imx95),
+};
+
+static const struct regmap_config dc_ic_regmap_config_imx95 = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ic_regmap_write_table_imx95,
+	.rd_table = &dc_ic_regmap_read_table_imx95,
+	.volatile_table = &dc_ic_regmap_volatile_table_imx95,
+	.max_register = INTERRUPTSTATUS_MX95(2),
+};
+
+static const struct dc_ic_subdev_match_data dc_ic_match_data_imx95 = {
+	.regmap_config = &dc_ic_regmap_config_imx95,
+	.reg_enable = INTERRUPTENABLE_MX95(0),
+	.reg_clear = INTERRUPTCLEAR_MX95(0),
+	.reg_status = INTERRUPTSTATUS_MX95(0),
+	.reg_count = 3,
+	.irq_count = 86,
+	.user_irq = false,
+	.unused_irq = { 0x00000000, 0x00000000, 0xffc00000 },
+	.reserved_irq = -1,
+};
+
 static void dc_ic_irq_handler(struct irq_desc *desc)
 {
 	struct dc_ic_entry *entry = irq_desc_get_handler_data(desc);
@@ -304,6 +360,7 @@ static const struct dev_pm_ops dc_ic_pm_ops = {
 
 static const struct of_device_id dc_ic_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-intc", .data = &dc_ic_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-intc", .data = &dc_ic_match_data_imx95 },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index ba9183b244ab3..f38f338e48c4c 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -9,6 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_blend.h>
@@ -79,7 +80,7 @@ enum dc_lb_shadow_sel {
 	BOTH = 0x2,
 };
 
-static const struct dc_subdev_info dc_lb_info[] = {
+static const struct dc_subdev_info dc_lb_info_imx8qxp[] = {
 	{ .reg_start = 0x56180ba0, .id = 0, },
 	{ .reg_start = 0x56180bc0, .id = 1, },
 	{ .reg_start = 0x56180be0, .id = 2, },
@@ -87,6 +88,16 @@ static const struct dc_subdev_info dc_lb_info[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_subdev_info dc_lb_info_imx95[] = {
+	{ .reg_start = 0x4b571000, .id = 0, },
+	{ .reg_start = 0x4b581000, .id = 1, },
+	{ .reg_start = 0x4b591000, .id = 2, },
+	{ .reg_start = 0x4b5a1000, .id = 3, },
+	{ .reg_start = 0x4b5b1000, .id = 4, },
+	{ .reg_start = 0x4b5c1000, .id = 5, },
+	{ /* sentinel */ },
+};
+
 static const struct regmap_range dc_lb_pec_regmap_access_ranges[] = {
 	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
 };
@@ -163,6 +174,44 @@ static const struct dc_lb_subdev_match_data dc_lb_match_data_imx8qxp = {
 	.info = dc_lb_info_imx8qxp,
 };
 
+static const enum dc_link_id prim_sels_imx95[] = {
+	/* common options */
+	LINK_ID_NONE,
+	LINK_ID_CONSTFRAME0,
+	LINK_ID_CONSTFRAME1,
+	LINK_ID_CONSTFRAME4_MX95,
+	LINK_ID_CONSTFRAME5_MX95,
+	/*
+	 * special options:
+	 * layerblend(n) has n special options,
+	 * from layerblend0 to layerblend(n - 1), e.g.,
+	 * layerblend3 has 3 special options -
+	 * layerblend0/1/2.
+	 */
+	LINK_ID_LAYERBLEND0_MX95,
+	LINK_ID_LAYERBLEND1_MX95,
+	LINK_ID_LAYERBLEND2_MX95,
+	LINK_ID_LAYERBLEND3_MX95,
+	LINK_ID_LAYERBLEND4_MX95,
+	LINK_ID_LAYERBLEND5_MX95,
+	LINK_ID_LAST
+};
+
+static const enum dc_link_id sec_sels_imx95[] = {
+	LINK_ID_NONE,
+	LINK_ID_FETCHLAYER0,
+	LINK_ID_FETCHLAYER1_MX95,
+	LINK_ID_LAST
+};
+
+static const struct dc_lb_subdev_match_data dc_lb_match_data_imx95 = {
+	.pri_sels = prim_sels_imx95,
+	.sec_sels = sec_sels_imx95,
+	.first_lb = LINK_ID_LAYERBLEND0_MX95,
+	.last_cf = 7,
+	.info = dc_lb_info_imx95,
+};
+
 enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
 {
 	return lb->link;
@@ -333,6 +382,7 @@ static void dc_lb_remove(struct platform_device *pdev)
 
 static const struct of_device_id dc_lb_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-layerblend", .data = &dc_lb_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-layerblend", .data = &dc_lb_match_data_imx95 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_lb_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 492d193127bc1..c7a50749db38f 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -19,16 +19,25 @@
 #define CLKEN(n)		((n) << CLKEN_MASK_SHIFT)
 
 #define DC_DISP_FU_CNT		2
-#define DC_LB_CNT		4
+#define DC_LB_CNT		6
 
 enum dc_link_id {
 	LINK_ID_NONE			= 0x00,
 	LINK_ID_CONSTFRAME0		= 0x0c,
+	LINK_ID_CONSTFRAME4_MX95	= 0x0d,
 	LINK_ID_CONSTFRAME4_MX8QXP	= 0x0e,
 	LINK_ID_CONSTFRAME1		= 0x10,
+	LINK_ID_CONSTFRAME5_MX95	= 0x11,
 	LINK_ID_CONSTFRAME5_MX8QXP	= 0x12,
+	LINK_ID_LAYERBLEND0_MX95	= 0x14,
+	LINK_ID_LAYERBLEND1_MX95	= 0x15,
+	LINK_ID_LAYERBLEND2_MX95	= 0x16,
+	LINK_ID_LAYERBLEND3_MX95	= 0x17,
+	LINK_ID_LAYERBLEND4_MX95	= 0x18,
+	LINK_ID_LAYERBLEND5_MX95	= 0x19,
 	LINK_ID_FETCHWARP2		= 0x14,
 	LINK_ID_FETCHLAYER0		= 0x1a,
+	LINK_ID_FETCHLAYER1_MX95	= 0x1b,
 	LINK_ID_LAYERBLEND0_MX8QXP	= 0x21,
 	LINK_ID_LAYERBLEND1_MX8QXP	= 0x22,
 	LINK_ID_LAYERBLEND2_MX8QXP	= 0x23,
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 1f287706e8706..9a08fcabc625a 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -37,6 +37,12 @@ static const struct dc_subdev_info dc_tc_info_imx8qxp[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_subdev_info dc_tc_info_imx95[] = {
+	{ .reg_start = 0x4b711000, .id = 0, },
+	{ .reg_start = 0x4b771000, .id = 1, },
+	{ /* sentinel */ },
+};
+
 static const struct regmap_range dc_tc_regmap_ranges[] = {
 	regmap_reg_range(TCON_CTRL, TCON_CTRL),
 	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
@@ -72,6 +78,11 @@ static const struct dc_tc_subdev_match_data dc_tc_match_data_imx8qxp = {
 	.info = dc_tc_info_imx8qxp,
 };
 
+static const struct dc_tc_subdev_match_data dc_tc_match_data_imx95 = {
+	.need_config = false,
+	.info = dc_tc_info_imx95,
+};
+
 void dc_tc_init(struct dc_tc *tc)
 {
 	if (!tc->need_config)
@@ -149,6 +160,7 @@ static void dc_tc_remove(struct platform_device *pdev)
 
 static const struct of_device_id dc_tc_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-dc-tcon", .data = &dc_tc_match_data_imx8qxp },
+	{ .compatible = "fsl,imx95-dc-tcon", .data = &dc_tc_match_data_imx95 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
-- 
2.51.0

