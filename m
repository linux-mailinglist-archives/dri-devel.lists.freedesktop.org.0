Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC509FC7AE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 03:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F63510E67F;
	Thu, 26 Dec 2024 02:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="flqOZRkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D2110E681
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 02:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=ekg/UKB4/lYLmQ4zoU6HE87Q7T/RgQ0dvlW6KUtiFAI=; b=flqOZRkBUSff6t+9
 UdbssLKyddIkHRcpOP97NpnFf0RkaSChotpTWNoMLX+xfhYxdPIwf9f8/YTTiJdfu/5ZK6cL2G20T
 ZJVB2WyBtTg0oE33aFkbdIIMio6KoDaE5flbb/xpuwOPRIeHh49GuumSIZ6kc1cZoQtchWkoyZyVg
 MJBnFVZupalsVOruJa1GbrSiXeTCzO6tW5xfelnRrJ7AColuv7MgECsgooz3XTgXU5DtckG5jm1MR
 vcF8bIaTDScAhKzmuA6DNDqMkoVUc6sw0Ab/bq/sR2/IX5tIwC9pQiheey2P3YavkWdQn6WClP8kO
 0SFl9m1wsXZQE1Kvhw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tQdbS-007F0L-2E;
 Thu, 26 Dec 2024 02:27:58 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, deller@gmx.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 7/7] gpu: ipu-v3 ipu-cpmem: Remove unused functions
Date: Thu, 26 Dec 2024 02:27:52 +0000
Message-ID: <20241226022752.219399-8-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_cpmem_set_yuv_interleaved() was added in 2012 by
commit 0125f21b2baf ("staging: drm/imx: Add
ipu_cpmem_set_yuv_interleaved()")
but has remained unused.

ipu_cpmem_get_burstsize() was added in 2016 by
commit 03085911d7bb ("gpu: ipu-cpmem: Add ipu_cpmem_get_burstsize()")
but has remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-cpmem.c | 23 -----------------------
 include/video/imx-ipu-v3.h     |  2 --
 2 files changed, 25 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-cpmem.c b/drivers/gpu/ipu-v3/ipu-cpmem.c
index 82b244cb313e..07866b1369c6 100644
--- a/drivers/gpu/ipu-v3/ipu-cpmem.c
+++ b/drivers/gpu/ipu-v3/ipu-cpmem.c
@@ -337,12 +337,6 @@ void ipu_cpmem_set_axi_id(struct ipuv3_channel *ch, u32 id)
 }
 EXPORT_SYMBOL_GPL(ipu_cpmem_set_axi_id);
 
-int ipu_cpmem_get_burstsize(struct ipuv3_channel *ch)
-{
-	return ipu_ch_param_read_field(ch, IPU_FIELD_NPB) + 1;
-}
-EXPORT_SYMBOL_GPL(ipu_cpmem_get_burstsize);
-
 void ipu_cpmem_set_burstsize(struct ipuv3_channel *ch, int burstsize)
 {
 	ipu_ch_param_write_field(ch, IPU_FIELD_NPB, burstsize - 1);
@@ -452,23 +446,6 @@ int ipu_cpmem_set_format_passthrough(struct ipuv3_channel *ch, int width)
 }
 EXPORT_SYMBOL_GPL(ipu_cpmem_set_format_passthrough);
 
-void ipu_cpmem_set_yuv_interleaved(struct ipuv3_channel *ch, u32 pixel_format)
-{
-	switch (pixel_format) {
-	case V4L2_PIX_FMT_UYVY:
-		ipu_ch_param_write_field(ch, IPU_FIELD_BPP, 3); /* bits/pixel */
-		ipu_ch_param_write_field(ch, IPU_FIELD_PFS, 0xA);/* pix fmt */
-		ipu_ch_param_write_field(ch, IPU_FIELD_NPB, 31);/* burst size */
-		break;
-	case V4L2_PIX_FMT_YUYV:
-		ipu_ch_param_write_field(ch, IPU_FIELD_BPP, 3); /* bits/pixel */
-		ipu_ch_param_write_field(ch, IPU_FIELD_PFS, 0x8);/* pix fmt */
-		ipu_ch_param_write_field(ch, IPU_FIELD_NPB, 31);/* burst size */
-		break;
-	}
-}
-EXPORT_SYMBOL_GPL(ipu_cpmem_set_yuv_interleaved);
-
 void ipu_cpmem_set_yuv_planar_full(struct ipuv3_channel *ch,
 				   unsigned int uv_stride,
 				   unsigned int u_offset, unsigned int v_offset)
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index 29e142e95ba3..c89574b6f527 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -262,7 +262,6 @@ void ipu_cpmem_set_uv_offset(struct ipuv3_channel *ch, u32 u_off, u32 v_off);
 void ipu_cpmem_interlaced_scan(struct ipuv3_channel *ch, int stride,
 			       u32 pixelformat);
 void ipu_cpmem_set_axi_id(struct ipuv3_channel *ch, u32 id);
-int ipu_cpmem_get_burstsize(struct ipuv3_channel *ch);
 void ipu_cpmem_set_burstsize(struct ipuv3_channel *ch, int burstsize);
 void ipu_cpmem_set_block_mode(struct ipuv3_channel *ch);
 void ipu_cpmem_set_rotation(struct ipuv3_channel *ch,
@@ -270,7 +269,6 @@ void ipu_cpmem_set_rotation(struct ipuv3_channel *ch,
 int ipu_cpmem_set_format_rgb(struct ipuv3_channel *ch,
 			     const struct ipu_rgb *rgb);
 int ipu_cpmem_set_format_passthrough(struct ipuv3_channel *ch, int width);
-void ipu_cpmem_set_yuv_interleaved(struct ipuv3_channel *ch, u32 pixel_format);
 void ipu_cpmem_set_yuv_planar_full(struct ipuv3_channel *ch,
 				   unsigned int uv_stride,
 				   unsigned int u_offset,
-- 
2.47.1

