Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED16197FD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE2A10E79D;
	Fri,  4 Nov 2022 13:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D1910E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 120CE58026C;
 Fri,  4 Nov 2022 09:33:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568781; x=
 1667575981; bh=FXqlLXY3AQe0JhPBQDYJIXVUIjFJbhMJ2RtbAJhAFMk=; b=C
 HZIa4EET3aSql06mqcmzzkEGPykUUEEHs9hEwk4FakVtht6tTdl7Aw4XI8k7fCeu
 cWUzx7mUxTF8EOBYelPTU/hKRyvYK2pccIVXKBTOkbCuIgPcCxOVLJcK1l5zSL1W
 w9pc8f3oBeem4PFri8Mil8IvquI9T7yOhMyHOSu4vU1E1aYt3xlZ+jgWHd7wFCH1
 5Uzt3focgVnzc3ZYNsREKJx86cjcL/JHWZpk/U/XSeI6NLHb9GemJEDUW+2BFwZa
 Tmdx1V/U4C5KysC3oBzZO0OpNlx4BN4yOlgNo0BCTCt8mR4mBHPvA0Bv3VMei05b
 rQebRQMmMiStiogFdJZ+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568781; x=
 1667575981; bh=FXqlLXY3AQe0JhPBQDYJIXVUIjFJbhMJ2RtbAJhAFMk=; b=F
 H3oaqmQdM9q0TdfeO7VliMe4RhTADODhaJS6cBZ9dPwJRHNUqj/9R+74MGU5h8gP
 4+SbVziMAfzg5Xq0UG1mda5036YqTymwhJmyGr/GojaAaA9wXxz2mafU13eycOdM
 7KNURDIGoy/W7gAVPrtiWer0L3YywiwztsnDaDlopec4Cf63MdOGWGNeXAQeOtN2
 PdRLgt5cTyOCPo6cfXFvMTljeVjaGjWCOgLlMJI2RnpqYIreAq5wx+GdmsHDgMfw
 Sp7JHzERIdeJo22vpzWmVZ+c2qT+sbmjRzId/HBN92Zwn0O5u8YyeFbj1F/RgZLU
 xbTKT04ZG80c3pIfanEkA==
X-ME-Sender: <xms:jBRlY9K2j0T6lQxoYL-y0ruCQrY_N2A11HrQVGsmebOdfOG2xppJww>
 <xme:jBRlY5Kf_zwiNQ5DkdLQQ3IdOMzCV0mAD21YtiV4Q-OPHaHoX-gEMaoaaFOa8JxOo
 jXsOIo92yrLkhUIrlI>
X-ME-Received: <xmr:jBRlY1t1LFCTU8J9akgbVZQbtMtiIVx0Mes3SZAvZNMkNr1ueSexWaCb3XFnLsx0XkjtGSEgd1715vlu-LeLxTK1qXGXQSfkZJGrIcO3BGix5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jBRlY-YlJXOn4OVd5opjIKZMx-VT5SoxL35Pw5Ccyd6ShwnFwxEmYA>
 <xmx:jBRlY0aLKQdM6Wmj-_HWKrYCe-fhEJaXBwUa-BRms5otwq1sWc3K4Q>
 <xmx:jBRlYyDNP_lWtROOniFIePAxCn5wSMdlX11nxof3KThiiskwWHNOZQ>
 <xmx:jRRlY8pTetw61Xu9Bj2IG1KVoM7WVef-n0vjl6LqpON9ukPCBFfADA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:53 +0100
Subject: [PATCH v2 36/65] clk: versatile: sp810: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-36-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eAcY5g46V2wRTxnzJPXQmmI04+Lvot43DqmK7cibQQ8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/ci/SWFTm7lOuKnLsatD5GoTsygf8W/6HVT3YXrD90
 bV9ZRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACayvJaRYXLzYbtrp1J+FnmEfji3b8
 lSKzvdJzufPdz24IWm6ssolZ+MDDcyJRgmGO6dn2s2KSf7g/6cnMltRttswlhevN2x/appLg8A
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

The Versatile sp810 "timerclken" clock implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

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
 drivers/clk/versatile/clk-sp810.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index caf0cd2fb5b6..a45b1b7b7d49 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -63,6 +63,7 @@ static int clk_sp810_timerclken_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_sp810_timerclken_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_sp810_timerclken_get_parent,
 	.set_parent = clk_sp810_timerclken_set_parent,
 };
@@ -105,7 +106,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 
 	init.name = name;
 	init.ops = &clk_sp810_timerclken_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = num;
 

-- 
b4 0.11.0-dev-99e3a
