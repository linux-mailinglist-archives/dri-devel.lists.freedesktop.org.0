Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF46F2ADB
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B8010E162;
	Sun, 30 Apr 2023 20:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C96E10E0E8
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8dd1489b0so17600111fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888238; x=1685480238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URalqSWBQf2StR/ApTX5MrAZDz0469HHisBLg1K3V1Y=;
 b=CYylnueb2Xp2Xy6l4CcZX7LugH7G9gw8PkywycPPPCuvqqtrtQcJb0rbw8RKKymtfZ
 pLICk9ReRkuN0F60ipzQ2Bng/ugruMEGSFAlf5kOlGGa6yiLv44pli5DsY/ETBKAPtVZ
 kBA3ELCCHRU6v+ofizw0lwjoEPdPSUb8LBGHS6fk67ARtSm8aahmmc9AFQ24j6XotNVu
 B9G0bqe2nJPaLSh2Hc+VSvj19Bx86D5jSJ8M1wm858fT8OurLS2GRw7AjvP/fkd/M2QH
 cubnbD9FBjacbJdBCTnJnzSLT/yFut+b6GAiVDO9vU0+rgnzlCD136UzexDEngzOEqTE
 XNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888238; x=1685480238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URalqSWBQf2StR/ApTX5MrAZDz0469HHisBLg1K3V1Y=;
 b=KFMz9f5cYVQUMXHWEW/f2+wXialbbSmWBzTxUuOOhyNONNO2CvlqMs89D/JvEqR0Ff
 Wes5KoHcGmjOXeCNQnhtTGzIradH8qZV/juZCPVYO8zR68IH/pNrGnxE1se37CnWfx6x
 cmx5TLf36XWJP8Bhk/KQTb8n264V4HH+oGmpk3UIoibTHXJ7Ar7YkrPovQAgs+e9G9LS
 C4bKdW52Y3lVpuPvStV/QjcBG5/rQKuHx2Hke/Ii18FZwYDCDroaepxH4Xi8fWcMX9gN
 JjWcXMhouydS0Q7Uo7J6W4mqsnrUgLyM3oygN28qWejAQpn62fajVlNGx8nNzNy0WTp7
 3g2Q==
X-Gm-Message-State: AC+VfDzKboUaa87iBScla9eG7FIxBFiaFRZtSSiGMBAxtqNKbny9S77M
 dC2irxWJoynH1R6LZQ3dh1L/aA==
X-Google-Smtp-Source: ACHHUZ6nvBsF5FJCsAOrV06VVhqCk4OtKEtEBM1bBUOZydblJEykER63tBOHAhWFweMFRyl15Gk4CQ==
X-Received: by 2002:a2e:b791:0:b0:2a8:e44e:c75a with SMTP id
 n17-20020a2eb791000000b002a8e44ec75amr3545621ljo.32.1682888237829; 
 Sun, 30 Apr 2023 13:57:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 8/9] drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
Date: Sun, 30 Apr 2023 23:57:09 +0300
Message-Id: <20230430205710.3188230-9-dmitry.baryshkov@linaro.org>
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
index 22273d0baf59..75fb2d2796b5 100644
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

