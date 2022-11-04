Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149361976D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0422110E74D;
	Fri,  4 Nov 2022 13:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDEC10E74A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:17:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 695D7580452;
 Fri,  4 Nov 2022 09:17:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567874; x=
 1667575074; bh=gulfUfzWxrSqI04EuTpJI31rPi0/dfB3rbjvrNMKjxY=; b=j
 xHzL7Cnzjfiw0PGk2c3HMN+PyHDbxOM2uEnKzwVGPtCzb8g3bu3Eiz3Xyexsc//I
 eS6k5W3Op9rsyni8gj3FUiKo46O6VmY+Yn+cedj2E5AkZw35yhxickPQS1dFkcwS
 7EpQk9j3L3hPZdNPSx2Tp4hp1NrDRw/6EuAzr0GkUDXHnkg+KVB8+VHBCa3OIeN6
 HiG97KbdXWEXAER1UyuUfycgukhpXo9yKoP4RlJMZkyD8CQ3w5MF2ZyHA9/+4DMz
 tNwzP+OTA1J8obKlrIJe1slYiwet0dc569CunTXqgx0e27uXxEHFKpAWFs/jJsjT
 skp6xRiKzC6uH3PY8iMdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567874; x=
 1667575074; bh=gulfUfzWxrSqI04EuTpJI31rPi0/dfB3rbjvrNMKjxY=; b=N
 cXu9Kys9Bj+Vx2D3rQoRZS89rl6OSuwEoxKU2uDggMYLKsUEucWr/xdkTEuyTfLe
 4Gbh55NY0v1hs1/44EUfw0UXk/dmYaTUr4AgQB8nwcW6SVUYRVot0WUnfS4goOf6
 VLMYeVNlx/xsVsQTya7UMOgN8U7yPZ13sQh8oyV+CzIThamJ2BSErys5KdaqJ5aK
 Z6wLTHi0EDHZhcvFRVjlKGLtSQjeAkuLiDNUpGh5C9l00gV62N43kkIAZ1LfEjmf
 B1xjczzbpL8i7prAlCCeW0o1e+X40do+K4XyW4DrEjJGhG/mTUtfvXbjWdq3i6uR
 +UPBng6rPnYVVYBl25z0g==
X-ME-Sender: <xms:AhFlY2upIJH4koeKBnyORuAyopysOCx1QQdNGaFQSMdQklGEL9G-jw>
 <xme:AhFlY7dguGM17fNL2Qe0GfYw38EHIAKgQp6Rm45ssTq-S5uvXXxZQXJOKv0259d-h
 9vzACvOadcd9CNsYLw>
X-ME-Received: <xmr:AhFlYxzwee7TPE_98QdN1jV-I24svtraitIzkZPJZ92NZSG18zv4Rapo-C8BPA8cKr9wZ2XIQbe4Lt_FNzvL37V31J2m6mV-y0rVF5onMbkpNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AhFlYxPQV_4qB6R4mzBNbeL7NAYAufQMtB-TbqThpR4udegkpdtFng>
 <xmx:AhFlY29uHLh6-Z-tuSmGv6CKZ_FISqEF0Jo7m9aFW0ToawVxdzWfWg>
 <xmx:AhFlY5VbjYAJM1uy8LyXbQBHDCvC7AgbUHikgCRZGpozfiB1_em7Ew>
 <xmx:AhFlY8cYP60TDPBp7WfFEjkPffC2RAHTjqLvJIr6zruG64eFPNAOfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:20 +0100
Subject: [PATCH v2 03/65] clk: nodrv: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-3-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cTvG3Ny7vbFY5Q42sItsaJ9Su6ls/B3daI8QtRhhdSg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8+C5Y88qpojMj6IcW27fC9ExOEC2IMTjbY8smt4mCY
 VtvVUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIns+sLIsOpSyRUbDrOeLQs+e1bEvz
 CNs3t1tfW627PaiTti9lwrsWf4Z9VzwsL9v+szkaxnq5uC5LtaWAyKmXWOvb6a9Ex7+88TXAA=
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

The nodrv clock implements a mux with a set_parent hook, but doesn't
provide a determine_rate implementation.

Even though it's a mock clock and the missing function is harmless,
we'll start to require a determine_rate implementation when set_parent
is set, so let's fill it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d4a74759fe29..495d7497cc43 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4257,11 +4257,18 @@ static int clk_nodrv_set_parent(struct clk_hw *hw, u8 index)
 	return -ENXIO;
 }
 
+static int clk_nodrv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	return -ENXIO;
+}
+
 static const struct clk_ops clk_nodrv_ops = {
 	.enable		= clk_nodrv_prepare_enable,
 	.disable	= clk_nodrv_disable_unprepare,
 	.prepare	= clk_nodrv_prepare_enable,
 	.unprepare	= clk_nodrv_disable_unprepare,
+	.determine_rate	= clk_nodrv_determine_rate,
 	.set_rate	= clk_nodrv_set_rate,
 	.set_parent	= clk_nodrv_set_parent,
 };

-- 
b4 0.11.0-dev-99e3a
