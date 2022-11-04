Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1661980D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81C4897F6;
	Fri,  4 Nov 2022 13:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C7210E7A6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE0F258051B;
 Fri,  4 Nov 2022 09:33:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568794; x=
 1667575994; bh=i/mdM6EBYqXU9owm3d69sSy2Pa3hzJ15q/3x138bZyE=; b=J
 9nWs5By63qyldGfoZmgNazEVWBlEeNGjsA0SN8tbirUuxog9s4i0zrfw5GGBLya9
 Evo+SqmEgs93b2kr2vmSc+dxzwGTU12hU+xqej8aG1Ii4CjRlwXwRqlXAC1rEtBW
 5mylbxY1ynlVmY2o+SS3NqAc0yIVon/cllx3aVeXbjp4dS8KTUP2kaNNhI+uv1Ap
 nJVf5zY5D3qy8c/HsZidhxweByt/JXBLNyenLxzvzG8dnUH88rmcwaXntuXwsmOP
 tYZQWdbmKDNSOBYVMnFElBDqj+JK6CrOy6z+tBFRcEvBC6dq26BG39LyyC4sdGCg
 jxOCP8/hqj7H9UoYrsu8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568794; x=
 1667575994; bh=i/mdM6EBYqXU9owm3d69sSy2Pa3hzJ15q/3x138bZyE=; b=e
 dHY5hm1zWpU0YGASfdRoL44xxdxjBrGMnPUcihMgN4pXSWsooezkVeoqd+P0FZ8C
 u9RJTf22oaCo2WRQIakhyozIElT/ubuZrquA4JOHHwfr2CNsjuWuVA7vbf3BPr+n
 abUqLUh2j/S+nFfOhkdbrATHOjoquPEfJFNG8Nt4f71BMni1+OR7tHJUUndtrYjn
 +89vHPfffaliFdW+P/QTiR7Ij3L2ZyqFO0pJ+LvEBcCCqvfiHtNH8GV2lww8O/b2
 ocXR9Oergoyr7M2aMg+RsoMZZAHCHwCIl3n3eQsheu1ZPLIIhrpwUvBgULAdPbgk
 lncx0aAmOJt8aEsKbhG5Q==
X-ME-Sender: <xms:mhRlYyhAnNjz59Te_QXoAGOsy7CY4BJwZkKyAh9UT8VX-sw7l0SpDQ>
 <xme:mhRlYzBdAbkLJFWevBlay9JMhRPXOqrGBnHeKCOHRgenzwMGj747aIzVI6TnyoCK8
 ocG3vYzRKLx9cND9Uw>
X-ME-Received: <xmr:mhRlY6El7n78fPMtPvONnh8LI6ma-idm70tBYaAEFKa7XHaWqlaDm5WJDYcj0c4r7ljvSi54bJCsBPEWFqX1xnCU601XBpBHqVfUBaqZdTICew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mhRlY7QXhJS3HplAi3aJ-uw0xhE_CukyqBoOhdKrrNquVyCl8vjybw>
 <xmx:mhRlY_yTvRe_9YCn5yzYsbOyvBi0JAVeOECKWcy7Q7lVx7hLMs3DsA>
 <xmx:mhRlY54G4-P3LLADjAlCUN_cCmyCd8DZQlGj7G95O_IPhM7Hz65bvw>
 <xmx:mhRlY3gyV6x6qEa_o6ZOyXZ4I-9El8YOhr_k7VARwquXZVi6kweLGw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:59 +0100
Subject: [PATCH v2 42/65] rtc: sun6i: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-42-f6736dec138e@cerno.tech>
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
 h=from:subject:message-id; bh=i8NV7IjuD9Yk1Zqq8ZAa7SMelcQ7FkoI783UQL/koLU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/1/VZaF0+xO3nvzpLUj0Lhj9ZM94pYvE+Ry81ombm7
 +4vVHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiInTUjQ9MpMxvNpTFH+ji1p8+I/m
 4cZKbL/NZdzCf1qne564+6fwz/o5bve5501XEa677Dto4WJcfWtbLdlZLwiq++IZqxpMybGwA=
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

The Allwinner sun6i RTC clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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
 drivers/rtc/rtc-sun6i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index ed5516089e9a..a2781502c244 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -215,6 +215,7 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw, u8 index)
 
 static const struct clk_ops sun6i_rtc_osc_ops = {
 	.recalc_rate	= sun6i_rtc_osc_recalc_rate,
+	.determine_rate	= __clk_mux_determine_rate,
 
 	.get_parent	= sun6i_rtc_osc_get_parent,
 	.set_parent	= sun6i_rtc_osc_set_parent,
@@ -228,6 +229,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	struct clk_init_data init = {
 		.ops		= &sun6i_rtc_osc_ops,
 		.name		= "losc",
+		.flags		= CLK_SET_RATE_NO_REPARENT,
 	};
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";

-- 
b4 0.11.0-dev-99e3a
