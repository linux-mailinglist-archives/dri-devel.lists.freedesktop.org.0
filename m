Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE16197FA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171CD10E79C;
	Fri,  4 Nov 2022 13:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B8D10E79C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2E52C580282;
 Fri,  4 Nov 2022 09:33:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568786; x=
 1667575986; bh=5BxMZxfClzfTLGk/1DtBwDoYyZCRr1onRqUwaNh1ye8=; b=g
 NiiUyxBwXfVIT33r4UTtbXDl+b/ju/cUbHgDv0t3rN2QlWH8E9pNWtfB8I6PY/SF
 LTVQQs+dnrhDM2WHbQ823rxaqR7KsVF2Mx6OIHbnBdT/udSgIWdj0nDHG37D0FRx
 hsxBT3gMG1xgGo2FoF+KbYcDPVwTZUbtck0rN8pDId6E6xFU9fGr+y4HDm344VSP
 ypUlZBqz+/Hh5g16aeQ6N2WvCdPo312X447x2zVjH1EVTteCMui/M3orSzDlrcrW
 bHyFd7r6IYCIupTO7VBOkh/PEbuj7v5iq3gHTudBZqzkKVUuheV/zhGbX9/xX2s/
 02hApmUHxYUcRDLFp2+mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568786; x=
 1667575986; bh=5BxMZxfClzfTLGk/1DtBwDoYyZCRr1onRqUwaNh1ye8=; b=A
 m9SAIB2X/3FNr5Am9A0wSTzyVfDNSl/PdYmDbGnUK/tb4PQqDZSLVmj1Y3cqJJgS
 wLxpIMTGd1xMRLjlitrxzz4nIs+KEtCML4sU6vdX6z1DoaiMAv6jUajXorJeBg1A
 Ad+CY6UJ9AD2LeemQKctXBQpuZgZB+c8CYIwi/luebTWWQEHLM6cnmPM18CQXqGB
 HReaChN1v3j4rzYI66FLQ3SJ5Nrkh7GGcDUt4lFkgbE9inGDSn3BDq3oG6h/HxoP
 46ETbDzsAt6z2EhICVK7LcfeHhbfET0D/3qTs+umr8qA/keHxEiIIiLW2AfkT0Ci
 jYN/ekxROY7GVwx/gh00g==
X-ME-Sender: <xms:khRlYweUouArjzfnBR2fDYcTKRVzc1BMIxl5ZB9t5GxSwRg8jRRcpQ>
 <xme:khRlYyNtoYYVg7emY50CRUWZg5uZ3lg126inezm5cdPEqRoNDOD2oyB9qb4Qjb6cn
 YS4w9mtVwzxuf4VU6I>
X-ME-Received: <xmr:khRlYxhCbUhdc8wCjwNk5nl1OgVPgZEUUQKB0MKe3Aj73gkMpAbrKqcFNziRElS29Aws0z_jpjnan7gqRJuOCvvulyHxzm5ZzfCOQJVrhKuxsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:khRlY18g6gJEcrTqJsgaUqpJtjn4xw5G_hl8GkebIbHotHGi-GCqhA>
 <xmx:khRlY8vmnAx8EvrFcPzoSJysyfvckV41vYrnjD7rUJ7BRL-LPamv1Q>
 <xmx:khRlY8FCM6SxwodZNynPnuULHY6RPaDcOeWm16AISOJUOrWvHEADZg>
 <xmx:khRlY9ON8O5GBIlohFggXmSnepF2Fgj9RlMHXdCHHb6hGC_-4xyfxQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:55 +0100
Subject: [PATCH v2 38/65] phy: cadence: sierra: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-38-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=zntdB40frzZthx9wXTpp5pjWLOP9hS5dwLBzuFNQA28=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl9Fjna+EY8xqTol8nrNq76l6o6CrrV5DFp35Y/ymOws
 L5TpKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwER+ejL8rznRuGyVIeM8ozUcxp8Ufm
 Rf9XRPX12p+/X05yypqp0sEYwMi17+M5PSX5KifkRV6M2scqETvxZfdvly823oovz3b7NucgAA
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

The Cadence Sierra PLL clock implements a mux with a set_parent hook,
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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/phy/cadence/phy-cadence-sierra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 6e86a6517f37..403f8eba9fe5 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -709,6 +709,7 @@ static int cdns_sierra_pll_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops cdns_sierra_pll_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = cdns_sierra_pll_mux_set_parent,
 	.get_parent = cdns_sierra_pll_mux_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a
