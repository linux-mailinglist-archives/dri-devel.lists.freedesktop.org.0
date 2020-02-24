Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A244816A2DB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B800E6E3A2;
	Mon, 24 Feb 2020 09:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A502C6E225
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7B7525EB;
 Mon, 24 Feb 2020 04:09:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=gP4ZomwnT/rYT
 hUc5YeZEWVSbIFozmkpYRrF/X/JJys=; b=Hsi/CNGiDj/goIDdZPwn9YgaqFeKa
 ukDp8TQKpiksGu8BwVGtJ20YskLU7xyz/I1VhJwk4nQaT/waOyoZcft62vofUNQS
 Kb4YIp2LjnjrqQZhyqtE5xYOxMOfPX8L2QsX0O+AVE7h32rCtyWFVqwyUvY8LTxP
 GRUAwt35Gfcig/MU2Z+rpuTnMdMltGpA+LK0IQCHm62lHQvpV2FpLTUkOKcXRTNA
 3vCs0Obj/0V++Wc8krhKMHUaVmq11d2zOT7wrd3Bsm316hqAcvgQNtcVTJSXnwz3
 MKflgG835aglmXgP0Jy9vLIm9oN8C3WM5/EuHaw2DfGlJSVwuHgfnwMEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=gP4ZomwnT/rYThUc5YeZEWVSbIFozmkpYRrF/X/JJys=; b=L1hX0lwc
 BZa9/cpjf3pbZxT6EKzzOU+UYPsmTKOi6LaTS6l/mtyasQtji40Hy5AqjTp3bMIo
 gr/tXkfgeqQYkfUuXb3Ry/KN5N6SCzJw8b5JLpFf/wN0kG7g4oRUk2lQliudisri
 uU0kOE7r3xP7iNG7553APv+OEd3qRkVAiqWZXujKT4vxqvBYOYavTm801BKFwFPh
 zsQQnRh7OaYAQKdBFMYlkIcAR38DC7/fY8SLsIpLomrMMB9qdmiKvi5eHf/dfMwy
 X4quQHrodbvk9HQLkW2vIGWhYIogWb5jLd9miDy8f0G/MB3wlI8VU6dRMfKZzLPY
 UYYIVsjKpmpRVg==
X-ME-Sender: <xms:s5JTXlJYamnO5jVUee7wMXC8-W5427htvmeWFzPOVX_lGr6vmCqD3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:s5JTXhQnQWO7JyouFjpVcxGZc_V-AkgHZDG6ovAQ5Yaebp698uHi1A>
 <xmx:s5JTXrj5HyVmnz1P0s0DjHvP8fiHpDvVkk9esdwXzH7tucVWvalXWw>
 <xmx:s5JTXqrijeKRYlvggOKa5KSdu-YX1k68ZUpYt-SnsuP7VSt_kXN4hA>
 <xmx:s5JTXn30TvTDeYLAy6K5bBNHRl7HScVhOJ_eolFNYv0YS6J5jJkGAKUed0k>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8B1D328005A;
 Mon, 24 Feb 2020 04:09:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 12/89] clk: bcm: rpi: Remove pllb_arm_lookup global pointer
Date: Mon, 24 Feb 2020 10:06:14 +0100
Message-Id: <703e21467f23f63acdac0e078b58040c39b852bf.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pllb_arm_lookup pointer in the struct raspberrypi_clk is not used for
anything but to store the returned pointer to clkdev_hw_create, and is not
used anywhere else in the driver.

Let's remove that global pointer from the structure.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 783c8c5e5373..0c1d6c292302 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -40,7 +40,6 @@ struct raspberrypi_clk {
 	unsigned long max_rate;
 
 	struct clk_hw pllb;
-	struct clk_lookup *pllb_arm_lookup;
 };
 
 /*
@@ -238,6 +237,7 @@ static struct clk_fixed_factor raspberrypi_clk_pllb_arm = {
 
 static int raspberrypi_register_pllb_arm(struct raspberrypi_clk *rpi)
 {
+	struct clk_lookup *pllb_arm_lookup;
 	int ret;
 
 	ret = devm_clk_hw_register(rpi->dev, &raspberrypi_clk_pllb_arm.hw);
@@ -246,9 +246,9 @@ static int raspberrypi_register_pllb_arm(struct raspberrypi_clk *rpi)
 		return ret;
 	}
 
-	rpi->pllb_arm_lookup = clkdev_hw_create(&raspberrypi_clk_pllb_arm.hw,
-						NULL, "cpu0");
-	if (!rpi->pllb_arm_lookup) {
+	pllb_arm_lookup = clkdev_hw_create(&raspberrypi_clk_pllb_arm.hw,
+					   NULL, "cpu0");
+	if (!pllb_arm_lookup) {
 		dev_err(rpi->dev, "Failed to initialize pllb_arm_lookup\n");
 		return -ENOMEM;
 	}
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
