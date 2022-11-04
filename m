Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D11619815
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D562B10E79E;
	Fri,  4 Nov 2022 13:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6317010E7B3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C3CD358026B;
 Fri,  4 Nov 2022 09:33:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568818; x=
 1667576018; bh=TfSsPz+MZn+lbcea/YJJoyg5y0xdpCmmfuBpFmSlgEw=; b=B
 0geBDBkA3tn1Q2efyciGYColZLp6fIWPADf5flf/2kFvggjNddH5Wb9g4FZ4Sqht
 CjtLGnWHVjPpfwRkEDGwdSmWrrl69JlHoViMOXi+lGSsSz1KmmqwmxcDm/omnSXG
 noepxP9BiRgRifCArtHRcLR+0Dp4e9HZ+ltUktlvWVXZbUS6DypPEheNSUwYUyMu
 ekmW9wOg3a6XV59goybMYI2X7Mu/3sF54SaBI2ZQA329AKeLmcvk90TV24mwMKZO
 5GijmiTTQ8sWmYzBXuNIC1EyoDuNRCT8ejeOhsx2/uIJCgpJ6u3VxJh4M1s7VVPa
 7QI1ZUSOtQhrUA6jZIBGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568818; x=
 1667576018; bh=TfSsPz+MZn+lbcea/YJJoyg5y0xdpCmmfuBpFmSlgEw=; b=H
 DWcS+z3HqcXSaW5dzAvn/Yx23G/9kcwBJPfBwb0tE/LKCkRRehJDNbW3GzEpZUsK
 O1Rv0MFy0kDrj457Wae8j/muKIHpq2ZLzdt2BcZ5V5zTwAbny5lPAlqji1r66s96
 HRa/g/PxVi0i7V5o2lyF8DNFwFiHZ+997fs0HiwEVf5TIjf0IATxvCBNoYqCj2wb
 2pmtYogCgLLFoHSr44YtUTly154Qu+mmhR+o4FpxVU7Uq1VEbl8C0u4gZNu+4dmd
 Q80AXUI8vBxGrQSdgj7KvJmvboQMrT7mg8sKSwuJEA0ZNuWm8C6taUijrAcTD84Z
 wnjqnY44D9uhV6VgWeuHQ==
X-ME-Sender: <xms:shRlY4Gs67r-jSDUXh4uAASx-KauMIrY-B_CiO4yAH03p8N11_EBfQ>
 <xme:shRlYxV1NoAKJx6vBln3inGWzj331pQUAXC4AF4ZM5__bryF_D6GtevbhMSvc4SXy
 SXXnjJ1lhhWIJ-Kv44>
X-ME-Received: <xmr:shRlYyIQHaHMFS0uR9O41c6LvP8EoCQLswC6uX9oPSl7KdS8IZR9tmWQ5HhwpuTazgdvU_HCgiHM1ghTG7c_WqRFRO412MApblbNTPTBKiY53Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:shRlY6HWGVbRBOSeKozaky1Xs-zzMnly5CyChLCmP2HCHko8B5Spug>
 <xmx:shRlY-XMhJYRtmtprn9tKgeofcLTxXFuuJpHfnPXKpTWK64yurAEPQ>
 <xmx:shRlY9OXo2B7Y9zfNpncK_7MhqXCAATn3UxAjlqIxBY26U5HqmHRnw>
 <xmx:shRlYzVY0i6xad-oUJ18aZQZLInt-JmMzpmQknb7pt9HziVeFmu2Fg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:09 +0100
Subject: [PATCH v2 52/65] clk: si5351: msynth: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-52-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4451; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5ogQpKqiR/Y99yWhmkgF+w2Os3xi0Hh0gjEz2wUXMoE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8f/tDn2VDyKGuvB+s6Tr4Me/lUuz3VG3/fqNjzS2bF
 tRkdHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIyn8M/wynCl60qVkUViNhc/fw7S
 9BqeqRf6uslgd3HK66ZJqXmsDIMFnv+Omc8nf8zirCilf0eHX75I8+W7tMbI+h28H6sMoAbgA=
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
b4 0.11.0-dev-99e3a
