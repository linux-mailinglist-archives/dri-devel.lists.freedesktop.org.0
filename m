Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9958A2A74
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 11:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBB310F2BE;
	Fri, 12 Apr 2024 09:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sdGKR7nq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23210F517
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 09:09:30 +0000 (UTC)
X-UUID: 5dd4b0d2f8ac11ee935d6952f98a51a9-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LSBWj7mVrO0pFcDbfbk+eHT62xpZ8G5ICUITBhRc8RY=; 
 b=sdGKR7nq4vJJm+Kx+o44+EhtiH/uD7kRt2cu66AclZRQNtS8M6Yna7aU4QzZGWhJ3RyCK7K5Bs9xzmFWpht9Yloqv76p3rYCH0Wh2BX+fUfX+wfwJc8UcDA6UXSxyA0z8v2XqdBjE95ezkp6a6/MGKKSTHYZyf5i0k5guHSDKS0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:2a44c47c-c4ed-4bbd-adfa-e5812c5fc559, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:bae5d5fa-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5dd4b0d2f8ac11ee935d6952f98a51a9-20240412
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1491719649; Fri, 12 Apr 2024 17:09:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:09:26 +0800
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
Subject: [PATCH v5, 22/23] media: mediatek: vcodec: support hevc svp for mt8188
Date: Fri, 12 Apr 2024 17:08:50 +0800
Message-ID: <20240412090851.24999-23-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
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

Change hevc driver to support secure video playback(svp) for
mt8188. Need to map shared memory with optee interface and
wait interrupt in optee-os.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_hevc_req_multi_if.c     | 89 +++++++++++--------
 1 file changed, 54 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index fe0a8508d632..30c85d053f18 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -415,11 +415,14 @@ static void vdec_hevc_fill_dpb_info(struct mtk_vcodec_dec_ctx *ctx,
 		hevc_dpb_info[index].field = dpb->field_pic;
 
 		hevc_dpb_info[index].y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
-			hevc_dpb_info[index].c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
-		else
-			hevc_dpb_info[index].c_dma_addr =
-				hevc_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
+		if (!ctx->is_secure_playback) {
+			if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+				hevc_dpb_info[index].c_dma_addr =
+					vb2_dma_contig_plane_dma_addr(vb, 1);
+			else
+				hevc_dpb_info[index].c_dma_addr =
+					hevc_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
+		}
 	}
 }
 
@@ -800,7 +803,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 	struct mtk_vcodec_dec_ctx *ctx = inst->ctx;
 	struct vb2_v4l2_buffer *vb2_v4l2;
 	struct vdec_fb *fb;
-	u64 y_fb_dma, c_fb_dma;
+	u64 y_fb_dma, c_fb_dma = 0;
 	int i;
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
@@ -810,18 +813,20 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 	}
 
 	y_fb_dma = (u64)fb->base_y.dma_addr;
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
-		c_fb_dma =
-			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
-	else
-		c_fb_dma = (u64)fb->base_c.dma_addr;
+	if (!ctx->is_secure_playback) {
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+			c_fb_dma =
+				y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+		else
+			c_fb_dma = (u64)fb->base_c.dma_addr;
+	}
 
 	mtk_vdec_debug(inst->ctx, "[hevc-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
 
 	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
 	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
 	inst->vsi_core->fb.c.dma_addr = c_fb_dma;
-	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[1];
+	inst->vsi_core->fb.c.size = ctx->picinfo.fb_sz[1];
 
 	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
 
@@ -878,8 +883,13 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	vsi_size = round_up(sizeof(struct vdec_hevc_slice_vsi), VCODEC_DEC_ALIGNED_64);
 	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (ctx->is_secure_playback)
+		inst->vsi_core =
+			mtk_vcodec_dec_get_shm_buffer_va(ctx->dev->optee_private, MTK_VDEC_CORE,
+							 OPTEE_DATA_INDEX);
+	else
+		inst->vsi_core =
+			(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
 
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
@@ -944,21 +954,22 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		goto vdec_dec_end;
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
-	if (timeout)
-		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
-	inst->vsi_core->dec.timeout = !!timeout;
+	if (!vpu->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+		if (timeout)
+			mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
+		inst->vsi_core->dec.timeout = !!timeout;
 
-	vpu_dec_core_end(vpu);
-	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-		       ctx->decoded_frame_cnt,
+		vpu_dec_core_end(vpu);
+	}
+	mtk_vdec_debug(ctx, "pic[%d] svp:%d crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       ctx->decoded_frame_cnt, ctx->is_secure_playback,
 		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
 		       inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
 		       inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
 		       inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
-
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
@@ -1015,14 +1026,17 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
-	if (timeout)
-		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
-	inst->vsi->dec.timeout = !!timeout;
+	if (!inst->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+		if (timeout)
+			mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
+		inst->vsi->dec.timeout = !!timeout;
+
+		err = vpu_dec_end(vpu);
+	}
 
-	err = vpu_dec_end(vpu);
 	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
 		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
 			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
@@ -1031,8 +1045,11 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		return -EINVAL;
 	}
 
-	share_info->trans.dma_addr_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->dec.wdma_end_addr_offset;
+	if (inst->ctx->is_secure_playback)
+		share_info->trans.dma_addr_end = inst->vsi->dec.wdma_end_addr_offset;
+	else
+		share_info->trans.dma_addr_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+			inst->vsi->dec.wdma_end_addr_offset;
 	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
 
 	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
@@ -1040,8 +1057,10 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		       sizeof(share_info->hevc_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
-	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
-		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
+
+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x 0x%x size:%d",
+		       inst->slice_dec_num, inst->vsi->dec.crc[0], inst->vsi->dec.crc[1],
+		       inst->vsi->dec.crc[2], inst->vsi->dec.crc[3], (unsigned int)bs->size);
 
 	inst->slice_dec_num++;
 	return 0;
-- 
2.18.0

