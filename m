Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76B6D7C7A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A323310E916;
	Wed,  5 Apr 2023 12:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163E310E916
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:25:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 256102B06760;
 Wed,  5 Apr 2023 08:25:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 05 Apr 2023 08:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680697538; x=1680704738; bh=ra217NNN+jZc6KJRT2qXuBOUmYWZS9orj2z
 niOS1IkI=; b=f7hReTkfeIxIdbCk6LMUEmXNh/8Un3OoNbvXdGfZwalPOkSxwXE
 b4T9znyrJefq22Y2syTGRRXP+3ut/i8xDpAdE4b51L9ZbNYm5Y2aRPEFrfyqxy5i
 ie5E5EVdbdhN6GAMM2MIeC2V8SH9O/mslf/tpPoVx5muluKo2+BId3XC/hcoANAl
 VF086V81bir4bMdX5HhPQ7OLtmkrqNHLKWMrM/LeQqSGwouIoEQGYCUS75DnrfLH
 vx123sEMDQxpXn7myhbTnrkj8tP70yqZUY/BvosTHDP5BUeCWgm17EjNmQ2Kil0l
 JmHKW7/vtUl/vJpO/BiBXY4NQRjcBVGHY4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680697538; x=1680704738; bh=ra217NNN+jZc6KJRT2qXuBOUmYWZS9orj2z
 niOS1IkI=; b=Eim1X+gGxDfIWkCW7Tu5hodpLwxyZV3fw5bO8fVQfObPq5yImdv
 E9nt5ngwZJYRn2FirXOFtNxCbu4lsxNPe456qH2p/npjmTHqf/vZ9mKp42FIHXEF
 Rv0mVKSA963ybvNuNHuyYfx7ZnrX9V1ZHNdlsrLokArgktO6+T0yrQ5f0vgvLovr
 Ggfg0SB2ZbMxJff8THPl5WdIuBoLU4HALQzDsbgq4xCgmc6P49r4dkThPVpoFnKf
 hseTtyMmmJCho8Cm3L0wEPBfHyZUAwTB5T1ZExzX4R6f0+UkS5b1+CcqKLHs6ePZ
 dIJ53ErJYK4t5pbatdQJ+mYeHrdaeAeI86g==
X-ME-Sender: <xms:wWgtZCVvNuzoDATnIqnPPZXDjjLtbBQn11FfSb9jNuuRe3VQdPwqBg>
 <xme:wWgtZOmsGk_zcpcmWFJhtSudZeYeszviK9185WaBD-VQA4q0cXhbc-t_poQSNr5YK
 Swm9kfilzSVZjd-WGw>
X-ME-Received: <xmr:wWgtZGZN4RGfzrewOBgiOxerhwx4mH3MWfUNAelq6cx9Y72km-E2LE1Dob137xcIZ3sSAEMCkzuVw8XIdtD0Q1TH3iLkh2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wmgtZJUEYxuFlBgW5ITTIodg67Ti-qBLF0Y9epmePlLZwTnUwYWeEA>
 <xmx:wmgtZMmV5koPoxWHeBPBXtosWwtAX1DogWRnjHZUOD87ETtarU0bwg>
 <xmx:wmgtZOf48vIy5Q2_TKt9QYUHJIN2OxO6T1aVeuWGjaxJUcCK--j8Rw>
 <xmx:wmgtZJSqFTTvKdFpzl7BoRLbqCl6x7h04wN1HmJjswCZkYWSrenRyGvGOPQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 08:25:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:55 +0200
Subject: [PATCH v3 65/65] clk: Forbid to register a mux without determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-65-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LyE1v2/6bw3jiL0YUNQzMPdf0mqkUEJDhu2UMUH0hgk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna33f4dR+sur5t2oLAT7/2VNx6M2HrBH+Tg1uVdd37n858
 W3LPp6OUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATKa9gZHhz2dG0eXeJWfTy68FR+v
 uPfdVV3ST/46S/w9cNDzc1L/7ByPCytvXxqVdd9zg3H2l1Xlpx8Vt/lEXQDqPCk3eWsOksW8IMAA==
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
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The determine_rate hook allows to select the proper parent and its rate
for a given clock configuration. On another hand, set_parent is there to
change the parent of a mux.

Some clocks provide a set_parent hook but don't implement
determine_rate. In such a case, set_parent is pretty much useless since
the clock framework will always assume the current parent is to be used,
and we will thus never change it.

This situation can be solved in two ways:
  - either we don't need to change the parent, and we thus shouldn't
    implement set_parent;
  - or we don't want to change the parent, in this case we should set
    CLK_SET_RATE_NO_REPARENT;
  - or we're missing a determine_rate implementation.

The latter is probably just an oversight from the driver's author, and
we should thus raise their awareness about the fact that the current
state of the driver is confusing.

All the drivers in-tree have been converted by now, so let's prevent any
clock with set_parent but without determine_rate to register so that it
can't sneak in again in the future.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f9fc8730ed17..4c1f28fb8c1f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3746,6 +3746,13 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	if (core->ops->set_parent && !core->ops->determine_rate) {
+		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
+			__func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (core->num_parents > 1 && !core->ops->get_parent) {
 		pr_err("%s: %s must implement .get_parent as it has multi parents\n",
 		       __func__, core->name);

-- 
2.39.2

