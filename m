Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE14619797
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB46410E78E;
	Fri,  4 Nov 2022 13:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604C710E780
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD83F580559;
 Fri,  4 Nov 2022 09:18:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567931; x=
 1667575131; bh=x/RnpdCq8+l4EBCIw1+peBD+1x1bRnGWgIjtgh7TZMo=; b=h
 X2tpSuUgsYz8JHnokK5gCBSla06jpKoxkkj6fjH9JIZwX+IZM5OJ3TE5o+wU8L8U
 1SC07858vt3iW3/1xK/5+CZvZ0bko5yAzjN6RhHMQAOvVZEC1l7AqjIXYQqSpHiS
 88IwCYd30Vp/m4a87X7S86R35utHVTwrFlhsOcw64CkcUsGDdX6MBQ+pu8oEYEqo
 zHC+ChzMxXJi0UahYgSLGyWqAfifSm5A2O3QFwW6GlognSOIYB5h+i6fSb9DArLl
 lgye938EblJpIS2GDNiktjCBdfjA3hHcuSKWydmgW5QIQ6dwyKqdOYYQKnIVGrrA
 SyB4Vs9Soco3SgQx5knzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567931; x=
 1667575131; bh=x/RnpdCq8+l4EBCIw1+peBD+1x1bRnGWgIjtgh7TZMo=; b=J
 gP9Nyqw4uJNzPp1bH8YqEDeesONVVGHerTPniEFT9S7UHs08JZpB94wh03wTExsB
 Cqg870pHDbkWZ6y7+7Tb16JcR0OttUdSqGZ1Ohzyow34ToXA17hB2nVqNCy3cWJp
 X5piRIe40AofkW46w0rsPgDLwIN7V+Fe5cEaFPDzEyZMT6oPidaUQ3nBF9Pd41uy
 zetM+3ClJ03fTlQ8fJii1uwoi4uv8CkMXSlnvBWTe7hU/WIhXQ7vJIfggniZk2ov
 /DVviPFHuuJcb7UnC+Q0Xn7sF6DWOKVsXCuL35S8H2Q7Z7YGlaqYiAhMYea/ciN6
 3iDK9xY0lq76GRvE7T6bw==
X-ME-Sender: <xms:OxFlY6XYIMtD2jnSdijwBzjzZ3t7dRgqesQ28dzTjeh8H9cPIYVfQg>
 <xme:OxFlY2mYshUzCTi9_HIy0i1R9OSqF6BhzB7Sd-K3NCUg7TN9K1771BeisWWZ9l5z9
 Pq7f6BUBvgq8IVKbB8>
X-ME-Received: <xmr:OxFlY-aSJTie6I68h8Ak87a1yL1QZM5TRiBMk-xSyUzPuf0HDDF9nquGs-q8T4HWLfg2B9mvysY6u3eDS_0FXOrryI7Xz_hKyqjvGvEwGAV-7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OxFlYxWc5c43Q4H2LlmTezidfkQs3Sp-o7_AQk3fuLD-EmMBLYPthg>
 <xmx:OxFlY0kXnrdJREVFCkQsiLzkwcywlKBzC13TdrODJH061nvxfflLIg>
 <xmx:OxFlY2ccbn0Z0fyGg1WDAQU0TZUJUy5UTocwYZNYWT_PBfMKHCfgJQ>
 <xmx:OxFlY-lU2iW4NkDK6ci5CRNjcv2QkyRW4A2nQwGDqnpgSd6e7Allqg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:45 +0100
Subject: [PATCH v2 28/65] clk: renesas: r9a06g032: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-28-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2424; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=qtN8YmaUvPGpHcy8Dy+enw7ZsB7uxefygNx/9UP+R2Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8YryTd5Eg5oODvGn3v6Q/XhmnHGms6tv7idpbgWb1k
 ygn9jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExkTRYjw83aXKOQbSeesfRYnS40/X
 rv8I7MmQKXPRQTyjpM5hzIsGf477fh/Dzt9IdLl+lF6/866rTl76rP0/i/O+W9lP1txHuwmR0A
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

The Renesas r9a06g032 bitselect clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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
 drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 983faa5707b9..70c37097ca6e 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -773,6 +773,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_bitselect_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = r9a06g032_clk_mux_get_parent,
 	.set_parent = r9a06g032_clk_mux_set_parent,
 };
@@ -797,7 +798,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *clocks,
 
 	init.name = desc->name;
 	init.ops = &clk_bitselect_ops;
-	init.flags = CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = names;
 	init.num_parents = 2;
 

-- 
b4 0.11.0-dev-99e3a
