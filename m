Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB26F46BE
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E26A10E5A3;
	Tue,  2 May 2023 15:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2C010E5A0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 15:05:44 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8dc00ade2so38396001fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039942; x=1685631942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uu1Ovv+9l8H4JgjijbWnBIyNknDQaOGn+zcE13beqg=;
 b=fbWNarVeL1jE19elx6oLPTWstU8BjrkyoXoPleOSrfE+INtgKb54aQhxeJIBMNqWUg
 uHWs363HXUVluQLo+18tTZq1IwMHrGTLKm3xDEgi5Fdn8NqIQumy/LDQLxa/1XXF+LTA
 946MD+HPB0EysoJpRDy7cHOWyP44KV7FW5gq3VSyxISYDLiVqQxy2DNe9WbQPIwJsTPG
 opzfeclpexUFXbdHtg1vkpdp+SeEVuEgmVoYNk+K2iDWgZDLgIN3sygMKNpNG7hE+zU7
 tWxVGH8xDZWKMkvFiIRgAei5qGrKk5tjdgp9TivPBGKmPK7ds65DSWqHty3kcLunM/pE
 H33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039942; x=1685631942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9uu1Ovv+9l8H4JgjijbWnBIyNknDQaOGn+zcE13beqg=;
 b=KahnES/XvvG8225diShsh9vednq6PlPGOlXmN9sUbW4aPh6Eo4MGWmjh21DG0a1v9U
 21uB14c5mzTWEx2sHn1Zy0bWpOFACDDZKW+OPryed1vSoNgXhtECkh7YuAWTi72/x/yW
 Stds/n8ctXBiW6YOFuDb9dUUJzzOfHjDrOSAd1KkPYrcFtmMYYsG0kIN/195psnfVJRN
 r9PdXpr3ffcKpJ2tPQe1eIZGp8QX+dJiACigzji2qRSXlzDSZJAbS34sglCEhkGEV2p8
 lbRL1S00dWpo0P9OEH1S/eBUbNHU1fwlDpObqBH/rRs/5tcXYIwsx0zkv6vSJG6hAtiN
 bhJg==
X-Gm-Message-State: AC+VfDzaz1QGLxKKQ0EwhHTNCuphTI+fyWbCL36BKNdRVFOMW9W/MHmQ
 ZrZeyZh0OcciqSU3htNLoD22dQ==
X-Google-Smtp-Source: ACHHUZ7HVT4RamikNKASltBFDq0IsNfpOdA9lhuE19uBg/Fmyq0VJPK9y/n7ppbZwU4ct/4lomXfHw==
X-Received: by 2002:a2e:9598:0:b0:2a8:bc08:a9a3 with SMTP id
 w24-20020a2e9598000000b002a8bc08a9a3mr5182333ljh.28.1683039942546; 
 Tue, 02 May 2023 08:05:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:05:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 8/9] drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
Date: Tue,  2 May 2023 18:05:32 +0300
Message-Id: <20230502150533.3672840-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

Now as the struct dpu_hw_pipe_qos_cfg consists of only one bool field,
drop the structure and use corresponding bool directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 13 ++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 11 +++--------
 3 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 341e3a8fc927..2533c4629021 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -568,17 +568,13 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
 }
 
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_pipe_qos_cfg *cfg)
+				       bool danger_safe_en)
 {
-	u32 qos_ctrl = 0;
-
 	if (!ctx)
 		return;
 
-	if (cfg->danger_safe_en)
-		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
-
-	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL, qos_ctrl);
+	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL,
+		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index aaf6f41d546c..4278c421b6ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -163,14 +163,6 @@ struct dpu_sw_pipe_cfg {
 	struct drm_rect dst_rect;
 };
 
-/**
- * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
- * @danger_safe_en: enable danger safe generation
- */
-struct dpu_hw_pipe_qos_cfg {
-	bool danger_safe_en;
-};
-
 /**
  * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
  * @size: size to prefill in bytes, or zero to disable
@@ -285,11 +277,10 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_qos_ctrl - setup QoS control
 	 * @ctx: Pointer to pipe context
-	 * @cfg: Pointer to pipe QoS configuration
-	 *
+	 * @danger_safe_en: flags controlling enabling of danger/safe QoS/LUT
 	 */
 	void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_pipe_qos_cfg *cfg);
+			       bool danger_safe_en);
 
 	/**
 	 * setup_histogram - setup histograms
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d1443c4b2915..c8837d0aa0c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -343,22 +343,17 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
-
-	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
-
-	pipe_qos_cfg.danger_safe_en = enable;
 
 	if (!pdpu->is_rt_pipe)
-		pipe_qos_cfg.danger_safe_en = false;
+		enable = false;
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
-		pipe_qos_cfg.danger_safe_en,
+		enable,
 		pdpu->is_rt_pipe);
 
 	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
-			&pipe_qos_cfg);
+				       enable);
 }
 
 /**
-- 
2.39.2

