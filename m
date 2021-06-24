Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8E3B3208
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30166EC20;
	Thu, 24 Jun 2021 14:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7736EC19
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j2so10751545lfg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKeS2D6NI+nwzdlSN/CbA1/E6G9yn+fxXMAvAL8n5i8=;
 b=o9bVyES50Ubdsxjce6p6kTTu/gOMLly8CXc6aOBPz7wGJ2jN8y2fkJnVPlormj0sTU
 U0ekDTCG1+5y8lfPulYiMSccHQqmK8Nbt4cW3cLAcNn+2ZRUQ4ZeYmwjlh5im20UKncp
 IaWjRSbp2IIKtHf1M18AYTMQbSCIn1d8st923bf6bCh+cvT4hmDw0YYtUXxHWJJUzGJZ
 USQvvVyV54bNQCgQmE/4C68mqx20uInkLZfXhH6EozUMhHWVRcBd7jqCEz13ZmzfoGAt
 IwvXp9ezgLaoiXKWrJjmtHFPjngjkfptS8fH3vTdavQEYg644Pg9MkgerYqjgkaU6nua
 pAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKeS2D6NI+nwzdlSN/CbA1/E6G9yn+fxXMAvAL8n5i8=;
 b=j9C9tYVpY1C+BNY3YAgjjjW32o1m8toYPvHJ/6jfxmiRfyUr7k/WFaa12qgVLlIb2m
 fCUMURvAp36Y2QdXMt2y+pCzsEPmcmxdCbzQMJ6zGqgOFXDbm4tiJl8x7O+Z35XM2PuM
 zfckEMwYyR9KuTjCMiSD9o27BIVRq+iQsgBvBahPcJrcnZwNTxJyuXdD87GszqoeUSmN
 R/cmjDwhzGyHjm/AeN4Xa99P9vBMaMVS8nadDUm4f4b0lWsgvI8v6HLfuz2y/zsDkD7B
 g8XPD21YrNi0XuOVKSvTH3ct6o9brfI2iyArPtBXAC24FyN4P3yhUjhd88t3VzCDNjJn
 32YA==
X-Gm-Message-State: AOAM532zge/4zqpSksyFWvF3JXG23mqhXWTcEsGL+UZJcwG906wj9GSp
 BXHJCjeAq5NzqcuAsZQsajyU5g==
X-Google-Smtp-Source: ABdhPJzm4uqElRmIAF8FN+Bez+JF+dq0zfRQ7JPMLw2cLqg1xdhR4M89APu46nKT3Mb7fDp1/2knsQ==
X-Received: by 2002:a05:6512:2208:: with SMTP id
 h8mr4201904lfu.113.1624546661359; 
 Thu, 24 Jun 2021 07:57:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 04/17] drm/msm/dpu: remove stage_cfg from struct dpu_crtc
Date: Thu, 24 Jun 2021 17:57:20 +0300
Message-Id: <20210624145733.2561992-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The stage_cfg is not used outside of _dpu_crtc_blend_setup(), so remove
the temporary config from global struct.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  2 --
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a5c70c87cc8..ea678ddd4589 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -190,7 +190,8 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 }
 
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
-	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer)
+	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
+	struct dpu_hw_stage_cfg *stage_cfg)
 {
 	struct drm_plane *plane;
 	struct drm_framebuffer *fb;
@@ -199,7 +200,6 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-	struct dpu_hw_stage_cfg *stage_cfg = &dpu_crtc->stage_cfg;
 
 	u32 flush_mask;
 	uint32_t stage_idx, lm_idx;
@@ -275,6 +275,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
+	struct dpu_hw_stage_cfg stage_cfg;
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -288,9 +289,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&dpu_crtc->stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -311,7 +312,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].flush_mask);
 
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&dpu_crtc->stage_cfg);
+			&stage_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index cec3474340e8..30535acec670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -116,7 +116,6 @@ struct dpu_crtc_frame_event {
  * @drm_requested_vblank : Whether vblanks have been enabled in the encoder
  * @property_info : Opaque structure for generic property support
  * @property_defaults : Array of default values for generic property support
- * @stage_cfg     : H/w mixer stage configuration
  * @debugfs_root  : Parent of debugfs node
  * @vblank_cb_count : count of vblank callback since last reset
  * @play_count    : frame count between crtc enable and disable
@@ -147,7 +146,6 @@ struct dpu_crtc {
 	struct drm_pending_vblank_event *event;
 	u32 vsync_count;
 
-	struct dpu_hw_stage_cfg stage_cfg;
 	struct dentry *debugfs_root;
 
 	u32 vblank_cb_count;
-- 
2.30.2

