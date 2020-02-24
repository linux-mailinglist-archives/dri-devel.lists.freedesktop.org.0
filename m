Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C47A16A284
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C146E303;
	Mon, 24 Feb 2020 09:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1756E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 5CF89611;
 Mon, 24 Feb 2020 04:10:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=GjaLHXA2AyvuQ
 l9vH9XfduJjJhVTIoPPBkoWpTa+ODU=; b=NND3PmLyi+1Hgo7avdo0vrIJixxdW
 LCfK/Pch2SiSfcyBwBkqPXBMNpBH8E62SCaESgQYsOloxueYqrTHzUQKqDpZeklm
 ZE/KNoCbjpu7utrSauM1zqo4HhFHFsT595xWV/V9G8uZEXoDhu7REydRy4XITXcq
 KTaXg4c5DL0WssQyJAkDxMmKTDyJ+B/VErR3Ku1UIj4Ag2+FT4hpwDpeWu+dm7Oa
 nPT+of17Tb9kUZFKHwUdCGILneCKw6VgBQOA7BtgCzXwbSyYoCVqK3iouBx9GrBz
 MD3yBqWhoLl2cuLvOlSYE6R9ybnW75hOVX7OR0OnUEKf7jKuSeBgjHjpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GjaLHXA2AyvuQl9vH9XfduJjJhVTIoPPBkoWpTa+ODU=; b=TTN5b5M3
 Xb/KHx9jQnjXe7PL28EqcQmlyZR+fs/MLP2F50uYRFQ8JDZKmMzzCGM65nKZqijZ
 6leWPIJRW8RieTVg8BiYHkdfgiq1kEWAJyeeMKAzD1ilTWT4UmEhCHm63/1FmrS6
 1Gxgfy/okLXlVfyQ5e56zR0lemSdYe/rmu9jrTsfR8IPt4nk0oDWt7aQAwkYl/w+
 f+JslD5Cb22p5wCmqbHZkIVOPVkiUoFzGazH5P08zGJdGtHo8RzH+aoIw86EPNvE
 PyiZ0pKgKWZI32NBkgtoWKu34ctH1x2fBTZ0uqeQVUgOcf2/7tgOMPwc8A7BVxw+
 fVZGg6uqbkiW/Q==
X-ME-Sender: <xms:7ZJTXi7mAdzLneMJHNMGy5cWmN59t3VQpXL01DYz111ylbp0dqNRyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepgeegnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7ZJTXi8ilvkaOWIoAV-WKpitxNYEr6NPfmIEraPLjeT0ZQDIlUTpIQ>
 <xmx:7ZJTXpcQLLxRfV2w9Q0io6LUFf440W_CaPPlt2Lgavq21deDULbXlw>
 <xmx:7ZJTXg3HPnPeR4_h0BZ9VK18Tc4N7RWVN3tHqoufLGRNyTjHLil0Kg>
 <xmx:7pJTXmOAC9A-ftyyk89vevB0_w57LTgpIaPwra7AJf_3etWOx9cge65e50o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DE6D3060FCB;
 Mon, 24 Feb 2020 04:10:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 53/89] drm/vc4: crtc: Add FIFO depth to vc4_crtc_data
Date: Mon, 24 Feb 2020 10:06:55 +0100
Message-Id: <dc149f88bffd4c51551b8bf4476828c6e2e0f3fe.1582533919.git-series.maxime@cerno.tech>
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

Not all pixelvalve FIFOs in vc5 have the same depth, so we need to add that
to our vc4_crtc_data structure to be able to compute the fill level
properly later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 20 ++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_drv.h  |  3 +++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index f8e4b2971510..129131a07edd 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -250,11 +250,20 @@ vc4_crtc_update_gamma_lut(struct drm_crtc *crtc)
 	vc4_crtc_lut_load(crtc);
 }
 
-
-static u32 vc4_get_fifo_full_level(u32 format)
+static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 {
-	static const u32 fifo_len_bytes = 64;
+	u32 fifo_len_bytes = vc4_crtc->data->fifo_depth;
 
+	/*
+	 * Pixels are pulled from the HVS if the number of bytes is
+	 * lower than the FIFO full level.
+	 *
+	 * The latency of the pixel fetch mechanism is 6 pixels, so we
+	 * need to convert those 6 pixels in bytes, depending on the
+	 * format, and then substract that from the length of the FIFO
+	 * to make sure we never end up in a situation where the FIFO
+	 * is full.
+	 */
 	switch (format) {
 	case PV_CONTROL_FORMAT_DSIV_16:
 	case PV_CONTROL_FORMAT_DSIC_16:
@@ -369,7 +378,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 
 	CRTC_WRITE(PV_CONTROL,
 		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
-		   VC4_SET_FIELD(vc4_get_fifo_full_level(format),
+		   VC4_SET_FIELD(vc4_get_fifo_full_level(vc4_crtc, format),
 				 PV_CONTROL_FIFO_LEVEL) |
 		   VC4_SET_FIELD(pixel_rep - 1, PV_CONTROL_PIXEL_REP) |
 		   PV_CONTROL_CLR_AT_START |
@@ -1066,6 +1075,7 @@ static const struct vc4_crtc_data bcm2835_pv0_data = {
 	.hvs_available_channels = BIT(0),
 	.hvs_output = 0,
 	.debugfs_name = "crtc0_regs",
+	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI0,
@@ -1077,6 +1087,7 @@ static const struct vc4_crtc_data bcm2835_pv1_data = {
 	.hvs_available_channels = BIT(2),
 	.hvs_output = 2,
 	.debugfs_name = "crtc1_regs",
+	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI1,
@@ -1088,6 +1099,7 @@ static const struct vc4_crtc_data bcm2835_pv2_data = {
 	.hvs_available_channels = BIT(1),
 	.hvs_output = 1,
 	.debugfs_name = "crtc2_regs",
+	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
 		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_HDMI,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index f31a6593da8a..967d57d0ab08 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -448,6 +448,9 @@ to_vc4_encoder(struct drm_encoder *encoder)
 }
 
 struct vc4_crtc_data {
+	/* Depth of the PixelValve FIFO in bytes */
+	unsigned int fifo_depth;
+
 	/* Which channels of the HVS can the output source from */
 	unsigned int hvs_available_channels;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
