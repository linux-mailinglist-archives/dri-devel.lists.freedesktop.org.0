Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D41619787
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B03B88130;
	Fri,  4 Nov 2022 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227C010E759
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 836E25804B1;
 Fri,  4 Nov 2022 09:18:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567891; x=
 1667575091; bh=fmnbd20vnai0Isz1Na1SFvb6jzXJYKrz2269y3tcZXo=; b=C
 oupMYwVAU4WGUwrdylKXOPlxhygxfcRGnWp6IwpQkm4YYtTHyAKoct293YeCWZXZ
 8rfr1ME2p/GyrfDv8oDDxmf2e4yG5bUatgwp430EnNSCsXFsHzqGJiz8Ww0BqR0k
 j7jNiHqCoC/cowwZb7ACLnQf3HhNeBlRsc2An1cZvKrtbpjITe1RAlgcmY1A8wZe
 hNSLfcAMlRgiOKr8M0NErhYhxQK+vcfs3B92SPekPW7+/QlHz8w9TK08eKhNDWdW
 Vnbjxs2GgTjwJ9he/DdVCwnTKcI1ezMt88jjRC8r5z3qnZLuh32+95TFtPv4r08G
 K1DJikoMzpK18M3jUuUxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567891; x=
 1667575091; bh=fmnbd20vnai0Isz1Na1SFvb6jzXJYKrz2269y3tcZXo=; b=g
 UjzDA9JjkPwIuc39XA9n1T6FwrGwA++nqNr6afztTE8pmRMap/DnqYopuHU5e+lV
 8Qw3bqJerP7ZAonKJs1UoP7P0I71j+JxkATz3ErQl6hkfSo+t8ekXisNL/h7pMMK
 vmYq/LO/yIvqy4MCkKySajNaji4AVcSyAeDndK+y3SHfZrr4pvrK/WcRzFhvtAgq
 K1zbe/XTx3o/HJIzSh7eVb8lfVjm4pRHtSSrC/yp/X3JBz63DZb/YDR34WR8wR/Z
 yOZ62d4C4IBMmbsEUKk+U4yuiJAGxhQdXn7f8uv75RtQtwF5q4z6YBbCMWPDHWF/
 ImxbV4kvYVXO3DZ/OpKSg==
X-ME-Sender: <xms:ExFlYx5wOINYUZbR1RbTCApGVsu2CwngOOkhASmkzXuJpYVnLIu_tQ>
 <xme:ExFlY-7MYDtSfIbdwlsXm6KnCBDKU1akx5tt961cHL9vEgCxSoxfGoNDj7fUaiB4Y
 tReRqmvuvWV09iBLWk>
X-ME-Received: <xmr:ExFlY4dtHYcIxYhh7_iHw7LuSUes5VRSwIUj3zS0Qu3EOlohqM_7JjqofOkvT18828aXdc7iMtePv7Q8_bXq4Cx9rGeIwGY7QJ1Evl-XBp9gow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ExFlY6JYRkdJGgoNXORjtR2RTexhRTa98QoW0FiIPSw6vdvnDZk1cA>
 <xmx:ExFlY1INMfok4ugxcAeyaw6d2bovQxscilcvxeIQ9v_dxh7b5vM3GQ>
 <xmx:ExFlYzz0WH1gaWxAQrOniSrbPQ4CEGHlu1qIVNdfDt6B_2gBSZ4-xg>
 <xmx:ExFlY0ZS_09pVAWoGjTpKf1JZKWGMTobM39h8RxuKcQLTVxzzVD3Cg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:28 +0100
Subject: [PATCH v2 11/65] clk: k210: aclk: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-11-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=9Rjc30gdQbiTU5mY+5IHrTTpT8oxx4VPce37OsseMFE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp/F1z66cCJxStfCZub3C97tWJWyoZLbwXV5wvX/zVUM
 ihavO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR6VmMDEtyuXNYNMO2b9lc8V7Ucs
 fCtUJu/bY9FZdfP/2z7wGzzgmGfzZ3xP66uU+wLN7h8NTnpPO1tNdq6n/maezsluS61LbpFCcA
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

The K210 ACLK clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-k210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 279931a38127..5b9fd00d14e1 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -639,6 +639,7 @@ static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops k210_aclk_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_aclk_set_parent,
 	.get_parent	= k210_aclk_get_parent,
 	.recalc_rate	= k210_aclk_get_rate,
@@ -661,6 +662,7 @@ static int __init k210_register_aclk(struct device_node *np,
 	init.parent_data = parent_data;
 	init.num_parents = 2;
 	init.ops = &k210_aclk_ops;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	ksc->aclk.init = &init;
 
 	ret = of_clk_hw_register(np, &ksc->aclk);

-- 
b4 0.11.0-dev-99e3a
