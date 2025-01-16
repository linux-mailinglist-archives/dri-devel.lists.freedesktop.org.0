Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C31A1343E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E589D10E8DB;
	Thu, 16 Jan 2025 07:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EZdidRte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDBF10E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:28:37 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21631789fcdso22086855ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012457; x=1737617257; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fx1E8t/9QjcbEBH2snoxAgb5EcAAcnSsz77Xp2NQP5I=;
 b=EZdidRteL4tGA6q4/oMd8C1sDZyWQM9QPZA+tvpVUoHGhgyBff4bH3oDg9rF4Ntmpe
 hBI6zL1GzSkM141Q6/LCsf/K/lDsck/iB8UZu5HXTw0k6MiW46JlTAK4FuOSL9MrSL2d
 jmC0iiXP1F6Tai6o/SS4S8OsMMFrkXFuFALR8trjz1yYP2ozna1RvaWjJRoibX/eb9+0
 cbl8Or08nn49s0cZyXG57LsY2YsNucRsIs7mxPDLg1GbsCfq/ah7nJZrGz/xhpW0Y9vM
 +pGNpexZcH/wJ7ACnDvUyDxd44pMidqAbJYidD2maHF+jUo4E8Lz+ewThFgbT5+xuYmx
 OqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012457; x=1737617257;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fx1E8t/9QjcbEBH2snoxAgb5EcAAcnSsz77Xp2NQP5I=;
 b=fY2xMB7VCjXP3xKfAj8TeJN1sKAyBFDEa4DYaHKcYVlWIYzNh85l6EawL8b9KjCogT
 76xzkZlAHD7W8Ux73E35MkPO7urvb0Kjb9N6TovLtbrNLEr3t2uhKKpfyCGzCsroBXem
 LN9gwNYxOrMo4e4dL7Uy26tOla94lgHdsDyeN9S++RX62w1KNBMo3Ll0QJa3kNdqA/c6
 ppHgkaxpt+/NXGNQXbq9npJYO+K1ww9ooe1Gv3YzXKNw4IhpdCqelxMTVjEREodQlfyw
 +JGxtHwNabPryNEe/IvdnIoktTJUxt1zICq+IqNJM6x5u69AeSAN5RLfmZ3kJ85Dd5UW
 VRJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCgqyBVr2sxWOINM36qxrVP55AInJl8YgslbppGbyCU+BUeIVu4r1nUKMeSRXeiTE+OXp/P0N3AXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy63ZcKypFzfjDET4Y3O7DMCMTIdPEoC0LBb3dBrrmQxPnQvGPf
 alfoQM8A+NPJjs+90OK86Dex7nw/6WTqUXmvMQOxP8pSwioOQgAJP2YE2goL7Wc=
X-Gm-Gg: ASbGncvbKJV4GeCLllMyf/oz6id8LSNZNUzpP+mggS8xZCGR3hZ21zVtm/Yj1OpolVi
 wcxqX05Mc8vtL9IsEjLRMj33w1EwL+bPtPYrJMOy1bunZlTfQmpqz+ngq8/MPCyUyPKfW8kUkDl
 7ltDtr4RIBF88H6SHfdB5DatrlTsTbhJO8qfX/CUpH/tdOLNmzKvDC1wFE2U/Vfbvl0z2YjAlLo
 11MVYIATcCxSB0p1RD2wnKGeyPoYgveUnStdrbmFfgeT8EcvkrdBw==
X-Google-Smtp-Source: AGHT+IFlz9dBX0rGmKcNVbcQUBIkLZpkwHdI+j7/IKtEw+Ef8fAxK6I2mpVzzxRu5dFMnBQ+JYkXeQ==
X-Received: by 2002:a05:6a00:c87:b0:72d:25ae:cafb with SMTP id
 d2e1a72fcca58-72d8c6d0eb7mr9054624b3a.7.1737012457578; 
 Wed, 15 Jan 2025 23:27:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:27:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:26:03 +0800
Subject: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=3729;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=NyvSg0KJfZTvWnDqJ/WZxZ7v01R6k3CbRD9uX29j+C8=;
 b=Bj6Hq9J9sd8TR/yYNSkA6ij5fsXcMMX7JFITo4HPY4ohR9yyag1zTf/7N6iwyJ8mzz94hfdaO
 gRPDOe8PuKrAgKGBeTapkuUs7QDgOtXqp3eGBxc/yxyPzqqn58MlZWV
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

Support SSPP assignment for quad-pipe case with unified method.
The first 2 pipes can share a set of mixer config and enable
multi-rect mode if condition is met. It is also the case for
the later 2 pipes.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4bcd7b1a05c16..d96f4405a4c26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1171,8 +1171,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1180,11 +1181,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1198,24 +1194,43 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
-			return -ENODEV;
-
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (!pipe_cfg->valid)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    r_pipe_cfg->valid &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+			} else {
+				/* multirect is not possible, use two SSPP blocks */
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1

