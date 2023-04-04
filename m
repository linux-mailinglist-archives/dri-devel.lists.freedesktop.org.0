Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412956D6449
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F65A10E6BA;
	Tue,  4 Apr 2023 13:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BAC10E6BA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:57:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 891995821BC;
 Tue,  4 Apr 2023 09:57:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Apr 2023 09:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680616662; x=1680623862; bh=qPb3SMrW2k5cL/51zdQSNPfE7NXdBpPA6gf
 CmqTrM0Q=; b=Fsfr1XJW0zHp56yGNAncBCrKfE90+iKbWMTaCl14yMniEPaaK30
 fFhvAKR84ZXcOCzxOUfk90sy4rGmhdndmFDAijAhOXcKeVLkNXb0xXpknljBoctN
 OH23/gRhIjWstX4vaUcux0r21WDCo8LIvVvtrimOy8KTvRC7cqiewSzeHDgRbHJF
 09grgl0x8QsMRLJr+GrHbOpsn38l7KA5p/fxuNTb++FXzSb1GYax8QAkrlxJ+PST
 tvLdHv/ueuMXr2EBixbKHVZ5Kp+4GWrEbHW1HUbWZpamscB//FIkEemtAlRrJi7y
 1S1NJR3bh0xbDEvV3IAT2R8a1vho78jTAwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680616662; x=1680623862; bh=qPb3SMrW2k5cL/51zdQSNPfE7NXdBpPA6gf
 CmqTrM0Q=; b=NRjuyE4j1+wRSv/0vALRQv7Q8QorqqgLPPEEMhlSldu70y06LAc
 pSXy6QT51PIoDtELrEgoP9WRdfJDrxOAeAuYbPDEVyMvpD74pHW9ICjd1dOE+XOz
 hTq9utinbh1EeYHHisvaWUTMfe4hQJJ6Eff3JQv8HlVLCoxfM6Aebodd691c5DSE
 J0YzQR/5eq6vRLBKnRbyy7AayfCa1N3TklqsZ5yiADWFHH7Hqyw3+q5ZTcn0h0r5
 wAdrumVvTQDB0cA+jbdFLcM+Gr0w3QjJH63YzWRQGIwxm4ylLKaNP8AoyqqdrZd+
 lqM/X6cnI4nWgHuJ5zfkSQlxx66XzWiC6Cg==
X-ME-Sender: <xms:1iwsZKivubfwOSR5Nj0WrihFqZJH_5b_onMF1RdR3PFvS2d2K5zlpg>
 <xme:1iwsZLDWtvQX2NkyZNG20sQaooV9yAHDdnhvPin5GlgDThrq-wEWq1Bnfiz7K1r7P
 XlOsCpU5UVd5Uw1_2c>
X-ME-Received: <xmr:1iwsZCHhW_glzmJgGsrKa8Qrcqk6Qzv8oU01TE9wYVD-3irDS7sMOEiHosD2xfGJJvN3EUSl2dNFIVoFw-2x4RsbAyz56K0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1iwsZDTtsbgWWreAN5ed4sCl-21AF0ukRnijqAc6wo0IbljY065JWA>
 <xmx:1iwsZHx7En94Dk9bcOnXnQnydH9rORG0zSWSNvbz4zR2S9FZ7k5rYA>
 <xmx:1iwsZB6YBpWgP2oUEpWtmDmw0huCUS9TniF1dp5f2nqIyrYQW7-EJQ>
 <xmx:1iwsZP-knlh8GbprLZd5QTtl_xxH2IU3BC89GRCQJhjP5LiZ4Zx4SQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:52 +0200
Subject: [PATCH v3 62/65] clk: tegra: super: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-62-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=scvmGaGh1MkANaa7+EVNqR3cdMd7XwoadoU3AIB53Eo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fvYEgXOvvw1usVz4T/nt7mrmvDyJdhdbJHZml/hRnn
 syUnOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARlj+MDL/6Nj2WX3Dy6S0xV43Zwr
 6PucJqshs8bC0Y6tY6TJZ1s2RkeJd2r60q7tPZ9Kj60psn737x1+L4NPeD0d6ZDu4/k5K8uAA=
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

The Tegra super clocks implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-super.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 8ad62e04fd8b..c035f0eb030d 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_mux_ops = {
 	.restore_context = clk_super_mux_restore_context,
 };
 
-static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_super_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
 	struct clk_hw *div_hw = &super->frac_div.hw;
+	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	return super->div_ops->round_rate(div_hw, rate, parent_rate);
+	rate = super->div_ops->round_rate(div_hw, req->rate,
+					  &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long clk_super_recalc_rate(struct clk_hw *hw,
@@ -193,7 +200,7 @@ const struct clk_ops tegra_clk_super_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.set_rate = clk_super_set_rate,
-	.round_rate = clk_super_round_rate,
+	.determine_rate = clk_super_determine_rate,
 	.recalc_rate = clk_super_recalc_rate,
 	.restore_context = clk_super_restore_context,
 };

-- 
2.39.2

