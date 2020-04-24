Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A453E1B7FE9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07086EB27;
	Fri, 24 Apr 2020 20:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D68D6EAAF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:35:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 33B533E9;
 Fri, 24 Apr 2020 11:35:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hBmn3e0lkRPM4
 J/ca6uEGpHz0CVqCDrJabmLEP/QJNY=; b=TQoIFlSN8RmC2yzfROeALX/rFJmrE
 pfXrx38IgGGPzegBU49AS2V0dtmAtjAvgRtwfoQ4r1j2TVwQX6Z7uErGEo7SgSwK
 Yu6Sg1ZRpGi2PtoMJJQmiz8hvR8rHkMrQy9U3Md9sn0lxNiA1szc0WjeiBV9b0eQ
 rp4yi9AAPRBE79Z6wyfirwStTzRtiY9LclyQxc6YxQLcPWvMOBNdgHGaRw6pGKCd
 CeNttQWRfZaVeDYf2shD6N4PURWxMfAW8cSOF5E0GQiRscb6RwPsyfwCd4vG+r+N
 QiVC/MF5lKDpS34e8tiNnul70zEp8qveJ5Mp1xe5Fcu7wl9e0NZXOmf+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hBmn3e0lkRPM4J/ca6uEGpHz0CVqCDrJabmLEP/QJNY=; b=g7z+Ynbe
 KIGBgdqjLQj4PmloOKTDECl4LjjeXxDB5LtZPbE1tjbzKm+9ko7LKkJMnRVrsRPp
 M7wbnznr4se2uuN4C2gdEqrD7wK8QYx3sNVa9OLNERX2C9mnW97wDEEn1bPS9aPa
 7u76caWZqDjYm0ZZehzquw0lr3eh65iopiRfhZmpR3N8m3ieazzRFrQEENtgR6Yp
 cJ1Bmlj1YloNCdo08uZ+Y8hXPTt3DSHZ4jZulnnutNCVlKY+6PdhiwPwA42jBfvN
 LcOPUvzS/jFddKPDegiUGK08iKgInpqmM3UZgGiqQDEEZseQJDFQuYlPLln+MdTX
 4gRUkRtJJID4Rw==
X-ME-Sender: <xms:VgejXgXjQ-vd0hZVMvD6MyuDyf-PEVtJ4Wnzcvnn4CDBNqX43M4yGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VgejXirdwLkko54NoEhSc5GyPnUdjHTOi0pLYChmkla0kWAhqKEGUw>
 <xmx:VgejXkbi6055KyaLrf1aOD3S2KFyWjAg5j3QPlWYDUjr7qccqCLo-Q>
 <xmx:VgejXmXa2iOvkCr34UIzV2u5Oa0MzMDo5Em5zApSLTXFTLYmjl0ffg>
 <xmx:VgejXt90z4JzrsSdYuO0C9VpJmbHmUYdKu4pErJjzUbnjzNNqFnpE36lyig>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56502328005E;
 Fri, 24 Apr 2020 11:35:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 20/91] clk: bcm: rpi: Discover the firmware clocks
Date: Fri, 24 Apr 2020 17:34:01 +0200
Message-Id: <1a25b4f079dcdc669d4b29d3658ef0b72be2651e.1587742492.git-series.maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RaspberryPi4 firmware actually exposes more clocks than are currently
handled by the driver and we will need to change some of them directly
based on the pixel rate for the display related clocks, or the load for the
GPU.

This rate change can have a number of side-effects, including adjusting the
various PLL voltages or the PLL parents. The firmware will also update
those clocks by itself for example if the SoC runs too hot.

In order to make Linux play as nice as possible with those constraints, it
makes sense to rely on the firmware clocks as much as possible.

Fortunately,t he firmware has an interface to discover the clocks it
exposes.

Let's use it to discover, register the clocks in the clocks framework and
then expose them through the device tree for consumers to use them.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 104 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h |   5 +-
 2 files changed, 97 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9027169a2a..6a789749aea6 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -285,6 +285,95 @@ static struct clk_hw *raspberrypi_register_pllb_arm(struct raspberrypi_clk *rpi)
 	return &raspberrypi_clk_pllb_arm.hw;
 }
 
+static long raspberrypi_fw_dumb_round_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long *parent_rate)
+{
+	/*
+	 * The firmware will do the rounding but that isn't part of
+	 * the interface with the firmware, so we just do our best
+	 * here.
+	 */
+	return rate;
+}
+
+static const struct clk_ops raspberrypi_firmware_clk_ops = {
+	.is_prepared	= raspberrypi_fw_is_prepared,
+	.recalc_rate	= raspberrypi_fw_get_rate,
+	.round_rate	= raspberrypi_fw_dumb_round_rate,
+	.set_rate	= raspberrypi_fw_set_rate,
+};
+
+static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
+					       unsigned int parent,
+					       unsigned int id)
+{
+	struct raspberrypi_clk_data *data;
+	struct clk_init_data init = {};
+	int ret;
+
+	if (id == RPI_FIRMWARE_ARM_CLK_ID) {
+		struct clk_hw *hw;
+
+		hw = raspberrypi_register_pllb(rpi);
+		if (IS_ERR(hw)) {
+			dev_err(rpi->dev, "Failed to initialize pllb, %ld\n",
+				PTR_ERR(hw));
+			return hw;
+		}
+
+		return raspberrypi_register_pllb_arm(rpi);
+	}
+
+	data = devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+	data->rpi = rpi;
+	data->id = id;
+
+	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL, "fw-clk-%u", id);
+	init.ops = &raspberrypi_firmware_clk_ops;
+	init.flags = CLK_GET_RATE_NOCACHE;
+
+	data->hw.init = &init;
+
+	ret = devm_clk_hw_register(rpi->dev, &data->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &data->hw;
+}
+
+static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
+				       struct clk_hw_onecell_data *data)
+{
+	struct rpi_firmware_get_clocks_response *clks;
+	int ret;
+
+	clks = devm_kcalloc(rpi->dev, sizeof(*clks), NUM_FW_CLKS, GFP_KERNEL);
+	if (!clks)
+		return -ENOMEM;
+
+	ret = rpi_firmware_property(rpi->firmware, RPI_FIRMWARE_GET_CLOCKS,
+				    clks, sizeof(*clks) * NUM_FW_CLKS);
+	if (ret)
+		return ret;
+
+	while (clks->id) {
+		struct clk_hw *hw;
+
+		hw = raspberrypi_clk_register(rpi, clks->parent, clks->id);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		data->hws[clks->id] = hw;
+		data->num = clks->id + 1;
+		clks++;
+	}
+
+	return 0;
+}
+
 static int raspberrypi_clk_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -292,7 +381,6 @@ static int raspberrypi_clk_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rpi_firmware *firmware;
 	struct raspberrypi_clk *rpi;
-	struct clk_hw *hw;
 	int ret;
 
 	/*
@@ -327,17 +415,9 @@ static int raspberrypi_clk_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	hw = raspberrypi_register_pllb(rpi);
-	if (IS_ERR(hw)) {
-		dev_err(dev, "Failed to initialize pllb, %ld\n", PTR_ERR(hw));
-		return PTR_ERR(hw);
-	}
-
-	hw = raspberrypi_register_pllb_arm(rpi);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-	clk_data->hws[RPI_FIRMWARE_ARM_CLK_ID] = hw;
-	clk_data->num = RPI_FIRMWARE_ARM_CLK_ID + 1;
+	ret = raspberrypi_discover_clocks(rpi, clk_data);
+	if (ret)
+		return ret;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 					  clk_data);
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 7800e12ee042..27bfc0dcfa9b 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -135,6 +135,11 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_DMA_CHANNELS =                       0x00060001,
 };
 
+struct rpi_firmware_get_clocks_response {
+	__le32 parent;
+	__le32 id;
+};
+
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *data, size_t len);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
