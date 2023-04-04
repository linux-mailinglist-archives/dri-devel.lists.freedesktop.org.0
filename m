Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECFB6D7C6E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A2710E91C;
	Wed,  5 Apr 2023 12:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5665710E925
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:25:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id E031F2B06740;
 Wed,  5 Apr 2023 08:25:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 05 Apr 2023 08:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680697511; x=1680704711; bh=gWfanKGu7k0uR6sCschsWvSUb9iXlQk4TW0
 N04BwoCQ=; b=Wts/Ah4xwykIELLuVOyydo/p1UGL9G/HJY/ERkwIccdne8UsCAw
 X0PmG5K0bcqaEyRUzoWHG0oVt+49ZELc6VwPM2bbnB7Q6KDqcs8OOo8ckMbMZ+RL
 DKwDb8ModcB/XpwqnfSu9kwYDO781wqKfc3k85DrB5IrzhsEsb5/w+mH3LJR/fmM
 XbWCKuHGNs/G2Ncxgv0wXe0b7UZjnUDqlm/H+vVP7y6M5EzJSI5hwcXryt/7TWcn
 x2PoNUmovZSVXjqXU442ELIWyFCb2TK0OquEZRilwLsEUnxWf2tD6NYbDZuxZaBO
 1e9oE8wU1U+oCwmBb981th4h8d6MQ6I15rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680697511; x=1680704711; bh=gWfanKGu7k0uR6sCschsWvSUb9iXlQk4TW0
 N04BwoCQ=; b=TJt8SE1IgEzc0KpglToUainSE4eNFtJFqOIadR3Aw0w4iPzOBCp
 T7zZ1chmtSiOBxN3MvHWzyoyNC43zazRBLNOMgwV2goNvpcmLNoxWEHiDb/9V03T
 WqbkUOPppAfDp1lfLQERD4d9RtAdodePkq783ksNdsQOEtZ0YNss3Eprqjfvt/nN
 kO7L5DariGDXLonWJO+hWIpoZxEYQCsypuK/jqg0nKXQ3uvKiqloZ1BiukZJzPz1
 YpR3d+y3y6G243Ad9Cj01eNNPcdlL1pIs4n9C1Ejcg0dYX17CKsF9c3c6oJA9TLj
 OI6pgZjc8LIQJcEp85pkrQBuBvOHfuhKBEg==
X-ME-Sender: <xms:pGgtZOMldRw9UEzMSSw9I_16P6Nh8uWoC4G5IxdeXhaf6cgqrrzPkw>
 <xme:pGgtZM8vJW0v5RLXKfpP1B30xBya9iCZQG9f3N4LOeu6GPgZLeDUnDyQ9xb3eVe8U
 Jjfq16Xf1lnK5HolA0>
X-ME-Received: <xmr:pGgtZFSt_W3SaLhjt9yJ8c7kyZV5sinLzmDcveP-bhjWLgYOnINQKkWGt_VoysCLks7z4FJH18Z3Iufubf4jHvGpiizZ09U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pGgtZOuwD6V3-SK77MsB7UnDET01NWQ1J0FEM_a_tHDV_Wd8LAX3nA>
 <xmx:pGgtZGc6iX9GiPe48LHMJqyM2e5beO91F8WcGBskctjFG2kJLt3MBQ>
 <xmx:pGgtZC0EwUEqmao45oOU_dJyzQL31Mo4S3zcbaFAhGu0aeI6ljMT_w>
 <xmx:p2gtZGJX-HkMFt7mgRW1BHWYhPPxWlY5gUmeCqa4tyFNOW-Njt8_xUIYlj4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 08:25:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:53 +0200
Subject: [PATCH v3 63/65] ASoC: tlv320aic32x4: pll: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-63-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=H89ybMftU/jF/mSnT7t9XXRlldLTbWRKBAeeojhOMGw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ez8VvEii39va+tcvoZfzdxxUPd2wRkdwVYPMp1lo9Z
 pGHcUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIuIMvzT6NRk4a6VklCfFrt34pOivT
 dO/vx0ZleDzy3WQH7/Ndt8GP4Xn+z4wbyskuNe7PtDUnKLNxhutHRaJHJKenEay+7oL/bMAA==
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

The tlv320aic32x4 PLL clocks implements a mux with a set_parent hook, but
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
 sound/soc/codecs/tlv320aic32x4-clk.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 65b72373cb95..d8b8ea3eaa12 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -205,18 +205,23 @@ static unsigned long clk_aic32x4_pll_recalc_rate(struct clk_hw *hw,
 	return clk_aic32x4_pll_calc_rate(&settings, parent_rate);
 }
 
-static long clk_aic32x4_pll_round_rate(struct clk_hw *hw,
-			unsigned long rate,
-			unsigned long *parent_rate)
+static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct clk_aic32x4_pll_muldiv settings;
+	unsigned long rate;
 	int ret;
 
-	ret = clk_aic32x4_pll_calc_muldiv(&settings, rate, *parent_rate);
+	ret = clk_aic32x4_pll_calc_muldiv(&settings, req->rate, req->best_parent_rate);
 	if (ret < 0)
-		return 0;
+		return -EINVAL;
 
-	return clk_aic32x4_pll_calc_rate(&settings, *parent_rate);
+	rate = clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int clk_aic32x4_pll_set_rate(struct clk_hw *hw,
@@ -267,7 +272,7 @@ static const struct clk_ops aic32x4_pll_ops = {
 	.unprepare = clk_aic32x4_pll_unprepare,
 	.is_prepared = clk_aic32x4_pll_is_prepared,
 	.recalc_rate = clk_aic32x4_pll_recalc_rate,
-	.round_rate = clk_aic32x4_pll_round_rate,
+	.determine_rate = clk_aic32x4_pll_determine_rate,
 	.set_rate = clk_aic32x4_pll_set_rate,
 	.set_parent = clk_aic32x4_pll_set_parent,
 	.get_parent = clk_aic32x4_pll_get_parent,

-- 
2.39.2

