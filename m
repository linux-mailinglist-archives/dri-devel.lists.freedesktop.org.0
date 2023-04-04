Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4F6D6076
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55F910E23D;
	Tue,  4 Apr 2023 12:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F57310E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:34:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 94A0758209C;
 Tue,  4 Apr 2023 08:34:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680611644; x=1680618844; bh=t5jLLvMqXAp7CQvrRZGl78LdSm3ZqVEfQM3
 /ow3aKHs=; b=fn7P0HSVstPikUE/Jm0HDk0/EqHEPhHS+eoGm3f+45eH4FlJE7l
 TxuXfjIEWocb1veMtcG18iv2cVWQqF4Gik6Q8oKSrxtwPxEc70nmzTJgol3PGZ0Y
 UC89xIjS2wiEpTG+2T9IcsTiIyOHI36hUsKDHnACk/xESWNVphdieZw3NgFRcmMy
 skkE/ADKEO5QAhNez79XVrwi0zbsmoNid+m1QIeDpEFiCloB7y+zGaUDgHB6RPSO
 RBpf86s7jyseTwnGhOYnQoDKdllC4WcM4WLQVzwaG9Lc6nmxayxKgDVja0FhrGOb
 UDHoIO1D40iEGbcwuUKljt8aiBtMQTPbsAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680611644; x=1680618844; bh=t5jLLvMqXAp7CQvrRZGl78LdSm3ZqVEfQM3
 /ow3aKHs=; b=t0TfMr78JiaCpFIDtuxWkUkea2i1oHHB3AL/43Fgh6LRF1UklvG
 ZC2UbZ3V9FghQPBQo864CPZ65Djyy07qEkGriJKT5RPxAIzov0n5lEyUYJASSHoV
 hcaI4q+g5hxxjiQn0JFwBrj3WEsApTuXlboC1WMrdg7RRvavItZyV/kJVKa0f/ys
 FkHIPBCzXPRYdPiUWYLL1nVRmLs8h1z+2kCk093rIqeFUizcD1NXP4n3hG+SljKT
 7wmJKUjhoFIEUhB5G6YzaQWyuGT0F4zKJDhCi85StoYa9/KQDoUziTeh0wyYOiyZ
 ZPjiu+hW/DDpaatNiocvh7TjUZ+hHFse3UQ==
X-ME-Sender: <xms:PBksZHGcPByHn2WUke_rfJ-TeGGQeWxKZ_aaS-Iti7Cdsf4GEINfSw>
 <xme:PBksZEU-fvjwt6v6DTkIKs2tQrtq4pAPvLEJ6-YKUCSclZBgu92DRQXjqqsptWoWt
 WhLvDETGtVCGYkufp8>
X-ME-Received: <xmr:PBksZJLZrm6u7ygLTpE9eBYqomEy4iKxbI6bvcHq5H4Ve-Nr8ju6BRBjJhPv2YdSyiYlSJT-7ABqdiWapyV3cDOQ4hCk6Dc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PBksZFE7Z6toaLxS9op5QpDo_h6MEI4FG5kuLpncNu-hUdjthlSxJA>
 <xmx:PBksZNXLLuPILMCu5FbOhdtxYNi8Ghjm2bhcXtojRvlNtlyEMsCYWw>
 <xmx:PBksZAPEUOUBfwY_fmB5xGttsB8fYe5EKKE5d3_hgqF8CqyQnZAaTA>
 <xmx:PBksZIDl8Q_fi6sbQxBnXGOu0GlXvzvPw7GAql3QWcN_HQe7agZNDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:02 +0200
Subject: [PATCH v3 12/65] clk: k210: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-12-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2424; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=KFLuPSYbcVNTvQ0zxQn1qVuN9mDZm9hpkaKPRjMX9+o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e6vfwk4cpS9fFQXmLRkvdPNL1WS7pP3S7Ili335HSw
 ftGKjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEykjYPhr6S9jvQtLVe7ZUELj+s/f6
 l2Ir3zyUrerXybIpb4bavuy2NkWFoxvSr9npt47TLfbpf+tTnqTB25j7ZYPOErYC59XybLCAA=
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

The K210 mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-k210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 4cd6544ab102..934ed479de57 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -780,6 +780,7 @@ static unsigned long k210_clk_get_rate(struct clk_hw *hw,
 static const struct clk_ops k210_clk_mux_ops = {
 	.enable		= k210_clk_enable,
 	.disable	= k210_clk_disable,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_clk_set_parent,
 	.get_parent	= k210_clk_get_parent,
 	.recalc_rate	= k210_clk_get_rate,
@@ -832,7 +833,7 @@ static inline void __init k210_register_mux_clk(struct device_node *np,
 		{ .hw = &ksc->plls[K210_PLL0].hw }
 	};
 
-	k210_register_clk(np, ksc, id, parent_data, 2, 0);
+	k210_register_clk(np, ksc, id, parent_data, 2, CLK_SET_RATE_NO_REPARENT);
 }
 
 static inline void __init k210_register_in0_child(struct device_node *np,

-- 
2.39.2

