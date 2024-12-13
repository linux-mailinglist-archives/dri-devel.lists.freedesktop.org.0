Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1C69F1872
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466C10F0F7;
	Fri, 13 Dec 2024 22:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DUbAgfhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14A110F0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30039432861so23564901fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128104; x=1734732904; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EMDHENqu7kX5P1n4SJgKmKj9EqxeCNLadyOWWcHQ94Y=;
 b=DUbAgfhD05A00F22cdxEUxnQ0N6th3jPTWkodBeyrRcW7OGNHrkReEPG6esXBL2PbK
 5FPfrKEQ7aMdO8S0WWDMoHqM6z6KDd/m+XfU5xEIeIdqVvNEKGSeinp1zifvn7PGKPRl
 CM0Hw859N9uP0V3zcYtLBzPHP5qY1R95J5cmbKFPdiNtOMJoIeYcwolJyZ2bhztIBdKv
 YyBLQjTjJweFdXM83duOH2YCyBQfLCrKg1aYNzV/108WkqXKA/KLWKYZ5pT5bPb8u0XB
 fKiYwnGKjP9gF61tPqzi1OfHAtLH2cCtlRkGFFBiUGsBEVrISDSZqSJ5Eysw8qbfECR5
 q9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128104; x=1734732904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMDHENqu7kX5P1n4SJgKmKj9EqxeCNLadyOWWcHQ94Y=;
 b=tqf7/00XyvnjEFMhd8ngU5kX/rLoTNvu9N7HotJCmpkd7GdkDsge4PzZ2pmvYqzR8l
 TxY/lkNcTbcovoTogXXqFd4e4C/x1SoCKmKprU0k5k4+5aLtPdWC0KF0GvR1AdsU4HpC
 tbbS4pVDx4ECLATD+26Z3Go1Jrpns/EYJj/aMGSFke6RqDLZ6y9Ky2rPRR+RINw2iQBN
 p9vBG6TI6I6XgLifMSMuoShxznrAiMWhqK4dusNnRpe7rr/RKYHEra0PJNdC7wiW1AiK
 xWmj75ruyJCCMUbaY2fqnPyMPO1wohhDB2IURLYd0/mKn4hTWvOnRWJCK4V3eQbp4f59
 GYnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlddydR7vGw5Obiu5yoVJZPB6naH6GbXYDOfA2ozdzBiDVV6Xhn9QLHCfUQ+HL3DVMZ3zGVpd7ZO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYoQUxX+T9TfSZpbaY56ZbxSp1JyNa8I/NYb1wJ0NnTIp9sy8z
 /Ov+ogs7r7b1FpieKpGWp2C2zI3M7ue4RPfkDWWyRac1+W8fveCOedNMto77krA=
X-Gm-Gg: ASbGnctDamKEbODHVMMLVoNJN7WCEABYVzwl4aIXrQp+plqUOnPBq1SHr30RRnj39iU
 xfkL6HDXrdgw+sAtdXaqI5OPcUOE4xxVUpmhpDA/kOvIa4nHamKPCI54Xsjjuokjo1g8S9x5umA
 dtAB42+fWQypyM+Z6nj1BiKc6G/d1Te+45B4MTijr4LLWFkaEkK92pVhU9bSWy2E2a7/rXA5rgZ
 lH43DNUjkN0SWT9zfYMLHY0YqmSfMzs18KE+B7+hC70TwAC0wp8a9VPu7IAEQ+S
X-Google-Smtp-Source: AGHT+IEl8R1cmj28OPLFqtiDWg2fB94ckYMMQdIX4ec28uNnZF6M5HtHbm5Uz48+fA+MPXvUSkLa8w==
X-Received: by 2002:a2e:9dce:0:b0:302:4115:d56 with SMTP id
 38308e7fff4ca-30254492809mr12696231fa.13.1734128104098; 
 Fri, 13 Dec 2024 14:15:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:28 +0200
Subject: [PATCH 12/35] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-12-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MZhjCNwgWizVywyMX/aJ+JSvvPCWwwXZCcDJjCNcyas=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHFk7XNLSsikl3gO+dbol3RCYCaIpN3fyqbB
 n+0ouH2DuSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1fu1B/0e1SGh9FmaT21JoImSgvZZFpx5HOY0KOYre847raa5UJHvL9CM44S7t7gZTh3AAdB4YS8
 vqNz7sgaBDuaOmt6nzTTP/BikF7X3LByvHuI0EiDxjgORmYsYQ9ViM1zzvAAfZZ77WjyAVMrutL
 UzAxz1/lPlvNurYDSIvXXssjZVz2rGAuw3C16x9GJztdRaqLT3MQ9xxpuSh2DRp9AtRBVblGOIF
 3rdG0f/gN5OVIacz8O27JiLfk6ZsgwEs5S0IeBtZMwmQvj1qSyuHNduxFbEgdaqw5FhWhWAg/xI
 df08TCmAM9P+xySxSA31KURqIV2+edcOUKyZLPk7N4mq2yL6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0b6b4313f8acd76e8ae1a0849127466491e8f108..4b44e4d8d13631b6b1a8824b12cd8d5bd4ae7e3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 83e0a0905d7ee59a2be0478865bc515c3c7e193f..1acc1a7d0a365e511d5b6d7cc236e1c28062c76e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,14 +134,12 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 59d25916d2d412113768d71a76a6aed4c879299a..f0dbb00737df2b4ade540eb440cb3ae0baf7c153 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -758,7 +758,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 
 	c->idx = cfg->id;

-- 
2.39.5

