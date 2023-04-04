Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE8C6D5D20
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0575B10E650;
	Tue,  4 Apr 2023 10:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34A810E648
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:22:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5621F58214A;
 Tue,  4 Apr 2023 06:22:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 06:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680603740; x=1680610940; bh=7i/Ab+kXgxVSz3G6M0zpfnoNQPldDWBWa8x
 D+C440h4=; b=BLFyrB97Jv1YShK1/5/T70wP48oMhwtjL6xAMeqnDAaQSiteUv9
 qWO0++teV+/3FWUx3+KiGDy6yZnzYtHTZwvFmlZeI1FWUvTMZTJMJ1VBEzMXipl8
 3bVeemB6fNrhZEpfPmRkwr00PnPMNpcPM0upEcl5kbW/F44lUZQpcswsAZS4d0rl
 3SXb6EZ6+qM2zqNWboYmeovIpwdGjVtGVR0mSc8ns/o8WydSJcDvWGD0rVjMMWbm
 hmbJr5FADyoBs/ec3WZoQ7Hegf5oCMGLwFSI8zqZF0xJNQIFOj7N3vK9MoOHF06K
 Nuar0hUiDU0I38WlUFhPFCFCLBiB/UliZJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680603740; x=1680610940; bh=7i/Ab+kXgxVSz3G6M0zpfnoNQPldDWBWa8x
 D+C440h4=; b=XhEHYYk1BAJaNN/M/XsU9toylC7HwzJdVG37H+mkuuX7Ol//y/C
 O8LjHdEtyNVFVfOvVzlrdVgNGQge2wD8G2PGYC9MQy/AQw3GL682+KHb5TPvJWmo
 4EjDk2q7EngUSw2xh6Kkh0YxMoKHtxOjsbhi5CPLtlhYJQP6TOT6+9sX/DwBvZ2g
 duY1aF4bHby9O7X0KnA8Kkeh1/7EZ8Hj5Iyy4wR/+nNenoVmVB4IH17eKV2qRDuP
 ErGBU3Myn78+I9c0OUD0e1GgjWnx4q6rB6mBznJm9uSA2ukOyvD37Mry5iyir4xb
 J80IMMgmJa9wqbBnXlqj27wN40KX97x0Nrw==
X-ME-Sender: <xms:XPorZKJ9u2Ksy9rRZnE8a3JPnbQd98mT_JmtmzogHSlqv7hu2tR20g>
 <xme:XPorZCImAhKx9oOR9fEdNbZs97k5GCwHlEvdS5aQvSBDT8s7nshJx0rG6X6i82tC-
 2-V03o40UNhTjgwfC8>
X-ME-Received: <xmr:XPorZKsg5TOEtI7QCD8__GeVOUACWPgRPZMeAS3MhlPCXFXKcn1qX1dQ8q1diBI1e4tQGCHzuoNXLJvbhwIvrsAxWkEMT-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XPorZPb2b6AodSj6NC8ZrCY_3xuHhm_wBGT2EpedWt3mOTfLB3HwwA>
 <xmx:XPorZBbvmCJouG-ABpB0vGhIXNA6g1PFiJ7TRW0AcD9BkJKrt7nw2g>
 <xmx:XPorZLAsGh9Zwe3W2fG6yMTf2RtrR2NCqL78BZUTcUOwQT3ncWcQNQ>
 <xmx:XPorZCmHiKHJrh-bM6VJf3vlChJzF648YBGa0MBU6pqwUyzm-LrENQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:57 +0200
Subject: [PATCH v3 07/65] clk: at91: sckc: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-7-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Lg/brXNdE1g9siAzXUI7jZQhQ+BR+hmAKU9lQUCbDLU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37csuiyvqSFuzlpet8JtVtfVhVxPzhxOk7zqMqHkHqNi
 +oXWjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkYRMjw55fIddF3mx5YN1fNH3tlY
 SwSCMPpcXFEvY71YsuXvu04RIjQ+fMOdlzPomLZlaeTw7YvvLC9gXfFooXvfxQvfSd4kqFREYA
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
2.39.2

