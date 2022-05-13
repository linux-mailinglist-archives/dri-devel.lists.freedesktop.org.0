Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6F525EAC
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 11:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72EA10EEAD;
	Fri, 13 May 2022 09:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A9D10F2D2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 09:25:06 +0000 (UTC)
X-UUID: 3e5a0e1c8d9047cca6d59814e75317e4-20220513
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:db04cc78-6b89-4060-aa80-92724f6b7de7, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:be841cf2-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 3e5a0e1c8d9047cca6d59814e75317e4-20220513
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 326340984; Fri, 13 May 2022 17:25:00 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 13 May 2022 17:24:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 May 2022 17:24:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 May 2022 17:24:56 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v3] media: mediatek: vcodec: add vp9 decoder driver for mt8186
Date: Fri, 13 May 2022 17:24:53 +0800
Message-ID: <20220513092453.9600-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vp9 single core decode driver to support mt8186.

Signed-off-by: Mingjia Zhang <mingjia.zhang@mediatek.com>
Signed-off-by: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
This patch depends on "add h264 decoder driver for mt8186"[1]

[1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220512034620.30500-1-yunfei.dong@mediatek.com/
---
changed with v2:
- fix __iomem not reasonable, align share memory to dram.
changed with v1:
- fix sparse and smatch check fail.
---
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 197 +++++++++++++++++-
 .../platform/mediatek/vcodec/vdec_drv_if.c    |   2 +-
 2 files changed, 195 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index 023aba4ec2c4..fba06f321baa 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -439,6 +439,8 @@ struct vdec_vp9_slice_ref {
  * @init_vsi:		vsi used for initialized VP9 instance
  * @vsi:		vsi used for decoding/flush ...
  * @core_vsi:		vsi used for Core stage
+ *
+ * @sc_pfc:		per frame context single core
  * @counts_map:	used map to counts_helper
  * @counts_helper:	counts table according to newest kernel spec
  */
@@ -487,6 +489,7 @@ struct vdec_vp9_slice_instance {
 	};
 	struct vdec_vp9_slice_vsi *core_vsi;
 
+	struct vdec_vp9_slice_pfc sc_pfc;
 	struct vdec_vp9_slice_counts_map counts_map;
 	struct v4l2_vp9_frame_symbol_counts counts_helper;
 };
@@ -692,6 +695,25 @@ static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_log2)
 	return offset < mi_num ? offset : mi_num;
 }
 
+static
+int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance)
+{
+	struct vb2_v4l2_buffer *src;
+	struct vb2_v4l2_buffer *dst;
+
+	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
+	if (!src)
+		return -EINVAL;
+
+	dst = v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
+	if (!dst)
+		return -EINVAL;
+
+	v4l2_m2m_buf_copy_metadata(src, dst, true);
+
+	return 0;
+}
+
 static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
 						 struct vdec_lat_buf *lat_buf)
 {
@@ -1567,6 +1589,33 @@ static int vdec_vp9_slice_update_prob(struct vdec_vp9_slice_instance *instance,
 	return 0;
 }
 
+static int vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance *instance,
+				        struct vdec_vp9_slice_pfc *pfc)
+{
+	struct vdec_vp9_slice_vsi *vsi;
+
+	vsi = &pfc->vsi;
+	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
+
+	mtk_vcodec_debug(instance, "Frame %u Y_CRC %08x %08x %08x %08x\n",
+			 pfc->seq,
+			 vsi->state.crc[0], vsi->state.crc[1],
+			 vsi->state.crc[2], vsi->state.crc[3]);
+	mtk_vcodec_debug(instance, "Frame %u C_CRC %08x %08x %08x %08x\n",
+			 pfc->seq,
+			 vsi->state.crc[4], vsi->state.crc[5],
+			 vsi->state.crc[6], vsi->state.crc[7]);
+
+	vdec_vp9_slice_update_prob(instance, vsi);
+
+	instance->width = vsi->frame.uh.frame_width;
+	instance->height = vsi->frame.uh.frame_height;
+	instance->frame_type = vsi->frame.uh.frame_type;
+	instance->show_frame = vsi->frame.uh.show_frame;
+
+	return 0;
+}
+
 static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *instance,
 				     struct vdec_lat_buf *lat_buf,
 				     struct vdec_vp9_slice_pfc *pfc)
@@ -1690,6 +1739,40 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 	return 0;
 }
 
+static void vdec_vp9_slice_setup_single_buffer(struct vdec_vp9_slice_instance *instance,
+					       struct vdec_vp9_slice_pfc *pfc,
+					       struct vdec_vp9_slice_vsi *vsi,
+					       struct mtk_vcodec_mem *bs,
+					       struct vdec_fb *fb)
+{
+	int i;
+
+	vsi->bs.buf.dma_addr = bs->dma_addr;
+	vsi->bs.buf.size = bs->size;
+	vsi->bs.frame.dma_addr = bs->dma_addr;
+	vsi->bs.frame.size = bs->size;
+
+	for (i = 0; i < 2; i++) {
+		vsi->mv[i].dma_addr = instance->mv[i].dma_addr;
+		vsi->mv[i].size = instance->mv[i].size;
+	}
+	for (i = 0; i < 2; i++) {
+		vsi->seg[i].dma_addr = instance->seg[i].dma_addr;
+		vsi->seg[i].size = instance->seg[i].size;
+	}
+	vsi->tile.dma_addr = instance->tile.dma_addr;
+	vsi->tile.size = instance->tile.size;
+	vsi->prob.dma_addr = instance->prob.dma_addr;
+	vsi->prob.size = instance->prob.size;
+	vsi->counts.dma_addr = instance->counts.dma_addr;
+	vsi->counts.size = instance->counts.size;
+
+	vsi->row_info.buf = 0;
+	vsi->row_info.size = 0;
+
+	vdec_vp9_slice_setup_core_buffer(instance, pfc, vsi, fb, NULL);
+}
+
 static int vdec_vp9_slice_setup_core(struct vdec_vp9_slice_instance *instance,
 				     struct vdec_fb *fb,
 				     struct vdec_lat_buf *lat_buf,
@@ -1716,6 +1799,43 @@ static int vdec_vp9_slice_setup_core(struct vdec_vp9_slice_instance *instance,
 	return ret;
 }
 
+static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
+				       struct mtk_vcodec_mem *bs,
+				       struct vdec_fb *fb,
+				       struct vdec_vp9_slice_pfc *pfc)
+{
+	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
+	int ret;
+
+	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance);
+	if (ret)
+		goto err;
+
+	ret = vdec_vp9_slice_setup_pfc(instance, pfc);
+	if (ret)
+		goto err;
+
+	ret = vdec_vp9_slice_alloc_working_buffer(instance, vsi);
+	if (ret)
+		goto err;
+
+	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
+	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
+
+	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
+	if (ret)
+		goto err;
+
+	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	return ret;
+}
+
 static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 				      struct vdec_lat_buf *lat_buf,
 				      struct vdec_vp9_slice_pfc *pfc)
@@ -1813,8 +1933,8 @@ static int vdec_vp9_slice_flush(void *h_vdec, struct mtk_vcodec_mem *bs,
 	struct vdec_vp9_slice_instance *instance = h_vdec;
 
 	mtk_vcodec_debug(instance, "flush ...\n");
-
-	vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
+	if (instance->ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
+		vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
 	return vpu_dec_reset(&instance->vpu);
 }
 
@@ -1867,6 +1987,63 @@ static int vdec_vp9_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
 	return 0;
 }
 
+static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				        struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_vp9_slice_instance *instance = h_vdec;
+	struct vdec_vp9_slice_pfc *pfc = &(instance->sc_pfc);
+	struct vdec_vp9_slice_vsi *vsi;
+	struct mtk_vcodec_ctx *ctx;
+	int ret;
+
+	if (!instance || !instance->ctx)
+		return -EINVAL;
+	ctx = instance->ctx;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vdec_vp9_slice_flush(h_vdec, bs, fb, res_chg);
+
+	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
+	if (!fb)
+		return -EBUSY;
+
+	vsi = &pfc->vsi;
+
+	ret = vdec_vp9_slice_setup_single(instance, bs, fb, pfc);
+	if (ret) {
+		mtk_vcodec_err(instance, "Failed to setup VP9 single ret %d\n", ret);
+		return ret;
+	}
+	vdec_vp9_slice_vsi_to_remote(vsi, instance->vsi);
+
+	ret = vpu_dec_start(&instance->vpu, NULL, 0);
+	if (ret) {
+		mtk_vcodec_err(instance, "Failed to dec VP9 ret %d\n", ret);
+		return ret;
+	}
+
+	ret = mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IRQ_RECEIVED,
+					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	/* update remote vsi if decode timeout */
+	if (ret) {
+		mtk_vcodec_err(instance, "VP9 decode timeout %d\n", ret);
+		WRITE_ONCE(instance->vsi->state.timeout, 1);
+	}
+
+	vpu_dec_end(&instance->vpu);
+
+	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
+	ret = vdec_vp9_slice_update_single(instance, pfc);
+	if (ret) {
+		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
+		return ret;
+	}
+
+	instance->ctx->decoded_frame_cnt++;
+	return 0;
+}
+
 static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 				     struct vdec_fb *fb, bool *res_chg)
 {
@@ -1946,6 +2123,20 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	return 0;
 }
 
+static int vdec_vp9_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				 struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_vp9_slice_instance *instance = h_vdec;
+	int ret;
+
+	if (instance->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
+		ret = vdec_vp9_slice_single_decode(h_vdec, bs, fb, res_chg);
+	else
+		ret = vdec_vp9_slice_lat_decode(h_vdec, bs, fb, res_chg);
+
+	return ret;
+}
+
 static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 {
 	struct vdec_vp9_slice_instance *instance;
@@ -2024,7 +2215,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 const struct vdec_common_if vdec_vp9_slice_lat_if = {
 	.init		= vdec_vp9_slice_init,
-	.decode		= vdec_vp9_slice_lat_decode,
+	.decode		= vdec_vp9_slice_decode,
 	.get_param	= vdec_vp9_slice_get_param,
 	.deinit		= vdec_vp9_slice_deinit,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
index 27b4b35039cf..f3807f03d880 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
@@ -47,7 +47,7 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		break;
 	case V4L2_PIX_FMT_VP9_FRAME:
 		ctx->dec_if = &vdec_vp9_slice_lat_if;
-		ctx->hw_id = MTK_VDEC_LAT0;
+		ctx->hw_id = IS_VDEC_LAT_ARCH(hw_arch) ? MTK_VDEC_LAT0 : MTK_VDEC_CORE;
 		break;
 	default:
 		return -EINVAL;
-- 
2.18.0

