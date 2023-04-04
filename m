Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B04D6D6148
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445410E2C3;
	Tue,  4 Apr 2023 12:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06DF10E2C1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:45:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id F35B7582196;
 Tue,  4 Apr 2023 08:45:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680612310; x=1680619510; bh=V8F7vdZqNHhl5nv8/Rp3qNs+CuQC/1S5n3N
 A9KKJTlA=; b=T33QA58TsY7L/qwKXqHoJY3rCCwL7EP6KK6tkE9cdvlHnPABYSe
 pXpRMRtjRPUv8t7IXqaHdyujZQGXfuY4pOB9WxT8my7eIABkZ6mg9uy8XEkmZxJO
 wv1mZAs+N8BKgoStAbRxhkRbXmKquQFq06QOel3Ch3+ftzwDyo8D5UjIU4CMcl9d
 J85KHRZUEB1y4OrVaocXDBFJAw3Ay5ijMEkxn8baUADKTXx/SX99hDGNKvh5hpM/
 iQWcXh3u2VlvRx0XuHoz9x2IyOrPhpadmlk3PAvPpOjakZ39kW1zcYgksOx1Z57s
 s/BixV2wnyyYmuI6vuuOn69U52unvOOeIzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680612310; x=1680619510; bh=V8F7vdZqNHhl5nv8/Rp3qNs+CuQC/1S5n3N
 A9KKJTlA=; b=FYf+6KwtjH9qVK5Z73qwmZAH4ypY7EuXWjPIo1pCVCY1KSx3QW6
 pxU++QozVrpFTDipdFOHXyyQnq0xuLQ2CG5jyu8NQu74e8We7PCzccdqxiuYWPOF
 fs8/b70817p2eDek5EsSh6PQTQ0JIkfIIzg36hScwK4TrPiXgiQq31V3rIvHuxbg
 9o0CiJuPHs/mcZcb1LDVw8y33LpjQFuB1aJ4rHWLMR5iuasI7KjzXKAQCU7VJ0dy
 aTkSx4EqyP8KfJtszgOUj0msGKw7Qt+hX1mV7TnA9AMwvYLJdN/2az24Hpl/lnXy
 BiszlfmGgwk2ZhNM77GZEBjS2/GYkobfCBg==
X-ME-Sender: <xms:1hssZD6lSkl7dmRGL3660ig5YHUeKgIB5QxiL-TpExNmGcTw7vpgAA>
 <xme:1hssZI4rXKYpw-r82_vBXeltdrqdXz41gQsGnzJdAGPyVZurpbq8dzZYxZb2D46ie
 HRcsfr30KW5gyciXF0>
X-ME-Received: <xmr:1hssZKd3qOatgI2rXxenQwFUBKoH4G8t3jJybGZ1z-UAtBToTf87fZKnWKnBWOc4b-bt1_aLRVXtPd_zu-_lAAQrGV8NYs0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1hssZEJoEvYYybTNKsFzNTOAi0zRmU3V-teS7to-4ZMApYYY8_DugA>
 <xmx:1hssZHJ0neRbEay3gNCXL7FItwFApLfPxxDQ4sGG7sQoqkroLpOZ8Q>
 <xmx:1hssZNycp4PSc3YTmgpSNTvEa8xZNuHAxBpcKWJVBnunSb3DtJPARw>
 <xmx:1hssZOUJ870oxzEkQQLJJphcGfEIY95fq8iNpWwFWcD3ui5F7vvkng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:45:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:23 +0200
Subject: [PATCH v3 33/65] clk: tegra: periph: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-33-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=CVkVploTBmGsGDh1pgQkRdhTnIRCmgkdPTUL6cHj8pk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e9izlhYt3DnT9rm3BnR1Xgnvq3K3/OOOCo88M9ZOHO
 6cJsHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIJxsjw8+dV8/9SFrb+OHbE+Wa2l
 evFv3XC3k/N3bRJLV/vc1eRqIM/+tqpl/U3NSULVmx9/if9efKDrzzZdBm89t9XvnEW1OdJF4A
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

The Tegra periph nodiv clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 79ca3aa072b7..367396c62259 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -140,6 +140,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 };
 
 static const struct clk_ops tegra_clk_periph_nodiv_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.is_enabled = clk_periph_is_enabled,
@@ -170,7 +171,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 	bool div = !(periph->gate.flags & TEGRA_PERIPH_NO_DIV);
 
 	if (periph->gate.flags & TEGRA_PERIPH_NO_DIV) {
-		flags |= CLK_SET_RATE_PARENT;
+		flags |= CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 		init.ops = &tegra_clk_periph_nodiv_ops;
 	} else if (periph->gate.flags & TEGRA_PERIPH_NO_GATE)
 		init.ops = &tegra_clk_periph_no_gate_ops;

-- 
2.39.2

