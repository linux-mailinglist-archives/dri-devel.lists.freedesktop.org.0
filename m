Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308AD6197F8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B38B10E799;
	Fri,  4 Nov 2022 13:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8483410E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:32:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E30EA580269;
 Fri,  4 Nov 2022 09:32:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568778; x=
 1667575978; bh=vSt6U+MbOQyFoX22fbJ16ApKXjMQPIV6036d5Sbu8lg=; b=u
 zIfcgd0fzhiYhcqk3REFdxwgWHkKnqTvwBsZTvWnHmexsiJ8y9/bbXTIEyco9KLl
 dWHaCg+7OlUGn8lZzn/4w+0Vr8abhUkXoDneXyvOgpXOAcK6vNJv3e45a0Zs6V/M
 ZTQo3cfUHaKlg+13XDi1vr9PTy9DIke3y1wWX5mpGDqJrN72W0okbNGbKpN9PrSe
 Sby5FtnSNzQmDs54Ku/DnwgwvuvgU+6/FhGJlMUL1Od3I67H550ViBp0wBRfXSYG
 OAuXM0cQypqS7Iw3vkzUWVlOS5s7/smzZi+dQtftMKKLo1sGsuVg3IpxA3nxPkbK
 5E2LzVgiNZeF7Rz3W2/nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568778; x=
 1667575978; bh=vSt6U+MbOQyFoX22fbJ16ApKXjMQPIV6036d5Sbu8lg=; b=X
 Bp5wfpirXnmQpMGy6daSSL4kepWjvYrRGVyW85Hqpnm2iQZ/1rBJFFxyAur8KUma
 6T82p2cEawZ1p9/R/YrscBbEZElvvhvrl3aq2FXxXEORsesUzkw0FuBtNzE1OckX
 28sc5gF/p51JOg4tanlOlJP62+YRULv8z/48FpcQDt1kity4p05K3YrBIw1yq/VD
 cazm4jKBZX+MiyoZ5CgE2r3TBleOM4ke3OZhYgoSikmsDV6P6rERQx62dB3buoLr
 F8NjAFyh93tp6NdzkjDAJDHCRGcMEStpzcDpa/j4bnWZDgQx0W2tAjD6IFCvza3B
 I8JNy4tE8avG3L6wdQiWw==
X-ME-Sender: <xms:ihRlY5ESctPxfIzpURQUkqtON3EBTRo2iHnA1nUyHTGfBb4Vu1lt7g>
 <xme:ihRlY-VJ4qe1PrllTwL4f6iK5fNsVx47mPav8SMcZ2-ChMVgbOd98g2QMoe9aqXp4
 TuFEfny0hJsYNYjyEk>
X-ME-Received: <xmr:ihRlY7KMOXZ3SYe9NmdVguJdkJHNCnExHAGkIaT658ZtJ6AtWSmKFTuVk6aqy7r1zNV_n-ZcvRS1FfF6_dEcPhS0TZr-5xL_YIVn96MjqQpZag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ihRlY_E_5F_2M39iX4EuTibskz7RPk_3XldOAmFyzwCg4JVfNHNuMg>
 <xmx:ihRlY_WDERLWM5ReWcBrSvCcnUSpD-JV4Na2nagIYTHlGR2K3-Ra1w>
 <xmx:ihRlY6PpxQq97NZ79rU0Nu5FYGKkFgujlwE4pQ6Hx6_AHne_ELj5Mw>
 <xmx:ihRlY4XW9luapaJjPL3D3PoEX01Zs80u5EdlgCEaBkiauPNkjIORtw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:32:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:52 +0100
Subject: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2421; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oLcWV9CzQns4W0opoCZuOaa+qIVFiYRAK6VcYTSKxa0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl9u/twoslN+xUUWw/RpwdYuB9RXfH5z6mKmksaf4+eO
 iW9b2VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ7ElhZFj6jDUjUvFb2RarA5y5ve
 umhvY4qRqFvfgmc/Xs0RcTDacxMhyfE8b685fv4zchh+c/yLVn6FO9m7cg2TDIrV9gosnmH3wA
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

The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
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
 drivers/clk/ux500/clk-sysctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
index 702f2f8b43fa..d36336665b6d 100644
--- a/drivers/clk/ux500/clk-sysctrl.c
+++ b/drivers/clk/ux500/clk-sysctrl.c
@@ -110,6 +110,7 @@ static const struct clk_ops clk_sysctrl_gate_fixed_rate_ops = {
 };
 
 static const struct clk_ops clk_sysctrl_set_parent_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_sysctrl_set_parent,
 	.get_parent = clk_sysctrl_get_parent,
 };
@@ -220,6 +221,7 @@ struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
 				unsigned long flags)
 {
 	return clk_reg_sysctrl(dev, name, parent_names, num_parents,
-			reg_sel, reg_mask, reg_bits, 0, 0, flags,
+			reg_sel, reg_mask, reg_bits, 0, 0,
+			flags | CLK_SET_RATE_NO_REPARENT,
 			&clk_sysctrl_set_parent_ops);
 }

-- 
b4 0.11.0-dev-99e3a
