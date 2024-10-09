Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D739963CA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5639E10E6A2;
	Wed,  9 Oct 2024 08:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C9H37VrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56C510E69C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:50:56 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e18856feb4so5569469a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463856; x=1729068656; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cVj8AtzhXJ6vFkOcgklF/XoM8iIzrnBxQKfkQbnsapY=;
 b=C9H37VrJE0ZW9jjdU1HsgjO44XQ7fZLulghOvtoM67HbpGiw5yd7sgltk3MBywAEKp
 pT6HYwhav9D1H6Q+Vj7HY38t6zv+B0PFL7+En5Gm1Vq640E5Xn5oEFnfRNARFOhss0Dw
 AYRo4n6iSwMhhtxqBuYN+fdi82jv7SAEjvZQyEeB2Z5rzOi8ZdUR6BGlFJDBLEnSqf4R
 FtemhnUzHeDQSawMTROdJodqZ7D7VPV+Yp+MzFhS0Piop80D/ellD69pShEaB3U6L6X2
 4Znbui4Z/eJuMp/L8D1RhEMtDvsKOsZFA+LvzaEjaQNAvosH7QvWsbYU6xxnoi/mjMhR
 eQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463856; x=1729068656;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVj8AtzhXJ6vFkOcgklF/XoM8iIzrnBxQKfkQbnsapY=;
 b=GjJHr0FOLJ1EhXP1CbhblnlK3b4UCvpc3XTxi0uJeEoBNQvFpOIJBrE3uwP3SShSuZ
 kInE1b15wolH5EmgwbIt2BYIidNE+E6KyPCdFowQ5jIry7E59UlmLgkCmPmZsTs6aVvt
 JqBVuIXAc8n1WCnFAXprEgRpzP4sVx+h6vtcjavPIdpgtQvyaS3z3wE1frYhsp9LrkRP
 P3S3x2u7NvqNmZEqEUzla0a+P7OsG3vO8N7yLidSS3LkpFCkKYvRg9XGhS4EH13unvEg
 dpATyC3UfMVMOQcJRIboSupOZ1jQ/uqrPLBLqly71JWgFqp0v00aNDu1YzlXand0d5me
 lDxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKcs/ZySNSYftqQcPgAeuSe3AspM2RrZdSumwKh6S5Hsfxp7fuF3v6D/i42tSDI8kXoxRTqMokp1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs9mbFYt7DWTSilcFEyW00bpyynPAwozifxfKsdvAv5PAuLVbt
 s3QwU+xwzWApgX2yTnqY4OrAYxvRVO4UOJcDrslRIO+NM8ZqzxGBvypyMtv8Ojg=
X-Google-Smtp-Source: AGHT+IEnEA+z9bRuIkWot3brQ2ilEwLd/yjDCjTrK0Iel1blGAiCM+EGqb8DDhJHM9w7m1IUfCusbw==
X-Received: by 2002:a17:90a:3f87:b0:2d9:dd4a:6a95 with SMTP id
 98e67ed59e1d1-2e2a2525ff5mr2151987a91.25.1728463856505; 
 Wed, 09 Oct 2024 01:50:56 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:50:56 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:19 +0800
Subject: [PATCH v2 06/14] drm/msm/dpu: split PIPES_PER_STAGE definition per
 plane and mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-6-76d4f5d413bf@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=6669;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ovrZzR71sqoQXwvbNAWE38q7w2iPdZWZ4+becN2ufi8=;
 b=ZM+3VwG25eltKqRvgmaKTxC2WylhQoCWcvNm0tMhI8u/6sa+5cYA1ch23F9Upi+dT/uH8cxvV
 Xh905twqT3zDZgwes1P+TA6CI7BFNj3W3PU6iL0pAQHFcYeH8sngfM8
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

Split PIPES_PER_STAGE definition per plane and mixer pair. Because
there are more than 2 pipes in quad pipe case, while 2 pipes at most
per mixer pair.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 6 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9656b1df0f122..43d9817cd858f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_LM_PAIR; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 602dfad127c2a..2e38f4db00c1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -493,7 +493,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 
 	if (test_bit(DPU_MIXER_SOURCESPLIT,
 		&ctx->mixer_hw_caps->features))
-		pipes_per_stage = PIPES_PER_STAGE;
+		pipes_per_stage = PIPES_PER_LM_PAIR;
 	else
 		pipes_per_stage = 1;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 557ec9a924f81..e6e169094462f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -28,9 +28,9 @@ struct dpu_hw_ctl;
  * @multirect_index: index of the rectangle of SSPP.
  */
 struct dpu_hw_stage_cfg {
-	enum dpu_sspp stage[DPU_STAGE_MAX][PIPES_PER_STAGE];
+	enum dpu_sspp stage[DPU_STAGE_MAX][PIPES_PER_LM_PAIR];
 	enum dpu_sspp_multirect_index multirect_index
-					[DPU_STAGE_MAX][PIPES_PER_STAGE];
+					[DPU_STAGE_MAX][PIPES_PER_LM_PAIR];
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a2eff36a2224c..3277debe11689 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -32,7 +32,8 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			2
+#define PIPES_PER_LM_PAIR		2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e7006fb8c7734..9a8fbeec2e1e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -633,7 +633,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (pstate->pipe[i].sspp)
 			_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
 						   &pstate->pipe_cfg[i].dst_rect,
@@ -1075,7 +1075,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1128,7 +1128,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1256,7 +1256,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1386,7 +1386,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1400,7 +1400,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1419,7 +1419,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1534,7 +1534,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1591,7 +1591,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (pstate->pipe[i].sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 39945e0d1b851..5c1b3775dce55 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -32,8 +32,8 @@
 struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
-	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
-	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
+	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1

