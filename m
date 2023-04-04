Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5916D634F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5688410E423;
	Tue,  4 Apr 2023 13:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07E410E408
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:38:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 22E655821D3;
 Tue,  4 Apr 2023 09:38:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 09:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615498; x=1680622698; bh=/MpuhC2YV/sI8MoX4HIHj0oAsDLEqasTb0C
 TR5BBjJY=; b=CP8eNe+p8jkvI/XFmojfDP6JgP+NsW1GhmTRG8j8FYMOpfqN2Ti
 POZj55Jrn/tN2oqcPc7vrO3b8rLVPLHa7XluWTFX6Dtrg0poCWmvrN5ATWWk65st
 7HbH07L9qgOtiPzx2FhhWzrfxYoJViiytT5VIPOEpswLn9s5/dlwte+Wa/Kn5reS
 xBBGGfmVQqvk/9qTMJto7DN1RUuo/7lb97jbqU7POlRDZ/z9VXKFW7qZjfj3xA4K
 OEQMiFaz35RY/Q7klIU9+8SynVUIFxYnnLVT3tDTqc6UUlteugSJLTLjs6EUCiGa
 6DR6wHKJEmtCYO85S4zzLCg5Sjw3tXvrijQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615498; x=1680622698; bh=/MpuhC2YV/sI8MoX4HIHj0oAsDLEqasTb0C
 TR5BBjJY=; b=SUDGJ6P/qMg0QLe+433nAUDUMUlxoL9P+sd8/8Bqw2ta4WUJ5vq
 b/Tsjn+CvKOn88uazrKsHC2S0udjrxyE40X/NDGuM5Jh48Rj7QruxvVmbLy1VQRx
 dg1XAsMNMLWIPxN9JEKYOgixceMrhmpclaPnX3faZgNqZ4mFvjEdeQC9NaJeocsY
 xT1z+sBDKjrerYiuT4BTqmbmNrasGnb22GqdOH+G34NOpvEwSudntzxZctAKOmHC
 uXMNlO7X3dIL1ksEEvcouCQW7/YACgygJea2HnjYcMdvdhDDTY8A+SkD5YEEkm4c
 BheDIWxePYU2gIfxy/HHltZG7LkXeoGGsvg==
X-ME-Sender: <xms:SSgsZBnzGzjx-eYXglI-1FxPbxH_BD8l5xCzOkmWSJ5gWLf9dQGd0A>
 <xme:SSgsZM0TURFs67gu_XTA44_c5J2LeH3pR-JkvV3r49EapCAMHW4zXVC0W9k41kXNs
 BFTgpJuSv56YtBYIbA>
X-ME-Received: <xmr:SSgsZHr0qzXukls0NkUNcc6mlTTWq6V1MwyzZZYcfOrvb8hykTXmtRs8YHet1cEnbtKaFjYm5YgAuNGxPDF5Z2VEeRweSDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SSgsZBkgOMnfOGhpfWED0p38EI9zkCSQXHeQ9lvVnqUx3dMa0XaFww>
 <xmx:SSgsZP3kC5tmFT_-JesJEvDZGdmt5LV59TWBN7Gi4pomSjqwIXdPiA>
 <xmx:SSgsZAtq7rNhNtzu4Kt2VtksIu_85RuFr70JIoR3d5_fUlkLaEUNxA>
 <xmx:SigsZOgWzEpKwGUsXGM7wTp3kkALlUpC_VZQwx_IbGc0dHqfs8jYeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:38:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:42 +0200
Subject: [PATCH v3 52/65] clk: si5351: msynth: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-52-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4438; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oChopgY1SKNjR7hsmEncnv8U/Kn+Y19rt/o3e7AEhiI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37c7r+CXinXtEz1edCvLYrr3hc3RBRvkX65ZbihcFrvo
 14EbHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIWwXD/3K70uwgyYmHWGLCCua3Ln
 v+4GPu1k7tU4mGy30zI15V72P4K7eYJfb1j87VjXmLkyra9BUqUySY5+wNNnsr7C2U+y2ZDwA=
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

The SI5351 msynth clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5351.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index fcf5785ba4ce..bfab05f4fe28 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -642,11 +642,12 @@ static unsigned long si5351_msynth_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)rate;
 }
 
-static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int si5351_msynth_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned long long lltmp;
 	unsigned long a, b, c;
 	int divby4;
@@ -681,10 +682,10 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		b = 0;
 		c = 1;
 
-		*parent_rate = a * rate;
+		req->best_parent_rate = a * rate;
 	} else if (hwdata->num >= 6) {
 		/* determine the closest integer divider */
-		a = DIV_ROUND_CLOSEST(*parent_rate, rate);
+		a = DIV_ROUND_CLOSEST(req->best_parent_rate, rate);
 		if (a < SI5351_MULTISYNTH_A_MIN)
 			a = SI5351_MULTISYNTH_A_MIN;
 		if (a > SI5351_MULTISYNTH67_A_MAX)
@@ -702,7 +703,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		}
 
 		/* determine integer part of divider equation */
-		a = *parent_rate / rate;
+		a = req->best_parent_rate / rate;
 		if (a < SI5351_MULTISYNTH_A_MIN)
 			a = SI5351_MULTISYNTH_A_MIN;
 		if (a > SI5351_MULTISYNTH_A_MAX)
@@ -710,7 +711,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		/* find best approximation for b/c = fVCO mod fOUT */
 		denom = 1000 * 1000;
-		lltmp = (*parent_rate) % rate;
+		lltmp = req->best_parent_rate % rate;
 		lltmp *= denom;
 		do_div(lltmp, rate);
 		rfrac = (unsigned long)lltmp;
@@ -724,7 +725,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	/* recalculate rate by fOUT = fIN / (a + b/c) */
-	lltmp  = *parent_rate;
+	lltmp  = req->best_parent_rate;
 	lltmp *= c;
 	do_div(lltmp, a * c + b);
 	rate  = (unsigned long)lltmp;
@@ -749,9 +750,11 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: a = %lu, b = %lu, c = %lu, divby4 = %d, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), a, b, c, divby4,
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+
+	return 0;
 }
 
 static int si5351_msynth_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -791,7 +794,7 @@ static const struct clk_ops si5351_msynth_ops = {
 	.set_parent = si5351_msynth_set_parent,
 	.get_parent = si5351_msynth_get_parent,
 	.recalc_rate = si5351_msynth_recalc_rate,
-	.round_rate = si5351_msynth_round_rate,
+	.determine_rate = si5351_msynth_determine_rate,
 	.set_rate = si5351_msynth_set_rate,
 };
 

-- 
2.39.2

