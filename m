Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2B619805
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD21B10E7A6;
	Fri,  4 Nov 2022 13:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7C710E79D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B72B580456;
 Fri,  4 Nov 2022 09:33:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568790; x=
 1667575990; bh=n64sOLiagnviVv3HjsxkegJ5AjY5p57YrMPjGj42NiQ=; b=N
 DUApnRs/rAKtCZmBe2Wm6s30ujm0TpOYHX4pXaMBY6oJ9Fb3M4PNfv1EWMi4aEgx
 v1jvaYP8prDSIxQzIkR3b+H+GuKo5hcFx7TyPX/mYkd21gPm2hY5xEal3ao/t+51
 hCstWdcMea+COQCxhXldDKpP76bcUq3zQgLpYpvDGFZhYWCJ59GndmH1X/kU1MRT
 YLiJJzuMq09leXG1USYF6I44I+Si2yhd6KYPLpohQeX1PKFqfX8uehsd7RQJPOkS
 ws/T2vLKKOYxmd0vSmw7ZwaRYh4Xi1X31qCa01FCbgmOQVLXxaBUjx0bsinMFIBu
 3c6d7+hvyKuSbWfOaQzDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568790; x=
 1667575990; bh=n64sOLiagnviVv3HjsxkegJ5AjY5p57YrMPjGj42NiQ=; b=R
 QChmzzAm/9yfSs0GvKAwp/hkTgAo2XndsU9uHr2S32CNmGLfr8Cre3PuxKQMPM2r
 x2igjFHMSbfW/WinY/LFXIAaHMRE8dX+WEv5KUDyb9RnmvMoNQpbggd4Xk78hRg7
 RcH8R1NW00WK5wCnamrztGDax90UWXoz81LmQmDXa11jViIFqeRkRyzf0vrC63Fi
 M/DoQWRBKKUOLs6gggemUcXAKrK5J8NZP+PwAs7yy0iLzzjY5xBqs9HZpYPQ0see
 F42tua2NFt+XyO0HY0tNgVofHinjSjJCHdIq+ZW28cVYMOfwVTramQE8Gmi7Yekl
 /Q93eTbVjnxDgeSipQiqg==
X-ME-Sender: <xms:lhRlY5lmQe6S0N6-D9A1NIKoIfyXgj8w06Qde-aCTfLWje9vHan0rQ>
 <xme:lhRlY01BCL9Svn-tOafh3qY7xEthzPBRi1hv0xrEjEun6GbT9DNn1DdB9DrzyU490
 dOh8BwCHKUXEguFZp8>
X-ME-Received: <xmr:lhRlY_pTi7EQdldnQFOg2EJyi01DPO1RUu7oZZwnN2cNUEpbv6pWjWO1OohoLBluY2EjmHYfM4ZxhWYK-lL6fuPn1rlwg74pAuYPSeQrrbggZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lhRlY5nJIEHnItycc_Efs7qbpkqbwobt8rae8JfIF1MzWghbllsaVg>
 <xmx:lhRlY30QZfOU8caMtejw-odH98PPT23xznqsp5pgRWsoz0YGZhA66A>
 <xmx:lhRlY4vv-ogsd10OQtiKb_c80CVMfLU3w3_lMdRCPez9rIqpT2TiRg>
 <xmx:lhRlY626jUFgqAoZd2zL6EMicjxn8oqIRgJ8QkPaxo7IsgJsJctACg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:57 +0100
Subject: [PATCH v2 40/65] phy: ti: am654-serdes: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-40-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Iy1qQJ0znBUKLYMmx1qyBFpOyf2xzBCZjv3Ms6vHOyQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8bvL0V1bnzAmZ4XbSQXOei+LKj9v2TL6tdfZauPuP5
 iF2so5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABP5x8DwP+OfmohMW56dbvv+FWpmTl
 paQix/H7EFeXRlGHMU6QfdY/in6K/HzcC92EBr6ZG/22O/buxrUOc8skp2D1+8xkT1zazcAA==
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

The TI AM654 SerDes clock implements a mux with a set_parent
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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/phy/ti/phy-am654-serdes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 0be727bb9f79..f2061ce4e62d 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -634,6 +634,7 @@ static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops serdes_am654_clk_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = serdes_am654_clk_mux_set_parent,
 	.get_parent = serdes_am654_clk_mux_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a
