Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE3A619796
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEFE10E788;
	Fri,  4 Nov 2022 13:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5CC10E77F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:18:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B9D1658046C;
 Fri,  4 Nov 2022 09:18:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567919; x=
 1667575119; bh=YPE8ExSs4d4LTvnXSYBVZkXRbapPJ6obpuAeld6klEU=; b=P
 tmveYw5nLXiJ+/zabi31GiaQcHOpM7y1cK7cVDgxmbINAy4odu4apdyVIY0h9QrU
 nHGp5w3KxZGu7BLLECSXCccBwpvZSPCBtCHJe8aKTkRa2/RXxvtTlsuDv/zLWeO2
 bTE9yx8jgoKtSGxqyubIW67sP+raBQg2no0B2nf/ijORhIhwOsNhXKpfJvXb5/rH
 U5HKs966WPLfjH1Fz3M564IMKA4aOHTCia6NSjORQauJ9KIj/cwzhEaUdi6JGx1h
 LWqXk08w39Gn6nkeSdG2DlT8qttZjbHVNEARtBKJjIyp1Iv4OYUJWcCsmPkfzgs0
 bcbsEwjeeDMujPdwjUBpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567919; x=
 1667575119; bh=YPE8ExSs4d4LTvnXSYBVZkXRbapPJ6obpuAeld6klEU=; b=s
 tB2czEvX4BDMfxM9zlNk5k8xasvbCujl9jiJp6K3KnHPNgDJvw7PFnUzfnsPCfMH
 onK11uy4ITiU6uLdq5K0KSC9QzuYLGYxmdEM4RagFMXUv4K0PAipQBIhep8vT4TS
 XdtU+vXo00gVDf+uVGDeqaVLNWEiM56TbShVGNmCSoXj0TQZUd/LOfHGEzKl456G
 ilwNzS+O3NuzGebEBmIXBzPlg9MFPR7X4RzkW31wxpH57FEzvcB36JVEmhk0AcU8
 0nX/RMYyB+7BBYF074CcwJ8KMHwu+vIyphC1kT8cs++MlzvVch5kYpMgD+GYLknp
 VmqyApPJHL9oDGSTQXl5w==
X-ME-Sender: <xms:LxFlY45lH0JOZ6byxFuUNybyFRoSeqJH_B3HWOLcmmR9TP_EuN3kMg>
 <xme:LxFlY57teWcMTwA8Busgyw3vvsut41ipl31vK19ShjjNacNZ4qaF_XY8rFMCh7swh
 fodtn5IZoZIkeAdqqc>
X-ME-Received: <xmr:LxFlY3d4bqOExPWW2zKzX4jsW_a7CfQXL4_v5_pCDrXB_Xvs3LfNS7wnj6j7sWIkSmhzQKns5_7hwjJO3iZWAND8565x4fwsRcjYnDtOFnD2sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LxFlY9Kg21rMeEyGzWLd_kPF9ILJQxqq5497ZWE8ddJaE7pekBy1PA>
 <xmx:LxFlY8Lp25vNE2kFXvACZKTSh_9fn01R7LKTTEOwtRgKZGqxIyR-bA>
 <xmx:LxFlY-xvZSzoQAwDnwdsAPqDPIBYXHEW1o1SBnh5nyY9IsHtOvT3ow>
 <xmx:LxFlY3adOUeGZ3CPUdtW9Uh94ceHH6IGK42C0bAOX0G9GfF3lbT49w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:41 +0100
Subject: [PATCH v2 24/65] clk: imx: fixup-mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-24-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Y1EX8G8pftDxQw1Ys52sH8o9+GAhW5bf3l3YFzowBDA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8Kz2/bolLusfHUS28mXpaWw6ePtX+OPm7LUjL3p6fc
 WZagjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExE7SQjw6R5H7qu8Ka9sXod0MMvcc
 r/7OGs1zknzlTPbKpxkWXx8GX4ZxW4dMKRjSLZsmbFQfzGNfeMlGrvpRx4oHwz+01b28Fl3AA=
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

The iMX fixup mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/imx/clk-fixup-mux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-fixup-mux.c b/drivers/clk/imx/clk-fixup-mux.c
index c82401570c84..e32c3b22ff05 100644
--- a/drivers/clk/imx/clk-fixup-mux.c
+++ b/drivers/clk/imx/clk-fixup-mux.c
@@ -60,6 +60,7 @@ static int clk_fixup_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_fixup_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_fixup_mux_get_parent,
 	.set_parent = clk_fixup_mux_set_parent,
 };
@@ -84,7 +85,7 @@ struct clk_hw *imx_clk_hw_fixup_mux(const char *name, void __iomem *reg,
 	init.ops = &clk_fixup_mux_ops;
 	init.parent_names = parents;
 	init.num_parents = num_parents;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	fixup_mux->mux.reg = reg;
 	fixup_mux->mux.shift = shift;

-- 
b4 0.11.0-dev-99e3a
