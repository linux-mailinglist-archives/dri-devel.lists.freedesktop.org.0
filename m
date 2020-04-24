Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96681B801D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CB46EB47;
	Fri, 24 Apr 2020 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC556EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:35:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 10269334;
 Fri, 24 Apr 2020 11:35:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=gFHaVwmXarkqP
 cB3RyF+e3O/1vaX9+yW/7kak31Bpq4=; b=sfhdm+1t7ELNMj+Ur68F3lc7PZqqI
 AOm1DSHDu/l/2Gk67hvb6m17M9B4m/h0soYafyDLw+1JHRZXxcNbNSp07YDXyfIs
 PFDn1rO3bhU1BfUfUtGdlyjHUHe6YluxcYDwUzi2swH6znnCr+ii9RMkRteSAHJb
 7j/MNMLr5lFuS1ReVJKX2A5hu/qNN9mny4N55/sWMpNmZThZfwpZm35HSlmovwL+
 I9KG1aOxljSbYouo5QVsKuJ02nKZjM/GqPoM6+yOeQZeoJzwzLrumj0iazPw9afR
 t64wmks9dRH1TkXBXdbUHWv3M/PxMPnZKXE8JymJxDhX0kbdJCUb3Qmvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=gFHaVwmXarkqPcB3RyF+e3O/1vaX9+yW/7kak31Bpq4=; b=yIktkNjP
 IUAqxvYJrYerFJq7sOZn4v64pRc4dHTEaZhyrUFNwYTzAjX+txOmdEUbH+RLgOa9
 /nxXfRG/gfJAbC7i+tMNq0NJm0wLDJFqVfnPOifK2A3drNkvuOR68yrCZ5SxhERX
 icqk7VHX5piOqCCOnh5TKzOzzJQD3gdDB9f4QSF/IIaQIJsfi8Y/lf651nx/TIM/
 0XIOHkpzY33NUD8bxNihQDH7T5gcs+22uLGUc4QzL7r4+mg3yUyfZK/flAycRnTB
 bxLUGvQTaP/J+tk3p1a2vLjr0CWIs1KoUTxjG/zUKnAYQ5RySfKNZXeiSCIicPO6
 OyVrKzIPJMuvuw==
X-ME-Sender: <xms:XQejXl5yseylMA5ngZh6kt5oyhAWVJX0aXl0FV2XzxNh0nUJ_hFJOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 eprhgtuggvvhdrnhhrnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhord
 htvggthh
X-ME-Proxy: <xmx:XQejXr5baxiSofJPrz0rT8u2p4mCFPUWWjsiaKSM8nMY2J23ITolYA>
 <xmx:XQejXpN6DfEYcJ_tkK6LQtEmUX0xGc49eSSaTpBPbASBzAxqoHZT2w>
 <xmx:XQejXsfJx7s0YYryfA1RCWYvAXEDyXX0UjBbdksSAKOkzOE6wWD4eA>
 <xmx:XQejXqT3SRXLh4DTEKJaNh5i77401Ry6HG30s1eAx783fSj7kXoAQM1tVq4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 448453065DA6;
 Fri, 24 Apr 2020 11:35:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 25/91] clk: bcm: Add BCM2711 DVP driver
Date: Fri, 24 Apr 2020 17:34:06 +0200
Message-Id: <a1efabae8d7df30c987bff10544c2071e906e07a.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
 drivers/clk/bcm/clk-bcm2711-dvp.c | 127 +++++++++++++++++++++++++++++++-
 3 files changed, 129 insertions(+)
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
