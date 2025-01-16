Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B27A133B2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2081810E8BD;
	Thu, 16 Jan 2025 07:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eg+96t8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C72C10E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:26:10 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so33809495ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012370; x=1737617170; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1BXi7N+vMIkonc71U358hLDD7SFRaPRCclNtpuXJuSM=;
 b=eg+96t8bnd+pYYOEcG1RlLYg3GQ0POszHo3dNeUu81i/hEvzktZ3mJRmrMguXUquIm
 mJmo/7Vqv5441cyKAj5ebej+QeV2/4ASesHtkpBPve9B1fXLIBNs4kh2vMSbaq6v4ARR
 m/rSeoc456uYJWGpisfjgVA3M2fEaM0ZVg9+oQApgzsypDFj1Q4aNkAxMro9vHjZiJbu
 P8DTreV9NO9r83rBb8UWKd5FFHBO0yDXBiNAwIekl+ZJeSTZUUmcHjM4YJhH0rPBI/PW
 wpAdi4RC81XozD4QLAtdRYL15gS/3FjdKafwCQvPPSj1iu5hCin5G0WBo9ZeMDpAMbMp
 B3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012370; x=1737617170;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BXi7N+vMIkonc71U358hLDD7SFRaPRCclNtpuXJuSM=;
 b=c1Q+ZSoN/zsd3/iKGnk0BO/oAgysH5OGJL3ur9Z0RT+MpuJbenCMDA0ibk75yFJoI7
 qs5UYezOa1/M5rFwMXHTh+9ycvNlYqF6OpdtwGNoaR6iLHfPr9SeATgChY7RgeGdQAlM
 hzbkih61YRB7w3+wEqIRR8pcYJMTYI2EvSvdIubUnvTp/55hIpcgB4AyTAE5nMshTaBY
 XeCKnFWlqkrDbrz7+7hOaWvrKZURkpwW+iBpII54F78tZZlZVuAisuw1k2gvxZFkwMts
 UTMmxYyxMMn/YwkOgyBMmC4zqT/g2rTli8ZTcbB+a+33eBVCEZ2iYxuiL/Duk0drU6hg
 N2gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUysAJYO/Dw6StLY671P2lYXRX7Sir7PQ/OloLYdFVtZJUAipn5LWzc/r+2y/0PH1RJGvzdqhPB+so=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvDGzLcOxsODeuQMIRY2jyvpWxyeurG11UR1bPAG1j5wgFC8kT
 LxMWm9MXr0h9hbV4XSwxiGUZmxpwCosGIcCCHyhLv9/Up0k/nwvAkp51PcooDkc=
X-Gm-Gg: ASbGncv4V89pJW1bETBz4UsqCnDQLaJ7FwRlIyf8AEGx0Er/XwJgpOEmLiuRaFZnSTE
 fGJisoOW68et4jovQlD/KRCEy9t+BhiSrK1R5vCR9ro9d2hG/20OFfMlTQO9m+F274eWB9LlOou
 q7vVuO2EmtRIjhUgGQFb2eo+wd0GsrWQetUQwouv1VMPltP6k2a11367cGwRiBHTJx4MToO+6zt
 55natpXiuabCdLpsihO2dL1+udLaWcWt4pmTS0LnRCdVkPWOom/SA==
X-Google-Smtp-Source: AGHT+IF3GXPDE0ThDrRX628rZOppw6yvpE9Mk74Kz3O+pptthcpM7h+xn71VrIrZ8qqws/76aQC2XA==
X-Received: by 2002:a05:6a00:6ca5:b0:729:1c0f:b94e with SMTP id
 d2e1a72fcca58-72d8c6a31abmr8853578b3a.6.1737012368255; 
 Wed, 15 Jan 2025 23:26:08 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:07 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:50 +0800
Subject: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=4161;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=18JYtAh4XZQo9zQ93uGi+iBL3/LQO++N155uICtQ/e0=;
 b=Kyhq3uRgt+rR0Lo4QrmmptcAJqLk7J0hWrGDDhyt54H1GdYK9f9MOFhi86u5J1lRJOkAEsDTy
 ewEJJ+YkCTRDkzjzoQF5waZEKnrqvdRZS1QEb4MnjBlETP/zZX7c1dE
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

Move requreiment check to routine of every pipe check. As sblk
and pipe_hw_caps of r_pipe are not checked in current implementation.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index cf923287dcd05..2b75a6cf4e670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
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
 
@@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
 	int ret = 0;
 
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
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+					  &crtc_state->adjusted_mode,
+					  new_plane_state);
 	if (ret)
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1

