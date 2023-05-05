Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF896F81A8
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 13:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1D910E5D1;
	Fri,  5 May 2023 11:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E430810E5D5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 11:25:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id EAC902B067B4;
 Fri,  5 May 2023 07:25:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 05 May 2023 07:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683285945; x=1683293145; bh=UQKDjmKPSzC7x5C95cs9YOZc6yAVPvrTJ4b
 1utEyhQs=; b=UDQJjfgae9Jy0KKyFS0jdkkFbIHInOjJANJqIPxcx2irxjptzoa
 sOkGAs/Z2RiPml73V/Dyqz18ojQmjuG0m5k2qzRasE2wOduD0CM8Clamakjgpmr6
 cCDoP9q1ou3E91lXfG3zQq94jjWZw7UtQ4ecrXCJNgsgnb0RX7vXIXcU3WAaEa7D
 PrLAjPWKmGuGUZB+qjmy3wiVkZUpVewbtTrg5ySbFZP8gV1D1a8ytRBQ6oMOsLEw
 5e92vJbN6fb877F8q/bLcn8jg76/PM41W/zJ3tFHn9N3jA4plS5kcc3kJ+o8zzms
 2jftE0cuihiOeKakfTVrSqvLxUNW+XVhkgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683285945; x=1683293145; bh=UQKDjmKPSzC7x5C95cs9YOZc6yAVPvrTJ4b
 1utEyhQs=; b=eETp/afWAPWzhC0ojTjFS4E2W8DChqKPKekP/EPuz5wcqmFBedN
 ZE+2I5zoeVPXyzKsIEvFVqbdeKASr4jE/E0HiMkzTedmCrKH7DHijuv1Pr0iz6lm
 mkw6mO2IYBh/nuQLdyKHPD9sAPZo6XHnTGzbJmn9B/JRjfopvt9kUHSt7K7spG5U
 mWrJ8HMVdVXDUOfwWRWWOBbcosSLQzfxtxBGfoiLaSQVUQQwmLExj8nwhCziNLGx
 3WVMizySGqhM98PNWHHPcW+udXkQtb9aSDcQw/m31nJjuplyRlOmetOHAEsIxyUq
 98B8xE3APjy+uJkG8FtMHjn7l8Mdn0KBGkg==
X-ME-Sender: <xms:uOdUZNj3ZpRewkMtfxJ6-ctpOTk2iZx5Ay1l69YUkk0t1y1bBktOIw>
 <xme:uOdUZCCzmcX3Ogu0_MvnPgEHEe5QuKkoSeQ39kZDFWs5CBbm3W3hi8pMTy23Haspl
 MBMYjdHw32Wvd2ycdQ>
X-ME-Received: <xmr:uOdUZNFcQBLQLsDsGRahkPNFqahy8ULrpN3NGsH_y-MOTDZwMw-Gom31V1u7tVnIPIHyGwtAF-f649-KhACFYqJrLXRbNVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uOdUZCS3WqyF5n_W3EiJVuNpMnHgAXUa1OpdnFRLa8UYUgd11F-oNg>
 <xmx:uOdUZKwWniyq1PrG5KiKO_9_icEmzUCRDxijmAeCZ0CdvgtAjfwv1A>
 <xmx:uOdUZI7LJJc_HfCtyAo4xAEhts_dpqgNb42EzjXV5B62USvVCiTKVQ>
 <xmx:uedUZK5NUkPOnYhg1Pw5l4WoybZn50aZGTzwuONG_b-ZzRWQ6TMX7TYzgTw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:25:05 +0200
Subject: [PATCH v4 03/68] clk: Move no reparent case into a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v4-3-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5599; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Pxa6LrZe1o/eBr4UI7umXibSzTm/MpQguARoHEO5XCk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxc5Rstf2bExQeEn73VnY64JKuoy700DJTb9UzzofGj6
 AUHmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk3AyGf/Zn+S0ni19r774wuWmK42
 TRba9ZDL7d93cNy5IJu/ex8zjD/2SHmTwr1himMz9fPun629N1J8OVT1ytvTFn9681xQe/X+YAAA==
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sekhar Nori <nsekhar@ti.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-sunxi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rtc@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Miles Chen <miles.chen@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stephen Boyd <sboyd@kernel.org>

We'll need to turn the code in clk_mux_determine_rate_flags() to deal
with CLK_SET_RATE_NO_REPARENT into a helper clock drivers will be able
to use if they don't want to allow reparenting.

Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "Andreas Färber" <afaerber@suse.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: David Lechner <david@lechnology.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Miles Chen <miles.chen@mediatek.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-actions@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: patches@opensource.cirrus.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 75 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e495dd7a1eae..f57f821a5e5a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -594,6 +594,46 @@ clk_core_forward_rate_req(struct clk_core *core,
 		req->max_rate = old_req->max_rate;
 }
 
+static int
+clk_core_determine_rate_no_reparent(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct clk_core *core = hw->core;
+	struct clk_core *parent = core->parent;
+	unsigned long best;
+	int ret;
+
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
+
+		if (!parent) {
+			req->rate = 0;
+			return 0;
+		}
+
+		clk_core_forward_rate_req(core, req, parent, &parent_req,
+					  req->rate);
+
+		trace_clk_rate_request_start(&parent_req);
+
+		ret = clk_core_round_rate_nolock(parent, &parent_req);
+		if (ret)
+			return ret;
+
+		trace_clk_rate_request_done(&parent_req);
+
+		best = parent_req.rate;
+	} else if (parent) {
+		best = clk_core_get_rate_nolock(parent);
+	} else {
+		best = clk_core_get_rate_nolock(core);
+	}
+
+	req->rate = best;
+
+	return 0;
+}
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -603,35 +643,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	unsigned long best = 0;
 
 	/* if NO_REPARENT flag set, pass through to current parent */
-	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
-		parent = core->parent;
-		if (core->flags & CLK_SET_RATE_PARENT) {
-			struct clk_rate_request parent_req;
-
-			if (!parent) {
-				req->rate = 0;
-				return 0;
-			}
-
-			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
-
-			trace_clk_rate_request_start(&parent_req);
-
-			ret = clk_core_round_rate_nolock(parent, &parent_req);
-			if (ret)
-				return ret;
-
-			trace_clk_rate_request_done(&parent_req);
-
-			best = parent_req.rate;
-		} else if (parent) {
-			best = clk_core_get_rate_nolock(parent);
-		} else {
-			best = clk_core_get_rate_nolock(core);
-		}
-
-		goto out;
-	}
+	if (core->flags & CLK_SET_RATE_NO_REPARENT)
+		return clk_core_determine_rate_no_reparent(hw, req);
 
 	/* find the parent that can provide the fastest rate <= rate */
 	num_parents = core->num_parents;
@@ -670,9 +683,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (!best_parent)
 		return -EINVAL;
 
-out:
-	if (best_parent)
-		req->best_parent_hw = best_parent->hw;
+	req->best_parent_hw = best_parent->hw;
 	req->best_parent_rate = best;
 	req->rate = best;
 

-- 
2.40.0

