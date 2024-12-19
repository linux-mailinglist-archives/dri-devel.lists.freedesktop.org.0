Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E59F7633
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B115910ECB4;
	Thu, 19 Dec 2024 07:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R7s9Mmf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FBB10ECB2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:50:57 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21675fd60feso5623095ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594656; x=1735199456; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GJmsZZpuwbe+vGhIhYkh/sA+lzfRDGmnljR17dLmKnE=;
 b=R7s9Mmf+KKWAGaJuFwIYjvwbnUfxPuJS8z5oi8z1vXHY0qX+U7YK60Fjn85utKMo1t
 pY2VXtUXTowBhB32foOjquXuVCN9OYcBS5krZG8145JsKpfJKnS7+aGXZ0p0pc8tQUnP
 7HWQbLZqZAaZT9iK//roK/I1RNwUcUm5A0PP6k4cLV3LZ7XwT9m1HlTI5EA3ubQsaTt3
 Y2l8fy3+pVNnRzk327Iv6hwVJCHDv2BJhbDUeJ8nPrg6QfX+48wLexC828aSB0ttKXk1
 btM4aaKXx0KkXFyp0zUZa4ZY7+iW5sMS+ZmeXCOpTkVx5D7VLtToUe8swmJlvivuyoHs
 kvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594656; x=1735199456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJmsZZpuwbe+vGhIhYkh/sA+lzfRDGmnljR17dLmKnE=;
 b=CoYp6fWSjhWQIjBB8hhRn06/llGk7oF/DGNnQ1TTLFs28vnGhIh/BwOQo5PGA9OD8L
 YzUAcpaoXkRtVbw0hw4lcIt6bx6WlGqEIqxIghb7+Ebv++LBHcznBAmYhyo2W0fd8MMp
 eeNWHzsZK483uay6JBtfM18ojGFQ77mTny8Ef2W8muYbVBCAn72JJmaGrDIXbxDYkZZg
 dwaDcuj6UGuOH1qWxYLh+jziMVGUR8P6t3tdTUIDmdH5F5RzDMNyFlIG/1g57YmkfYzm
 GrIsYONYa2g/iMXdZrRwweA35p/Wqi1WVjmEQExE6PgZhTA2H5KPswXxm3jBc89JUR0X
 qJEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBgdwmHXG54XW1wuFh8D7EFqhcK+FHj5aHiDOnKm68lhRQRXFwCdBtD+o8zOuVXHiZLd3biiXc6hI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0AqgbUhG0nYDzTxF/pE/Q0dL32TZjV3SLwoSysVWTENgpavkh
 +4Q0V9o6qP/pEE4h6SLYIfgWRITKPBYO0TiSsW8/39NvdwVKUMLj+I1xzT5XtrQ=
X-Gm-Gg: ASbGncsXNuLVeBv24WiwmsJxE4/zecv+Fh6RIuYeB6CQ9SL0Ox0jsbbSVWy44JDg+zK
 SMxSBPPvVjz1HNi7wHkD2ne469yT2CsP4UKuCY6h40pHPiecwzAwCHUIjMsFp6evUK4JF91c/Vk
 vKdR196FET7zDRaycT4kIWdpDjrmAzRVScxnlhHvUFBGOP708QtjyjFhYvijudlKGMkg8z2CoO1
 lhTRBqplTzAfHDM/ltcPQYd9cFiQT+R6m86RjEPWK++UkQaKRRj5g==
X-Google-Smtp-Source: AGHT+IEOqA1vJf2uFvBqIESm9Tov34I/A0aYwu0QNTS1g6acpaxijvfrMk0duLvIL4x6NLUt1a8Z1g==
X-Received: by 2002:a17:902:d510:b0:216:59ed:1a9c with SMTP id
 d9443c01a7336-218d726d7f9mr74054205ad.55.1734594656721; 
 Wed, 18 Dec 2024 23:50:56 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:50:56 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:31 +0800
Subject: [PATCH v3 13/15] drm/msm/dpu: Support quad-pipe in SSPP checking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-13-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=4472;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=F5vdJwFxIcC21jVkfwNGwrZjNxJ2H5r+EMS30BWgqAo=;
 b=lePD4rWXUf7a8kUW35TLtTYSAqcnRIc9x4Bkc604Bb7xiZ+vYvR8cP6h183sxiT1ncmdFxY/t
 fFjQ27KJyaPDj1t+3m1gCliw0IrjT/HtGtorJSxK5JVCfiSmRv2JhZM
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

Move requreiment check to routine of every pipe check. There will be
multiple SSPPs for quad-pipe case in future. Only check valid pipe
as some pipes are for multi-rect or right half of screen that may
not be used.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 86 +++++++++++++++----------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index fca6e609898a6..1cd98892898a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -730,12 +730,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
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
 
@@ -981,49 +1009,19 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
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
+			continue;
+		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
+		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1

