Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C628461978F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC38910E77C;
	Fri,  4 Nov 2022 13:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A3010E75B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0DCE258050C;
 Fri,  4 Nov 2022 09:18:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567911; x=
 1667575111; bh=fD5QkUGTVXjqsPP/sK/neTD9XbByTp5xchKTtVPLBts=; b=s
 C6kD/hbUSh1Ha/l2HFiNzWscphfRg7OoztB6W57Jod+o6eFTHn2AIwUp5zWvjCyi
 IDE9YiogefGA7DMn69kujuGcAyAGXLk9PmNIOmh2Byxkn2xT6/BkIa2P0agO+Wz0
 jcgtAaBRuCdCuNZRR1nLYdEV0ckkzIWTX3ald30OfUjSDOzQ3pPGgeAdoOJFW9oK
 v6p965Cb0A2//fb5FVQJXEsqNdYkyBHRPcVkXhjgx/z45ZLexgQ5/w4DUDEY4jk/
 dJy6eGxxO0dHcp5gP0HdAGCoUYqWPrNz7nYVuSaoRlpSPru/S2mWztyX9G/PAqHO
 SH74dXFTzQFdM626XUwUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567911; x=
 1667575111; bh=fD5QkUGTVXjqsPP/sK/neTD9XbByTp5xchKTtVPLBts=; b=g
 vrxgbNPvtfCBcIsbxJzut77zSpOraJdxEAdprjmwGPebtseQelwtr+K4ke8gQ4ge
 8FPWxIx26ao9VLwyTyBXD1aHaNSRh4vaPVAirAJ2Vf8cZB/7ehJCtvuWwtvOv9H7
 AOjCAHR/cvcZaUS6e/NObKc1mHvloR1SrDILXCG0DbyuAi5Ip2JMKl/24DMt++Rr
 QXtNzORFflJN33dr/fsLA5ttlqEVN+aqvGBx30uUhl/+NAXv6M/T3aYutc+HuuR/
 tOtPanS2DoYMO/Otj8NMe08TVTNVgN3B47WwsmGVJoacyVFqqjKlU7X10VLclH7O
 s4o/NHbfUDk+OZ6RYpvBw==
X-ME-Sender: <xms:JhFlY2Lc7_LRa5qJBw1Qi6kaSo7UO9AVnVQ3clOGpDdyfcSnp5ctfQ>
 <xme:JhFlY-L9bl6TszUS58lAeKYN5miw35sLUP5177yT0NUU37r96sCRN8rlY9HCkPrOY
 njJtTYjhr6M4mfUHaE>
X-ME-Received: <xmr:JhFlY2t9E-1blMwfEsKCQm1XXZjIFL2I5nFTgFNPBxRTSn3alYKY4sGbbWIAnr7r-HP7T4uXc6i7H7K1k2bRmfBFCNIz6INPLVzfEd2NEn5otw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JhFlY7b0gSGoDHazb7neLSMLbjKiSHCuNut7i_sV7aJPABXqRDoX1w>
 <xmx:JhFlY9Z5PK7MVEh5HpJv2ypfDakM8w_Yxe-tkC9FYRZh2pr4bpJ_QA>
 <xmx:JhFlY3DAZOvSF4Y_36sIndMUCGF3VLODjLl9wlcyJomkku2mYc2qiA>
 <xmx:JxFlY5qPOzaWFh875bd2ZTviLskq5njUpdAm4Q74jphC_HpI3tdizA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:37 +0100
Subject: [PATCH v2 20/65] clk: wm831x: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-20-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=4BlYqq5UPfFYo3niNZoafiUX8HiY7gooJ3ho6JQRT2Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp9/cZbYiNgFSp1Uslx4bUtC1n6H9On2a8PqVoa2VFyR
 +XOwo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABM518DI0FjC4Lh+0eWkr7tsFh/pjX
 A1yvy6fNLR61GGswsra5arLmNkeMsXfG5/8JoXPs17T4ZP5Kw6PuuJv71QRv1P36j0xpXibAA=
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

The WM381x "clkout" clock implements a mux with a set_parent hook,
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
 drivers/clk/clk-wm831x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index ae6dd38ec053..be3a9c1f3610 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -329,6 +329,7 @@ static const struct clk_ops wm831x_clkout_ops = {
 	.is_prepared = wm831x_clkout_is_prepared,
 	.prepare = wm831x_clkout_prepare,
 	.unprepare = wm831x_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = wm831x_clkout_get_parent,
 	.set_parent = wm831x_clkout_set_parent,
 };
@@ -338,7 +339,7 @@ static const struct clk_init_data wm831x_clkout_init = {
 	.ops = &wm831x_clkout_ops,
 	.parent_names = wm831x_clkout_parents,
 	.num_parents = ARRAY_SIZE(wm831x_clkout_parents),
-	.flags = CLK_SET_RATE_PARENT,
+	.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 };
 
 static int wm831x_clk_probe(struct platform_device *pdev)

-- 
b4 0.11.0-dev-99e3a
