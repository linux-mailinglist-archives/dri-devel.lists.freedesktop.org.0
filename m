Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D94A15379
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2596E10EB2A;
	Fri, 17 Jan 2025 16:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fbGGw1k7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A648110EB2E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:02:12 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2161eb95317so45734425ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129672; x=1737734472; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zxsGH6YBic0xISYCDS0Q6XFgy6JfbBJkHL966lXOAxw=;
 b=fbGGw1k7yLiDzxUK3ix/SyD43HkCgaIkElcj/VGSN6pV8NJrSi86J1jlkhA+ki3aZV
 0Ij3PJSfu0nelubSHBoR+ewbH2z7zpuqVpSj4y3SGmIGI96Y/tnyVHogQutp1rLDaZQN
 rB/zzdj7O2U8dI10DOva8XP90YBDj/2wyL4ODYHhv5BLmcgeFCTfWoz8JkXa+181Qft8
 hio6v9x1t5C8GcgCJweVYvXSLwAfq+EmN7SOIqiDTnPS/1HDWKG6hjfveHSOv9WYpK4u
 FrYiDinO/MbMPcmxyiKUieFNXcsa71o7lSI3SxVC8POpCthniSSq9OwoDPU7/mkj0ygb
 BN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129672; x=1737734472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxsGH6YBic0xISYCDS0Q6XFgy6JfbBJkHL966lXOAxw=;
 b=lRBZiA/3v+acqNiSuvZT5qaabebGuLzouqlnSHnoSczVz/ZclpMIMc2ypiffIe9V+L
 XphJbWv5WWmQhd43yZrJfUExCqWwC3A8o4szrAm7MbEij4ViavE3aVnGy8B1+ePDSEjQ
 nmlB3H2VeR+SFRZesqmLbBW6UWbZQK8QuL61vhjUFgZ+NZwX0LgwKD434nxw6WMqznJf
 pb35dSzObJXlwYOcKIIo6+ELCo6o8Uz2+t3Q6yob934hGLKfkiH+QdSLeiOaCElDQqGf
 t+m+pKKzAjjFHdBQD0FR/JQfaBKbnT3sFI9fkQKDnY7/eaikNJzAOR27cLgoidOpwGQ0
 9Hyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiVXOVtlSdzPQ9qWNNpr0gUSmFunP59qJHxQUUTqGUJe1UpcudxYgxXE071lOuXUfEGYLC2qQaAwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzljzuMvlrPstBZexy8xYYjBTgX1VacT3xzPUdbv/+2F5EXAMO+
 QS3fHGDlzJEycWtwefPU7xchaJm25OUlUqvqmTizxvMj+Gm9hhloaIStdHRBovc=
X-Gm-Gg: ASbGncuaA3Glu1eiroDruoI1ZNYBW4YMxtiFgRquTA8U7821BnErS7qBlPiZmjUtCeR
 YSZv+NZ6vF1wp70n54aXbwyuZIUwLl/ctek3uXS3n1d1Fg0ft5dtr7LW01fYg/4TCB0TyXelV5u
 HH5obOelGK28ARVieIdqt3BI2gL2hCWIioe3MuA+9CbJ9DfWqnd97qTiyPNbKVOjgcJ2kIY4hou
 /MUkxJt1njKTAyMZ0Sw1OLx9cZUDW0TS5c3dluVxoXgK1VqLKFrcw==
X-Google-Smtp-Source: AGHT+IGhASsyC9M2LOGT6wIJ0qAtrO/FZWME0ogfQShaBxMiwEcuZvPaUvw8zKmrTzgCt5RQnbCmcQ==
X-Received: by 2002:a17:902:d48f:b0:216:282d:c697 with SMTP id
 d9443c01a7336-21c35544097mr38427545ad.27.1737129672232; 
 Fri, 17 Jan 2025 08:01:12 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:11 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:44 +0800
Subject: [PATCH v5 01/15] drm/msm/dpu: check every pipe per capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-1-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4329;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KJWkBO8bCpinIjxlYmabI6MQIeEdpcEIU+bj264onvo=;
 b=2kQbmo66Q+PrCi4xemcVUeA5NlX04rf+NJa7LTE/tVeBbCXRoXMDVi0RrMYHc7EkDNYZO1wcK
 MalEPVIJFGEARoc/PWe6pTYgeODG5YHDAEDYY43t3XejnM5LQgkrNb3
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

