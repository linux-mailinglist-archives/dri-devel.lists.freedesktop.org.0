Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FCC80193
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1950510E216;
	Mon, 24 Nov 2025 11:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="ivry/nBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com
 [136.143.184.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7E10E216
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:08:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763981616; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JqLGk9CMYHVxJSH23qAVTuWE3M/So4p8VOLUCFJBt3VloPNtuBzTE4C9kEfNzlD90Oc1AO/HhVnr91CWFwVSfwr+SfTgfSwwwJmQad19JaJTYmlAFuncsx3YUIrQovr9XLEJ8BEtkDUaExas39iWRtAk9xMZU2H+YZXx3zLstEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763981616;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=v/bQBWdiNB6NaZ7Xo/O8M+e5lWsgBxprVTyRk/BZMmU=; 
 b=GgOgkTKJEWJFikljsJThPxKAK72cQu6gytXzDfnHAxcYBJ8G8maPpzSDwSE2PDkLrtlUdI5BNgCUu+N/kdJhZwaDB7bVFukGwgOdEp9YzqDigJR81ZVsi8j5QyeYQuJytyv2+87z/AbbIuuBqoDg6Vg/qHQCmUGnBW2JOE/qBIQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763981616; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=v/bQBWdiNB6NaZ7Xo/O8M+e5lWsgBxprVTyRk/BZMmU=;
 b=ivry/nBp1S06bD24Ih+bR6wn3qIexPFp12b1KuwYd8ZFPT1ts9vJ2uyRlQOwUsf2
 hUO/M3ohQo6BANRtRIr3qYD0F3fyOrpxXlZGCoFl/wUUKmghqea2gtUFPIyz6nFZ3U7
 OQMmGVdIjEM5m37YMNtVP3KmZPd2Km3o2i44nSWcEXLqbEedSa+T6EH98P83FeFvkkR
 ZHtmmRQdLyJyKjyHf6plJIHewrIl+YCYzLdGdgXaj3liADW1fxcTkY/lcfPoxEhXhsd
 tJHbTpywniVbvvpsUYw/4Nv2L24y5XKdi/6KqZ89LfXnk/40R1y8+Yn4rzlrEK0s/VR
 PmqO+UcUJw==
Received: by mx.zohomail.com with SMTPS id 1763981613788960.0352087665683;
 Mon, 24 Nov 2025 02:53:33 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Date: Mon, 24 Nov 2025 18:52:22 +0800
Message-ID: <20251124105226.2860845-6-uwu@icenowy.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124105226.2860845-1-uwu@icenowy.me>
References: <20251124105226.2860845-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller (paired
with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from the
display controller.

Add a driver for this controller utilizing the common DesignWare HDMI
code in the kernel.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v3.

Changes in v2:
- Created a new function to set PHY parameters and refactored the
  control flow of the configure_phy callback.

 MAINTAINERS                             |   1 +
 drivers/gpu/drm/bridge/Kconfig          |  10 ++
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173 ++++++++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e..32715100a1e10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22175,6 +22175,7 @@ F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	drivers/firmware/thead,th1520-aon.c
+F:	drivers/gpu/drm/bridge/th1520-dw-hdmi.c
 F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d6622..8e19f5fb9ad7c 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -335,6 +335,16 @@ config DRM_THINE_THC63LVD1024
 	help
 	  Thine THC63LVD1024 LVDS/parallel converter driver.
 
+config DRM_THEAD_TH1520_DW_HDMI
+	tristate "T-Head TH1520 DesignWare HDMI bridge"
+	depends on OF
+	depends on COMMON_CLK
+	depends on ARCH_THEAD || COMPILE_TEST
+	select DRM_DW_HDMI
+	help
+	  Choose this to enable support for the internal HDMI bridge found
+	  on the T-Head TH1520 SoC.
+
 config DRM_TOSHIBA_TC358762
 	tristate "TC358762 DSI/DPI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e592..085b5db45d6fd 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
 obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
 obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
+obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
new file mode 100644
index 0000000000000..389eead5f1c45
--- /dev/null
+++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on rcar_dw_hdmi.c, which is:
+ *   Copyright (C) 2016 Renesas Electronics Corporation
+ * Based on imx8mp-hdmi-tx.c, which is:
+ *   Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
+ */
+
+#include <linux/clk.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_modes.h>
+
+#define TH1520_HDMI_PHY_OPMODE_PLLCFG	0x06	/* Mode of operation and PLL dividers */
+#define TH1520_HDMI_PHY_CKSYMTXCTRL	0x09	/* Clock Symbol and Transmitter Control Register */
+#define TH1520_HDMI_PHY_VLEVCTRL	0x0e	/* Voltage Level Control Register */
+#define TH1520_HDMI_PHY_PLLCURRGMPCTRL	0x10	/* PLL current and Gmp (conductance) */
+#define TH1520_HDMI_PHY_PLLDIVCTRL	0x11	/* PLL dividers */
+#define TH1520_HDMI_PHY_TXTERM		0x19	/* Transmission Termination Register */
+
+struct th1520_hdmi_phy_params {
+	unsigned long mpixelclock;
+	u16 opmode_pllcfg;
+	u16 pllcurrgmpctrl;
+	u16 plldivctrl;
+	u16 cksymtxctrl;
+	u16 vlevctrl;
+	u16 txterm;
+};
+
+static const struct th1520_hdmi_phy_params th1520_hdmi_phy_params[] = {
+	{ 35500000,  0x0003, 0x0283, 0x0628, 0x8088, 0x01a0, 0x0007 },
+	{ 44900000,  0x0003, 0x0285, 0x0228, 0x8088, 0x01a0, 0x0007 },
+	{ 71000000,  0x0002, 0x1183, 0x0614, 0x8088, 0x01a0, 0x0007 },
+	{ 90000000,  0x0002, 0x1142, 0x0214, 0x8088, 0x01a0, 0x0007 },
+	{ 121750000, 0x0001, 0x20c0, 0x060a, 0x8088, 0x01a0, 0x0007 },
+	{ 165000000, 0x0001, 0x2080, 0x020a, 0x8088, 0x01a0, 0x0007 },
+	{ 198000000, 0x0000, 0x3040, 0x0605, 0x83c8, 0x0120, 0x0004 },
+	{ 297000000, 0x0000, 0x3041, 0x0205, 0x81dc, 0x0200, 0x0005 },
+	{ 371250000, 0x0640, 0x3041, 0x0205, 0x80f6, 0x0140, 0x0000 },
+	{ 495000000, 0x0640, 0x3080, 0x0005, 0x80f6, 0x0140, 0x0000 },
+	{ 594000000, 0x0640, 0x3080, 0x0005, 0x80fa, 0x01e0, 0x0004 },
+};
+
+struct th1520_hdmi {
+	struct dw_hdmi_plat_data plat_data;
+	struct dw_hdmi *dw_hdmi;
+	struct clk *pixclk;
+	struct reset_control *mainrst, *prst;
+};
+
+static enum drm_mode_status
+th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+		       const struct drm_display_info *info,
+		       const struct drm_display_mode *mode)
+{
+	/*
+	 * The maximum supported clock frequency is 594 MHz, as shown in the PHY
+	 * parameters table.
+	 */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void th1520_hdmi_phy_set_params(struct dw_hdmi *hdmi,
+				const struct th1520_hdmi_phy_params *params)
+{
+	dw_hdmi_phy_i2c_write(hdmi, params->opmode_pllcfg,
+			      TH1520_HDMI_PHY_OPMODE_PLLCFG);
+	dw_hdmi_phy_i2c_write(hdmi, params->pllcurrgmpctrl,
+			      TH1520_HDMI_PHY_PLLCURRGMPCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->plldivctrl,
+			      TH1520_HDMI_PHY_PLLDIVCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->vlevctrl,
+			      TH1520_HDMI_PHY_VLEVCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->cksymtxctrl,
+			      TH1520_HDMI_PHY_CKSYMTXCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->txterm,
+			      TH1520_HDMI_PHY_TXTERM);
+}
+
+static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
+				     unsigned long mpixelclock)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_hdmi_phy_params); i++) {
+		if (mpixelclock <= th1520_hdmi_phy_params[i].mpixelclock) {
+			th1520_hdmi_phy_set_params(hdmi,
+						   &th1520_hdmi_phy_params[i]);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int th1520_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct th1520_hdmi *hdmi;
+	struct dw_hdmi_plat_data *plat_data;
+	struct device *dev = &pdev->dev;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	plat_data = &hdmi->plat_data;
+
+	hdmi->pixclk = devm_clk_get_enabled(dev, "pix");
+	if (IS_ERR(hdmi->pixclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
+				     "Unable to get pixel clock\n");
+
+	hdmi->mainrst = devm_reset_control_get_exclusive_deasserted(dev, "main");
+	if (IS_ERR(hdmi->mainrst))
+		return dev_err_probe(dev, PTR_ERR(hdmi->mainrst),
+				     "Unable to get main reset\n");
+
+	hdmi->prst = devm_reset_control_get_exclusive_deasserted(dev, "apb");
+	if (IS_ERR(hdmi->prst))
+		return dev_err_probe(dev, PTR_ERR(hdmi->prst),
+				     "Unable to get apb reset\n");
+
+	plat_data->output_port = 1;
+	plat_data->mode_valid = th1520_hdmi_mode_valid;
+	plat_data->configure_phy = th1520_hdmi_phy_configure;
+	plat_data->priv_data = hdmi;
+
+	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	platform_set_drvdata(pdev, hdmi);
+
+	return 0;
+}
+
+static void th1520_dw_hdmi_remove(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	dw_hdmi_remove(hdmi);
+}
+
+static const struct of_device_id th1520_dw_hdmi_of_table[] = {
+	{ .compatible = "thead,th1520-dw-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, th1520_dw_hdmi_of_table);
+
+static struct platform_driver th1520_dw_hdmi_platform_driver = {
+	.probe		= th1520_dw_hdmi_probe,
+	.remove		= th1520_dw_hdmi_remove,
+	.driver		= {
+		.name	= "th1520-dw-hdmi",
+		.of_match_table = th1520_dw_hdmi_of_table,
+	},
+};
+
+module_platform_driver(th1520_dw_hdmi_platform_driver);
+
+MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
+MODULE_DESCRIPTION("T-Head TH1520 HDMI Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

