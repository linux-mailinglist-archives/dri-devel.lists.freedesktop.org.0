Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36B937F82
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2521F10E259;
	Sat, 20 Jul 2024 07:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Eo8YToez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8510E22C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:16:51 +0000 (UTC)
X-UUID: 0771a7f4466811efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RbIGlBBuV+1rWVna2+IlzDOrKCx7A3yVQ+YZ98nbLH8=; 
 b=Eo8YToezbt4gtXAJl8Amx6py5EVyzfhf1fLXNdwImHE5K2nMoNe8Ivd4d7zSLnu9wFZlW74GYdCbeVLkiBDpwbWEKPRrpgWJODrDAWW5K4QwXclRKT6TI9LEr/hZCVpH5YMR54w++rmjWnjrFst66qGFO7q/4aJJUgWPGdzRkcw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:35b36b7b-f5da-4b61-8d52-508b8358844c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-30
X-CID-META: VersionHash:ba885a6, CLOUDID:6c3c8545-a117-4f46-a956-71ffeac67bfa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
 L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
 PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0771a7f4466811efb5b96b43b535fdb4-20240720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 869122371; Sat, 20 Jul 2024 15:16:48 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 "Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 "Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 26/28] media: mediatek: vcodec: rename vsi to extend vsi
Date: Sat, 20 Jul 2024 15:16:04 +0800
Message-ID: <20240720071606.27930-27-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.509500-8.000000
X-TMASE-MatchedRID: xmxiBNXCzGbL05PW1HuK4jPDkSOzeDWWqQ9UezeTkThjHFhWIf8DgWb6
 PphVtfZgbdhFnsNHmdcRXXerw3+tEl/gGlM36d4TqeBupNgLgYcEa8g1x8eqFwoDY6gYCVOT8tM
 WbtVzWkhQRjVnEuqiiLrw3PfJA6xh0H/zLeBgX291e7Xbb6Im2m73ma3jsPM23fJvWHIXusruyR
 nDeV8ZiyhWmBHkkDSEzUd36Zl64k4BM5SnKo8xnJ4CIKY/Hg3Am4n49vyf9XFKdDgyPBo71yq2r
 l3dzGQ1l3+bAt/YFVQ2cb4acKJLCTm3yYhosuqpyUw5fomMK+L6qkPFRIGo0mgGZNLBHGNe
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.509500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9C58C8A7A8DB9E95DD2F33D35EC1E69A56735E37A02D2E76F4D01BE59A8E33432000:8
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

rename vsi to extend vsi struct for adding some extend param to
support secure video playback.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 174 +++++++++---------
 1 file changed, 88 insertions(+), 86 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index f0ad54a87c8b..ed63430aca9d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -48,7 +48,7 @@ struct vdec_h264_slice_lat_dec_param {
 };
 
 /**
- * struct vdec_h264_slice_info - decode information
+ * struct vdec_h264_slice_info_ex - extend decode information
  *
  * @nal_info:		nal info of current picture
  * @timeout:		Decode timeout: 1 timeout, 0 no timeout
@@ -59,7 +59,7 @@ struct vdec_h264_slice_lat_dec_param {
  * @vdec_fb_va:	VDEC frame buffer struct virtual address
  * @crc:		Used to check whether hardware's status is right
  */
-struct vdec_h264_slice_info {
+struct vdec_h264_slice_info_ex {
 	u64 wdma_end_addr_offset;
 	u16 nal_info;
 	u16 timeout;
@@ -93,7 +93,7 @@ struct vdec_h264_slice_fb {
 };
 
 /**
- * struct vdec_h264_slice_vsi - shared memory for decode information exchange
+ * struct vdec_h264_slice_vsi_ex - extend shared memory for decode information exchange
  *        between SCP and Host.
  *
  * @wdma_err_addr:		wdma error dma address
@@ -112,7 +112,7 @@ struct vdec_h264_slice_fb {
  * @dec:			decode information (AP-R, VPU-W)
  * @h264_slice_params:		decode parameters for hw used
  */
-struct vdec_h264_slice_vsi {
+struct vdec_h264_slice_vsi_ex {
 	/* LAT dec addr */
 	struct vdec_h264_slice_mem bs;
 	struct vdec_h264_slice_fb fb;
@@ -124,7 +124,7 @@ struct vdec_h264_slice_vsi {
 	struct vdec_h264_slice_mem slice_bc;
 
 	struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
-	struct vdec_h264_slice_info dec;
+	struct vdec_h264_slice_info_ex dec;
 	struct vdec_h264_slice_lat_dec_param h264_slice_params;
 };
 
@@ -156,10 +156,10 @@ struct vdec_h264_slice_share_info {
  * @pred_buf:		HW working prediction buffer
  * @mv_buf:		HW working motion vector buffer
  * @vpu:		VPU instance
- * @vsi:		vsi used for lat
- * @vsi_core:		vsi used for core
+ * @vsi_ex:		extend vsi used for lat
+ * @vsi_core_ex:	extend vsi used for core
  *
- * @vsi_ctx:		Local VSI data for this decoding context
+ * @vsi_ctx_ex:	Local extend vsi data for this decoding context
  * @h264_slice_param:	the parameters that hardware use to decode
  *
  * @resolution_changed:resolution changed
@@ -176,10 +176,10 @@ struct vdec_h264_slice_inst {
 	struct mtk_vcodec_mem pred_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
 	struct vdec_vpu_inst vpu;
-	struct vdec_h264_slice_vsi *vsi;
-	struct vdec_h264_slice_vsi *vsi_core;
+	struct vdec_h264_slice_vsi_ex *vsi_ex;
+	struct vdec_h264_slice_vsi_ex *vsi_core_ex;
 
-	struct vdec_h264_slice_vsi vsi_ctx;
+	struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
 
 	unsigned int resolution_changed;
@@ -416,28 +416,28 @@ static void vdec_h264_slice_setup_lat_buffer(struct vdec_h264_slice_inst *inst,
 	struct mtk_vcodec_mem *mem;
 	int i;
 
-	inst->vsi->bs.dma_addr = (u64)bs->dma_addr;
-	inst->vsi->bs.size = bs->size;
+	inst->vsi_ex->bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ex->bs.size = bs->size;
 
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		inst->vsi->mv_buf_dma[i].dma_addr = mem->dma_addr;
-		inst->vsi->mv_buf_dma[i].size = mem->size;
+		inst->vsi_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_ex->mv_buf_dma[i].size = mem->size;
 	}
-	inst->vsi->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
-	inst->vsi->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
 
-	inst->vsi->row_info.dma_addr = 0;
-	inst->vsi->row_info.size = 0;
+	inst->vsi_ex->row_info.dma_addr = 0;
+	inst->vsi_ex->row_info.size = 0;
 
-	inst->vsi->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
-	inst->vsi->err_map.size = lat_buf->wdma_err_addr.size;
+	inst->vsi_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_ex->err_map.size = lat_buf->wdma_err_addr.size;
 
-	inst->vsi->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
-	inst->vsi->slice_bc.size = lat_buf->slice_bc_addr.size;
+	inst->vsi_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
 
-	inst->vsi->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
-	inst->vsi->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
+	inst->vsi_ex->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi_ex->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
 }
 
 static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_inst *inst,
@@ -468,33 +468,33 @@ static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_inst *inst,
 
 	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
 
-	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
-	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
-	inst->vsi_core->fb.c.dma_addr = c_fb_dma;
-	inst->vsi_core->fb.c.size = ctx->picinfo.fb_sz[1];
+	inst->vsi_core_ex->fb.y.dma_addr = y_fb_dma;
+	inst->vsi_core_ex->fb.y.size = ctx->picinfo.fb_sz[0];
+	inst->vsi_core_ex->fb.c.dma_addr = c_fb_dma;
+	inst->vsi_core_ex->fb.c.size = ctx->picinfo.fb_sz[1];
 
-	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
-	inst->vsi_core->dec.nal_info = share_info->nal_info;
+	inst->vsi_core_ex->dec.vdec_fb_va = (unsigned long)fb;
+	inst->vsi_core_ex->dec.nal_info = share_info->nal_info;
 
-	inst->vsi_core->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
-	inst->vsi_core->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi_core_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
 
-	inst->vsi_core->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
-	inst->vsi_core->err_map.size = lat_buf->wdma_err_addr.size;
+	inst->vsi_core_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core_ex->err_map.size = lat_buf->wdma_err_addr.size;
 
-	inst->vsi_core->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
-	inst->vsi_core->slice_bc.size = lat_buf->slice_bc_addr.size;
+	inst->vsi_core_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
 
-	inst->vsi_core->row_info.dma_addr = 0;
-	inst->vsi_core->row_info.size = 0;
+	inst->vsi_core_ex->row_info.dma_addr = 0;
+	inst->vsi_core_ex->row_info.size = 0;
 
-	inst->vsi_core->trans.dma_addr = share_info->trans_start;
-	inst->vsi_core->trans.dma_addr_end = share_info->trans_end;
+	inst->vsi_core_ex->trans.dma_addr = share_info->trans_start;
+	inst->vsi_core_ex->trans.dma_addr_end = share_info->trans_end;
 
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		inst->vsi_core->mv_buf_dma[i].dma_addr = mem->dma_addr;
-		inst->vsi_core->mv_buf_dma[i].size = mem->size;
+		inst->vsi_core_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_core_ex->mv_buf_dma[i].size = mem->size;
 	}
 
 	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
@@ -526,14 +526,14 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_free_inst;
 	}
 
-	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi), VCODEC_DEC_ALIGNED_64);
-	inst->vsi = inst->vpu.vsi;
+	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi_ex), VCODEC_DEC_ALIGNED_64);
+	inst->vsi_ex = inst->vpu.vsi;
 	if (ctx->is_secure_playback)
-		inst->vsi_core = mtk_vcodec_dec_get_shm_buffer_va(ctx->dev, MTK_VDEC_CORE,
-								  OPTEE_DATA_INDEX);
+		inst->vsi_core_ex = mtk_vcodec_dec_get_shm_buffer_va(ctx->dev, MTK_VDEC_CORE,
+								     OPTEE_DATA_INDEX);
 	else
-		inst->vsi_core =
-			(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+		inst->vsi_core_ex =
+			(struct vdec_h264_slice_vsi_ex *)(((char *)inst->vpu.vsi) + vsi_size);
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
 
@@ -574,14 +574,14 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 
 	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
-	memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
+	memcpy(&inst->vsi_core_ex->h264_slice_params, &share_info->h264_slice_params,
 	       sizeof(share_info->h264_slice_params));
 
 	err = vdec_h264_slice_setup_core_buffer(inst, share_info, lat_buf);
 	if (err)
 		goto vdec_dec_end;
 
-	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_slice_params,
+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core_ex->h264_slice_params,
 					    share_info);
 	err = vpu_dec_core(vpu);
 	if (err) {
@@ -595,16 +595,16 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
 		if (timeout)
 			mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
-		inst->vsi_core->dec.timeout = !!timeout;
+		inst->vsi_core_ex->dec.timeout = !!timeout;
 
 		vpu_dec_core_end(vpu);
 	}
 	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
 		       ctx->decoded_frame_cnt,
-		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
-		       inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
-		       inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
-		       inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
+		       inst->vsi_core_ex->dec.crc[0], inst->vsi_core_ex->dec.crc[1],
+		       inst->vsi_core_ex->dec.crc[2], inst->vsi_core_ex->dec.crc[3],
+		       inst->vsi_core_ex->dec.crc[4], inst->vsi_core_ex->dec.crc[5],
+		       inst->vsi_core_ex->dec.crc[6], inst->vsi_core_ex->dec.crc[7]);
 
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
@@ -674,7 +674,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
 	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
-						     &inst->vsi->h264_slice_params);
+						     &inst->vsi_ex->h264_slice_params);
 	if (err)
 		goto err_free_fb_out;
 
@@ -696,12 +696,13 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	vdec_h264_slice_setup_lat_buffer(inst, bs, lat_buf);
 	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
-		       inst->vsi->ube.dma_addr, (unsigned long)inst->vsi->ube.size,
-		       inst->vsi->err_map.dma_addr);
+		       inst->vsi_ex->ube.dma_addr, (unsigned long)inst->vsi_ex->ube.size,
+		       inst->vsi_ex->err_map.dma_addr);
 
 	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%llx))",
-		       inst->vsi->slice_bc.dma_addr, (unsigned long)inst->vsi->slice_bc.size,
-		       inst->vsi->trans.dma_addr, inst->vsi->trans.dma_addr_end);
+		       inst->vsi_ex->slice_bc.dma_addr, (unsigned long)inst->vsi_ex->slice_bc.size,
+		       inst->vsi_ex->trans.dma_addr, inst->vsi_ex->trans.dma_addr_end);
+
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
 		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
@@ -709,16 +710,16 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	if (inst->ctx->is_secure_playback)
-		share_info->trans_end = inst->vsi->dec.wdma_end_addr_offset;
+		share_info->trans_end = inst->vsi_ex->dec.wdma_end_addr_offset;
 	else
 		share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-			inst->vsi->dec.wdma_end_addr_offset;
+			inst->vsi_ex->dec.wdma_end_addr_offset;
 
 	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
-	share_info->nal_info = inst->vsi->dec.nal_info;
+	share_info->nal_info = inst->vsi_ex->dec.nal_info;
 
 	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
-		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
 		       sizeof(share_info->h264_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
@@ -729,7 +730,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
 		if (timeout)
 			mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
-		inst->vsi->dec.timeout = !!timeout;
+		inst->vsi_ex->dec.timeout = !!timeout;
 
 		err = vpu_dec_end(vpu);
 	}
@@ -742,19 +743,20 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	if (inst->ctx->is_secure_playback)
-		share_info->trans_end = inst->vsi->dec.wdma_end_addr_offset;
+		share_info->trans_end = inst->vsi_ex->dec.wdma_end_addr_offset;
 	else
 		share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-			inst->vsi->dec.wdma_end_addr_offset;
+			inst->vsi_ex->dec.wdma_end_addr_offset;
 	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
 
 	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
-		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
 		       sizeof(share_info->h264_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
-		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
+		       inst->vsi_ex->dec.crc[0], inst->vsi_ex->dec.crc[1],
+		       inst->vsi_ex->dec.crc[2]);
 
 	inst->slice_dec_num++;
 	return 0;
@@ -790,11 +792,11 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
 		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
 
-	inst->vsi_ctx.bs.dma_addr = (u64)bs->dma_addr;
-	inst->vsi_ctx.bs.size = bs->size;
-	inst->vsi_ctx.fb.y.dma_addr = y_fb_dma;
-	inst->vsi_ctx.fb.c.dma_addr = c_fb_dma;
-	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+	inst->vsi_ctx_ex.bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx_ex.bs.size = bs->size;
+	inst->vsi_ctx_ex.fb.y.dma_addr = y_fb_dma;
+	inst->vsi_ctx_ex.fb.c.dma_addr = c_fb_dma;
+	inst->vsi_ctx_ex.dec.vdec_fb_va = (u64)(uintptr_t)fb;
 
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
 				   &dst_buf_info->m2m_buf.vb, true);
@@ -802,8 +804,8 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
-	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
-	       sizeof(inst->vsi_ctx.h264_slice_params));
+	memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx_ex.h264_slice_params));
 
 	buf = (unsigned char *)bs->va;
 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
@@ -811,7 +813,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 		err = -EINVAL;
 		goto err_free_fb_out;
 	}
-	inst->vsi_ctx.dec.nal_info = buf[nal_start_idx];
+	inst->vsi_ctx_ex.dec.nal_info = buf[nal_start_idx];
 
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
@@ -826,11 +828,11 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 		for (i = 0; i < H264_MAX_MV_NUM; i++) {
 			mem = &inst->mv_buf[i];
-			inst->vsi_ctx.mv_buf_dma[i].dma_addr = mem->dma_addr;
+			inst->vsi_ctx_ex.mv_buf_dma[i].dma_addr = mem->dma_addr;
 		}
 	}
 
-	memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx_ex, sizeof(inst->vsi_ctx_ex));
 	err = vpu_dec_start(vpu, data, 2);
 	if (err)
 		goto err_free_fb_out;
@@ -843,19 +845,19 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 			mtk_vdec_err(inst->ctx, "decode timeout: pic_%d",
 				     inst->ctx->decoded_frame_cnt);
 
-		inst->vsi->dec.timeout = !!err;
+		inst->vsi_ex->dec.timeout = !!err;
 		err = vpu_dec_end(vpu);
 		if (err)
 			goto err_free_fb_out;
 	}
 
-	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
+	memcpy(&inst->vsi_ctx_ex, inst->vpu.vsi, sizeof(inst->vsi_ctx_ex));
 	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
 		       inst->ctx->decoded_frame_cnt,
-		       inst->vsi_ctx.dec.crc[0], inst->vsi_ctx.dec.crc[1],
-		       inst->vsi_ctx.dec.crc[2], inst->vsi_ctx.dec.crc[3],
-		       inst->vsi_ctx.dec.crc[4], inst->vsi_ctx.dec.crc[5],
-		       inst->vsi_ctx.dec.crc[6], inst->vsi_ctx.dec.crc[7]);
+		       inst->vsi_ctx_ex.dec.crc[0], inst->vsi_ctx_ex.dec.crc[1],
+		       inst->vsi_ctx_ex.dec.crc[2], inst->vsi_ctx_ex.dec.crc[3],
+		       inst->vsi_ctx_ex.dec.crc[4], inst->vsi_ctx_ex.dec.crc[5],
+		       inst->vsi_ctx_ex.dec.crc[6], inst->vsi_ctx_ex.dec.crc[7]);
 
 	inst->ctx->decoded_frame_cnt++;
 	return 0;
-- 
2.18.0

