Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B36197F5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5C210E0FB;
	Fri,  4 Nov 2022 13:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10E910E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:32:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5C485580260;
 Fri,  4 Nov 2022 09:32:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568774; x=
 1667575974; bh=tGBydtCUDCk73jqHi1ms+PUwXaWw+MD85xxvyrgKLGo=; b=H
 zZSaVpusazNg/YVT2NLu/+9aFuPRyZqkFeM3Xvax2JTezgPb71HKKAmjNt9OL6LQ
 BRoCWn7bkdaceum4BsnyjBxsWjAOgX7hUuyXGFN7VnHNs7ea0D81T/uCym3Lkaic
 tS6dCr9stjiI+BvSE1W9cHogLQrZKAU6fydmTfrZ1I2IwgKv0uIjjdpcvBiREZNO
 RXLEvlYObHoq9AVZe7OJ3Z37GXxVQFAQyL5ER7T8OONYI4texbIxZfoMV6He0i8+
 ynhmvP+z72lzSAAL98VCo8V5qb/hvDwgieUxz2cUNQHYTDloXGthdUmfq0XB3+Gh
 0j4WOPoUF+RVUm51g7JTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568774; x=
 1667575974; bh=tGBydtCUDCk73jqHi1ms+PUwXaWw+MD85xxvyrgKLGo=; b=M
 7Tf4/qXEEA34xah9HeEwuKKmhlpnc+11ekAUOmw3BuNFjlUhAFTCURkfMRHZVvDy
 o4DzyRL44cP0hsbvuG7EjtK6ucV1beBEkcKQuNR2nhUGTNfTi1P0NVe9l8SOlRqE
 9i8zRRuFS9TQHU2fwX+Crtqexrn06Rc3G5I64bzwQrRGkRpotaOt1okiUiaTFcq/
 FLdsCWYVP+gzoASKY++2x5y/39Pq8A24vno/WVF9lxb94gsbxH9Rb/7jbkiXVmy+
 gynmUWLDlJAW321uqM6oPkwPEr32WWCAxLJXkWwC1RFivj5ubkkoQHTEQbOliAA9
 cn0fDNZcwl13jyoCkwDJQ==
X-ME-Sender: <xms:hRRlY_OZfnizhcakOJ1XZ7QBPrFIq9RzsssMuuH3h5kGwdRC3w7a2g>
 <xme:hRRlY5_6MfqR2X2e2jeaMLjh1X_xAxxd7OjucKrof2_o_uhL0e030sT64fzgzcW75
 3kYN3uuY-0twYStTeQ>
X-ME-Received: <xmr:hRRlY-TnZlIeE1jwDmECykW-mwlh-qkbN-WvJSOcqPMcxttoYcsYivLwIJ2-NfVU7aZbTEyv7e7x67MiiRWa5QaXGfxS0G1xdw9E26SqgNrAVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hRRlYzsAO02H6QsAdIkwLSRE7raY2NbewULGhtiKO2dXamxl2yzvcQ>
 <xmx:hRRlY3ff-4Ap0gE2XYGDgHUvXnbd4bHDXo8lakEk2stOqIpV3PZeaw>
 <xmx:hRRlY_2rnepJXx7KIvcAkw3-mA4Ze_Uewh4ObJc6ZqsugoqTU3D0Mg>
 <xmx:hhRlY28LI5ia1Z2nyukat4qEcg_hOtMGW92Mv9Po473ubbRrf57cvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:32:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:50 +0100
Subject: [PATCH v2 33/65] clk: tegra: periph: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-33-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2522; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TVWzazISCOex614FUIKSWVgATQ2K3qNuwmBeNxoZHAM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl9Wim3aHRGfvVZQ0iX9wS0dq3aNxKwnv58HPNecriXL
 t+d1RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbyYSojw6TIBX69GamNv7n3nJZjfj
 /7WX75c+aVkQ8MONsOJTi+lWD4K8MpteRrxtFfP8u2nry3X7fc/vGy7Ngb12ys1tT6TJkQygcA
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

The Tegra periph nodiv clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 79ca3aa072b7..367396c62259 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -140,6 +140,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 };
 
 static const struct clk_ops tegra_clk_periph_nodiv_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.is_enabled = clk_periph_is_enabled,
@@ -170,7 +171,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 	bool div = !(periph->gate.flags & TEGRA_PERIPH_NO_DIV);
 
 	if (periph->gate.flags & TEGRA_PERIPH_NO_DIV) {
-		flags |= CLK_SET_RATE_PARENT;
+		flags |= CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 		init.ops = &tegra_clk_periph_nodiv_ops;
 	} else if (periph->gate.flags & TEGRA_PERIPH_NO_GATE)
 		init.ops = &tegra_clk_periph_no_gate_ops;

-- 
b4 0.11.0-dev-99e3a
