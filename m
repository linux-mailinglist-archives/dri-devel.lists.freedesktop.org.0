Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491D69963D5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2E310E6A7;
	Wed,  9 Oct 2024 08:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zXV0S3P5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F72710E6A7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:51:19 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2e0946f9a8eso4536971a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463879; x=1729068679; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vpK0k4xFfIit4zaSmhmserorxSb9ry7uxeuhNDC7oJA=;
 b=zXV0S3P5rJvbZZk5RkMuC6MUS8hb3uNFRwHqSh/OlEY+piycAASRJfBxhU26it2Ly4
 9oIA8UVJKKoNkCAWm7c4pHenAAK8KGuWS1Ur1wKkmdWLNo54NWF2ZcTgtGSogyDwKjlb
 CX+/IVAs1ygFY63Urn8VBhC/m7iUuUFUmWa+s0PSUkjFoX3zlgQEHnpKjsSjVDdlPVc4
 mvZsX5m70nc3y+CyhsGBEtbTPKuxXeCpi2rs3Mo9QTshK3qLdH4lx5fWBEp5Bpx6+SKY
 /ICoA62Da5GuYtZPXoQkZazQ+DAq7GPm/48qbW7v9A9Rg9CsKuGDlVq0q1Cd1k2Ut+sn
 YRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463879; x=1729068679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpK0k4xFfIit4zaSmhmserorxSb9ry7uxeuhNDC7oJA=;
 b=NjEqPNXXnANdnKxLFXPdREI4xwK+kwxr51g+V9b5AM4Fsh9Lq/VMck9E3YY46iBJa9
 FJgC6V47GzDtSugARnL673ajhR+U4FqrReEvs/GM5nnVqFvPLINZbFmmVP93YNxBx3Wu
 GF7riyiYvwOR5x7KVP9E1wy69TEisi17wQ4WMClzCs8sB6rJSxeGutYevONjWt85wX+v
 T2p5CAVLr5enRqtZdkKIH43dBF8+0BOJgXANwDb7tHlVsmLTuP7tuhm4ZNBdJNT8+Wz9
 6BwSZX51ozRt9gnh9offXjDZBV2ODVH8oTPR2DKp2E0IHE5CSAiPKGyon50Ykz95aAqY
 HwcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+oDWqnn2ZwZbqi3+xqRUlDYylCTGFStAnNRw/D02S68QthyH5Yd3GQyynWvJY88Kwxv4wkQwO8mU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcSnFhWt4eAGv/yI17xdx9S67PrUfbGM6CR43JQWvvBFS5L/w6
 04Dn5YMDw/RD52qT+HYhS2p+6uuCckuMPqCzKgSFKrdvYHWCyX5/b6HsWQpKR1g=
X-Google-Smtp-Source: AGHT+IHe9FbYiCWGUad9G8MFOgochWsO+40bvV7MWi4goN1+2gyN6VXnBwTao4ak546a2TWM8Yprwg==
X-Received: by 2002:a17:90b:f8d:b0:2e2:af88:2b9f with SMTP id
 98e67ed59e1d1-2e2af8834fdmr967039a91.16.1728463878553; 
 Wed, 09 Oct 2024 01:51:18 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:51:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:23 +0800
Subject: [PATCH v2 10/14] drm/msm/dpu: Support quad-pipe in SSPP checking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-10-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=5070;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=d6FA+M/FjBX/3MEHc7VsbcrNZioGkbL6iFmPiKpmDOA=;
 b=GNVGnJbpfVw6aGjlDgu20HadTv0FDiH386iH87aVQ269ay9VWGIcPUPm7SHKJB4uiQ11KNiLF
 T7UOMZoHl8eAHZEJA4fx/XjzPS7+1GXtF2sHMd/brCB8LNDdM/tLjds
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Move requreiment check to routine of every pipe check. Because there is
multiple SSPPs for quad-pipe case in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 86 ++++++++++++++---------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index fc54625ae5d4f..05b92ff7eb529 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -143,11 +143,13 @@ struct dpu_hw_pixel_ext {
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  * @rotation: simplified drm rotation hint
+ * @valid: notify that this pipe and config is in use
  */
 struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 	unsigned int rotation;
+	bool valid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9a8fbeec2e1e8..904ebec1c8a18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -739,12 +739,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
-		const struct msm_format *fmt,
-		const struct drm_display_mode *mode)
+		const struct drm_display_mode *mode,
+		struct drm_plane_state *new_plane_state)
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
+	const struct msm_format *fmt;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	/*
+	 * We already have verified scaling against platform limitations.
+	 * Now check if the SSPP supports scaling at all.
+	 */
+	if (!sblk->scaler_blk.len &&
+	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
+	      drm_rect_width(&new_plane_state->dst)) ||
+	     (drm_rect_height(&new_plane_state->src) >> 16 !=
+	      drm_rect_height(&new_plane_state->dst))))
+		return -ERANGE;
+
+	fmt = msm_framebuffer_format(new_plane_state->fb);
+
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
 
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -920,49 +948,19 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		drm_atomic_get_new_plane_state(state, plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	const struct msm_format *fmt;
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
-	int ret = 0;
-
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	/*
-	 * We already have verified scaling against platform limitations.
-	 * Now check if the SSPP supports scaling at all.
-	 */
-	if (!sblk->scaler_blk.len &&
-	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
-	      drm_rect_width(&new_plane_state->dst)) ||
-	     (drm_rect_height(&new_plane_state->src) >> 16 !=
-	      drm_rect_height(&new_plane_state->dst))))
-		return -ERANGE;
-
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
-						   supported_rotations);
-	r_pipe_cfg->rotation = pipe_cfg->rotation;
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
-					  &crtc_state->adjusted_mode);
-	if (ret)
-		return ret;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	int ret = 0, i;
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
+		pipe = &pstate->pipe[i];
+		pipe_cfg = &pstate->pipe_cfg[i];
+		if (!pipe_cfg->valid || !pipe->sspp)
+			break;
+		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
+		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1

