Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD96D607F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E7810E21B;
	Tue,  4 Apr 2023 12:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D69310E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:34:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 943E358209B;
 Tue,  4 Apr 2023 08:34:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680611647; x=1680618847; bh=aKQBcyu1xCEp3pnz/ncDshuyrzVUSDaoarq
 dSA+1TVQ=; b=sVbiuKtKYYzYF79RPoLm6ZLK2H67CJq4GvzvRauBwF7zGt2R5SJ
 8kRz/vJOdho4v+tDuHxeeh8lLrAX7D3n9+2ObuA1jbat+mFSSEZv+XLnzkEDNMdz
 krHUMkQfVHdEYgOt+ieuIcd1LrV0bztZae/j+WXsOg3VAmi69z+UEB7SQKcpFYOz
 4KUqMABzLhjT//PewB4oTZsMRfZ3Cf2jjMg9qvxsT3I1WTiqz1jme2zGQBH2abPl
 0xSrnik+NElgRo6CjD/lwZqcqDABG0HPiNdyaORFkdMChiIJ3iqYUdD4wIP73Lvr
 wzwQTURdKlfxSKvqSjP7f8ho2AahS7Lkd5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680611647; x=1680618847; bh=aKQBcyu1xCEp3pnz/ncDshuyrzVUSDaoarq
 dSA+1TVQ=; b=lYlkxEHJdJaDuRj9JWFwW4W/IEKYY+NVCE0o5HD8dOqb1qrJrOM
 hR32qBBn+g8dLdT1+gh/W8doPdt1ZDkOkmkBkiRhtc2vDtC6lYxA5kAKjvlsdHl3
 1wyDyosb2pvP9xYyVcEcoXjjcTMc9es8NdkTY5aACtRCW5XhXgI3UtBvLRi26dMG
 ry4dMr1skfyAth3BsvUIRC1NDSmaoSYKS5U/wzb65gA4XaNdhqGk+7DYfoU02KuX
 VDLIBOW0CY60Jy613lHXYCdRAYIgJVHGBZV/Gc82T+HUKIlVsnU/jsM2Ti4NG7j4
 nMsGTkGhkEophXYl+UVvynDXyCwEDlTujiw==
X-ME-Sender: <xms:PxksZJ6cm-5Bn--BY1_PY2S2i9nUGjy2IRvX9MRRaatAELWvfQD84g>
 <xme:PxksZG6_lRR2LVr6zXyyODG6xsevMrnYr7Ep6b1RpFMg9TasD1Fzoa9ejn0FMwTwn
 4AfElyWHP52hUa1eu4>
X-ME-Received: <xmr:PxksZAeuhyIVHc_5a528S4ap1fhBWvEE1LKy48XD3lQTpTT2Z7oglUcug0TZIDb1nZtA1cWarN5zEtYHAGQznAiWdjsXTnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PxksZCLPdl-FWqY5k08dvBaMmbWH0e6M3alZKJBwRgpNWKdyjjg1QQ>
 <xmx:PxksZNKBSg9rfEOxpe7RrFjzOrA7ynQX9elO9XdCB_kNJ3ldoHiDOg>
 <xmx:PxksZLyO2r1FhlM8xJpMJcdc11CA7bER9yI89t9yR1z8sJf17L6FjA>
 <xmx:PxksZJtpwa4Kykb0L55K63XD9tYUjb_MDVsStrhf384DEDrSNiBlZQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:03 +0200
Subject: [PATCH v3 13/65] clk: lmk04832: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-13-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7pINepk4Qb4vcGTSA3P9of/6xW9q0REr615yh84TYyg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fO2nnpTgmv9SMO/r62r5qbreTlS5282S9O5bz4Lv98
 zDTZjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk7l5GhvNMZluYp30zXvPipcvUyy
 nM/EGbL4dr1U7SZt2z5JHEgT2MDD+Udwl45BR/d0y8lbV324/+Snc3Ia0jikpsF9Q3Xn5qxgUA
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
 linux-phy@lists.infradead.org, Liam Beguin <liambeguin@gmail.com>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LKM04832 "CLKOUT" clock implements a mux with a set_parent hook, but
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

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Reviewed-by: Liam Beguin <liambeguin@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lmk04832.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index 57485356de4c..f7fbfb09c7af 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1279,6 +1279,7 @@ static const struct clk_ops lmk04832_clkout_ops = {
 	.is_enabled = lmk04832_clkout_is_enabled,
 	.prepare = lmk04832_clkout_prepare,
 	.unprepare = lmk04832_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = lmk04832_clkout_set_parent,
 	.get_parent = lmk04832_clkout_get_parent,
 };

-- 
2.39.2

