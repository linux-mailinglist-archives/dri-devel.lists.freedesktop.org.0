Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7D619819
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0975010E7BE;
	Fri,  4 Nov 2022 13:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B023E10E79E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1CB475805AF;
 Fri,  4 Nov 2022 09:33:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568836; x=
 1667576036; bh=8i9Mndy2jbfBk1MIVA7c/A2hrdbXrLt4ZlzMYH+ZKBI=; b=Y
 tFpLN/RrfKWUEcWDR0f4VrdRTlj4gIMKGGpfK0akKub31fTdbquIY/iS3Ua2LFqo
 chXDAEUzsvUrNYDMr91oZozPbA1gpnelWwcINGl2rx+gHlT6em+qGNhMZ4Jpbo+s
 OxWGotUcAVThTMFOKgTnbY5eVDjboisUaiJqJXcvmmAQ/x8LioOlI0Gw4zjA8i0r
 YcF3pggSXgWn5eQd3A9hrEUHDTDKmXHsezYWpKflijmMJETSEA1OuyQakkyyKH9E
 f9Zw4Tj341f7UEjA+mG7kxo/uGP/D2HT32QZzh5aVzVo0fkdHtHEFgpklLUePDiu
 +/50mfTLVF8VAFoDbo+8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568836; x=
 1667576036; bh=8i9Mndy2jbfBk1MIVA7c/A2hrdbXrLt4ZlzMYH+ZKBI=; b=I
 Dim9KnhBoO75TmaMviA33lXsyJaI5GzBZhMxr7PkD2xhbo4GP+AAk/aLXQuiGx5g
 gBq2LY6aTVQDjm/uWk9LEKn+6vlJTw0bdMMgvWzsxkNNLli5iPshkfcFqTZ983y9
 UnSDBNmrN/PSdmukA7VZhzVEQTyNRUBT6R7kicjqHtX8UoTrBEreK9m56whIkCoP
 VTfrQM0aJfyLkF2x+qQpo2BugpbKSVEebmNKyHDY6PCE+4//j89QnLeD/Mr7LqZG
 6xzsj9WkR4zZDyJa+fKLcPkGmFseQ2AJTkgkdowkMltbPQWAQBwIwRQHyq9/whOZ
 ZmaOxa1PlWGSgJ8frasGQ==
X-ME-Sender: <xms:wxRlY_sGaUKevWVJcyUWxXmH_gF14N4bWQN11bmRePnvVSai8iA9YA>
 <xme:wxRlYweXVwQYfjMOnu_orcFboj0UgVJbgOFePmjCiqUJ0TgHS_jHaYgpxXPX6YlD0
 lbJi89X4ME9_hJbqM4>
X-ME-Received: <xmr:wxRlYyzwz87gIICWoAMSvh1qDLD0w_tlewKaE9XxM22KDLnwDZ9Lbd6CyUhB0kwbUIgC8REVHMg5L4cRbCjrs6r4KQEVftdOMhHhl7v9Qp4otQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wxRlY-M2xLXb2o2X9JvAgpWTdk8tzd77fs3G_O89BKyfGhHPVUZEow>
 <xmx:wxRlY_8UY10jK9A0kF2NsrKGiBxLBAqT1IE5AlUkQ7ZLRGk3KT_i2Q>
 <xmx:wxRlY-WmB8bYawzGPDv5ppZqGGo8HW1ayy05wOhsijdSQRm4hCOBPg>
 <xmx:xBRlY5dsSb2BVE_qW1PBYqjGk9oiX0uB6lms6dkAlzDGMKViO62QGg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:17 +0100
Subject: [PATCH v2 60/65] clk: stm32: composite: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-60-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3796; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wiPrQrPtwHN8JkTzjgovj5i1AFxQRgKSk4e/VekItv0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt+2uc8y+efrdmg9i7mF6t9F12s1T8acW/1o/bozHvv/
 7rVO7yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEvjUy/M9KP163gqVsrXqg9h954S
 fCJlMuyn63NnK9Xp+vJOM8kZGR4bf7tEXfjytNd2E8m5rGw/yAJfHgUtvQST9Zou1Ezl6sZgMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STM32 composite clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/stm32/clk-stm32-core.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 3247539683c9..4027ca7d9806 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -349,14 +349,15 @@ static int clk_stm32_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_stm32_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *prate)
+static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_stm32_div *div = to_clk_stm32_divider(hw);
 	const struct stm32_div_cfg *divider;
+	unsigned long rate;
 
 	if (div->div_id == NO_STM32_DIV)
-		return rate;
+		return 0;
 
 	divider = &div->clock_data->dividers[div->div_id];
 
@@ -367,14 +368,24 @@ static long clk_stm32_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		val =  readl(div->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-				divider->width, divider->flags,
-				val);
+		rate = divider_ro_round_rate(hw, req->rate, &req->best_parent_rate,
+					     divider->table, divider->width, divider->flags,
+					     val);
+		if (rate < 0)
+			return rate;
+
+		req->rate = rate;
+		return 0;
 	}
 
-	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 rate, prate, divider->table,
-					 divider->width, divider->flags);
+	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
+					 req->rate, &req->best_parent_rate,
+					 divider->table, divider->width, divider->flags);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long clk_stm32_divider_recalc_rate(struct clk_hw *hw,
@@ -602,7 +613,7 @@ static void clk_stm32_composite_disable_unused(struct clk_hw *hw)
 const struct clk_ops clk_stm32_composite_ops = {
 	.set_rate	= clk_stm32_composite_set_rate,
 	.recalc_rate	= clk_stm32_composite_recalc_rate,
-	.round_rate	= clk_stm32_composite_round_rate,
+	.determine_rate	= clk_stm32_composite_determine_rate,
 	.get_parent	= clk_stm32_composite_get_parent,
 	.set_parent	= clk_stm32_composite_set_parent,
 	.enable		= clk_stm32_composite_gate_enable,

-- 
b4 0.11.0-dev-99e3a
