Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A4937F78
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DAD10E24D;
	Sat, 20 Jul 2024 07:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tZ+iTRfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF66410E245
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:16:36 +0000 (UTC)
X-UUID: fe60e670466711efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IWYaEro6qvOlTE7NmiiGvi91wiQIVcxNioPdAh6X7rg=; 
 b=tZ+iTRfs+Oj57hPBsuzl/BNEyyrlp6pPOicRxLDrtmgTw46SP7Y31oOLiBNgSru9JT+uEGvphztVLmSAtdiFxbaWKNjRp5QkYBacLr/9FT1hAModpTbdrBMIxrDOZlRHX2ReVRgZq4RxX1fqlB86GTtM2wpt9uOoFeQ/h/Odusg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:4f44e417-d0fe-4e3b-919b-136b977e5463, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:ba885a6, CLOUDID:193c8545-a117-4f46-a956-71ffeac67bfa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fe60e670466711efb5b96b43b535fdb4-20240720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 629521862; Sat, 20 Jul 2024 15:16:33 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:31 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 16/28] media: mediatek: vcodec: support single allocation
 buffer
Date: Sat, 20 Jul 2024 15:15:54 +0800
Message-ID: <20240720071606.27930-17-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

The buffer count of capture format V4L2_PIX_FMT_MS21 is different with
V4L2_PIX_FMT_MM21. V4L2_PIX_FMT_MS21 has two memory to store luma and
chrome planes, V4L2_PIX_FMT_MS21 only has one. Adding condition to
separate them.

The dma address is secure handle for secure video playback, the handle
may not aligned with 64.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  7 ++++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 26 ++++++++++---------
 .../decoder/vdec/vdec_h264_req_common.c       | 18 ++++++-------
 .../mediatek/vcodec/decoder/vdec_drv_if.c     |  4 +--
 4 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index c89c900f7d4d..d206b95dd8b7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -701,7 +701,12 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 		 * So we just return picinfo yet, and update picinfo in
 		 * stop_streaming hook function
 		 */
-		q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
+
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1 || ctx->is_secure_playback)
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0] + ctx->picinfo.fb_sz[1];
+		else
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
+
 		q_data->sizeimage[1] = ctx->picinfo.fb_sz[1];
 		q_data->bytesperline[0] = ctx->last_decoded_picinfo.buf_w;
 		q_data->bytesperline[1] = ctx->last_decoded_picinfo.buf_w;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index fbea00517565..a1a99878f2c6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -285,14 +285,14 @@ static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
 	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
 
 	pfb = &framebuf->frame_buffer;
-	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
+	if (!ctx->is_secure_playback)
+		pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
 	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
 
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2 && !ctx->is_secure_playback) {
 		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
-		pfb->base_c.dma_addr =
-			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
+		pfb->base_c.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 1);
 		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
 	}
 	mtk_v4l2_vdec_dbg(1, ctx,
@@ -339,16 +339,18 @@ static void mtk_vdec_worker(struct work_struct *work)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) id=%d, vb=%p", ctx->id,
 			  vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
 
-	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
-	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
-	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
-				  vb2_src->index);
-		return;
+	if (!ctx->is_secure_playback) {
+		bs_src->va = vb2_plane_vaddr(vb2_src, 0);
+		if (!bs_src->va) {
+			v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+			mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
+					  vb2_src->index);
+			return;
+		}
 	}
 
+	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
+	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
index 5ca20d75dc8e..5e0d55218363 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
@@ -79,15 +79,15 @@ void mtk_vdec_h264_fill_dpb_info(struct mtk_vcodec_dec_ctx *ctx,
 		vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
 		h264_dpb_info[index].field = vb2_v4l2->field;
 
-		h264_dpb_info[index].y_dma_addr =
-			vb2_dma_contig_plane_dma_addr(vb, 0);
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
-			h264_dpb_info[index].c_dma_addr =
-				vb2_dma_contig_plane_dma_addr(vb, 1);
-		else
-			h264_dpb_info[index].c_dma_addr =
-				h264_dpb_info[index].y_dma_addr +
-				ctx->picinfo.fb_sz[0];
+		h264_dpb_info[index].y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+		if (!ctx->is_secure_playback) {
+			if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+				h264_dpb_info[index].c_dma_addr =
+					vb2_dma_contig_plane_dma_addr(vb, 1);
+			else
+				h264_dpb_info[index].c_dma_addr =
+					h264_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
+		}
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
index d0b459b1603f..fb3e4f75ed93 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
@@ -73,14 +73,14 @@ int vdec_if_decode(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *bs,
 {
 	int ret = 0;
 
-	if (bs) {
+	if (bs && !ctx->is_secure_playback) {
 		if ((bs->dma_addr & 63) != 0) {
 			mtk_v4l2_vdec_err(ctx, "bs dma_addr should 64 byte align");
 			return -EINVAL;
 		}
 	}
 
-	if (fb) {
+	if (fb && !ctx->is_secure_playback) {
 		if (((fb->base_y.dma_addr & 511) != 0) ||
 		    ((fb->base_c.dma_addr & 511) != 0)) {
 			mtk_v4l2_vdec_err(ctx, "frame buffer dma_addr should 512 byte align");
-- 
2.18.0

