Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA86D6349
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70F510E68B;
	Tue,  4 Apr 2023 13:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7705A10E689
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:38:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B70DE5821CF;
 Tue,  4 Apr 2023 09:38:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 09:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615491; x=1680622691; bh=HQYBH6pR5l8T4zf1jkgJLUxQfU0xJvQPA77
 uSCncsl8=; b=gDll+D//dLn2H9oUyk2poa78uxTyhBrCt/K9ExQSGOVki7MNCHh
 XkPVVGFp9ySwGKEisG5U0mPyu6w1ICNuQjkO7mlqc4I2jGXF1CWl56NuSx/zg6AK
 KXfmxta/6gviuhJCFzIlxxVi3cHAa1DfggBtZfku0Hm78h+PXKy4Fc1L310bwI0D
 oZDBxsJE09CR8VjEwWwcYq/D3njf7aERqFbWZGr0F9+lPrL5wRYxEAi837pNmjYq
 kfxIvnFCpuGdMWtUfFtDhzt0dg+wsmosjBv6+cBFoZO5Pn1krMbkzGhglmm/4txb
 d1jE/4iiK3u8NgGcc7ZPhg62FioEbzWidrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615491; x=1680622691; bh=HQYBH6pR5l8T4zf1jkgJLUxQfU0xJvQPA77
 uSCncsl8=; b=gqL8bRDHPOQhLnVdgnzv+z6AYKQ6z/odKjk/mVvqOD+3QeOavAh
 Nmf+T0aaTKU8dsJXq4ZYseAhubhk27Ahl9iq1aJyE+Db1rW9Q09TRYnS1wqTuX+k
 s6miXBPDCHTV/bqZeH+6gCgG6W3ygHmefdeUvjFAgDI6x6XBMkrzk3NZXEQ+vJrP
 TlxkOIs4Z9tkme844TDkhaoTYWLZYR/2X7TKhvpqH8B9oRaWTjMRAToygDk/w2Qs
 0KJ/VX+vQc/GMEui6ijfFGhsAAWiUbfvTiFrfeWWdrAJ96XCCnrNJcE/kuYsJWxQ
 QD0CIeJpl5whd945AU3G2Xs+fN2FFAnXLoQ==
X-ME-Sender: <xms:QygsZPDSJ2v3yJVJ3u4lJb-KEQfwKUJdHNvG_WiMfvenmgQgqIcstw>
 <xme:QygsZFiMrkTpRIf_nEujkLKYfo3uiG_2hS51Lvgy-Cn6OcJbvorgMVR3HgYlHevXz
 HuJ5kCGeAGUf2vPxKc>
X-ME-Received: <xmr:QygsZKkp6bjD07e_AHWOmBPxHo9KZKHBTX_lgnBDPpxsXLz5vxojeVqO5fTKLr36LAc-vfoC9udgFrYFgAGV_oj2yjwkLck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QygsZBz_Y3EcV4YqZIcw0eg5tci1Xe-6J6DMpLQGKT_aekI-Md02zw>
 <xmx:QygsZESL2tA2nzw2X7zoSs688rUbdNEEhfvhR3ItIsud8QelwaP0ng>
 <xmx:QygsZEYAwyGwPPif7xKc-OixH7ZaazXXmYzhCS3kKsBW1JMko8Bx9w>
 <xmx:QygsZAd-m0heWNyOJw92NVqwpZxchXTCoxWkcOpgojXsZ7yj-M1NSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:38:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:40 +0200
Subject: [PATCH v3 50/65] clk: si5341: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-50-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3368; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TJr+Qlqvih8/ssS4VAFLWhPBQZ6IHmldenSZAjJC7hM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37db103iTLaz3p5QNPPdTBOXI9L2+9JW+P+9zfPNxeO5
 hkZCRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACay5DQjw5f3Ps1ldzWvSa+W5T5631
 lum+V3R5Fs8ywGM6cGZvPPOxj+Siq/9WBYtmftucJMnVclrT/bTTaLW3RYLc34OaejdIEbBwA=
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

The SI5341 output clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5341.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 259861aa2e2f..14792d5ffb4f 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -828,19 +828,20 @@ static unsigned long si5341_output_clk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / r_divider;
 }
 
-static long si5341_output_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si5341_output_clk_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
+	unsigned long rate = req->rate;
 	unsigned long r;
 
 	if (!rate)
 		return 0;
 
-	r = *parent_rate >> 1;
+	r = req->best_parent_rate >> 1;
 
 	/* If rate is an even divisor, no changes to parent required */
 	if (r && !(r % rate))
-		return (long)rate;
+		return 0;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
 		if (rate > 200000000) {
@@ -850,14 +851,15 @@ static long si5341_output_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 			/* Take a parent frequency near 400 MHz */
 			r = (400000000u / rate) & ~1;
 		}
-		*parent_rate = r * rate;
+		req->best_parent_rate = r * rate;
 	} else {
 		/* We cannot change our parent's rate, report what we can do */
 		r /= rate;
-		rate = *parent_rate / (r << 1);
+		rate = req->best_parent_rate / (r << 1);
 	}
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5341_output_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -930,7 +932,7 @@ static const struct clk_ops si5341_output_clk_ops = {
 	.prepare = si5341_output_clk_prepare,
 	.unprepare = si5341_output_clk_unprepare,
 	.recalc_rate = si5341_output_clk_recalc_rate,
-	.round_rate = si5341_output_clk_round_rate,
+	.determine_rate = si5341_output_clk_determine_rate,
 	.set_rate = si5341_output_clk_set_rate,
 	.set_parent = si5341_output_set_parent,
 	.get_parent = si5341_output_get_parent,

-- 
2.39.2

