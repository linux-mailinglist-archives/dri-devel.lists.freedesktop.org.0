Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB3B765884
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A509710E5C9;
	Thu, 27 Jul 2023 16:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A5110E5C2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5221cf2bb8cso1531187a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474872; x=1691079672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAO+D5NMJTNgq7oxICRJMihelHd0A/dupTNabM/INjg=;
 b=nTbsfxmpsMq+10/C/3jN78hzseUIeoBGPTpCNV/NgPdpK6SB52b7eF/QqeqqmxiWbH
 cyUj5opl/D8INNxEMtLIF6vSItt6H30YjVnPpEpLueOGTZa6pzH7K/SvQcCgR9y3SPU6
 NHQqn8asiJ1qlKxM//cPq0nJo1MB7ZoucmhBJD9Ymyp3RdIBz78f6J2lbn8cf7xqgdp6
 7TJYDWzP6fIywxdBXyk5IonQ43yyAjfWe4iaQe1InUGDa+0D2v9qQi8Zfr9M43xgBowO
 +ZGYMKZ6ZJKBovRlvS6e/zZUIChpdKLC4kPVxdAxtSb7PsXqORGobeGHSursQxytJUHc
 EJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474872; x=1691079672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAO+D5NMJTNgq7oxICRJMihelHd0A/dupTNabM/INjg=;
 b=Xm67hf+95uoUpRGj/33Mx2grZ/uklWRZHyZYvwb0FkTY4uw5xcEa5D59zrGJnetrnS
 DXq5EXZRboahupUQ2j2ps1oG9pOkOFFerat9uVbUlRtUhXULEY/7qsWgC3QtQ5bPz422
 dWYMQNt/DFJj1/DmBLRjheFtRxAHFUafZsrg1jaQRkGLpn2DIRXK4WOCrZaAa5UVj2gh
 r43ggB9QklmYabQlp5aRk6oGhaYfgO0nEGp6k5Uu7crpcTw/3xOQX1WzVH2UPS+Fc/vS
 voWF5bwZK4U0UBwX6GHNnQ9PtlWDBZb5F9tv95Tcpyox/SVDJGOOTfype6s0KH/lS3TG
 PhDw==
X-Gm-Message-State: ABy/qLYI0I/Ej4//NRFBdMw+Cq5pF3isrlBLrYKi2HhdISHWQ7K9d4HG
 qrgen2zeABWcM96cWyUsOrldzA==
X-Google-Smtp-Source: APBJJlHCv2u8VglBAcBOLLPFkBcIselPzpXHPs1zWQ8D07gQIhCJPSIE2bZas8AEOWcDi0qTlZuqMg==
X-Received: by 2002:aa7:d94e:0:b0:51e:404:1e6d with SMTP id
 l14-20020aa7d94e000000b0051e04041e6dmr2094325eds.38.1690474872108; 
 Thu, 27 Jul 2023 09:21:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 5/7] drm/msm/dpu: drop DPU_INTF_TE feature flag
Date: Thu, 27 Jul 2023 19:21:02 +0300
Message-Id: <20230727162104.1497483-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

Replace the only user of the DPU_INTF_TE feature flag with the direct
DPU version comparison.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 9589fe719452..60d4dd88725e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -776,8 +776,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
-	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
-					 &phys_enc->hw_intf->cap->features);
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
+		phys_enc->has_intf_te = true;
 
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c19dc70d4456..17426f0f981e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -100,7 +100,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a6f8eee58b92..69c9099cf5a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -175,7 +175,6 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_TE                     INTF block has TE configuration support
  * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
  *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
@@ -183,7 +182,6 @@ enum {
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
-- 
2.39.2

