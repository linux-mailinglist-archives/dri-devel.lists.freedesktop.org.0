Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01472619858
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6224910E7D8;
	Fri,  4 Nov 2022 13:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8443410E7D8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:44:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C70E758027B;
 Fri,  4 Nov 2022 09:44:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667569456; x=
 1667576656; bh=tP0HGewViKfgCsDxSEncjuLu0rJM7VTaSvboP+A/WU8=; b=b
 E0xbq0PMydVNQfUpMYzNNJWNH6UXe+pff49FmCpzlJH86cJiC9BxwkLuwdaJ+2AQ
 BTOHlJBLCErPmiUDffmDb1KJfLkFiPffOE/ZzXL5HT0nyiM8VVIcDpxvKK/Hhrxw
 FfnFmQUhEBbmRBKk5ic2rAbyUXjCMAKfroPKxA3ejjX14H77Rb8i2LLzyD5jCRYs
 puvnfxcaFG6bHKjV/ov0jJrfIAC1TN/dfw9k/3/OAXGwPaRj4poGYnHgV97ICZ3R
 CGYA1RIULL50uFOjfgvr4P2wIh0gbbUs0shUT4dNvRnpjfV5xiw9Iga6iqBW6+Ac
 8ra2R1jlh9z7cWMNmk5Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667569456; x=
 1667576656; bh=tP0HGewViKfgCsDxSEncjuLu0rJM7VTaSvboP+A/WU8=; b=p
 c7IHiyhgJS72W1HWSaEm8pM4f6nRZLy62zVJ4NM1JCXqbrbdPv6fwXUi9orAO8yj
 JNR7VZyu0th0aG9ZuyxD7iNo+8lscOr2Uhv78sq2LTwhznHf6rBP6l3bzcFgEt/G
 TddGSp7pu+vfUkoN/Ex0tRZGtKzRaRAq8wQuIO4KJ3kfVq3dh5yo3TwS1nOsfYIH
 FhI4lYQpcvZwvBYC0VLmZotUx2vh9Z7H9oFOi6axCO/6N+mUjvoIsVGzOwjbv+MF
 dx/6kAUIa6WdALliOTWSaDc7ymoet/H03vZ4uAwO8GEmySu0/o1ykb1m2ZkqqjsB
 LkE03DPVycaPlJ+/9BzNg==
X-ME-Sender: <xms:LxdlY-z5Tv7rrhAZByn7LvBg5_V1RueAhDra8YaOWWqYlcTL0ZnlZg>
 <xme:LxdlY6SNsJHsOIp-p7GHxFmwSYn0Ho7GmRCvyxzQA83BZtx95NcqcDhyCdwPL7MW0
 jxdzNQ2wGL7oQFc5Vc>
X-ME-Received: <xmr:LxdlYwX__WnI17AlnyuFO_SNba7Yf2Iuu08A4YtegX9LVVekZ_4K9Qo37AIKpTTnxcKvb9YVwYHhpLgkjEooatBAQYNbd2R1dIAKSpy3ms6-dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LxdlY0h_wwfWZqPuApig_Ng-pzQn_Oux9fBpj42DQSlMLytD7Fpk9g>
 <xmx:LxdlYwCmO_UBGs0d6nXl6xp3919bq5_FeyWe2LvdEGYaAQVHDP4NQg>
 <xmx:LxdlY1JKcIoNKkyNV3cuMLlQvKIg57v1YN3pV367htcTy8539UFv1A>
 <xmx:MBdlY0zzxyU7As9tmVy0KhSrJYANzXc3Y0RlS6EzckHySm1XfzpJnQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:44:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:19 +0100
Subject: [PATCH v2 62/65] clk: tegra: super: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-62-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oMTph+HV5AiIbW0s6QwIveMIXBCjzwSykoljGPeW9XA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt88u47UXNawWxJ5d7npqrS8Y5ZCrjUrXVe5hFxy9Zq9
 2Fq7o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNhY2P4ySj+6teunW9bdriyfdvwx+
 /i/PaO7QHvZyx7//qPyKvYg7WMDNd2xG5fZZx/rU7s/lfbEEuP87dn69i67s2tnSGyPd5SmxsA
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

The Tegra super clocks implements a mux with a set_parent hook, but
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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/tegra/clk-super.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 8ad62e04fd8b..c035f0eb030d 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_mux_ops = {
 	.restore_context = clk_super_mux_restore_context,
 };
 
-static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_super_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
 	struct clk_hw *div_hw = &super->frac_div.hw;
+	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	return super->div_ops->round_rate(div_hw, rate, parent_rate);
+	rate = super->div_ops->round_rate(div_hw, req->rate,
+					  &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long clk_super_recalc_rate(struct clk_hw *hw,
@@ -193,7 +200,7 @@ const struct clk_ops tegra_clk_super_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.set_rate = clk_super_set_rate,
-	.round_rate = clk_super_round_rate,
+	.determine_rate = clk_super_determine_rate,
 	.recalc_rate = clk_super_recalc_rate,
 	.restore_context = clk_super_restore_context,
 };

-- 
b4 0.11.0-dev-99e3a
