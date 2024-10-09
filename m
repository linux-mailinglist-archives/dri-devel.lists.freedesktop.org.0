Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4B9963D9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E3610E6AB;
	Wed,  9 Oct 2024 08:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T3yvDKn5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660C110E6AB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:51:30 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2e1c91fe739so4962768a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463890; x=1729068690; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lBJlR6luuHJD2SBRXmS4TBrVXnItCuuwBx1jOrvel4A=;
 b=T3yvDKn5A0Yt+VQ7ZMFa1wnAniWeDOwetscLOTFHTo86uBcYJRvvuBw3ibFBYEaHv5
 ioS9g3lv1PtKaoS/ZUGM8ftchPOC94254q+NzVq/BsiX+CD5uA82UxFSg54dcT0n2cUx
 Zc+w669DzGaN5E8sGXC3Ylm4MSJ7nVTVsjC66dQX4GI7vbInBiUt3LJwpVUWTUUVmvMU
 x08P1VWpCwRIOCRzblmfiOz3uCjGOsv4eoV3ZKnQKS/bqNSllYslPzqDA9klXE+Yxq/E
 f9RG3zP8xw3FhA2IlsIPg0e5t5C3Gq/PoHKoSP4jOiIUr6ERArIITGkm4FEJ/9Ck00No
 4qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463890; x=1729068690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBJlR6luuHJD2SBRXmS4TBrVXnItCuuwBx1jOrvel4A=;
 b=CrENkrQBElTLvywK4gg3iopoxQKc2/zvkFy8g3AiKcpJXGj2DVBrBMiuc/2kpqGJE2
 UrcGVgUGZUPGF73roEJNmbi6hT0mYgvfwfKjOQtXybCAwKCnmnDbRZMNkgcOP+ad9hPw
 qQfDehtdQYD9378SH9fhR6mJrjBMmSWg8fJ56F1b3JnLjR2KAU7qq1CbAvlcKaLH2ovN
 GWkq/UpEeB6ynyXg90Z6Unv1GiIgHuvhFd2UkyaAIECUxT5K14BQC+ahj35GIiE59FS8
 LikYW0OU9EmDiYy5fpsu58jHriJRJoZ8TOqWmD29xU8LYwYfpKmyOemXnvv3IcSwUzua
 M3dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXpUxfO/uqbtVhY3UTOF+r/rZGaK8OCTvl7GZDske1f3caFPaiPvVfXPmmCjpf95ahDx2OecB9OuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxetMQx8MB6ezg6RD4j/2zPzd16oSnlnyTunO7edY1hUqghyMsQ
 u+6jsZ6Pa7yNEbP9MgeKZnezrnstF7OWycP/SpqvL6TfjTMwBRhJDBaVOVlWTOc=
X-Google-Smtp-Source: AGHT+IG66GziAUmgiUUsi3KTQJBC4gAlqvuDR119PyWGN/Diu92dHzPdmdutFYrMKyP3/PNQiJlbkA==
X-Received: by 2002:a17:90a:ce94:b0:2e2:7f8f:3ad7 with SMTP id
 98e67ed59e1d1-2e2a21eeb54mr1854426a91.7.1728463889956; 
 Wed, 09 Oct 2024 01:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:51:29 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:25 +0800
Subject: [PATCH v2 12/14] drm/msm/dpu: support plane splitting in quad-pipe
 case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=7922;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CZPvn+ixECCJlwEHRHraiyoiomUWWKsJjwFhygCQwTY=;
 b=EHUAFkbmU3QeX8NKH88pnLfL76SKXBm4B7CBY7a1Ly9PBgUR2iMfPx/8K+/9vtilcuHatv8Y+
 JEN4cyXPL0WBGTTWsGHnXXvj5hBqCJvz6Olo107OIMCR07oRbbhEDWg
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

Clip plane into pipes per left and right half screen ROI if topology
is quad pipe. Then split the clipped rectangle by half if the rectangle
width still exceeds width limit.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  6 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 99 ++++++++++++++++++++++---------
 3 files changed, 84 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 66f745399a602..d2aca0a9493d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1310,6 +1310,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+
+	return cstate->num_mixers;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 5260e2440f059..ee7cf71f89fc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -304,4 +304,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
+/**
+ * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
+ * state: Pointer to drm crtc state object
+ */
+unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 898fc2937954e..480a1b46aba72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -837,10 +837,12 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_sw_pipe_cfg pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	uint32_t max_linewidth;
+	u32 lm_num;
+	int lmcfg_id, lmcfg_num;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -863,13 +865,10 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+	lm_num = dpu_crtc_get_lm_num(crtc_state);
 
-	pipe_cfg->dst_rect = new_plane_state->dst;
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg.src_rect, &new_plane_state->src);
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -884,34 +883,78 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	drm_rect_rotate(&pipe_cfg->src_rect,
+	drm_rect_rotate(&pipe_cfg.src_rect,
 			new_plane_state->fb->width, new_plane_state->fb->height,
 			new_plane_state->rotation);
 
-	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
-	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
+	/*
+	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
+	 * configs for left and right half screen in case of 4:4:2 topology.
+	 * But we may have 2 rect to split plane with 1 config for 2:2:1.
+	 * So need to handle super wide plane splitting, and plane on right half
+	 * for quad-pipe case. Check dest rectangle left/right clipping
+	 * first, then check super wide rectangle splitting in every half next.
+	 */
+	lmcfg_num = (lm_num + 1) / 2;
+	/* iterate mixer configs for this plane, to separate left/right with the id */
+	for (lmcfg_id = 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
+		struct drm_rect mixer_rect = {lmcfg_id * mode->hdisplay / lmcfg_num, 0,
+					(lmcfg_id + 1) * mode->hdisplay / lmcfg_num, mode->vdisplay};
+		int cfg_idx = lmcfg_id * PIPES_PER_LM_PAIR;
+		struct dpu_sw_pipe_cfg *cur_pipecfg = &pstate->pipe_cfg[cfg_idx];
+
+		drm_rect_fp_to_int(&cur_pipecfg->src_rect, &new_plane_state->src);
+		cur_pipecfg->dst_rect = new_plane_state->dst;
+
+		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
+				" vs clip window " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&cur_pipecfg->src_rect),
+				DRM_RECT_ARG(&mixer_rect));
+
+		/* If this plane does not fall into mixer rect, check next mixer rect */
+		if (!drm_rect_clip_scaled(&cur_pipecfg->src_rect, &cur_pipecfg->dst_rect, &mixer_rect)) {
+			memset(&pstate->pipe_cfg[cfg_idx], 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
+			memset(&pstate->pipe[cfg_idx], 0, 2 * sizeof(struct dpu_sw_pipe));
+			continue;
 		}
 
-		*r_pipe_cfg = *pipe_cfg;
-		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-	} else {
-		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
-	}
+		cur_pipecfg->valid = true;
+		cur_pipecfg->dst_rect.x1 -= mixer_rect.x1;
+		cur_pipecfg->dst_rect.x2 -= mixer_rect.x1;
+
+		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&cur_pipecfg->src_rect), DRM_RECT_ARG(&cur_pipecfg->dst_rect));
+
+		/* Split super wide rect into 2 rect */
+		if ((drm_rect_width(&cur_pipecfg->src_rect) > max_linewidth) ||
+		     _dpu_plane_calc_clk(mode, cur_pipecfg) > max_mdp_clk_rate) {
+			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
+
+			if (drm_rect_width(&cur_pipecfg->src_rect) > 2 * max_linewidth) {
+				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+						DRM_RECT_ARG(&cur_pipecfg->src_rect), max_linewidth);
+				return -E2BIG;
+			}
+
+			memcpy(r_pipe_cfg, cur_pipecfg, sizeof(struct dpu_sw_pipe_cfg));
+			cur_pipecfg->src_rect.x2 = (cur_pipecfg->src_rect.x1 + cur_pipecfg->src_rect.x2) >> 1;
+			cur_pipecfg->dst_rect.x2 = (cur_pipecfg->dst_rect.x1 + cur_pipecfg->dst_rect.x2) >> 1;
+			r_pipe_cfg->src_rect.x1 = cur_pipecfg->src_rect.x2;
+			r_pipe_cfg->dst_rect.x1 = cur_pipecfg->dst_rect.x2;
+			r_pipe_cfg->valid = true;
+			DPU_DEBUG_PLANE(pdpu, "Split super wide plane into:"
+					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
+					DRM_RECT_ARG(&cur_pipecfg->src_rect),
+					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
+		} else {
+			memset(&pstate->pipe_cfg[cfg_idx + 1], 0, sizeof(struct dpu_sw_pipe_cfg));
+			memset(&pstate->pipe[cfg_idx + 1], 0, sizeof(struct dpu_sw_pipe));
+		}
 
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+		drm_rect_rotate_inv(&cur_pipecfg->src_rect,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
+	}
 
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 

-- 
2.34.1

