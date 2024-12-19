Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B929F7639
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7962410ECB2;
	Thu, 19 Dec 2024 07:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M7DwhgD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BBD10ECB2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:51:10 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-216395e151bso3290345ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594670; x=1735199470; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ncMQeFnI8FyNCTzJzx/U9WczMhrNIAA5qgalqkzfgpM=;
 b=M7DwhgD9o4mN74skr2Piqif5zKh3KgfRjnQCSeR233tFok/dsTRAWXVCUHoEtIx4ib
 +aJkV9z7PZsxLHVdBRBm4+jfyNsEx7cmknKS8PD8djp1AFlSFY0d+S9az2PmTb3hG6vw
 y7ZS4hJR5AgH9W3+Wrk6vfc2NarzAwhj0PTKaGWsbXP9vboQ895k3Jz5KOo380sGGOh6
 tgVq4zoeM4BMi7p0D7/aUciJ0OHu60Vzu7eQwvwqMRRgocz8K1hZXQCCKOHB1Fr6wQNV
 0jTFB7gzMsU94YGhK8scJnK2SfvFhThzxp1VzXIss8vgp/kQAAzT9iqLPgD4zy3zW+SS
 4vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594670; x=1735199470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncMQeFnI8FyNCTzJzx/U9WczMhrNIAA5qgalqkzfgpM=;
 b=MRH5LDYXljbbednpYxBlMBfTmOTQVHjdOdrN99xV7IgFRP6oNIr57phYwDMhtCWo5/
 89idTsedp7JITWr13R09qOHTnQG5DWC0LEACsRA4T1srug2IZGSY+uubdeVyB5Pzp532
 x1qvqS16P5iKiyUFzs6ZkIbw1Oycdabr107DKK4dHcRR5AYBDDtQWachyETEQgTz8djE
 KFu9fztSPFohofsjmQKX9tE/qn5E226A+tMvoG/Lttudo2v6ncI3toIIYbprLDM726V+
 73tUyAZZD9JcLDW/2MTMGNzn2qr0NRBZuwR0pCGpR/Jo9YE8gZqtNF6H67I8tj1EwgO7
 +xIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs5xAb001KDD3L9dOL5E/W5/VVY3L8awjB7uSPPIbphEJf0Br9TjCk2odivRnFTrddGSfYTFlEC68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHWNJAAPTE/mVFbSiAeYv8Z/XmEAMRLlRPx0BT27Zy3rIVJ5xm
 uHVSexRPCJS31Isdr8xGv2KUiR/hjToyq2en078ValQ1JhI8+KGwItSyuF8F6lo=
X-Gm-Gg: ASbGncuxXVF0dAS3KMKWE+4/MnLl0Bf4eZDdzIdcuGJ69pJmvPY/hmq22wlB8QyF6PG
 2FsV1LpQ8KqRTMYB08obd0pL3S3O0kofc3yzyFvWqk1N6kc9uVbPGasmhQrKKc7mMjQrt9NNeL7
 BKjzS3OsRo8BVr6TBGT+xTHaeKgvx6nJftWA57kzIl3392Vwx4/XIGYHoQq7n79eXW4ldD0Y4Z9
 azGAaBgUrna9b47ehbJYWLG8EL1SnTXDOxHuz9BAFpYv/Bx0F8hPw==
X-Google-Smtp-Source: AGHT+IE6wutQ9rGCjIBHFXRUP8U2cudK8bKqUGf+H0wx8eea9x5QHkaF7AyJwuwtdVhfnshpWOkZ7w==
X-Received: by 2002:a17:902:da81:b0:216:59f1:c7d9 with SMTP id
 d9443c01a7336-219da6eabaemr34112635ad.19.1734594670471; 
 Wed, 18 Dec 2024 23:51:10 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:51:10 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:33 +0800
Subject: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=6569;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Kgvxz+JddimpExknfUGmCF8U+2CnnDWzoXq631c2AJ8=;
 b=IVh/pEC+zDsiWrKgIH1DqGmvx8qOE4k3X8IdEM3/dTiXEa5wLm4olw4osrKyvaGNlOBhMWFJ7
 KLSTqXVzqnQAaIwcDd+r75zXKTztI0vY3Zw8qAwibtxfiN5SybfAveG
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

Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
enabled. We prefer to use 4 pipes for dual DSI case for it is power optimal
for DSC.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
 7 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bad75af4e50ab..3c51c199f3e05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_DUAL_MIXERS];
+	u32 crcs[CRTC_QUAD_MIXERS];
 
 	int rc = 0;
 	int i;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index d1bb3f84fe440..ce41fb364f3db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
+	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 96d06db3e4be5..6e54ddeaffacd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -54,7 +54,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	/* Datapath topology selection
 	 *
-	 * Dual display
+	 * Dual display without DSC
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * Dual display with DSC
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 */
+
 	if (intf_count == 2)
 		topology.num_lm = 2;
 	else if (!dpu_kms->catalog->caps->has_3d_merge)
@@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		 * 2 DSC encoders, 2 layer mixers and 1 interface
 		 * this is power optimal and can drive up to (including) 4k
 		 * screens
+		 * But for dual display case, we prefer 4 layer mixers. Because
+		 * the resolution is always high in the case and 4 DSCs are more
+		 * power optimal.
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
+
+		if (intf_count == 2) {
+			topology.num_dsc = 4;
+			topology.num_lm = 4;
+			topology.num_intf = 2;
+		} else {
+			topology.num_dsc = 2;
+			topology.num_lm = 2;
+			topology.num_intf = 1;
+		}
 	}
 
 	return topology;
@@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_mixer_cfg mixer;
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	memset(&mixer, 0, sizeof(mixer));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 63f09857025c2..d378a990cc0fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
+		dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3ab79092a7f25..d9cc84b081b1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -25,6 +25,7 @@
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 27ef0771da5d2..1fe21087a141a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -33,8 +33,8 @@
 #endif
 
 #define STAGES_PER_PLANE		2
-#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(STAGES_PER_PLANE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 57ccb73c45683..b5c1ad2a75594 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 		trace_dpu_plane_disable(DRMID(plane), false,
 					pstate->pipe[i].multirect_mode);
 
-		if (pipe->sspp && i == 1) {
+		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
 			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 

-- 
2.34.1

