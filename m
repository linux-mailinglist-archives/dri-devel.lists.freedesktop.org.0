Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73961979A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F65510E792;
	Fri,  4 Nov 2022 13:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D61610E784
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:19:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8E6E1580564;
 Fri,  4 Nov 2022 09:19:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567942; x=
 1667575142; bh=hhP29jEeBfRvzuLV/5grZHmqUXnMc+kegKMNYrrgAHI=; b=V
 jvcfM9nj9GzEUwML8i0RWhLmpPgguA4VVeDPo3mpJMAwqKY2gUGf0ZNET1MmeJ8w
 axhLXzSnlwbck0udyyDdRT3wOfZMZck8s1lsego0su8vyK8Q9/jUqyIXDAYoI7xR
 NiVGnZaXvuTfgKKihUia4Vee8cMxaYFXjabKdjGTJoUoLV1gNYzMEahJcIJZcrfO
 U7qQW7mn9BAH5gRN+LMpWwt5+kEe4NAI77BtBBYRShU219E7XseOfb9BA0N6HArz
 spo3xuJUu9v77jfn8/6Z6JxH1zummUH8caTVrALB5PABEJTQie8WJSM1fdnVSOzS
 2kWN6fOnd2iq7iOxD7cDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567942; x=
 1667575142; bh=hhP29jEeBfRvzuLV/5grZHmqUXnMc+kegKMNYrrgAHI=; b=R
 uGgbqTxzTUoc6LjVuqwzn1P7/NClCKa8APdk664rYH79Ggc3G0K8RwtjzAcun7q4
 4EPE8IjUb5Y06cBowmzaV9zRYCbTRsAsHBLbtyGCs65w//CPgR76uPY5dNiOEpYC
 9+MBBlFcC1x76g4fFx04EEbXn2TQqjdWiOus5zIlnx3TmT+eZ4tolYp+OhREZSN5
 RUgwss73bjI0fkfMHpoVKbfy5C81bsV8SEicV9V3a7XNNKrmUkTVsvug93J3UjCJ
 RVK/wiK3c3OT+aALghXK1e2ZtsHI6yIwZ+UYeCwIzVX6XQyVbiVQIfeZLh8q4xmr
 iTLDy1wgba5+abYj+Scxg==
X-ME-Sender: <xms:RhFlYyCjMISDwOzdtYmnCG_priYwnHzp157RLpyzrODaUC2rPc8PdA>
 <xme:RhFlY8hQumQE38gTGbMXdMzu_1NlwidqeZ5twahybW8zrGBQ2TuaSMg83XdmxbcpR
 6JOSq_9ntBPc8kRuGg>
X-ME-Received: <xmr:RhFlY1ltqCeugLi83HF0LdFap1lCLRykMWomOWsOtlmYkXi5iZMaC5_viwyleQjPQ8m_hR2gQBfDO3Lid4B-HIE-lEdUhqDwYpHq9l39TsS7hQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RhFlYwzx43UF66P5oNlf7iVrCg94t5XUT9S_IHanjX6nanR5-Cy4Iw>
 <xmx:RhFlY3Qu8tflQ0oJakJ9e25u_GTFr_AV43hW1SziC7CF6sahjN1NNw>
 <xmx:RhFlY7absHNj-45Nh9Mu7UIUgtfEjRoH16Iatjkhh10ydaFWVWy7CA>
 <xmx:RhFlY1DhKg12YXfVE_5076tNfja__Mj7EJLSbfFdDT8fDc8K6-9Y6Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:19:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:47 +0100
Subject: [PATCH v2 30/65] clk: stm32: core: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-30-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Eu7Y9hu9fu4KEW6frLW2ZrjpgTapsHsdiRdYuhVIur8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl+mGnq9vZuX01usJ/UqulT/gX36ycL9uR7ypy7fvCCf
 vMG5o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABcpZPjDo94ypz/949U1O9Z/KY7OEd
 vtHdTUaVXSIuzyp8yLv6mW4Q9nvmvE15hoJX1L/q9F6wr67x3fn8Uida2z6Dp76WPnVSwA
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

The STM32 mux clock implements a mux with a set_parent hook, but
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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/stm32/clk-stm32-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 45a279e73779..3247539683c9 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -275,6 +275,7 @@ static int clk_stm32_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 const struct clk_ops clk_stm32_mux_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.get_parent	= clk_stm32_mux_get_parent,
 	.set_parent	= clk_stm32_mux_set_parent,
 };

-- 
b4 0.11.0-dev-99e3a
