Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130EC4BF91C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC5E10E57D;
	Tue, 22 Feb 2022 13:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CF210E53F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A134A5C02A6;
 Tue, 22 Feb 2022 08:19:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 08:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=QlOq15mubNZxvpuMRZ3gIcykADRMVQ
 WEqEwOiGentj0=; b=IXrtaSw5j3eu7h4vBjbh2A25jApV8BbIJRT/14IuPC82kO
 BieaZbY8kW70HpusaZtLfAdfKr2dfwMenVNNhjkZQ8Qzg6GAd7i7RfReYEYal0Vv
 s34NkDH9I/e1I+Xt0Ri1ZyDQG2XkoeGtBFkRwjr1GdcqJXPfryTkBzwa/mhzieqe
 KdCYV4uUxhxGPoGj0lmIca9MpCgD8HQRxFeg9sCv7g3jL1UvhaA35u4pM6n0tDto
 lASurxjU3CgYaJR6hOcKSssfKu5dn/Umav1xKYZr07DSIB4px5+B4EjIf/uAZ5KI
 4iFhmuCcBbyqhX7oX85LcnS8MwnbBJ/U0vh57htA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QlOq15
 mubNZxvpuMRZ3gIcykADRMVQWEqEwOiGentj0=; b=GkFxlltwxoslmYABi09S9P
 y+LxwPQeyVFdQnxNzBGD8Ja5GswLpTZYxlGcxr04pAj7C5rBEe8U35cEkSjqNc4L
 SkDTGSbVTUvrcDDfyR+fqY0SttH5lJeTSXYuQEvrfDw0vYsJtqeGAU3PwimMAchh
 fT9qF9GGx9Y9PdmqrIHV4XZ9gsKtpo8gDD+lqoJ/pJ8wCHxbHOHoWJrmjUe5MiAJ
 C7ATKKonZm9IJSmdkQD+mUYg1okx7GZ21g7KoQSmdYYLpPpf5kZ2rBc10tZmAWX8
 2OeebvVAqSsi/wol4Pjye3F6FU4q6jMU2KtNEKmxcCj+xeRebziZJksvmAAn2ymA
 ==
X-ME-Sender: <xms:0uIUYt2plpCNz07yJqwbMhzzk9SGrGNJ5d5WFROH5mgjGKu0q7UKsQ>
 <xme:0uIUYkH9dHLlalFfPaHPc1BNSlbDKzsef5rNEZlo7sgL9kg94UFgnBYwHXt4QvPIm
 E2qRbUmt1pNzSG12oA>
X-ME-Received: <xmr:0uIUYt6SpKTrYFdp_fs6rOj0Hi7wY9eDueXYYnb-PjDa3siHVUvEkUxA0lTi7usVBlrCOJNO-MBERvog_e5aK9datqlzk6PP8hKfSZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0uIUYq1okSPmyKjBDO5Bzy7ImFcuciSZwY1rGwpebAEIj2Tb6aMQBw>
 <xmx:0uIUYgHEtIpnKyc3pffbjuySshQHAIWliFzatyuKPIUISK8CefjEkw>
 <xmx:0uIUYr_24oaRVNXYsYZWZoYGp5hlPF51QpIOkik5SBg9KYquCqsz2w>
 <xmx:0uIUYr1ZjA1ShdCBzCgHbk6Uw8YpYBRbLmV6EDnoUEj8wWhlOy83Vw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 08/11] clk: bcm: rpi: Set a default minimum rate
Date: Tue, 22 Feb 2022 14:18:50 +0100
Message-Id: <20220222131853.198625-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The M2MC clock provides the state machine clock for both HDMI
controllers.

However, if no HDMI monitor is plugged in at boot, its clock rate will
be left at 0 by the firmware and will make any register access end up in
a CPU stall, even though the clock was enabled.

We had some code in the HDMI controller to deal with this before, but it
makes more sense to have it in the clock driver. Move it there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index f7185d421085..c879f2e9a4a7 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -76,6 +76,7 @@ struct raspberrypi_clk_data {
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
+	unsigned long	min_rate;
 };
 
 static struct raspberrypi_clk_variant
@@ -89,6 +90,18 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
+
+		/*
+		 * If we boot without any cable connected to any of the
+		 * HDMI connector, the firmware will skip the HSM
+		 * initialization and leave it with a rate of 0,
+		 * resulting in a bus lockup when we're accessing the
+		 * registers even if it's enabled.
+		 *
+		 * Let's put a sensible default so that we don't end up
+		 * in this situation.
+		 */
+		.min_rate = 120000000,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -267,6 +280,19 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
+	if (variant->min_rate) {
+		unsigned long rate;
+
+		clk_hw_set_rate_range(&data->hw, variant->min_rate, max_rate);
+
+		rate = raspberrypi_fw_get_rate(&data->hw, 0);
+		if (rate < variant->min_rate) {
+			ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
+			if (ret)
+				return ERR_PTR(ret);
+		}
+	}
+
 	return &data->hw;
 }
 
-- 
2.35.1

