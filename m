Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F4619791
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F6D10E77A;
	Fri,  4 Nov 2022 13:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE85E10E773
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2559C5804B7;
 Fri,  4 Nov 2022 09:18:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567896; x=
 1667575096; bh=IZ9UQ4DbVzbIJsLd1t+7sQBLMSQknh79wDggweQ8Tfw=; b=H
 E9+GFigRxmJ0btH19cuEF1I+Q7oSyo2VB5yjUzcKpwPw6+hgNZssum7qye/gfJXD
 oI1LVsmfkuX1QxODfaM6D/fBolvl2JJZE3GG2YY4120499IyiZhQ/zZHEeyzql+G
 EHFEX0WSOgf83/dH4VWUEcPcdoEQWJPYaN1ZO/u7cKqHYraZnfidoD6VyixptwRl
 oRECi31IwUGxrMoGE6yxPw+n9SsBdtMG0eSB6/KYQQz1dO6cnsRK0BpmdDMit3f/
 puOZmH4v7PuvPJRmPPVQhSNbiguZ4IEUuG6c0tZv339equzgA3yLprb/2vQVNQH6
 uYstgbrwCZzIZNR6dJnzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567896; x=
 1667575096; bh=IZ9UQ4DbVzbIJsLd1t+7sQBLMSQknh79wDggweQ8Tfw=; b=h
 8f/i8gyuyu426UDXEklkTY33MOqF0cm6Q2e3NUACnLO/Gvy1hKqFyetHdmpF+mJR
 kwlIqEBI9vvMrZZ07BA8CYO4l/+jWb281w0FmNHoulubbktqTtoiWBHc+aG9yO2R
 vzfvfU24V7E/IRWWy7cbkyNJJr48uX6w+wzFByTpGUzrF+JydvMncB9v5Tzg7jiL
 PaOym40VVFsCRmcxXt6C2VrNRll49V+3Ju1+pnOsDYt+3Zbk43td+kekTjG3OypV
 DEUAVaU/Tqww/rI6GuIKA64x9g7nI9guZGNtuV0aGi48kMUJpTJu0AiovAeZ0Qgy
 xy6lSlyu7kGVVeiDfp9wA==
X-ME-Sender: <xms:FxFlY6xzxWw1KTM1-JK-YpMrD-GmKMhd11ZzDrdioMVhi0q2564GZA>
 <xme:FxFlY2TkhMhX9MXoKdxN_Y59CtRwRXl7yUc0ZUwIDVbE_O580Swtaux1zNSXZ5TiI
 30cpHnsAyDel3GoeJ0>
X-ME-Received: <xmr:FxFlY8VuVwGxLoBe-zCD0POUao6810PwWDcRFumCdEGvclWoOMGKJg5zQ_V673XmDfOmP2bxE4SWWjGljbPT5r_k4N_1Pp7np6Q20iLe5h1i0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FxFlYwiUPlgMVVdq7ScRhFtUXpvqvRacN7JF9UXvhsxiMiBPAVXjAw>
 <xmx:FxFlY8D7R2-9733wxJXNm15zZ--qURF7uj0GxFist4o5yokiqhfPuw>
 <xmx:FxFlYxJNuyPF80-pHicN0eIf1famH6qmcHnMJjCZpIgdrSU7rdNQ1A>
 <xmx:GBFlYwxUFtOgWE5dNUKGZwxb4kgYvHzzSjla-7XedLudEJRE79vKFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:30 +0100
Subject: [PATCH v2 13/65] clk: lmk04832: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-13-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Qcdipb0o2ae/N8jSEKXNaEcjkI/bera5lXalhrYMenQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp91ojkiNA5wfu7ViHnF/fB8QWK6wK6jDjnn/55cf5Nt
 Rc/XjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkSJjhn2GvrJd9wuOtbOyub4KEai
 3/bmF26akq352iUJadl1BixMhwfa7Pj9S2Fya3301mOn58f8HWXxOWGCh3Ln5xR8xn0RI3TgA=
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

The LKM04832 "CLKOUT" clock implements a mux with a set_parent hook, but
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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lmk04832.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index f416f8bc2898..f68bb0affdad 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1281,6 +1281,7 @@ static const struct clk_ops lmk04832_clkout_ops = {
 	.is_enabled = lmk04832_clkout_is_enabled,
 	.prepare = lmk04832_clkout_prepare,
 	.unprepare = lmk04832_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = lmk04832_clkout_set_parent,
 	.get_parent = lmk04832_clkout_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a
