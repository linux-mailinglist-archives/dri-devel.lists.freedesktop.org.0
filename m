Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54236619817
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D7810E7BB;
	Fri,  4 Nov 2022 13:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC4C10E7B3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D9ED0580269;
 Fri,  4 Nov 2022 09:33:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568820; x=
 1667576020; bh=3Pt3v/H0yw0dXfcmwyxC7Cglg777DQnqTx8XySYty5Y=; b=v
 bq650g4m1kc+mTssR8G3hUHWtmzk6HWmzmDYxWET2WeAIT5RacoCfReO3QJFRAew
 O7kevyKk3h+BJegvfYuhZeeJjz+0bPp2k8LJdftjMu5S1vJ3iyUdV6kTPnD1nBC1
 ckk64G6dLPZVYZp1pm6PFALjMW5+3lNnnUK+l7u7QhKz04l5Oq2Op2eCEhsbtJyu
 bmIRDR55HPXmKpY/BX3IO2A6+WJQobSWATuWkCDouEMrkuVp/FibVxjvf2GeX77N
 qihlSTm7kSSeMEW/1AnFCGJMiq5LwClROQncZ1NpPBUoD+H0rLjenCxSskQ/QDdl
 mXeTnZe/YQzWZe9BiwrjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568820; x=
 1667576020; bh=3Pt3v/H0yw0dXfcmwyxC7Cglg777DQnqTx8XySYty5Y=; b=K
 UfyODrCNu7vHDkihjvwjQepdDj0WMs4+PbeT2oWWcje1EMMrtCxL6rHgINwAmXs3
 D4EEibqfGdT5A1fIVDleVgUjVF6tjyEDmnKhJE7Nw4udTEFD/PY6Lwk78vqtNk05
 niN5spia/OEGpobkX291LiARzYkfvhP4pfYtWdCLfjJpHcAAMh36EDTM2KJjPWao
 IJiVfrxtBY4BONNWlDq0Sc11VHwdeszzkUcL7XLbSrIvDTe7s/zSNsv4iUO2vqoR
 gUKfhvtD551KUpIgBgwdzGJJH68N+nY9aCwHUzbKa0e4GFAKvmzH1KYVAGguA3DQ
 7EPueGxPZmfRnAlAD1bHA==
X-ME-Sender: <xms:tBRlYzVZYqwQQFIjXYFHPOkEgE9ZhEizJzt8LIqUrba9CpS_Ax1gRA>
 <xme:tBRlY7m11zwhXEo825cUc0tiNMF73WqnGGvoMeSeqMliPRUjNtZq73by8vYoGOsWA
 1ZGfSGUnC6ad8S966Y>
X-ME-Received: <xmr:tBRlY_btCKFqt9UXSpMIpRNcPNwSpkxJ7QQQ08PTfB4rgwlKzsn7q42r8q_EH7N3LIbOXQVCy7sOmPZB1ZKkgDsc_dXmZ0d0pv_PIMlmYYnwew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tBRlY-XBQ45BR3jazUw9eT8-9R5xIHDAbnvHwCOcTITS3gbGMV5ckw>
 <xmx:tBRlY9kQbQTGai9YP8p-nkmXxZw84O8MhuZzSMLkKuiahBB3CVS1mQ>
 <xmx:tBRlY7e-hRarD8lgcTxetmLBIElFMfYDnJUBK9uYFFcfdEfoTNtyCw>
 <xmx:tBRlY7lXmk4ls3rbTHKqsWKL5KCqWaCeTWOBqABzgd_XC4-DodG6sA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:10 +0100
Subject: [PATCH v2 53/65] clk: si5351: clkout: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-53-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=SadWT5O41DNxcKxAO63fE5LsrsyZI5hQrTvwSci3hyI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl+3s9bqN97cc+GHEsORxkjVlN8FEXl/N+xcJ+d5+6bW
 /YkbOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARx9kMf/hPq55YvO2KqG9Svzz3n/
 yZCzRX3m6PEOG/ZFA2WVjIzZqRYZn14W8veQsCbPcqyp6a5bzi4nwOx5bAjw+ubOLvXnwvlRcA
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

The SI5351 clkout clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5351.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index bfab05f4fe28..11aaa934da29 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1037,11 +1037,12 @@ static unsigned long si5351_clkout_recalc_rate(struct clk_hw *hw,
 	return parent_rate >> rdiv;
 }
 
-static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int si5351_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned char rdiv;
 
 	/* clkout6/7 can only handle output freqencies < 150MHz */
@@ -1063,13 +1064,13 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 			rdiv += 1;
 			rate *= 2;
 		}
-		*parent_rate = rate;
+		req->best_parent_rate = rate;
 	} else {
 		unsigned long new_rate, new_err, err;
 
 		/* round to closed rdiv */
 		rdiv = SI5351_OUTPUT_CLK_DIV_1;
-		new_rate = *parent_rate;
+		new_rate = req->best_parent_rate;
 		err = abs(new_rate - rate);
 		do {
 			new_rate >>= 1;
@@ -1080,14 +1081,15 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 			err = new_err;
 		} while (1);
 	}
-	rate = *parent_rate >> rdiv;
+	rate = req->best_parent_rate >> rdiv;
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), (1 << rdiv),
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1147,7 +1149,7 @@ static const struct clk_ops si5351_clkout_ops = {
 	.set_parent = si5351_clkout_set_parent,
 	.get_parent = si5351_clkout_get_parent,
 	.recalc_rate = si5351_clkout_recalc_rate,
-	.round_rate = si5351_clkout_round_rate,
+	.determine_rate = si5351_clkout_determine_rate,
 	.set_rate = si5351_clkout_set_rate,
 };
 

-- 
b4 0.11.0-dev-99e3a
