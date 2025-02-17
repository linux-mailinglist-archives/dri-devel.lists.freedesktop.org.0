Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC8A385B3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C03A10E345;
	Mon, 17 Feb 2025 14:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CD4sxl1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EF810E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:16:43 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-220c4159f87so57709875ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801803; x=1740406603; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=69vNi3OZA4rlkkM15gA1GocQBCacDIa/QmSzA91F8v0=;
 b=CD4sxl1NkaP9wYdz8tt6Bo0hbb3A7En25MigCWF36jabwV0aTttHSiWeNPciexlO/n
 Gy+bKYDkflvWniiCRe45d6uPuGPP8Fk3D+yQTkC980qPqFC23wXvkZWvPgjfb67x4ps/
 Xo+qdXvEHYLnsao0Jz4vUlFThktWGd/+ZFd0s6dQWoMHx6CWAZ6fEJslr3BQyMtuwVVt
 HVJbBrgLN8a0jL6rf0IWvBRqrNUwTHI2Kix9M6CCKMz8mLaDleUq+ggqQSoDTP6MLDdm
 9W2mnvovsMcuV0D+lpP8Sb8gbYKCrzBugGoq910TcTp16TqVnmvGXlL0kP5mfpEsvPvr
 e50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801803; x=1740406603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69vNi3OZA4rlkkM15gA1GocQBCacDIa/QmSzA91F8v0=;
 b=G86xLiBM0F8yU11MCk8Dq0U0WBdMA4zNhUNcWJqahE7BM1g9GZNcyDnfzsI7Zp4dR/
 Z+kRA1XcQQDGGJa43kLJ4tTH/YpGAKaOyeDEYjCNt8aKYLbE9WoDJZPzlclhV29+2hRQ
 NgMZFO2BDAM+Zxqi46DN2By3phNUVH+fRclngBDBewk8CsRXRA+vosiL2BU0UPKv4s97
 MPlupw+vYBnAFqiYUSy+Qdwk6tvFf3KxPCGkSKBXPFbwwKsJVujpo9grX2fjV09WAXun
 t0V5wRgpy7WVNy/E1vHJqhmj9tefvY3xiclQgriI6D5aZtvbAiePo4X9k6BePEJhnpGl
 OQng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc5sENoQWBTxfLBJQOc8FY7ADh0BofsDOhMuz0dU/2tApfUAKVWPW4d9lZc5HFeGuNnCqaa6KuAU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTM4wUOtBA4u5P/xRYcTGu1HtTicQLGdC4e4aykbffIJLSb1Sr
 0M4o4OWMXQpVxqibXIDu92zQR4pzeAaLFIzc1IFAwIwARv6FzsultvCZm8f2tK8=
X-Gm-Gg: ASbGncsTqOwftedonLHCaamquZ+vNGtpBq9rWPeWN9kYVS5e6VYwAo1ezOGphB2Pjkb
 14UMiGNYd+7wF7P5dbXxZq7mjfaNo+Pfjo9eKigDLLucrak+Y6mStdeu2eI5IASZEmvAUW7GWpD
 yqYBpHKe6qVHvsxVKK53imm67EAJUsx27RPhVQbvXnvMvKw8+hskgfXxj863C2dhEK8LRpmiyWE
 hFsy5QhPl0IMsg8JppMxCTVtJwyZNcVVzunaSmga/PthUf1KEI1i7JAWWg9k/jFqlztmFlERkWt
 h8v9rId5nbbC
X-Google-Smtp-Source: AGHT+IHW+t1AByBvZfuKljqfaxNCxT/6ZGDzP+lPvsrisD+l8/bqLv/XLHwaFORKcAyayNhHDuPrZQ==
X-Received: by 2002:a17:903:2f8f:b0:21f:515:d61 with SMTP id
 d9443c01a7336-22104028a15mr167933135ad.21.1739801803051; 
 Mon, 17 Feb 2025 06:16:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:16:42 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:50 +0800
Subject: [PATCH v6 01/15] drm/msm/dpu: check every pipe per capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-1-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=4383;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KapOubmHrnJ45Q6eHl5TCN92cp2NDgoLCMZwQ/tSSxY=;
 b=Z/jcy7aDeNebmhku/f2ueRJ6iMchZ5gXAUP/St9wMgr5Bfi/LjEPAq4gVpOJ09R2eCum4Fz66
 5IzsXBs82M7BJfAIYuUURWURLp8NAMzGrIfczPMt2dTa5lfaWqY/Iwm
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

The capability stored in sblk and pipe_hw_caps is checked only for
SSPP of the first pipe in the pair with current implementation. That
of the 2nd pipe, r_pipe, is not checked and may violate hardware
capability. Move requirement check to dpu_plane_atomic_check_pipe()
for the check of every pipe.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003cde90ce6219c97ee18fa055a92a5..feb90c42fef58f3385625f6d8165bfcdabf46d2d 100644
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

