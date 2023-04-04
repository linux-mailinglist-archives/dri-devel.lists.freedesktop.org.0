Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A208B6D6438
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D3F10E6A7;
	Tue,  4 Apr 2023 13:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4671510E6A2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:57:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 93B4B582182;
 Tue,  4 Apr 2023 09:57:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 09:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680616643; x=1680623843; bh=u5IaUxp37Eo22Z56jEIWVdhJKniriGtZUw7
 vNfPP1hQ=; b=e+xt/OOvKjKGuDtA0Ahj98cbkLitDqUU/UKcS7yZvjtyc7psjqk
 LLw1N3v1gT2lsI/jgZA00iUrVTwZQxGKzydhUwln9Tj+wVAEXYIgbj3+MsmLaCaE
 Cdo43DrAYaRpuSPg3B7Q7p+OsKoFrmKWU52+BSzHDJ1vA0+MtqsVego5xt5NE4Fb
 XmbZatqcMRhZuyd5Vm0CAuUt4jPlErlw+Mec+xBQ8k/0s2XKZJjz4y+43nkwzhAh
 vCvnI1CKC25cC7E2n7m/B0np80epZ7fwDkl4RIbHNtgoZe92XFv8vVJr4POIg/P0
 es8wZkSwpUBx2vbqr+t8TgShtC0OsLucfSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680616643; x=1680623843; bh=u5IaUxp37Eo22Z56jEIWVdhJKniriGtZUw7
 vNfPP1hQ=; b=NXOXR9qVx9GhB0bCSr2MeQseIneXnaIVjiGYQJEvq0EZ31TnNDj
 RptliQ+Rq4cWDdoPDc66MlDR2SDmZZZNuJCK7UVliZva62cXnBLaSluuuBoPDA69
 pNSOkZk95veaoI39rp0+uzJhRgkiCawy98yPzfTC+q4CBYvb0OfiRZf7mvKk423z
 VTAmddPC+8W8DD039rTb8mFeqaTPFl4qq5z3lTvvHaMcII8D0u6A6F967BqCHpRA
 AqY6g65szcumC5rvueD4FsAd83aexoCXosZV4WGQIgfRPrC2DW3reUqp9dtEchD1
 SR1X0sqOYKpt7s6rc2nTiqdHTGREkC7SOVw==
X-ME-Sender: <xms:wywsZNiCxmvgcKric11KJvKuEq1FehZqEcIxwniPsULXBadQlxvF2w>
 <xme:wywsZCDiKXQ-SwIPeBZdKU0x6Oe3k4wqeumQLw3sO5StItxIkxX0NPDS5XP8x78Rr
 KOCKwU-fc1G-sB162I>
X-ME-Received: <xmr:wywsZNFf3kNKAQom6E7PTWT_AclJRPGTzSMo5gMkrGzVQNAQWEkSOL4Oul0Nyq0ovjI3B-6TXoUd03airWEzvyGtHYhjJZc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wywsZCT-U4e-6PkOEQgY4RIEhmT1p7JS2YyOE-sY9IGIKSFnO6pszw>
 <xmx:wywsZKxRi9LUhyDXJmLOyS6WVxSfn71QPg6OgjWVUhsROrBPL-9x0A>
 <xmx:wywsZI7qKMRHIbetV5AV9nEa0pScwXAhYlU19ov_TQRMFoqsmt8EsA>
 <xmx:wywsZK--zs-8fCvMuaT7dX3Yp0547dKOF-7Od2LEpp5JmlfcUPbh2w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:46 +0200
Subject: [PATCH v3 56/65] clk: ingenic: cgu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-56-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=p50VsOqv1T6k93woaLiN8Bd5AJfocwfLhT9fhB9gDvw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37f7LQ1ZEGqj8Ozv94ZVPP9uWmyJX/grlLV048y9bA11
 ZetXd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiN44zMlz8f591su6Xe0mLwu49kf
 8nqznpSaNM1fGOHzGZPyPsVl5m+O+76l2DYc/ex/dTXp3UD9hYzthavZp1tWOT0zOjtOvTl3MAAA==
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

The Ingenic CGU clocks implements a mux with a set_parent hook, but
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
 drivers/clk/ingenic/cgu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 1f7ba30f5a1b..0c9c8344ad11 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -491,22 +491,23 @@ ingenic_clk_calc_div(struct clk_hw *hw,
 	return div;
 }
 
-static long
-ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		       unsigned long *parent_rate)
+static int ingenic_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	unsigned int div = 1;
 
 	if (clk_info->type & CGU_CLK_DIV)
-		div = ingenic_clk_calc_div(hw, clk_info, *parent_rate, req_rate);
+		div = ingenic_clk_calc_div(hw, clk_info, req->best_parent_rate,
+					   req->rate);
 	else if (clk_info->type & CGU_CLK_FIXDIV)
 		div = clk_info->fixdiv.div;
 	else if (clk_hw_can_set_rate_parent(hw))
-		*parent_rate = req_rate;
+		req->best_parent_rate = req->rate;
 
-	return DIV_ROUND_UP(*parent_rate, div);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);
+	return 0;
 }
 
 static inline int ingenic_clk_check_stable(struct ingenic_cgu *cgu,
@@ -626,7 +627,7 @@ static const struct clk_ops ingenic_clk_ops = {
 	.set_parent = ingenic_clk_set_parent,
 
 	.recalc_rate = ingenic_clk_recalc_rate,
-	.round_rate = ingenic_clk_round_rate,
+	.determine_rate = ingenic_clk_determine_rate,
 	.set_rate = ingenic_clk_set_rate,
 
 	.enable = ingenic_clk_enable,

-- 
2.39.2

