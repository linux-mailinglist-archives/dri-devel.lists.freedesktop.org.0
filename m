Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6B1619771
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2E510E74A;
	Fri,  4 Nov 2022 13:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA6010E763
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:17:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AE6EF5804A4;
 Fri,  4 Nov 2022 09:17:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567878; x=
 1667575078; bh=ZwtWu0JKDLR1Byh5NP92pAZeUFp7QBOGOLGADdMx8VY=; b=G
 JGUxPP4wXZDut4uwJK2L26Gtsc/nPU/dLypnvFRtKBwgHKJVUqZ6iqdzA0NfdTi3
 8GKVe24HnLDN3ZL8po6yZUxv2292nCU7FFMzxuO6JO0WFNR+Wkc1XLwgCrOAEepO
 CiLfGF28RdkDzDxWsGfjNuIHSqJRvoC0TRCqjiKzY/SxPmPisPiGx/zk8+YFay4f
 HrtWYqldqbcV5Ob2tMRuxYTkpD7rsCdW920sd5FOJIj8rib1Tpy6PqUTzrFy+KTO
 1tCfUKqMyJ/oRVP5HISbwHUGlNINpnE0Ez9tYRPNSSJZSlXJj+Z0/Tj7KUkNERQR
 EddKNTWkTSx4NFDzivo4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567878; x=
 1667575078; bh=ZwtWu0JKDLR1Byh5NP92pAZeUFp7QBOGOLGADdMx8VY=; b=F
 UiIdWG1COOLexRKazWOWcN+/vAxMoXjvhvzzsiOU1Tr4hKE65IUxi4brSFaU2SM8
 /aNdZ+unXJE2QUSbfi+hqwC0oUmSQcZ/JyRm5K+Z44fsOQSN3nZNqRhbqBYHbShy
 PaY2Pe3Pqz9qtM3PEFsL4uXiCUQ8JSOuVXEDieTyUdrforRxjBPt9thi/wcsyibz
 MQFavmVgtPbkMAIEplLD4rz0rsz+MFrpZqF8aF4+Stwq8DYGmiLmRgJ3TMKeZixN
 pzVWcfQKB52nA0tYBU7SLughSHuM/CZllJQf/v4V1q1ysaSxYBajEfo1qUvFE3XO
 KWoZNrz/jlaKV00CJvraQ==
X-ME-Sender: <xms:BhFlY9pnNM7gXeXC1Hj_mk00y2oM6saj-mNprAIwbIEBWXogjAS89g>
 <xme:BhFlY_ovjPLnCRchvY7tWL9yb-9rzKRgpydIOOGRuRu1pXBvEhsv6slQsMGVA_3O9
 RrnQzpx_7NHoPHGd3U>
X-ME-Received: <xmr:BhFlY6NhozZtInQUHjR66AN5ndLUadwz6pRnaKftf_3ZAUCzVzX7EMFUjlTSJThShFr7uX8VLydU3zDvAVTHPPGt9TEbacUylJo0rkXggoKGGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BhFlY45wcK7e7eC1gUUL5Gh8TSlWX6_UEFyrfKA5-1JtRRMtIe5ZJA>
 <xmx:BhFlY85EK261fXfrOmHbc7YGuLNYV_0ekh8JvjPrtzDBPiZouhWnEA>
 <xmx:BhFlYwj8C1vFc20Ck6fQoN3C3i4v0_Fer84I1ww1UtX3CWOhdCUhxw>
 <xmx:BhFlY_IIZFeEK8fHRWJwN_qHLw1HMrsfB5edZcRHOBn1nJtG80Jc_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:22 +0100
Subject: [PATCH v2 05/65] clk: actions: composite: Add a determine_rate hook
 for pass clk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-5-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2565; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ldQa1y5iEWAiQ5ZhkDsR48TuBb6c9j4eafc8yAmK7Ws=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp/4Z5memNzjdjrghcLmL/MW8JUum3egX+BUTfL5Kc/e
 C15M6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEkowY/ldd8hX6+FeOL/vs8ZYpDb
 nsV9/kc7CEcPtfifM9b+Cu+5Hhf+KPn2W5MpMCjIMfel1RefXT8+4+g4godesVTMveyzK08AIA
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

The Actions "Pass" clock implements a mux with a set_parent hook, but
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/actions/owl-composite.c | 1 +
 drivers/clk/actions/owl-composite.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 101706e0c66f..4c844a5613e4 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -189,6 +189,7 @@ const struct clk_ops owl_comp_fix_fact_ops = {
 
 const struct clk_ops owl_comp_pass_ops = {
 	/* mux_ops */
+	.determine_rate	= __clk_mux_determine_rate,
 	.get_parent	= owl_comp_get_parent,
 	.set_parent	= owl_comp_set_parent,
 
diff --git a/drivers/clk/actions/owl-composite.h b/drivers/clk/actions/owl-composite.h
index bca38bf8f218..0a0eecc78344 100644
--- a/drivers/clk/actions/owl-composite.h
+++ b/drivers/clk/actions/owl-composite.h
@@ -104,7 +104,7 @@ struct owl_composite {
 			.hw.init	= CLK_HW_INIT_PARENTS(_name,	\
 						     _parent,		\
 						     &owl_comp_pass_ops,\
-						     _flags),		\
+						     _flags | CLK_SET_RATE_NO_REPARENT), \
 		},							\
 	}
 

-- 
b4 0.11.0-dev-99e3a
