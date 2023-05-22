Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4E70B294
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 02:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49FD10E21E;
	Mon, 22 May 2023 00:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9544210E224
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:42:34 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f24cfb8539so6207399e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684716153; x=1687308153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjsGNJla9G3GgMPdPXPf3/qz7vkeVO+bT5E570htg0A=;
 b=SEWQ8QskbdDRnJQM+gl/lmH4c8NclKjrBZf6ACm7SaVIj/+gG4FIqLWauPK+RRGCv0
 cn8In86m55DrvFRgEC7dnaruOlIfuO/2lGx5xxuD82spjMNrwgMS3J9dvgg0cWLjGQz7
 B4brWwyUFSvOrnCJ6Glr6Jqho4Xxk3rXsEFiX45Xc7inkPYVEZ5eiURIOi1Gbxt6DbNO
 L1K+NAJGDBbfiJgUVsu8gg9vLsKi50EqowiOg5qeklI1HPgDwIRsPoqcka+9lN3QRZv2
 wIUxzDVpxEeHc/R079JSayLdMs3PzZeQ0GvofnkY2vaae8pbeQFt/Mjq/iI6VeUWkqKI
 uPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684716153; x=1687308153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WjsGNJla9G3GgMPdPXPf3/qz7vkeVO+bT5E570htg0A=;
 b=kU4gtprgZBzxJJhYhQq+KakCQqpKE6EnJ8qQoH1QjFayu2WT4DqLKfQySNEPezfHWA
 ECff3xfvPiCf6+0apV8/9w6jLZ3Zl0i6Q8cDrROcG5FGEePFvzrqUl4zIAmvBhcOis7e
 DR2aauJglbfW8rdBb/ALe+qmrtjZ2euTLOaSEnoWrT+4d9v038H1H+iD8ys1xm9kTx2h
 ApL5Ebt0YqlEFrI0CG9mcpyFdspvb2qoTyzn5e1VxbVmhLebwA0pOPizaRUx7g4YchBA
 ntZEQD9HETmSU7MYGFGMDSDqAN0X6NocieclX9eL5Uo7LiNG+fSf7NkBVZdWCCzkn6xD
 vQvA==
X-Gm-Message-State: AC+VfDzXHOs9hoEBe11RtwqoFShJgqBaaoDu/dWEn463uN/dDNY3dCjo
 2oMVblU0+LJFo8l8NMOeE0uUTQ==
X-Google-Smtp-Source: ACHHUZ7Uen60d+z6+INv8NS9OGVW905Zn0nvDk4z12pTw4XkY3mAOoKcfTJ/gu8o1DVQMCdpCWRrxw==
X-Received: by 2002:ac2:43a2:0:b0:4f2:5393:b7c with SMTP id
 t2-20020ac243a2000000b004f253930b7cmr2440197lfl.67.1684716152907; 
 Sun, 21 May 2023 17:42:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 17:42:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 6/6] drm/msm/dpu: drop compatibility INTR defines
Date: Mon, 22 May 2023 03:42:27 +0300
Message-Id: <20230522004227.134501-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While reworking interrupts masks, it was easier to keep old
MDP_INTFn_7xxx_INTR and MDP_INTFn_7xxx_TEAR_INTR symbols. Now it is time
to drop them and use unified symbol names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h   | 13 -------------
 6 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index f9e5f252ae54..c64b6a7a30af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -160,11 +160,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index dede8cb2d784..98623388badc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -106,7 +106,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 79ab2d015a44..fde9204c2c8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -150,11 +150,11 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index b0bc88136e86..3821cc465c47 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -168,11 +168,11 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index afed62e44f90..f35671d1f2b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -172,11 +172,11 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f0b92c9e3b09..4a46c0900e04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -39,19 +39,6 @@ enum dpu_hw_intr_reg {
 				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
 				   -1)
 
-/* compatibility */
-#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
-#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
-#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
-#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
-#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
-#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
-#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
-#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
-#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
-#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
-
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
 /**
-- 
2.39.2

