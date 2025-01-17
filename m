Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0BA15396
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F20510EB36;
	Fri, 17 Jan 2025 16:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QtgqS/Cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD3F10EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:03:43 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-21670dce0a7so51917735ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129763; x=1737734563; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kaGM10cVg6jvGCVGU6h5sRoVI7BkvLHmz+ukxbH0FIg=;
 b=QtgqS/CbGJDi1HhIv6CdcGPcCVQKjO6MB2x9LhjEKJQe/MVRo8Fa112COgQz3BMPzH
 hgsf1486PJAPkH1A1+A2Lb8MIdqxvw40VRTEpAf03PQM+CWcgtYqlLN51j50uYmWCNsi
 YVY6ncoEaEY+S9DPtKaoyivF6eg9DKY02fqhn+h8d1fGcVlhzR0iiQ2tyTZ4in+OdDt/
 NRuV+lJbUXd2pt3jhxvkX568qgfNd7NQ13O/hd8wKlCUDoZ5KNyEIVZQetaEEIHhz+FQ
 4LgYQuq7pD/eQFr3655H6uswnV/SnbngNFvW+4YyfDZvN11K0Jtho5AWkB3OAbFC4m/r
 cItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129763; x=1737734563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaGM10cVg6jvGCVGU6h5sRoVI7BkvLHmz+ukxbH0FIg=;
 b=rBxpTn6vs3z7wyFYNxEPECwZn9O+Fg4l3rnVVEfQtDFd8+tIG7lL4o39akZZ0WoXJd
 wWezEktn1snz+aO8gbH7aAPxrXeQFeorIKka/pUBtV+Xa/zuqxLFMw1bcb6vVpb798QM
 73OYnWlQO9PAe0Ufvb1mgGX39g+ljfqPCFRzX8GsytRaLEQRhi/NnOkHm8qVjiaKqIHW
 /iLk0znw4g4kIYytB/hrLFaKyOlncLsNneLR1M7/N3rbnk9jWjAk5h1BSxuznAi1Pfwg
 pk14Qy5Js/zoeRd/JukQoRgpB9q4kc0IMJB2/N9FYXUi1j2ASHhimIqPuNxp0TDRQAuj
 lmmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuwiiZKFtVVETJ+pL+G8g2FZhZpdhNuNvZcb7HzqZWN1OgEgMRWOthY30O0sszc1tGMdc2J9P3Gcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFCgCHPhLv7eNiEpPn+ibFZGUe4PQl9X594m1t+8jl3969VecD
 o+hXxERbDNgbWestzYGjTv2RfHU5GvqMXdAHmVje2yPHMBo723vn1l5V2xQbVqw=
X-Gm-Gg: ASbGncufJqsvRgb62B9nYpMov5T+H2I4mN9vr8jTjXrfD0oMOB9ZYJr8olkBXuX7cvV
 F4U5igPeTe2HNzouvrcgC5nUqMNE26knShS+6xAZF1JU8LsbiqoCB3/cYTuAy4h9wH07jrp96E9
 s2yLFgplgtfaui3zoEPsS0Riv7amn50d11Rqh6UrkacoMxAJH2AT3DZvsWOFV0YrxYQiTQJZwxL
 wtrD5r4rkHxIoDsc7dcr9Z5TlGvO16abEil6gwVvOuOANER7oSJPA==
X-Google-Smtp-Source: AGHT+IGDj0/894RNb/cPu4DzEA3GkbG/kxNG/YeY1LFOWsNhLB5/BegmV28U4Thv/AkOpxYga7tvCg==
X-Received: by 2002:a17:903:1744:b0:216:1357:8df8 with SMTP id
 d9443c01a7336-21c355ee6d0mr43195785ad.43.1737129762661; 
 Fri, 17 Jan 2025 08:02:42 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:02:42 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:58 +0800
Subject: [PATCH v5 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-15-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=6056;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ycMqXmVokZ1n86VFFX+45uoPmFWZS+5o6hFuoVeThpA=;
 b=TOAk7KF/QOIaFQRcYVe6qyVA/8ZMDmGujDHCqgvGl03GLcbbv5loT0G6rNQeE6deygdT+lbcA
 yC+1H2CmRBaD4sPYLLgqiceofIUFvpzMBvArs78pKLNrbgcoLjoflAb
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

To support high-resolution cases that exceed the width limitation of
a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
additional pipes are necessary to enable parallel data processing
within the SSPP width constraints and MDP clock rate.

Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
and dual interfaces are enabled. More use cases can be incorporated
later if quad-pipe capabilities are required.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 852c2ea632f1b..6b306755fceb3 100644
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
index b14bab2754635..38820d05edb8b 100644
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
index b0cab3ccbb57c..22ac7bbf5f775 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -54,7 +54,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -664,9 +664,13 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	/* Datapath topology selection
 	 *
-	 * Dual display
+	 * Dual display without DSC
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * Dual display with DSC
+	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
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
+		if (intf_count == 2 && dpu_kms->catalog->dsc_count >= 4) {
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
@@ -2194,8 +2208,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
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
index 63f09857025c2..a9e122243dce9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers != 1) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a2038..77a7a5375d545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 64e220987be56..804858e69e7da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -35,8 +35,8 @@
 #endif
 
 #define STAGES_PER_PLANE		2
-#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1

