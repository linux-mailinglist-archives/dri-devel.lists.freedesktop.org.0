Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC409DEE83
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B8610EE4C;
	Sat, 30 Nov 2024 01:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tovxwstu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B580A10EE4C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:55:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53df1e063d8so3076135e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931727; x=1733536527; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=261PimRoKlrpsFq5MeoCEW7BIk620Ollnqdg7IYILxM=;
 b=TovxwstukxwlK8wsJfnSqLFWygdOUrZQkmdscA9ASaZ2c3f0u9qwP9jskLbbwwHTfR
 w0tB5ryDcRfVei8BxBOjXxaLi314BquUar38uLnrv69Ipk9GyvPpwMFvTTjsHeL8XA63
 h9aH+azwWlbq6vMNi4o514mOdlRSF0Ly5Ikh3QSRq8rbeaghYZwEV8rjd07nSOxsuRvN
 f2sVihAaOw/IOwNtoiivZMqiGAALPGyUtO/anDQlHo8GGYkhqypcOr8GluXkIeIP4StN
 ez3BanuZcMmx4FnUC0JSfyOzEiN/a+ekDq45dkiHs1m7mRQEi9rmbwWpmM0QBMLchwMU
 VOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931727; x=1733536527;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=261PimRoKlrpsFq5MeoCEW7BIk620Ollnqdg7IYILxM=;
 b=nYz4A5Aw/LMpQQ0ZoGvmgUfgFvn+oYx6yp5c5JBKHUPxKnNjzh6wH/4mo0TMjzbyN8
 /X1S/XSF+JHXXys4TNimi3qBWoarVgfltgB3BNkKTfIGgs4GLK14loPcEYOHP21CdJzC
 r31JT829EeLUSlTn8ZQkW0MXH1Xjy22/q0A5kM8t/d4XNiYWCBQGflIk/QrdXKg3hV38
 rx5Bxe7ItBNQQFjfZ/O6go8LwDVtD2rMpIlkWHXlEDbVPEUY/UtzliJ2oynjWeyvYl2j
 cuWUXND1TpYuFMFeC3BKZpLMTonPUQN+/WBCgN//vgWA7lHw1bG7ZpQkKi7bOAaqgEnO
 JBmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkgmNrYPdJe9ygLoibQKuahJgcUttIPkm5kmRAw6WwEAcTEvyMbucEmQeqN/Yc1Y3PVxE3PyRFGBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF6JwmMxZLjg57Sulo8wH/S3y5xFxpGsDvLKEVvu9n0hm/TRh5
 oaPFjHnG4xqzHR014A21XaKpoPlky/VJwCjBSvZDqsjUlTzEcfaaUc5WN5+xDwY=
X-Gm-Gg: ASbGncuhJ1Ibo5tYVhcASNkw5mDuMLniPswsIV8CEb/uE+Pa5DSN0OJRi2P5vgE9TL9
 oP8R5v8zT0jwPcjqUwKC/Xu3CrRfmM3hJ+cxfqaby+AR9o8RP1IkW2CM9zZntcMFEGLxkMS1uq6
 cPx3s8xDHDjiE58Qiv83bOv/2zoCQiVa62rsQLbCjl0nmxGwXqp0S6at0psMMaH4hT3dXxp5kfm
 joxObxt4MeeaYybeSnqsizjTwHDAnJMu48xnmEHocFxT1PzAR6FleyD4Q==
X-Google-Smtp-Source: AGHT+IFOOIPTtn6KR/WtjysReR/LUG2OFBudpST3Ur89aymaHdky9RA2243KKYdLtY9RzNbHPwIonQ==
X-Received: by 2002:a05:6512:a94:b0:53d:e397:2dd2 with SMTP id
 2adb3069b0e04-53df00aa1c9mr7921612e87.2.1732931726833; 
 Fri, 29 Nov 2024 17:55:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6430cc8sm635601e87.31.2024.11.29.17.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:55:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:55:18 +0200
Subject: [PATCH v7 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-dpu-virtual-wide-v7-2-991053fcf63c@linaro.org>
References: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
In-Reply-To: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10016;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tnabCVU1SaNGNfJfuPGtjX+5svo205A46mZ25LOgd7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSnCHScBaUh+cOZL423003QuXwpn6b8mUYyBzv
 6IB41XdNCSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pwhwAKCRCLPIo+Aiko
 1a2QB/4tQX5o2eHeN9nCjARC/3AOX/bLesJhtdOpwDMO8IOHlhLcjRo4tTz374pMGdZ+exlSDvS
 l4xMYQaQh957h0dFg/qQ++Xqx2I4eonSJZuMTBQzTbe+yZJIqW7E/KIlPGnpbQE22IwqsyK6Uu1
 70hp4qGGlu3gu0oMcice/En0ZMn39nO7hg9EkL1TjTmrp/pzu2C618mn08t7eRC5fWU6laIFJdy
 DMwLGpb85EXSpRFv07vNaWqE0c96bOKxJ32M5ZC7PH4a6OnU0PR2B9obbokXxtcW81+EYPYKuq1
 T6t4ldzEVis+SREokaLzkaOuiobgeXbMuBX953W0FdXcOSLo
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 144 ++++++++++++++++++++----------
 1 file changed, 98 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 309a8cdaafcf3dacd1c7ba4e0cddb7f3f56423c0..098abc2c0003cde90ce6219c97ee18fa055a92a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -20,7 +20,6 @@
 #include "msm_drv.h"
 #include "msm_mdss.h"
 #include "dpu_kms.h"
-#include "dpu_formats.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_util.h"
 #include "dpu_trace.h"
@@ -888,6 +887,32 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
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
+	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
+	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
+		return false;
+
+	return true;
+}
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -901,7 +926,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t max_linewidth;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -923,8 +947,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
-	max_linewidth = pdpu->catalog->caps->max_linewidth;
-
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -940,48 +962,43 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
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
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
+						  &crtc_state->adjusted_mode);
+		if (ret)
+			return ret;
+	}
 
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
+	return 0;
+}
+
+static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *pipe_cfg,
+					     struct dpu_sw_pipe *r_pipe, struct dpu_sw_pipe_cfg *r_pipe_cfg,
+					     struct dpu_hw_sspp *sspp, const struct msm_format *fmt,
+					     uint32_t max_linewidth)
+{
+	r_pipe->sspp = NULL;
+
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		if (!dpu_plane_is_multirect_parallel_capable(pipe->sspp, pipe_cfg, fmt, max_linewidth) ||
+		    !dpu_plane_is_multirect_parallel_capable(pipe->sspp, r_pipe_cfg, fmt, max_linewidth))
+			return false;
+
+		r_pipe->sspp = pipe->sspp;
 
-		/*
-		 * Use multirect for wide plane. We do not support dynamic
-		 * assignment of SSPPs, so we know the configuration.
-		 */
 		pipe->multirect_index = DPU_SSPP_RECT_0;
 		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
-		r_pipe->sspp = pipe->sspp;
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
-		if (ret)
-			return ret;
 	}
 
-	return 0;
+	return true;
 }
 
 static int dpu_plane_atomic_check(struct drm_plane *plane,
@@ -995,16 +1012,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	const struct drm_crtc_state *crtc_state = NULL;
+	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	if (pdpu->pipe != SSPP_NONE) {
-		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-		r_pipe->sspp = NULL;
-	}
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
 
 	if (!pipe->sspp)
 		return -EINVAL;
@@ -1016,10 +1033,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(new_plane_state->fb),
+					      max_linewidth)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
+				" max_line:%u, can't use split source\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect),
+				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
+				max_linewidth);
+		return -E2BIG;
+	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
@@ -1054,8 +1078,16 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
@@ -1075,6 +1107,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
 
 	if (plane_state->crtc)
@@ -1084,6 +1118,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pstate = to_dpu_plane_state(plane_state);
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->pipe_cfg;
+	r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	pipe->sspp = NULL;
 	r_pipe->sspp = NULL;
@@ -1102,6 +1138,22 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	if (!pipe->sspp)
 		return -ENODEV;
 
+	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(plane_state->fb),
+					      dpu_kms->catalog->caps->max_linewidth)) {
+		/* multirect is not possible, use two SSPP blocks */
+		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!r_pipe->sspp)
+			return -ENODEV;
+
+		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	}
+
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 

-- 
2.39.5

