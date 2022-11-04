Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B867619799
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3DB10E78D;
	Fri,  4 Nov 2022 13:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E0C10E788
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E1D0E580558;
 Fri,  4 Nov 2022 09:18:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567921; x=
 1667575121; bh=ryNmbFJM4diOGk8okA5Tqnn27dGfir9PKyxk50XOcPc=; b=y
 ZOTQaSkMUBYQeuVZ/i7oVURymR8TVy1qgr7EHudwMPs9CxjDy9m08iDZTRUkxNCz
 9vMcquerZa6C0uV9+MeKoSupX+AqG9uc/rteuxg7LiGHfimpYr4SqpkhFYrSzhyX
 k75O5SnT1b19L33C7oHAdWp+smugMk83Iat4NZH/ObwTHzTEXis3NYyj6kKq5oJq
 LvJme0ZPRwcNI+B6aHhVWX26I87RCVF/2p+8Cq33aI/LZxKrHlK6JrOLLgGui8D3
 eEGO6wCi1BzFUQoW7io4hVzDdXhuD0I0eZ87xCfWgoob3YN7aDQLY4RwfXXpYlMj
 ynr8iUuiIHd8rhIfLIV/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567921; x=
 1667575121; bh=ryNmbFJM4diOGk8okA5Tqnn27dGfir9PKyxk50XOcPc=; b=k
 ocjtyoBv6Gxm60Vv2ETo2pxrQE6Aj8LnWrNWs5GoUeGj+0GREUMHKWCNWn0Yy0k3
 ap+YhXB1RJBQmpRbV3LMu8Ww8iMiRv20ZWzC6QqWa8W4DI97+g+RbqUAKwHV0wRd
 0V2EcOkNFtLvkFSTTjvoT7ZuNbaNc/GrXkJ5rzSA0yiq7YRX0RNVs84eI629ujUu
 Kr4nvY6rCnxA2xiP3GKX0w+XTpfwLCpbfOEVjlcbET2iez0M8JoWgS7h7ilA7EmM
 Q7+ZL7aAu8uhqU45D1CHMTrz1MxWDyi+yzE/IxWd1kRpLtgriLz+gQKJX2QYdpGQ
 N5Kf/qsx6/n6jxhtcIS8Q==
X-ME-Sender: <xms:MRFlY1LkIJS9vsieqZT0SfCGVYV-4OR_SY99Jv08-jat8M8-04J7VQ>
 <xme:MRFlYxL_sH6WdKX4rQNKcJfoLnYVxTOASGXXXMmiPRpzOPhDav0LVKLnG0FTUnCUM
 8DjTlQcFMCdFBk622w>
X-ME-Received: <xmr:MRFlY9sef67li-HvFcdWF2pPjSAzVUxJOKmEpKu-9AT0tkhQtFPQvpz4HXhGp7AuhwnjHOqaN3L0mHiZDOo-H2jk5AeDqfmWnWnTFsol14JuPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MRFlY2ZRoCKl1ZzT8ui9yFY_vrc8WYuS7M-8Ne8jlaK17ksGBqOpKw>
 <xmx:MRFlY8YQsIErPue2nRvW6LlpVu7MAI5E99fvbVF69DFhMbviJ1VfSg>
 <xmx:MRFlY6CkdxLB7aEOVSZDXgtS8FGCbks0SJOs6uNBCHbpycKTytMFEA>
 <xmx:MRFlY0o3nPYFZWBOERUEUHCBXLvtsF-QEvpws5613AeLcOzwstffBQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:42 +0100
Subject: [PATCH v2 25/65] clk: imx: scu: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-25-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=FUptvuI3F63mAIhxBYRO2PMltn/Yw3CvkS3mja0KFvM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/09/PK679nObU2X/T2a32roICJZXu8t7YaNbvOYtlR
 JbO0o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMJDmZk6H0T9btj78RNW+6x53x66M
 182f3B+fMGBU92zO6TDIrdsZXhf/BJ/XBTpYs/pfR+r/e4ru9ie9mvN3o/O4PAGbkT3R03mAE=
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

The iMX SCU mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/imx/clk-scu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 1e6870f3671f..66e49fea5f8a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -785,6 +785,7 @@ static int clk_gpr_mux_scu_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_gpr_mux_scu_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_gpr_mux_scu_get_parent,
 	.set_parent = clk_gpr_mux_scu_set_parent,
 };
@@ -836,7 +837,7 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
 	struct imx_scu_clk_node *clk_node;
 	struct clk_gpr_scu *clk;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (rsrc_id >= IMX_SC_R_LAST || gpr_id >= IMX_SC_C_LAST)
@@ -868,10 +869,11 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
 	if (flags & IMX_SCU_GPR_CLK_DIV)
 		init.ops = &clk_gpr_div_scu_ops;
 
-	if (flags & IMX_SCU_GPR_CLK_MUX)
+	if (flags & IMX_SCU_GPR_CLK_MUX) {
 		init.ops = &clk_gpr_mux_scu_ops;
+		init.flags |= CLK_SET_RATE_NO_REPARENT;
+	}
 
-	init.flags = 0;
 	init.name = name;
 	init.parent_names = parent_name;
 	init.num_parents = num_parents;

-- 
b4 0.11.0-dev-99e3a
