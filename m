Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32D96F2ADA
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64C910E10D;
	Sun, 30 Apr 2023 20:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14110E0EB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:17 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4efeea05936so2251926e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888235; x=1685480235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8IldrM6PVf7lolgGQLZs8CrARxItt7xmrIuooW70x7g=;
 b=LMg54sCY0oWs8jIE5/Nd8alwWe3DES37WCZeZtWgIxBcUd0ciQEuTxEf/i2Jkg5dac
 6dV3DdmILMfE/pyOMetkK11uMyhCJQafT1qvRp5Id166EIyz+K5NchcMxURcL0GU0R8h
 Wxs249SE/SNr/1IpfS2iLwp+jf7Ts9/L0Fa/2M8erS4ETHzGZcAR8rgeyNZieMHoX5NG
 v0y2ADqnYwsX57AJqrPIP8LPlG+Un1XJfqilqn8VxsPLrMT5AyJ+cr8MQ548sugJ8FzU
 2bgtY3giEh5Lcqk7Dm4WLLVfoG/cCDtCTBLXcHmw1bn5kmwvovi+1hhDxCdymi+UlY3u
 RxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888235; x=1685480235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8IldrM6PVf7lolgGQLZs8CrARxItt7xmrIuooW70x7g=;
 b=kRNu2l9Ayzth42qwpbXS7T3Q0zBrnMUF2Km27yUeQ6b1QKW46I+9nQOyw3jrVAiL4w
 5lKFlekQ+K55AKBWJhH3RnqbNw7FuV8L7UdPBYCjjzezJCsEzRYM4XDlyJxCEVfVFook
 kIvIT3falXVnUEQ05mXXdvClX4C3D2eCs5zoxQo0tjJS9xsl4kTA5SztvfgGtGlpq+dx
 s1x+IBXXYzGvkF5qeSht5BqxpdUoFqSto3IPLd09ZXpreiKJHtlmZZYB+jFxsVBBByJu
 6SkENWTDji0rdSq/iSW+ayGbuidp47/EDWoZHRgmTK6f7DY52AD9DHSurXtmeVF95sC4
 /rNw==
X-Gm-Message-State: AC+VfDyAl1/lnu5YlLDKafmH+rfe4aiefUeUPXVGfNDDeYhvYprzUd1K
 DsM7c2sw0GO/OCmQHB6lWB6EZuqQ9kFhW8Nrimc=
X-Google-Smtp-Source: ACHHUZ6vYTRMjLtpGWm54O6d5niNUnuG6bx/OWBjOHrFNPdFpFQHi0PxClS/XRQTCx/Ia5av9SMEuA==
X-Received: by 2002:ac2:54ae:0:b0:4ed:d5ce:7df0 with SMTP id
 w14-20020ac254ae000000b004edd5ce7df0mr3292630lfk.7.1682888235585; 
 Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 5/9] drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
Date: Sun, 30 Apr 2023 23:57:06 +0300
Message-Id: <20230430205710.3188230-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop support for DPU_PLANE_QOS_VBLANK_CTRL flag. It is not used both
in upstream driver and in vendor SDE driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 10 ----------
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b2831b45ac64..d47e7061a36b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -371,8 +371,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @creq_vblank: creq priority during vertical blanking
- * @danger_vblank: danger priority during vertical blanking
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
  * @smart_dma_priority: hw priority of rect1 of multirect pipe
@@ -387,8 +385,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 creq_vblank;
-	u32 danger_vblank;
 	u32 maxdwnscale;
 	u32 maxupscale;
 	u32 smart_dma_priority;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 731199030336..b198def5534b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -697,14 +697,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			0400,
 			debugfs_root,
 			(u32 *) &cfg->clk_ctrl);
-	debugfs_create_x32("creq_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->creq_vblank);
-	debugfs_create_x32("danger_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->danger_vblank);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4a5a58152fa8..d7ee4bdc752f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,13 +73,11 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 /**
  * enum dpu_plane_qos - Different qos configurations for each pipe
  *
- * @DPU_PLANE_QOS_VBLANK_CTRL: Setup VBLANK qos for the pipe.
  * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
  *	this configuration is mutually exclusive from VBLANK_CTRL.
  * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
  */
 enum dpu_plane_qos {
-	DPU_PLANE_QOS_VBLANK_CTRL = BIT(0),
 	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
 	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
 };
@@ -361,15 +359,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pipe->sspp->cap->sblk->creq_vblank;
-		pipe_qos_cfg.danger_vblank =
-				pipe->sspp->cap->sblk->danger_vblank;
-		pipe_qos_cfg.vblank_en = enable;
-	}
-
 	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
-		/* this feature overrules previous VBLANK_CTRL */
 		pipe_qos_cfg.vblank_en = false;
 		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
 	}
-- 
2.39.2

