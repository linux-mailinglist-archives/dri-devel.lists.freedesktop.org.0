Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E6619811
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90F010E7AF;
	Fri,  4 Nov 2022 13:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1391710E79E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7314958052E;
 Fri,  4 Nov 2022 09:33:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568799; x=
 1667575999; bh=HRYqZuPrTxR5ocoXQl58H79LzXrTK4oe+XLQKgDqwow=; b=n
 YbfPD+YOONVImaVJW6okA+Ho8OWhjFirvYIkpf0xTJaiGhVQsUda3N1lFlEkumFp
 t0kmgGTmNMLB6PSpBBcrS4uX7lfIxkZVjCzDyQxrDvOKR/itCqSigvJAilAJV7an
 9h7xSGRnhjGBVM//FChVggcsrWpiqDOgpkOo6+FmtnYcZQ4x2KvSCfZQRmu0OONw
 zVDDxIkJtaaVrNlpdfCCg60bttz2E9kDKrk8U9hxB9EwTlXr6r5YbXSrY+Zy1q5T
 OItYukj8nHhe7X//1OAM7x8U7SlAjg4lbl/JBQFwB0jOFNs1CicyJ/l5iEHsSyVr
 DctsKBlEWFf9rvoxNhVSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568799; x=
 1667575999; bh=HRYqZuPrTxR5ocoXQl58H79LzXrTK4oe+XLQKgDqwow=; b=E
 n2m9L128afacmzm12GvhmuldgE/VzDJfYvnOaFGiWBIyK+sPY3YSYDwUHLnRJsjK
 5tygCdoN/FihFV2m52kks7hLr0vPDYa1Hf1DZJvQop2/rocbvLsbP1yxQdDRJMrB
 BlrjHz6S+DP41pU1Sb2JcHK45EK8OyzV9q8o66kcHQeFO1/qHgjHirQggrvUZ1ea
 f2ydufWuTyWX5Bsc430VCmQf9xUzBjqs8Fu2M6oI12hO04MBZXxqOnPdM+NXwRc9
 j6C1J5RjvnLh5RyZAC+8MtacAm2EFTun+r3JpQYVRJL90l436Pqgs1Z+JD8g8ld2
 4kmmcKF4Dyfbbeholc8bg==
X-ME-Sender: <xms:nxRlY47sz5BRx7ryI6nf8j9_1djTZLr_4hb_Dr_6U85TkrGTLOuX6Q>
 <xme:nxRlY55o7fUx0abCmPU4-sYNWgT2ap4Wo3V5Tl8mlA8Ujdy_LPmEpgWOEAmVvzOoM
 WXS_-vrrdWGMipX98g>
X-ME-Received: <xmr:nxRlY3fXG29weQ3MpcFmfANZfMywh6AgnkI1ASmdzTyz5xktTq_WdnLpoHXK_eQ2KBno39EfeNaaoOFL4dM6Wet4CfWWFBXbHc57rxsQCgg6DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nxRlY9ITB2tr_VmWvv6IXoM9k5tbzNYdYn9F-dWWZbPmBfFt4ElUnA>
 <xmx:nxRlY8LgrYtyX8FpfXFGW_-3hDosvUN3T1z8eul9544-N9kD6yLEaA>
 <xmx:nxRlY-yataAtvMNd8BggVnumO_AWC0JM0JCE2kyKGOWGSXl1R7COUA>
 <xmx:nxRlY3ZApGGBTXyp71Hgdy-_lEzIPmJ0zg9EZhsLfhgvn_OpTztT-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:01 +0100
Subject: [PATCH v2 44/65] clk: actions: composite: div: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-44-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=aQqMQVxKATvqDxq+DQ+zQmlJOI9IGNizwFw3mXLyv8I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl89WM6nlJ/6XNTDuPyJPVNdnoGWxTE3To55q+w2qSSx
 zbjdUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgImYcDIy7P9qydHNZPtl5uqqp+67A5
 6liTo93q3ge+nutJwVufH/LzP84VnpWrRB6ajXp+tByy73Ls/9ascwf6GbKMseZsaqguJwBgA=
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

The Actions composite divider clocks implements a mux with a set_parent
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
 drivers/clk/actions/owl-composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 4c844a5613e4..d66b268563d0 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -53,13 +53,19 @@ static int owl_comp_is_enabled(struct clk_hw *hw)
 	return owl_gate_clk_is_enabled(common, &comp->gate_hw);
 }
 
-static long owl_comp_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int owl_comp_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
+	long rate;
 
-	return owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
-					rate, parent_rate);
+	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
+					     req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,
@@ -152,7 +158,7 @@ const struct clk_ops owl_comp_div_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* div_ops */
-	.round_rate	= owl_comp_div_round_rate,
+	.determine_rate	= owl_comp_div_determine_rate,
 	.recalc_rate	= owl_comp_div_recalc_rate,
 	.set_rate	= owl_comp_div_set_rate,
 };

-- 
b4 0.11.0-dev-99e3a
