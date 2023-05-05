Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9858E6F81AB
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 13:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9805410E5D5;
	Fri,  5 May 2023 11:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE8D10E5D5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 11:25:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id CF5502B066B8;
 Fri,  5 May 2023 07:25:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 05 May 2023 07:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683285953; x=1683293153; bh=WU20FpUx77EC9SQ4SvyGsBOJEHNPQAGkitA
 hRG2bZ+8=; b=cgeM5GXMn3UxomTuwWA6AkOxgVn1PUeJmY+HSkE1TZA752i4fMf
 QlYTaJ3UBsrM+xmXXoB8aMPoNfu33v/+uNcOH6qdiut5C/giuLiiL+5xpPL9JQ3q
 KBZI2kK8gg4c7gD5R7CpKcY87dEyeTl7s1nF18OyeKxj9B28kPMuyI7bzaLQuG7F
 jUCWx54c1O0WZ7iMU4OguTOmfgUWmsnRtWbzh20WYFo3Z2hV6z0lK9Rpe9SA8+gk
 xun/BjXaV1djzqXT5STJvMBm9KjZTBCAJ3fnpgoAoMk4b34q1MzQLNEwCiR0sj6I
 Yfq0t+Rzah7rVMv1mCoZhd7NmbmoteVaanw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683285953; x=1683293153; bh=WU20FpUx77EC9SQ4SvyGsBOJEHNPQAGkitA
 hRG2bZ+8=; b=jr8lN2ghqcDZ5kqJHWWrVG+JVKxrGxFjiL2Fo6F+tO6khTu9uNC
 3Vzfo/OsYMLD3RLfc+/5PSx3qtINZwp/2/Qs+vt62FUAIp8X+tN87wRyDj5pE/9y
 PJokTD1FNIRNQR0hzIJGElMJPY0E/L8AV0eT2rJj7nhin7Vj/nnbY7UhIGMzeYDx
 iZDx76QA1IsHnrUbb92BFyco9yHVZY5Uwf7/Tkjsuw9gRBiv+1/xFABEQxh5Q0cS
 HziRpz9berfkuczUH/qZ7+c14O98hfnbgHBn//enLqYX0/76S0yKkBeLnX8FTGaH
 oEkXYF8N3c35dQD5wyXVdIoY4aiurQAwgcA==
X-ME-Sender: <xms:wOdUZPn2YVsOeYXvI146nyDBWr3nSH3lCpz6TRPAgUE6KZdJu7P3Fg>
 <xme:wOdUZC36G9DFmwnj6d-CzDtfAPXXtK4y5a-_3scL858H7lwpPNUG_M4edZEEYa5N-
 tg9xeQ-DK8K9mvYpZU>
X-ME-Received: <xmr:wOdUZFpLil1rYYbdxZv73ZNsYdbpwpqWCmYK9efiaExczIoN6U3ELq1yOJKPCGV4y-bO_I83vIlHjCvk21D8HlpE9UvyMI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wOdUZHldcNsAc0CZDFE_9vVcrWupYRHe9dwKRyFTwC0LjLqStRUHWA>
 <xmx:wOdUZN1GorjN-GCmdgKxvoBp8OzxFMyLWI1u7jCbHAXQD_RK26nEeA>
 <xmx:wOdUZGtWZeNEW5CaVVPyp59BAgGJLKL2I-3qwPdfa01u7LQiEAVLhw>
 <xmx:wedUZO9YMlrZ92sVeEfotUdtjLPxcIR6arJIzZeSlMtLRwBRhGDuJ-hp_iA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:25:06 +0200
Subject: [PATCH v4 04/68] clk: Introduce
 clk_hw_determine_rate_no_reparent()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v4-4-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10829; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=YBkKiWSHU6AfKueAcHZCOzbYZiY/0bHTLTOJ1X0UewY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxedUy9mc+d6kvbti+3SFwfvMnndXJS6hu1k/TrpDJGw
 on1pHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIMUdGhrc1IfwXRIW2N4U5T025te
 74MuZT1+3CXxzLnmrrU8G66gwjw9XfZ8pdlhx7KvVmQf4Moc++3jnXPGXyivk3x50qOet1hBMA
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sekhar Nori <nsekhar@ti.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-sunxi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rtc@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Miles Chen <miles.chen@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stephen Boyd <sboyd@kernel.org>

Some clock drivers do not want to allow any reparenting on a given
clock, but usually do so by not providing any determine_rate
implementation.

Whenever we call clk_round_rate() or clk_set_rate(), this leads to
clk_core_can_round() returning false and thus the rest of the function
either forwarding the rate request to its current parent if
CLK_SET_RATE_PARENT is set, or just returning the current clock rate.

This behaviour happens implicitly, and as we move forward to making a
determine_rate implementation required for muxes, we need some way to
explicitly opt-in for that behaviour.

Fortunately, this is exactly what the clk_core_determine_rate_no_reparent()
function is doing, so we can simply make it available to drivers.

Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "Andreas Färber" <afaerber@suse.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: David Lechner <david@lechnology.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Miles Chen <miles.chen@mediatek.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-actions@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: patches@opensource.cirrus.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c            |  18 +++++
 drivers/clk/clk_test.c       | 152 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |   2 +
 3 files changed, 172 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f57f821a5e5a..5365595433c8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -783,6 +783,24 @@ int __clk_mux_determine_rate_closest(struct clk_hw *hw,
 }
 EXPORT_SYMBOL_GPL(__clk_mux_determine_rate_closest);
 
+/*
+ * clk_hw_determine_rate_no_reparent - clk_ops::determine_rate implementation for a clk that doesn't reparent
+ * @hw: mux type clk to determine rate on
+ * @req: rate request, also used to return preferred frequency
+ *
+ * Helper for finding best parent rate to provide a given frequency.
+ * This can be used directly as a determine_rate callback (e.g. for a
+ * mux), or from a more complex clock that may combine a mux with other
+ * operations.
+ *
+ * Returns: 0 on success, -EERROR value on error
+ */
+int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	return clk_core_determine_rate_no_reparent(hw, req);
+}
+
 /***        clk api        ***/
 
 static void clk_core_rate_unprotect(struct clk_core *core)
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 2cb51153750d..b3ed3b0e4c31 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -141,6 +141,12 @@ static const struct clk_ops clk_multiple_parents_mux_ops = {
 	.determine_rate = __clk_mux_determine_rate_closest,
 };
 
+static const struct clk_ops clk_multiple_parents_no_reparent_mux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
+	.get_parent = clk_multiple_parents_mux_get_parent,
+	.set_parent = clk_multiple_parents_mux_set_parent,
+};
+
 static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 {
 	struct clk_dummy_context *ctx;
@@ -2395,10 +2401,156 @@ static struct kunit_suite clk_mux_notifier_test_suite = {
 	.test_cases = clk_mux_notifier_test_cases,
 };
 
+static int
+clk_mux_no_reparent_test_init(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx;
+	const char *parents[2] = { "parent-0", "parent-1"};
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
+							    &clk_dummy_rate_ops,
+							    0);
+	ctx->parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
+	ret = clk_hw_register(NULL, &ctx->parents_ctx[0].hw);
+	if (ret)
+		return ret;
+
+	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
+							    &clk_dummy_rate_ops,
+							    0);
+	ctx->parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
+	ret = clk_hw_register(NULL, &ctx->parents_ctx[1].hw);
+	if (ret)
+		return ret;
+
+	ctx->current_parent = 0;
+	ctx->hw.init = CLK_HW_INIT_PARENTS("test-mux", parents,
+					   &clk_multiple_parents_no_reparent_mux_ops,
+					   0);
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+clk_mux_no_reparent_test_exit(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->parents_ctx[0].hw);
+	clk_hw_unregister(&ctx->parents_ctx[1].hw);
+}
+
+/*
+ * Test that if the we have a mux that cannot change parent and we call
+ * clk_round_rate() on it with a rate that should cause it to change
+ * parent, it won't.
+ */
+static void clk_mux_no_reparent_round_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *other_parent, *parent;
+	unsigned long other_parent_rate;
+	unsigned long parent_rate;
+	long rounded_rate;
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	parent_rate = clk_get_rate(parent);
+	KUNIT_ASSERT_GT(test, parent_rate, 0);
+
+	other_parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, other_parent);
+	KUNIT_ASSERT_FALSE(test, clk_is_match(parent, other_parent));
+
+	other_parent_rate = clk_get_rate(other_parent);
+	KUNIT_ASSERT_GT(test, other_parent_rate, 0);
+	clk_put(other_parent);
+
+	rounded_rate = clk_round_rate(clk, other_parent_rate);
+	KUNIT_ASSERT_GT(test, rounded_rate, 0);
+	KUNIT_EXPECT_EQ(test, rounded_rate, parent_rate);
+
+	clk_put(clk);
+}
+
+/*
+ * Test that if the we have a mux that cannot change parent and we call
+ * clk_set_rate() on it with a rate that should cause it to change
+ * parent, it won't.
+ */
+static void clk_mux_no_reparent_set_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *other_parent, *parent;
+	unsigned long other_parent_rate;
+	unsigned long parent_rate;
+	unsigned long rate;
+	int ret;
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	parent_rate = clk_get_rate(parent);
+	KUNIT_ASSERT_GT(test, parent_rate, 0);
+
+	other_parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, other_parent);
+	KUNIT_ASSERT_FALSE(test, clk_is_match(parent, other_parent));
+
+	other_parent_rate = clk_get_rate(other_parent);
+	KUNIT_ASSERT_GT(test, other_parent_rate, 0);
+	clk_put(other_parent);
+
+	ret = clk_set_rate(clk, other_parent_rate);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, parent_rate);
+
+	clk_put(clk);
+}
+
+static struct kunit_case clk_mux_no_reparent_test_cases[] = {
+	KUNIT_CASE(clk_mux_no_reparent_round_rate),
+	KUNIT_CASE(clk_mux_no_reparent_set_rate),
+	{}
+};
+
+/*
+ * Test suite for a clock mux that isn't allowed to change parent, using
+ * the clk_hw_determine_rate_no_reparent() helper.
+ *
+ * These tests exercise that helper, and the proper selection of
+ * rates and parents.
+ */
+static struct kunit_suite clk_mux_no_reparent_test_suite = {
+	.name = "clk-mux-no-reparent",
+	.init = clk_mux_no_reparent_test_init,
+	.exit = clk_mux_no_reparent_test_exit,
+	.test_cases = clk_mux_no_reparent_test_cases,
+};
+
 kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 28ff6f1a6ada..f8f220fb5dab 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1333,6 +1333,8 @@ int __clk_mux_determine_rate_closest(struct clk_hw *hw,
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
+int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
+				      struct clk_rate_request *req);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
 void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);

-- 
2.40.0

