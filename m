Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7790018C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAFA10EBE1;
	Fri,  7 Jun 2024 11:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="CfHqxUF7";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZfAmA4+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B4A10EBE0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:04:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id C329F1C000FA;
 Fri,  7 Jun 2024 07:04:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 07 Jun 2024 07:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1717758246; x=
 1717844646; bh=zpI9ehufM0aDHbHqGz0gA6WO8NMW/N2RNXSC8dVQYOI=; b=C
 fHqxUF7Na+c62pO24unsdvE8y+ECYn8NC5++xbw+SDccXtqnk2FxJw5SGtr9H0rb
 NoZf7jEok3LSg8B4AoJGXKySi8VSjkmpzhHiWJWhnutQp6OyCy+gZXihAw36Aj3u
 nMLf2AUrgQyxJjT+jp+b3FmUK3w3mmZFF9s9+kCZsE+p74DBqbqKXS7R7WISNwv9
 zDBe0bcZ8YCAT+HRksca10takfJvs6loMZg1MC5awE+UkEsu/qBEg5I7SCXSGvps
 aqYgS/f2mapw55TpsbpONpqf4/DyWl1xkz1nmkGHvdlZmcAlmEH9ujB3iHaSwmXX
 4k82rSlO6CEvDI1AlSZ4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758246; x=
 1717844646; bh=zpI9ehufM0aDHbHqGz0gA6WO8NMW/N2RNXSC8dVQYOI=; b=Z
 fAmA4+JV1plPuoWcCxFeYhow/7Km1HtgL4baizuh2pOSSrWkrHLx/EQJb0Ri3hTK
 NkLt2xcHeNs61B/srRJ7OG8BIs7E6HBuVYyspcMPWIdeCzD2y7lOD946uwwFYQun
 TpbUhMnGdtJPxGy0m3qG0IUetoTLduKaBxrO3+Jext8u/t1bGdcF941Ep/uKvdRz
 rWXH7Kl0eReo4u80mgmlz4NhhYLO/tTYzm/T3kuOXKagMYcogihTChd+uZ+W4zMh
 HXCFqLUaB7wGokLPH4Ye+IO3u/TfOXHCD5Mfs+lzCVdfMQpEisW3iDhFSZnmei6t
 mlpRwVyPz5d//HDo+sxgg==
X-ME-Sender: <xms:JuliZhhIkGSBt5caIP_ryKtsiTsh-0WYKFjIhfYWqeml_PKA1ca-bg>
 <xme:JuliZmBeSgD17A0ZymSOs0gEBiqvmQA6chfv-dSOmgbIVWr-9xMbmh2WVEsN9AzmK
 fUThHVb4rLXFLWtzA>
X-ME-Received: <xmr:JuliZhHHVCjNlgFSKMs5_FR4NDKl_HLIl8gXsV5vm2W8Eq9i6vdHNNY5FYhcUI7OGA9ATaSIThbhLYtmQtsH35MGH-TWN07S6aYqNysJtfDunwaj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:JuliZmR0gd1D6OuO3dfMME-ulMGI1FQe6rA5eoaVDZd8WZV8xWLkow>
 <xmx:JuliZuwqJN83WtBGOKuYiRS1oErxVOnzHAVXpiMbKdtriwFEbEUCxA>
 <xmx:JuliZs7qbDsmO5xS-_U5dplW4g6NxPVlH8nFaCddZGErQ7uPcX-73Q>
 <xmx:JuliZjyf2rSs2kWwreOzQjUUzCp8Xk-4hS-9X4aG3Z53565NpxYzng>
 <xmx:JuliZlhOgywaSxlvLyClLqQk_IIyGDlSN-TZ4ziAMO3d_hKtrsQL2HNV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:03:59 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH RFC 8/8] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Fri,  7 Jun 2024 23:00:04 +1200
Message-ID: <20240607110227.49848-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
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

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

Notable features (from the H616 datasheet and implemented):
- 4096 x 2048 (4K) output support
- AFBC ARM Frame Buffer Compression support
- YUV420 input support

Extend the driver to support the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/clk/sunxi-ng/Makefile           |   2 +-
 drivers/clk/sunxi-ng/sun8i-de33.c       | 185 +++++++++++++++++++++
 drivers/clk/sunxi-ng/sun8i-de33.h       |  19 +++
 drivers/gpu/drm/sun4i/sun4i_tcon.c      |   4 +
 drivers/gpu/drm/sun4i/sun4i_tcon.h      |   1 +
 drivers/gpu/drm/sun4i/sun50i_afbc.c     |  16 +-
 drivers/gpu/drm/sun4i/sun50i_fmt.c      |  75 ++++++---
 drivers/gpu/drm/sun4i/sun50i_fmt.h      |  21 ++-
 drivers/gpu/drm/sun4i/sun8i_csc.c       |  98 ++++++++++-
 drivers/gpu/drm/sun4i/sun8i_csc.h       |   3 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 209 +++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  31 +++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |  36 ++--
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  33 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 115 ++++++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |   3 +-
 17 files changed, 703 insertions(+), 150 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/sun8i-de33.c
 create mode 100644 drivers/clk/sunxi-ng/sun8i-de33.h

diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index 6b3ae2b620db6..fce8a1ce61137 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -68,7 +68,7 @@ sun8i-a83t-ccu-y		+= ccu-sun8i-a83t.o
 sun8i-h3-ccu-y			+= ccu-sun8i-h3.o
 sun8i-r40-ccu-y			+= ccu-sun8i-r40.o
 sun8i-v3s-ccu-y			+= ccu-sun8i-v3s.o
-sun8i-de2-ccu-y			+= ccu-sun8i-de2.o
+sun8i-de2-ccu-y			+= ccu-sun8i-de2.o sun8i-de33.o
 sun8i-r-ccu-y			+= ccu-sun8i-r.o
 sun9i-a80-ccu-y			+= ccu-sun9i-a80.o
 sun9i-a80-de-ccu-y		+= ccu-sun9i-a80-de.o
diff --git a/drivers/clk/sunxi-ng/sun8i-de33.c b/drivers/clk/sunxi-ng/sun8i-de33.c
new file mode 100644
index 0000000000000..4287dafbc26e4
--- /dev/null
+++ b/drivers/clk/sunxi-ng/sun8i-de33.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "ccu_common.h"
+#include "ccu_div.h"
+#include "ccu_gate.h"
+#include "ccu_reset.h"
+
+#include "sun8i-de33.h"
+
+static SUNXI_CCU_GATE(bus_mixer0_clk,	"bus-mixer0",	"bus-de",
+		      0x04, BIT(0), 0);
+static SUNXI_CCU_GATE(bus_mixer1_clk,	"bus-mixer1",	"bus-de",
+		      0x04, BIT(1), 0);
+static SUNXI_CCU_GATE(bus_wb_clk,	"bus-wb",	"bus-de",
+		      0x04, BIT(2), 0);
+
+static SUNXI_CCU_GATE(mixer0_clk,	"mixer0",	"mixer0-div",
+		      0x00, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_clk,	"mixer1",	"mixer1-div",
+		      0x00, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
+		      0x00, BIT(2), CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
+		   CLK_SET_RATE_PARENT);
+static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
+		   CLK_SET_RATE_PARENT);
+static SUNXI_CCU_M(wb_div_clk, "wb-div", "de", 0x0c, 8, 4,
+		   CLK_SET_RATE_PARENT);
+
+static struct ccu_common *sun50i_h616_de33_clks[] = {
+	&mixer0_clk.common,
+	&mixer1_clk.common,
+	&wb_clk.common,
+
+	&bus_mixer0_clk.common,
+	&bus_mixer1_clk.common,
+	&bus_wb_clk.common,
+
+	&mixer0_div_clk.common,
+	&mixer1_div_clk.common,
+	&wb_div_clk.common,
+};
+
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_clk.common.hw,
+		[CLK_WB]		= &wb_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_clk.common.hw,
+		[CLK_BUS_MIXER1]	= &bus_mixer1_clk.common.hw,
+		[CLK_BUS_WB]		= &bus_wb_clk.common.hw,
+
+		[CLK_MIXER0_DIV]	= &mixer0_div_clk.common.hw,
+		[CLK_MIXER1_DIV]	= &mixer1_div_clk.common.hw,
+		[CLK_WB_DIV]		= &wb_div_clk.common.hw,
+	},
+	.num	= CLK_NUMBER,
+};
+
+static struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x08, BIT(0) },
+	[RST_MIXER1]	= { 0x08, BIT(1) },
+	[RST_WB]	= { 0x08, BIT(2) },
+};
+
+static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
+	.ccu_clks	= sun50i_h616_de33_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun50i_h616_de33_clks),
+
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
+
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
+};
+
+static int sunxi_de33_clk_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct clk *bus_clk, *mod_clk;
+	struct reset_control *rstc;
+	void __iomem *reg;
+	const struct sunxi_ccu_desc *ccu_desc;
+	int ret;
+
+	ccu_desc = of_device_get_match_data(&pdev->dev);
+	if (!ccu_desc)
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	reg = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	bus_clk = devm_clk_get(&pdev->dev, "bus");
+	if (IS_ERR(bus_clk)) {
+		ret = PTR_ERR(bus_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);
+		return ret;
+	}
+
+	mod_clk = devm_clk_get(&pdev->dev, "mod");
+	if (IS_ERR(mod_clk)) {
+		ret = PTR_ERR(mod_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Couldn't get mod clk: %d\n", ret);
+		return ret;
+	}
+
+	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(rstc)) {
+		ret = PTR_ERR(rstc);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Couldn't get reset control: %d\n", ret);
+		return ret;
+	}
+
+	/* The clocks need to be enabled for us to access the registers */
+	ret = clk_prepare_enable(bus_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Couldn't enable bus clk: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(mod_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Couldn't enable mod clk: %d\n", ret);
+		goto err_disable_bus_clk;
+	}
+
+	/* The reset control needs to be asserted for the controls to work */
+	ret = reset_control_deassert(rstc);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Couldn't deassert reset control: %d\n", ret);
+		goto err_disable_mod_clk;
+	}
+
+	writel(0, reg + 0x24);
+	writel(0x0000A980, reg + 0x28);
+
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
+	if (ret)
+		goto err_assert_reset;
+
+	return 0;
+
+err_assert_reset:
+	reset_control_assert(rstc);
+err_disable_mod_clk:
+	clk_disable_unprepare(mod_clk);
+err_disable_bus_clk:
+	clk_disable_unprepare(bus_clk);
+	return ret;
+}
+
+static const struct of_device_id sunxi_de33_clk_ids[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-clk",
+		.data = &sun50i_h616_de33_clk_desc,
+	},
+	{ }
+};
+
+static struct platform_driver sunxi_de33_clk_driver = {
+	.probe	= sunxi_de33_clk_probe,
+	.driver	= {
+		.name	= "sunxi-de33-clks",
+		.of_match_table	= sunxi_de33_clk_ids,
+	},
+};
+builtin_platform_driver(sunxi_de33_clk_driver);
diff --git a/drivers/clk/sunxi-ng/sun8i-de33.h b/drivers/clk/sunxi-ng/sun8i-de33.h
new file mode 100644
index 0000000000000..83cbef5a3f76f
--- /dev/null
+++ b/drivers/clk/sunxi-ng/sun8i-de33.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2016 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#ifndef _CCU_SUN8I_DE2_H_
+#define _CCU_SUN8I_DE2_H_
+
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/reset/sun8i-de2.h>
+
+/* Intermediary clock dividers are not exported */
+#define CLK_MIXER0_DIV	3
+#define CLK_MIXER1_DIV	4
+#define CLK_WB_DIV	5
+
+#define CLK_NUMBER	(CLK_WB + 1)
+
+#endif /* _CCU_SUN8I_DE2_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index e39926e9f0b5d..12b73907788fa 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1277,6 +1277,10 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 			goto err_free_dclk;
 	}
 
+	regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
+			   SUN4I_TCON_GCTL_PAD_SEL,
+			   SUN4I_TCON_GCTL_PAD_SEL);
+
 	if (tcon->quirks->needs_de_be_mux) {
 		/*
 		 * We assume there is no dynamic muxing of backends
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23fe4a4..d56c9764ff4c6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -19,6 +19,7 @@
 
 #define SUN4I_TCON_GCTL_REG			0x0
 #define SUN4I_TCON_GCTL_TCON_ENABLE			BIT(31)
+#define SUN4I_TCON_GCTL_PAD_SEL				BIT(1)
 #define SUN4I_TCON_GCTL_IOMAP_MASK			BIT(0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON1			(1 << 0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON0			(0 << 0)
diff --git a/drivers/gpu/drm/sun4i/sun50i_afbc.c b/drivers/gpu/drm/sun4i/sun50i_afbc.c
index 27a771608eef8..b55e1c5533714 100644
--- a/drivers/gpu/drm/sun4i/sun50i_afbc.c
+++ b/drivers/gpu/drm/sun4i/sun50i_afbc.c
@@ -13,6 +13,16 @@
 #include "sun50i_afbc.h"
 #include "sun8i_mixer.h"
 
+static u32 sun50i_afbc_get_base(struct sun8i_mixer *mixer, unsigned int channel)
+{
+	u32 base = sun8i_channel_base(mixer, channel);
+
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		return base + SUN50I_AFBC_CH_OFFSET;
+
+	return base + 0x4000;
+}
+
 bool sun50i_afbc_format_mod_supported(struct sun8i_mixer *mixer,
 				      u32 format, u64 modifier)
 {
@@ -29,7 +39,7 @@ bool sun50i_afbc_format_mod_supported(struct sun8i_mixer *mixer,
 		return true;
 	}
 
-	if (!mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de2)
 		return false;
 
 	mode = AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
@@ -69,7 +79,7 @@ void sun50i_afbc_atomic_update(struct sun8i_mixer *mixer, unsigned int channel,
 	struct regmap *regs;
 	dma_addr_t dma_addr;
 
-	base = sun8i_channel_base(mixer, channel) + SUN50I_AFBC_CH_OFFSET;
+	base = sun50i_afbc_get_base(mixer, channel);
 	regs = mixer->engine.regs;
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -234,7 +244,7 @@ void sun50i_afbc_atomic_update(struct sun8i_mixer *mixer, unsigned int channel,
 
 void sun50i_afbc_disable(struct sun8i_mixer *mixer, unsigned int channel)
 {
-	u32 base = sun8i_channel_base(mixer, channel) + SUN50I_AFBC_CH_OFFSET;
+	u32 base = sun50i_afbc_get_base(mixer, channel);
 
 	regmap_write(mixer->engine.regs, SUN50I_FBD_CTL(base), 0);
 }
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 18a8d5032ddce..39682d4e6d208 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -34,41 +34,66 @@ static u32 sun50i_fmt_get_colorspace(u32 format)
 	}
 }
 
+static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
+{
+	if (colorspace != SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(64, 940);
+		limits[1] = SUN50I_FMT_LIMIT(64, 960);
+		limits[2] = SUN50I_FMT_LIMIT(64, 960);
+	} else if (bit10) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 1023);
+		limits[1] = SUN50I_FMT_LIMIT(0, 1023);
+		limits[2] = SUN50I_FMT_LIMIT(0, 1023);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(0, 1021);
+		limits[1] = SUN50I_FMT_LIMIT(0, 1021);
+		limits[2] = SUN50I_FMT_LIMIT(0, 1021);
+	}
+}
+
+static void sun50i_fmt_de33_limits(u32 *limits, u32 colorspace)
+{
+	if (colorspace == SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[1] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[2] = SUN50I_FMT_LIMIT(0, 4095);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[1] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[2] = SUN50I_FMT_LIMIT(256, 3840);
+	}
+}
+
 void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
 		      u16 height, u32 format)
 {
-	u32 colorspace, limit[3];
+	u32 colorspace, limit[3], base;
+	struct regmap *regs;
 	bool bit10;
 
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
+	base = mixer->cfg->de_type == sun8i_mixer_de3 ?
+		SUN50I_FMT_DE3 : SUN50I_FMT_DE33;
+	regs = sun8i_blender_regmap(mixer);
 
-	regmap_write(mixer->engine.regs, SUN50I_FMT_CTRL, 0);
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	else
+		sun50i_fmt_de33_limits(limit, colorspace);
 
-	regmap_write(mixer->engine.regs, SUN50I_FMT_SIZE,
-		     SUN8I_MIXER_SIZE(width, height));
-	regmap_write(mixer->engine.regs, SUN50I_FMT_SWAP, 0);
-	regmap_write(mixer->engine.regs, SUN50I_FMT_DEPTH, bit10);
-	regmap_write(mixer->engine.regs, SUN50I_FMT_FORMAT, colorspace);
-	regmap_write(mixer->engine.regs, SUN50I_FMT_COEF, 0);
+	regmap_write(regs, SUN50I_FMT_CTRL(base), 0);
 
-	if (colorspace != SUN50I_FMT_CS_YUV444RGB) {
-		limit[0] = SUN50I_FMT_LIMIT(64, 940);
-		limit[1] = SUN50I_FMT_LIMIT(64, 960);
-		limit[2] = SUN50I_FMT_LIMIT(64, 960);
-	} else if (bit10) {
-		limit[0] = SUN50I_FMT_LIMIT(0, 1023);
-		limit[1] = SUN50I_FMT_LIMIT(0, 1023);
-		limit[2] = SUN50I_FMT_LIMIT(0, 1023);
-	} else {
-		limit[0] = SUN50I_FMT_LIMIT(0, 1021);
-		limit[1] = SUN50I_FMT_LIMIT(0, 1021);
-		limit[2] = SUN50I_FMT_LIMIT(0, 1021);
-	}
+	regmap_write(regs, SUN50I_FMT_SIZE(base),
+		     SUN8I_MIXER_SIZE(width, height));
+	regmap_write(regs, SUN50I_FMT_SWAP(base), 0);
+	regmap_write(regs, SUN50I_FMT_DEPTH(base), bit10);
+	regmap_write(regs, SUN50I_FMT_FORMAT(base), colorspace);
+	regmap_write(regs, SUN50I_FMT_COEF(base), 0);
 
-	regmap_write(mixer->engine.regs, SUN50I_FMT_LMT_Y, limit[0]);
-	regmap_write(mixer->engine.regs, SUN50I_FMT_LMT_C0, limit[1]);
-	regmap_write(mixer->engine.regs, SUN50I_FMT_LMT_C1, limit[2]);
+	regmap_write(regs, SUN50I_FMT_LMT_Y(base), limit[0]);
+	regmap_write(regs, SUN50I_FMT_LMT_C0(base), limit[1]);
+	regmap_write(regs, SUN50I_FMT_LMT_C1(base), limit[2]);
 
-	regmap_write(mixer->engine.regs, SUN50I_FMT_CTRL, 1);
+	regmap_write(regs, SUN50I_FMT_CTRL(base), 1);
 }
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index 0fa1d2d22e592..3e60d5c788b39 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -8,15 +8,18 @@
 
 #include "sun8i_mixer.h"
 
-#define SUN50I_FMT_CTRL   0xa8000
-#define SUN50I_FMT_SIZE   0xa8004
-#define SUN50I_FMT_SWAP   0xa8008
-#define SUN50I_FMT_DEPTH  0xa800c
-#define SUN50I_FMT_FORMAT 0xa8010
-#define SUN50I_FMT_COEF   0xa8014
-#define SUN50I_FMT_LMT_Y  0xa8020
-#define SUN50I_FMT_LMT_C0 0xa8024
-#define SUN50I_FMT_LMT_C1 0xa8028
+#define SUN50I_FMT_DE3 0xa8000
+#define SUN50I_FMT_DE33 0x5000
+
+#define SUN50I_FMT_CTRL(base)   ((base) + 0x00)
+#define SUN50I_FMT_SIZE(base)   ((base) + 0x04)
+#define SUN50I_FMT_SWAP(base)   ((base) + 0x08)
+#define SUN50I_FMT_DEPTH(base)  ((base) + 0x0c)
+#define SUN50I_FMT_FORMAT(base) ((base) + 0x10)
+#define SUN50I_FMT_COEF(base)   ((base) + 0x14)
+#define SUN50I_FMT_LMT_Y(base)  ((base) + 0x20)
+#define SUN50I_FMT_LMT_C0(base) ((base) + 0x24)
+#define SUN50I_FMT_LMT_C1(base) ((base) + 0x28)
 
 #define SUN50I_FMT_LIMIT(low, high) (((high) << 16) | (low))
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 3b022bfb85adc..5f32c57fe7769 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -238,6 +238,14 @@ static const u32 yuv2yuv_de3[2][3][3][12] = {
 	},
 };
 
+static u32 sun8i_csc_base(struct sun8i_mixer *mixer, int layer)
+{
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, layer) - 0x800;
+	else
+		return ccsc_base[mixer->cfg->ccsc][layer];
+}
+
 static void sun8i_csc_setup(struct regmap *map, u32 base,
 			    enum format_type fmt_type,
 			    enum drm_color_encoding encoding,
@@ -358,6 +366,90 @@ static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct sun8i_mixer *mixer, int layer,
+				  enum format_type fmt_type,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val = 0, base, csc[15];
+	struct sunxi_engine *engine;
+	struct regmap *map;
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = sun8i_csc_base(mixer, layer);
+	engine = &mixer->engine;
+	map = engine->regs;
+
+	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(rgb2yuv_de3[engine->encoding], csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YUV:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YVU:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			table = yuv2yuv_de3[range][encoding][encoding];
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 			enum format_type fmt_type,
 			enum drm_color_encoding encoding,
@@ -365,10 +457,14 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 {
 	u32 base;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
+	} else if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		sun8i_de33_ccsc_setup(mixer, layer, fmt_type,
+				      encoding, range);
+		return;
 	}
 
 	if (layer < mixer->cfg->vi_num) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index b7546e06e315c..2b762cb79f02c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -20,6 +20,9 @@ struct sun8i_mixer;
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 enum format_type {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index b1525906a25d8..65615b5f9dbab 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -254,10 +254,16 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 
 static void sun8i_mixer_commit(struct sunxi_engine *engine)
 {
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+
 	DRM_DEBUG_DRIVER("Committing changes\n");
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
-		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	else
+		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
 }
 
 static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
@@ -306,25 +312,33 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	struct regmap *bld_regs, *disp_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
 	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
 			 mode->hdisplay, mode->vdisplay);
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
-	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		disp_regs = mixer->disp_regs;
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
+	} else {
+		disp_regs = mixer->engine.regs;
+		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
+	}
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -335,10 +349,8 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		val = 0xff108080;
 
-	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
-	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
 
 	if (mixer->cfg->has_formatter)
 		sun50i_fmt_setup(mixer, mode->hdisplay,
@@ -378,12 +390,29 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
+	.name		= "layers",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= 0xffffc, /* guessed */
 };
 
+static const struct regmap_config sun8i_top_regmap_config = {
+	.name		= "top",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x3c,
+};
+
+static const struct regmap_config sun8i_disp_regmap_config = {
+	.name		= "display",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x20000,
+};
+
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -404,6 +433,76 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 	return of_ep.id;
 }
 
+static void sun8i_mixer_de2_init(struct sun8i_mixer *mixer)
+{
+	unsigned int base;
+	int plane_cnt, i;
+
+	base = sun8i_blender_base(mixer);
+
+	/* Enable the mixer */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
+
+	/* Set background color to black */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
+	for (i = 0; i < plane_cnt; i++)
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+}
+
+static void sun8i_mixer_de33_init(struct sun8i_mixer *mixer)
+{
+	unsigned int base;
+	int plane_cnt, i;
+
+	base = sun8i_blender_base(mixer);
+
+	/* Enable the mixer */
+	regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_CTL,
+		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
+
+	regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
+
+	/* Set background color to black */
+	regmap_write(mixer->disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	regmap_write(mixer->disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
+	regmap_write(mixer->disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
+	for (i = 0; i < plane_cnt; i++)
+		regmap_write(mixer->disp_regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	regmap_update_bits(mixer->disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+}
+
 static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -412,8 +511,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
 	void __iomem *regs;
-	unsigned int base;
-	int plane_cnt;
 	int i, ret;
 
 	/*
@@ -476,6 +573,30 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		return PTR_ERR(mixer->engine.regs);
 	}
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		regs = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->top_regs = devm_regmap_init_mmio(dev, regs,
+							&sun8i_top_regmap_config);
+		if (IS_ERR(mixer->top_regs)) {
+			dev_err(dev, "Couldn't create the top regmap\n");
+			return PTR_ERR(mixer->top_regs);
+		}
+
+		regs = devm_platform_ioremap_resource(pdev, 2);
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
+							&sun8i_disp_regmap_config);
+		if (IS_ERR(mixer->disp_regs)) {
+			dev_err(dev, "Couldn't create the disp regmap\n");
+			return PTR_ERR(mixer->disp_regs);
+		}
+	}
+
 	mixer->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(mixer->reset)) {
 		dev_err(dev, "Couldn't get our reset line\n");
@@ -515,10 +636,10 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-	base = sun8i_blender_base(mixer);
-
 	/* Reset registers and disable unused sub-engines */
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		sun8i_mixer_de33_init(mixer);
+	} else if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -532,7 +653,9 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
-	} else {
+
+		sun8i_mixer_de2_init(mixer);
+	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
 		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -543,33 +666,9 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_ASE_EN, 0);
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_FCC_EN, 0);
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
-	}
-
-	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
-		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
-
-	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	/*
-	 * Set fill color of bottom plane to black. Generally not needed
-	 * except when VI plane is at bottom (zpos = 0) and enabled.
-	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
-	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
-	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_MODE(base, i),
-			     SUN8I_MIXER_BLEND_MODE_DEF);
-
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+		sun8i_mixer_de2_init(mixer);
+	}
 
 	return 0;
 
@@ -609,6 +708,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.ui_num		= 3,
@@ -617,6 +717,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.ui_num		= 1,
@@ -625,6 +726,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -634,6 +736,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -643,6 +746,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -651,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
+	.de_type = sun8i_mixer_de2,
 	.vi_num = 2,
 	.ui_num = 1,
 	.scaler_mask = 0x3,
@@ -661,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -670,6 +776,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
@@ -679,6 +786,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
@@ -688,6 +796,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -697,7 +806,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
-	.is_de3		= true,
+	.de_type	= sun8i_mixer_de3,
 	.has_formatter	= 1,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
@@ -706,6 +815,18 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de33,
+	.has_formatter	= 1,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -751,6 +872,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 13401643c7bfc..f1c2cdb88d0eb 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -20,6 +20,12 @@
 #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
 #define SUN8I_MIXER_GLOBAL_SIZE			0xc
 
+#define SUN50I_MIXER_GLOBAL_CTL			0x0
+#define SUN50I_MIXER_GLOBAL_STATUS		0x4
+#define SUN50I_MIXER_GLOBAL_SIZE		0x8
+#define SUN50I_MIXER_GLOBAL_CLK			0xc
+#define SUN50I_MIXER_GLOBAL_DBUFF		0x10
+
 #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
@@ -150,6 +156,12 @@ enum {
 	CCSC_D1_MIXER0_LAYOUT,
 };
 
+enum sun8i_mixer_type {
+	sun8i_mixer_de2,
+	sun8i_mixer_de3,
+	sun8i_mixer_de33,
+};
+
 /**
  * struct sun8i_mixer_cfg - mixer HW configuration
  * @vi_num: number of VI channels
@@ -171,9 +183,10 @@ struct sun8i_mixer_cfg {
 	int		scaler_mask;
 	int		ccsc;
 	unsigned long	mod_rate;
-	unsigned int	is_de3 : 1;
+	unsigned int	de_type;
 	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
+	unsigned int	map[6];
 };
 
 struct sun8i_mixer {
@@ -185,6 +198,9 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
 };
 
 static inline struct sun8i_mixer *
@@ -196,13 +212,22 @@ engine_to_sun8i_mixer(struct sunxi_engine *engine)
 static inline u32
 sun8i_blender_base(struct sun8i_mixer *mixer)
 {
-	return mixer->cfg->is_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
+	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
+}
+
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->cfg->de_type == sun8i_mixer_de33 ?
+		mixer->disp_regs : mixer->engine.regs;
 }
 
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
 		return DE2_CH_BASE + channel * DE2_CH_SIZE;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 91781b5bbbbce..1649816fe435e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -24,14 +24,17 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
+#include "sun8i_vi_scaler.h"
 
 static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 				  int overlay, bool enable, unsigned int zpos,
 				  unsigned int old_zpos)
 {
 	u32 val, bld_base, ch_base;
+	struct regmap *bld_regs;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	DRM_DEBUG_DRIVER("%sabling channel %d overlay %d\n",
@@ -47,12 +50,12 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
 
 	if (!enable || zpos != old_zpos) {
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
 				   0);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
 				   0);
@@ -61,13 +64,13 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 	if (enable) {
 		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   val, val);
 
 		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
 				   val);
@@ -101,6 +104,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -109,6 +113,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -141,22 +146,33 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == sun8i_mixer_de33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == sun8i_mixer_de33)
+			sun8i_vi_scaler_disable(mixer, channel);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index ae0806bccac7f..504ffa0971a4f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -93,7 +93,7 @@ static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	int vi_num = mixer->cfg->vi_num;
 
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
 		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bda91c3e2bb75..d8a97245cfe1e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -25,8 +25,10 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 				  unsigned int old_zpos)
 {
 	u32 val, bld_base, ch_base;
+	struct regmap *bld_regs;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	DRM_DEBUG_DRIVER("%sabling VI channel %d overlay %d\n",
@@ -42,12 +44,12 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
 
 	if (!enable || zpos != old_zpos) {
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
 				   0);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
 				   0);
@@ -56,13 +58,13 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 	if (enable) {
 		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   val, val);
 
 		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
 				   val);
@@ -76,7 +78,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
 		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
 		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
@@ -106,6 +108,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -117,6 +120,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -207,10 +211,9 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		sun8i_vi_scaler_setup(mixer, channel, src_w, src_h, dst_w,
 				      dst_h, hscale, vscale, hphase, vphase,
 				      format);
-		sun8i_vi_scaler_enable(mixer, channel, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, channel, false);
+		sun8i_vi_scaler_disable(mixer, channel);
 	}
 
 	regmap_write(mixer->engine.regs,
@@ -234,10 +237,10 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
@@ -410,7 +413,7 @@ static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
 
 	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
 			      old_zpos);
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type >= sun8i_mixer_de3)
 		sun50i_afbc_disable(mixer, layer->channel);
 }
 
@@ -431,7 +434,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->visible) {
 		sun8i_vi_layer_enable(mixer, layer->channel,
 				      layer->overlay, false, 0, old_zpos);
-		if (mixer->cfg->is_de3)
+		if (mixer->cfg->de_type >= sun8i_mixer_de3)
 			sun50i_afbc_disable(mixer, layer->channel);
 		return;
 	}
@@ -448,7 +451,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 				   plane->state->color_encoding,
 				   plane->state->color_range);
 	} else {
-		if (mixer->cfg->is_de3)
+		if (mixer->cfg->de_type >= sun8i_mixer_de3)
 			sun50i_afbc_disable(mixer, layer->channel);
 		sun8i_vi_layer_update_alpha(mixer, layer->channel,
 					    layer->overlay, plane);
@@ -612,7 +615,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->channel = index;
 	layer->overlay = 0;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 		modifiers = sun50i_layer_de3_modifiers;
@@ -637,7 +640,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->is_de3) {
+	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= sun8i_mixer_de3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
@@ -654,7 +657,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
 			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type >= sun8i_mixer_de3)
 		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 7ba75011adf9f..9c7f6e7d71d50 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
@@ -843,6 +845,14 @@ static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 		       DE2_VI_SCALER_UNIT_SIZE * channel;
 }
 
+static bool sun8i_vi_scaler_is_vi_plane(struct sun8i_mixer *mixer, int channel)
+{
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] < mixer->cfg->vi_num;
+
+	return true;
+}
+
 static int sun8i_vi_scaler_coef_index(unsigned int step)
 {
 	unsigned int scale, int_part, float_part;
@@ -867,60 +877,74 @@ static int sun8i_vi_scaler_coef_index(unsigned int step)
 	}
 }
 
-static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
-				      u32 hstep, u32 vstep,
-				      const struct drm_format_info *format)
+static void sun8i_vi_scaler_set_coeff_vi(struct regmap *map, u32 base,
+					 u32 hstep, u32 vstep,
+					 const struct drm_format_info *format)
 {
 	const u32 *ch_left, *ch_right, *cy;
-	int offset, i;
+	int offset;
 
-	if (format->hsub == 1 && format->vsub == 1) {
-		ch_left = lan3coefftab32_left;
-		ch_right = lan3coefftab32_right;
-		cy = lan2coefftab32;
-	} else {
+	if (format->is_yuv) {
 		ch_left = bicubic8coefftab32_left;
 		ch_right = bicubic8coefftab32_right;
 		cy = bicubic4coefftab32;
+	} else {
+		ch_left = lan3coefftab32_left;
+		ch_right = lan3coefftab32_right;
+		cy = lan2coefftab32;
 	}
 
 	offset = sun8i_vi_scaler_coef_index(hstep) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, i),
-			     lan3coefftab32_left[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, i),
-			     lan3coefftab32_right[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, i),
-			     ch_left[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, i),
-			     ch_right[offset + i]);
-	}
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, 0),
+			  &lan3coefftab32_left[offset],
+			  SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, 0),
+			  &lan3coefftab32_right[offset],
+			  SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, 0),
+			  &ch_left[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, 0),
+			  &ch_right[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 
 	offset = sun8i_vi_scaler_coef_index(hstep) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
-			     lan2coefftab32[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, i),
-			     cy[offset + i]);
-	}
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, 0),
+			  &cy[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 }
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+static void sun8i_vi_scaler_set_coeff_ui(struct regmap *map, u32 base,
+					 u32 hstep, u32 vstep,
+					 const struct drm_format_info *format)
 {
-	u32 val, base;
+	const u32 *table;
+	int offset;
 
-	base = sun8i_vi_scaler_base(mixer, layer);
+	offset = sun8i_vi_scaler_coef_index(hstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	offset = sun8i_vi_scaler_coef_index(vstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 
-	if (enable)
-		val = SUN8I_SCALER_VSU_CTRL_EN |
-		      SUN8I_SCALER_VSU_CTRL_COEFF_RDY;
-	else
-		val = 0;
+	table = format->is_yuv ? bicubic4coefftab32 : lan2coefftab32;
+	offset = sun8i_vi_scaler_coef_index(hstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, 0),
+			  &table[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+}
 
-	regmap_write(mixer->engine.regs,
-		     SUN8I_SCALER_VSU_CTRL(base), val);
+void sun8i_vi_scaler_disable(struct sun8i_mixer *mixer, int layer)
+{
+	u32 base;
+
+	base = sun8i_vi_scaler_base(mixer, layer);
+
+	regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base), 0);
 }
 
 void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
@@ -956,7 +980,10 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		cvphase = vphase;
 	}
 
-	if (mixer->cfg->is_de3) {
+	regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base),
+		     SUN8I_SCALER_VSU_CTRL_EN);
+
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		u32 val;
 
 		if (format->hsub == 1 && format->vsub == 1)
@@ -994,6 +1021,16 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		     SUN8I_SCALER_VSU_CHPHASE(base), chphase);
 	regmap_write(mixer->engine.regs,
 		     SUN8I_SCALER_VSU_CVPHASE(base), cvphase);
-	sun8i_vi_scaler_set_coeff(mixer->engine.regs, base,
-				  hscale, vscale, format);
+
+	if (sun8i_vi_scaler_is_vi_plane(mixer, layer))
+		sun8i_vi_scaler_set_coeff_vi(mixer->engine.regs, base,
+					     hscale, vscale, format);
+	else
+		sun8i_vi_scaler_set_coeff_ui(mixer->engine.regs, base,
+					     hscale, vscale, format);
+
+	if (mixer->cfg->de_type <= sun8i_mixer_de3)
+		regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base),
+			     SUN8I_SCALER_VSU_CTRL_EN |
+			     SUN8I_SCALER_VSU_CTRL_COEFF_RDY);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 68f6593b369ab..9fe056a2c1c79 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -34,6 +34,7 @@
 #define SUN50I_SCALER_VSU_EDSCL_CTRL(base)		((base) + 0x28)
 #define SUN50I_SCALER_VSU_ANGLE_THR(base)		((base) + 0x2c)
 #define SUN8I_SCALER_VSU_OUTSIZE(base)		((base) + 0x40)
+#define SUN50I_SCALER_VSU_GLB_ALPHA(base)	((base) + 0x44)
 #define SUN8I_SCALER_VSU_YINSIZE(base)		((base) + 0x80)
 #define SUN8I_SCALER_VSU_YHSTEP(base)		((base) + 0x88)
 #define SUN8I_SCALER_VSU_YVSTEP(base)		((base) + 0x8c)
@@ -69,7 +70,7 @@
 #define SUN50I_SCALER_VSU_ANGLE_SHIFT(x)		(((x) << 16) & 0xF)
 #define SUN50I_SCALER_VSU_ANGLE_OFFSET(x)		((x) & 0xFF)
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
+void sun8i_vi_scaler_disable(struct sun8i_mixer *mixer, int layer);
 void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
-- 
2.45.2

