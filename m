Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E816A2D4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A496E395;
	Mon, 24 Feb 2020 09:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5CE6E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 0160E61F;
 Mon, 24 Feb 2020 04:09:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=GJTCftH9+aMh6
 9hSTQ5SiskF083sH6bzhzDLbLcu8to=; b=ZuqNwR/tnLyQbMrwfZAz4q0MVb3Cp
 Rdb01zSvLob8F8GbbfiNuqpxCGHk1zUWXCW4uc1MyixE49lVBbcoJSoBRBbnuBxC
 iKDgGz6IAb3kE1phNmfN2tI56wmNRkvcz2Y2L2Ng82zHA1THemcTQFFQ0/NVFCi5
 wFEwJxwe+COUFxF7CTrAmTEXdVQS4K0MdNt98nX0ErGYYGa6girEBv1DLWJpwTka
 LvIG94FWpRXqGdZk0lx6QR5c1uoKnEvMfocMum6ECBkK0Ex/Z8MhhN00TGojmb9h
 hEzqg5r+PPxbRkHocseR+0LFSGwb+/l232OPdy75K3gWifjKtdPd4vCGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GJTCftH9+aMh69hSTQ5SiskF083sH6bzhzDLbLcu8to=; b=nlJrwX8f
 ALtwwc1dRumaQXpIWKFF4L9wWsBgmZKTXDPaQg7mu2DvCKdX2mscO7nUMaR5QSDy
 c74mlIIh8efo0JcZAD90CedqCDkbX/RJkc1ywutf14NZmHlDvrmK3nwb19mD1g1c
 yeb2k1oRnVJ0gPQcwieoWPP/Be6HoNjBusivW3K2rDGjp3tlQpHkwhKpFydmMmZT
 oF2fO9ihdAP6JlO1RuSVqPazz+yAFgKV17x8b2nydoYyS1HyjXBtchm3aelWa4rj
 8iyV7T0u+5ZSwHnj85CxN7hdOxlPxnxqYaBZKBPGKarQS5QNRxhz0RUkLHPGQmpl
 uJcGmHFXKnLRbw==
X-ME-Sender: <xms:yJJTXifYGygHEUw63DMiqToDF8BAZ0REtoNi7dbLogcdGcgZjkn-Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpehrtg
 guvghvrdhnrhenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:yJJTXm7rp1BpBGKc4PjUvRspH-8Y8122kT0D-pWW6TRu2ILvFsv_vg>
 <xmx:yJJTXqLEK69NKIExlSi6QwiRx0iOBvDTw1tmT50kuWhfmZBovAvQRQ>
 <xmx:yJJTXq7gzEY7u7MQcx8_pVEasOYdIZbT34GFCxy3nDvpCuXcJw3Svg>
 <xmx:yJJTXvJc7CGTCjuWoY_QFgYNisSBglZsX7FO-aLiFlL4W-bIjlXYaT3n5dE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 361363060FCB;
 Mon, 24 Feb 2020 04:09:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 27/89] clk: bcm: Add BCM2711 DVP driver
Date: Mon, 24 Feb 2020 10:06:29 +0100
Message-Id: <6dd6bd48e894c1e8ee85c29a30ba1b18041d83c4.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI block has a block that controls clocks and reset signals to the
HDMI0 and HDMI1 controllers.

Let's expose that through a clock driver implementing a clock and reset
provider.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/Kconfig           |   1 +-
 drivers/clk/bcm/Makefile          |   1 +-
 drivers/clk/bcm/clk-bcm2711-dvp.c | 113 +++++++++++++++++++++++++++++++-
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c

diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index 8c83977a7dc4..03bbd8040451 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -4,6 +4,7 @@ config CLK_BCM2835
 	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
 	depends on COMMON_CLK
 	default ARCH_BCM2835 || ARCH_BRCMSTB
+	select RESET_SIMPLE
 	help
 	  Enable common clock framework support for Broadcom BCM2835
 	  SoCs.
diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
index 0070ddf6cdd2..2c1349062147 100644
--- a/drivers/clk/bcm/Makefile
+++ b/drivers/clk/bcm/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_CLK_BCM_KONA)	+= clk-kona-setup.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-bcm281xx.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-bcm21664.o
 obj-$(CONFIG_COMMON_CLK_IPROC)	+= clk-iproc-armpll.o clk-iproc-pll.o clk-iproc-asiu.o
+obj-$(CONFIG_CLK_BCM2835)	+= clk-bcm2711-dvp.o
 obj-$(CONFIG_CLK_BCM2835)	+= clk-bcm2835.o
 obj-$(CONFIG_CLK_BCM2835)	+= clk-bcm2835-aux.o
 obj-$(CONFIG_CLK_RASPBERRYPI)	+= clk-raspberrypi.o
diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bcm2711-dvp.c
new file mode 100644
index 000000000000..f4773cc92724
--- /dev/null
+++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2020 Cerno
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
+
+#define DVP_HT_RPI_SW_INIT	0x04
+#define DVP_HT_RPI_MISC_CONFIG	0x08
+
+#define NR_CLOCKS	2
+#define NR_RESETS	6
+
+struct clk_dvp {
+	struct clk			*clks[NR_CLOCKS];
+	struct clk_onecell_data		clk_data;
+	struct reset_simple_data	reset;
+};
+
+static int clk_dvp_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct clk_dvp *dvp;
+	void __iomem *base;
+	const char *parent;
+	int ret;
+
+	dvp = devm_kzalloc(&pdev->dev, sizeof(*dvp), GFP_KERNEL);
+	if (!dvp)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, dvp);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	dvp->reset.rcdev.owner = THIS_MODULE;
+	dvp->reset.rcdev.nr_resets = NR_RESETS;
+	dvp->reset.rcdev.ops = &reset_simple_ops;
+	dvp->reset.rcdev.of_node = pdev->dev.of_node;
+	dvp->reset.membase = base + DVP_HT_RPI_SW_INIT;
+	spin_lock_init(&dvp->reset.lock);
+
+	ret = reset_controller_register(&dvp->reset.rcdev);
+	if (ret)
+		return ret;
+
+	parent = of_clk_get_parent_name(pdev->dev.of_node, 0);
+	if (!parent)
+		goto unregister_reset;
+
+	dvp->clks[0] = clk_register_gate(&pdev->dev, "hdmi0-108MHz",
+					 parent, CLK_IS_CRITICAL,
+					 base + DVP_HT_RPI_MISC_CONFIG, 3,
+					 CLK_GATE_SET_TO_DISABLE, &dvp->reset.lock);
+	if (IS_ERR(dvp->clks[0])) {
+		ret = PTR_ERR(dvp->clks[0]);
+		goto unregister_reset;
+	}
+
+	dvp->clks[1] = clk_register_gate(&pdev->dev, "hdmi1-108MHz",
+					 parent, CLK_IS_CRITICAL,
+					 base + DVP_HT_RPI_MISC_CONFIG, 4,
+					 CLK_GATE_SET_TO_DISABLE, &dvp->reset.lock);
+	if (IS_ERR(dvp->clks[1])) {
+		ret = PTR_ERR(dvp->clks[1]);
+		goto unregister_clk0;
+	}
+
+	dvp->clk_data.clks = dvp->clks;
+	dvp->clk_data.clk_num = NR_CLOCKS;
+	of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
+			    &dvp->clk_data);
+
+	return 0;
+
+
+unregister_clk0:
+	clk_unregister_gate(dvp->clks[0]);
+
+unregister_reset:
+	reset_controller_unregister(&dvp->reset.rcdev);
+	return ret;
+};
+
+static int clk_dvp_remove(struct platform_device *pdev)
+{
+	struct clk_dvp *dvp = platform_get_drvdata(pdev);
+
+	clk_unregister_gate(dvp->clks[1]);
+	clk_unregister_gate(dvp->clks[0]);
+	reset_controller_unregister(&dvp->reset.rcdev);
+
+	return 0;
+}
+
+static const struct of_device_id clk_dvp_dt_ids[] = {
+	{ .compatible = "brcm,brcm2711-dvp", },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver clk_dvp_driver = {
+	.probe	= clk_dvp_probe,
+	.remove	= clk_dvp_remove,
+	.driver	= {
+		.name		= "brcm2711-dvp",
+		.of_match_table	= clk_dvp_dt_ids,
+	},
+};
+module_platform_driver(clk_dvp_driver);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
