Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328BB5485CA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3215310E2D7;
	Mon, 13 Jun 2022 14:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC31810E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6413D320091E;
 Mon, 13 Jun 2022 10:48:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131717; x=1655218117; bh=3q
 7dVyJcCc6FDwW7sB39RGLsh3g0fc7P4p6J6WIfCIE=; b=byTZnUt8fObmMH6A54
 cqA/CbJu5yR3rNM65BNIJ95wY5GzsaDxDiwkCJqlLYjo5hPFgfjWiVh3GHxaWkAS
 kgkyDhjuGKc3HV6K19gXsA+5IZVx+XoPCImrB8E0lOTMmOYFiOU6Jf6OruC0plPi
 C2y1Qr45V/Rds2r2btdbzht4urSv7v+XYpd9lQ+lSTX406hf2XX8aLL/upUpRfGy
 cYimb0JNYS0splMiFllcPdI+HzMAWpZVyzMkQJIjnrzJ9Gkn8H7gnz99fdBeeI3b
 tknb1eV4+2bAxrGcx4P9RMKQrQcaswR0ZQh780zqkJYlOaAja828mlpeaIYwnFb9
 RnZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131717; x=1655218117; bh=3q7dVyJcCc6FD
 wW7sB39RGLsh3g0fc7P4p6J6WIfCIE=; b=aFFJMxMhqgd2xPaT/Ik8SQIrtOZYD
 Lpj0NzFS5lchT9Uy1jdGRtdP07w+/uARO94pIw2HGAtpGkVtWVRzftZ8rQRggqKy
 kA0DRMkDzuLWzQXJ2xik+Iueos0m6xSsSAlzCA7aj4nJfdHae7SPNdOPO4vOoOE/
 yYZpS7wIHD/nDXIgBltn5tNbB+E/TPMQ2KKkRgF7pR8EaVuSHeWV/UhhsJBIy+qE
 +OmzXseOoy/eN9EiQjykUd79ev9OeA6qx3DTmoNMiyOBg19gTksIOiDaAsBl4kXa
 HhPf10kab6tQAY7/2iez+9CNb0ZX4rcX/QkJVN0vyUYNKJEjYBruJw3Cg==
X-ME-Sender: <xms:RU6nYukWb9v-Tv0lNgLLeazjqZQk1k3ctJysDWztULGrpKUpEAJFjg>
 <xme:RU6nYl0zpLE6Bf0-8-8M-0tbWgbzwuAwx_0RKiSLGFKAtvnIGbDac_pUSid-DCQ21
 6vyBPjjsSpSoRD8D-g>
X-ME-Received: <xmr:RU6nYsrEKyDR-8mIS1acJTVjf_wP6mPo-ufiLDD0vn75O0beOYGqe6oUWsBDPMPZ5w0U083cdcRSoW_jdPZzfP1y_26TVN_xg5KGGCk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RU6nYimyi-AJw3FnK7cLFRxnWfAlWSFN0sASWhFavxIaUlt0NuY_Dg>
 <xmx:RU6nYs11myV1pwIcesbrBk_LADkD6wJUn_1qotSLYB6Fpi2gOHYZMA>
 <xmx:RU6nYpvy6Y7FZ2tS_Vw_gNY3VP4c4nhPzV76_zcHMP3fVMlJD9dqvw>
 <xmx:RU6nYg_bDWZkirf4JH_KLue-CEcO3MAOFhq0sMHdyqvYwoYjEFTvyw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 11/33] drm/vc4: dsi: Release workaround buffer and DMA
Date: Mon, 13 Jun 2022 16:47:38 +0200
Message-Id: <20220613144800.326124-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

On Pi0-3 the driver allocates a buffer and requests a DMA channel
because the ARM can't write to DSI1's registers directly.

However, we never release that buffer or channel. Let's add a
device-managed action to release each.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 98308a17e4ed..e82ee94cafc7 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1487,13 +1487,29 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 				      dsi->clk_onecell);
 }
 
+static void vc4_dsi_dma_mem_release(void *ptr)
+{
+	struct vc4_dsi *dsi = ptr;
+	struct device *dev = &dsi->pdev->dev;
+
+	dma_free_coherent(dev, 4, dsi->reg_dma_mem, dsi->reg_dma_paddr);
+	dsi->reg_dma_mem = NULL;
+}
+
+static void vc4_dsi_dma_chan_release(void *ptr)
+{
+	struct vc4_dsi *dsi = ptr;
+
+	dma_release_channel(dsi->reg_dma_chan);
+	dsi->reg_dma_chan = NULL;
+}
+
 static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct vc4_dsi_encoder *vc4_dsi_encoder;
-	dma_cap_mask_t dma_mask;
 	int ret;
 
 	dsi->variant = of_device_get_match_data(dev);
@@ -1527,6 +1543,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 * so set up a channel for talking to it.
 	 */
 	if (dsi->variant->broken_axi_workaround) {
+		dma_cap_mask_t dma_mask;
+
 		dsi->reg_dma_mem = dma_alloc_coherent(dev, 4,
 						      &dsi->reg_dma_paddr,
 						      GFP_KERNEL);
@@ -1535,8 +1553,13 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 			return -ENOMEM;
 		}
 
+		ret = devm_add_action_or_reset(dev, vc4_dsi_dma_mem_release, dsi);
+		if (ret)
+			return ret;
+
 		dma_cap_zero(dma_mask);
 		dma_cap_set(DMA_MEMCPY, dma_mask);
+
 		dsi->reg_dma_chan = dma_request_chan_by_mask(&dma_mask);
 		if (IS_ERR(dsi->reg_dma_chan)) {
 			ret = PTR_ERR(dsi->reg_dma_chan);
@@ -1546,6 +1569,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 			return ret;
 		}
 
+		ret = devm_add_action_or_reset(dev, vc4_dsi_dma_chan_release, dsi);
+		if (ret)
+			return ret;
+
 		/* Get the physical address of the device's registers.  The
 		 * struct resource for the regs gives us the bus address
 		 * instead.
-- 
2.36.1

