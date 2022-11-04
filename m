Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBE76197F1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10B10E11F;
	Fri,  4 Nov 2022 13:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32D10E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:32:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9FFAB58026B;
 Fri,  4 Nov 2022 09:32:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568776; x=
 1667575976; bh=JahQgmjhiDg/dtEsjzZBdwNyHKdprmfv0l41QTxopUI=; b=f
 CffqvzExcaqkaPOwU1INp5n0Hnp3Sdly+hKW/geeljXPLf6Y85vhg5GmdGVOjgo4
 zHKhr0mcGEbcISnaL8yfXyuJTQjf/HXnJEqTppFah/gzLo4m+8TteYAfbxn5FuZv
 v4a99+i9g1pz0RCbWfsbabCTn/9dc2VChVlYCfSlPugjcwDAOOE0Qc5uKAyw7Hcw
 9R4hm6ylAM6IBsGbkokkG2ve2my9yKiPBcKD/37OwB6QZOXk6R6Pnq0U5Qn9cY2t
 AXdITmtpHAUhmPNm+LNdSEv93MzJ6Xy/gnbSV7oW99kblmwo2LaSsa04yZsMvz4j
 tQby7qez/LxIzBj9ARRnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568776; x=
 1667575976; bh=JahQgmjhiDg/dtEsjzZBdwNyHKdprmfv0l41QTxopUI=; b=P
 iu42wvKkMiPL14eg0JaYgR9GyCm0prjRlMVmt5D0LT5sHR9iTHVVa1VPUoALgPbI
 z2ZdObMyhbSqy9wBoJCbkhj0SoO2/tGXO1PEnKObUn+fJBRaTRIzQZWHGtW3c/Cv
 rPwtJG8jA7uvFkx2+6AFUUIkRRoha0/VZ0Si0/mezKWKcE9u+PhE6kW0TUJX/cyG
 s+lMcon99ffZQUJO/1P2yff2wrdRTZdwC67GOtyPLD26jlG538iPSidJMsq4oaNJ
 ONlIIOu706fopChL4ke4WoZSpfdcaJn7XvMhlH/kRdV6cmp5bhpm0+VZzODQbp+5
 TQp5sicepd/k9iF7Z2+cQ==
X-ME-Sender: <xms:iBRlY8LgK5kMGJktQ2B4VPIEHSozxefZrpgFEBsE93hFJULlXIRRUQ>
 <xme:iBRlY8Iaa1oDkrI-WyxZhMIZp3p7_XpNCJqipHDa5Uc6TuSbefaqLC9tmHgvba0Sa
 9ejBoTBKsWcSch5kDE>
X-ME-Received: <xmr:iBRlY8sI3Zf1YroVGgicEgBIIauwsNHtKpxNPi8TDvepoXjYlwjAptXG3Isn5N6zndson4sQx8JYUOrTClvdoSUzGMA5X4TQlWeNURo8WbxOZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iBRlY5aMCqnrPi0GCV5YbXTfA6zW35OG6-3HcZSfjNWJOaZNDiKRRQ>
 <xmx:iBRlYzZkWF5RsT2Ppw3M-3oqZVSc9gtngEKNjAfG7KESuVXvhC2nNg>
 <xmx:iBRlY1DLWUwZ_UDPUWDB9jdzq5nVNUF96l7OvV0dGL1u0vvPlRxREQ>
 <xmx:iBRlY3qlgtmYYAtcJ9gAgbneFHfuFIrzlEiglW9ddgmizr7lPxDDKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:32:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:51 +0100
Subject: [PATCH v2 34/65] clk: ux500: prcmu: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-34-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2581; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=uxb5qeg43H3RnTF2Tkp9QnzMwccoi3/lBLvTmEuDxLQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8UvmusUUp3X/9SdW/j6pm/p1irupXITGu/85evfBJT
 /a+lHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIARNGhvWCWe3ir74anCy8d6iV43
 xw1Lb2q/yKHo0LnDVEC3v45zH8s29+8uepzZWXLEwXhdZkcNtf+5dYvP9gYdP7sieCh7W42AE=
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

The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
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
 drivers/clk/ux500/clk-prcmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 4deb37f19a7c..7118991f3731 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -344,6 +344,7 @@ static const struct clk_ops clk_prcmu_clkout_ops = {
 	.prepare = clk_prcmu_clkout_prepare,
 	.unprepare = clk_prcmu_clkout_unprepare,
 	.recalc_rate = clk_prcmu_clkout_recalc_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_prcmu_clkout_get_parent,
 	.set_parent = clk_prcmu_clkout_set_parent,
 };
@@ -383,7 +384,7 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
 
 	clk_prcmu_clkout_init.name = name;
 	clk_prcmu_clkout_init.ops = &clk_prcmu_clkout_ops;
-	clk_prcmu_clkout_init.flags = CLK_GET_RATE_NOCACHE;
+	clk_prcmu_clkout_init.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_NO_REPARENT;
 	clk_prcmu_clkout_init.parent_names = parent_names;
 	clk_prcmu_clkout_init.num_parents = num_parents;
 	clk->hw.init = &clk_prcmu_clkout_init;

-- 
b4 0.11.0-dev-99e3a
