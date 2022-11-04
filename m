Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F36197E9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4B210E0ED;
	Fri,  4 Nov 2022 13:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8334610E0ED
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:32:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A42735800E8;
 Fri,  4 Nov 2022 09:32:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568765; x=
 1667575965; bh=OP12R/HSwnTWUiyniRxMemi0pLCGiBDAP9oM26nYGNs=; b=b
 gAoZ0r0P8dMEne5SzNzLIJAe3UgRjLWN9bCUPBHvCCH4eCQnR+QyrHBmvrbbTLE1
 +7fy8nnZ7nZePtSZgN+yAdudz0peNsQ7IvXEMzywxSGKMXCDY01yRLg1S1sLMqan
 CdmOfRJnmnbz3lB8jX81cmwZMSukLNJpcdaYN4ub4roKS3mcXdM3yhK5MbkPDl9O
 6KuLcNyGnI3U9Q2dyrQN0qKfcFG4rqV2GNa7g4gCRBu7n7OSteja1wDrUR5Bx2N4
 AHWbAgHJ8t4YdpC3Ti39gE7KCzssfZnyc047bBssNcd0aQAoQ4BmGMJZ/R87RUsp
 2bSijGIJnkZocDBohoOcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568765; x=
 1667575965; bh=OP12R/HSwnTWUiyniRxMemi0pLCGiBDAP9oM26nYGNs=; b=r
 SkeD2o6ZAAo+4q0OjI4d65U5pnJx1CYHxmUBzzZTJ2VQPck7LDDg5vZ59AKlZn6G
 s/1uPKi6JibjWI+JLAEzr+0vypI0rTLlOyvBpEX3L3/4TWgrpCTy9f7hY4T8fgoh
 mdnLqfjodVnyy1VF/bQYN6mP4BnC4MXeK5Q6lDjASmNh44TrIZJqqkKmBQRRLyTo
 h7di6xl4TiBPFU6a7ZCev+sVPuNeE3n1XfYdG+O6bpzRYNjhmBqQVNzKP45mcc4G
 +NLZOyKVwjN9c9IFwOObE539NDfDI3Mx3n9UdGttpghBCbOLOoBQZtYANtVzPoO6
 5RKhVWFHnfrO3Rt2tQSpA==
X-ME-Sender: <xms:exRlY_XCvztwJsBzW95sc03lce1X_mQcngj0HhHIQYrwFN1i8Vysyw>
 <xme:exRlY3k8oDEQPINbMIIjz3qbhIRNATnBIrYEiXPD0dvb7XKIUnPlJ7J3IQmskGhx6
 ePTsIcyrALXKemL_Dk>
X-ME-Received: <xmr:exRlY7bNerzppRlNWr0H55T4PZCg6lX37NTS4tGmz-amkmtcOOal6hkk7LTL8VYKy50K46VvNHKQWX7b7317R295Jm1yQFkg-PW8Qvw1y38qkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:exRlY6WGxlE0rHO6ELE2DTgZdv2xruZnsSnFmQ7xjW0fBEJkGH_-oQ>
 <xmx:exRlY5lW36A8UpOP4pUZgR-90LQUumgnvehST1o5p2HHMlpbSIIvlA>
 <xmx:exRlY3fx1yobTFhs7IfuLvoEvgzMKFmejPd9gOOYWv25eVjoR_uDlw>
 <xmx:fRRlY3lo68OErBuUdEoaIdlJt3hK4Hul0iRDFSiECM3WHaxrxThJ8g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:32:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:48 +0100
Subject: [PATCH v2 31/65] clk: tegra: bpmp: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-31-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2636; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TtnVJku8LpgyWhA8mU3ohncryBqbkle8GPJNf4SxgVU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl9eTHlylc3QsPZpwdbVvj17exleFBruNQk1PGPRt5Xr
 UJVQRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYir8fw311P4dbJgnmqy2/ufpXSdO
 2U0JN5zd4Fs5veOvxVV3zD5cvIsK6mVMTlyI1Ji/juLzhWfzT23c79x3g2RB9LuRXzycIukQUA
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

The Tegra BPMP mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-bpmp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index d82a71f10c2c..6aea1cefbb80 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -286,6 +286,7 @@ static const struct clk_ops tegra_bpmp_clk_mux_ops = {
 	.unprepare = tegra_bpmp_clk_unprepare,
 	.is_prepared = tegra_bpmp_clk_is_prepared,
 	.recalc_rate = tegra_bpmp_clk_recalc_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = tegra_bpmp_clk_set_parent,
 	.get_parent = tegra_bpmp_clk_get_parent,
 };
@@ -512,10 +513,12 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	clk->hw.init = &init;
 
 	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
-		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
+		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE) {
 			init.ops = &tegra_bpmp_clk_mux_rate_ops;
-		else
+		} else {
 			init.ops = &tegra_bpmp_clk_mux_ops;
+			init.flags |= CLK_SET_RATE_NO_REPARENT;
+		}
 	} else {
 		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
 			init.ops = &tegra_bpmp_clk_rate_ops;

-- 
b4 0.11.0-dev-99e3a
