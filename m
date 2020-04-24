Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955331B7FE7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194406EB23;
	Fri, 24 Apr 2020 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E1B6EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:35:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B95A011F5;
 Fri, 24 Apr 2020 11:35:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=i3O1tyCJfoSTi
 OveFupJRtNg6+Af9LTGwU4Q/kX/tSc=; b=SSC1xCY2BDdRD6c82Ir8VxJf8TUX3
 NaCQ1jeQmD4JQuA4csNUCKrMc15CXdlDfpQqvpo6O//M6Br/fGCospwIRgvfXYMW
 lACY/c9c0vVn71kqqgUoLXHrRDTNUdgohYb6FWU8c8/nCQw6C8Y5a0hRJ9wqI4Nw
 5ZbKpWa7xN5L+dA5DyKN0duTv0mOHByuRTffMxXMal7XmftOCDZfh+2+CXj6T+WR
 xTgFz6SjC0/YpkwdpW2JyOoOyWOkKm2nB15JizSqFLYmtT9I0wyK/hGVz/TSOd6f
 47795ektIBxkW+0rqmfYbd5DJn/vBXewRaFjBeHx2Qia1Np8tqSiZRnBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=i3O1tyCJfoSTiOveFupJRtNg6+Af9LTGwU4Q/kX/tSc=; b=gvpRGKPZ
 aSS3aGoqgBAkSd8ghrgVr6IK8JKNP84X5JGO2+lcWogMA1ja/7EFHo8Djnfhjs0Y
 3cBOCKsQQ0cuLu4KuhGJPnCQT88lfPbC+/o1lc+jJsbMkSiLHcY/WQBF150/LpZZ
 SI5c7N6AHWCdbiWxWyf8rHEk592cJ12HNEoy9ZIptlVYKN7Q2RwR9PxUjG79dKtE
 mIqF2sRlVZlYy9U7E5Xyw7noQC4bVixq1PEX7Jehy+c5utkhGXpt4uQ12QHWKVif
 dqpGGWPyY3pgiErlX1lkG+q9naSrPmMx949fhwT0H+s07WWjYT8vDWqFi2D/qYVp
 ytbpNru6Z/Ki/Q==
X-ME-Sender: <xms:TgejXjqC1ESkghUs2nvD_mhKVZRsrkflmQJaxF-BjDbUncaHhocmug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TgejXkbXKOTc8i5xJ9GlFwKHKBCKCW8Q7bcjGfDGCvwX759Q4UgpAA>
 <xmx:TgejXpCZtH-1GLVAtQ2cUcFQgX4pnjnUUXHYFdTR_RHjHrYtbHJgzg>
 <xmx:TgejXrnvHXYvQMM8MzDfiXUpQ-sXYizhcRS-SC2KiSi9pnEHA8McNw>
 <xmx:TgejXvkHr609zd2YXs2n3gA1jXTWnCQGgNtw77UKOnWDhHT9I01kSOho0kA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDAC5328005A;
 Fri, 24 Apr 2020 11:35:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 14/91] clk: bcm: rpi: Add clock id to data
Date: Fri, 24 Apr 2020 17:33:55 +0200
Message-Id: <ec20803ae85f927aafe2d3d3f1379a141ccac2d4.1587742492.git-series.maxime@cerno.tech>
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

The driver has really only supported one clock so far and has hardcoded the
ID used in communications with the firmware in all the functions
implementing the clock framework hooks. Let's store that in the clock data
structure so that we can support more clocks later on.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 75197d8574cf..6aee81f494bb 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -39,6 +39,7 @@ struct raspberrypi_clk {
 
 struct raspberrypi_clk_data {
 	struct clk_hw hw;
+	unsigned int id;
 
 	unsigned long min_rate;
 	unsigned long max_rate;
@@ -95,7 +96,7 @@ static int raspberrypi_fw_pll_is_on(struct clk_hw *hw)
 
 	ret = raspberrypi_clock_property(rpi->firmware,
 					 RPI_FIRMWARE_GET_CLOCK_STATE,
-					 RPI_FIRMWARE_ARM_CLK_ID, &val);
+					 data->id, &val);
 	if (ret)
 		return 0;
 
@@ -114,8 +115,7 @@ static unsigned long raspberrypi_fw_pll_get_rate(struct clk_hw *hw,
 
 	ret = raspberrypi_clock_property(rpi->firmware,
 					 RPI_FIRMWARE_GET_CLOCK_RATE,
-					 RPI_FIRMWARE_ARM_CLK_ID,
-					 &val);
+					 data->id, &val);
 	if (ret)
 		return ret;
 
@@ -133,8 +133,7 @@ static int raspberrypi_fw_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	ret = raspberrypi_clock_property(rpi->firmware,
 					 RPI_FIRMWARE_SET_CLOCK_RATE,
-					 RPI_FIRMWARE_ARM_CLK_ID,
-					 &new_rate);
+					 data->id, &new_rate);
 	if (ret)
 		dev_err_ratelimited(rpi->dev, "Failed to change %s frequency: %d",
 				    clk_hw_get_name(hw), ret);
@@ -189,6 +188,7 @@ static int raspberrypi_register_pllb(struct raspberrypi_clk *rpi)
 	if (!data)
 		return -ENOMEM;
 	data->rpi = rpi;
+	data->id = RPI_FIRMWARE_ARM_CLK_ID;
 
 	/* All of the PLLs derive from the external oscillator. */
 	init.parent_names = (const char *[]){ "osc" };
@@ -200,8 +200,7 @@ static int raspberrypi_register_pllb(struct raspberrypi_clk *rpi)
 	/* Get min & max rates set by the firmware */
 	ret = raspberrypi_clock_property(rpi->firmware,
 					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
-					 RPI_FIRMWARE_ARM_CLK_ID,
-					 &min_rate);
+					 data->id, &min_rate);
 	if (ret) {
 		dev_err(rpi->dev, "Failed to get %s min freq: %d\n",
 			init.name, ret);
@@ -210,8 +209,7 @@ static int raspberrypi_register_pllb(struct raspberrypi_clk *rpi)
 
 	ret = raspberrypi_clock_property(rpi->firmware,
 					 RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
-					 RPI_FIRMWARE_ARM_CLK_ID,
-					 &max_rate);
+					 data->id, &max_rate);
 	if (ret) {
 		dev_err(rpi->dev, "Failed to get %s max freq: %d\n",
 			init.name, ret);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
