Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108161981F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3B10E7AE;
	Fri,  4 Nov 2022 13:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7704D10E79E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D4E975800E8;
 Fri,  4 Nov 2022 09:33:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568807; x=
 1667576007; bh=rVH2PD16J89pUbo+adGHsM7w2einVSfRdsLqyotZWAE=; b=g
 5TTazSlIlWKFbRnHRB/+/mY92G2q0kqgIqVq9M2pgF6I8aGf5bS3+lf1sdo3xLR2
 EWkm3LzGS3Lyx8ykwQR8xTNFHRckfOPxZdlfCTYP/7SzurGYe1HxdrqktKO8535J
 IrxjmwDAPUuV1+wUPh/aeNy2tdGoEk/7a0qQ9BW/WpTEs3ogf/+tcyH2fmCSl5ZE
 Aj68bfYUDXxiBvrXnF1pjG00T1UkKvfiCs9nmP6dnyHultVqCCTSaaNIKVyL8zX7
 U6etlqWywcFebp1yY97KsblEHi8yUEhQm6RapCR4dEgTW4/ByrV6beQmykBr/DTp
 iGvp2xm9BiryyoP+s8mtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568807; x=
 1667576007; bh=rVH2PD16J89pUbo+adGHsM7w2einVSfRdsLqyotZWAE=; b=M
 4aNb9dXiJrfl9FG92wI4U6hDmvMvuH2ETozSFBDbgT4d5c/nmF59MkwsSDFM5qJ/
 250WfCb8DvX0Y2Wcj9i7ud++6lA4+9UHHaNxttyD4llkUclO+OUzTHEJReAI3QHA
 XfVQUfVmOHdBQcfURJbPn4DrJHylpl98SSblKH1qzbFyFlyEVjRZDBWl33XjCdY2
 rImtXGsEIxfV035TQff85NoJxP0RyH8i9xuCHFkzdtN+dXEocXIBQe8TMUGEgSUL
 Mg66DSilTLHOQL+ntJ7752QCXrfwllo7SFSebnsd5p7w5piU0ZNLg0uBrnPgTuWJ
 w+Ss1WnPd2Xsv6Y7Ntt5g==
X-ME-Sender: <xms:pxRlY9DrSBlfS0AB-rPPcPkTplCeLyAWlthjMOaM57kpg2csf6M1xA>
 <xme:pxRlY7hjn1Nca9jvnBqw7VW1fkf2VABBQf9UKwFYrp8L1aQ37-Gf0IGfNN3cNWDZR
 354OXPHEIr2oHU0O8E>
X-ME-Received: <xmr:pxRlY4kddUPgQSNi_kZUhWzrYMz2l3aibPULNSJWsFUMvqyvTCHkhSQf5LV6xXjjMEG4qtjJ3SYuJIYDPP6GzQ4nPA1dw66wLpOCbODT-uP0Wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pxRlY3wVlj4pzwZ8N7dlrB01KzV7RpeSBNsUqTeHSPCbuHiTg2Ym4A>
 <xmx:pxRlYyRSyA__4VuJkOw0G5_zEk4wkWXT723WwVicOevQUY-nCgSDqg>
 <xmx:pxRlY6btLSQjL3ckCCycqUELIsBmjfKIP6T7VzHHKUbLlXc-14Ji8w>
 <xmx:pxRlY8DMBfkWgQMeRx0vIopjWFeGWv2pTHlXi5c-ofSRKD7HS8Wo1g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:04 +0100
Subject: [PATCH v2 47/65] clk: axi-clkgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-47-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gNQ86CL4FqR99S49w2gKPWneizqFQDUvKieZeJxKmIg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/vmMtdyV/KWqnt9iiAV6z0pY/3n78B/CLCHbadm2f1
 /b3aUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgInUzWP4H9tofMNx5YXVfyJ/tH5Tzn
 R+ZbikcrNpe8XmlT2Mm6tvZDIyLOidsXppTpdNZG/4E31Dlu7s9QvEFr4xzUo6rhDyO6CMEwA=
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

The AXI clkgen clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-axi-clkgen.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index ac6ff736ac8f..6b2a44ef4d73 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -384,23 +384,25 @@ static int axi_clkgen_set_rate(struct clk_hw *clk_hw,
 	return 0;
 }
 
-static long axi_clkgen_round_rate(struct clk_hw *hw, unsigned long rate,
-	unsigned long *parent_rate)
+static int axi_clkgen_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct axi_clkgen *axi_clkgen = clk_hw_to_axi_clkgen(hw);
 	const struct axi_clkgen_limits *limits = &axi_clkgen->limits;
 	unsigned int d, m, dout;
 	unsigned long long tmp;
 
-	axi_clkgen_calc_params(limits, *parent_rate, rate, &d, &m, &dout);
+	axi_clkgen_calc_params(limits, req->best_parent_rate, req->rate,
+			       &d, &m, &dout);
 
 	if (d == 0 || dout == 0 || m == 0)
 		return -EINVAL;
 
-	tmp = (unsigned long long)*parent_rate * m;
+	tmp = (unsigned long long)req->best_parent_rate * m;
 	tmp = DIV_ROUND_CLOSEST_ULL(tmp, dout * d);
 
-	return min_t(unsigned long long, tmp, LONG_MAX);
+	req->rate = min_t(unsigned long long, tmp, LONG_MAX);
+	return 0;
 }
 
 static unsigned int axi_clkgen_get_div(struct axi_clkgen *axi_clkgen,
@@ -495,7 +497,7 @@ static u8 axi_clkgen_get_parent(struct clk_hw *clk_hw)
 
 static const struct clk_ops axi_clkgen_ops = {
 	.recalc_rate = axi_clkgen_recalc_rate,
-	.round_rate = axi_clkgen_round_rate,
+	.determine_rate = axi_clkgen_determine_rate,
 	.set_rate = axi_clkgen_set_rate,
 	.enable = axi_clkgen_enable,
 	.disable = axi_clkgen_disable,

-- 
b4 0.11.0-dev-99e3a
