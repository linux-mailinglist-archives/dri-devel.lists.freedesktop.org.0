Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699516A27B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949856E2E1;
	Mon, 24 Feb 2020 09:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7756E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id D70CD628;
 Mon, 24 Feb 2020 04:09:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+P3Mooao6xRyz
 6NjQNJGdStRJFWbrJ+Bh4471XgOQgM=; b=Cp9C1sQdZx0REJGTYG0//Oo5uxn9y
 JLAKxPa1xmq93in6rwnL7+J4rLFQ362WljOlLbkCWGMhaVkTU0QTeCNTs0lJa7yO
 vOsqJeYCmc5iWdjOLIYaIgq9quGKwCeHrSp8fDw8O0OZGYUTPVusq1qpJjzP9pD0
 L+DJUhuJ2gFoQT0kivxZtLHV5Ornjzt34fv7k3l74qXdxhXrf6h3rjpb/mzkTQ4P
 8hTOfuIwUOjOFLRgiXh7SrrcI1P24ZmiJ+4MpHknX6hEJ2peLDyIjy2pBrQcqKS0
 SpqqEsVwtoXPanPUMqzal78e6ioSkw+hk3+PnSZ3kLpXC87iJvfgx2LQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+P3Mooao6xRyz6NjQNJGdStRJFWbrJ+Bh4471XgOQgM=; b=vYPU9pzx
 Kps0fNlvLdFA8PefzEsPVdY3SxbqupZ2ZmEjg0SPLf2nQa13AVeBHdtOWkOXNs4m
 1tur1Vv0TX/7MvQeCc3HDJijPpogM7DYwXUJy1AqpzbwBH98ror+aaFN9pPQ9ljE
 oze+Drh6OFfJPPTqNwf+Bp96fQf5AIt7BFYTsgqyF1GOMzZVg6gOLBTUh0aRaOZm
 YrMzJIwURJI4cF+NrECuhCcIyBY6IgcvLEY8//6+EVmNNDcR0fYjX69QscYpiOfL
 RY79sGlGL/JPf4VrR6xANHYfoqOalyV9jJfPRbquiNavMsfpnh2DW2jLp8HuUQaX
 K+5S9LN149TMxg==
X-ME-Sender: <xms:35JTXmjaUr4AVRjD6XrnEEjtzvV46o2LNJORuwlhDL6knFqKWf3yFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepfeehnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:35JTXp-MYRFMh640P9eWEBp9W9Kk3jPDL4LAkqxi1G8glS1vMBOV3Q>
 <xmx:35JTXmQOPOw7fWMiiCHczLM86IZNLOWKwRj57GpKOBAC1xBBVQqIZA>
 <xmx:35JTXuGcqSOxqag1LBpsxKS1En-5V5NxmSOCPpQX4dasoI-5EMsIvQ>
 <xmx:35JTXlU4jbN1-ch0skW9_0xo-rDQZS8e2mYDOwd65LvdFrYVYAm2Tjt71Sk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2500D3060D1A;
 Mon, 24 Feb 2020 04:09:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 43/89] drm/vc4: crtc: Rename SoC data structures
Date: Mon, 24 Feb 2020 10:06:45 +0100
Message-Id: <e1b911053d81fe2c3e4961be973e5df92796d0f9.1582533919.git-series.maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're going to introduce pixelvalve data structures for other SoCs
than the BCM2835, let's rename the structures defined in the code to
make it obvious which SoC we're targetting.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index fc9977bdf347..ce902d31f92c 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1055,7 +1055,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.atomic_disable = vc4_crtc_atomic_disable,
 };
 
-static const struct vc4_crtc_data pv0_data = {
+static const struct vc4_crtc_data bcm2835_pv0_data = {
 	.hvs_channel = 0,
 	.debugfs_name = "crtc0_regs",
 	.encoder_types = {
@@ -1064,7 +1064,7 @@ static const struct vc4_crtc_data pv0_data = {
 	},
 };
 
-static const struct vc4_crtc_data pv1_data = {
+static const struct vc4_crtc_data bcm2835_pv1_data = {
 	.hvs_channel = 2,
 	.debugfs_name = "crtc1_regs",
 	.encoder_types = {
@@ -1073,7 +1073,7 @@ static const struct vc4_crtc_data pv1_data = {
 	},
 };
 
-static const struct vc4_crtc_data pv2_data = {
+static const struct vc4_crtc_data bcm2835_pv2_data = {
 	.hvs_channel = 1,
 	.debugfs_name = "crtc2_regs",
 	.encoder_types = {
@@ -1083,9 +1083,9 @@ static const struct vc4_crtc_data pv2_data = {
 };
 
 static const struct of_device_id vc4_crtc_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &pv0_data },
-	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &pv1_data },
-	{ .compatible = "brcm,bcm2835-pixelvalve2", .data = &pv2_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &bcm2835_pv0_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &bcm2835_pv1_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve2", .data = &bcm2835_pv2_data },
 	{}
 };
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
