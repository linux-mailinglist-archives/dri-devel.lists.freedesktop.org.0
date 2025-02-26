Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B8A45F43
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4D310E8DE;
	Wed, 26 Feb 2025 12:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jb605NQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABB510E8F5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:34:05 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fa8ada6662so13190677a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573245; x=1741178045; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=thORHaa0nHO42oQf0yI+R4Ole7z2L1zPAr3s/1qHHtI=;
 b=jb605NQs3VoWvEthTWfy3SJpSjcLqNZEFzmx14bV9+osJbaom8LhFSo9L6p/uMPSWR
 moN124cgT4dVKu2zGdESzu+rCPjAXHV+smFBXejca6PujtI/OdzRlk8fYtbyiTVcXx17
 9ijXGhiPYkequ59nX0eW/vyi95baaog4GaSMHgxtFzIYnPVAtkxj7XMvX6iy63dlNw0G
 T8b4VI1XSnJWSuKoZhZ/WWlXStukH7m0SdrRKCV/U3tFX4iM20zRLDx1NOV+7zvxyKP0
 4RZh+Yksc9EaKYWpcPrWqjEW416x2bANnveo+ZE6rmCIZOlYCtBhy2sOwJrU3OQPt5G4
 QsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573245; x=1741178045;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thORHaa0nHO42oQf0yI+R4Ole7z2L1zPAr3s/1qHHtI=;
 b=XPPQQfotIgSOYbYpYGF6h/eA1Wm3t+nEFo1gVRcdN5nkRSGF/1B91fMNhGZpxyIVdj
 EMKvY2X0N880xgHesno31DIgzahXSLrsLmZ4u47s/zg2RCC+2qJzUNtDRS29ibK4A7kc
 89IxQjYKJoCWZUprIlPaamo3qVcoacakr11QTcGnqZw3TDd5SR/6zNyxvnuq787JU8q0
 TYoPPoKYmFR2QBHwTMyBcE2pm1HJ25SRMbvBxEtxFCJTeIx8DjzQ1YqdzYj8ZnzT6S4G
 oQaE/rWmjHkMk0vaatCPTbSWG1J2ZXh50W6tNBidQAO/2N38a5adS4YVs1mpW4qP76Mc
 6JgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBypkr2FrZJKYZ2hNyUNm1eKD/YVRLh5nwkUE7TXhZSb0px1ZTDRDLCvUpFNW6ZADWlQEBy72HLUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQyit3ef4/6SB8zNXgsLh5Zd7AUIcJLz03SNWS4UZfjlm19jVj
 ubIqZ/phsreAno2J24xIxkxg7aYLbb/K2A++oJtF+GF+PSniIOYtw06UH7UMj2u1Tom6WfVR91T
 vxXtYb1aL
X-Gm-Gg: ASbGncsL6Qo8lCGIMkj6BGwWKvpdr7kujhb2nchR42YwVwPK9UIejZxDaVsfSE3JxHU
 S4mbk9XWADFlUUl9G87asPOKcBr3vqQjVMSsJoqWzzTP1gHlJcIZoSbqJyMaVUOY/9k3E7v35TW
 GKB+BkhjGNbSUZOYy12R+FGL2cKgwqXUkTTFqjmKkI/WulcRp5AEZVWsJ+oFsec4F2KCvtsOULO
 DeSqLuHdcVrwzA8jo5EPR38fQteQYhPcamaRNyCGKGnPdqAac0mr097yxTE31ACKy0vOYYo9nz3
 Msko/ccaOeUerbZ/aDENjW4=
X-Google-Smtp-Source: AGHT+IFXVKub4Te8Y+5zo1pivgTmLAxms5yC3rfs7Iy2+cnhuxz7ONibXZPnzKSA6ohsSyQFBFtM/A==
X-Received: by 2002:a17:90b:3c84:b0:2fc:c262:ef4b with SMTP id
 98e67ed59e1d1-2fce86cf0e0mr38933575a91.18.1740573245059; 
 Wed, 26 Feb 2025 04:34:05 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:34:04 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:31:04 +0800
Subject: [PATCH v7 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-15-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=6430;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=QGCcgrerBtCitrFyUHoak79bGfEvyYUxi46inAzFuQ0=;
 b=Dxnr+cuGjBLFYOjYttwaBWRQa/F4no/cLNx5YXYk/r01UpvfnftYFotv/Z932e7GxuhVv0vva
 lufHxM0P5aYCUCnCnLJqfIXJ3LzMBW6jj+kHRBdL9f46Awyt0fSPnwT
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9405453cbf5d852e72a5f954cd8c6aed3a222723..c6e8a6cbb5c3f480b30594e0c33f601e4d6fb594 100644
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
index b14bab2754635953da402d09e11a43b9b4cf4153..38820d05edb8b3003971dc6dc675ba8ede847be8 100644
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
index c89a5da0fa8321e9082d5aee304fa16402bb4ad9..d4719b45f4cdd5d1f0bd585283c0c16f1df2f1f2 100644
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
@@ -2189,8 +2203,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
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
index 63f09857025c2004dcb56bd33e9c51f8e0f80e48..a9e122243dce9006aaa582a1537980c86b6203a4 100644
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
index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..77a7a5375d545483edb316e8428df12212191362 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 74bf3ab9d6cfb8152b32d89a6c66e4d92d5cee1d..804858e69e7da1c8c67c725aa462c1a558d1b402 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		1
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1

