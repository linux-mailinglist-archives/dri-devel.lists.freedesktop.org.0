Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 743A761979B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC71410E795;
	Fri,  4 Nov 2022 13:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997910E780
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:19:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B9CF7580563;
 Fri,  4 Nov 2022 09:18:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567939; x=
 1667575139; bh=lA5WUlP+m15yaMMsRS2hRLYRwFFZ/W3FM5CuZu5dZ9g=; b=D
 GupQqrPMYH0MsOjDofyJ4Cwhhr8V5BN6i5uOoYZlfo9ldp8iTLw8ZRNCmwcQ9TmV
 rrUmX1mMbGHca24HZ3T4OyyYg+kv4B2KaRHUj3AJeifhqljLI3GOhby/iOiFWkvk
 iqfaMOKXPDn6eeimRAFDiF24OGHZx6+Pi3FirbB3LBfzmw2YGHXi84fmtVVn1Ub6
 alMaWIvXKYCqenOCrJhHLAeeeJkgD1yT2w0Afcuy+29DlT3KokZ/mhQXmHkqxnwR
 MxCN6cf3i9g88iTQ3XYtIejPHu8jOeuqEQVXBjEbQD8gPShcDJtY1I/ILnmaKD7d
 a5c/QnkFOvH/5QBsN4hww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567939; x=
 1667575139; bh=lA5WUlP+m15yaMMsRS2hRLYRwFFZ/W3FM5CuZu5dZ9g=; b=H
 4Zd4lIyAAkMozOsbJcGXnv3u58DX8bHBozkjs1fY+hKCtVZMrmCD3ba6wgfj3nz0
 /7uod78c1pqNKPjXKY8McVqqI5j4nj1Y7E/RvUcg+lZlItZpOAU5MmrfQDb9BWwg
 9M4o8KTFVUXYizYqRnxbtYW+jDDR2qSaxccwLuf/Hl1Asomp5E7AfKD3ZqrcPqVT
 TppPkqyNdZLUnOpE30qoYlk8DDC/oQ5J/eeRLH5dFUPOnM5hmaYMTdo88usuYGOy
 3xKyM94BmzmS6CRifUIRCAHMPwY4DHWgy0npvi/N+rHFaKQ3Z7lHohjaFqjvoHxh
 wsUqYgWZ83oVTg2SbrXXw==
X-ME-Sender: <xms:QxFlY4RQqYNIhCiuyBDTy8Oqp3j_hW-SALRVUarnzazSxhE9oyL1cA>
 <xme:QxFlY1z8EydsPlxqERo4QCJF8IwV2Uu50MvBkDfAlGR7xT3EwnSE6KmwHNOriNf3m
 KPz6hi2DrnlajmEGCI>
X-ME-Received: <xmr:QxFlY11zbfzYBvbXhO7YF_Cah8zn-9FWNuzU7lLHYu615pIkSrwKCrBuLsY4lui0pxITk-hs0T-MUJ7y8qid8yzPsev3sL06DPeu_pWvIM74AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QxFlY8AY3xTo1z3IxX_VTe0QO9-ckag_aNvQsn-9ZoVRKwiQcY1_7g>
 <xmx:QxFlYxjOfeA_W1RYw0YuEz5ZKXZaZCiqVYjc1iwGlwmUw_fwUO8KSQ>
 <xmx:QxFlY4rswOvPgc1I200KZJ6kciloCMJKsZCAYPguHpEax7WgaYYWUA>
 <xmx:QxFlY0RkHgkyhBd1SCYgK3KL6HOE3jtIGOIAgyYmpKxeAu3HtNCZ-w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:46 +0100
Subject: [PATCH v2 29/65] clk: socfpga: gate: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-29-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TfjTLbLF9K86/ClXD5L3Glk0XF37HwX6ba50fpUMuXM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl+aU07IsNZUTFHpkLn8b0Zma8OZAwKpH68vfMA5Ufrv
 7prajlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk6SWGv5IuH1Xj1nXPWyj51k3j8a
 yiN60Fqyd9nlyRPkXLeLunOiPDf5+nAunhk/157zkZnb8onG5+PEGoZcnbOw87tm8vmi9xkw8A
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

The SoCFGPA gate clock implements a mux with a set_parent hook, but
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
 drivers/clk/socfpga/clk-gate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 53d6e3ec4309..261fe2fac982 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -164,6 +164,7 @@ static int socfpga_clk_prepare(struct clk_hw *hwclk)
 static struct clk_ops gateclk_ops = {
 	.prepare = socfpga_clk_prepare,
 	.recalc_rate = socfpga_clk_recalc_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = socfpga_clk_get_parent,
 	.set_parent = socfpga_clk_set_parent,
 };
@@ -228,7 +229,7 @@ void __init socfpga_gate_init(struct device_node *node)
 
 	init.name = clk_name;
 	init.ops = ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
 	if (init.num_parents < 2) {

-- 
b4 0.11.0-dev-99e3a
