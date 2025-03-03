Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F98CA4C479
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98B210E44D;
	Mon,  3 Mar 2025 15:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z+HsXaGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA7010E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:14:55 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so86336585ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014895; x=1741619695; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=23d26b6/rNMhE2TK5FNAdZfYGc+bxo+2P+WD0NWcJF8=;
 b=Z+HsXaGqUtqgxwuBDHxnrSfq6F2SeJdPtdwKMF2UEcFlwUA+f+qtTs8Uo0Vs9JnSfu
 BVTCCMuejcpOzNutqjdlOUrev0+pK7B2gNfxyZUwDFwd+r5PebHnLUL42s/a/Fa7iKiG
 n8U9lmlZO3/6V8fP54DJAYZoEAk/Ox97iFGE+x4cmGv5BNFfCt7F2/KwaW9RAGgLnrrq
 wj9HpyZa8eAy3HxvY+rgmQocJtv7qyrOzE6W4LNkhqyZhjrAsBgGuvJUy6bWkMy78zoz
 bRJ22+bXyM22TLiVsngiyyebHy2xAwGd0Dco3OcspibHzbWQaHn4YmstIItB9fNwC/DJ
 QxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014895; x=1741619695;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23d26b6/rNMhE2TK5FNAdZfYGc+bxo+2P+WD0NWcJF8=;
 b=KvgvQNbhcEhdcnNYJ/9vePgRZXkmtc8Hf5vimjxG9NXjZWazAwPatPIlM1Wi2TcP1p
 FVTqJYOfWs1X1P2OFZr4bchwukWOt8ETWh92RzUBHOIWq4A2hRMt0nowRqb9k6GvsUQk
 xVU1bbN4RKf2Ru0glvNJ6uHEWfhPVNLXntgGhOpl8Pz3cn5ALAdbOpkVcQw9gl3erq22
 Frpd1HdGzN+WmLazlQY6ft5FAY7iexkzbsYl7UWMMThBy1h6+1ng/4sTLp32LW5i2n9e
 1S/PS1hYk8ecMkar4gY6vbd4Y0qscMNzzOptFYmSD0AbiYWBx5767yKeL+aGResEbXbQ
 3Oow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvTROqepCMUYgzrSs7PGjPlO6OgZraP+4mBTfyH4Z2HZ0mQz7el1sqBM54I5hQ8Y1/RSOkVtMp3f8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1mWwB/OIDBPgD3unMUZf2ADYvIHCtE9CcHp/8LoLp0n3xo+LB
 POn8QkXZ1cdWo/I1tpYKviC7Fu+TIf6hp1E98aHHCElWElm/x/B/OTkingowPRI=
X-Gm-Gg: ASbGncvtJ9VCJDDcUgI4QZgXhOf83NGhRU4DmEyqk8a5pBPc+h3raSr8QFoRG1Hctp+
 xxp9zco5MiKtOcz4oRUx+BhiPQd6bQB492Of66ZPx6dVVI0d+8BtDLDKEi90SVKHRoL9kE/ey00
 zYLBh2bDA4c8slQfRav4x31OZ9JNuKnUVZ5bWBXHBLisr60SAUMKd+YuAZzPiU0bQoCAPmaq2hF
 UD3Nd3GO9rTyWPPEECuu18b/e284E6SLIX6c2kVZCHiZ+T/u2bwVIMr0b21CCv4SJH0wdl/02k7
 Aeh48lGnHTDYfnnUO+YYTzdPFZ3YXhVVzdJhjSmeZQ==
X-Google-Smtp-Source: AGHT+IEZXOVfk9vvs9ueKjdtqfIHne0Pi+FC3U3JHpeDAvVS+sDngfbGOm6cZOFiQeTD6fyidSq0Ig==
X-Received: by 2002:a05:6a00:1805:b0:736:53ce:a32c with SMTP id
 d2e1a72fcca58-73653cea459mr5730851b3a.17.1741014894939; 
 Mon, 03 Mar 2025 07:14:54 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:14:54 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:30 +0800
Subject: [PATCH v8 01/15] drm/msm/dpu: check every pipe per capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-1-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=4444;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=f7vmxxj2aXQGnMGrEnTOGdqDh+9P0TeHrkYJRqajnDk=;
 b=fDRF2/MiyODTU8Shp8yUwEv89OJ+oBNUEwpo9nXt5OzwqN3ekY205895pFmkZWEonFNGHm2Hj
 Lqws3+XVAlcBBJLFb7btswep0HbOCIrLp9avhWCkS3xLdINzRUYD8we
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

