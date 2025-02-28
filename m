Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4AA48EC4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 03:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D290510EBDE;
	Fri, 28 Feb 2025 02:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NBdmBb73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33710EBEA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:40:51 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30918c29da2so17735321fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740710450; x=1741315250; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ivKSxnQ8DB5AtKJZbKFIHtIat0403ancJcDyUvz/X6g=;
 b=NBdmBb73jLoeDLSoifkXmO2/Zi/nF06vih0noJxLSZhH7r99v+EYWcYJK543J0Kto/
 YS/G6Ru3raXiAYDtLSlynwLsNkdqkWTqERBnVDztr+G5NxZQApFN1MUgO9BJIkaXbEvZ
 eDuOVGSerc14IbDInIJH2w8bGu1r32IBQrok+YL60fgovJBhYda6D0K9+sjeH8uxd4VA
 DunDinCOXxYSyhGUbEaaBPfIbdbeFylPofbgigrNsF/mKYOD9UhtFlg7d7jYyKgEAS0m
 NNRJf3WYUErbAoLCKkoqe5osCkn9aOO7ykrPO1XkcHtUII1TR9VoSjGAoWcFj+o7GTCk
 8wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740710450; x=1741315250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivKSxnQ8DB5AtKJZbKFIHtIat0403ancJcDyUvz/X6g=;
 b=Zr66ywtQHu0aXnlEVpjZNbgB8ojetWs6C40HgyW7tKij6n9LTw8G5yBLdM+t99bKuA
 W1IdI7Vv3S/+N3YAHBywGjhh5ODu78gfvyyWnR2seUH6/0PB+fPl7+MP6kwy/w0UMmiL
 zPLGsEt8wocxIwf/bSJaTTSZbXBk1yuqj38vvNtoQQpQOe+LLlwsweP59XV7rjwjmc/0
 +wkNYcvCUv9MqBEu2kkci84aLM6Vh74C9OP2yN+xThmjJKJnU9n/AlCeYkADsvZynZnZ
 QYSU65IPtrc4KfX7sSdC/gSAdrygRrrJsU9CMLhKY+38pQGBfr+wDVOWoiryTozaTS0e
 sgdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVReIuMtL8ARhhzxUYlaUUo51mR1Ss5noK6E0rDK0aMBcZp3wvGTE8snaF659vcqFZKx80wYiDc1DM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD091yFCKiTVyAFX9i1d8KnvIx+LQ45yGl0rw5lxKh0PuJEB7n
 KhSJtsd8/x7DBcUjPJ0yyDvsTzFHLPRQS85IbnxfEBI5WI0lNzAYq6gB2T+RHbo=
X-Gm-Gg: ASbGncv9+acSSYUCDfHZPIZwXqakEKENRbqpAZdZLwSOP1ha7scI9iL4XaaWB11D6fw
 IVe1TFiAlpgT9QwWUdAuq72cXfKxElwo9r19o2a+COGH7ruG4U1lgCym0ONzCQBo+EdTdDb9TjB
 7+WX9hF84GHQiS8vm7UAGcjGCmftnaXoNmOooe9XYmuKNtisu8B1cSTu0+Yko7xOWYwc3bCGnM+
 dKgoMgiIYFn7fvCT/3S+ZUzRAIw8wg/KXcAy/7xckrGRhPSaHjxrXbukXaYZvOFFOJQ9J89bSRk
 r3Z76QY0JNTpverxvaDlBsblvYevo7J+pQ==
X-Google-Smtp-Source: AGHT+IE/VW7ZgoJU2q0xpHj7pO/LeLZ/mYSQfo8wBTmKbg/dVc3r8HWfV/LWuQdxsmOFJYHvOL8c+Q==
X-Received: by 2002:a2e:97d7:0:b0:307:46f3:4e92 with SMTP id
 38308e7fff4ca-30b9330f002mr4041901fa.32.1740710450233; 
 Thu, 27 Feb 2025 18:40:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:40:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 04:40:40 +0200
Subject: [PATCH 3/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8953
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-fix-catalog-v1-3-b05d22fbc2b4@linaro.org>
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
In-Reply-To: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Bwi+iwgQ+Rb+/es8x9Up9adCN7AKO6f7tRpJXs0LvbM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIot0dlLqcggIIEO7ccmseCO13JHyvnyniPc
 KESL6DNx4mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKAAKCRCLPIo+Aiko
 1TM3B/9mVqc0uvziUX3Tfx76243xUbsqYZITOi2QiWPJ1rY12KtI28dI38UK6LtJWufHmCVOv6U
 K3AteEANOCQhfsWEAcc2X5OoZLxbhOC0PX5mWxhIa1fBooxOZ3qJ0iTaAvLiM3N4eMfpexuwqKQ
 PiYlKCoUFOrBG5pX6W8t3ttXhit7FqPVEl306MqBHnMqsFPpLiBkkXxgGuSJN/xSFooM1RyAyHf
 oYvC6CZso81Yl2LlxQUj9SRozPVfA0EWn3N95cWaO7sxGhw26E0x1MWmFvAroeaQoSOOeiq8PGm
 +hajaiNPw/XEAxGFtru1VBOvp1FxPigWInofMvhvbmctpgb8
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

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..04f2021a7bef1bdefee77ab34074c06713f80487 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),

-- 
2.39.5

