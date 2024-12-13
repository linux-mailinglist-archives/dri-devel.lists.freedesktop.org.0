Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAF79F185B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4E010F0ED;
	Fri, 13 Dec 2024 22:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d1yabiiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537F10F0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:42 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30227c56b11so20666841fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128081; x=1734732881; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SS2q6SbMj1ZTbJ13IzwKMNH0i4lebEKtIyHTzThKnfU=;
 b=d1yabiiHiJjsTC9qN1MjDYNjY3cADguIptz3rsE9cchJNZ7XkzDYD7401JYQ0sH95C
 plY/Q8cQPXDY4G3cHo6vMMV0O00MPYsKWk4i/5jQQU/NqFpq1GL1+lGBiyROu0WJ7Fxs
 rgVIRP+m4lP8NNfL0dDK94sPCEj3otwH36QsKhcAwgdqAd1jWAaryqzS4f85ZJgJI5bI
 vn2paSZ6lOIc60lszft3feAQsymCqLPHwxt6lkfUfys93ugxXsZFkOGFvKPD3cPd1xWC
 GOBJ1sBsFSAoNY8EYXAXEKUDwpk9KU9+6l7DRGzkfLVKmkQBl+MX8EASDaF9pSUcTfuR
 3rmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128081; x=1734732881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SS2q6SbMj1ZTbJ13IzwKMNH0i4lebEKtIyHTzThKnfU=;
 b=aJoLYUopqkXomNqa3lhgjcT02SvkFvUJmCjQ0HDanshT8zRaZ/5aJfB5V2vflgzGQz
 DYCI5JM4XgLq9gxYJ9vZiaYAXew2CLAwfIg19mNc2HI3iK+1Fe82XDYijZGUOq9ijnlR
 rRJCW11IbcdZf28vKbWKFW02zZAS20SM+SybrbgwqexgsOiMW6V5DMthacqK9yjALzN4
 lZ9pnZdGmG5DhE8yhAJSKdRBvgHR5F07NU9HFvECc6JCxaMLUl11guqgYkBhCZosJb9k
 PIdKB1xTaM/oaLxMfccVAhWaHtQjAAdHEWY8VLYYm794vTDCuBaGpu4T6Jk7n70E99w3
 fjjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUijXDJVuyXdUpi05MTKfRZvZLLcRkgcfUtwT8P+YON8JWqLmXTais79EnZ3pvt37nuOIG7FJDnfXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSnq+2Ptlm3KeXGxFsXw0EehkYjq2kORp4oMhyEFPv/fcmwiZM
 0jsSrqr28Uxj/wKw4Z9DKUWbfYC0IoVoXuhWHuF53k5GXR1TmtJxD+mUERhF7gJb3Oh6gSLlCrG
 n53VPVA==
X-Gm-Gg: ASbGncuYNjbgE+pAKBI8O1Gqe/g7AS+DBeHsTVVIlK1Ckpjii5mo8+a9MHTXZzrolDI
 kMeUKG/P3nTowDVCJohDIvXEbqOGT2BQr2/npC5Os3tHqeGKJvx2yUhSTvgA992Qd6TzyHwHK6s
 le9W39JkVEi21r6677PMRahwk1kZwRPEL6+RL/E1hVS5RxCcnxhDCspvC74blYVlpquVCuJuF8E
 CC809YgGtY3RzallRQfIddfyNEHJen3VpwLFD7FhRo1PZ0/KLep1IRQdiv4WQ5/
X-Google-Smtp-Source: AGHT+IGBrrmVvJpDS9YnfpMnSUZIzb0HQpXo8t39QqwgdvfxCK+0fGZtdWs7xkbeRDeRZbC/luGPuQ==
X-Received: by 2002:a05:651c:54f:b0:300:3bcd:8d05 with SMTP id
 38308e7fff4ca-3025443fe17mr12039131fa.15.1734128081219; 
 Fri, 13 Dec 2024 14:14:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:18 +0200
Subject: [PATCH 02/35] drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-2-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GNnQV1MNYWFcAq1qZORvvRE/j1G3voHyTrPAyGRaLUk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEA5DUeYaLc+ey3XyG98NY4C1Mfo1wxlQDX
 Kh+ikM4mTGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1df0B/9jBfU+GAj7fHZZuu5Uzn7j6A+6HyeGnzQgDgIKMA3DCJ4VPiPdQrLzqbkY6ZVlCak1PgZ
 E8G3WR7iRTXyTZV5IItcHihX52E53KqKnlyulREA8n8O5e8yWJw6EOgKyMcYdakKDuN9MXnH6N0
 6eHYue6PB8/IBNjXAJ6kEoG6SYGNE5Xw/fm8B7ecSm5HGXSO61ATOSKyFwyTcBTkORx+bwhY0/N
 GM27xVBM96M+LSM59Gzr8rX9cHve+5DC8CY2+rSz1EKNsbeoSWkioMZ+x9SC7k7qWnzFpW6iWeU
 VuMpVJvY1mZbQcKjZM5piAmUpFCtz1CwCfjkzo5u0fRpWMKs
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

Several DPU 5.x platforms are supposed to be using DPU_WB_INPUT_CTRL,
to bind WB and PINGPONG blocks, but they do not. Change those platforms
to use WB_SM8250_MASK, which includes that bit.

Fixes: 1f5bcc4316b3 ("drm/msm/dpu: enable writeback on SC8108X")
Fixes: ab2b03d73a66 ("drm/msm/dpu: enable writeback on SM6125")
Fixes: 47cebb740a83 ("drm/msm/dpu: enable writeback on SM8150")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..6d413cefbcc1edaa5fe73bacff4ca708f0e04902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -295,7 +295,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SDM845_MASK,
+		.features = WB_SM8250_MASK,
 		.format_list = wb2_formats_rgb,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..2e833e638a0bf9ffa6ad1ae16466e1963f26af1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -302,7 +302,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SDM845_MASK,
+		.features = WB_SM8250_MASK,
 		.format_list = wb2_formats_rgb,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d039b96beb97cfeda629ef2546902f7281c53543..76f60a2df7a890c5346fe248d67d646ade574fe4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -144,7 +144,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SDM845_MASK,
+		.features = WB_SM8250_MASK,
 		.format_list = wb2_formats_rgb,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,

-- 
2.39.5

