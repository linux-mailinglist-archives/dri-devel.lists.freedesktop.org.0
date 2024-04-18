Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A58A9575
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 10:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0443B10FA3B;
	Thu, 18 Apr 2024 08:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="zq1qnT6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838CB10FA3B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713430726; x=1744966726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2jlRNOXggWGS+80SIZCeSvACFd9ff6EoKfaMoBRQFJg=;
 b=zq1qnT6INDQ2zRxghgE0Jh45OTufK5Smxgb+EBQtwpm9iqTqqDHfzjl5
 bJu1UuA4KjTe2dBl0oQgnz51D0Bo0pj+dvHVJ8GiBv41pVDV8DeWGm0ty
 KCWMbqq4NmZsZ9CbjoEsvCfffRRpzXTRvFahXrPSsTdJzw7rn2QOMdgxf
 doKGqMyxhX5GpN+1zWERCt15kroxgEhJM17P1H/rWjvJt7lFYLsQQ7lxw
 o2n4SsmYWiP1XvMfJD7mQ2OiPwndoNclkvixI8XhSlTXatFdcu7ZEVJiJ
 9b5y6kX/rC+8JK5zLvVBJy404zf6aomN/Ygus3g5WM6xIJAkh1oblgp5p g==;
X-CSE-ConnectionGUID: laatkwQ1Ty++ty3yTjSAXA==
X-CSE-MsgGUID: 436fqXSYSxOFMSIgDb0M4Q==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; d="scan'208";a="23593212"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2024 01:58:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 01:58:33 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 01:58:21 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: "dmitry . baryshkov @ linaro . org" <dmitry.baryshkov@linaro.org>,
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, "neil . armstrong
 @ linaro . org" <neil.armstrong@linaro.org>, "rfoss @ kernel . org"
 <rfoss@kernel.org>, "Laurent . pinchart @ ideasonboard . com"
 <Laurent.pinchart@ideasonboard.com>, "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, "maarten .
 lankhorst @ linux . intel . com" <maarten.lankhorst@linux.intel.com>,
 "mripard @ kernel . org" <mripard@kernel.org>, "tzimmermann @ suse . de"
 <tzimmermann@suse.de>, "airlied @ gmail . com" <airlied@gmail.com>, "daniel @
 ffwll . ch" <daniel@ffwll.ch>, "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
 "krzysztof . kozlowski+dt @ linaro . org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt @ kernel . org"
 <conor+dt@kernel.org>, "linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, "alexandre
 . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>, "claudiu . beznea
 @ tuxon . dev" <claudiu.beznea@tuxon.dev>, "Manikandan . M @ microchip . com"
 <Manikandan.M@microchip.com>, "arnd @ arndb . de" <arnd@arndb.de>,
 "geert+renesas @ glider . be" <geert+renesas@glider.be>, "Jason @ zx2c4 .
 com" <Jason@zx2c4.com>, "mpe @ ellerman . id . au" <mpe@ellerman.id.au>,
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>, "rdunlap @ infradead . org"
 <rdunlap@infradead.org>, "vbabka @ suse . cz" <vbabka@suse.cz>, "dri-devel @
 lists . freedesktop . org" <dri-devel@lists.freedesktop.org>, "devicetree @
 vger . kernel . org" <devicetree@vger.kernel.org>, "linux-kernel @ vger .
 kernel . org" <linux-kernel@vger.kernel.org>, "oe-kbuild-all @ lists . linux
 . dev" <oe-kbuild-all@lists.linux.dev>, "Hari . PrasathGE @ microchip . com"
 <Hari.PrasathGE@microchip.com>
CC: Dharma Balasubiramani <dharma.b@microchip.com>, Manikandan Muralidharan
 <manikandan.m@microchip.com>, Hari Prasath Gujulan Elango
 <hari.prasathge@microchip.com>
Subject: [PATCH v7 2/4] drm/bridge: add lvds controller support for sam9x7
Date: Thu, 18 Apr 2024 14:27:23 +0530
Message-ID: <20240418085725.373797-3-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418085725.373797-1-dharma.b@microchip.com>
References: <20240418085725.373797-1-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add a new LVDS controller driver for sam9x7 which does the following:
- Prepares and enables the LVDS Peripheral clock
- Defines its connector type as DRM_MODE_CONNECTOR_LVDS and adds itself
to the global bridge list.
- Identifies its output endpoint as panel and adds it to the encoder
display pipeline
- Enables the LVDS serializer

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
---
Changelog
v6 -> v7
- Remove setting encoder type from bridge driver.
- Drop clk_disable() from pm_runtime_get_sync() error handling.
- Use devm_clk_get() instead of prepared version.
- Hence use clk_prepare_enable() and clk_disable_unprepare().
- Use devm_drm_of_get_bridge() instead of devm_drm_panel_bridge_add().
- Add error check for devm_pm_runtime_enable().
- Use dev_err() instead of DRM_DEV_ERROR() as it is deprecated.
- Add missing Acked-by tag.
v5 -> v6
- No Changes.
v4 -> v5
- Drop the unused variable 'format'.
- Use DRM wrapper for dev_err() to maintain uniformity.
- return -ENODEV instead of -EINVAL to maintain consistency with other DRM
  bridge drivers.
v3 -> v4
- No changes.
v2 ->v3
- Correct Typo error "serializer".
- Consolidate get() and prepare() functions and use devm_clk_get_prepared().
- Remove unused variable 'ret' in probe().
- Use devm_pm_runtime_enable() and drop the mchp_lvds_remove().
v1 -> v2
- Drop 'res' variable and combine two lines into one.
- Handle deferred probe properly, use dev_err_probe().
- Don't print anything on deferred probe. Dropped print.
- Remove the MODULE_ALIAS and add MODULE_DEVICE_TABLE().
- symbol 'mchp_lvds_driver' was not declared. It should be static.
---
 drivers/gpu/drm/bridge/Kconfig          |   7 +
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/microchip-lvds.c | 229 ++++++++++++++++++++++++
 3 files changed, 237 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index efd996f6c138..889098e2d65f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -190,6 +190,13 @@ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
 	  to DP++. This is used with the i.MX6 imx-ldb
 	  driver. You are likely to say N here.
 
+config DRM_MICROCHIP_LVDS_SERIALIZER
+	tristate "Microchip LVDS serializer support"
+	depends on OF
+	depends on DRM_ATMEL_HLCDC
+	help
+	  Support for Microchip's LVDS serializer.
+
 config DRM_NWL_MIPI_DSI
 	tristate "Northwest Logic MIPI DSI Host controller"
 	depends on DRM
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 017b5832733b..7df87b582dca 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
+obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
new file mode 100644
index 000000000000..17a93c3c72d4
--- /dev/null
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Manikandan Muralidharan <manikandan.m@microchip.com>
+ * Author: Dharma Balasubiramani <dharma.b@microchip.com>
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_graph.h>
+#include <linux/pinctrl/devinfo.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#define LVDS_POLL_TIMEOUT_MS 1000
+
+/* LVDSC register offsets */
+#define LVDSC_CR	0x00
+#define LVDSC_CFGR	0x04
+#define LVDSC_SR	0x0C
+#define LVDSC_WPMR	0xE4
+
+/* Bitfields in LVDSC_CR (Control Register) */
+#define LVDSC_CR_SER_EN	BIT(0)
+
+/* Bitfields in LVDSC_CFGR (Configuration Register) */
+#define LVDSC_CFGR_PIXSIZE_24BITS	0
+#define LVDSC_CFGR_DEN_POL_HIGH		0
+#define LVDSC_CFGR_DC_UNBALANCED	0
+#define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
+
+/*Bitfields in LVDSC_SR */
+#define LVDSC_SR_CS	BIT(0)
+
+/* Bitfields in LVDSC_WPMR (Write Protection Mode Register) */
+#define LVDSC_WPMR_WPKEY_MASK	GENMASK(31, 8)
+#define LVDSC_WPMR_WPKEY_PSSWD	0x4C5644
+
+struct mchp_lvds {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk *pclk;
+	struct drm_panel *panel;
+	struct drm_bridge bridge;
+	struct drm_bridge *panel_bridge;
+};
+
+static inline struct mchp_lvds *bridge_to_lvds(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct mchp_lvds, bridge);
+}
+
+static inline u32 lvds_readl(struct mchp_lvds *lvds, u32 offset)
+{
+	return readl_relaxed(lvds->regs + offset);
+}
+
+static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
+{
+	writel_relaxed(val, lvds->regs + offset);
+}
+
+static void lvds_serialiser_on(struct mchp_lvds *lvds)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
+
+	/* The LVDSC registers can only be written if WPEN is cleared */
+	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
+				LVDSC_WPMR_WPKEY_MASK));
+
+	/* Wait for the status of configuration registers to be changed */
+	while (lvds_readl(lvds, LVDSC_SR) & LVDSC_SR_CS) {
+		if (time_after(jiffies, timeout)) {
+			dev_err(lvds->dev, "%s: timeout error\n", __func__);
+			return;
+		}
+		usleep_range(1000, 2000);
+	}
+
+	/* Configure the LVDSC */
+	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
+				LVDSC_CFGR_DC_UNBALANCED |
+				LVDSC_CFGR_DEN_POL_HIGH |
+				LVDSC_CFGR_PIXSIZE_24BITS));
+
+	/* Enable the LVDS serializer */
+	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
+}
+
+static int mchp_lvds_attach(struct drm_bridge *bridge,
+			    enum drm_bridge_attach_flags flags)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+
+	return drm_bridge_attach(bridge->encoder, lvds->panel_bridge,
+				 bridge, flags);
+}
+
+static void mchp_lvds_enable(struct drm_bridge *bridge)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+	int ret;
+
+	ret = clk_prepare_enable(lvds->pclk);
+	if (ret < 0) {
+		dev_err(lvds->dev, "failed to enable lvds pclk %d\n", ret);
+		return;
+	}
+
+	ret = pm_runtime_get_sync(lvds->dev);
+	if (ret < 0) {
+		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
+		return;
+	}
+
+	lvds_serialiser_on(lvds);
+}
+
+static void mchp_lvds_disable(struct drm_bridge *bridge)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+
+	pm_runtime_put(lvds->dev);
+	clk_disable_unprepare(lvds->pclk);
+}
+
+static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
+	.attach = mchp_lvds_attach,
+	.enable = mchp_lvds_enable,
+	.disable = mchp_lvds_disable,
+};
+
+static int mchp_lvds_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mchp_lvds *lvds;
+	struct device_node *port;
+	int ret;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
+	if (!lvds)
+		return -ENOMEM;
+
+	lvds->dev = dev;
+
+	lvds->regs = devm_ioremap_resource(lvds->dev,
+			platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	if (IS_ERR(lvds->regs))
+		return PTR_ERR(lvds->regs);
+
+	lvds->pclk = devm_clk_get(lvds->dev, "pclk");
+	if (IS_ERR(lvds->pclk))
+		return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
+				"could not get pclk_lvds\n");
+
+	port = of_graph_get_remote_node(dev->of_node, 1, 0);
+	if (!port) {
+		dev_err(dev,
+			"can't find port point, please init lvds panel port!\n");
+		return -ENODEV;
+	}
+
+	lvds->panel = of_drm_find_panel(port);
+	of_node_put(port);
+
+	if (IS_ERR(lvds->panel))
+		return -EPROBE_DEFER;
+
+	lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+
+	if (IS_ERR(lvds->panel_bridge))
+		return PTR_ERR(lvds->panel_bridge);
+
+	lvds->bridge.of_node = dev->of_node;
+	lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
+	lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
+
+	dev_set_drvdata(dev, lvds);
+	devm_pm_runtime_enable(dev);
+	if (ret < 0) {
+		dev_err(lvds->dev, "failed to enable pm runtime: %d\n", ret);
+		return ret;
+	}
+
+	drm_bridge_add(&lvds->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id mchp_lvds_dt_ids[] = {
+	{
+		.compatible = "microchip,sam9x75-lvds",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mchp_lvds_dt_ids);
+
+static struct platform_driver mchp_lvds_driver = {
+	.probe = mchp_lvds_probe,
+	.driver = {
+		   .name = "microchip-lvds",
+		   .of_match_table = mchp_lvds_dt_ids,
+	},
+};
+module_platform_driver(mchp_lvds_driver);
+
+MODULE_AUTHOR("Manikandan Muralidharan <manikandan.m@microchip.com>");
+MODULE_AUTHOR("Dharma Balasubiramani <dharma.b@microchip.com>");
+MODULE_DESCRIPTION("Low Voltage Differential Signaling Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

