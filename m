Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC29F186F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514D310F0E6;
	Fri, 13 Dec 2024 22:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fL59/nFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BC810F0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:03 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso22300271fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128102; x=1734732902; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fbPN53G1KjqDTRTUkEKhdUyZYDzculmTDlSegZURl4M=;
 b=fL59/nFl7vYgWjyDlNaZe6GxoRgC+sZvhz6FPyhpTRfLW3Y9hBTWdR850lFCoIWh4D
 OA9SOA1BvTtSbrMm/AF+CpF0fvzvI+0seixbX847O+dtIGe4Ph0kX4NyYXe8767hE4gU
 s7sksV8UPTOo0v001FJCulVYZwyIQiJA10Nb7//tFaIGFAE32XCG0iRjdDVn0/PPneq/
 gPb41lD7sgCkmKkYnFxaQh0PaodUI6VvybZ6HZ5AlwZTpYRa9+mnXPu7f731ivR36R1U
 ct3UhshpMOUOMxZY0iODEcO/rM115vP1ldL5rVbWzHuOhAyBMHQtayD+UbHfeMzLxR+h
 l+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128102; x=1734732902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbPN53G1KjqDTRTUkEKhdUyZYDzculmTDlSegZURl4M=;
 b=HPAHbwsfm7W2Qc+JISarImf2wDNa4nHxkqFzFmgPgV90ae6IfcTxr1kgAk+Tdum3Kq
 kpvKYcaYbIxthjOhR+N0SO6uCirBGKw/zDodk6fLvh3Tp0LJtNDrUeDXClo4eJo+iKc9
 cnkTt+5+Sf1vGy9Hpy5Cs/aKnbEwMG5y9ClrqzjVEALKhSOxgIhmnbUzAkL03eZSZs4d
 /XYVOtPC1S8koChOhwO63UynKUGy0+/J9XXK9kHBvl6fZqC9Ehevl+ZJhmmxGYC9TG52
 IrgROEuF0xaJ0c4Ahd4jDiRVIlV5+oeQz+Iy/RKddqYwPrS1D+VPAoll4PZHYfaFWETf
 bO0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcoaCrgmObM8eYmxKfNF6wL4azvHMGFS/Ak82ek2wyisR0tcRJGmDQJt2zYVKzezHsaQ0j9mBUETQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2kNZMx/v3H4eDxxSMDbQ+Jwj7c3Cr3X52lfl4vqk4prEXomYV
 brQOW3FTE8zmu5wN/T67ymKPA6arAGiHpkKgsnKjp50t6z2T2IUUy1lwQ3F/rBE=
X-Gm-Gg: ASbGncsKkr6N39RpBcaulkiLNIAnjwcd0tv7BLOjFmKPFX3RS3akDulhHdBrA22PQtO
 r0dw6wGt7oNpnSP+WASFZEhdC5XG541YxaXPC7Wzlepf6fGe3Q8jpvEbRs/ArW7lUp4EZcUDbCX
 sXwwl5WqzQcz957lKjUOp2WWWDzgTQ0wBGCKs46JiJsWvECtrsxad1Ao7Cy6g8fgp9TlQtnSnYP
 HkmfXcByE9W4XcTaxjz4+wiD6ZL9FUjRp3XFjN8N7cRGW03NYK8gBhdhsN+NBUx
X-Google-Smtp-Source: AGHT+IHfgibIVqe5aK8fn4bj+jg3hqZX2VcCJpb8VRSH5Bh8Z6FecTKn/PyJ4qAjzRDa8vBFa/TIXQ==
X-Received: by 2002:a2e:bc22:0:b0:302:40ec:9f92 with SMTP id
 38308e7fff4ca-302544cf982mr18299881fa.32.1734128101806; 
 Fri, 13 Dec 2024 14:15:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:27 +0200
Subject: [PATCH 11/35] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-11-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17371;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iae3Czoa9bonCK4whH6VeL3UcN7SvjWWvIVBG40bQ5U=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rMxqO8Z3nqnzlIfLKQKDln+Nz1yq6tQhem5up71zKXT
 9JPbZfvZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEvDZwMKwKjfxyv7dpi9Ss
 zTbM8o8F6nI+JJp6cNdoSEl+emQzSbViSVgZZ0u3fx1L4wRTgclFX/ll4l9uTFG7+9O37nIWq9+
 VL/O0Hl61v6v9k9cpyc51wsuWLdavJrw38j7lrmTBnfLN2Ln/wNu96lry0Yt++1ssOSdokS/26s
 qBd7wTZRfxxMXP+lCUcvHX5LYFXgFqVtGh4l6nfOxbN3jtmGUf4rVFvmvf8/RH3gYBzxXe5KjPf
 LCb/9La1ynebRcyfR7//nz7kvPlT/17hOvP9S7nXRzzJKtzZnyt4num/VL1kbqd3pr9f2RCVVZd
 WGyunHRDZZFia/+m01uY/mqdbri6X3zO9E1fNKNKxRljAQ==
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
DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
 15 files changed, 13 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 1c439a27ddd6be7ee0d0cc0d4c9229b8616c21cb..7f83ba35fad21365bcb2a49915af34a909eb521e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -42,32 +42,28 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 85ae553c087137c10eefda0f07dc3a889c2757fe..a0192ea7cf8e893d9f2d632f869d9757e502d236 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -41,32 +41,28 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 73b242a28d5019b2cf76c7f7c77f4155742e1fe7..1ae6eef17a1b03fa89b53e62e8fd4b4b26d47aec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -38,32 +38,28 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 4840b384f256978ee83e8ba7828ace5be9263a46..499ac80fc5196dd0b76e7bb2880be93adbf032ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -35,32 +35,26 @@ static const struct dpu_ctl_cfg sm6125_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index dcc16f84da552d346f4c7e96121d0c7b1ba5f197..a965987ad4cf686d54a6d4df0b6ab855146b9e87 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -40,32 +40,28 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c17ce0a76b2dfcf36d1fc8d235152cfd03a73385..6fd6055e5014ff0074374a46fd7152e89b2e383f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -32,17 +32,14 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index f8164950a0f7721643eabf5cb2bb7a5e3bcdfbfa..01e398add3c45a8bc504da5ca268df0487462113 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -29,7 +29,6 @@ static const struct dpu_ctl_cfg sm6115_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 3145d0373a425a939b5b12c8f5cef804b2409f58..e35b5d47204d7aa24d3521bbc9b0de3efe92090c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -35,22 +35,18 @@ static const struct dpu_ctl_cfg sm6350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 6d424a4fd60bd94ddc0374466d86770138b2831f..94dc8726199a3a48a64c7dff58bc62e6fd097c99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -29,7 +29,6 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index aaf4b270f20dcc5fb91fbcb783c6d3bc673894f5..2b2b9417e23950425a72f6dd44baf824b5a00061 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -30,7 +30,6 @@ static const struct dpu_ctl_cfg sm6375_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e9bbccc44dad8b391cd51daf902307105b2598fc..e16b0a0c57da4a1aa77064ca2214e37cd9ee4baa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -66,7 +66,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
-	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
+	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
 				phys_enc->hw_pp->idx);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4c006ec74575b2829265f0eae5c462af8d491621..675514dec40872d5adae59e13c2e900cadaa191b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -213,7 +213,6 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb;
-	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_cdm *hw_cdm;
 
 	if (!phys_enc) {
@@ -222,10 +221,9 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 	}
 
 	hw_wb = phys_enc->hw_wb;
-	ctl = phys_enc->hw_ctl;
 	hw_cdm = phys_enc->hw_cdm;
 
-	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5 &&
 		(phys_enc->hw_ctl &&
 		 phys_enc->hw_ctl->ops.setup_intf_cfg)) {
 		struct dpu_hw_intf_cfg intf_cfg = {0};
@@ -526,7 +524,6 @@ static void dpu_encoder_phys_wb_enable(struct dpu_encoder_phys *phys_enc)
 static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
-	struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
 
 	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
 
@@ -548,7 +545,7 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
 	 * WB support is added to those targets will need to add
 	 * the legacy teardown sequence as well.
 	 */
-	if (hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG))
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
 		dpu_encoder_helper_phys_cleanup(phys_enc);
 
 	phys_enc->enable_state = DPU_ENC_DISABLED;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6378e99452c8046f01958a96342f545c754ba8ae..0b6b4313f8acd76e8ae1a0849127466491e8f108 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | \
-	 BIT(DPU_CTL_FETCH_ACTIVE) | \
+	(BIT(DPU_CTL_FETCH_ACTIVE) | \
 	 BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f5c40e25ce0974ffe76622b42bf8fe6db67c1a0b..83e0a0905d7ee59a2be0478865bc515c3c7e193f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -141,7 +141,6 @@ enum {
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 5f9cd09589bb403746d48af6f8555cd224bf3195..59d25916d2d412113768d71a76a6aed4c879299a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -716,7 +716,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->caps = cfg;
 	c->mdss_ver = mdss_ver;
 
-	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
+	if (mdss_ver->core_major_ver >= 5) {
 		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
 		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
 		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;

-- 
2.39.5

