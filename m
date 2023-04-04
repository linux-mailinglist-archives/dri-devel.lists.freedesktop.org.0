Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7496D6333
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADDB10E32F;
	Tue,  4 Apr 2023 13:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05BB10E32C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:37:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 313B75821B5;
 Tue,  4 Apr 2023 09:37:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Apr 2023 09:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615469; x=1680622669; bh=2f/GcOwC9A0ZwKNkj3FhXDHyxqI3cZjTVz5
 j/5zG6a4=; b=YdasKTWY9UutI9KwQqigqhxGYK3ML0Gb3XawGuJf2dTogDW+Sp4
 hjqk4JSxnnu1fsz749xiav0a3Rm9hwjE5iB4T4WIRnkEXpiXK04DGkxnXcpQVNDD
 uMpqW/mU/3FkNk4w5+qKVwxXyWa+4r/cZpVuF5VSvdhF6nEs7oOxa2c48+uHmRRL
 diE9/aYJ+ndqVLtWl14v7VffR+fzu6b0T9A4du/TWgDiraNsJRkA/IwT0cjgjj7u
 zeBnh06LAgyD3dLaU36XbvLaDicm0Rwwfhekaga7YjkKiTqfSNH0mBAQlhfUx4U3
 Csk35KszJZtfuf2c+qwC0Kn5uhZBEe9Ej+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615469; x=1680622669; bh=2f/GcOwC9A0ZwKNkj3FhXDHyxqI3cZjTVz5
 j/5zG6a4=; b=R4rZh5eZAhCRXW0ZgLVw0QITTsAmR0Yi8Z6I5bX9y/uUoYyNEvC
 bfXsgHyXrTaIMcQe+Trxn3FeG3gMSAOxfs5bXF7d3Fe3qAxrFALEDPlp85SCD0eF
 TIaXjcLt0xwfM8FD6Z35MiXo5H1sxDnTGk2T76uNPw8Ec0qxKfiF/HvP4DVPfy0A
 xooDMJri9B8zVzVCatzCPGuABVd/KqSKXkuHIyLFeRtfeECy5hCsERiZ3weSC7t5
 rlCZVQ4bRXI99XqS/nHXwkLXzScrXhbUTC9TQ5CMMcI2+osJ3nIcYoPdNpsGTPdn
 isn1R2dLbB0ExtI6eTZ0f3zzUOaToLEw68Q==
X-ME-Sender: <xms:LCgsZAt-gaauDetDLsx8VCTzVJ-j7QEru_j2Q6fJWGnuF11_DJOU3Q>
 <xme:LCgsZNeoekCQKW71k7CfVT37kjflJAZae2XO0Ulks7qHWGAeMAdSpa5mbjE0G4xoB
 KZeBB0vPWJv3sZPbEg>
X-ME-Received: <xmr:LCgsZLxlf7c1Vh41qz1TcrtlwDlNPrQ_LP7zYk-PpWXRBR0-MtYKiawwCXheyvYDOpmef2Q7IKtzfdx9DlNR2Dtu_4wuw78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LSgsZDOl2KyGVQXbcvWu9DVweT7d0A-2bvGBeWUTPr0vJkYLcCAHZQ>
 <xmx:LSgsZA_t8f09pPmHS-QDtHs9wGVXaiARFRplYUznJK-8JjuoKzl8Zg>
 <xmx:LSgsZLUFuIcFk8j-oHCtaUmfnjQNPOOsnXeCoYa0pw1TQdcHF4mH0Q>
 <xmx:LSgsZEp-9uiq07WyCC6YwPTE8mcHWEectda7jKcHcHccL_U6dt1Lpw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:37:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:34 +0200
Subject: [PATCH v3 44/65] clk: actions: composite: div: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-44-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=HtiZLTZxu+0Vc/tuIwwetW0OP4SJJZ85i6en1IS1+Ro=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fNnzPlzLGNc+cczLofr6MXLZ922uqAoZfTnL0fVJUO
 lhnO6yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBE9C4y/I96wsVSzhW6LiX8fwIzB+
 vkqncrL3u/PZgXET/P18a7pIOR4UjAPR3lq98vv1i7+U6IfcJK2ZyPbv+TNPTvOok/8ogM5wcA
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

The Actions composite divider clocks implements a mux with a set_parent
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
 drivers/clk/actions/owl-composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 4c844a5613e4..d66b268563d0 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -53,13 +53,19 @@ static int owl_comp_is_enabled(struct clk_hw *hw)
 	return owl_gate_clk_is_enabled(common, &comp->gate_hw);
 }
 
-static long owl_comp_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int owl_comp_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
+	long rate;
 
-	return owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
-					rate, parent_rate);
+	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
+					     req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,
@@ -152,7 +158,7 @@ const struct clk_ops owl_comp_div_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* div_ops */
-	.round_rate	= owl_comp_div_round_rate,
+	.determine_rate	= owl_comp_div_determine_rate,
 	.recalc_rate	= owl_comp_div_recalc_rate,
 	.set_rate	= owl_comp_div_set_rate,
 };

-- 
2.39.2

