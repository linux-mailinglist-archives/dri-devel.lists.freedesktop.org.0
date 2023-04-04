Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB2A6D611C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A646810E1F2;
	Tue,  4 Apr 2023 12:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C7110E1F2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:44:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4A0F058214E;
 Tue,  4 Apr 2023 08:44:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680612286; x=1680619486; bh=Dorc64jjHYL/DZVTeitfdKXJrIfAXL8z4s1
 +gGwNBjM=; b=Nc4OM0qWtxW7NL1pCz++lBzJ04MADb+smNaW14LJBLv7wTrp6Lt
 JP5zTlnHXZ4sU6i2Lihm15OutO+5qyctmynlEG3cb5+HX3ah+sehfi3IjuynP1g5
 WtmhONIfeiBuW2Ve/7lOzZtbHoyUEf18aMoIB1iTeatpM4JSNbajRrVKNIf+z89J
 ENZYHqy8tmZDKxvpPoM1Gg0bR2+fqeGmxmO60PTgLbb9i+wGQhipynQ2z4BWJKQJ
 dTR0KGxfthCjtypSk1bIfZ5Q+74OBRwtzO2HcIF5xmoW1AwSKMJEt9rjYOfNXbxe
 QSaTMhPHUaMgtB0Hi28BD1Jb8v5DMGBXRUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680612286; x=1680619486; bh=Dorc64jjHYL/DZVTeitfdKXJrIfAXL8z4s1
 +gGwNBjM=; b=DN92++JnQuWpAKYlFeJHRhwfqDMIEdA0jhRTBbAiLndedbKLD99
 NnlQkDTy+ty9M08E17tzDh+BaqhDdlhD0E8iXgE4aTss6zL6RYnF+7NPFnaeVeca
 1zTkDzipJBKkGJjDZvPGqzDh0OzZfzIgABeSyCWn5bAjrPVa+nBWw/8AuJoTfUHX
 ri17ImS6vlRKL+Nd5rzKO2BYBzQfgzRkAMDW2UcL3sN7xSib9aDpK0CEg4QbxsEV
 MGemX2FltSECQtK48TJ1PmB/QddGT2xfUoF1Q9uSBTsJDdp5EhiSi//GcO+B1SlG
 wNVsQsAIdYltP0RTZrae5eEzQZ7SKw+G6eQ==
X-ME-Sender: <xms:vhssZGVNbnf5VKO2QDVVZ53ieCJQg0GfvDi9irZ0M_3h1QkGx5JPRg>
 <xme:vhssZCnOkSoCy0LXSPKgRiu7z1qlEUECDcE2i43b_PpNDYvLlUy4D3vsnlqLiBXa2
 Y9FZ-eylCRs8oGZ5Ao>
X-ME-Received: <xmr:vhssZKb1ebI9YDzTvP2FqornuBFPOBISPkfQFnxF4qA8RAEq05cd1seAeOwGS35_luXJSxkQhfvrdOtDSrJvZsXn55R6NZ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vhssZNUnjD5RA-pK5LwSx-M1ssJoyJUJCyi4t7L4fJ-SfrmAbLhWHA>
 <xmx:vhssZAkYFjgBh7ZbdT0j07RoMeJRb2Y2chxLKxMo-99PxczLYYL5aA>
 <xmx:vhssZCfuMjLLOcfMu978zcf9hVct1BnC88C9bE7Xm3eL73pbfJ_RwQ>
 <xmx:vhssZNQWtbSEF30_hQpPF8zDVFD86aKXm6Avt_oQY9FvK2nchFYszQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:44:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:15 +0200
Subject: [PATCH v3 25/65] clk: imx: scu: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-25-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=myglZFP5U0YauX2+ORXb9BlZWWBvHfHdzOFm1PQavtA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37emV5xc6rBt0nrPe8vn3l8aVSyeWrH288oUnxelB/YF
 yJ/+31HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJiMozMiyxYPi4+d+HZfUXjGZOW5
 D5N7X2wB+eZexs8ZvD8j+3vnJjZNhWXuumdo9lHVPGk3CZ6sOTLn61NFlbsmvO3UddV1k4DFgB
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

The iMX SCU mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/imx/clk-scu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 1e6870f3671f..66e49fea5f8a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -785,6 +785,7 @@ static int clk_gpr_mux_scu_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_gpr_mux_scu_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_gpr_mux_scu_get_parent,
 	.set_parent = clk_gpr_mux_scu_set_parent,
 };
@@ -836,7 +837,7 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
 	struct imx_scu_clk_node *clk_node;
 	struct clk_gpr_scu *clk;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (rsrc_id >= IMX_SC_R_LAST || gpr_id >= IMX_SC_C_LAST)
@@ -868,10 +869,11 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
 	if (flags & IMX_SCU_GPR_CLK_DIV)
 		init.ops = &clk_gpr_div_scu_ops;
 
-	if (flags & IMX_SCU_GPR_CLK_MUX)
+	if (flags & IMX_SCU_GPR_CLK_MUX) {
 		init.ops = &clk_gpr_mux_scu_ops;
+		init.flags |= CLK_SET_RATE_NO_REPARENT;
+	}
 
-	init.flags = 0;
 	init.name = name;
 	init.parent_names = parent_name;
 	init.num_parents = num_parents;

-- 
2.39.2

