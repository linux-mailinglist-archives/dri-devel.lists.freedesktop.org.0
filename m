Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD119619775
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA46C10E753;
	Fri,  4 Nov 2022 13:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EC710E74A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3AC35804A7;
 Fri,  4 Nov 2022 09:18:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567880; x=
 1667575080; bh=Khf7mx3VrFaYsjTSuZhwXgkGSrwmuaHnXNS9meURKw8=; b=Y
 HkHSc1p2aLPXfTG6LmeIqok4B49pM7AILQsdRN8j9tlv5wRVbrqNwYNIcUuiRoNt
 8B69Co6a3EOhkwzhitZD0LU/ankShNbsKNsZIn6ZY9pjPOk+ZO3HA5PBug7PjNY9
 iXON89R2995YFxbwAKHnWYbWo3WbI3uJcYfJr/4FSbam3kUOdzLVlEPWZF/WQcCR
 828gnmlw8RLe3NvowY42Qv0lrHM75i1zyIl/mF6enfFjriPf7Y4gFsdin6mkfn24
 B7q/+63nkF7c+kWsDe/fPe664f/K4oFucm4o8MsQl7GeJ0JauL1or4fvASTEP4G/
 JswsqJo+xpiIRDm18yHiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567880; x=
 1667575080; bh=Khf7mx3VrFaYsjTSuZhwXgkGSrwmuaHnXNS9meURKw8=; b=R
 pHVIwOu/tgwO3+gxphdNT3OC6Dsa4VidwFO0CiBKA6ee+B1MRpf9pQ9/zyBmxI59
 iSRXvbd+6TCMoDmPF7cToqlUFJfIPiZUC1sFNndXD32jBU5PhC4P1Kdw3fH1Xx2f
 tYpom22TUfKklcQVENP0UClSJTbgT0NTUy9wW5INI3+fh9dhZB2nVFLebC6IwWR7
 b7em+zKc5OuBYxvLg9VQ64LNsW4fHUoNPBalvFgoewPu+W2KRkmroaxhzOnTHujs
 2gH+m//17U2OoO9ZrHMDzvggqcxNNuWZgR9moBHd7r36vlGwEHImCxtsk9sf3ApL
 JcvyZ++57IpbSvDTH+Sxw==
X-ME-Sender: <xms:CBFlY6dierAZPcmU1rYQG8eTSSnYNLP4I-uEfm04LV25G2Xuh8F0yQ>
 <xme:CBFlY0MnqCTdQDmPoXVLOR1qdtYNMVDkBF6LCD9Z700Q2LSkRGfeKD_JzW6Q-judk
 5P5IbIIHYL5n_IvRpI>
X-ME-Received: <xmr:CBFlY7hBA_LKLnRqAqUGGCVLBF1ORJ-wO9YuCRR6pAw5QTFcClizbHGK9hZ11bWLCvAFdta75daiA4Lz2sFwL6z3894yWbp1H5Co-iI0cujl0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CBFlY3-38WLR7mL6jvKfM7b1-jhQEfT5Ep5V0qaqfaQYVvt_QMZk_w>
 <xmx:CBFlY2v_HtO9METKJPfm4KTAQ3gZsw-TqDVAXs9WMRalquvEh-0mbg>
 <xmx:CBFlY-F-N38tM9JuSoEEHgQIxsRyTkAZloJXskDi7roihBnxFdP1uA>
 <xmx:CBFlY_OWZDQ0d5jn0YWyn_Qg6M0KKptHvoSCa1ga79k98zdp2G88Uw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:23 +0100
Subject: [PATCH v2 06/65] clk: at91: main: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-6-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7EZ9zueUqfHZhXa1z3kMjzKNmVy6wrATuX9Z7Uo/274=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8cAmzfqz9Itj1VbV0l9eDlzieHvskkvq9Okfocx7np
 sMqFjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkdTnDP8PvDnzcL1iqjyp6LVje+3
 pNddXpP1LGDP/OxR0oOmrPaczIsFX0bOnagAsZ1u5H2Do9sk3dCj/5Bp0tvSz5RffIa4Fl/AA=
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

The SAM9x5 main clock implements a mux with a set_parent hook, but
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
 drivers/clk/at91/clk-main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 8601b27c1ae0..e04e72394632 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -533,6 +533,7 @@ static const struct clk_ops sam9x5_main_ops = {
 	.prepare = clk_sam9x5_main_prepare,
 	.is_prepared = clk_sam9x5_main_is_prepared,
 	.recalc_rate = clk_sam9x5_main_recalc_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_sam9x5_main_set_parent,
 	.get_parent = clk_sam9x5_main_get_parent,
 	.save_context = clk_sam9x5_main_save_context,
@@ -565,7 +566,7 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
 	init.ops = &sam9x5_main_ops;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
-	init.flags = CLK_SET_PARENT_GATE;
+	init.flags = CLK_SET_PARENT_GATE | CLK_SET_RATE_NO_REPARENT;
 
 	clkmain->hw.init = &init;
 	clkmain->regmap = regmap;

-- 
b4 0.11.0-dev-99e3a
