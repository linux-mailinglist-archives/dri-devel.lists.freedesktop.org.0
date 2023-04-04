Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C76D615C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE52210E2C5;
	Tue,  4 Apr 2023 12:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBC610E2C6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:45:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3E74858219E;
 Tue,  4 Apr 2023 08:45:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680612317; x=1680619517; bh=hI0DF1/4sfitwvTP1oM8745mxQldered9RT
 n+DvwCik=; b=fiz3HmS1pc56/Rv7fGcU0FnJd7IDRBXfO0/ZYjIjXiFe3HLIcPu
 Uy9l8YhnXieKjyvGMQRK+sAoUs0ITzMjzYIQMbyqfPdB+LucjMrYvMRxjfIRxUo3
 qnz1Lo2WX+7WQ4v46vm4jeQUXjkaHOjYiwH9pbNEn1hWM0Lb5N6oB1OTBU5UnEmW
 gWoS1Icow26s4Cg4kBhQ/B9i5lrlIq5hZ5toczP3sjPkGDyau6j7wM6lEKtzKXl4
 Z8JK4uIQlB3jv/fvVrFmSql7zpm0/XdxeAF5x40ZookIL9IuYuslLX7iNY5zb+L0
 bkoE27X9yBzywktIXnkeT+mmHcUzFlHQ2sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680612317; x=1680619517; bh=hI0DF1/4sfitwvTP1oM8745mxQldered9RT
 n+DvwCik=; b=KifSxobpIcIBDKyDpjrV1LesmzuTSj0S4Z1MlxoLxF44lXfACVs
 zdoy0s62mlx+b87FS3aRJieJV68icCy8CAsS/2dvL5xTnNxlTKm+BUy27MNkXzod
 D/oimLSIJGf7jHPiD2US+7iKHMzYwcuRFKclExJ4BDGsaqeC26TENGRmBUNGurwx
 4WuYUD7pSppASIVpC6EAxsoHFIoOcAXvkB8hFtEjHmB02dG5y8nbeDVFuVmzHwlM
 jhLYmv4LcofWfPXAO1dsqLw5gZz7XQDaVecQH5GoDTrLIcOKjqjelwkUHCkxdM03
 dHvW3Dn+RpjMN1CK0R2nxNkmHQVfsD3EdIg==
X-ME-Sender: <xms:3RssZDN4AKgxIhoLMeimtPVKwJnM9xjKkqxp7Lwgoxfbb8X93Hlijg>
 <xme:3RssZN8bK0UhqZt386Q5N3NmB3HaJxtdFMgU-mgkhnf_D6Sw0E7tcMzWdU_R83svj
 OA84orzStKc8Vv0kGk>
X-ME-Received: <xmr:3RssZCSQWTlDYsJzDVJRLpigJIBfVqO0PHSq7Ytnt67sJzm0l4z1SY4LRRsj3LFzuEAo8A2FZBgMfcEloX0mHoZy5LgKiMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3RssZHsjtkBSnDnj4IygwfQ8DL7CAExSymscyi1VnD3mJGkj9m9anA>
 <xmx:3RssZLdhFc3tEAJaFZ2aEzFAyed5fg8nQWjwmG_w0njhj6DOtKJM4g>
 <xmx:3RssZD2hf8-8qFP6Qp19b0XFStHdkBo3EOPJrotUrr3UE1HdE19rzg>
 <xmx:3RssZDI35ksrFj85i3yMpGocYUxgIkqpc3EuyJSEv_rFw2gAVPQ2Xw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:45:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:25 +0200
Subject: [PATCH v3 35/65] clk: ux500: sysctrl: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-35-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2511; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=goOY51Ta6SNnyiH5vPhxH0frt+1JoKiJ7L7Gjj+3LFk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e977vHvqLE/Hajq0TYP9fPizLnXr3K/aQtQPhcTbz1
 rcMXOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARbQVGho2CR0yv3/c12SOk3+gdyb
 ZlrWSZ88x+j8Ka1Td2FBybocnIsI1Tkn/Hw4gLgfaXV320aZ9zzX3WQxtT9yurFl34vZ6BgREA
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

The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/ux500/clk-sysctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
index 702f2f8b43fa..d36336665b6d 100644
--- a/drivers/clk/ux500/clk-sysctrl.c
+++ b/drivers/clk/ux500/clk-sysctrl.c
@@ -110,6 +110,7 @@ static const struct clk_ops clk_sysctrl_gate_fixed_rate_ops = {
 };
 
 static const struct clk_ops clk_sysctrl_set_parent_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_sysctrl_set_parent,
 	.get_parent = clk_sysctrl_get_parent,
 };
@@ -220,6 +221,7 @@ struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
 				unsigned long flags)
 {
 	return clk_reg_sysctrl(dev, name, parent_names, num_parents,
-			reg_sel, reg_mask, reg_bits, 0, 0, flags,
+			reg_sel, reg_mask, reg_bits, 0, 0,
+			flags | CLK_SET_RATE_NO_REPARENT,
 			&clk_sysctrl_set_parent_ops);
 }

-- 
2.39.2

