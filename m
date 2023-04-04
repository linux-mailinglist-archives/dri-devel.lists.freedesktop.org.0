Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0DC6D608D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BF210E26D;
	Tue,  4 Apr 2023 12:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0C10E26D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:34:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6AB8A582193;
 Tue,  4 Apr 2023 08:34:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680611657; x=1680618857; bh=FxWJb7aaMxASuFNEZuYggO1/dUbDCSwmTwi
 WaFgwu4A=; b=ktftRbo4FSUa1XXKmxaU3pFwjx96hTvQMSpUGuJP4BkPJT4p2aJ
 LVetXUZFZ1J4L39SZiBT/Otnlt7l4s5jIRo9rExUSD0edo6XUDZ3daYb3q5aMtkE
 bYPGqxbFRG5MsFD8tIfpjPW6WJpvzombaP5G50au1cQ44J0n5oi7VKJKmZfdF4kG
 ftSMyN9q/nN+5DnMYWnAIty3s/OZP4iDyT33euen0O9qYFn+mlKIKaakhTx3wlFT
 RQa/buKXC90BeRTSbR5J7xXo4W8pbrcB8MGo7C8+plYzyt/8rIfDUAHihUfOc1F/
 n1LAv76CfM4JQ0rBDfOPFXu+L/Mmt2pbHNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680611657; x=1680618857; bh=FxWJb7aaMxASuFNEZuYggO1/dUbDCSwmTwi
 WaFgwu4A=; b=Gp0c1HhljirwrTWNdhB3y6DLDi7V2OaoPmLWFzIweJNltSsmuoG
 VW2eXggZpaBIJ/BQ/4Q9XiBzl+JpQ+U9qlZ3SC9jlzjFUr22S8AvOd6YRaEnyn6P
 vuHSUne1+K4cV4E9yqz4yp1dqeELxryKp+pbCh91BzT7rnYAGiBP5GmCoIvXw6Sk
 3IKKItJG9wkbOZJBgHhllDQlPVmEO6hmdEEgLQZx8UXaLeVYRfHI1muV/mFGIRjU
 aJle2LuJHREcudXxuVYvqNbrGcDMjScxj6B0WrI/DAnT6ZrOR5Nzsfpi3OHyBfzR
 CBxTlvxDosfSSqOScctnFoRuUZtxam1ROeA==
X-ME-Sender: <xms:SRksZPz0IenLSbriybl0LboQ7Rhyt_NpbJobKWHi6wdufEJFpAkpFw>
 <xme:SRksZHTT1W1QRkBGHOqkY7fW8WqnQkF5GTpDzBewtnn4ZApdAL2Xc14IF842-VN86
 X_191kn-wvMp-DvS5U>
X-ME-Received: <xmr:SRksZJWYVV6mxVr0RDCPbnsHC2PxYalKrKlhqf3S0MLOezMpLvUXZKDQ1JLSapc-PHEstbv47wbr-CVkV6jcNjNHp05D9WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SRksZJhBxzUyE0Rv6vYKh_If4lRRlNv9D8xN0QnWNxZuUdF6RfB_DQ>
 <xmx:SRksZBBCKW8pIWWtqVrvmEvTob_yCJuaV8KdQvDzmyUI1aV3Kowh7w>
 <xmx:SRksZCIdkq0HBRgiW58JIpn8j17nr3h3pysZc-dV2Au3OH4VSiwskQ>
 <xmx:SRksZLOHg2qPr0VcH6NQ1orfP2cxJxOQ2SLJbGPCFo_ocTepiBxgVg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:06 +0200
Subject: [PATCH v3 16/65] clk: si5341: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-16-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0nbwtFXFVAIvXS4VP5DzDcCRFuu7xFYhjrYwreJXRso=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37euWTJ18xuTJTtEzV3ELervPjxQZufkzVu2JnnqftuG
 yFTmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEyEcyYjw+uHCmb/+RUaLnz+cDGNWy
 N5FeO1mP780gdXPx1sd5wdLcHwT71ucdlDo2YrpwMzRRZcevqFr3J2dtxVpzUlmQw78oxreQE=
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

The SI5341 clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5341.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 0e528d7ba656..259861aa2e2f 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -551,6 +551,7 @@ static int si5341_clk_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops si5341_clk_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = si5341_clk_set_parent,
 	.get_parent = si5341_clk_get_parent,
 	.recalc_rate = si5341_clk_recalc_rate,
@@ -1682,7 +1683,7 @@ static int si5341_probe(struct i2c_client *client)
 	init.parent_names = data->input_clk_name;
 	init.num_parents = SI5341_NUM_INPUTS;
 	init.ops = &si5341_clk_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	data->hw.init = &init;
 
 	err = devm_clk_hw_register(&client->dev, &data->hw);

-- 
2.39.2

