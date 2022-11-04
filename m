Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454061980A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D3910E7AC;
	Fri,  4 Nov 2022 13:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF35310E79E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2AC4458051F;
 Fri,  4 Nov 2022 09:33:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568797; x=
 1667575997; bh=fg3LbFdK7oLGU8pw7P/uSBq6ZwZOI0plHppEE1bDmBA=; b=A
 qJ1DnE6s8H0RfNn0cMAfNSXP+8hRWRgiEiqxW48NVYReq5PQW6EsSmQSH0MMXAHx
 Qt+vbpnztBC+FyFDx80peqkwBjjFe7WwaPmod83ha7JkIVcqdO/Oj1ysromqKl4J
 xPRhPe6s4tsEUja1b0o1AquAIQ++MBsA0ALZebCV1YnPkHbTXShWBHZrYxSeuO1f
 H60dQRVBzPGqNor//n1V3qvAHOFLhLcnEkFMzNOoPaeWNNYzcfTim+7tmvTMVGDW
 nLCKHyBZkQGDCGWTetSdCaakqwoa1+YCxsDoIwkgWephABVcoEMR3MKxklCCUZBn
 b5TsJVun68u2KJD9rHcQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568797; x=
 1667575997; bh=fg3LbFdK7oLGU8pw7P/uSBq6ZwZOI0plHppEE1bDmBA=; b=k
 +nKPRSTeXucW0Gnio9dQ6tkf7RiM62cQ+GAXafT/Xqq3PycqfRsTG75dYM7Q5TYD
 SGx98jI8ELxX76btqIY3zR2Gz2tz3FoK1ISCBq5GPtzxJ5Zp+t+ptmxp3DxuxUzq
 eDwJ6xubHKYOxFeD1Q5hs1pzW6kjpNq7j3cXUkSvhDdbg2adQSYki5DCdf23oUSh
 BmjJkMYkyd/omQ9B6J9mAcqoxYMoJD7gE5x3dfR15KIvMzx4I4zDLPxIl1htULBt
 e9GmzBOfhrbuwGFj9TmOK0lWu5PkTdBwfOXW1gqESdwEqBkPUfhgkz7Jqkoe8mQd
 PEKK9ev7LgmhgJ2m65nzQ==
X-ME-Sender: <xms:nBRlYzGy_WYAHhD0F_KJzgS4Q51pb6R89XjvruyRyzNwUtlQNimGRw>
 <xme:nBRlYwUBP9Npv9r2-bcjtwqapDIksbBBfSJEA1r0muLysBklanNxIgOJLisuwmaUY
 rvhCgBo38TZ8gZgg8Y>
X-ME-Received: <xmr:nBRlY1JFuspd-sjK29vU9sIQ1WrtNuHkb336S4V796wzb3F238iYhhmqjU3Jr9Z4cG4McIrbXFnVIKM4nsWKtU9-o4QlUoR-MEn6b432mWz2rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nRRlYxGcEvQt0EjZAjy0-c1mJF_rFHVetz4kWAWqFd5G3zpBBtGrqg>
 <xmx:nRRlY5V9E36J1PI-iEy797-vYm_VK8E5xAXIk35hm9QTiddxSwTVfg>
 <xmx:nRRlY8PyYq37xOQsmzKXPN5Y1knbrT7iUl6vxPRtrlV-F4mX6-2Ebg>
 <xmx:nRRlY6X0tRNhC9MB1z03_OIdtAOuVC6JtSPSz-2YI3Wz4iqKxqYpUg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:00 +0100
Subject: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2905; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=41F/tkON2gmE4Z0te8zgw432YM1WhJCHxFnSDsKUDDo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/X2T6ZIhebfdb1m5jXhgkF8qXysyvtj8t9VZzvdO7Q
 zuWXOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR2fYM/0O6nlo38K4VfjH96rdpHd
 +NLatl4v3/n7azvBbv/ndDWTMjw97T6Ut4eSKtlGf+dHtz8eEUVQP15XVT7i9Zw33p+T3rU5wA
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

The tlv320aic32x4 clkin clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 2f78e6820c75..65b72373cb95 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -41,6 +41,7 @@ struct aic32x4_clkdesc {
 	const char * const *parent_names;
 	unsigned int num_parents;
 	const struct clk_ops *ops;
+	unsigned long flags;
 	unsigned int reg;
 };
 
@@ -292,6 +293,7 @@ static u8 clk_aic32x4_codec_clkin_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops aic32x4_codec_clkin_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_aic32x4_codec_clkin_set_parent,
 	.get_parent = clk_aic32x4_codec_clkin_get_parent,
 };
@@ -401,6 +403,7 @@ static struct aic32x4_clkdesc aic32x4_clkdesc_array[] = {
 			(const char *[]) { "mclk", "bclk", "gpio", "pll" },
 		.num_parents = 4,
 		.ops = &aic32x4_codec_clkin_ops,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 		.reg = 0,
 	},
 	{
@@ -452,7 +455,7 @@ static struct clk *aic32x4_register_clk(struct device *dev,
 	init.name = desc->name;
 	init.parent_names = desc->parent_names;
 	init.num_parents = desc->num_parents;
-	init.flags = 0;
+	init.flags = desc->flags;
 
 	priv = devm_kzalloc(dev, sizeof(struct clk_aic32x4), GFP_KERNEL);
 	if (priv == NULL)

-- 
b4 0.11.0-dev-99e3a
