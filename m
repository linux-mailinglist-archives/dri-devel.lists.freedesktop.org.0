Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD341B8009
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF7B6EB3E;
	Fri, 24 Apr 2020 20:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543966EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:35:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1C92E13FB;
 Fri, 24 Apr 2020 11:35:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ctXBvT/DjYZNa
 97RbhmVi1iu6+1OMaB43UOHworXfZE=; b=CvQJ3kHhejPP/9gBHXOFYf8s1zCoO
 8n0YgJoqefpg5oUiIhprnnGBa+VTWW5k8Pi/U66MobiZ93Hry+tnOM0PCDmTlxat
 LFVr0+W/BJIqM/QefWKswChc1V3ivhmpywvfCvjJrDO75gy47Ukw+1EaGBW801FP
 tNC0edVBoSZNvENtsVv2IahX3cZyRL4B9yE4uRZYZqhEnnahgXUu8DR9zPhQnyXH
 n7evFEmBYWJbyLOM2o+StepOWZXbey2HryJRWTtZDzlfgQvcmaLiT2ibAolD6EyI
 AMEe1q/7e9nq7EZOelqP+w2ftSHz34PDAmBejWeBpECMhU/uCmzHN+RBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ctXBvT/DjYZNa97RbhmVi1iu6+1OMaB43UOHworXfZE=; b=QIF0e6Ce
 uobmTecirmqbhEW7kwIIyFt5L6MLN57uyMIllUarxxBy9FQMptwg9+10N1qyyM2T
 zrL3YdIe251zicZbL/G/FZ+B5JFC644UmQzvbYka0snJjRfgAdaQd14/dQKUJKBH
 91yRKAzF9SEcHgfVETrIzr8Ih9o+Bd/zd/53gxXqcnDTc/YwuL72qtrTWmxelJCJ
 ak/CpINNFdrz7+znm3l+vjBx8wFQNVDfI+ccEgHAhcLFFVv7o20A80kObx4/ZXt4
 NbBjwiRdtFDah/D54mKd9OMMiz/G0VKPgEcMSmCIbwm/GDboMIyVvK8ckf0kfUeS
 nvyixTBUggrOvA==
X-ME-Sender: <xms:TwejXuV0oyWlePGmZHGGTeyZWtqPjceCjSVfigQx_xk4u7Gs5vLnQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TwejXv2Wl_Hxzslsu5VL-BvMoLXinnEuaSLlhfmOBn5Sb0S9nOf_3Q>
 <xmx:TwejXlDnuspksjIsgvicRuZoZUGwhKBzkuOtYeKOGEWIPXoVwdeiVw>
 <xmx:TwejXlB57ZxTmCgYzYgriL4StbyQPd58nmNrA9mijTdisbVgu4YuvA>
 <xmx:TwejXk0velAR7_S9gcUY-L5P_CeFfuLI9LKRI5kz4mUwNtaEGeUCD_mAWuA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5BEE53065DA6;
 Fri, 24 Apr 2020 11:35:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 15/91] clk: bcm: rpi: Pass the clocks data to the firmware
 function
Date: Fri, 24 Apr 2020 17:33:56 +0200
Message-Id: <db082ca433f69533e4cdf41c80a0699a61aa285e.1587742492.git-series.maxime@cerno.tech>
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

The raspberry_clock_property only takes the clock ID as an argument, but
now that we have a clock data structure it makes more sense to just pass
that structure instead.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6aee81f494bb..6e8977b70e38 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -67,11 +67,12 @@ struct raspberrypi_firmware_prop {
 	__le32 disable_turbo;
 } __packed;
 
-static int raspberrypi_clock_property(struct rpi_firmware *firmware, u32 tag,
-				      u32 clk, u32 *val)
+static int raspberrypi_clock_property(struct rpi_firmware *firmware,
+				      const struct raspberrypi_clk_data *data,
+				      u32 tag, u32 *val)
 {
 	struct raspberrypi_firmware_prop msg = {
-		.id = cpu_to_le32(clk),
+		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
 		.disable_turbo = cpu_to_le32(1),
 	};
@@ -94,9 +95,8 @@ static int raspberrypi_fw_pll_is_on(struct clk_hw *hw)
 	u32 val = 0;
 	int ret;
 
-	ret = raspberrypi_clock_property(rpi->firmware,
-					 RPI_FIRMWARE_GET_CLOCK_STATE,
-					 data->id, &val);
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_GET_CLOCK_STATE, &val);
 	if (ret)
 		return 0;
 
@@ -113,9 +113,8 @@ static unsigned long raspberrypi_fw_pll_get_rate(struct clk_hw *hw,
 	u32 val = 0;
 	int ret;
 
-	ret = raspberrypi_clock_property(rpi->firmware,
-					 RPI_FIRMWARE_GET_CLOCK_RATE,
-					 data->id, &val);
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_GET_CLOCK_RATE, &val);
 	if (ret)
 		return ret;
 
@@ -131,9 +130,9 @@ static int raspberrypi_fw_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 new_rate = rate / RPI_FIRMWARE_PLLB_ARM_DIV_RATE;
 	int ret;
 
-	ret = raspberrypi_clock_property(rpi->firmware,
+	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_RATE,
-					 data->id, &new_rate);
+					 &new_rate);
 	if (ret)
 		dev_err_ratelimited(rpi->dev, "Failed to change %s frequency: %d",
 				    clk_hw_get_name(hw), ret);
@@ -198,18 +197,18 @@ static int raspberrypi_register_pllb(struct raspberrypi_clk *rpi)
 	init.flags = CLK_GET_RATE_NOCACHE | CLK_IGNORE_UNUSED;
 
 	/* Get min & max rates set by the firmware */
-	ret = raspberrypi_clock_property(rpi->firmware,
+	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
-					 data->id, &min_rate);
+					 &min_rate);
 	if (ret) {
 		dev_err(rpi->dev, "Failed to get %s min freq: %d\n",
 			init.name, ret);
 		return ret;
 	}
 
-	ret = raspberrypi_clock_property(rpi->firmware,
+	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
-					 data->id, &max_rate);
+					 &max_rate);
 	if (ret) {
 		dev_err(rpi->dev, "Failed to get %s max freq: %d\n",
 			init.name, ret);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
