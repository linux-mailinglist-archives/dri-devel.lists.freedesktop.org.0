Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C99619769
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868BD10E766;
	Fri,  4 Nov 2022 13:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FFD88EA1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:17:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 61D9858044C;
 Fri,  4 Nov 2022 09:17:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567872; x=
 1667575072; bh=06erX3Kj2Cpg1UoaP6NUgmKg6CRYa/Sd79GEp9CTLUk=; b=e
 1ZeoTljhCPkZpz2rIoVn4PYG9rZGAspv5rnLPPk41E3S9iCP+0nCwdQvSyVEpKlr
 Z5Jiu8Mbec/PKLsbqcILj3878dmHzqvG+e9pk3gXVjxy+FUYgJbQqCZIE0NxHDJ6
 FOf6Ez+WuBz85DACVSv1TfoY2uCWu6oSxx0yLC8K8Wkq+wRK8MlPV4X0RXDQwiGK
 qQ59Dzpv2S5quPC/rxmIxn5jsKMIDI1Z5NpVGGAmUrQwdS6AtSzTQiXeahLbpbv1
 fyZ2iR/6sHpVBP7gQk9WjuiA5ucOSZfWC37s3dYrDDB3LWJ7SUC5/SptcCEcvd1J
 fIQccRyog/25GtPWrg8wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567872; x=
 1667575072; bh=06erX3Kj2Cpg1UoaP6NUgmKg6CRYa/Sd79GEp9CTLUk=; b=O
 1TqjhPO0LY4RXuxO29Nix1PCYvo1wCARUQeGv3LyVWVwqLlizWkmKCf4ONBaxIyX
 y0c3rBl6+5IohCEpE3AmLurPhH1TpSY422cJaHmD6fA9H45dkj74X7c2SBob5UMJ
 atcHQwp7sU33ZPzAvoDn7SIoHBxNcgkPrjZ9AP5+yi08cxEKT7IgaLG+n6h4CVbx
 9kBAd0rWUHqYq4S7rwT6hwzy2RhFl1Fve1/j8L7h3peV+9hRZjRjvwfI+3aPpdie
 9kgkIqVYCR+GZOzR01+RuVCjS/l8gYgWMyVDgh8E6W1fuLMpv/7PvvqbwoGytXWZ
 mdscHkxnn0JPA9QiFdt8Q==
X-ME-Sender: <xms:ABFlY_dJpQD9hcGry3hBHYYckdcnQpNy3dsh74dzGjsYN9wGMbIWDw>
 <xme:ABFlY1OEfnCWIe5C33S-adK8w5Q4ZhTsV2ENpe0K7k_WfwT7mZDQ_80Lb28I1wGJr
 a9eu8d9fO4qpF6uzQA>
X-ME-Received: <xmr:ABFlY4hBpX56ErLfM4fX-GGFztlW0lFJmFNN_Ze7gvHpZoCFSMATNW0yt-BAVDn-DmGDoOnTnB2G5-UAzohkRovZkpvY4OtEsN37CmavcLHp8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ABFlYw-DgANXlXvxTorZPiqI1K4NE9FxHGBpYOy0Fe8UYlBuvdQR3Q>
 <xmx:ABFlY7sLjwO_bDmdsK2JWkcP8Gahy0ULxLN7Bi8KQhSg66ubzg2Z0w>
 <xmx:ABFlY_GcvIPFbzURXkvd-U8XewfaQ5VfJfVlsyuXWk2kTR6cVyjxwg>
 <xmx:ABFlY4ObWRjqPTCdsP6YSGjeS2QO6RdkD01nCaFrs_4ctu9H2dKeiA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:19 +0100
Subject: [PATCH v2 02/65] clk: lan966x: Remove unused round_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-2-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UUWQAfB4LjFBOSGFZ6uyIELdMsnaIf0eeBGtwWhM+3Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp80QlY2nviyod257eWMD6xV2dMP2fspWXFExnhWBFwp
 NQruKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQ+vGX4p7RFJ8c9ym9KRP3i+j9yG9
 f4pdRXfxHeFsm382TzioAPEowMM/46eBx3YEqvMhJnNg0UUA3Yslxced5S2+ZZYt2ZL9qZAQ==
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

The lan966x driver registers a gck clock with both a determine_rate and
a round_rate implementation. Both are equivalent, and are only called by
clk_core_determine_round_nolock() which favors determine_rate.

Thus, lan966x_gck_round_rate() is never called, so we can just remove
it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lan966x.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/clk-lan966x.c b/drivers/clk/clk-lan966x.c
index 460e7216bfa1..870fd7df50c1 100644
--- a/drivers/clk/clk-lan966x.c
+++ b/drivers/clk/clk-lan966x.c
@@ -103,22 +103,6 @@ static int lan966x_gck_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long lan966x_gck_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
-{
-	unsigned int div;
-
-	if (rate == 0 || *parent_rate == 0)
-		return -EINVAL;
-
-	if (rate >= *parent_rate)
-		return *parent_rate;
-
-	div = DIV_ROUND_CLOSEST(*parent_rate, rate);
-
-	return *parent_rate / div;
-}
-
 static unsigned long lan966x_gck_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -177,7 +161,6 @@ static const struct clk_ops lan966x_gck_ops = {
 	.enable         = lan966x_gck_enable,
 	.disable        = lan966x_gck_disable,
 	.set_rate       = lan966x_gck_set_rate,
-	.round_rate     = lan966x_gck_round_rate,
 	.recalc_rate    = lan966x_gck_recalc_rate,
 	.determine_rate = lan966x_gck_determine_rate,
 	.set_parent     = lan966x_gck_set_parent,

-- 
b4 0.11.0-dev-99e3a
