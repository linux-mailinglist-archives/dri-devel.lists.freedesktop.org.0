Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF46E6C3002
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 12:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B2110E101;
	Tue, 21 Mar 2023 11:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041C210E101
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 11:14:54 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CCCFC66030D8;
 Tue, 21 Mar 2023 11:14:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679397293;
 bh=QBqSOn5L2dX/NeD+pFSVTpII5Gfyn4fJCYVfrwnSzG4=;
 h=From:To:Cc:Subject:Date:From;
 b=Z4npLs9b8MuFPhsKike8ue/fPAYUU19SbOumdXC0IhrotMYvXc1AfBGAiZJvvNfWa
 Fibv4Fe7iRgqw/2RIkFb6GzJw7XZzSpvRwQRoSC8bkNCLlX5FHR5F2/B/LD3EsUsUO
 xF68mrp5bZgHSRM0eg1YcROelWTOyxW3gt/hCaQ4PrBAzEx4hw8PVwGPbuAEouKcCo
 JivA8hWIWIeYy0xffFbiFw5s3/lstIXgu5N0AU0AGCjmMqBC3EIUhrBZvaOclsfReO
 vwgD83J7dKO1yPI5wyE41hImyNIWmFqqJ/BbBuVc4ZJRnH+W0gWseFdFl6eWJRMSpB
 J+85qHFDNDb0w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH] drm/mediatek: Clarify/finish documentation for some driver
 structures
Date: Tue, 21 Mar 2023 12:14:48 +0100
Message-Id: <20230321111448.270110-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
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
Cc: lee@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation for some of the driver structures in mediatek-drm
was set to be kerneldoc but some code additions didn't actually update
the comments accordingly and this caused triggering some warnings.

Add comments for the remaining undocumented entries; while at it, also
clarify some acronyms for various display HW blocks and fix some comment
blocks to actually get parsed as kerneldoc.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  8 +++++---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c |  8 +++++---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 11 +++++++----
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c |  8 ++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 13 +++++++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 12 +++++++++---
 6 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 434e8a9ce8ab..12d1800c1d34 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -27,9 +27,11 @@ struct mtk_disp_aal_data {
 };
 
 /**
- * struct mtk_disp_aal - DISP_AAL driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * struct mtk_disp_aal - Display Adaptive Ambient Light driver structure
+ * @clk:      clock for DISP_AAL controller
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform specific data for DISP_AAL
  */
 struct mtk_disp_aal {
 	struct clk *clk;
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 1773379b2439..b173aa058573 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -35,9 +35,11 @@ struct mtk_disp_ccorr_data {
 };
 
 /**
- * struct mtk_disp_ccorr - DISP_CCORR driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * struct mtk_disp_ccorr - Display Color Correction driver structure
+ * @clk:      clock for DISP_CCORR block
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform specific data for DISP_CCORR
  */
 struct mtk_disp_ccorr {
 	struct clk *clk;
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index cac9206079e7..7884f4736b7c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -31,10 +31,13 @@ struct mtk_disp_color_data {
 	unsigned int color_offset;
 };
 
-/*
- * struct mtk_disp_color - DISP_COLOR driver structure
- * @crtc: associated crtc to report irq events to
- * @data: platform colour driver data
+/**
+ * struct mtk_disp_color - DISP_COLOR (Display Color) driver structure
+ * @crtc:     associated crtc to report irq events to
+ * @clk:      clock for DISP_COLOR block
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform specific data for DISP_COLOR
  */
 struct mtk_disp_color {
 	struct drm_crtc				*crtc;
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c844942603f7..7e748613fccb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -31,8 +31,12 @@ struct mtk_disp_gamma_data {
 	bool lut_diff;
 };
 
-/*
- * struct mtk_disp_gamma - DISP_GAMMA driver structure
+/**
+ * struct mtk_disp_gamma - Display Gamma driver structure
+ * @clk:      clock for DISP_GAMMA block
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform data for DISP_GAMMA
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 9d8c986700ee..00f2871fd1a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -76,10 +76,15 @@ struct mtk_disp_ovl_data {
 	bool supports_afbc;
 };
 
-/*
- * struct mtk_disp_ovl - DISP_OVL driver structure
- * @crtc: associated crtc to report vblank events to
- * @data: platform data
+/**
+ * struct mtk_disp_ovl - Display Overlay driver structure
+ * @crtc:           associated crtc to report vblank events to
+ * @clk:            clock for DISP_OVL block
+ * @regs:           MMIO registers base
+ * @cmdq_reg:       CMDQ Client register
+ * @data:           platform data
+ * @vblank_cb:      vblank callback function
+ * @vblank_cb_data: pointer to data that will be passed to vblank_cb()
  */
 struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index e8e337903b0d..74f4a0bce5cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -59,9 +59,15 @@ struct mtk_disp_rdma_data {
 	unsigned int fifo_size;
 };
 
-/*
- * struct mtk_disp_rdma - DISP_RDMA driver structure
- * @data: local driver data
+/**
+ * struct mtk_disp_rdma - Display Read DMA driver structure
+ * @clk:            clock for DISP_RDMA block
+ * @regs:           MMIO registers base
+ * @cmdq_reg:       CMDQ Client register
+ * @data:           platform data
+ * @vblank_cb:      vblank callback function
+ * @vblank_cb_data: pointer to data that will be passed to vblank_cb()
+ * @fifo_size:      size of DISP_RDMA block's FIFO
  */
 struct mtk_disp_rdma {
 	struct clk			*clk;
-- 
2.40.0

