Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFEF619814
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6669310E7B1;
	Fri,  4 Nov 2022 13:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED15310E79E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5913A580534;
 Fri,  4 Nov 2022 09:33:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568803; x=
 1667576003; bh=MQ0Ld/P4Fy4XpBFmWEgr3+5rbjeMq0KitSHa5XxIhpc=; b=Z
 KRF+MknNb830w12aSXmHDDa3Nolp7oCfQuaQzH+ApgFX4DeQ5sbxWjRZOukHIIJk
 wZ018WzJifVhMTqlg6pc+NmplKOviBbIpGOmKtxcJxIJkT+8r8oILdTmALrwLDyj
 Wc5zbECyiu8nzTye2xQ19BFZZvIPmME8iVrj0DXvDRJ+bLZKu8dEzmDlgF5cIowC
 UCpue0lnx8K/n9l9SrvjY5veHnXJfzccPZDQmpvzE7K1wFOyWLOkTpJFVUOGBDPO
 1pAvc9mlE0Q7DkhPbucW2TMMyo1Cbo4lR7LRUR0Jex6qarxlNTnUvlyr0FbEudMr
 sVvWE2W5MlsMgvYTWN5+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568803; x=
 1667576003; bh=MQ0Ld/P4Fy4XpBFmWEgr3+5rbjeMq0KitSHa5XxIhpc=; b=i
 WCFpBx8gbLxyphG0n1UE/RPKJVHlYo/aLO4cqMwWEnNBYFGVjX687uwWEFXZyd/R
 WbIEIIlaJsPDggwoJZ/afBUYuUGGY5x5iXXyUSublk9uIZL/kSGBcUc9vGjem2Pn
 hqjJBcE2ajjY+MVObLPii16lMZlMzy6CqSb3NL4ghitxzRNOhtHtcw5gcKMlQMOz
 AfHBJD2JORs3nTIMGvVnf5aYZc9waAekXVLQUBXimKkXgjp9XCu+s2EAveJxmLIu
 Mt3Yl1bfF099cNpOSzAZVqaN9msPP+XiDHPvZRscVOgzMDf0gSKVBRI6DPiYsSbF
 8RughNLGc407OKBwO4pXQ==
X-ME-Sender: <xms:oRRlYw-Novu7MpzueNtiDgRSoiExE6dJePCypBhzFLL8uPAmOlGCbA>
 <xme:oRRlY4ulu4IWnLbOhqXCJqqMYb7GmkLWdxWC0YyGCBBbeR992byN5_44pdSb0asaj
 nRXbjoYFEBhHYzf3uU>
X-ME-Received: <xmr:oRRlY2C2JF5I8GdCgnaEaEH9n8mNwGKEQ7iSVnogMbWT3gplYZE9r73RbcsUM9KkjhcmVIhKM1pI1u7nnYs4aFg_J1zfHSvF5AZWaX_aUcRmJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oRRlYwdT37aY6pDtT5ZHdVwLI4hLo85n04H0HYBlyr5-nR8lHyqfNQ>
 <xmx:oRRlY1NoZlq8AmuGZxIYGG82EQPzditFDu5w_LdxtnQLZHfYbDfkZw>
 <xmx:oRRlY6mZvyZdGw4vMt32o82tkHeHXFKnVbCTbX_Ya15Ec6_n8XuOTQ>
 <xmx:oxRlY_uq4hQ3T14h_KOssQRfPUmIgKVOI88gHnov9TavHerllENsjg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:02 +0100
Subject: [PATCH v2 45/65] clk: actions: composite: fact: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-45-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2809; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sj/foC147At0N/C0Kf5KGLnIttWxDPKpX8zy5b2f4zk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl+npn597pxcbLKJZd97YeFTHzaGs930q3GtTGq6caAo
 hkOno5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABO5eIPhr7DLyZQXTE+MM0/8P6LAYy
 G4kJN77Y/SZxUqRo4npPK0KhgZ9sltjQxjUXa3zhLL36B9JsF/c03d7ejvaxamzbb8xZbFBwA=
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

The Actions composite factor clocks implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/actions/owl-composite.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index d66b268563d0..3cac8f0a80dc 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -86,14 +86,20 @@ static int owl_comp_div_set_rate(struct clk_hw *hw, unsigned long rate,
 					rate, parent_rate);
 }
 
-static long owl_comp_fact_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *parent_rate)
+static int owl_comp_fact_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
+	long rate;
 
-	return owl_factor_helper_round_rate(&comp->common,
-					&comp->rate.factor_hw,
-					rate, parent_rate);
+	rate = owl_factor_helper_round_rate(&comp->common,
+					    &comp->rate.factor_hw,
+					    req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long owl_comp_fact_recalc_rate(struct clk_hw *hw,
@@ -175,7 +181,7 @@ const struct clk_ops owl_comp_fact_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* fact_ops */
-	.round_rate	= owl_comp_fact_round_rate,
+	.determine_rate	= owl_comp_fact_determine_rate,
 	.recalc_rate	= owl_comp_fact_recalc_rate,
 	.set_rate	= owl_comp_fact_set_rate,
 };

-- 
b4 0.11.0-dev-99e3a
