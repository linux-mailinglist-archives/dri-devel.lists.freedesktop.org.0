Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88A2A45F1C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584D310E2C0;
	Wed, 26 Feb 2025 12:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n38c4xRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F37510E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:32:23 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2fc1c80cdc8so10235561a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573143; x=1741177943; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=23d26b6/rNMhE2TK5FNAdZfYGc+bxo+2P+WD0NWcJF8=;
 b=n38c4xRizaT4hee3CZ0UUvU6KiwyfvaCMllZS16hPKmZZRSneyxnASbSQxsvZXXa7Y
 4Ynhtxv2uaN6YWR2DB3ZLs+Z8fvJxWQI2G4fO+kYkRbYKPSKXYtdaCH+kxzgAxItb/JV
 CwU1s8jcgt+F7+QM9bRFKPMNtSkYBHjtWwRbwZTcn274611qYajVLAA+iAl5emu598K/
 rcuC5RrGw/soREUdj/LK+Ih+a3pxUo1ziwrSGzn6cFd6Du21ceCgvaANrdh/FX8FbvE0
 /Up3gjmpZ50wplqhHsrBVs9BZ9/ERK6vnk/Qvz8jMVHBARkLT8/b8MRYjdBU8JgrB/tT
 lfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573143; x=1741177943;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23d26b6/rNMhE2TK5FNAdZfYGc+bxo+2P+WD0NWcJF8=;
 b=SPVoJ6kUPOL0ZfPKP+hVunoHo8S2kWqe7af3X7rS8sr7iHMlljQGmNt+w5bJUkPas/
 Cz+NZuAAfKLLPNNK3ElJbPrSR4ZUiSdEsDBeEDjT4sBMYN1HzrAAZtnEsVmos3gqXOnV
 acYKK4eUXe8K5glBv4DsYMNs802UUXKyA6zUZOQYhIKGZJQzb0riJJjekbm/tJoQKIoB
 ypOa6y+vItCXkaqjA3M6KdjZWSI5XXzHSQSRugvAKnx+zuLsmo5UQPAJgNhzVvXw5eLv
 HNib7GFdZtVMicaVA5d4ukaS1W1TMJqrzOE0+jJXi73nTren9NrmyoUFcB7Bma/qZiIU
 4U0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHQDibh/x/l5dDYJEO8oKyHdOyzp2vFICCXB26ZqShEtiYHTm2akNCVxg7JSB5cuMe74zJxHLcz7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxu3bQI8pBJniHxQVAHGnzaKKNZgxeshPCa4asWAPnN7lMGzPa
 8W6uaVxgljypeOqe+AOhvTSefXe7fqVAJ4nUb/IcAD/DYvlatO2TC2sVuiI4q2w=
X-Gm-Gg: ASbGncu+2kmQrV6m4hxP8jEqotX+VnrDNMq62C7MMceWUnaA7GL2RJ3IyQxjxlJm8l0
 hr/PonwNWPl913DOFMrWwRuqbq7BD91TPkGnSrQg46ZYgEibcTbfKAVqNV8NHsTzR3Bq0QtndtC
 YjbhKaxzCzEBplFT3jqA0IAfAwBepitH2zH7OUCz9MaKY9tCM3fC7pDxMAZmJPdy5CFe9ILGqJ4
 BrYPZOFL7QwYL9gw+5QWvSlaiZ9bJtRzo6oetfglv2/9Wz1JsivXkiQ8RMKr07hhwamMttJlEv2
 iAFMOmGeDfog3aWJxVJdrSI=
X-Google-Smtp-Source: AGHT+IHVVzFpsGmtsq4hAfdadtZ4ek/RNhHfQ2epqmHAApnWgocn4RuqZ/m42Ny0pXhmgs81z0+wAw==
X-Received: by 2002:a17:90a:cf8e:b0:2fe:7fea:ca34 with SMTP id
 98e67ed59e1d1-2fe7feaca86mr3927063a91.32.1740573142662; 
 Wed, 26 Feb 2025 04:32:22 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:32:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:50 +0800
Subject: [PATCH v7 01/15] drm/msm/dpu: check every pipe per capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-1-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=4444;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=f7vmxxj2aXQGnMGrEnTOGdqDh+9P0TeHrkYJRqajnDk=;
 b=X4cagGaZxaqU7Ia3nLsHe6h2uE2PcqvGMXzJ36oRUK9xMkHSLwHG9XOBJyo95a54hBxj7fnz3
 lxh7fMCVHPdDc9z1HHeinvb6lT0w53TFAGULMG1msVXb9y4p6Fa2Q71
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

