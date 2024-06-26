Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BCA9199F9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4604510E9D1;
	Wed, 26 Jun 2024 21:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D2J+T/V+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BB510E9CF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:14 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebe3fb5d4dso11045271fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438372; x=1720043172; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wCwITSOLHJdYGH/l/xlihLfKPyvCBWUXO5QlnX3YLVc=;
 b=D2J+T/V+NKVDzryQ8+AZsMbLTeGeXzeE/xrAMVuor8o/9WGqdgOx1j6rikvVaNy56O
 98yvyNz7st+l9aaf3n7GffpAO1hvB2xGgR15R7IT4c/TFVN7TGX15cbV9g6rU/9Opya4
 QS5VcpIkK08n20AG6TXo374/puBkEEZftU4hjhSQM1aMuf+PDkeu5BYhF3zUSG9XcciW
 u9eNeSlVUTb6aMYjD/K3OwzXpO+VYor399eWvXI9PcbYtfQkBWFcViKu+39XNphYUTsd
 j1XTxxAHHRYHNaLHkDUVdSK8f/OuOpmFbiBWBxTkxG8irILyrMRpEqzUjD8tRGCVBMCo
 OlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438372; x=1720043172;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCwITSOLHJdYGH/l/xlihLfKPyvCBWUXO5QlnX3YLVc=;
 b=shDK2KuOOq2KwSxWivof7L3Alt9uTTB80ZvFBNKlmbT9R3ddtQtNbjcMGuTWSk2wp/
 dmbmiEk/tA6qb/5A5NVekEwxSJl/uab//TFrLMqDvXiprk0LAZW7jTjZbpIAL8oPkcUC
 c275dVwYJONyIGmewpCTX00FQanvW1Y7bXO7lm3dB44JL9JrzdsE+9lJjNH+ASNcImqM
 sVPy6JsC8d+uLgybd6u8HFu6QsyJtoc+wKGKEDywKOPCpwNaVrnNqG8WKJY6z0acrUVu
 JtETsdLyB5iKlxgX3URh2QhT3VGvgMYREZ8D5fxSLE5GnrCn0iRiz6QmVbIsQ5UaXBHj
 yXBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEp4+CCvXLYMDg9uP/g1b4y2/aGax2Ptl+n8ek2+WtgV75LCjmSIAr7QvMZGyNYFjBe8mdGL3s7tGc2NvTBuE+MlTdGCdHcridsndoIO+Y
X-Gm-Message-State: AOJu0YzX7ru3lwKikEGD6z9ah5/JHlOjTnOFFdkVCN0ov0Qi8ymzfxeH
 aHto/GtIOqk5RWnPT9WC5xvBBDe6OrHG48S3KKxufa9EkTY9zJ2AB3KS1JU/xtM=
X-Google-Smtp-Source: AGHT+IE8DpnOqJ/ChQfneZQxrWT9jg6t17SqP8ttL+UMM4dOVHNIK9InexUr0+5v8qlzHXG1XyQpSg==
X-Received: by 2002:a2e:c52:0:b0:2ec:5172:f7b2 with SMTP id
 38308e7fff4ca-2ee496192f1mr554021fa.2.1719438372450; 
 Wed, 26 Jun 2024 14:46:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:03 +0300
Subject: [PATCH v5 09/12] drm/msm/dpu: move rot90 checking to
 dpu_plane_atomic_check_pipe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-9-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lFD7iY25uduQrISmYezTWzbetq+0s7Q3DnmHq0jujlQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwZKSlx7Y6RwCb75cVHPq3GyTdOv/Lb9GU5/
 Xl2cLg8j+2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGQAKCRCLPIo+Aiko
 1QmTB/49+NwiwfAQBT4PPq4jOBJolFhZQZv84R6Shel9QeKkmR/GwBYkb9dTyP4SKn/pGBvSsbA
 cOXx/GWcXrmtcephuEBrg/0T0ViWXE7o0QPB25r1Yt9+bvRIWF+y9Thm0HqXf/TFIsSofqSblme
 9lJqpXC/SFbpBrCz8Nv6yHnpAPDaElFLeriDnv8e4Ey2l9kBJhmjyz7biSFGJN3WjROC1te3kEA
 nL+tpcQsYva7Y6Zvg4C7tFU6EQlp4xVRjWHF+bOP6S7+ClrWgNVmLpnf97xmW4q33rz9BMEkV/f
 08yKG7gr03FB6DEACw8eeG850CL9n8nHF0FhZ4SE7T26Qf+W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Move a call to dpu_plane_check_inline_rotation() to the
dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
are checked for both pipes. Also move rotation field from struct
dpu_plane_state to struct dpu_sw_pipe_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 --
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..fc54625ae5d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -142,10 +142,12 @@ struct dpu_hw_pixel_ext {
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
+ * @rotation: simplified drm rotation hint
  */
 struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
+	unsigned int rotation;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9b9fe28052ad..6ad160295341 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -527,8 +527,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
 
 static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 		const struct msm_format *fmt, bool color_fill,
-		struct dpu_sw_pipe_cfg *pipe_cfg,
-		unsigned int rotation)
+		struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
 	const struct drm_format_info *info = drm_format_info(fmt->pixel_format);
@@ -551,7 +550,7 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 			dst_height,
 			&scaler3_cfg, fmt,
 			info->hsub, info->vsub,
-			rotation);
+			pipe_cfg->rotation);
 
 	/* configure pixel extension based on scalar config */
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
@@ -603,7 +602,7 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 	if (pipe->sspp->ops.setup_rects)
 		pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
 
-	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg);
 }
 
 /**
@@ -704,12 +703,17 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
-						const struct dpu_sspp_sub_blks *sblk,
-						struct drm_rect src, const struct msm_format *fmt)
+					   struct dpu_sw_pipe *pipe,
+					   struct drm_rect src,
+					   const struct msm_format *fmt)
 {
+	const struct dpu_sspp_sub_blks *sblk = pipe->sspp->cap->sblk;
 	size_t num_formats;
 	const u32 *supported_formats;
 
+	if (!test_bit(DPU_SSPP_INLINE_ROTATION, &pipe->sspp->cap->features))
+		return -EINVAL;
+
 	if (!sblk->rotation_cfg) {
 		DPU_ERROR("invalid rotation cfg\n");
 		return -EINVAL;
@@ -739,6 +743,7 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	int ret;
 
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -776,6 +781,12 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		return -EINVAL;
 	}
 
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90) {
+		ret = dpu_plane_check_inline_rotation(pdpu, pipe, pipe_cfg->src_rect, fmt);
+		if (ret)
+			return ret;
+	}
+
 	/* max clk check */
 	if (_dpu_plane_calc_clk(mode, pipe_cfg) > kms->perf.max_core_clk_rate) {
 		DPU_DEBUG_PLANE(pdpu, "plane exceeds max mdp core clk limits\n");
@@ -889,7 +900,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	uint32_t max_linewidth;
-	unsigned int rotation;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -913,6 +923,15 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
+	r_pipe_cfg->rotation = pipe_cfg->rotation;
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
 					  &crtc_state->adjusted_mode);
 	if (ret)
@@ -936,6 +955,7 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
 		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
 		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
 		    MSM_FORMAT_IS_YUV(fmt)) {
 			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
 					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
@@ -959,23 +979,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 			return ret;
 	}
 
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	rotation = drm_rotation_simplify(new_plane_state->rotation,
-					supported_rotations);
-
-	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
-		(rotation & DRM_MODE_ROTATE_90)) {
-		ret = dpu_plane_check_inline_rotation(pdpu, sblk, pipe_cfg->src_rect, fmt);
-		if (ret)
-			return ret;
-	}
-
-	pstate->rotation = rotation;
-
 	return 0;
 }
 
@@ -1115,14 +1118,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 				pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
 				pipe);
 
 	if (pipe->sspp->ops.setup_format) {
-		unsigned int rotation = pstate->rotation;
+		unsigned int rotation = pipe_cfg->rotation;
 
 		src_flags = 0x0;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..a3ae45dc95d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -30,7 +30,6 @@
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
- * @rotation: simplified drm rotation hint
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -47,7 +46,6 @@ struct dpu_plane_state {
 	u64 plane_clk;
 
 	bool needs_dirtyfb;
-	unsigned int rotation;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2

