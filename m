Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3A61978C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51A710E767;
	Fri,  4 Nov 2022 13:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE39A10E767
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B8EC5804C2;
 Fri,  4 Nov 2022 09:18:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567900; x=
 1667575100; bh=ZCwzbCeVZB2Z2ZsOYNmFLEHLHlieS5RCP9CrLVnrDto=; b=p
 c2Q5C0moCtna7UVj3FhJIKcS3uaQpR1TZpMr72LICx8oqkdiNcSekX6/onZeEiGy
 sRgyK/t8JOGAfqyn9wd+OKG5V8uZiadXkX4lQ6gVlkpj6Eyx36Dn39lw93G4JQK6
 k86WunS42LQH42TyuEKqHgkEDijTjTMFUVePqESJD1xnHtFRRZNMauwuk4dH5rxu
 bGrRcpzuifgwbtD0Vl5edz+I73xW30/3aYT0N7Bigfx0rjqI6EwwuU4Fy3fXB8Ql
 IafJWPL+JgiTcTWpvP3h9MdXizLuA38oJzBzKrtQkpkXhH+9xVXmvyVDhKEQk74D
 OSyzdKmcKZ2T0tCf5lLqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567900; x=
 1667575100; bh=ZCwzbCeVZB2Z2ZsOYNmFLEHLHlieS5RCP9CrLVnrDto=; b=V
 0h10qHvmMLmXBIw3VozyS6ppDm9KJWguva10hoozqItb97jLvKdnYCPzaU96TDob
 Yggc98OSi9Zx4TIXtFwDZwHYuHsQPxeuf0s90yF1Nbc/Z26VOeLw4SSeg/xor9KH
 fpBUHC6kvPrKkRE/kfl0H6vgE0s/EZKOif+BYE2gCYE6facPJayXDYgXp/JxVl9m
 y0v3sl+hBy6ZiiFQ/2wbQMXZ8+sYMtZoOBvb/hIHSwe/+SI3+RkporpvigU9H54B
 cbLX3DRDf2fV/wt7DnqRFvkWqFQSRt7NUzhzZa8lH3cwfKqfIjgbMd29H8pempPQ
 3WWUgQSbqZOvg4TqI8p6w==
X-ME-Sender: <xms:HBFlY__H2ujhHL69MelMpi711rHF3hXZH12Ddo7qbw2-VmhU2m5M9A>
 <xme:HBFlY7td4H1sws5OpRR8x38aFO5Ot0rEZeuyyWBdmuJHUUx09m3llYy18baJARvQF
 TlB0okEMkBSSNHMCSE>
X-ME-Received: <xmr:HBFlY9BCgrbknFwCIFzDJ3Zq4ePKBhmX0byftdrs209CzN1g8Le1coO-xM737tUaT5qW4wJ8qk-IYyaZuF5m1AEjbKIYzYlsjvxqoyk0vWbsCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HBFlY7e-IPqy-cib_DxCTPosG5hG6SqTEd0rp6GiCwGA9DdPoaBQKg>
 <xmx:HBFlY0NiQarYMIZ99PabgWwrPsAVyROiNi1NqmoEBfrVkDWKNLeWBg>
 <xmx:HBFlY9mkyWxpad4wg-k-BVPKqwRPisOUIzymuFZZa_blnNPLAQ9hCg>
 <xmx:HBFlY6tRvz4zNdAi3v0wuQHc9yEGNmueyxoNwFXo0DaruOSNZ4akLQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:32 +0100
Subject: [PATCH v2 15/65] clk: qoriq: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-15-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=1/qQmnkaLnLq5c4J9u4KwVo54amMRuIrpmMOv9UfOro=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp+n77x3kfen/fO8TvnL5zs7qyq42ffq/L6x9F6ShUzd
 hgsLOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRa48ZGQ5HePQydxW3Pqx9GtI706
 cvcUHkZlvJaMPQdUe1YrZdCGP4Kxv0qvHEcrZeJaVjqn9fv35UIrnQdlqc71rNHmXlH3uXcAAA
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
b4 0.11.0-dev-99e3a
