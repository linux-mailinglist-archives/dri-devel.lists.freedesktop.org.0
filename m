Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6816A2AF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C39B6E35D;
	Mon, 24 Feb 2020 09:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FCB6E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A7151580;
 Mon, 24 Feb 2020 04:08:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TaGtmbCmLF2Fo
 LaNLgYEVhUrtAG5EI8ELKtGohVOro0=; b=BUvdZv5wWbBsyN+nVxMcymEYKnG/i
 wumVPJ1GGKyeY9X98f7lFwy/vqAo/3ILVZij8Zh+y5Xfo0ygANooo9z0+g2sO59f
 p+OQgAUMplLubLWDJasuSHAoF92w95eXqoIzrU41x9JIXrk/5lcq71j684ILXVY3
 TzC1/FaoqAitEJTWJCPVqt0tVto+aO6bpoX+OjdhBbpjK68VW4s8KZ1ZZFm3u2g6
 gVO3BJ86kuPkl7n05ln+w1cuntEhkaPj3xcfXq7j6jjwfRXviScqkza7u1lqEoxK
 CLyhnf381uQs+oXE6Of/IQXptxoHnXzyjZfWZk2V2544Z7YUydfFMm8Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TaGtmbCmLF2FoLaNLgYEVhUrtAG5EI8ELKtGohVOro0=; b=nYqUxtdB
 ucZ+FoExm9RSKGYxVbpWe0m+/9MAZNY1asuA+zyCxTqj7ONdleIeo2INZ1KF7HhB
 04Jbl3M5h7czA9pwT94y8hedIiyzfYupFmkFmtK65NIC/nPt9TtgSX1FSjHtKedP
 D2otDpQHJ7rQ/Sn/3UxlmFiM8XQQ0H0y6El+kBLAUsy4OGhsWyNkrOb8jomkV5J/
 Cl6ISglAwA/f3mY0ss8KqWsc+BKz8uhe8FilbTD4soKTpFbw8gcAFnmLWiowuCM3
 K/RiUa3Fkk3nYizxIgHnXkJaIU8RWwjGeuteRgxaJPDcFVEefb/v4E3hXfTTZf8J
 IpmddzCpoQb5JQ==
X-ME-Sender: <xms:qZJTXibiV2JmdrenwtVxvc563scseREJr743WVaIpYFcl4SKVOWXcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qZJTXqp3oFJPciVBlxgdDC9h8a9BxU9CNpJfmxjZpPpAIM0IxWCmtw>
 <xmx:qZJTXupOIe_jrq_5DGf-EojaB-WYHmzJqgH7j6BhDxEulCViWIlHpw>
 <xmx:qZJTXs3LFZ6uvQdFooOTqbYPSW5tcpeMuQ1pZlzXj6ril02CcB9OhQ>
 <xmx:qZJTXg8U8qKaPUjruZQXyaa_vKRq4r35zf92rmA2zyp9TFlP99K29hnE-9s>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C2E4930610E8;
 Mon, 24 Feb 2020 04:08:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 05/89] clk: Return error code when of provider pointer is NULL
Date: Mon, 24 Feb 2020 10:06:07 +0100
Message-Id: <ab03d578775df76c12e1dcff5d5cc5c1eb4d6fa7.1582533919.git-series.maxime@cerno.tech>
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

The clock framework DT provider helpers don't check the pointers in the
array registered by the clock provider before returning it.

This means that if the array is sparse, we will end up returning a NULL
pointer while the caller expects an error pointer, resulting in a crash.

Let's test the pointer returned and properly return an error if the pointer
is NULL.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f0f2b599fd7e..8532b5ed1060 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4318,13 +4318,18 @@ struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data)
 {
 	struct clk_onecell_data *clk_data = data;
 	unsigned int idx = clkspec->args[0];
+	struct clk *clk;
 
 	if (idx >= clk_data->clk_num) {
 		pr_err("%s: invalid clock index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
 	}
 
-	return clk_data->clks[idx];
+	clk = clk_data->clks[idx];
+	if (!clk)
+		return ERR_PTR(-ENODEV);
+
+	return clk;
 }
 EXPORT_SYMBOL_GPL(of_clk_src_onecell_get);
 
@@ -4333,13 +4338,18 @@ of_clk_hw_onecell_get(struct of_phandle_args *clkspec, void *data)
 {
 	struct clk_hw_onecell_data *hw_data = data;
 	unsigned int idx = clkspec->args[0];
+	struct clk_hw *hw;
 
 	if (idx >= hw_data->num) {
 		pr_err("%s: invalid index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
 	}
 
-	return hw_data->hws[idx];
+	hw = hw_data->hws[idx];
+	if (!hw)
+		return ERR_PTR(-ENODEV);
+
+	return hw;
 }
 EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
