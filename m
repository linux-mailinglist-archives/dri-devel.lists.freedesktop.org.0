Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C196D631E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9744010E317;
	Tue,  4 Apr 2023 13:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA6E10E326
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:37:42 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D220E582196;
 Tue,  4 Apr 2023 09:37:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 09:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615460; x=1680622660; bh=2b4Sgq/POkdhH5Bii8X9oCN5UjdHlAsPEu5
 PVRDmJwc=; b=B6jufhXdIsIVVOlHteQmMsCMM/Z4+1u5ojL2vnpICtxMWNjcsfs
 4+QZgjaeQVH0AzjR7Za7f4q7TIDO1jZRZrMfykFALSWqfkXqZd5daZAkJ2qeK16f
 XiHgwck908QWJphZLs5+ZOXpqdErNtIyIAgTTK4RCSw8arK/3DhPxHUa7UoQd9VB
 d9FAwyxWqJukdOz2NWneN1km0V64EEFj0pdLwr/ReGwxgJ6XRGtPLz3YLieZqtwP
 P5D269DYBISWMJVOkrvJcJlNHVFPh/uSdYZ0M0pb4t8gcFIl+1epjblVFJO4xrUn
 oByWVQKU46EPm1IK5EXe7dqILBUvPHIfm6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615460; x=1680622660; bh=2b4Sgq/POkdhH5Bii8X9oCN5UjdHlAsPEu5
 PVRDmJwc=; b=C2pPftA1A4975VJnNsrDC7upBY2VHAjKTnt9kEQa+N9kGujjUFK
 L3JmHcR1F65lOxPkmvrYbupmxqlWcxKYwrUkJBR502x5OfPVeXxKWSJwogoN2/Kq
 EEct3uQPL3dtMNMGPSlE5P1RvIuMNUt1usolNzd9bBcuBg+7cLC4WBtsrSNMHI50
 xYz9N0oJOzRTIxw4vhliPAZlJk8NCUVJRKp8RG9h0JSAwUfMZdp/fik9gwkykwdq
 S3SjGbE7z2XnUXEk0/SvMQ4EWoH7TXjisfu2rgiqMV77i3BxXQbcmmUz9S/DXlo9
 0NQNHXgJ+1cDApHq5Y1a3jd/2MIzG/FCIfw==
X-ME-Sender: <xms:JCgsZP8VbTmdhVeAml_GhTMm3ojeaDBDPlPQvkQI9Mi630QuHevGsQ>
 <xme:JCgsZLuTPyYyv-s0uc8pC-pZpqpR7QhzHI8NMUYLIjtpwmHuk9FbL40NHcH8g351a
 nfKh9QGew6GVJcdyyI>
X-ME-Received: <xmr:JCgsZNBAkLnRh05M1VwvDzfJXvLbnUkCvyK6DDP1DG2kHHVe98GEIre5y2reOP_QqNC79jQ4LOLZc3vD1mbWTSuMzWXw4qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JCgsZLfkSQFTF3lllo9NenrzxcdAlEHkG94V7ndGCTgayAQ0ZOioyA>
 <xmx:JCgsZEOQ6rZGUXoXpYosBAFdGvJzs3hVxJ8RhjgsVhwFtrsa-bH2QA>
 <xmx:JCgsZNk6Jjhg18KurTr3Q4webmmWGwI8PCRhzmaBb-19X5k_7MBs7w>
 <xmx:JCgsZJ5eyvw_3Ke7otNubvqOXq5fyShcb0eFOsY0gi6llalbKi1yHQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:37:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:32 +0200
Subject: [PATCH v3 42/65] rtc: sun6i: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-42-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LBBJC9nnwlTM/0eok3kx3ph3T3adhOTLJf33evCrpDI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e9M355yfi50i33zzFhzjv+vHQVePNf74Sx0JnNQiXH
 57yV7ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEpK8x/E+3mjxFlik77qjj7Koncu
 HBTJv+rT+6aPHum9w+YVdbq+8xMswO+uT19hpr9wOzCTJasQUGcmflL9/N3TtZY/VLt27XTm4A
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
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner sun6i RTC clock implements a mux with a set_parent hook,
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
 drivers/rtc/rtc-sun6i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index dc76537f1b62..7d975202e0b9 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -214,6 +214,7 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw, u8 index)
 
 static const struct clk_ops sun6i_rtc_osc_ops = {
 	.recalc_rate	= sun6i_rtc_osc_recalc_rate,
+	.determine_rate	= __clk_mux_determine_rate,
 
 	.get_parent	= sun6i_rtc_osc_get_parent,
 	.set_parent	= sun6i_rtc_osc_set_parent,
@@ -227,6 +228,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	struct clk_init_data init = {
 		.ops		= &sun6i_rtc_osc_ops,
 		.name		= "losc",
+		.flags		= CLK_SET_RATE_NO_REPARENT,
 	};
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";

-- 
2.39.2

