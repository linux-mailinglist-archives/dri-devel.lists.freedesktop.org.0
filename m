Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5C6197ED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194C10E100;
	Fri,  4 Nov 2022 13:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E738110E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:32:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C4EA58025D;
 Fri,  4 Nov 2022 09:32:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568771; x=
 1667575971; bh=PgJT+O60Tl+oRyfYM0RNB96qJJd/6g/qeRlw0csOt/Y=; b=B
 SYd4lT7Dwqp6d//jYgIZ15ci2iAlGhIOk3Dcev6OQMfz58/D4PKVGfzqOt1IfNwp
 T0WtlfkqNUz1bd0iQrpUISWSok1PTGWQDd+XLls9ZEJjOGnyqPZ7lJ/ZEszDcWRR
 KVM+kb6Xo6j9VHtuBsD8SJR4Owf2sTRIrsGSmUype9yUof/7zGhyxdtKP1AC8agj
 nFlFZKpPN1OF32+7Y1yP6OqZAoO5iDAHQiwcraxEEfYXgSAmyUYH4d0DLhC4ohID
 Upm0eZig/ClN0MXMAJx88o9L9U7CTykeVuCTLqGSZBhHVswbljjemh6LmCBG49Qm
 Vc0WFKiq/0MvdhP/Y/B5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568771; x=
 1667575971; bh=PgJT+O60Tl+oRyfYM0RNB96qJJd/6g/qeRlw0csOt/Y=; b=C
 MAgrYXElIO8zBRaqNEbyQKCF0ZtCID/htl4bMWqYcpIThpa7KGryM9BzCisr0013
 ts9XN4+2W8q1YXqTY2vmHbLiZT2KfspGu+2U3n0JgS5BaBjTOmOGB9E0kaF0LaH2
 bUmTCGIv/tOODWUuQbKMCyc6qfWvqgjy3LYKY5yGnMYI0p7F1Lwp6tMgK/izMx1C
 ZLlscC4g3nns9evUsAioFXed2pf/RkxZBzDepN5Vc27v20Ax3Tdy2ptVELPBGgXb
 XQBx5mUMYsaARiOLysEIIDLXJvp4JXpoA3c8hV0494PBHqlbtqLjKWL2vFeB0Tjo
 3AyJJpSayrT/D9F78Eb2w==
X-ME-Sender: <xms:fxRlY2nbSlImv__n5hMkYBXF8MM-OA5sBQ6VqMgbL_tpVBijjJMafw>
 <xme:fxRlY93dweXG84pi8WJGBHkz28iB1lnRaREUOUFcNuQutYYmYMv45J6Jrhh68re8P
 86hZNqorqG1R3G6MSU>
X-ME-Received: <xmr:fxRlY0pd_CVRG2jdcy8_2eMONr4tgoLIrwu833O1zUNNd3CF0tM03_p7hHMYas3_nn3W-ifQq_3ooGBWtLadJPd_pXm9kt203N9KYVpSntX3Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fxRlY6mgX1m2dZW39WtlKcvxIUGyiXlCJIjAao-O5Jos9krAdupsTA>
 <xmx:fxRlY00CH96woMilgfevoOQmssuuoqsGXIrrtmLgasRVfYp5i5nKUg>
 <xmx:fxRlYxvFJ9U46yCS5ujsbyQmBlwJoPq22uWsglKOpblj33M6qaSFZg>
 <xmx:gxRlY72CJ7jbiN7pZb68jEtddTcZQYN_E52riZwNOWrXOaiwQ5EmBA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:32:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:49 +0100
Subject: [PATCH v2 32/65] clk: tegra: super: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-32-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Nh/LYk+ARxOMHgn002rtxIDsEB03sDrV7scjXxRbF3M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8Sp/vO4jqUnV7OwXhWfPt7/gOBOlHyqb9Nzqb8ESyR
 /hTZUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIn0dTIynP+Usu6qykJjZo63wSd51l
 x13rT5lFjckj13XhTI7srqVGH4H75MREFsieVHngQDPlueCzwJUpc9/GL++jA9flIbXpjHDwA=
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

The Tegra super mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index a98a420398fa..8ad62e04fd8b 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -136,6 +136,7 @@ static void clk_super_mux_restore_context(struct clk_hw *hw)
 }
 
 static const struct clk_ops tegra_clk_super_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.restore_context = clk_super_mux_restore_context,
@@ -212,7 +213,7 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 
 	init.name = name;
 	init.ops = &tegra_clk_super_mux_ops;
-	init.flags = flags;
+	init.flags = flags | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 

-- 
b4 0.11.0-dev-99e3a
