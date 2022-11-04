Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52E619790
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C3510E75B;
	Fri,  4 Nov 2022 13:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBBD10E763
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 090795804F5;
 Fri,  4 Nov 2022 09:18:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567909; x=
 1667575109; bh=luagwsSex2THKzX/CP22BYGQdlBn413TABDvuAp6fwQ=; b=K
 EsFXPNGj99Bf0Ygoq6pEKFBZqzxTFQ58Xowuql0miB+VgiLCs6WlsfrQmJ+n1vnC
 EsM7+KwJgItMNf/R4jBypbhDaH+lE0JEjLRGfNlBEmIBFQLLk4e5+YJrQFgozEtL
 6iKrn4RK4MzrVX0Y7eZtCO9T/MDr148y5hdFOtxwCFB0H/6ld6JRzq/72ul9cyja
 XRv8dlnAZoVWTgoseMeLQibVivVmeg8GkgPN2RrAgq2216t9cQ9hwPoGM3iOpzU3
 533auOaN4AMUFriqLe0UASdaIujgVpKmFlEGqwl25N3HXRIDDdvlVhnmhMv42lrp
 lxYcYu1ZynHwb+njql4gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567909; x=
 1667575109; bh=luagwsSex2THKzX/CP22BYGQdlBn413TABDvuAp6fwQ=; b=c
 KjJHMiLbInvMzOadRkNJBSe7i4mYeLZErYacU1nqsZD+xK+FiRzmvYFiP6l8UXX0
 UUN0twglI+QtR3Q8jTo0/PCkKQwootlRB2oI6tQn85TrF+ox6n2VXcDR34RVz1Wf
 ti03a1IJS6ZJs7O3Kfo9iWsiynbrFcZyFLpfQLAVKv0iQ3izxTHzAirUDn01HWUv
 akeTzvRVBk2rFCIyL2jaXN6PomXEDfbCoWXWRSTurB3UbWPCL//vDZJvotoMolF1
 tXzSLRKRGHxboiG0UyVuh0EpoCCZzLMJCxco0PF/GNCQof0Zsr8uWIh24tZec8jx
 eH9RkYTyl75cHw+7bWsmA==
X-ME-Sender: <xms:JBFlY1RRdyUvcEbcKW-lL532FACk0MFdB3LhxtGj0o6P5PpSGRX36g>
 <xme:JBFlY-w0RUBbsfozZa-gi1c9kqZlP2QhF-P-Ib7jrsF5IWGnplBlkxIJSoeO_5eyO
 odYQz6bKYLz2JtWnvY>
X-ME-Received: <xmr:JBFlY63o8_PtmNjaeJS-DhABr8qqX42nbrHMxBLBurkmxaTBPOAbi9ZiCiAlTM0rm2z7-bEqOELhk0G1u20JY_XfZ6Dl0vTUXIwCnmx6g3QQkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JBFlY9DrRMzYcIdTYyycJjcFYVl166k4uZy35tSzK18LpmEcakSC3g>
 <xmx:JBFlY-gLOeUM2tTM6PSFy0b3DDGJGJkHShwS97aXlLOhVP5nnWGxJg>
 <xmx:JBFlYxoew4Q_GKxVG2HUeZKmL7FPmDPqoQ773TDxTVMaXYNxf6YwQQ>
 <xmx:JRFlY1To7ld1VFK6o4dvaK-CpR_XrolSAQCkVShFkElbhi3z3om76Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:36 +0100
Subject: [PATCH v2 19/65] clk: vc5: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-19-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JEUZtb9tXOof5sAOCA5zwNzO7GBHkJSDJOl0Zd1+YdE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp+TbuhP93XRl9+0dOEe7Rm33CbPlOu4JRPSc7rkw4L1
 Biy1HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIrDSGf6azgqLsvy1gX1v01eEkYz
 /HFrsYFZmVN68fPGbAJqjavIyR4db843pKvvmpMbZBE1itOVL2ezbJBJ0UOb1Z5qDq6z+yLAA=
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

The Versaclock5 "clkout" clock implements a mux with a set_parent hook,
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
 drivers/clk/clk-versaclock5.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index e858066c2c3f..661ab1ca3d83 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -728,6 +728,7 @@ static int vc5_clk_out_set_parent(struct clk_hw *hw, u8 index)
 static const struct clk_ops vc5_clk_out_ops = {
 	.prepare	= vc5_clk_out_prepare,
 	.unprepare	= vc5_clk_out_unprepare,
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= vc5_clk_out_set_parent,
 	.get_parent	= vc5_clk_out_get_parent,
 };
@@ -1115,7 +1116,7 @@ static int vc5_probe(struct i2c_client *client)
 	init.name = kasprintf(GFP_KERNEL, "%pOFn.out0_sel_i2cb",
 			      client->dev.of_node);
 	init.ops = &vc5_clk_out_ops;
-	init.flags = CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	parent_names[0] = clk_hw_get_name(&vc5->clk_mux);
 	init.num_parents = 1;
@@ -1141,7 +1142,7 @@ static int vc5_probe(struct i2c_client *client)
 		init.name = kasprintf(GFP_KERNEL, "%pOFn.out%d",
 				      client->dev.of_node, idx + 1);
 		init.ops = &vc5_clk_out_ops;
-		init.flags = CLK_SET_RATE_PARENT;
+		init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 		init.parent_names = parent_names;
 		init.num_parents = 2;
 		vc5->clk_out[n].num = idx;

-- 
b4 0.11.0-dev-99e3a
