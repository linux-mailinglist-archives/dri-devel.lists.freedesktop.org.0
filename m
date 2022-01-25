Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC549B5DA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1878A10E5E5;
	Tue, 25 Jan 2022 14:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9C710E44F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:16:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3CDA35C00E1;
 Tue, 25 Jan 2022 09:16:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 09:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=4lZDmwL7uIwTDjbUfihdBqpVRMxP4F
 BdhG+gR+SfQCk=; b=VrfQ1LhVlMG9EnVjtjoHWlZZ8HlG6CfVWGiggvdwFEXbN1
 QOqQV1iJJK8nWO3En2NftrSTvILqvMqh/DHRl55QK8oNP4Dii8o/Yx6BtJUXw/+X
 SOAbY1Xc+Bg7eD2RZQbaYEEUczEJSFYOODdvKkF1awGvjxS65pLonKbFoh/dFAFP
 AxcrAxEPOdeNrd0/aXgjCnGwlPFwypbbBJUxrgfCIcss0hjzYHBuHROp2/o+29g7
 SW9kkAwUgwaV7dvQmGo/pXtfE0nF76/XSWEdk46xvuPYAIfo0gXlesTnfFOJzTQB
 vIVG9+XZIq0MzsFhbPsc+S/uk3PLJ+HYRQ0qlLYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4lZDmw
 L7uIwTDjbUfihdBqpVRMxP4FBdhG+gR+SfQCk=; b=EVJ2TS7+237nSKit5jpK5q
 mm8C/wjFOi+jVZ+LSSU5NPgqfzuYT4eu21llHOCd27DHqVTDkBH+qOtg6LT4lMfJ
 fxWwC5OE+QizFPA9u50lRYQvQieX2E8S70TgrOn903WPeh46HWppeUQ4h//qO1tA
 DhhM/Iv9PXJrxRD+a9x/xCITeHxo3Pn2WijacVZ5uumpK3zcL+PFItPoWzy8bTSU
 3nlu6KYUORxAryIsxbHZsrM/e/iT7WDl85AwkootmYiS2/LAkOM6o06xogWPefvh
 XpqiB+xekS0AYerSC+e9tBsy9hqX+JkM4fDkKMoENJ0BKzhOfOC0/ddwQfzdhuEw
 ==
X-ME-Sender: <xms:JQbwYXWeASKSQNPLkVasfma-kfJW3r4Bp1gI3w3F-NiDuN_3XozGQA>
 <xme:JQbwYfmx38DE_esiqd6TEUqKvzmMszDSSunhCpwTXnLqeT7kDwvk7p6qyK4WR3TbY
 0jYHRE23s5lloKmpmg>
X-ME-Received: <xmr:JQbwYTbVEBCMV-lfTzrUlsBx3vszwFyEhhvk2g54I2RDb6uV16jU1itoFeFOL9pMKpefOn2AZs7hz7L0F7iexhjep4ulTY7wIK6_Lgc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JQbwYSW4ZJ3wEpjl_CZs-k86fGg0um8w6F-vBNDyP-dj3g9cFm9zHg>
 <xmx:JQbwYRlqs5V7KHv3BD-KgacTza2CJ6NYSTfPTbetQ53gsP5AUEhNcg>
 <xmx:JQbwYfc-qex9UsnIQSTw__-d3HFNYNdiulGC3nSh6jikY_C-AVpCmQ>
 <xmx:JgbwYXWsba-Hsi67WLV9xkSEatpQrQf4NXF35gAhf_7z84fvLibxgw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:16:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 06/10] clk: bcm: rpi: Add variant structure
Date: Tue, 25 Jan 2022 15:15:45 +0100
Message-Id: <20220125141549.747889-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125141549.747889-1-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We only export a bunch of firmware clocks, and some of them require
special treatment.

This has been do so far using some tests on the clock id in various
places, but this is fairly hard to extend and doesn't scale very well.

Since we'll need some more cases in the next patches, let's switch to a
variant structure that defines the behaviour we need to have for a given
clock.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 62 +++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index dd3b71eafabf..f7185d421085 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -56,6 +56,8 @@ static char *rpi_firmware_clk_names[] = {
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
 #define RPI_FIRMWARE_STATE_WAIT_BIT	BIT(1)
 
+struct raspberrypi_clk_variant;
+
 struct raspberrypi_clk {
 	struct device *dev;
 	struct rpi_firmware *firmware;
@@ -66,10 +68,36 @@ struct raspberrypi_clk_data {
 	struct clk_hw hw;
 
 	unsigned int id;
+	struct raspberrypi_clk_variant *variant;
 
 	struct raspberrypi_clk *rpi;
 };
 
+struct raspberrypi_clk_variant {
+	bool		export;
+	char		*clkdev;
+};
+
+static struct raspberrypi_clk_variant
+raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
+	[RPI_FIRMWARE_ARM_CLK_ID] = {
+		.export = true,
+		.clkdev = "cpu0",
+	},
+	[RPI_FIRMWARE_CORE_CLK_ID] = {
+		.export = true,
+	},
+	[RPI_FIRMWARE_M2MC_CLK_ID] = {
+		.export = true,
+	},
+	[RPI_FIRMWARE_V3D_CLK_ID] = {
+		.export = true,
+	},
+	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
+		.export = true,
+	},
+};
+
 /*
  * Structure of the message passed to Raspberry Pi's firmware in order to
  * change clock rates. The 'disable_turbo' option is only available to the ARM
@@ -183,7 +211,8 @@ static const struct clk_ops raspberrypi_firmware_clk_ops = {
 
 static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 					       unsigned int parent,
-					       unsigned int id)
+					       unsigned int id,
+					       struct raspberrypi_clk_variant *variant)
 {
 	struct raspberrypi_clk_data *data;
 	struct clk_init_data init = {};
@@ -195,6 +224,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		return ERR_PTR(-ENOMEM);
 	data->rpi = rpi;
 	data->id = id;
+	data->variant = variant;
 
 	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
 				   "fw-clk-%s",
@@ -228,9 +258,9 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 
 	clk_hw_set_rate_range(&data->hw, min_rate, max_rate);
 
-	if (id == RPI_FIRMWARE_ARM_CLK_ID) {
+	if (variant->clkdev) {
 		ret = devm_clk_hw_register_clkdev(rpi->dev, &data->hw,
-						  NULL, "cpu0");
+						  NULL, variant->clkdev);
 		if (ret) {
 			dev_err(rpi->dev, "Failed to initialize clkdev\n");
 			return ERR_PTR(ret);
@@ -264,27 +294,27 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 		return ret;
 
 	while (clks->id) {
-		struct clk_hw *hw;
+		struct raspberrypi_clk_variant *variant;
+
+		if (clks->id > RPI_FIRMWARE_NUM_CLK_ID) {
+			dev_err(rpi->dev, "Unknown clock id: %u", clks->id);
+			return -EINVAL;
+		}
+
+		variant = &raspberrypi_clk_variants[clks->id];
+		if (variant->export) {
+			struct clk_hw *hw;
 
-		switch (clks->id) {
-		case RPI_FIRMWARE_ARM_CLK_ID:
-		case RPI_FIRMWARE_CORE_CLK_ID:
-		case RPI_FIRMWARE_M2MC_CLK_ID:
-		case RPI_FIRMWARE_V3D_CLK_ID:
-		case RPI_FIRMWARE_PIXEL_BVB_CLK_ID:
 			hw = raspberrypi_clk_register(rpi, clks->parent,
-						      clks->id);
+						      clks->id, variant);
 			if (IS_ERR(hw))
 				return PTR_ERR(hw);
 
 			data->hws[clks->id] = hw;
 			data->num = clks->id + 1;
-			fallthrough;
-
-		default:
-			clks++;
-			break;
 		}
+
+		clks++;
 	}
 
 	return 0;
-- 
2.34.1

