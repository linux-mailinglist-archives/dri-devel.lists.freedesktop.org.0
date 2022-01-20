Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F049503C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED57F10E512;
	Thu, 20 Jan 2022 14:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453B310E3E3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 30A2E320100E;
 Thu, 20 Jan 2022 09:34:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Jan 2022 09:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=4lZDmwL7uIwTDjbUfihdBqpVRMxP4F
 BdhG+gR+SfQCk=; b=T71ezbO8IN6xOgur2gVXNIYh90W9yvTPsLW5cg1dBFsX8E
 csC2NHJ46larqHyju03o+bFAqxg074AeUTKlwzXckqnfeTDj80JJQQUxLDNtCmma
 ZiKmmRfEnHCp8ZHyPVXqDzZKB1hKyWrY7/4uy2kWdqqwkMG/hOu1wEyK9GyJ8zSZ
 HnjajVZvSgB9gEf465JY5mztJ+7nDTnqCgRPIL+L3MZmjMb1vcdxzK35VbRYjkX4
 lFXqEGyhMnDnVi9ePKEmHm6lCEIVhLLCm2Aoqlo+6pljK4VPO5PTel7z9ixU+LYA
 U2fexNjWm3i+BySgVL1M8YWELJEYdnWdxMzsVnqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4lZDmw
 L7uIwTDjbUfihdBqpVRMxP4FBdhG+gR+SfQCk=; b=kMfftyxtXFmrCmJ0gLfgyp
 KoAsypHYsk30+GIY9Nt3S/IoCROiGSjhKXHk5iucyhhkLRfB8rZ2mElaIfHz62wb
 FWj3cvUOJCMwQlfpV5TZUQRbGrgaZfuPlW9b1BDxMKWoBEu1dd+nFNDvmC4gPu+4
 TYey5VI2iyme/xsbZ7dXWr8iBAgMvlpQ5fOoCh2GItw+7IqQlyk/pUziwqCsUeKL
 oXwPtcSA/DMf0PF6+GrhhWFIiakJomWgkOaojMlgShrTNRHC2rBJR7PzwvhN0S91
 IWLOzgarHFy8n6S0LD6lyXr0l4ycFQtWV+Eesi2c97lohjN+ebWWR1iysSqRvPzA
 ==
X-ME-Sender: <xms:AXPpYeAqZX15k-IE1gMQkQxyDskVYW3aXe2k_IY64RSkzyA_YrebXg>
 <xme:AXPpYYidDleu9JoM915qsrPCOo3lb5Tz6mWgxT3Gsz-QJGbKeg3-Lt4PBqAIGmw3X
 Otj5aLmhylvHo1KYiY>
X-ME-Received: <xmr:AXPpYRmbgVMW6d9Iqg1YKRFKm8L4eFG5Ide2B_ann-XB4jam-WI8Xi5jDaK080Yk8lB0GOXtqtLWzMVlX0AJyZ9WAWXVFJV89U_WrGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AXPpYczrdu08cBDOoYfzT58luNu85NvBKkgbzDJV4tYrgr-5xpP16w>
 <xmx:AXPpYTRyz3exrAJQ6X5iQR4H9-bCBQ6XsQ_P7DNeRX6LRqzLyq6srg>
 <xmx:AXPpYXb0xESrH2PMb_ynaYk9R-ORc2JiFNV5YQ7FCCQrBNz_Dace8w>
 <xmx:AXPpYcSZ-osWZ5oimW5Z7pOcqROEcOp6Hz6B5MeLflkO3NU6D0LOaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 06/10] clk: bcm: rpi: Add variant structure
Date: Thu, 20 Jan 2022 15:34:13 +0100
Message-Id: <20220120143417.543744-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
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

