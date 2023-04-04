Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E86D634E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC2E10E408;
	Tue,  4 Apr 2023 13:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8CE10E692
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:38:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B026F5821D1;
 Tue,  4 Apr 2023 09:38:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 09:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615494; x=1680622694; bh=9erKL76nF+zcChQfvUOIX+3IbIizLEe+2X3
 rEnpMzWM=; b=PIung3aa5vgiRKpawa5FHBi4L4D505BrBc9E6l6XSDbD6p+F1/3
 qfbtMTfTDlmhWNSIXVKkDcoKRyUN040HtOoe5yd4OK+FyckrhBlDAevDYFX3KOnr
 qL8Vfa5WVt+F1uuClr84120WJjbCTIqeiaVGgpVUe23ezyoEWzs2osDFZyLQtFEH
 0S5s5nGMilfOQacx04JEG5f0z1+jbu9VfH2TVJ6mRCr0gZQH0ysGdISPOFrwjfEd
 k/5VurEpLRbHCavCSXhwwhFR44j0nBeXQgW9RdGnAOFbIZsqjm+K3uZ9nmLvxGwd
 NZJKozSDTRdM5zHdFgXyOeNKnV57lx8iMKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615494; x=1680622694; bh=9erKL76nF+zcChQfvUOIX+3IbIizLEe+2X3
 rEnpMzWM=; b=h7o2/bCfIvORqMGoznaWJESVKSuB8LrrwsP0PhmfmUEYpE9mhm6
 alLRJDo8YfOoW/SQ8gc7QrkIVbh/Hr8ijAuG2jQEsXOp8WQS+gHUdy56/TDhU5YF
 2OaEO5SvAHBz+eDD+My6ch9C0T5X1duzcKB4/r+2HAd/MaA6OUHsRdLU6t5wtmG8
 OBE2LD5patTL4wy0BlMbFtpEb5FYoh4/EcF5HyYy9af/DEJn4lTjfsJ1Oz/Ye1+Z
 d7tqxMFCfpKb1ts7ZzBI5fI0FZWDs/Bh1Em0l9aTvFufPvmKCqNr4eV4BT1UMQ+K
 iTSEh+8ZKDTImGgFfCbZB2mW8ZEJu7vjlfw==
X-ME-Sender: <xms:RigsZJzuvO5m0NIADv3WYjcPo6tZomBzFgLaU6NoyekkncryjMUNnw>
 <xme:RigsZJTcl-xowiA2RZ87b46YWnl-Apyt3g26IWhRkeccoaJxDcJEgT6_iynQecJ2I
 p46BlcglVIBtpp4bv8>
X-ME-Received: <xmr:RigsZDU7ptS16n4LZp4DHKzVyA4nBM5WRDrNn-vyiQBxJ38GG3aAfDa1fdvcU_RFE80UYIIrTU19nzITfJtCHdewOvGWHZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RigsZLg_uLPn1iMPuNN7QC4IOq3H1ZmOeWfOUCIw_UGJFkZskY7BKQ>
 <xmx:RigsZLA1lpjwF75ShyyeKWPhXcaBDk5qfUDb9nZk_EnJ5v7p016mOw>
 <xmx:RigsZEKYV4tEc5ZWPZhRAhWxabR_QSW-g1jIXgk3pvBl-kuaDRBxOw>
 <xmx:RigsZFP0cpbupEZYj5R_P64BMDaQvvJAuRGPqLelTyELK4CYv5dMWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:38:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:41 +0200
Subject: [PATCH v3 51/65] clk: si5351: pll: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-51-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=MEbs6Fry9hN6nhk6b6j7l4iM8w51a4M3wMGk4q51/gw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37d3m2ZEree7LBjHwqDxmcXShXNFTZuho+zXq7q3HvSe
 3CXTUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIls5WJkmLw11O+xW6uCqcbd6wVCtn
 72dk9XN4YlZKxOes+gfkd4B8P/wJTPq0pF5Dv/s6/8sM/a32pb57r/mrNmb5ghZvXr/id3TgA=
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
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SI5351 PLL clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5351.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 9e939c98a455..fcf5785ba4ce 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -442,11 +442,12 @@ static unsigned long si5351_pll_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)rate;
 }
 
-static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int si5351_pll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned long rfrac, denom, a, b, c;
 	unsigned long long lltmp;
 
@@ -456,18 +457,18 @@ static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		rate = SI5351_PLL_VCO_MAX;
 
 	/* determine integer part of feedback equation */
-	a = rate / *parent_rate;
+	a = rate / req->best_parent_rate;
 
 	if (a < SI5351_PLL_A_MIN)
-		rate = *parent_rate * SI5351_PLL_A_MIN;
+		rate = req->best_parent_rate * SI5351_PLL_A_MIN;
 	if (a > SI5351_PLL_A_MAX)
-		rate = *parent_rate * SI5351_PLL_A_MAX;
+		rate = req->best_parent_rate * SI5351_PLL_A_MAX;
 
 	/* find best approximation for b/c = fVCO mod fIN */
 	denom = 1000 * 1000;
-	lltmp = rate % (*parent_rate);
+	lltmp = rate % (req->best_parent_rate);
 	lltmp *= denom;
-	do_div(lltmp, *parent_rate);
+	do_div(lltmp, req->best_parent_rate);
 	rfrac = (unsigned long)lltmp;
 
 	b = 0;
@@ -484,19 +485,20 @@ static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	hwdata->params.p1 -= 512;
 
 	/* recalculate rate by fIN * (a + b/c) */
-	lltmp  = *parent_rate;
+	lltmp  = req->best_parent_rate;
 	lltmp *= b;
 	do_div(lltmp, c);
 
 	rate  = (unsigned long)lltmp;
-	rate += *parent_rate * a;
+	rate += req->best_parent_rate * a;
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: a = %lu, b = %lu, c = %lu, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), a, b, c,
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -533,7 +535,7 @@ static const struct clk_ops si5351_pll_ops = {
 	.set_parent = si5351_pll_set_parent,
 	.get_parent = si5351_pll_get_parent,
 	.recalc_rate = si5351_pll_recalc_rate,
-	.round_rate = si5351_pll_round_rate,
+	.determine_rate = si5351_pll_determine_rate,
 	.set_rate = si5351_pll_set_rate,
 };
 

-- 
2.39.2

