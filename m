Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C90619792
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7268410E77E;
	Fri,  4 Nov 2022 13:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC9E10E774
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 93220580556;
 Fri,  4 Nov 2022 09:18:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567917; x=
 1667575117; bh=g/tCYGEB7G/tpibSy/Nw5qee275ckprCb70mVjEL8Dw=; b=n
 uK84mbQtP1Gv0owSEWECFoSWPSRKPZRrLnP53mBmR1JXIrC9oBSbtfFRk93gDFw3
 DwQJgARuU0gEgD3BNNI6yWQBVbXqoCTTJuwcbTFW2PG9mX3ZrNLvN+xeoFrfoaDd
 enkShSkp+9wUTT8FBq4gwSfcTcFEocdCYqZKd8dh4G+zxB80VjnjbtLYMdJ/5NP2
 pnnM2PEjgcHC5x8XG4RTMhrL4/Xek7ENXFrGMno7el9POJBYZyNkWeBpGxGYPiRp
 dZk8RpAF6LoeRI7gkypVpTGu6xkL4e1RVZ2AOXxGHximqw38nMtsokKzNiCWh3D1
 x/jhvyg1YQhfDdUxauT9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567917; x=
 1667575117; bh=g/tCYGEB7G/tpibSy/Nw5qee275ckprCb70mVjEL8Dw=; b=t
 SZBNPYfman7zBwm0Ls4+r79aIJA+y3tZDGCbDnQadnQxPG05IFt6+0cL60/NiKzf
 kTmPwyY/DlBMqt77YchRedr+9grtO+kkZ7Yil2LvznyOCw7/tVdp1IWP+SFt3vzM
 AZ/b8zkiATE2h56fmitY9CSm4RoxDHofXKs58DKPyQy99pWLP5lb3aXGsT4mra5I
 iO9son4wj05e/qjTZcYeRGaC1IzAcE+wsPjp+wAZF6uz7zSDD2ECuYLY60xm5+gw
 8MUY7olA/7BlOwACvDDdrrjQN/G1d+IvgbQ/bFSOe3OZOgHT3NPgRYp5xRNEy3xV
 qgv+UgkaOhajfwQWjHuoQ==
X-ME-Sender: <xms:LRFlY0L90WHQ_3DT7GjS3d_8YhA_hDZ8cPc7yQcKhwPv3HwRygSSpQ>
 <xme:LRFlY0I9wExxoq_iRR8RSBvfnuvcRFFsf368tS52qaymoeY5DhDW6KiYV83J8SeRu
 kHGmgCjyTD0OGLqvNs>
X-ME-Received: <xmr:LRFlY0u5GxGUaGQpkugPEsyzWOecLexfZ0TBNV_l9WhFAMV9molU21jPLs0Tw0PBUgNcU_oDQe_f8zWwHF9mI4Hlg5Ex-kjlODvw1RnaDGKfxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LRFlYxazTlFqVU1hEnzyIaGKsBSh11XDao82DA8Wd5YTKIf8tJ8gXg>
 <xmx:LRFlY7bI87s2bGunwCMXzFYLlWDodpMaYbdKEggu2uAAVbTgqmv7VA>
 <xmx:LRFlY9CVzmnAslHmwDcCfuG6DoHuiJDGKx1ljvMW4L6nzkQO6YmH_A>
 <xmx:LRFlY_ozReeG7tLRGLi-E9li4IxM_Be8Xk8uMp1I8-0Tdk9e13mc8Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:40 +0100
Subject: [PATCH v2 23/65] clk: imx: busy: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-23-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LtN3afqB1IeTGDIUKVpccoxSm7ihgsjecZ9M4RPxq2g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8mXlmy4NrvfO5Xk5cF36uSirvU9ji1JPZF3xbLzWxm
 E9+c6ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEDmsy/A847WgyPYxnl+63DX+mu/
 30Cr3T/2mNG/tT/bbtmannjCsYGe5ryHx5mWUszfsq3jJcUEBGR+ZwT52lr7baUvnzKzrdmAA=
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

The iMX busy clock implements a mux with a set_parent hook, but
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
 drivers/clk/imx/clk-busy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index 6f17311647f3..2df81862782a 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -148,6 +148,7 @@ static int clk_busy_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_busy_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_busy_mux_get_parent,
 	.set_parent = clk_busy_mux_set_parent,
 };
@@ -176,7 +177,7 @@ struct clk_hw *imx_clk_hw_busy_mux(const char *name, void __iomem *reg, u8 shift
 
 	init.name = name;
 	init.ops = &clk_busy_mux_ops;
-	init.flags = CLK_IS_CRITICAL;
+	init.flags = CLK_IS_CRITICAL | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 

-- 
b4 0.11.0-dev-99e3a
