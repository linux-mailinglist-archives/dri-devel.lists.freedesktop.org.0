Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E75BAB7B9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF43310E4D8;
	Tue, 30 Sep 2025 05:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="j3HdkPOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0866610E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:11 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035720epoutp03792ec572ce21d8fb507e4cb580f060d8~p80y6xV6h3249232492epoutp03V
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:57:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035720epoutp03792ec572ce21d8fb507e4cb580f060d8~p80y6xV6h3249232492epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204640;
 bh=shSGGSQ/J7/0hvsTymgYvJaWZEtxz03ANsXDedOYjPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j3HdkPOvHllrbJB1NuTbsnTPFtWltdSs4Qjj9aSuqQKmD/u2VeN06CkMhIKDORwZn
 G99yknqVu9cJQR+jaevX2mCmYkkbelm3xzKCL7dlwYt/Da4b++2rahqNZ06I46/8i+
 llXGDeLtk2rwY/XonpoPHm7ie1f0GroZ4302b6MY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20250930035718epcas5p2e2942753026962581113f4d3da88dfe5~p80xqepOh0188301883epcas5p2G;
 Tue, 30 Sep 2025 03:57:18 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cbPQP66Htz6B9mJ; Tue, 30 Sep
 2025 03:57:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035717epcas5p1dd561ae382ab7cbab428c528a046e989~p80wFKIng2306123061epcas5p1h;
 Tue, 30 Sep 2025 03:57:17 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035712epsmtip1013bd2f40f267c4e3e1c1f4e6fe0a6e6~p80rP3zc62908429084epsmtip1c;
 Tue, 30 Sep 2025 03:57:11 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 29/29] =?UTF-8?q?media:=20mfc:=20Hardware=E2=80=91accelera?=
 =?UTF-8?q?ted=20encoding=20support?=
Date: Tue, 30 Sep 2025 09:33:48 +0530
Message-Id: <20250930040348.3702923-30-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035717epcas5p1dd561ae382ab7cbab428c528a046e989
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035717epcas5p1dd561ae382ab7cbab428c528a046e989
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035717epcas5p1dd561ae382ab7cbab428c528a046e989@epcas5p1.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

- Add for MPEG‑4, H.263, VP8/VP9, HEVC codec support with extended
  contexts and buffer allocation.
- Implement LCU sizing, motion‑estimation buffers, and align
  scratch buffers.
- Unify ROI buffer handling across all encoders.
- Register additional pixel formats (`mfc_format.h`).
- Enhance QoS weighting and B‑frame/reference‑count logic.
- Introduce hierarchical‑coding
  controls (layer count, per‑layer bitrate)
  and SVC for HEVC, VP8, VP9.
- Update timestamp handling for H.263 and improved VP8 buffer‑exhaustion
  error reporting.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_buf.c         | 71 ++++++++++++++++++-
 .../samsung/exynos-mfc/base/mfc_format.h      | 40 +++++++++++
 .../samsung/exynos-mfc/base/mfc_qos.c         | 23 +++++-
 .../samsung/exynos-mfc/base/mfc_utils.h       | 10 ++-
 .../samsung/exynos-mfc/mfc_core_buf_ctrl.c    | 59 ++++++++++++++-
 .../samsung/exynos-mfc/mfc_core_isr.c         |  2 +
 6 files changed, 198 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
index 0186fe3327f1..164852e83e7d 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
@@ -133,10 +133,17 @@ int mfc_alloc_instance_context(struct mfc_core_ctx *core_ctx)
 		core_ctx->instance_ctx_buf.size = buf_size->other_dec_ctx;
 		break;
 	case MFC_REG_CODEC_H264_ENC:
+	case MFC_REG_CODEC_AV1_DEC:
 		core_ctx->instance_ctx_buf.size = buf_size->h264_enc_ctx;
 		break;
-	case MFC_REG_CODEC_AV1_DEC:
-		core_ctx->instance_ctx_buf.size = buf_size->av1_dec_ctx;
+	case MFC_REG_CODEC_HEVC_ENC:
+		core_ctx->instance_ctx_buf.size = buf_size->hevc_enc_ctx;
+		break;
+	case MFC_REG_CODEC_MPEG4_ENC:
+	case MFC_REG_CODEC_H263_ENC:
+	case MFC_REG_CODEC_VP8_ENC:
+	case MFC_REG_CODEC_VP9_ENC:
+		core_ctx->instance_ctx_buf.size = buf_size->other_enc_ctx;
 		break;
 	default:
 		core_ctx->instance_ctx_buf.size = 0;
@@ -256,6 +263,7 @@ static void __mfc_enc_calc_codec_buffer_size(struct mfc_core_ctx *core_ctx)
 	struct mfc_ctx *ctx = core_ctx->ctx;
 	struct mfc_enc *enc;
 	unsigned int mb_width, mb_height;
+	unsigned int lcu_width = 0, lcu_height = 0;
 
 	enc = ctx->enc_priv;
 	enc->tmv_buffer_size = 0;
@@ -263,6 +271,9 @@ static void __mfc_enc_calc_codec_buffer_size(struct mfc_core_ctx *core_ctx)
 	mb_width = WIDTH_MB(ctx->crop_width);
 	mb_height = HEIGHT_MB(ctx->crop_height);
 
+	lcu_width = ENC_LCU_WIDTH(ctx->crop_width);
+	lcu_height = ENC_LCU_HEIGHT(ctx->crop_height);
+
 	/* default recon buffer size, it can be changed in case of 422, 10bit */
 	enc->luma_dpb_size =
 		ALIGN(ENC_LUMA_DPB_SIZE(ctx->crop_width, ctx->crop_height), SZ_64);
@@ -293,6 +304,47 @@ static void __mfc_enc_calc_codec_buffer_size(struct mfc_core_ctx *core_ctx)
 			(ctx->dpb_count * (enc->luma_dpb_size +
 			enc->chroma_dpb_size + enc->me_buffer_size));
 		break;
+	case MFC_REG_CODEC_MPEG4_ENC:
+	case MFC_REG_CODEC_H263_ENC:
+		enc->me_buffer_size =
+			ALIGN(ENC_V100_MPEG4_ME_SIZE(mb_width, mb_height), SZ_256);
+
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size =
+			ctx->scratch_buf_size + enc->tmv_buffer_size +
+			(ctx->dpb_count * (enc->luma_dpb_size +
+			enc->chroma_dpb_size + enc->me_buffer_size));
+		break;
+	case MFC_REG_CODEC_VP8_ENC:
+		enc->me_buffer_size =
+			ALIGN(ENC_V100_VP8_ME_SIZE(mb_width, mb_height), SZ_256);
+
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size =
+			ctx->scratch_buf_size + enc->tmv_buffer_size +
+			(ctx->dpb_count * (enc->luma_dpb_size +
+			enc->chroma_dpb_size + enc->me_buffer_size));
+		break;
+	case MFC_REG_CODEC_VP9_ENC:
+		enc->me_buffer_size =
+			ALIGN(ENC_V100_VP9_ME_SIZE(lcu_width, lcu_height), SZ_256);
+
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size =
+			ctx->scratch_buf_size + enc->tmv_buffer_size +
+			(ctx->dpb_count * (enc->luma_dpb_size +
+					   enc->chroma_dpb_size + enc->me_buffer_size));
+		break;
+	case MFC_REG_CODEC_HEVC_ENC:
+		enc->me_buffer_size =
+			ALIGN(ENC_V100_HEVC_ME_SIZE(lcu_width, lcu_height), SZ_256);
+
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size =
+			ctx->scratch_buf_size + enc->tmv_buffer_size +
+			(ctx->dpb_count * (enc->luma_dpb_size +
+					   enc->chroma_dpb_size + enc->me_buffer_size));
+		break;
 	default:
 		core_ctx->codec_buf.size = 0;
 		mfc_err("invalid codec type: %d\n", ctx->codec_mode);
@@ -493,6 +545,7 @@ int mfc_alloc_enc_roi_buffer(struct mfc_core_ctx *core_ctx)
 	struct mfc_ctx *ctx = core_ctx->ctx;
 	struct mfc_enc *enc = ctx->enc_priv;
 	unsigned int mb_width, mb_height;
+	unsigned int lcu_width = 0, lcu_height = 0;
 	size_t size;
 	int i;
 
@@ -503,6 +556,20 @@ int mfc_alloc_enc_roi_buffer(struct mfc_core_ctx *core_ctx)
 	case MFC_REG_CODEC_H264_ENC:
 		size = ((((mb_width * (mb_height + 1) / 2) + 15) / 16) * 16) * 2;
 		break;
+	case MFC_REG_CODEC_MPEG4_ENC:
+	case MFC_REG_CODEC_VP8_ENC:
+		size = mb_width * mb_height;
+		break;
+	case MFC_REG_CODEC_VP9_ENC:
+		lcu_width = (ctx->crop_width + 63) / 64;
+		lcu_height = (ctx->crop_height + 63) / 64;
+		size = lcu_width * lcu_height * 4;
+		break;
+	case MFC_REG_CODEC_HEVC_ENC:
+		lcu_width = (ctx->crop_width + 31) / 32;
+		lcu_height = (ctx->crop_height + 31) / 32;
+		size = lcu_width * lcu_height;
+		break;
 	default:
 		mfc_debug(2,
 			  "ROI not supported codec type(%d). Allocate with default size\n",
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
index e8573d6b6005..070c669e1d82 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
@@ -271,6 +271,46 @@ static struct mfc_fmt mfc_formats[] = {
 		.num_planes = 1,
 		.mem_planes = 1,
 	},
+	{
+		.name = "ENC MPEG4",
+		.fourcc = V4L2_PIX_FMT_MPEG4,
+		.codec_mode = MFC_REG_CODEC_MPEG4_ENC,
+		.type = MFC_FMT_STREAM | MFC_FMT_ENC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "ENC H263",
+		.fourcc = V4L2_PIX_FMT_H263,
+		.codec_mode = MFC_REG_CODEC_H263_ENC,
+		.type = MFC_FMT_STREAM | MFC_FMT_ENC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "ENC VP8",
+		.fourcc = V4L2_PIX_FMT_VP8,
+		.codec_mode = MFC_REG_CODEC_VP8_ENC,
+		.type = MFC_FMT_STREAM | MFC_FMT_ENC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "ENC VP9",
+		.fourcc = V4L2_PIX_FMT_VP9,
+		.codec_mode = MFC_REG_CODEC_VP9_ENC,
+		.type = MFC_FMT_STREAM | MFC_FMT_ENC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "ENC HEVC",
+		.fourcc = V4L2_PIX_FMT_HEVC,
+		.codec_mode = MFC_REG_CODEC_HEVC_ENC,
+		.type = MFC_FMT_STREAM | MFC_FMT_ENC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
 };
 
 #endif /* __MFC_FORMAT_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
index 40541e2d626f..73058ace1fd6 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
@@ -58,6 +58,7 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 		break;
 
 	case MFC_REG_CODEC_VP8_DEC:
+	case MFC_REG_CODEC_VP8_ENC:
 		weight = (weight * 100) / qos_weight->weight_vp8_vp9;
 		mfc_ctx_debug(3, "[QoS] vp8, vp9 codec, weight: %d\n", weight / 10);
 		if (num_planes == 3) {
@@ -80,12 +81,26 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 		}
 		break;
 
+	case MFC_REG_CODEC_HEVC_ENC:
+		weight = (weight * 100) / qos_weight->weight_h264_hevc;
+		mfc_ctx_debug(3, "[QoS] h264, hevc codec, weight: %d\n", weight / 10);
+		if (num_planes == 3) {
+			weight = (weight * 100) / qos_weight->weight_3plane;
+			mfc_ctx_debug(3, "[QoS] 3 plane, weight: %d\n", weight / 10);
+		}
+		if (ctx->is_422) {
+			weight = (weight * 100) / qos_weight->weight_422;
+			mfc_ctx_debug(3, "[QoS] 422foramt, weight: %d\n", weight / 10);
+		}
+		break;
+
 	case MFC_REG_CODEC_AV1_DEC:
 		weight = (weight * 100) / qos_weight->weight_av1;
 		mfc_ctx_debug(3, "[QoS] av1 codec, weight: %d\n", weight / 10);
 		break;
 
 	case MFC_REG_CODEC_VP9_DEC:
+	case MFC_REG_CODEC_VP9_ENC:
 		weight = (weight * 100) / qos_weight->weight_vp8_vp9;
 		mfc_ctx_debug(3, "[QoS] vp8, vp9 codec, weight: %d\n", weight / 10);
 
@@ -109,6 +124,8 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 	case MFC_REG_CODEC_VC1_RCV_DEC:
 	case MFC_REG_CODEC_VC1_DEC:
 	case MFC_REG_CODEC_MPEG2_DEC:
+	case MFC_REG_CODEC_MPEG4_ENC:
+	case MFC_REG_CODEC_H263_ENC:
 		weight = (weight * 100) / qos_weight->weight_other_codec;
 		mfc_ctx_debug(3, "[QoS] other codec, weight: %d\n", weight / 10);
 		break;
@@ -122,9 +139,13 @@ static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned l
 		if (mfc_is_enc_bframe(ctx)) {
 			weight = (weight * 100) / qos_weight->weight_bframe;
 			mfc_ctx_debug(3, "[QoS] B frame encoding, weight: %d\n", weight / 10);
-		} else if (IS_H264_ENC(ctx) && (p->num_refs_for_p >= 2)) {
+		} else if ((IS_H264_ENC(ctx) || IS_HEVC_ENC(ctx) || IS_VP8_ENC(ctx) ||
+					IS_VP9_ENC(ctx)) && (p->num_refs_for_p >= 2)) {
 			weight = (weight * 100) / qos_weight->weight_num_of_ref;
 			mfc_ctx_debug(3, "[QoS] num of ref >= 2, weight: %d\n", weight / 10);
+		} else if (IS_HEVC_ENC(ctx) && p->codec.hevc.general_pb_enable) {
+			weight = (weight * 100) / qos_weight->weight_gpb;
+			mfc_ctx_debug(3, "[QoS] Genaral PB, weight: %d\n", weight / 10);
 		}
 	}
 	if (dec) {
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
index a127f330fe16..8526f5676761 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
@@ -229,7 +229,11 @@ static inline int mfc_is_enc_bframe(struct mfc_ctx *ctx)
 	if (IS_H264_ENC(ctx)) {
 		num_hier_layer = p->codec.h264.num_hier_layer;
 		hier_qp_type = (int)p->codec.h264.hier_qp_type;
+	} else if (IS_HEVC_ENC(ctx)) {
+		num_hier_layer = p->codec.hevc.num_hier_layer;
+		hier_qp_type = (int)p->codec.hevc.hier_qp_type;
 	}
+
 	if (enc->params.num_b_frame ||
 	    (num_hier_layer >= 2 &&
 	     hier_qp_type == V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B))
@@ -402,7 +406,11 @@ static inline int mfc_enc_get_ts_delta(struct mfc_ctx *ctx)
 		 * so thie is also divided into pre-calculated 100.
 		 * (Preventing both overflow and calculation duplication)
 		 */
-		ts_delta = ctx->src_ts.ts_last_interval / 100;
+		if (IS_H263_ENC(ctx))
+			ts_delta = ctx->src_ts.ts_last_interval *
+				p->rc_framerate_res / USEC_PER_SEC;
+		else
+			ts_delta = ctx->src_ts.ts_last_interval / 100;
 	}
 	return ts_delta;
 }
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
index cc0a20bea33a..11e9c2622242 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
@@ -11,6 +11,25 @@
 
 #include "mfc_core_reg_api.h"
 
+static int __mfc_enc_check_adaptive_temporal_svc(int id,
+						 struct mfc_enc_params *p,
+						 struct temporal_layer_info
+						 *temporal_LC)
+{
+	unsigned int new_num_layer = temporal_LC->temporal_layer_count;
+	unsigned int old_num_layer, ref_type;
+
+	if (id == V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH) {
+		old_num_layer = p->codec.hevc.num_hier_layer;
+		ref_type = p->codec.hevc.hier_ref_type;
+		if (ref_type == 0 && old_num_layer != new_num_layer)
+			if (new_num_layer == 1 || old_num_layer == 1)
+				return 1;
+	}
+
+	return 0;
+}
+
 static void __mfc_enc_store_buf_ctrls_temporal_svc(int id,
 						   struct mfc_enc_params *p,
 						   struct temporal_layer_info
@@ -26,6 +45,24 @@ static void __mfc_enc_store_buf_ctrls_temporal_svc(int id,
 			p->codec.h264.hier_bit_layer[i] =
 			    temporal_LC->temporal_layer_bitrate[i];
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH:
+		p->codec.hevc.num_hier_layer = num_layer & 0x7;
+		for (i = 0; i < (num_layer & 0x7); i++)
+			p->codec.hevc.hier_bit_layer[i] =
+			    temporal_LC->temporal_layer_bitrate[i];
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH:
+		p->codec.vp8.num_hier_layer = num_layer & 0x7;
+		for (i = 0; i < (num_layer & 0x7); i++)
+			p->codec.vp8.hier_bit_layer[i] =
+			    temporal_LC->temporal_layer_bitrate[i];
+		break;
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH:
+		p->codec.vp9.num_hier_layer = num_layer & 0x7;
+		for (i = 0; i < (num_layer & 0x7); i++)
+			p->codec.vp9.hier_bit_layer[i] =
+			    temporal_LC->temporal_layer_bitrate[i];
+		break;
 	default:
 		break;
 	}
@@ -43,12 +80,21 @@ static void __mfc_core_enc_set_buf_ctrls_temporal_svc(struct mfc_core *core,
 	struct mfc_enc_params *p = &enc->params;
 
 	if (buf_ctrl->id
-	    == V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH) {
+	    == V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH ||
+	    buf_ctrl->id
+	    == V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH ||
+	    buf_ctrl->id
+	    == V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH ||
+	    buf_ctrl->id
+	    == V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH) {
 		memcpy(&temporal_LC,
 		       enc->sh_handle_svc.vaddr,
 		       sizeof(struct temporal_layer_info));
 
-		if ((temporal_LC.temporal_layer_count & 0x7) < 1) {
+		if (((temporal_LC.temporal_layer_count & 0x7) < 1) ||
+		    (temporal_LC.temporal_layer_count > 3 && IS_VP8_ENC(ctx)) ||
+		    (temporal_LC.temporal_layer_count > 3 &&
+			IS_VP9_ENC(ctx))) {
 			/* clear NUM_T_LAYER_CHANGE */
 			value = MFC_CORE_READL(buf_ctrl->flag_addr);
 			value &= ~BIT(10);
@@ -61,7 +107,14 @@ static void __mfc_core_enc_set_buf_ctrls_temporal_svc(struct mfc_core *core,
 
 		value = MFC_CORE_READL(buf_ctrl->flag_addr);
 		value &= ~(0x3 << 21);
-
+		/* Adaptive temporal SVC(layer count 1: IPPP, others: H-B) */
+		if (__mfc_enc_check_adaptive_temporal_svc
+		    (buf_ctrl->id, p, &temporal_LC)) {
+			if (temporal_LC.temporal_layer_count > 1)
+				value |= BIT(21);
+			else
+				value |= (0x2 << 21);
+		}
 		MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
 
 		/* Store temporal layer information */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
index 1a3cf7e76e29..9c5be84fcbc6 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
@@ -1883,6 +1883,8 @@ static inline void __mfc_handle_nal_abort(struct mfc_core *core,
 	if (ctx->type == MFCINST_ENCODER) {
 		mfc_change_state(core_ctx, MFCINST_RUNNING_BUF_FULL);
 		enc->buf_full = 0;
+		if (IS_VP8_ENC(ctx))
+			mfc_err("stream buffer size isn't enough\n");
 		__mfc_handle_stream(core, ctx, reason);
 	} else {
 		mfc_change_state(core_ctx, MFCINST_ABORT);
-- 
2.34.1

