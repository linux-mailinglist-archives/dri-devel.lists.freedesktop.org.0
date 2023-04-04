Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA206D643F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A177610E6AE;
	Tue,  4 Apr 2023 13:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B0610E6AD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:57:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E6B0A5821A3;
 Tue,  4 Apr 2023 09:57:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 09:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680616649; x=1680623849; bh=6sLEHhpe6e4ztElMjcID/0X5XZa9ISiEqsa
 KFJ6eVV8=; b=t5wlWGxVoCbIdmzx0235D3JSXtApugbMR88FiMPPAq+Pw6TC3G9
 CwhT9TBa3fP+dVIa6ZVulR5B+ylYb82tc1aG6JocLRG/7uOQ+gjyj3Bka3wTQDhH
 A1oGJbe/iZM0/KFTR4ST6i9kHHXlF99tzoDXOizK+jESNKSR5JUJjFZJJtpxuzTo
 81yzSmZSEzFnjFwr+/I++N1jYfXysOR2eiIxdTtIeqlHTxwTjh46qGpOvuLIUeIi
 kr6WmTiU4L3mjFdqsJnu0SWs29H9VWhk+ZeOuHdUyO35KWVk+AedzU0my7cYLk09
 r0N0sRUsWwefkjEQG5SxT/G7cXk7ZEXVx0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680616649; x=1680623849; bh=6sLEHhpe6e4ztElMjcID/0X5XZa9ISiEqsa
 KFJ6eVV8=; b=BL6wuEKdUiLJWOxbOYWAHCX+lY0kA4hGWZjQf2hjk+GrG7hpwyg
 agcfKiDauI67HW1cXStS64LDjvK1sw9I7Kj0l4GBhpygcP14i5Fo5DEiPXhJSnfy
 MJpey2LZK1jrTyO0LwuOXI/5auRitSFsXoU9aMBZ9vV0t/IPO2JEdDcd6iieJcxo
 y2VTfgqwa1XlxCTNch3EtWi/JAgO+MsdfmeecUclyGzl7wfOsaR5CZ83a5hqYLXm
 8Om0oUhusTcznLCzn1gR36XPYOnU38LUmoBffsZA20TKOeAFMMaUVp2Jadd4KwlC
 +gH62wKUFXSO3cDeYndqpO8x+xcRTxhOqKg==
X-ME-Sender: <xms:ySwsZBSBjlL4-u0CpClcThqbq6J_sqOFzcYD5pJCc4Ivv4ygPf7rVg>
 <xme:ySwsZKwJC81JyipPSFvQJY3IeAnbR2-xH3xZ3gijv1_NqhmHCRAYj2248Df3nexrZ
 -Or85EIXAiWAgKa25U>
X-ME-Received: <xmr:ySwsZG3-U0IR-FELhs-9Pd7xmYSoTsUSGnXZLNhn8B1vz4ngX2m3WwB1yxrPQ4Jh2cj7Q7XPG6QcLlTpZco4_eioC_hMsxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ySwsZJCuuAuwmpWNMnMchW4IccgxIU50CzVmCVMan-nh--yi2jj3bA>
 <xmx:ySwsZKh3e_M-XFzkEpRsrAWZn9Htyz_kqnZ16NXMmAzBP6r-0MCdHw>
 <xmx:ySwsZNp-2RjllcY9FB9Y534krQzZFTOdOeOide2lSG1iPc3t9paQHA>
 <xmx:ySwsZAuj2WEt4JHaSkjcN2b2aXnEcDwDTkdszO_u7y12A97SQblnJg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:48 +0200
Subject: [PATCH v3 58/65] clk: sprd: composite: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-58-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=S/6RwdDznUTjbdmamyEhwoVXAAs0ePM7xj3izMxu8ks=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ebF7fXqnRwzN86+V+LWiD/6oKNGYV1RnOP1DYnxeQt
 TkvvKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwETWb2dkeOcf9qK38/e+RyfnNwcv2+
 wWnuU6O08vl3nF5J3NxT/lHRn+CvbXXggWO80hPO//jd97G0r/yfj/eFbFoldwT+zA4g+TeQE=
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

The Spreadtrum composite clocks implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/sprd/composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
index ebb644820b1e..d3a852720c07 100644
--- a/drivers/clk/sprd/composite.c
+++ b/drivers/clk/sprd/composite.c
@@ -9,13 +9,19 @@
 
 #include "composite.h"
 
-static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int sprd_comp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sprd_comp *cc = hw_to_sprd_comp(hw);
+	unsigned long rate;
 
-	return sprd_div_helper_round_rate(&cc->common, &cc->div,
-					 rate, parent_rate);
+	rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
+					  req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
@@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
 	.get_parent	= sprd_comp_get_parent,
 	.set_parent	= sprd_comp_set_parent,
 
-	.round_rate	= sprd_comp_round_rate,
+	.determine_rate	= sprd_comp_determine_rate,
 	.recalc_rate	= sprd_comp_recalc_rate,
 	.set_rate	= sprd_comp_set_rate,
 };

-- 
2.39.2

