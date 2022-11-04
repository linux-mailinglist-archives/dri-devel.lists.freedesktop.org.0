Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B60619784
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C22891AA;
	Fri,  4 Nov 2022 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE92910E774
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3AE285804BC;
 Fri,  4 Nov 2022 09:18:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567898; x=
 1667575098; bh=RuuyV6S71+mujxNJX0cGId978o4gpdLcxFzG55JMY70=; b=A
 frxmKpQz5PIfmG0qLjdZSqW7AoZsGjSfzZKtxxaOPp1kCJidyD8f0bOAfSPYnMMy
 d5fXveH+dxeLatQ3ssR98LN/49pHk5siScG7lCq9P7obrbgidkGqjy8+Kcz4rQeT
 spRw37VS299Ze1T+zzAkeOqzwv2DxGV8ouBO081Lhv82Lwa7ZZlbCpA9hkv4GTBH
 4p573/B+5MPB8YjWPPZO5FTjnbdn4EQhbtXd2gO5CV953lnj/WhKe5Nv9gfKMkvd
 NX8nfhp81j9phHvZWCufzWVP5iw+3Mdq/FJFZXnXssygtlg8D5lipZxkp/2P9OsX
 u9g9zR8yq0KACsUwDH/GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567898; x=
 1667575098; bh=RuuyV6S71+mujxNJX0cGId978o4gpdLcxFzG55JMY70=; b=V
 07rfJmHapq4vYXjHv+1IqqohB3jLzWPXwfte5tQarX/htpZ0ctKOFH3ZmzGOLLH+
 74vH1raGIyp153k6YdlEqwvVf4GxPDLHaWjDhxNPAln/z9P8y/08fCaKnfyHr0a1
 oZWqNTZ/hpBe2HdX1+K1nHUm7jW6CZam9DoLZpkuzS+bHBnFLPzqFLF4FnSvf8qP
 sn71Y/co+S47rd5dX0HsitGkcldcQSiTvWWhxuNcnFuoT7XVI3zmMFvltoQOgJnW
 swqRWB4Worsu1UJ2oofemnGEvLXVVgp21pqPfrhkckPV2e13+Gaf6Nst4UGyrF+G
 RsVXvXRaKvXW1wL+Qw26Q==
X-ME-Sender: <xms:GhFlY3aF59RE6iuKLwHk9qrkB7LC3BhCZwYLsWonrHS9jQJ3yXm-xA>
 <xme:GhFlY2bzOU3I9USId5fPr7VRIe4EhildXTOQB6kRXe8onFFGdLyPxd5h0YXkuB4DS
 FHZm8SRZ9yx1vY5s4E>
X-ME-Received: <xmr:GhFlY5-ewr9OawokV_XsD0LxyyR-wvMZ0ZcW45F1R9QvmjN-fYJxuti0R_H049_FR0TZWvGbwo7zrdXEj6QuY_rKwxf2zo8ggG_5DtFL7I29xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GhFlY9rP1-H7kG5rFGp6XBmWUI8Z2Np4Sjv4lg3ERLQrGha50szbpw>
 <xmx:GhFlYyog3fK9bKjgNp07C5fYYaVhASQ1YuWKXNgRAPDKNPV3KrhR6w>
 <xmx:GhFlYzQKq6Y8BHSJg5llCgoGnezAtvNLTi8v5mW21RFtl6zP_aFdmg>
 <xmx:GhFlY_58Y-p9EH2vY_qkz9qyQArDs-uMsdR3Zx391BSdaWWlnUvsjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:31 +0100
Subject: [PATCH v2 14/65] clk: lochnagar: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-14-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2353; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JCLc4VWVJIPdfsNjAzEAtfaos/KVBZzKQohFfHFKU9w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp+XL+XhXHGidRP/w0rpAvW1x2redm5d+XXxIvOOClW7
 G6eiO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR5mWMDH1VR5Lqoi+1iH3VcdpefX
 DftnVGM/mUGTg+bbz98Nv1qKuMDMe7tCrS7dYuWie0du3LUHOLRIMVGv8K910NsTjJo5/KzgYA
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

The lochnagar clocks implement a mux with a set_parent hook, but
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lochnagar.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
index 80944bf482e9..820c05732ac7 100644
--- a/drivers/clk/clk-lochnagar.c
+++ b/drivers/clk/clk-lochnagar.c
@@ -209,6 +209,7 @@ static u8 lochnagar_clk_get_parent(struct clk_hw *hw)
 static const struct clk_ops lochnagar_clk_ops = {
 	.prepare = lochnagar_clk_prepare,
 	.unprepare = lochnagar_clk_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = lochnagar_clk_set_parent,
 	.get_parent = lochnagar_clk_get_parent,
 };
@@ -238,6 +239,7 @@ static int lochnagar_clk_probe(struct platform_device *pdev)
 {
 	struct clk_init_data clk_init = {
 		.ops = &lochnagar_clk_ops,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	};
 	struct device *dev = &pdev->dev;
 	struct lochnagar_clk_priv *priv;

-- 
b4 0.11.0-dev-99e3a
