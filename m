Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA97964174
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AA910E649;
	Thu, 29 Aug 2024 10:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FhUaPCKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97EE10E64B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:22:04 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7093ba310b0so190245a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926924; x=1725531724; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EoL1g7/icKaoeTVszo+C7O0+4g1QDi21vNC01sKJZ+U=;
 b=FhUaPCKdbcMGUFgXjy7uSPMRgWVuEyuPYtHDi0gM7CyJV3U4r0I/YVqE/DewQbXi+g
 Dit7qzGjOjeEtvdW9sfH/f0BoOmLXgprYqSd6YVA31wcb+6jHJ16UcQRpK54dScKRapf
 YBuVJYkqUeQZsYC/avBTB1rHStxV8UOfaI9YIwvS7h4c/7gFR8wtkzsfOwsNsvz5kkGd
 uOmz6CFuRnstBQaWmv02Oy+65ozIpYiPY0Q2FrNMoHC90126TKtCtKISHdRs0bX4xsTe
 2A1+bfbn5HR9fAZmHNriblVapaPqayidpK5Q/bPtx2pfIsv77xO9n7en0n+wZyAeFERa
 2Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926924; x=1725531724;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoL1g7/icKaoeTVszo+C7O0+4g1QDi21vNC01sKJZ+U=;
 b=CyNrcUl/fl6hHxyWXn8nz1ei22B2LUTz5wsWolQB+BHlHxzKC1f+IFXPGf1VfNnyFN
 sX83A15rcCevICzKv+OTFgSwEvxBuS9QxNdEa5XJtXpMQzK+VMrJzai2e+fKngNeyWMC
 FspTPMYZKz7ztBTCb+Xs1lVAoI8PYvfBk1XasB3A5Mv8WhhvIwuvs+E2wq2ipPtscE6c
 pW7KnszM7ffA+zxLJ+esKylHihQmD+0wijXUuauROY8J0l5ReYYcO3LWdJQE8R0xfCp1
 zEfHRD70cz4vxUTofdUEwND3CFt5I7wl0cEx+245Y/D6smfMBisqCUkKuo+DqAVmRJkb
 COyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFFdCDVlCIos3WGKLglk8HQkA+YnjR71GlZkQ0h42DjSk6FtscG7sNyLDWUV50WrXqEuJYEcCMnH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGjpBodm/a6r6Rrp+NUMKWYGYgSjYYxAzbFEFr2/3iTlyTZQ5V
 eAQO07H1kM5bTwkyiK74hr3KKlH+J4G5BsjT2eoxVgcm5d7F/LBVnGJbKSd6YS8t8l3IYVLGp10
 rxi1HLQ==
X-Google-Smtp-Source: AGHT+IGeTVY5NXa21IFreOo7cUd0AF9nsb1AdXB76rapR4PU7ulwY3JN4O81zXAJhD39YeE/gmu+nA==
X-Received: by 2002:a05:6358:3128:b0:1a6:7e01:e4f4 with SMTP id
 e5c5f4694b2df-1b603cce66emr313159955d.28.1724926923856; 
 Thu, 29 Aug 2024 03:22:03 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:22:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:50 +0800
Subject: [PATCH 21/21] drm/msm/dpu: revise debug info to support quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-21-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=3921;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=nVktgxY+Y22iglpT7aElSF7x0cz/c6cqG4U2dR19+fc=;
 b=ps+qzD7mgTydu3jMaADiSxfJjhNUZjxeZGWz5mhRkEH5L6u1lEgMUtgsZS8PogIIhHvYDdUCr
 5HJfsvYAO6ZCG37w8uuEos6cFcsZ8wmsgOcKJVAZ5ki84E6rwKZoQC7
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

Unify debug info to support dual pipe and quad pipe

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 16 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 35 +++++++++++++------------------
 2 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8fd56f8f2851f..9e8c5225c8dca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1437,15 +1437,13 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
-		seq_printf(s, "\tsspp[0]:%s\n",
-			   pstate->pipe.sspp->cap->name);
-		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
-			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
-		if (pstate->r_pipe.sspp) {
-			seq_printf(s, "\tsspp[1]:%s\n",
-				   pstate->r_pipe.sspp->cap->name);
-			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
-				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
+		for (i = 0; i < PIPES_PER_STAGE; i++) {
+			if (!pstate->pipe_cfg[i].visible)
+				break;
+			seq_printf(s, "\tsspp[%d]:%s\n",
+					i, pstate->pipe[i].sspp->cap->name);
+			seq_printf(s, "\tmultirect[%d]: mode: %d index: %d\n",
+					i, pstate->pipe[i].multirect_mode, pstate->pipe[i].multirect_index);
 		}
 
 		seq_puts(s, "\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c3ea97b4ce439..12f7b510eb5e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1550,30 +1550,23 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	const struct dpu_sw_pipe *pipe = &pstate->pipe;
-	const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	const struct dpu_sw_pipe *pipe;
+	const struct dpu_sw_pipe_cfg *pipe_cfg;
+	int i;
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	if (pipe->sspp) {
-		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
-		drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
-		drm_printf(p, "\tmultirect_index[0]=%s\n",
-			   dpu_get_multirect_index(pipe->multirect_index));
-		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
-		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
-	}
-
-	if (r_pipe->sspp) {
-		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
-		drm_printf(p, "\tmultirect_mode[1]=%s\n",
-			   dpu_get_multirect_mode(r_pipe->multirect_mode));
-		drm_printf(p, "\tmultirect_index[1]=%s\n",
-			   dpu_get_multirect_index(r_pipe->multirect_index));
-		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
-		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe_cfg = &pstate->pipe_cfg[i];
+		pipe = &pstate->pipe[i];
+		if (pipe->sspp) {
+			drm_printf(p, "\tsspp[%d]=%s\n", i, pipe->sspp->cap->name);
+			drm_printf(p, "\tmultirect_mode[%d]=%s\n", i, dpu_get_multirect_mode(pipe->multirect_mode));
+			drm_printf(p, "\tmultirect_index[%d]=%s\n",
+				   i, dpu_get_multirect_index(pipe->multirect_index));
+			drm_printf(p, "\tsrc[%d]=" DRM_RECT_FMT "\n", i, DRM_RECT_ARG(&pipe_cfg->src_rect));
+			drm_printf(p, "\tdst[%d]=" DRM_RECT_FMT "\n", i, DRM_RECT_ARG(&pipe_cfg->dst_rect));
+		}
 	}
 }
 

-- 
2.34.1

