Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F26D5D14
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9070110E641;
	Tue,  4 Apr 2023 10:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DA210E641
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:22:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9C89258213A;
 Tue,  4 Apr 2023 06:22:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Apr 2023 06:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680603726; x=1680610926; bh=WcG7FKwUudZQjfKtfxORYRWaXt7PLthtH1j
 26UldF4w=; b=N9Wc2XisVoa9iC70Cc7USwaeiKrlmAxEtIv9BzILN5yAtQPWurz
 qcy5LxGrtzpTAsuygU1xteVm/UxnsvdmVncgTR6sNqIZlWlkeLhxt5JH/87h4tQg
 XVvN7cPP1LrbjQMM05XqH+b5gEk0e/LE5yM/Od/ZIUT9uJXOeTwqkY/E4s6M8ZGr
 H4MKOLrR1BkS/RFXHlf9VEP5HFka68d+Db/xwLTWkfeHSyc8lkfL6RZZzzWtFCRO
 OwUHdUhor2hj7WAv+QSVSpV6ElynfWK8eoXZwtE6VsZlF7PMktxpm9dHQLg36CQ1
 +CF82cjn5HPVlNvxSIKyhzOq7xVdO2S355w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680603726; x=1680610926; bh=WcG7FKwUudZQjfKtfxORYRWaXt7PLthtH1j
 26UldF4w=; b=cj0csU4D+NIKLQ6zt7kjxVsddYy5UBMLy8bj160jGirBOIupDpL
 yBHgXjkXhbUK8vGb/lBD88nuInyRDwRnpnug7gjQdamGtW9iZql37aIIp82g2KLY
 QdWp+lpIFF5o2nAbxvtGsYSaQqYVJ52if5Zeini6ZaNl3D92B1A7p6mohsGcHPHZ
 c0+m3d2JVeuorqFT8x85pT5q1o5EbdYYrKE3fjtRETcwYOym/tV0mOLEVTQKZgzW
 SlVWxEqV+Q7DHgE4UFV/sbnh2PAIeX/2Yuy0iBEUo1JIYETJuPzytsD3xn471Htc
 60oPOyuxf+vcq/LYaPajSzWbZbt28IA2IGA==
X-ME-Sender: <xms:TvorZJPA-xGg2vgLHmPY7i62YKSAJCXDA3GUEEDfLg1_J-G1dwMhJw>
 <xme:TvorZL8sryAUX6-XN0SiZy3aK-RncRUG2av3FUYlin8E15mtO7Eu7Kw0BHv1Hcm1H
 pwydEsYD2tTvW-FHCc>
X-ME-Received: <xmr:TvorZIT_PSaeo-1OvqDyVf3gwJpXE1hnXf4hxDmhsBefaVA6OZmOeDdd-prTOGbBPPmR3rI7o1YMRFw0yNRqDqitQtk9hMM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TvorZFvPiUYlG4rvDC8zce4OcdQ09IinjHmhBKOK7WJLts1EHwtuLA>
 <xmx:TvorZBfQICdTeifRySHK9KEeVcSmn6qtOcsxqMUjtAz0nJ4eEmrvaw>
 <xmx:TvorZB3gB2x3ZUHiTnwBfqVRu0uj38UHm1YXH5JrGI9tW44HdQb18g>
 <xmx:TvorZJL8LtsYlOez59g8O4jId9e2GE2XMX2qE2kC03poSF9yycbe-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:53 +0200
Subject: [PATCH v3 03/65] clk: nodrv: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-3-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pGICE7h3xYKlbtSv0wLfhh1XiPG+p94pOlQ2QMAU7vI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37csu9T2SemetW3hrfSY4iNm/0V2H9q+OTCZW3J54A/2
 4LVKHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiITCUjwy7N33+7tkpcqmvz9/lw8O
 Gx7cbmC67qKcgl/zx7OVdYUJuR4djW2SIvamK3P+H7YnRglUN/2SaRvH/X+L6/m/wl5pvabUYA
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
index e495dd7a1eae..f9fc8730ed17 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4302,11 +4302,18 @@ static int clk_nodrv_set_parent(struct clk_hw *hw, u8 index)
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
2.39.2

