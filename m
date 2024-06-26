Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1DD919A04
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460EB10E9CF;
	Wed, 26 Jun 2024 21:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DUBMahz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E907310E9CF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:15 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so64348391fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438374; x=1720043174; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6j1Oqrf688nsM2s31tFHNJb5eIHTmizO9USvB+zJtCc=;
 b=DUBMahz9i15eS8f9CW9PdQ8tNXBVFy6pmy07ZAJgehBmPmnHooDLT0C/IjF2vwWyRx
 IrJjn8RdS5d+H61wxOgPqktha6k+bMn8qgf4QaMC0UrWrWjWnsWgEAhPhfF9l0soOfaW
 SJgIbdWLFEhY29jFhnjtZ34lj8f8eemRg5iERzONHoOSfw6xpDoSTJBqWvtLSi48hzV/
 bVBXjicM8SVa51wzJuSDjXOsaGiepPwlw1a9u/hckX3WfnfVzQY8lA2CNXnRW6RsZPXQ
 HLqQ24VzImDtXxg+lZPmlfu4gUUx3BbCsvyehlJ6j9fnz49xzhrURcYb4D+pCFl/ByTF
 H68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438374; x=1720043174;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6j1Oqrf688nsM2s31tFHNJb5eIHTmizO9USvB+zJtCc=;
 b=qel3cJA1NJwfPuC0cpiuoDNgOxXewKIMNPty05+N6Seo5fW4UNirQYdrHH5/rbk9gi
 1kU/YserWLPXmGs9D3F0E/sph8Q8K042K5IHRV7Ab2OAy3UaIXuzBkjdfKYzDhawk3Qb
 JQgfQ6KensXVGEQVk84OTfNCiP6/JWmmyLrjvxB5f5RVpn5DgPWukggZpA3v4qXxYmu8
 c08lLvqxvxbsAcGCJ2qa25k7VSTuDTq51Z2Vk0zeZKqJFBBI35lwvoT4g1ia2hUpomZN
 zY4+Z0IMplmTWBg8NBTuAI+7rAUg3XIdNv2+NLkBR80MOiCZa7/QS8yMYQK+1O54wP6d
 hflg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGKmm3lri5pN65629qM8ezFSLthoPYaddgnp4TfRfiGfE40Fc/Pit9WTFgn8ADkkIG6Z9w0uS8DLNj5jfPZEKcmmJUZ+KsEtvM2kWWT5lt
X-Gm-Message-State: AOJu0YxC2K/a2HvsYvZtZNKjyTybD0LJFxFSBhwWMCbF8Gb0L2/w3/sh
 hK00K+VawM5ILsDnzfi5kERhP4ICG/bMUwHM8nouDPMGdUvGiHK+iobrATMyo/HnyYZLwDj6UWv
 D0D0=
X-Google-Smtp-Source: AGHT+IG6yvMPKNsxGi6MmnuHK4/BDaw3nTiG9PJA9BoMa9dULCEOV8F6M8pX0zxmK8fUCTEBmwEwQA==
X-Received: by 2002:a2e:9684:0:b0:2ec:403e:631a with SMTP id
 38308e7fff4ca-2ec5b36b135mr71725221fa.8.1719438374102; 
 Wed, 26 Jun 2024 14:46:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:05 +0300
Subject: [PATCH v5 11/12] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-11-5efb90cbb8be@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10695;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ag9775D+dd0Vesuu0Racpc8vAYyqtYKHV6Q90Qvhm9Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwZdiH8o53rDtDCEAVYLoLkZeb2ChyTQaBQV
 mbLBHZtV0aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGQAKCRCLPIo+Aiko
 1d0ZB/wOEOHT6dUdlcw7cg8/rZRiGI8r69zHcLc12KYHiLXKmaVYLN610BjDoedqWgIzz86bHFM
 G73GYVDW0ROUDzb/+lT/2vrOdm1cs0zRgbEyz3Hhkb023IOzb7Xc0RGDdaW+fgNRd0/eQQRjRet
 rWu1QLzu8M9+34kvuN0YYTFpNlZQeAZUzKt9Lf/0Z1XW1s0UKibAr9swDYbBaylnOUNeiWEdrAi
 VRzkoFRfQ/qBZ2Hr2sLMzkvdGjj/NCuCjYeQhXbvjYdkutvoXion6ssnpigAU6gDaTOTZThlEpw
 QHBSL5t3Lr6mOGuvqu95Iu8OHrEfkP1HGGPumwExKzxABfrR
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

Virtual wide planes give high amount of flexibility, but it is not
always enough:

In parallel multirect case only the half of the usual width is supported
for tiled formats. Thus the whole width of two tiled multirect
rectangles can not be greater than max_linewidth, which is not enough
for some platforms/compositors.

Another example is as simple as wide YUV plane. YUV planes can not use
multirect, so currently they are limited to max_linewidth too.

Now that the planes are fully virtualized, add support for allocating
two SSPP blocks to drive a single DRM plane. This fixes both mentioned
cases and allows all planes to go up to 2*max_linewidth (at the cost of
making some of the planes unavailable to the user).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 161 ++++++++++++++++++++++--------
 1 file changed, 117 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c72c65bf55e1..0d9f9216420b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -19,7 +19,6 @@
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
-#include "dpu_formats.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_util.h"
 #include "dpu_trace.h"
@@ -886,6 +885,28 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
+		return false;
+
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
+		return false;
+
+	if (MSM_FORMAT_IS_YUV(fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
 static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 					struct drm_atomic_state *state,
 					const struct drm_crtc_state *crtc_state)
@@ -899,7 +920,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t max_linewidth;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -921,8 +941,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
-	max_linewidth = pdpu->catalog->caps->max_linewidth;
-
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -938,41 +956,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		/*
-		 * In parallel multirect case only the half of the usual width
-		 * is supported for tiled formats. If we are here, we know that
-		 * full width is more than max_linewidth, thus each rect is
-		 * wider than allowed.
-		 */
-		if (MSM_FORMAT_IS_UBWC(fmt) &&
-		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
-		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
-		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
-		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
-		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
-		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
-		    MSM_FORMAT_IS_YUV(fmt)) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
-		/*
-		 * Use multirect for wide plane. We do not support dynamic
-		 * assignment of SSPPs, so we know the configuration.
-		 */
-		pipe->multirect_index = DPU_SSPP_RECT_0;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
-		r_pipe->sspp = pipe->sspp;
-		r_pipe->multirect_index = DPU_SSPP_RECT_1;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
 		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
 						  &crtc_state->adjusted_mode);
 		if (ret)
@@ -993,16 +976,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	const struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	if (pdpu->pipe != SSPP_NONE) {
-		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-		r_pipe->sspp = NULL;
-	}
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
 
 	if (!pipe->sspp)
 		return -EINVAL;
@@ -1019,6 +1002,47 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+		const struct msm_format *fmt;
+
+		fmt = msm_framebuffer_format(new_plane_state->fb);
+
+		/*
+		 * In parallel multirect case only the half of the usual width
+		 * is supported for tiled formats. If we are here, we know that
+		 * full width is more than max_linewidth, thus each rect is
+		 * wider than allowed.
+		 */
+		if (MSM_FORMAT_IS_UBWC(fmt) &&
+		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
+		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
+		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
+		    MSM_FORMAT_IS_YUV(fmt)) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		/*
+		 * Use multirect for wide plane. We do not support dynamic
+		 * assignment of SSPPs, so we know the configuration.
+		 */
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_1;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
@@ -1052,8 +1076,16 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		return 0;
 	}
 
-	/* force resource reallocation if the format of FB has changed */
+	/*
+	 * Force resource reallocation if the format of FB or src/dst have
+	 * changed. We might need to allocate different SSPP or SSPPs for this
+	 * plane than the one used previously.
+	 */
 	if (!old_plane_state || !old_plane_state->fb ||
+	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->src_h != plane_state->src_h ||
+	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->crtc_h != plane_state->crtc_h ||
 	    msm_framebuffer_format(old_plane_state->fb) !=
 	    msm_framebuffer_format(plane_state->fb))
 		crtc_state->planes_changed = true;
@@ -1073,7 +1105,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
+	uint32_t max_linewidth;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1082,6 +1117,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pstate = to_dpu_plane_state(plane_state);
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->pipe_cfg;
+	r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	pipe->sspp = NULL;
 	r_pipe->sspp = NULL;
@@ -1096,10 +1133,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
+	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+
 	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
 	if (!pipe->sspp)
 		return -ENODEV;
 
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->sspp = NULL;
+	} else {
+		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
+		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
+		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
+		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
+			r_pipe->sspp = pipe->sspp;
+
+			pipe->multirect_index = DPU_SSPP_RECT_0;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_1;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+		} else {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 

-- 
2.39.2

