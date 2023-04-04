Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013366D6336
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C1E10E326;
	Tue,  4 Apr 2023 13:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039FF10E32F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:37:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5BF9D5821B6;
 Tue,  4 Apr 2023 09:37:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 04 Apr 2023 09:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615473; x=1680622673; bh=9Im+4uF1Y1TWyriLnaoZZgBXrAkNQSpZDwb
 QAD+dh3k=; b=Z/WQMY1/exkEw5U0lYVPxk+eSrO976KSusR6685F+fj7UIfyx0y
 iNX1Nxz6fe5MrDw8WtVlVhDKIQaRbwq3KkuU0E66c+lPYXx8SgdyaZwg6egXOnjj
 UhBufbAetEbmDr28HSoRt1RZl7XlR3syCtsjI8Ry3plrW5dFdmg7iZHnG0CkRqUQ
 UOIwNuq8fJphVdkqugSMgonGMCAGToi3IypetkPMjb1tAMI/iad6fXQwPd/8A2XL
 1ZWem6WdJrt3u6vQX5xQZZuc7uGWjr14/H2ZYO4Z7jNDCHYd1SQVqdMLeDTY8zOp
 qZ1sSQ08b47p0/KBulb3WK3MktpYeYoeanA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615473; x=1680622673; bh=9Im+4uF1Y1TWyriLnaoZZgBXrAkNQSpZDwb
 QAD+dh3k=; b=I1cHeP/cESwwf/a6SPze9YtqbmiYvsiHARWu9FjMSQfJGUCn3Hc
 ntvcsJ9ZFYGF32Pwg4xQ8Ay40x0TuSR6KiY0zDlndRfnHEd0DIh8cCXeWo5Jh3Ab
 qdft1YoZ76Y3yiu3adDT6hgvQMxIbrIJnWA6KTx/HHAV9En54mG6T0gvfkOAZz4W
 nkckRHn2NtGNpinGA3It7lug1efOmMK0A7diN8QAoubvoGNXTiHZheDYUR5EP2N0
 J7ZTv0ZQRTFZWNHoAxBoDY0g1zNGrvFqxiH1Ae7nqWfSu0FEkIz6klwqA8VDw+/A
 BNBZlkwilXmiYIUpkrLn4fIxCnIaPtintpg==
X-ME-Sender: <xms:MCgsZFnrcDoBqMS2N-WnhZLkNfoUGkJ5RzZGlvu19tSP3Z0xndkg0Q>
 <xme:MCgsZA1HiMEcDTEFsHB7DSI7HPOarQU6hu4IvclGZHLgoZmZ9luDdCV8xblZ9miaE
 5sZijqBgSIOOtDhu3w>
X-ME-Received: <xmr:MCgsZLpGOJTpkA0DuOlVVLBZBbJ2n3239AEDcapYBjlCYEP9I6d9r0XBSCZlCB6gN_ITy7h-kB3wzbQy0pnunjVwi_RvBXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MCgsZFml3G-dV9IkUe9MhNs1jMBuW_2Yt0M-tUJnsduuNpatajenKg>
 <xmx:MCgsZD0h0LX3mtt8fmVcz9tj5od5tCR9vVmCS_CVC-CxBOTb8xrUYQ>
 <xmx:MCgsZEuRnXKkyx4YqbONlz_pAUTMjZYDN-nuH2rwrviPNTgzpOnmaw>
 <xmx:MSgsZCjNY9M79LhpiePHJyHYyDZKnolH572jkSiMbLMmo_UHvp-4mw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:37:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:35 +0200
Subject: [PATCH v3 45/65] clk: actions: composite: fact: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-45-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=QekP+epNmA83sqDmu5lHjN7BcI1AORu3A4RkoTeeLxY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fNm2LqavPB74P47p7MiiUW0pvbNupWs6079EPLrmTz
 zBz7jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEyktoiR4ZhHhp8+q3NEf9jm2Pua04
 yLul9uM6orrXg/6cWEg/svqzH8FRP0Yz3Bcay/zevirk8sfyK0o54Yfst1craJ8MxfsnQWAwA=
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

The Actions composite factor clocks implements a mux with a set_parent
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/actions/owl-composite.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index d66b268563d0..3cac8f0a80dc 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -86,14 +86,20 @@ static int owl_comp_div_set_rate(struct clk_hw *hw, unsigned long rate,
 					rate, parent_rate);
 }
 
-static long owl_comp_fact_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *parent_rate)
+static int owl_comp_fact_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
+	long rate;
 
-	return owl_factor_helper_round_rate(&comp->common,
-					&comp->rate.factor_hw,
-					rate, parent_rate);
+	rate = owl_factor_helper_round_rate(&comp->common,
+					    &comp->rate.factor_hw,
+					    req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long owl_comp_fact_recalc_rate(struct clk_hw *hw,
@@ -175,7 +181,7 @@ const struct clk_ops owl_comp_fact_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* fact_ops */
-	.round_rate	= owl_comp_fact_round_rate,
+	.determine_rate	= owl_comp_fact_determine_rate,
 	.recalc_rate	= owl_comp_fact_recalc_rate,
 	.set_rate	= owl_comp_fact_set_rate,
 };

-- 
2.39.2

