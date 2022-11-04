Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED841619794
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADBE10E780;
	Fri,  4 Nov 2022 13:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DA410E780
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3C52258055B;
 Fri,  4 Nov 2022 09:18:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567934; x=
 1667575134; bh=cUYVzFMeWj7msgaW+CWX20V7PRaLLDctOWBEFEelebg=; b=R
 PvSXf8qmSCp/W1ZoDh3c3/tZZhN+u7CQRVwhZEb4zXz2jS3Jy+B/ACMjx43CPGv4
 47I2U2h3rKJaP6kFCDrZG4MOegiXoY6JFxMfTbzrIFV6iFUvxL3OPhysJvdIlxWQ
 7Tu8YepQ2lA2i23jY0UJu8TBG6NIi9uM9I05B4WasPrbmWwv0RUv3u0VDY1471ZD
 ZiEKrhHclv0UJ2/Xnlr/0s3aDafHuysTDfrKKE/pXIRYE1K+PSZ9tE6f2il/PUjh
 I5CWIQ2Btiyt7eUsAdfX7cz9GuxVi9z0f/buF5YvbuJeAbjSz26d9RUx8RztaMYI
 HISIHnaQOYUfsg0Uvr/5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567934; x=
 1667575134; bh=cUYVzFMeWj7msgaW+CWX20V7PRaLLDctOWBEFEelebg=; b=g
 nlm2rPOAv4Q/ADkU5nOABCfYBubNb6EPUuu++fOj7mvVr5T7f04jqYD4RWlEP57f
 BB+oU9mAVYnLB/EFafXYyTcqDNqAaaJiLlsCtPMMdY0ok5JZzY3vNIpn0g1jZ0tl
 l2JKwLnHW/5TjV4qGbCwh8TRLAeRJe3Df2DkOQ0j0KAYYbSfaq6gyTfLhhFDa1EZ
 b9dYxUAIaCPmOLVBciPTqoaCRdS/1LTKwtfxCOK0t/I/M7zZW+zCq+wfP1oTY88D
 Z/5MY0HFuZ3+kwWHl8eMkdlVsu6Tme6bChRrIV8Q43pJzgV1Ek2KASHM1cnWB1h9
 fKuLDzlldiGvt+ZyA3eCg==
X-ME-Sender: <xms:PhFlY5lzpJaryGk7XaFtStxVpTVGLQEHE1wjE0ULe0JWM-1jF7HBiw>
 <xme:PhFlY03K4mrJ8JGjI9yUg2Iqqq8MQXxIRk4M-iqpQDXfmLil7wj9BbCX1k7jMZRuv
 kVNKyGZbdR_CaO1a6c>
X-ME-Received: <xmr:PhFlY_qorYANvKZ3k8DSEEvn4SeOHwg2vwfAjKhJy8G-jfHRu4V148BhVDgkDwmVa9U1sgPdSW_riy5K3-s5LiU2hDa_KbHys2oU82w6w2k00Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PhFlY5n6HKcwL_vDTUlo74LdgvnStVYNJw2ZW-mZq_QDXN1eE6M8fw>
 <xmx:PhFlY33tyx_OL-fHXeuGDzTx1itcjyvcU1HTRUhFDS2_aA13wbsaUw>
 <xmx:PhFlY4sIVZeIjip3qxGSWEDjghcCcmRXUtsCBs_bxfhEZcNN-HFxnw>
 <xmx:PhFlY637JMDHin8pQaYIS-Asxw6pRshBSUJnwLeZ-ABgoV8mpFiMmQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:43 +0100
Subject: [PATCH v2 26/65] clk: mediatek: cpumux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-26-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+MX66eVw5hOCcS4y+VNPZpuNpw6WMytsI19v9YzpKxo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl9eMfEfu9pa+HnulUtJl7i4v24wTQ/hYpZ2nmsx59Gk
 4+02HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIX2GG/65sfU6xas8/yzhvk0n7EW
 aVOP/Ck896BfeK/+z02OX2fyPD/3x+1pYD8ikivmahXr8WJit7edhOt+H74/fjav4Bi8nfGQE=
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

The Mediatek cpumux clock implements a mux with a set_parent hook, but
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
 drivers/clk/mediatek/clk-cpumux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 25618eff6f2a..514807ae4903 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -53,6 +53,7 @@ static int clk_cpumux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_cpumux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_cpumux_get_parent,
 	.set_parent = clk_cpumux_set_parent,
 };
@@ -73,7 +74,7 @@ mtk_clk_register_cpumux(const struct mtk_composite *mux,
 	init.ops = &clk_cpumux_ops;
 	init.parent_names = mux->parent_names;
 	init.num_parents = mux->num_parents;
-	init.flags = mux->flags;
+	init.flags = mux->flags | CLK_SET_RATE_NO_REPARENT;
 
 	cpumux->reg = mux->mux_reg;
 	cpumux->shift = mux->mux_shift;

-- 
b4 0.11.0-dev-99e3a
