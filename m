Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38D1E5987
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FCD6E445;
	Thu, 28 May 2020 07:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185D56E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 80EF6581FF0;
 Wed, 27 May 2020 11:49:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=JS2UKqRBYPadW
 vDMXsMwdmCOk/vh+t2B16LPXJpi9Ps=; b=Nj0JRBg0iY8fzLsKwLcvMLUdYTJjv
 2cdBT/hXX4w7p0QipcKLmlguVouTTGfHCH033T8oZag3qRW1kuPempSYfMpCUnbZ
 qb8XdX4fw1/JoT7DWKO2y01L2GCC3p2yEDv1/Umn4FIwTrg8sSagLasShJF6HF8F
 oQM88zECePTw2qf3HTMt0+GzufzE8lKwK2KvxVfGAUguxeXC0ch0ApiX60yRS7v9
 CcN6ZG6RJtUtHG7FKeMyiloiUqycf2D1tPyia5HC1nbhfa4TO16TSmVQK3HF7XFB
 jvv9pcB+M6ErC8RcqcYFcWJs4Kh7z+A0lwAM5T+Odmig5zyfB4GB6Ew1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JS2UKqRBYPadWvDMXsMwdmCOk/vh+t2B16LPXJpi9Ps=; b=AbeO0tAo
 NaodgRmxdhYn10Eufk/75eknWlBSIzTTbBvcdDHIeatxtA/UTpLbzTDVGXuAMlaP
 ZiDItfAVP7bjqlOTKZJif2M1BPwk3cFgXyc0FN5HxzwaRA4Z/9EhrZ1oF8F0f0JJ
 4Bi4hZUaCXWSrCjLJ8WKFgooseYH9T1GeVsOFX+lmp8KVyKud9jWSOPuKMIwmJ3W
 S6ov4F1BPeHz/eQ8pK2YLzBuCFIPv3piz1IomDyZqvjLjY+w3K+7S53eVFjPaMXK
 pn7svUl6prAbCitYbfkAUYJxoNqqgKS1IkEUKiGK2Ci+x1X7Rmc5VR7YWMmDuuGK
 d9YeM4A8UpxOxA==
X-ME-Sender: <xms:A4zOXvQUbCpL073Nzl95SPp88_wkm31NN89u6e_cCzPvQS70TzAsDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdevjeduiedtuddtteeuiefgiedukeevjeevuddttddvtdefkedvleeufeej
 leeknecuffhomhgrihhnpehrtgguvghvrdhnrhenucfkphepledtrdekledrieekrdejie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:A4zOXgxAvlsdVZLvxvwLd1OZDBMrlQzp6OtxJgzfkFGg88XNQSVXNQ>
 <xmx:A4zOXk1l_GeoaFpQ-27l1C_0DQDjRq_X9SxqgnTLXDugTzK9ThnK2w>
 <xmx:A4zOXvC7WXfdpyWqIwtSOJz5ItkOuGQdvbEYOWgfSH6vqtkeWF_Cjw>
 <xmx:A4zOXpYj9AYGu4u2KrWr5R0rIljRDNm2LwOcdEeLGitYjDgBabz9eA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 221A2328005D;
 Wed, 27 May 2020 11:49:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 004/105] clk: bcm: Add BCM2711 DVP driver
Date: Wed, 27 May 2020 17:47:34 +0200
Message-Id: <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/Kconfig           |  11 +++-
 drivers/clk/bcm/Makefile          |   1 +-
 drivers/clk/bcm/clk-bcm2711-dvp.c | 127 +++++++++++++++++++++++++++++++-
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c

diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index 8c83977a7dc4..784f12c72365 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -1,4 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+config CLK_BCM2711_DVP
+	tristate "Broadcom BCM2711 DVP support"
+	depends on ARCH_BCM2835 ||COMPILE_TEST
+	depends on COMMON_CLK
+	default ARCH_BCM2835
+	select RESET_SIMPLE
+	help
+	  Enable common clock framework support for the Broadcom BCM2711
+	  DVP Controller.
+
 config CLK_BCM2835
 	bool "Broadcom BCM2835 clock support"
 	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
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
index 000000000000..c1c4b5857d32
--- /dev/null
+++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
@@ -0,0 +1,127 @@
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
+	struct clk_hw_onecell_data	*data;
+	struct reset_simple_data	reset;
+};
+
+static const struct clk_parent_data clk_dvp_parent = {
+	.index	= 0,
+};
+
+static int clk_dvp_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *data;
+	struct resource *res;
+	struct clk_dvp *dvp;
+	void __iomem *base;
+	int ret;
+
+	dvp = devm_kzalloc(&pdev->dev, sizeof(*dvp), GFP_KERNEL);
+	if (!dvp)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, dvp);
+
+	dvp->data = devm_kzalloc(&pdev->dev,
+				 struct_size(dvp->data, hws, NR_CLOCKS),
+				 GFP_KERNEL);
+	if (!dvp->data)
+		return -ENOMEM;
+	data = dvp->data;
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
+	data->hws[0] = clk_hw_register_gate_parent_data(&pdev->dev,
+							"hdmi0-108MHz",
+							&clk_dvp_parent, 0,
+							base + DVP_HT_RPI_MISC_CONFIG, 3,
+							CLK_GATE_SET_TO_DISABLE,
+							&dvp->reset.lock);
+	if (IS_ERR(data->hws[0])) {
+		ret = PTR_ERR(data->hws[0]);
+		goto unregister_reset;
+	}
+
+	data->hws[1] = clk_hw_register_gate_parent_data(&pdev->dev,
+							"hdmi1-108MHz",
+							&clk_dvp_parent, 0,
+							base + DVP_HT_RPI_MISC_CONFIG, 4,
+							CLK_GATE_SET_TO_DISABLE,
+							&dvp->reset.lock);
+	if (IS_ERR(data->hws[1])) {
+		ret = PTR_ERR(data->hws[1]);
+		goto unregister_clk0;
+	}
+
+	data->num = NR_CLOCKS;
+	ret = of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
+				     data);
+	if (ret)
+		goto unregister_clk1;
+
+	return 0;
+
+unregister_clk1:
+	clk_hw_unregister_gate(data->hws[1]);
+
+unregister_clk0:
+	clk_hw_unregister_gate(data->hws[0]);
+
+unregister_reset:
+	reset_controller_unregister(&dvp->reset.rcdev);
+	return ret;
+};
+
+static int clk_dvp_remove(struct platform_device *pdev)
+{
+	struct clk_dvp *dvp = platform_get_drvdata(pdev);
+	struct clk_hw_onecell_data *data = dvp->data;
+
+	clk_hw_unregister_gate(data->hws[1]);
+	clk_hw_unregister_gate(data->hws[0]);
+	reset_controller_unregister(&dvp->reset.rcdev);
+
+	return 0;
+}
+
+static const struct of_device_id clk_dvp_dt_ids[] = {
+	{ .compatible = "brcm,brcm2711-dvp", },
+	{ /* sentinel */ }
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
