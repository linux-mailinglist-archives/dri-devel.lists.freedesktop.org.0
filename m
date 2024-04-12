Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D641E8A2A79
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 11:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFE210F523;
	Fri, 12 Apr 2024 09:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="pmKS8e4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5469310F2BE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 09:09:32 +0000 (UTC)
X-UUID: 5ceda96cf8ac11eeb8927bc1f75efef4-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=st0bkxvZRoIXUfM0Z84FBtRvGpfmAN8pJ1WyykYc3zg=; 
 b=pmKS8e4fP7YvjK0lukpU9BFpaJXjINYP0RULNDLKigoVeo751tXtoU9dDbyS/IZ3NBVAEZgbWWh8uMGV+MlsGs4L+YMOMIZLFWHg9YrF8NRJNTQvf/eTxegZCIvdDswjBE2tChjOvmoSPdVQNBYE3gd8AJgaO0lw8e9S9XQqicY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:f93741be-83a3-404a-aa76-c3c642a3c64b, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:a3e5d5fa-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5ceda96cf8ac11eeb8927bc1f75efef4-20240412
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1297080015; Fri, 12 Apr 2024 17:09:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:09:24 +0800
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
Subject: [PATCH v5,
 21/23] media: mediatek: vcodec: move vdec init interface to setup
 callback
Date: Fri, 12 Apr 2024 17:08:49 +0800
Message-ID: <20240412090851.24999-22-yunfei.dong@mediatek.com>
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

Getting secure video playback (svp) flag when request output buffer, then
calling init interface to init svp parameters in optee-os.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 139 +++++++++++-------
 1 file changed, 89 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index ebe21064616c..a07b6ba0ea82 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -184,6 +184,69 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_dec_ctx *ctx)
 	q_data->bytesperline[1] = q_data->coded_width;
 }
 
+static int mtk_vcodec_dec_init_pic_info(struct mtk_vcodec_dec_ctx *ctx, enum v4l2_buf_type type)
+{
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
+	struct mtk_q_data *q_data;
+	int ret;
+
+	if (!ctx->current_codec)
+		return 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(type) && ctx->state == MTK_STATE_FREE) {
+		q_data = mtk_vdec_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!q_data)
+			return -EINVAL;
+
+		ret = vdec_if_init(ctx, q_data->fmt->fourcc);
+		if (ret) {
+			mtk_v4l2_vdec_err(ctx, "[%d]: vdec_if_init() fail ret=%d",
+					  ctx->id, ret);
+			return -EINVAL;
+		}
+		ctx->state = MTK_STATE_INIT;
+	}
+
+	if (!dec_pdata->uses_stateless_api)
+		return 0;
+
+	/*
+	 * If get pic info fail, need to use the default pic info params, or
+	 * v4l2-compliance will fail
+	 */
+	ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
+	if (ret)
+		mtk_v4l2_vdec_err(ctx, "[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
+				  ctx->id);
+
+	q_data = mtk_vdec_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (q_data->fmt->num_planes == 1) {
+		q_data->sizeimage[0] = ctx->picinfo.fb_sz[0] + ctx->picinfo.fb_sz[1];
+		q_data->bytesperline[0] = ctx->picinfo.buf_w;
+	} else {
+		if (ctx->is_secure_playback)
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0] + ctx->picinfo.fb_sz[1];
+		else
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
+
+		q_data->bytesperline[0] = ctx->picinfo.buf_w;
+		q_data->sizeimage[1] = ctx->picinfo.fb_sz[1];
+		q_data->bytesperline[1] = ctx->picinfo.buf_w;
+	}
+
+	q_data->coded_width = ctx->picinfo.buf_w;
+	q_data->coded_height = ctx->picinfo.buf_h;
+
+	ctx->last_decoded_picinfo = ctx->picinfo;
+	mtk_v4l2_vdec_dbg(2, ctx,
+			  "[%d] init() plane:%d wxh=%dx%d pic wxh=%dx%d sz=0x%x_0x%x",
+			  ctx->id, q_data->fmt->num_planes,
+			  ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+			  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			  q_data->sizeimage[0], q_data->sizeimage[1]);
+	return 0;
+}
+
 static int vidioc_vdec_qbuf(struct file *file, void *priv,
 			    struct v4l2_buffer *buf)
 {
@@ -479,17 +542,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->ycbcr_enc = pix_mp->ycbcr_enc;
 		ctx->quantization = pix_mp->quantization;
 		ctx->xfer_func = pix_mp->xfer_func;
-
 		ctx->current_codec = fmt->fourcc;
-		if (ctx->state == MTK_STATE_FREE) {
-			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
-			if (ret) {
-				mtk_v4l2_vdec_err(ctx, "[%d]: vdec_if_init() fail ret=%d",
-						  ctx->id, ret);
-				return -EINVAL;
-			}
-			ctx->state = MTK_STATE_INIT;
-		}
 	} else {
 		ctx->capture_fourcc = fmt->fourcc;
 	}
@@ -502,46 +555,11 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->picinfo.pic_w = pix_mp->width;
 		ctx->picinfo.pic_h = pix_mp->height;
 
-		/*
-		 * If get pic info fail, need to use the default pic info params, or
-		 * v4l2-compliance will fail
-		 */
-		ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
-		if (ret) {
-			mtk_v4l2_vdec_err(ctx, "[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
-					  ctx->id);
-		}
-
-		ctx->last_decoded_picinfo = ctx->picinfo;
-
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1) {
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
-				ctx->picinfo.fb_sz[0] +
-				ctx->picinfo.fb_sz[1];
-			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
-				ctx->picinfo.buf_w;
-		} else {
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
-				ctx->picinfo.fb_sz[0];
-			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
-				ctx->picinfo.buf_w;
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1] =
-				ctx->picinfo.fb_sz[1];
-			ctx->q_data[MTK_Q_DATA_DST].bytesperline[1] =
-				ctx->picinfo.buf_w;
-		}
-
-		ctx->q_data[MTK_Q_DATA_DST].coded_width = ctx->picinfo.buf_w;
-		ctx->q_data[MTK_Q_DATA_DST].coded_height = ctx->picinfo.buf_h;
-		mtk_v4l2_vdec_dbg(2, ctx,
-				  "[%d] init() plane:%d wxh=%dx%d pic wxh=%dx%d sz=0x%x_0x%x",
-				  ctx->id, pix_mp->num_planes,
-				  ctx->picinfo.buf_w, ctx->picinfo.buf_h,
-				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-				  ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
-				  ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
+		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			ret = mtk_vcodec_dec_init_pic_info(ctx, f->type);
 	}
-	return 0;
+
+	return ret;
 }
 
 static int vidioc_enum_framesizes(struct file *file, void *priv,
@@ -722,7 +740,7 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 {
 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vq);
 	struct mtk_q_data *q_data;
-	unsigned int i;
+	unsigned int i, ret;
 
 	q_data = mtk_vdec_get_q_data(ctx, vq->type);
 
@@ -731,6 +749,25 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		return -EINVAL;
 	}
 
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (vq->restricted_mem && !ctx->is_secure_playback) {
+			ret = mtk_vcodec_dec_optee_open(ctx->dev->optee_private);
+			if (ret) {
+				mtk_v4l2_vdec_err(ctx, "Failed to open decoder optee os");
+				return ret;
+			}
+			ctx->is_secure_playback = vq->restricted_mem;
+			mtk_v4l2_vdec_dbg(1, ctx, "Getting secure decoder mode:%d",
+					  ctx->is_secure_playback);
+		}
+
+		ret = mtk_vcodec_dec_init_pic_info(ctx, vq->type);
+		if (ret) {
+			mtk_v4l2_vdec_err(ctx, "Failed to init picture information");
+			return ret;
+		}
+	}
+
 	if (*nplanes) {
 		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 			if (*nplanes != q_data->fmt->num_planes)
@@ -980,6 +1017,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->lock		= &ctx->dev->dev_mutex;
 	src_vq->dev             = &ctx->dev->plat_dev->dev;
 	src_vq->allow_cache_hints = 1;
+	src_vq->allow_restricted_mem = 1;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret) {
@@ -996,6 +1034,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->lock		= &ctx->dev->dev_mutex;
 	dst_vq->dev             = &ctx->dev->plat_dev->dev;
 	dst_vq->allow_cache_hints = 1;
+	dst_vq->allow_restricted_mem = 1;
 
 	ret = vb2_queue_init(dst_vq);
 	if (ret)
-- 
2.18.0

