Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F16D6344
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0794F10E689;
	Tue,  4 Apr 2023 13:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E4510E68B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:38:09 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6CD035821D0;
 Tue,  4 Apr 2023 09:38:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 09:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615488; x=1680622688; bh=w/NGMFrb8QTcCuZ8wdq85ubGDU5tXhnYdVU
 vLJSNPlQ=; b=L9mGQKkw5iXBXyEodA3GoaRQvXenxma6gy8ZlZhYU+rKl8AOmMu
 zi0znMfYY1Aexcn0gbp0iwJiY9Yx/GN5aJ128m4rHDRO1PKXLY5pQ6zWO3841Iy+
 L7reSMBUSmo2ggPk6VoVCZsopOu69T35yvvBc4rPRlkpntl4+anYvXgqIenhT1PB
 mwv+pFQZPcPUAj0x62FfJalroZNDBOZZ8lmQMZTKboWvcd+mWhm/Eb3sXUOKYu+J
 bV5U6hUUNMjPSCSdJD9s3tktKwssuRCICDgnM1AyuLKVHy/CqFyJFjdym5XUCrDa
 07krSHRXPrtDHgqaOk6A48B6mghVO9H5fSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615488; x=1680622688; bh=w/NGMFrb8QTcCuZ8wdq85ubGDU5tXhnYdVU
 vLJSNPlQ=; b=qszeYJ9KKawsd0PI0BDrFf3it3X2f7FBo/GfNnwQ98axiRNuZIR
 FkdfurIhddpdFeNrERlZTW8JHJBCH9BfmDZucalqj7rxDw+iB6gT+Zn650fKz4wP
 QAvzUnSeFSuViEzqlR4pJtWMu861lnbpqUFWk77CKL7AvBGk/XahX/4/OjqGyAmJ
 RgLIiRZIDFdVkTymgty8nDYsqzsg0qxTvRQq6pbxH5sam/2pTs5hm1oVcxOK0SqE
 XFZ6kcfyjXCeg0obwCMW4J0I1NS1H/BOF9klWNW6/Sc406u2YQ2SY+YYXs7MYHW9
 9N2L6ZSPQOO65x9tmETVD3VVXyFHUVlLeRQ==
X-ME-Sender: <xms:PigsZOSQCsuTbQAXzdkgdZ_73avX9CxDvHkXluQ0aJZ6qDpCEhjEHw>
 <xme:PigsZDyl0oP9QSGYaqn3xV-RzlmTtJjBH0JE1ojxwHhNHO84ToiWLvlNMgD_uQ9RQ
 nj4hS1NQdSkA7ihi3A>
X-ME-Received: <xmr:PigsZL2a1LMs27BcBcpbNf0To7tuX4xAY4F5geNEYnwt9cYQYWAhb9JY0C8a3yNNhPqltZF9HLlQfZ7zbGtbmDYd4xVx7FI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PigsZKAcq2VqUbtbevJJ6fc0bnMQboxB2uC5FVOnaJnFChfLLzXg2A>
 <xmx:PigsZHi0VmWCNV-_oYNnnfMag39Z32TIDcDlakmXSTfYkFlhWI5jbw>
 <xmx:PigsZGpDlfur7Gtuj2LezOtHg0KbRvA1PJpLC64H7656-wZZqORaOg>
 <xmx:QCgsZFtUafpgQJKBCPZ0wyqaa2qwx2xHM0bZR6labn-XoSMuyLqQyg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:38:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:39 +0200
Subject: [PATCH v3 49/65] clk: cdce706: clkout: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-49-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8333PeT2/KzWZhagDIwcVPKozf2PZUw+5v/6zOhmLZU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37f76B24pX2OTc1NX6pqLdeXG+rBOSkzctfwePloGulL
 CQt0lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCJ/jjIyzO+/dHHa9JU3nzkcm5ASdm
 7yz7QKnbTTC+U0F+1+q/juzyFGhmtnr5ooWM0yP7TpbZnSpDyV9NIPk5Pkttj9qBFWdv81nxUA
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

The cdce706 clkout clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-cdce706.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index a53769d239a9..0a560b4d295e 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -423,11 +423,12 @@ static unsigned long cdce706_clkout_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long cdce706_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int cdce706_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	*parent_rate = rate;
-	return rate;
+	req->best_parent_rate = req->rate;
+
+	return 0;
 }
 
 static int cdce706_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -442,7 +443,7 @@ static const struct clk_ops cdce706_clkout_ops = {
 	.set_parent = cdce706_clkout_set_parent,
 	.get_parent = cdce706_clkout_get_parent,
 	.recalc_rate = cdce706_clkout_recalc_rate,
-	.round_rate = cdce706_clkout_round_rate,
+	.determine_rate = cdce706_clkout_determine_rate,
 	.set_rate = cdce706_clkout_set_rate,
 };
 

-- 
2.39.2

