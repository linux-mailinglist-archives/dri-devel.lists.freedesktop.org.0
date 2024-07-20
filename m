Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A80F937FDF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 10:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E8310E132;
	Sat, 20 Jul 2024 08:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="q3EmrTkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C9A10E132
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 08:00:48 +0000 (UTC)
X-UUID: 051999a8466811ef87684b57767b52b1-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=My2qHK1LZTlVJLyDFXRnOL28F6fqvoK2IyVdTbSQJKE=; 
 b=q3EmrTkwxU/JcWEA3TbQTY6DTWVg2Y04FLMXThvabJiZgsedBDG39qpgu5cK/qzifm5N0YTuD8IRfGE8KWjHbGr0CxJzFOwEun2P1J5LPZmILnmjdqu6TavEozgII/Txvc3UcWJMKvPqvRiGJJ7dy8ewbeE7GXBjMiNdxk7THiY=;
X-CID-CACHE: Type:Local,Time:202407201558+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:d050331a-3c18-4fe7-8adc-919ecc0810a3, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-30
X-CID-META: VersionHash:ba885a6, CLOUDID:15798545-a117-4f46-a956-71ffeac67bfa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
 L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
 PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 051999a8466811ef87684b57767b52b1-20240720
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1241200868; Sat, 20 Jul 2024 15:16:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:42 +0800
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
Subject: [PATCH v7 24/28] media: mediatek: vcodec: support vp9 svp decoder for
 mt8188
Date: Sat, 20 Jul 2024 15:16:02 +0800
Message-ID: <20240720071606.27930-25-yunfei.dong@mediatek.com>
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

From: Yilong Zhou <yilong.zhou@mediatek.com>

Change vp9 driver to support secure video playback(svp) for
mt8188. Need to map shared memory with optee interface and
wait interrupt in optee-os.

Signed-off-by: Yilong Zhou <yilong.zhou@mediatek.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[Yunfei: Fix the checkpatch warning]
---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 101 +++++++++++-------
 1 file changed, 65 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index eea709d93820..a16a6f858e2e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -141,6 +141,7 @@ struct vdec_vp9_slice_frame_counts {
  * @skip:	skip counts.
  * @y_mode:	Y prediction mode counts.
  * @filter:	interpolation filter counts.
+ * @mv_joint:	motion vector joint counts.
  * @sign:	motion vector sign counts.
  * @classes:	motion vector class counts.
  * @class0:	motion vector class0 bit counts.
@@ -804,6 +805,9 @@ static void vdec_vp9_slice_setup_frame_ctx(struct vdec_vp9_slice_instance *insta
 	error_resilient_mode = HDR_FLAG(ERROR_RESILIENT);
 	reset_frame_context = uh->reset_frame_context;
 
+	if (instance->ctx->is_secure_playback)
+		return;
+
 	/*
 	 * according to "6.2 Uncompressed header syntax" in
 	 * "VP9 Bitstream & Decoding Process Specification",
@@ -818,8 +822,7 @@ static void vdec_vp9_slice_setup_frame_ctx(struct vdec_vp9_slice_instance *insta
 		 * 2 resets just the context specified in the frame header
 		 * 3 resets all contexts
 		 */
-		if (key_frame || error_resilient_mode ||
-		    reset_frame_context == 3) {
+		if (key_frame || error_resilient_mode || reset_frame_context == 3) {
 			/* use default table */
 			for (i = 0; i < 4; i++)
 				instance->dirty[i] = 0;
@@ -1042,6 +1045,9 @@ static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_instance *inst
 {
 	struct vdec_vp9_slice_uncompressed_header *uh;
 
+	if (instance->ctx->is_secure_playback)
+		return;
+
 	/* reset segment buffer */
 	uh = &vsi->frame.uh;
 	if (uh->frame_type == 0 ||
@@ -1172,15 +1178,16 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 
 	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
 
-	/* setup prob/tile buffers for LAT */
-
-	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
-	if (ret)
-		goto err;
+	if (!instance->ctx->is_secure_playback) {
+		/* setup prob/tile buffers for LAT */
+		ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
+		if (ret)
+			goto err;
 
-	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
-	if (ret)
-		goto err;
+		ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
+		if (ret)
+			goto err;
+	}
 
 	return 0;
 
@@ -1599,7 +1606,8 @@ static int vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance *instance
 		       pfc->seq, vsi->state.crc[4], vsi->state.crc[5],
 		       vsi->state.crc[6], vsi->state.crc[7]);
 
-	vdec_vp9_slice_update_prob(instance, vsi);
+	if (!instance->ctx->is_secure_playback)
+		vdec_vp9_slice_update_prob(instance, vsi);
 
 	instance->width = vsi->frame.uh.frame_width;
 	instance->height = vsi->frame.uh.frame_height;
@@ -1632,7 +1640,8 @@ static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *instance,
 		return -EAGAIN;
 	}
 
-	vdec_vp9_slice_update_prob(instance, vsi);
+	if (!instance->ctx->is_secure_playback)
+		vdec_vp9_slice_update_prob(instance, vsi);
 
 	instance->width = vsi->frame.uh.frame_width;
 	instance->height = vsi->frame.uh.frame_height;
@@ -1665,7 +1674,6 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 	struct vb2_queue *vq;
 	struct vdec_vp9_slice_reference *ref;
 	int plane;
-	int size;
 	int w;
 	int h;
 	int i;
@@ -1673,12 +1681,14 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 	plane = instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
 	w = vsi->frame.uh.frame_width;
 	h = vsi->frame.uh.frame_height;
-	size = ALIGN(w, 64) * ALIGN(h, 64);
+
+	vsi->fb.y.size = instance->ctx->picinfo.fb_sz[0];
+	vsi->fb.c.size = instance->ctx->picinfo.fb_sz[1];
 
 	/* frame buffer */
 	vsi->fb.y.dma_addr = fb->base_y.dma_addr;
 	if (plane == 1)
-		vsi->fb.c.dma_addr = fb->base_y.dma_addr + size;
+		vsi->fb.c.dma_addr = fb->base_y.dma_addr + vsi->fb.y.size;
 	else
 		vsi->fb.c.dma_addr = fb->base_c.dma_addr;
 
@@ -1694,8 +1704,15 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 		return -EINVAL;
 
 	/* update internal buffer's width/height */
-	instance->dpb[vb->index].width = w;
-	instance->dpb[vb->index].height = h;
+	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
+		struct vb2_buffer *buf = vb2_get_buffer(vq, i);
+
+		if (vb == buf) {
+			instance->dpb[i].width = w;
+			instance->dpb[i].height = h;
+			break;
+		}
+	}
 
 	/*
 	 * get buffer's width/height from instance
@@ -1717,7 +1734,7 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 				vb2_dma_contig_plane_dma_addr(vb, 0);
 			if (plane == 1)
 				vsi->ref[i].c.dma_addr =
-					vsi->ref[i].y.dma_addr + size;
+					vsi->ref[i].y.dma_addr + vsi->fb.y.size;
 			else
 				vsi->ref[i].c.dma_addr =
 					vb2_dma_contig_plane_dma_addr(vb, 1);
@@ -1779,7 +1796,8 @@ static int vdec_vp9_slice_setup_core(struct vdec_vp9_slice_instance *instance,
 	if (ret)
 		goto err;
 
-	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[1]);
+	if (!instance->ctx->is_secure_playback)
+		vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[1]);
 
 	return 0;
 
@@ -1874,19 +1892,30 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 	instance->init_vsi = vsi;
-	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						       (u32)vsi->core_vsi);
-	if (!instance->core_vsi) {
-		mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
-		ret = -EINVAL;
-		goto error_vsi;
-	}
 
-	instance->irq = 1;
+	if (ctx->is_secure_playback) {
+		instance->core_vsi = mtk_vcodec_dec_get_shm_buffer_va(ctx->dev, MTK_VDEC_CORE,
+								      OPTEE_DATA_INDEX);
+		if (!instance->core_vsi) {
+			mtk_vdec_err(ctx, "failed to get VP9 svp core vsi\n");
+			ret = -EINVAL;
+			goto error_vsi;
+		}
+		instance->irq = 0;
+	} else {
+		instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
+							       (u32)vsi->core_vsi);
+		if (!instance->core_vsi) {
+			mtk_vdec_err(ctx, "failed to get VP9 normal core vsi\n");
+			ret = -EINVAL;
+			goto error_vsi;
+		}
+		instance->irq = 1;
 
-	ret = vdec_vp9_slice_init_default_frame_ctx(instance);
-	if (ret)
-		goto error_default_frame_ctx;
+		ret = vdec_vp9_slice_init_default_frame_ctx(instance);
+		if (ret)
+			goto error_default_frame_ctx;
+	}
 
 	ctx->drv_handle = instance;
 
@@ -2101,9 +2130,12 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		       (unsigned long)pfc->vsi.trans.dma_addr,
 		       (unsigned long)pfc->vsi.trans.dma_addr_end);
 
-	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
-				       vsi->trans.dma_addr_end +
-				       ctx->msg_queue.wdma_addr.dma_addr);
+	if (!instance->ctx->is_secure_playback) {
+		vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
+		mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
+			       (unsigned long)pfc->vsi.trans.dma_addr_end);
+	}
+	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi->trans.dma_addr_end);
 	vdec_msg_queue_qbuf(&ctx->msg_queue.core_ctx, lat_buf);
 
 	return 0;
@@ -2183,9 +2215,6 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		goto err;
 	}
 
-	pfc->vsi.trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
-	mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
-		       (unsigned long)pfc->vsi.trans.dma_addr_end);
 	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
 
-- 
2.18.0

