Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7879F7636
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A6B10ECB8;
	Thu, 19 Dec 2024 07:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EvE1WBJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610FF10ECB2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:51:04 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21683192bf9so4900545ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594664; x=1735199464; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RgvnOTs2uY1dsly9HgOib3tl/7lDapvkf4uxsPWHol0=;
 b=EvE1WBJNkuaBBLF3hsj09htdXodP3635HEwPPgAYy4AhNDnuMjkk9Co/L50hz/kl0M
 thrObDj9REXTmAKdqW/S2SNlSSFsm3KQPTAFb+emHm9Y0NnASKDaPjP2w0kXe2AYr678
 GReFFBz8HEZmBCQOJoupRn8HlBPLmlDwk2qPGY9n3ShnWjCmOLxG20d4YxoJ57UpVQBw
 9BwWDol/3xpfnIbNRtc6nTvDYofEOGMMEtyrwMQnLUW05G8NPdkmzFWio0b05pN+v72j
 tseFJ6oKGRaSX5NlZZMAOhmzjM7O3Zodfwrziy2ZP1ZVgDX18OH/TiO2q23kOX2hauXT
 DPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594664; x=1735199464;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgvnOTs2uY1dsly9HgOib3tl/7lDapvkf4uxsPWHol0=;
 b=AyqSdwPLA1kc24AHyA4vx7yLmIJvLsK3uyMs8ODvZ3XLUeWW0d6q0uLaUKL6P+fNyi
 wWLXwKdztfFKNZmp7eX6CGS1/j3aQXiBaKkzx80nXIIQL3j9C7LqSk3QDNh6fhdTkjcu
 znJ88YkJvvgWtW5eu7CRCNUJjuSNfpS4HHndelzhHCjGb9x38O+lcfv8U751M4Uyncu1
 f7Si4soEjIkX1/QviYgswDP1PSKe0vu6MDZBZaFhCQxdfbPzR5KZrf9FtHWEs0yZE+kd
 KpwT8oBR6JrLWtEmrQdB+QuIGujwDayqcOwiDss9WMNZKXp8qBl5g3i8OZ/SwE72Hdi1
 rySw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1vFBjQP1aMQ824YoaQhEbR46z+Cq/Fg95TfsvvPikhcAZYKiZIyB+1ebmpU4YUryv7yWgU6sBRLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywU40sWJ6m1SbKEirWq+Qe28aW0H3Esvy9Zo6IzgBcMaAodlvK
 SX2G94NN+VioAFFxnkqIdDKtfKWYIst2muQZR6PN/Rpj5s/6d7Ci5/SB+pzw95I=
X-Gm-Gg: ASbGncsMISxNVLt6nYEhOCE53jDNYKdAp/8H1p5p52fSlEAxxvEtHQv4q3LTMVJSOZG
 arEjjLZcMxLGCRjpFla7Ixs6GdK668x4jbb92dKeRPCVZMYQOMvVbU6/rA8kBBVWliUuuf/W4BP
 WpkmDcUIi1gkvY/8wh2RoGupWRUjoY35SzU7M1+RDGnd+UEenUucoxZskILUU6DtVMH3qx0oiEf
 t+xYRL7Tz2ClqBPyzNUJxV2IfgirZQEzxVb71VZNxEbxVGQI0pbGw==
X-Google-Smtp-Source: AGHT+IGwaAxcVSn4iX1XZOIX8Wg+snyJY0Kv6ikKPptCVVAmPgXHQ4NSJbP4uqVO2uhW3137qBScNw==
X-Received: by 2002:a17:902:e5c1:b0:216:5b8b:9062 with SMTP id
 d9443c01a7336-218d726cd69mr84265435ad.54.1734594663939; 
 Wed, 18 Dec 2024 23:51:03 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:51:03 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:32 +0800
Subject: [PATCH v3 14/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-14-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=4031;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=tA3alNV9otTl28ZQS8OwFjLP2xaRsfRU08APLwodDys=;
 b=E7WIJ2rZG+R3RNiWLgSS7yjJEJ5MHTpRWMKhf43PADnxUFgiPrrcgzCtHR5I67K90C0yTqiER
 GBEgH4QJZApBXDJ6YlXZWb0DFe69Iolhya8bCW7D3hDvn2JNRgXvL07
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 67 ++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1cd98892898a4..57ccb73c45683 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1163,12 +1163,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
-	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1176,12 +1173,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	/* TODO: loop below code for another pair later */
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1195,24 +1186,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
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
+			struct dpu_sw_pipe *pipe = &pstate->pipe[i];
+			struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
+			struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
+			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			if (!pipe_cfg->valid)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    r_pipe_cfg->valid &&
+			    !dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
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

