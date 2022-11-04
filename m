Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF5C619793
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9354210E77F;
	Fri,  4 Nov 2022 13:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A6B10E75B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 75B2758052E;
 Fri,  4 Nov 2022 09:18:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567915; x=
 1667575115; bh=hysVo4u8nbCgGA3oHny22G9EjvddeG5nBELtR5H+f1I=; b=i
 VjK6BPo7bB2mroEWqSFauGJ5VvTBJIqYMUOgtXu4tOgDrMbCNRDAWwixILFIJF8h
 5c7xFpit5f11ZaXvRbvnmxLQHhSdFy51mCcyLgMQt5GUXh8evVQAVNPYQ2nFQvch
 USK7f+DLuQ1iLGL3s5HsOHeTY7HbUqzckqcZJ8PRtxNSIaOkzmoKEzk98uHj37kP
 hP6rNpdX2+BF9JFpNwM3mpzlY26vkYl69OJ7RhbupuKv1n4V4Px4Eu6O29qRbcIX
 jiz5krjVbkok1knpt/bWZMpLKVqhyZMYhuPcLQkmdDkLDYlZ2aNsCfa9hXUWT2J0
 6KelJbifZ1FJtPlfWUtHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567915; x=
 1667575115; bh=hysVo4u8nbCgGA3oHny22G9EjvddeG5nBELtR5H+f1I=; b=t
 tR/dRmghjH1wm+Sy4i5cdtFySAIqnUc6rF0OkMpAKNrADFwLXeaCGTGxLmp4Vqwo
 Mj9MSyK8/Nqc975GE1OpdKmXjD7OE6q5NHbw2IgP/zSYqILKu8k5SrSvJ1Qsw1ia
 9p4cYf3w8Zcav2yGOa8vpva5bcepb1q+KMPH86IRHlj9aa/whJ15BV42KeDo9/Y6
 sApHSd3j0fV+Ulho+mAEfYJAqKwTGe8EMJ2749XWpIMnMC857tErQNco7/Y+u9j/
 6Ku9wjCuJPazXA41KWr/2CXZCKO8ALnIOz02O67VfmZb4ZrDvnDbUi1aKRfpcbrr
 sVldLVzzSDMMtfRIpQOSw==
X-ME-Sender: <xms:KxFlYzxIciiTrqkzFz49ls-ra69bytPEhJw60tD7Nc5vmyrL97G9ug>
 <xme:KxFlY7TF1MwiVcYfzN8_sGIx5Hj1soazsuOFYMQqfBMDfj-sZLJsaF9jD7ggkEaou
 marI5fgAYaS9X3xDIE>
X-ME-Received: <xmr:KxFlY9U9iLHG5c3zPvE6NZPF70qowQP_DoA9ylt9ZmNVlyk4QJEpL4ctdtafI1kPA8uUQgUdiNGhdnDToRzIColOHxwQQyEKuuoMOVu8pkLVNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KxFlY9gdz_nf5vwxcJKUOQQANHrNwbqWqwIfZ7Rue0GEvmTTP5oDug>
 <xmx:KxFlY1CJY4Fax_bk_7QZpCyW5BAra0OLZ428J0WptgEiyE9BxGQFxA>
 <xmx:KxFlY2LzZfsj9NukgvyMwVi3ctd2nyJa6Npwz0lAOK0VagwEdZ9ixQ>
 <xmx:KxFlY9z6jnPU3mO9x7Smm3GJe44GXIuSaBaD_OwJCzDX-XpkUeJq4g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:39 +0100
Subject: [PATCH v2 22/65] clk: davinci: da8xx-cfgchip: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-22-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UGe0lSsyawHFRBIzcLkMuGL594L6jEEp+ALykYgzBK0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/cL2buPvW/+OumRZPuCHB6Hvr1NlVPza7eojh3s8e2
 0yvaOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRLGOG/xni35OFHhxziJ7XerNz1T
 NJPtsThmd/n44SCSpluWBhfZKRYbF++3uVqtPFq4+fXmadntzTIr1/x7pynttvDt3JvdUoyw8A
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

The Davinci DA8xxx cfgchip "clk48" clock implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

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
 drivers/clk/davinci/da8xx-cfgchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index c04276bc4051..4c1cc59bba53 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -565,6 +565,7 @@ static u8 da8xx_usb1_clk48_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops da8xx_usb1_clk48_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= da8xx_usb1_clk48_set_parent,
 	.get_parent	= da8xx_usb1_clk48_get_parent,
 };
@@ -589,6 +590,7 @@ da8xx_cfgchip_register_usb1_clk48(struct device *dev,
 
 	init.name = "usb1_clk48";
 	init.ops = &da8xx_usb1_clk48_ops;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = 2;
 

-- 
b4 0.11.0-dev-99e3a
