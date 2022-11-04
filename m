Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C961981E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1CD10E7BC;
	Fri,  4 Nov 2022 13:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C6C10E79E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:33:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 09C265805A6;
 Fri,  4 Nov 2022 09:33:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568834; x=
 1667576034; bh=GG5ym4w6gS7mppovC+jUWC3Q6mS58OHFw/6k+J3fjVU=; b=S
 RCVgcuNLOZQWJqCmiFCaCWCIwu1itgRuWApbu0MWrG4xSFiOCksP+3wK8ALgy2Hp
 g5aiUqeQcPRAbTodFxK/Q5CJMQU/k/gI1B2LxPXSskE5fqULNkm5nQjz2mNyII/3
 lHaLe+qkI6KI+0IcuxnQzJAJtiuMfUqPEbm3QTrqOfI52LVkGl/fsxaZAhZKEBHm
 Ao7kPzZiIz2Dipr6AwqKNuJI4LcoHQuN4chGOTjDFKOXzG4oVj5g+uf4q1rZmfpJ
 QxPlZXZcM0xX+V2RcdFQeEj5vPX1DdnNrwAAC038o1keXCuMaymOugtaZmAlgZn+
 0x3MiTyhy7MIP31Q2EAUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568834; x=
 1667576034; bh=GG5ym4w6gS7mppovC+jUWC3Q6mS58OHFw/6k+J3fjVU=; b=I
 0O1xdRYDoueM7vK2wygcLY5do5ltiblZk6+oJdkoswTKR/k7tuZeYDmcfMKF5XHS
 XVq/mr4QXhMbuOqN3mQSeDXRbwUyaJ4GBzCdb1Ivx6/bbPpH+IQUZD6IDZCpUrRq
 l80OUc8seHcdJ49Co4eBzIISQVFoXJDSaQVKH66OdZUhoYTa5KXtspJlaf9l9snv
 kTtNAie1pzufoi+s8ETL6DxVtproo/QT2wIXO3I68HmScr/Wx+vXfzwUpoT3ova1
 5v6jBzokCkQPm9IVY/lSBFisZzx4HAUqG4rlyrWOpZXIj7NHA/G0FH3Fm5Th47IO
 Al2Fx8WFaY1T/chDWT3QA==
X-ME-Sender: <xms:wRRlY2F7BRScn46lR52E6lUU5ppwdeSQQxCZKkDSnUirxnRgIEg6sw>
 <xme:wRRlY3XKkJacmvdRpeKGKP56X7XjwdxEaggTxvasaYLgb3Qf7VdJ101j2QQdfQhcW
 HKbMGzqmd8HsY9M32I>
X-ME-Received: <xmr:wRRlYwKqx0LiyjvpERabe7CYkBdaiaGV68bGeHWrdGbVBRXoetUI6h341advKeIpVvfA19qpN1QkIsxMta2RhAQHIcFNbJ87XyEsegzV9Kz5jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wRRlYwGbfIwPEfNSUqi0_NrIVddrT4mtPMNn3SYuDkSvoOn0up3R3Q>
 <xmx:wRRlY8WpgMPF-C8pRgr_xJTevWzSdTYjV0Y8cMSUahNVyeTZVohvpA>
 <xmx:wRRlYzPj0a5xyN2jiP184QHygoffP2nN3duVIXTcczu4sL6uZRb9kQ>
 <xmx:whRlY5Vi4hHDzdOQtxKh55AAOjGMXzvmKZRqg1uwtZII0sjTaPuvqg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:16 +0100
Subject: [PATCH v2 59/65] clk: st: flexgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-59-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wHANmveZ5/10ctV/K4Ia+5unC0OKbDapXscWnzGylWQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt/ihaLmpGk9M3B/veFZ5Z39u+z5H337dDiz7uwFpnU7
 A6x+dJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiv6czMlw5EfDuScBWX6uW9I4DXF
 1K/4qV870X9/LGtazR2Z/UMovhn9bp3VEnDoc3WlzQuriXnz+1KC7fU2VqOf8Ui3eWJy5oMQEA
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

The ST Flexgen clocks implements a mux with a set_parent hook, but
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
 drivers/clk/st/clk-flexgen.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 7ae4f656191e..5292208c4dd8 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -119,20 +119,21 @@ clk_best_div(unsigned long parent_rate, unsigned long rate)
 	return parent_rate / rate + ((rate > (2*(parent_rate % rate))) ? 0 : 1);
 }
 
-static long flexgen_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int flexgen_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned long div;
 
 	/* Round div according to exact prate and wished rate */
-	div = clk_best_div(*prate, rate);
+	div = clk_best_div(req->best_parent_rate, req->rate);
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		*prate = rate * div;
-		return rate;
+		req->best_parent_rate = req->rate * div;
+		return 0;
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static unsigned long flexgen_recalc_rate(struct clk_hw *hw,
@@ -197,7 +198,7 @@ static const struct clk_ops flexgen_ops = {
 	.is_enabled = flexgen_is_enabled,
 	.get_parent = flexgen_get_parent,
 	.set_parent = flexgen_set_parent,
-	.round_rate = flexgen_round_rate,
+	.determine_rate = flexgen_determine_rate,
 	.recalc_rate = flexgen_recalc_rate,
 	.set_rate = flexgen_set_rate,
 };

-- 
b4 0.11.0-dev-99e3a
