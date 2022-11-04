Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54728619781
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9227010E759;
	Fri,  4 Nov 2022 13:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8018110E74A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DEBCE5804A6;
 Fri,  4 Nov 2022 09:18:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567882; x=
 1667575082; bh=+sGsriMY9gumtulyD6+ryWkyisaCZqEROGKJ28jHBsM=; b=R
 L3QSnBx+wOPF79j3Cpe8bMgpmaUP0S6erjJbqjLOJ9Ho0FrknPrCNp084KHHuqaY
 JoscoysehO3PNpkfIkzpimOGEWun8DIfg9KVSE6e0Qz2u0DQgWUdNxIANUCURI+i
 M0xWpmefH2qRTi2X+v4cTAAaJavV1jJ4gD21yaHaPuHXpa8E2UHToeRId8xLQdNM
 WXQLHwx537xr9BzNuAnVATKq2gLYAb5ux/Ue1d99PVGPod5aHxTl9mm6GsIyumv5
 ZoU3uYR5MxLJgNsHvDaIK2Ynu39CqLFJbNtnmxEgF2FC1Bs1BhOLg9nLBwLLxqS3
 0pD2s4HXDz55YawdflZIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567882; x=
 1667575082; bh=+sGsriMY9gumtulyD6+ryWkyisaCZqEROGKJ28jHBsM=; b=h
 VS7UTxOlqO2nT9CGDsz7XTecQdQ2WsmWmLs5Z2mxyfmZEnW9Itlgw8c5vHMgklwn
 KJC372oVOT8UaKVwu5MpsvVplaPGKk5VVcnPwjWnN/+JxjZlVHly5jB6NMOIWBHs
 7Gp4PcrIASOHN3j4il+PkQmjwVlItzdxEo4D8TE6kU9dWQvoeUyfl/lhLh6JmKRB
 duz8t2faQNR3y/wcdExkXF7AaCT9SctUt2arpCml1/aW6f1AVIE6m8HzkoCEUJsj
 9q3dMRIvdPeJGsh95Jw0QkWM4Z0pCOHWlRfhFbE6ZYSkzkGRVOkz/oDvpm0VVmVd
 318psvDVqeWb31K7fwIkg==
X-ME-Sender: <xms:ChFlY-KDkebq58nWT4k8wm0hRs2TyMpeAhb2gvTPNarKL1f4EZ2fAQ>
 <xme:ChFlY2JPwMCJu3478SX6cditrXCBkVSYpG1sy3jq3mynPUrrWVUwOjLFWmyQo5DJa
 o-qlw45J6jqVECZFFk>
X-ME-Received: <xmr:ChFlY-sw7Poyw0DzkIniXdO_wc7y8KUwqAYemfJaQuCr2F46tpdxVBolqMd0-cu69-fB_1MgPdBbmIEMgx4999HhMODT0kU7D0oslk9I76IOzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ChFlYzZiCzKjIhp2Lj-flMkiuowbPkhEVRuOmh3BzJ08BBp9MA_Xew>
 <xmx:ChFlY1YZISNpjUqZnPf9vRmkIlPvizJ5Ld4KDcBdedRYsH2Rikz8Yw>
 <xmx:ChFlY_CpCSL7M_iS5LNR8CBakhoy11-6k_ozOWgdmDC8B5l50LMeBw>
 <xmx:ChFlYxrV_7iUL0SPRlevcyWVb83gonGe-L7FnWrmgTEHqzzJogNz-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:24 +0100
Subject: [PATCH v2 07/65] clk: at91: sckc: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-7-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=GMav8u9gHBIjeuouIjRsu7I6ApdOcNs7sXTeIwxStJs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8Xrk2fs77P+JC/4UmRXX0fxHdu5Z4iIr325LR5d58l
 7Cln7ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBE9ncxMtzjEkm0q7X/tFfHqUX4Ks
 vzPROc09SMfh2Xbk2IOOgb08/wi8lNpshbdl6ppAvjh30mys3N2bsy5xjW/r2nsql32wRtdgA=
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

The SAM9x5 slow clock implements a mux with a set_parent hook, but
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
 drivers/clk/at91/sckc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index fdc9b669f8a7..9c42961a8a2f 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -310,6 +310,7 @@ static u8 clk_sam9x5_slow_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops sam9x5_slow_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_sam9x5_slow_set_parent,
 	.get_parent = clk_sam9x5_slow_get_parent,
 };
@@ -337,7 +338,7 @@ at91_clk_register_sam9x5_slow(void __iomem *sckcr,
 	init.ops = &sam9x5_slow_ops;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	slowck->hw.init = &init;
 	slowck->sckcr = sckcr;

-- 
b4 0.11.0-dev-99e3a
