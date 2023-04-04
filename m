Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8B6D5D15
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15910E63F;
	Tue,  4 Apr 2023 10:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B88310E646
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:22:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DDE89582143;
 Tue,  4 Apr 2023 06:22:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 06:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680603730; x=1680610930; bh=nGN3AuHYjDBlMKlOguAM1kokb6J1T3liWCt
 xnb++y5c=; b=m6y/UCKdev0p46RqHxxkqgreOV0NfIIHrmOozClnmCq4CWKC3I+
 V4dbOtWu6aDFJXuFQoHloP/QzHILhgkM1xIoKYZCf5X8Ax2SnyE+EBgcs6ec6mIq
 IPL3QyubOC3tIYl8chEvubXJJJMSq/Xmu9orV9dilbqAczDSwV9LNH24SqGHQIGA
 rI8kGSolQPOnXlwO5IL8P2nN4PnH6aZ/4ETC9s3f1BQIvLLXTVumo5yvgj3cQVLn
 +dE60szXpPL8ZLcyRa+xjmL2LlE+Af9YCXx3HPDHjitVju688WjsuhWyijMELKFZ
 kYos7vLIpgY8OF56EZGtpydbvx+/vc5vwzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680603730; x=1680610930; bh=nGN3AuHYjDBlMKlOguAM1kokb6J1T3liWCt
 xnb++y5c=; b=QUV4pNKIGTAa8AqSUKf59k3SR+P0UhTXpmsp9ND7NSf+QDqbUYN
 72SCQuLZaCatO7dwis0ZAU4eWds6IeEmtPwHuPKqGRhjtKfxXqpgr3NOF53yT8wW
 YFCIgCOehs091h6ANpnqj8juNQFIUGtvAqclzik7y7Qr9+cu9EzWsZ/QWVM3Y87B
 oJwf68WSC/eva7wBmb3LzUSJmqJ03YYwdQRGBZdFCgMqh8VWopv5HvrUIIZjMEkZ
 1L/daOXSI2taNWDH5YUvSdSyf0OZuqEcmUtXK1qfeZPArxI6Ic17VEpOHcE4cgVa
 vE73V+EE4+uwqMJJmoJ00YGa+IiSgfTfoFQ==
X-ME-Sender: <xms:UforZFBO1nvJ2ijCs18CFR-huEZ5Z0zmS7X1WyoiPcQqujSZ_EWGiw>
 <xme:UforZDhUUR5OLfPrNudRHU4YA4693NNAfvr1MrAXq_vXhHsUoSpp6PSXajVJqr7Go
 zBMLHiNQi5h8_b7kkE>
X-ME-Received: <xmr:UforZAmESyV4sTPNMJaW3FX9870mdwkEKj3LzT2FLQ0xf7bVCar-BqsFiOtHEbu86MDHS-w92GA_F4TSrgSbljOKWnugbiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UforZPy59oSKY60S4yHiL19XTfwhXGeZwnzlKTvEFSKIBQOrIWdnAQ>
 <xmx:UforZKRcuYC4gZiE1VZaLIQ4rg_y0ecXd8RLmjiGb0jDPK2kHLqiYA>
 <xmx:UforZCZmPnj7MqCuG4UfKQoeVpAH-LWw17vl8H8NGQB7RptvBIX16w>
 <xmx:UvorZGfem73Nsohfqd0k_mH5nERQStU5V7vpCfkzT0ZFCRIfHNloZQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:54 +0200
Subject: [PATCH v3 04/65] clk: test: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-4-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=2bVmcStua7DJA/4gSyXDzXvL2VTp5Hs587ubgGquSfI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37c80buWzP0i7MqlbY9NEx8wHr9icjffc0o5u2Rk271+
 632nO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR+xMZ/il1Ldzvs+747wmvlMyvKc
 6+UiRxVX/aXmHl8qA2tgtZbOKMDG+yVh8T5WmXu769PPnujLduy9jX26m83rNhZzv7Mp5jTewA
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

The single parent clock in our kunit tests implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

This is not entirely unexpected, since its whole purpose it to have a
single parent. When determine_rate is missing, and since
CLK_SET_RATE_PARENT is set for all its instances, the default behaviour
of the framework will be to forward it to the current parent.

This is totally fine as far as the tests are concerned, but we'll start
to mandate a determine_rate implementation when set_parent is set, so
let's fill it with __clk_mux_determine_rate() which will have the same
behavior.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f9a5c2964c65..b4f37fbd180b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -104,6 +104,7 @@ static const struct clk_ops clk_dummy_minimize_rate_ops = {
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_dummy_single_set_parent,
 	.get_parent = clk_dummy_single_get_parent,
 };

-- 
2.39.2

