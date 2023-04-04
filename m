Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C36D6088
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C4710E25D;
	Tue,  4 Apr 2023 12:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181B910E25D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:34:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6CA17582192;
 Tue,  4 Apr 2023 08:34:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680611654; x=1680618854; bh=ofXRPjSeuLIE+pgsWkkZhvdIo/bVLEGMRu9
 IRT1pqDk=; b=XQ8WIuFvnx+759E2bCoLHzxlUPxU1E70vDoutIcK49P1n/OWLyR
 89CwvhDgrw9p4a2cLEvuqzcp3UEpImBve9UqxEJLyq1w+XPUxXhdaVDmigtVhTq1
 w9XMzXJu3335Uldpct+sT3tU24dku6wMthZi4gHrzhpkf44bxKY1SPagGmxcbPjq
 r4hEamp7nt6YivsNr7E2eesHUg5F4Lj16JtHG+2bSzbT7KiWGL2ZNj/22w3zKJpN
 W4Z4g0Yx9D9zEe6M/ohnkFMEKjm+i3CTVL2ivwUCFsfVB0DxksfR8bEsFTLUyjN2
 cczhP2N3N5dhl8PmMxTPRYrE8SkbYdQixJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680611654; x=1680618854; bh=ofXRPjSeuLIE+pgsWkkZhvdIo/bVLEGMRu9
 IRT1pqDk=; b=Y3Z7OwL+CEh7o9O62qSCEu8mfevsms1IAGs8JLeq7hsFR0oITi5
 MmYcR6E1aeME0Txq0RB31Ln4dlU6GKvKLFHARNYH6uXK27hmfMBg4GIdwQUJKHIN
 kWaj0N19vh6cyRjb+YHkB30GmJwAtsibuTotozmnclJT7FczUGKSBHGQCTbCHlqy
 ay1YKAi6oY9htNsX6TMv5BhuXZjqdUoAQvzBIcz2tyCWTYkgerxKRb8UrtM9NTcT
 XBQvhcMSfWFbOfwP5iYjcyOQvYMRoPgwkQN53/4Ch+AG8fOQ/CD29ocNujkwY4Rj
 rn7zsU/OKFC2en8BvcsnxG3cXVnng9isnGg==
X-ME-Sender: <xms:RRksZBsQsGClD3kCDZNnk66v2x8GuQl_kgDqdEUGFtjW1e3RyhvfDg>
 <xme:RRksZKc5SeRCBXG1reuZVh2icK4CkmlYXkbDYLnvwShCzn-pBffxIl2Bs9AO89sxd
 V98UT59FvF8hfiXiD0>
X-ME-Received: <xmr:RRksZEzuTezvj3WY1dp_688ykELWMhie3PyseNJESgPC7m0lnjzfMtG28Ti-rjPM4k1vz8RYPR2F66stgt7KLy7C_1VqpxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RRksZIMqOnxLsxcYzW_6Bm62jFYTd1lI78ic7frg0bJuIx6u-Po_VA>
 <xmx:RRksZB-Q_S15EglpKcO5JETNyKKgl9t2kmjIs3XMRnXyOZEPT1tLBg>
 <xmx:RRksZIXT7KNabtCjlnW7GaPZP-Va22Ysau3_H29qr1hRZbUZXytZgA>
 <xmx:RhksZNofs_70Hj5fJgraKprR_OJZ6XjXK2My1oFF4zROiXgghxpY6w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:05 +0200
Subject: [PATCH v3 15/65] clk: qoriq: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-15-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3436; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wLplJB/vd+2Jhsx5KLmr3nH/Xrdt8C6VLDIsDiH+yLE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ea7gxglus0OafpsG1rYaHd/3mND840GB1gSFVeIKcv
 OjW+o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPpTWBkOHnfPpbp7P2ARbxBJ1JztT
 9XLG5rlnfd+P76jRc9R0OutDP8d138g+nb5Tl1VZ0hh1PEsry0TN4eeBu2+NmU45fPrdtRxwAA
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

The Qoriq mux clocks implement a mux with a set_parent hook, but
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
 drivers/clk/clk-qoriq.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 5eddb9f0d6bd..6f51a2cfaace 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -878,6 +878,7 @@ static u8 mux_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cmux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = mux_get_parent,
 	.set_parent = mux_set_parent,
 };
@@ -908,6 +909,7 @@ static const struct clockgen_pll_div *get_pll_div(struct clockgen *cg,
 static struct clk * __init create_mux_common(struct clockgen *cg,
 					     struct mux_hwclock *hwc,
 					     const struct clk_ops *ops,
+					     unsigned long flags,
 					     unsigned long min_rate,
 					     unsigned long max_rate,
 					     unsigned long pct80_rate,
@@ -951,7 +953,7 @@ static struct clk * __init create_mux_common(struct clockgen *cg,
 	init.ops = ops;
 	init.parent_names = parent_names;
 	init.num_parents = hwc->num_parents = j;
-	init.flags = 0;
+	init.flags = flags;
 	hwc->hw.init = &init;
 	hwc->cg = cg;
 
@@ -1010,8 +1012,8 @@ static struct clk * __init create_one_cmux(struct clockgen *cg, int idx)
 	else
 		min_rate = plat_rate / 2;
 
-	return create_mux_common(cg, hwc, &cmux_ops, min_rate, max_rate,
-				 pct80_rate, "cg-cmux%d", idx);
+	return create_mux_common(cg, hwc, &cmux_ops, CLK_SET_RATE_NO_REPARENT,
+				 min_rate, max_rate, pct80_rate, "cg-cmux%d", idx);
 }
 
 static struct clk * __init create_one_hwaccel(struct clockgen *cg, int idx)
@@ -1025,7 +1027,7 @@ static struct clk * __init create_one_hwaccel(struct clockgen *cg, int idx)
 	hwc->reg = cg->regs + 0x20 * idx + 0x10;
 	hwc->info = cg->info.hwaccel[idx];
 
-	return create_mux_common(cg, hwc, &hwaccel_ops, 0, ULONG_MAX, 0,
+	return create_mux_common(cg, hwc, &hwaccel_ops, 0, 0, ULONG_MAX, 0,
 				 "cg-hwaccel%d", idx);
 }
 

-- 
2.39.2

