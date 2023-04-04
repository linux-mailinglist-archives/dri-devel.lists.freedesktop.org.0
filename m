Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECAE6D633D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5803D10E684;
	Tue,  4 Apr 2023 13:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCDA10E66F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:38:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 819235821C7;
 Tue,  4 Apr 2023 09:38:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 09:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615483; x=1680622683; bh=ZmeTd+2tJoJrgSEJ1Mv0Mrs4o2Pnph/H8fx
 k6uUpjYM=; b=lF9QT9v9aGzU3Ou4i2YBzgjWZWJ2bFph55QyAXz/WEkFzANG3Do
 YXfvwbjeLs+/HYAJbJJn2PGtWYcCr8U9GzN31PgMyiHmjQPk/WPpY1k9KQ+dN9yT
 dXfvdmpxy9FsurlCRiWN5XZFqoWYYLvdHGXJhdE2fVEb+d1sqfoa0hgaxkw2vkOv
 lfKiCk0ZmvBWZ9ULizP/uXetkkhLEKAaaLxLiDOTeF5WqNukjKYDbJnHlc6l5M/8
 Vi2uxI5zrP16dIhdsIe19xcfMnpi1lGDVi5g4lju1aR0H477jha8/vbHYr0Yu4ZN
 ghm3vdgDC4vYfY7M+/fyI8lOs/ukV4ciOtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615483; x=1680622683; bh=ZmeTd+2tJoJrgSEJ1Mv0Mrs4o2Pnph/H8fx
 k6uUpjYM=; b=ff4kHs/UOI9xCsga919p5U2s0w91UPYYdoU52tk2fWbvNmqEB5B
 KSPW6bD8KPJ02ehfVARC4Gzj2KbblKNJHzRrzeULSA6U29p7tsxIRCMCotxMqozW
 bEeMxe6K4B0uHOCz/PyybwhGPGsMTzyWgMc0LNeXPcCUrDAAHobBdQhkUjQbBAel
 HktQ90LG0VTTcehzhpqqogAyRsM/3B92SqHa4anQwoG0CmCBxGe9hcL9flIPWKAu
 Q2BIsD0qgurxQj2BzplJeffMyBrj4IPTjFZhTaFAQDQ96X5/3akZXlEkeQy5ui1y
 9/jzo/A9wrJMoxo/+8wktA5x9SRcclZxjqg==
X-ME-Sender: <xms:OygsZCH9ucaP0tWMNDXlw3oowRHa0FrYAJ5ANxoMs8_w9licCkh5fg>
 <xme:OygsZDWJ_vaeJVYOECX_MFpVuWZ6vptABVA_xkuzKztpDEHhV5XE2jClA5pR--rs3
 dOqYUruSMgnE5oHpJA>
X-ME-Received: <xmr:OygsZMJh4kP1zPu-sYLafvcsGKk-iwkkhGkoLRixeKQW17CQtzQowIUNsILRGa_l_e0JUl4jph00kJmw7p6ACrGxwK5kvK0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OygsZMFX8-oSdBbUgxdMaes6ZLNTODgy3tiDDnKUD8XDHayoDBRGhA>
 <xmx:OygsZIWHoyoNUWobZet0UDBUPai5Wn917a3kV3sl9wvWheUMblqAig>
 <xmx:OygsZPPN5NiZDhj5ee9-U4nEuSau1m-mUY8I973Mj4dePQ0gleeyMQ>
 <xmx:OygsZLAgZV8fNqUGboNVTJ7PsVHYcWo-iZ-eDWJWmft-FPN8eBuQrg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:38:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:38 +0200
Subject: [PATCH v3 48/65] clk: cdce706: divider: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-48-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=zMJ6UUDoX1CUKTbtefynEs3bRwgzTnh8sE29fViRc4E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37f/2eI5+3/myXPTsouL2z+f11nlZJoVMVNDruxDTp2w
 yn3+jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkuyYjQ9+V6Y09B5dk8zQ+rtT8+2
 H/e8cMnfY3183W3f3/k0+Ax5SR4S4vo1n2ERf5c/eyLylVb7qQytjl9fnEs4JtUw2eb1AqZQcA
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

The cdce706 divider clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-cdce706.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index dc046bbf83a1..a53769d239a9 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -288,18 +288,19 @@ static unsigned long cdce706_divider_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int cdce706_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct cdce706_hw_data *hwd = to_hw_data(hw);
 	struct cdce706_dev_data *cdce = hwd->dev_data;
+	unsigned long rate = req->rate;
 	unsigned long mul, div;
 
 	dev_dbg(&hwd->dev_data->client->dev,
 		"%s, rate: %lu, parent_rate: %lu\n",
-		__func__, rate, *parent_rate);
+		__func__, rate, req->best_parent_rate);
 
-	rational_best_approximation(rate, *parent_rate,
+	rational_best_approximation(rate, req->best_parent_rate,
 				    1, CDCE706_DIVIDER_DIVIDER_MAX,
 				    &mul, &div);
 	if (!mul)
@@ -344,8 +345,8 @@ static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		dev_dbg(&hwd->dev_data->client->dev,
 			"%s, altering parent rate: %lu -> %lu\n",
-			__func__, *parent_rate, rate * div);
-		*parent_rate = rate * div;
+			__func__, req->best_parent_rate, rate * div);
+		req->best_parent_rate = rate * div;
 	}
 	hwd->div = div;
 
@@ -353,7 +354,8 @@ static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		"%s, divider: %d, div: %lu\n",
 		__func__, hwd->idx, div);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static int cdce706_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -375,7 +377,7 @@ static const struct clk_ops cdce706_divider_ops = {
 	.set_parent = cdce706_divider_set_parent,
 	.get_parent = cdce706_divider_get_parent,
 	.recalc_rate = cdce706_divider_recalc_rate,
-	.round_rate = cdce706_divider_round_rate,
+	.determine_rate = cdce706_divider_determine_rate,
 	.set_rate = cdce706_divider_set_rate,
 };
 

-- 
2.39.2

