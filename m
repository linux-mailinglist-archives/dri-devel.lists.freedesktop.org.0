Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732E6D6339
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00B410E347;
	Tue,  4 Apr 2023 13:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59F710E347
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:38:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 341DD5821BC;
 Tue,  4 Apr 2023 09:38:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Apr 2023 09:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615480; x=1680622680; bh=Dhd6yL5TpMOvIrmJoOZH9zi1d6+MQRODdEI
 5fIeORc8=; b=Biv03KLDSFRgnFAFwYUF16x6GFriul6lIt6HpX8L8GavaG123C7
 2UfWIoITvRK+b2PRmHKm9LrJl1ZdfrGE8R2u4fd+unmGbTqPmDae2OFNG2TZ4v4F
 tX2fFNjQsRPAAHhAAA6AAgvVRP9nALqo9GejBDLRDZ1qS29RSwwht6Z9zPGRifbY
 knmCBdisDK2CxJNPMpz5vLfVjMYP6mH09JRHD1wgE2DVLbsALfA4GwZ7jBsoPhVj
 10E5XcqZsHCdRfBvcVay7jfbXJ/QOByhi5C91Wxrb5T7qNnMlfzKVQkRE470HxJ/
 hPgX/7iadn/H1F1ac9O8Bt4wVo+HrkzVfQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615480; x=1680622680; bh=Dhd6yL5TpMOvIrmJoOZH9zi1d6+MQRODdEI
 5fIeORc8=; b=Tm45GPIAlZdvzX5wBioLMY+2x2+ZB3kB3Ial583LOT4DqwraFXq
 rQAKv3pKWHwud82JGE6x2b3VG3Ip+vBzL9qTjW9VSORTMZos2AatepTt/Hk1SLc7
 xQ1AWjraTfHgepF3OJJiyBk5NWTY//+UpOUaj2isaLbrTI171vUyyrTjX3l89uhm
 AIffHQ5y+iRjzFZhdmmjlMZlseuZwDBLCMOwlXRTOV/7VqBOynoeqScgFgj7jwfM
 GwcCxGikkCee/nbr2dDsIf64z78erC5NXwHyEZgX9X1eAG4fJPblXHFaQAWLFaJY
 JcGhkuGUWSbT/I1pf47JxRijyXIyvVeKAFQ==
X-ME-Sender: <xms:NygsZOJw9onwlxPCTFbcZWIIhBdZSMO8q527Tni7BkRRAmc3cOxHzw>
 <xme:NygsZGI4p3s8Rgp21HjYkAmM_ai-x7jICwrcmQeBl6keZqw5K-WvpBCd4CklcZe-I
 5Cu4l_eBTitRUzlGEU>
X-ME-Received: <xmr:NygsZOtlk9CXGeHGukK990vH7SX1Mdn6pKaLyq9olfVOt9FXJTFVvF7nENWL2cu27clEZEIXd7VB2N3Pmd10tbecvL0J4lQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OCgsZDbz2j_RuaHnZtiQk-sBSI7W22mkUsPCv-K-6-q4LaavHvgMiA>
 <xmx:OCgsZFbWxyw0k1ipkvJnkQzFWSbvIOP_Gc0GFod24ErP8mYUMzSbLg>
 <xmx:OCgsZPAi1ke_1E03Sm2lNwBp8YcttWSvW--O3XVCZPOEguuVlgDLzQ>
 <xmx:OCgsZGlgRMdX6lEfBlKniHEdNgmrTAw4i8VrxJv6tk9hXVGFhLWGxg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:37:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:37 +0200
Subject: [PATCH v3 47/65] clk: axi-clkgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-47-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=9oaQlpc/KFCCil+OTLUgEmUzF3keYfuRRzMnXHxzJ4g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37c/yNgomH+rS7L0/r25R5fNuMIW9ky1v7bzRxtT4UvO
 /9zhHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIZTojwxOPlPS/XSG/HOUYfn6bKJ
 Cof/rnsnSBx8FnV3w6eD2qxZKRYW1Oh8E1q/05+peWnt9TUPKY9br7nPqkv/J75xoJalTPZAQA
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

The AXI clkgen clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-axi-clkgen.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 671bee55ceb3..dded52f9c774 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -384,23 +384,25 @@ static int axi_clkgen_set_rate(struct clk_hw *clk_hw,
 	return 0;
 }
 
-static long axi_clkgen_round_rate(struct clk_hw *hw, unsigned long rate,
-	unsigned long *parent_rate)
+static int axi_clkgen_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct axi_clkgen *axi_clkgen = clk_hw_to_axi_clkgen(hw);
 	const struct axi_clkgen_limits *limits = &axi_clkgen->limits;
 	unsigned int d, m, dout;
 	unsigned long long tmp;
 
-	axi_clkgen_calc_params(limits, *parent_rate, rate, &d, &m, &dout);
+	axi_clkgen_calc_params(limits, req->best_parent_rate, req->rate,
+			       &d, &m, &dout);
 
 	if (d == 0 || dout == 0 || m == 0)
 		return -EINVAL;
 
-	tmp = (unsigned long long)*parent_rate * m;
+	tmp = (unsigned long long)req->best_parent_rate * m;
 	tmp = DIV_ROUND_CLOSEST_ULL(tmp, dout * d);
 
-	return min_t(unsigned long long, tmp, LONG_MAX);
+	req->rate = min_t(unsigned long long, tmp, LONG_MAX);
+	return 0;
 }
 
 static unsigned int axi_clkgen_get_div(struct axi_clkgen *axi_clkgen,
@@ -495,7 +497,7 @@ static u8 axi_clkgen_get_parent(struct clk_hw *clk_hw)
 
 static const struct clk_ops axi_clkgen_ops = {
 	.recalc_rate = axi_clkgen_recalc_rate,
-	.round_rate = axi_clkgen_round_rate,
+	.determine_rate = axi_clkgen_determine_rate,
 	.set_rate = axi_clkgen_set_rate,
 	.enable = axi_clkgen_enable,
 	.disable = axi_clkgen_disable,

-- 
2.39.2

