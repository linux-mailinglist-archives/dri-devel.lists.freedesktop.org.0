Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3046D6447
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224710E6B9;
	Tue,  4 Apr 2023 13:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1987C10E6B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:57:40 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5F81C5821BB;
 Tue,  4 Apr 2023 09:57:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Apr 2023 09:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680616659; x=1680623859; bh=QrnmsuZIqL40KcakQKLSyAGHFQpdw4WtuuL
 LJqLntT4=; b=BEL/WpJUB20U06xhlGQ0TccL9f3q8urBgw2Fmy5qO8yWI6k//Cz
 DsJlNZ1eGXCXZeoA9C2xXHHC6iCztgk5yEKujQly6RKA+QKS2HT8+pL84a5K7H4H
 /fAJwc9ACCNBj4HMQM+TpcUJIMk7dvdkOj5/NKbPaNM+z6bVj1UT085GH7m6ZEfP
 Jwpy9HJKBg4m/q8g0cvOSSXPE2TtaRNXDq0ZNd6q54gFzx2p/PaXTWHIEikrWWjP
 SHQGP6RNg36gHurW7ST8AGz7S8FM2khMuy8UyNAitTbmV+NoL0GPn4BILfdKd8qS
 y1kzTN9+f6kCjp5GG/DoB3z3/sNg5CAFqTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680616659; x=1680623859; bh=QrnmsuZIqL40KcakQKLSyAGHFQpdw4WtuuL
 LJqLntT4=; b=jBBZREVMUdqpuAHYqBCui5Attfpzw1DlkH59ndulpa7WMAcX4Sa
 IEv6hZ/IeEpqNJtKPhgFYApVeV2iWEFY+OZoYRxuBVWnBS/finuu5/uCvcXP2UGu
 P+Q8z0gGntv2pwa6ABwcz7u7uEpjfUJoh9YIgJ+POQg/psYbb24+obW73h/U5Wf3
 yRHoW9gN9+EtRqp4mFvoPQKNFjfLAHUQM39vXLEUVfXuCvyAv0izgf28SSN1EzEd
 ONFXJcoRSh3wUDo4y96JGyAVLtd2u4qr088QRyzIOmQ/ucNO4xoUZNRaPHdT33OE
 NJKmVkGKCeojlN/zTuFAvBSMryTkRhK0ZIg==
X-ME-Sender: <xms:0ywsZEU9kTosXtm9xMVmHvBpSXOyhhaYiSyG-vTzRDi98PMdazy6Yg>
 <xme:0ywsZIkwdQaFCuafs8KiVxgMpj_4iYmp0V4u_8kymaDh0kcG0zLP2yEL0x8Box1dI
 hVW3Q2NkS-Ljeo6NXQ>
X-ME-Received: <xmr:0ywsZIYYLY2wbZOpMP0CT77wo3iyxFLVoqLFCvQrCoYb42LTqRYTe0lmsHkpK7yp-tZNn2L2oWV4R4qx1lv3Upl9aOiZOHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0ywsZDVBp7S0dTcn0tbj4qyFlhxKc1paiZMZUSBL2lnmrWWRS2lFuQ>
 <xmx:0ywsZOkl7H6YlVZlzb-IsZ9e17Gr8RmN_Evfr-ZIif1dPf-9eeVFNQ>
 <xmx:0ywsZIcWTrYjnm58seBGp8kmXkWCf3Vr87pIlhiyUbCtX0hC-jzShA>
 <xmx:0ywsZLRHA3edxLC2TiRNS2UOVUcVggF8WrUSjud1EKApR0fMDaW5Ww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:51 +0200
Subject: [PATCH v3 61/65] clk: tegra: periph: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-61-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3264; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wBzm9loebzLQRXcnubfF10jq8g/eGSx7ipytoVGA96U=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37dnH5dIOlnuFdgsd2Thty6p6xfecLTNOyB7OCHw3nee
 s+tKO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRDaEM/4xTti9na3ATXbCR54Llp8
 v/X69Neaucwc9s0BC3qflm3BpGhr38F9Yrs9bPyGL+vbTu/LK2fet+fs2cl867mu1zsPYfDzYA
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

The Tegra periph clocks implements a mux with a set_parent hook, but
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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/tegra/clk-periph.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 367396c62259..ce8cab5f1978 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -45,16 +45,22 @@ static unsigned long clk_periph_recalc_rate(struct clk_hw *hw,
 	return div_ops->recalc_rate(div_hw, parent_rate);
 }
 
-static long clk_periph_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_periph_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
+	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	return div_ops->round_rate(div_hw, rate, prate);
+	rate = div_ops->round_rate(div_hw, req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -130,7 +136,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.recalc_rate = clk_periph_recalc_rate,
-	.round_rate = clk_periph_round_rate,
+	.determine_rate = clk_periph_determine_rate,
 	.set_rate = clk_periph_set_rate,
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
@@ -154,7 +160,7 @@ static const struct clk_ops tegra_clk_periph_no_gate_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.recalc_rate = clk_periph_recalc_rate,
-	.round_rate = clk_periph_round_rate,
+	.determine_rate = clk_periph_determine_rate,
 	.set_rate = clk_periph_set_rate,
 	.restore_context = clk_periph_restore_context,
 };

-- 
2.39.2

