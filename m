Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C661978E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F05B10E779;
	Fri,  4 Nov 2022 13:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A59A10E770
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E82ED5804B8;
 Fri,  4 Nov 2022 09:18:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567893; x=
 1667575093; bh=OsqVSaB4puHg3xKhCHX6duSiOM6c63DJuikQrynCI44=; b=J
 UdmX+9OKT2Rm/H4Zvu4K4UuKBkK1sMcCKQaVisqCi96xyOcKWhfAdPkpBvu/d8i7
 DTe+qV1+RoQExQZN9ZLePj0t/mZ6Pr+SFY0av3sKpTtyl361UjVFrLjGoTPGhT7r
 YXLC3MMFT4Q+GdO8dJ44D02tJE6Or/dutXkttpYCJFAMMXW8rx/AybLqjyBZ70V3
 c41Sx627XrxI7RjWbmiAIdedoPMQEc3jzrazkJeOSooGhCH5KqObWRFY6YhCjQho
 TshI9BVXpGzfsX3I7mSnW5WSeIGYqPtOW2mMmmJUxaCoBY+qL+3erKEkaSMhBICT
 igJ28mS7cTnY9F2hP8Djw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567893; x=
 1667575093; bh=OsqVSaB4puHg3xKhCHX6duSiOM6c63DJuikQrynCI44=; b=Y
 IkzRWpABgj7fwxnSUL/qucvfBI/d69CQlduw7Tc+W7f3sIzFPGpGrdNHrD6Clu5v
 g77nMrZ60/YwKP31G6cUe1HdtRGN9OCh4xkNWc61Rx2dVkAPyrsajDY7a6Vs1X3I
 dsQVEyjSu2cbZo8x05vEGY0TRkdf2GMEByECJhpO3Dc0Z+PGHOjMmYflqFuMpulZ
 KaESgglUPSCMhHcnVAJ4tp/Rs6sl+wDzp2tB6mKq7jV4vtY0AIPfhnDm1FkeozI0
 6MdJxNTZ1zIqha32nI5F4U5msMpYAjgGzOKYuWFD42w9K8q/pB1aElL0b7/wA5FU
 +BceI7UF5yfnUV2g5H+gQ==
X-ME-Sender: <xms:FRFlY86WRwruppkE9FbdLgHNJELGP6oSrru8qxWCwFE_I2aDuUv_4A>
 <xme:FRFlY95l1qMONGOdzm49F58fO6U7LPgJ79k5ovr6v4QJV1K1HG8WhL2oPkucfY-Kr
 WmrMWSUJl11tV-_fqc>
X-ME-Received: <xmr:FRFlY7cr18Wl4mVO1zA7m6ObT06FgGW0sotKKy1yaOIOe6jfndHYGnB3zRFuSA5EkILSZ2dLltfM-R3pSJ3L1TrANMKPobtjYTxxGQ94hvU7-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FRFlYxJze9G9dN0Mok9qhQ0xDtye07V5phzOKhMunMtQ--zYPVu3MQ>
 <xmx:FRFlYwLvzQcBJPc4zlGrHzvg3jwmjx0RVyvJ3eB8CEFi5OZnYgMzeg>
 <xmx:FRFlYywsKeqB1fKAAbSCtfiJtePVaxDd-EsHCUxTvFF-yETDWJCgJw>
 <xmx:FRFlY7aTHMoULKaBJ_zXzCjZoSf9Cht3D4tA-BMYm5qkz3DBjp0QJA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:29 +0100
Subject: [PATCH v2 12/65] clk: k210: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-12-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Gej66EsLQRO3ewM0fRnTAOk0KO3GEvBFH3z5OOVIT6U=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8dNxo9c8+bwh8eeYrv+62PPtM/1YozJZderJgWpfWJ
 uVe3o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMpP8DwkzF56zNRqdWf0o6Gxx0J3X
 37ivsXY6+mzc9zF5bLvzRjZWBk2JeW/O9TzQcx6T/TGS+Jv/e7wzB5qYDD8d3nJ1fwf7LoZQcA
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

The K210 mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-k210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 5b9fd00d14e1..cdd7230f8f66 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -780,6 +780,7 @@ static unsigned long k210_clk_get_rate(struct clk_hw *hw,
 static const struct clk_ops k210_clk_mux_ops = {
 	.enable		= k210_clk_enable,
 	.disable	= k210_clk_disable,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_clk_set_parent,
 	.get_parent	= k210_clk_get_parent,
 	.recalc_rate	= k210_clk_get_rate,
@@ -832,7 +833,7 @@ static inline void __init k210_register_mux_clk(struct device_node *np,
 		{ .hw = &ksc->plls[K210_PLL0].hw }
 	};
 
-	k210_register_clk(np, ksc, id, parent_data, 2, 0);
+	k210_register_clk(np, ksc, id, parent_data, 2, CLK_SET_RATE_NO_REPARENT);
 }
 
 static inline void __init k210_register_in0_child(struct device_node *np,

-- 
b4 0.11.0-dev-99e3a
