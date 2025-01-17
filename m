Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5BA1538F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC8010EB33;
	Fri, 17 Jan 2025 16:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TJwp834W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1410EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:03:15 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2165cb60719so43646155ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129735; x=1737734535; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3un6sz4f2PupjIWaHPEgPdfQGOWacFMdRr0Cl0n4d1Y=;
 b=TJwp834WhRCeSLaqfoXyKtz8XtWjd7y82sB4fKV5rMidWtVGR/WYG2BJpqGc/pGO9w
 /DC2kz1Eucfzf1pNs7zM/3ZNYbJRMwMTWgOtqz8EFIYBVrMUrHecBgPs2JfaWx77zlCY
 BpZLLlB4BUXB/d8jowXQvv8oh9laszfHNZ/kUrYmygEKcum/3GZ96yw/kWgimhVX/LDN
 YEr9rnubsJ5rlMKMj/67ILDlJPX5hN0ZGOlGaOAjnxHkSTajXDuOSqtf515UPKQNogOr
 SOPPNFncPVoJ/h0sJvU71sfVfq+4o7D8f5gO9U5eswL+ABOk27vX/EG7AFHjEaIgsiR7
 7InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129735; x=1737734535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3un6sz4f2PupjIWaHPEgPdfQGOWacFMdRr0Cl0n4d1Y=;
 b=sCgjAVQOPxD6Ph4bxufCR4CYWV1KVYqVtLKn+VheM2k20E8P8nAtErbW+YAKVG94Ti
 k4g3PUQFd6lAA4nr/RAG5Bl4BNgtF4EWd5E2nKJYBwAYqJwuMzBxJrqzJ7nd7g+ygZZl
 AFE8ncj5genstD2hcrdUduAIjcANWp9TwksTbafUTC1Eg5qCp3ZUQUd+JzGI67jCWbR9
 3Jn3vSjillRSpMRndjngAdRtdz4R+p5avuM9D/5hg4zkjJ1p632L4BXcsoODKPHQj9bJ
 VUpRKhhc3K5HXDlbJACABqG2F7oY8fACQ5qyr98i/vLHnKZI65MCo0uq0Fz6GGkmKE5/
 4Gfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVASUWd9swYxE7DN/ntW+IZxufWH1Tgu3wdgzsUq4Xh4iLDsoG7PSRdhxe0TQ83DZTXermc74HOu7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcgSVuz2SIFEPo2Oqk1/nMhAVJMEapKpeMcVVmMDeu3nslxhQ8
 8LCc6/BSmXiYrg06/ru0BTzy+Of5cH6QIG5OEKn5lh+iETt4dDRQLeFuXO6AUbY=
X-Gm-Gg: ASbGncuQdhOADKsAhgbP1XUKh/vJF05F2sEobQL/ikKi7kTo+mdDEPvRDS2agi4vOqK
 v/ZRwFK6byH8L/7vPiiq/tRiGcwXgL2lpntUmCB1awkFsJzJ3CcmOS93Tx38L1ITE0717QrsyNn
 CbyI108+hb1ww0W6p3KR3OR52uZVJ9L8NOmtqa+VLRPKvfEN2cli5Y3gExDJutUTZJTSVwbAjEK
 9PmXndLufRq6VcZOmvHtVv7JuGSp9cPfcvWqoKE6bUGYBURZuTb3Q==
X-Google-Smtp-Source: AGHT+IEoYOqoDMGqHsHLXSSjrfXVeQ6tiv8sPdBfHOPA8lvbIc/Bvjl+QdbCCVHAtTM9ZGbbTXGvJg==
X-Received: by 2002:a17:902:f690:b0:216:4348:149d with SMTP id
 d9443c01a7336-21c356228a8mr48342905ad.53.1737129735514; 
 Fri, 17 Jan 2025 08:02:15 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:02:15 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:54 +0800
Subject: [PATCH v5 11/15] drm/msm/dpu: split PIPES_PER_STAGE definition per
 plane and mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-11-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4903;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sUuICZ08SQSbhFJWF/1DzEd5meA+YJyjVUzug+zCHWE=;
 b=XMbzeZ8vKLkKszBj/CrueBgL0Rn9VV3nlJqpBrI8X2Qr+d3eeKrtKvJxNGN0iMHtCLtGLuO5G
 ei8Uefp5jusDS1BPbHodcm0nC59purvp0tOndC1NucQCxwsVwps4yL4
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

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 14 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 193818b02197d..81474823e6799 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ba7bb05efe9b8..5f010d36672cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ef44af5ab681c..d67f2ad20b475 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1078,7 +1078,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1129,7 +1129,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1241,7 +1241,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1364,7 +1364,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1378,7 +1378,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1397,7 +1397,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1519,7 +1519,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 052fd046e8463..18ff5ec2603ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -33,8 +33,8 @@
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

