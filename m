Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA44F9E5922
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC2A10EEBA;
	Thu,  5 Dec 2024 15:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HgAF6Cpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F4210EEB9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:01:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-434a10588f3so7075175e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 07:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733410887; x=1734015687; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
 b=HgAF6CpagTlzpJxl3AUi8We7O+vrBzC+ZzmurSEpLexTNjEyhUuyR2yjF5s+qG6C/H
 +igZFWs7lUlFeJms8SFNETfJwoD1Bgx39aAtdG+KJtML5xyueueV9pFDPdq1mw39KqNM
 qpoV3lYNoEiGP0Bs07tr4IyvEJ0Dg95fXBLMtSf4dux3DR5qTSWPwzKxZWpOXFc6eVRv
 IisC9ItGTf0KgaBlvO9xXWA22wEGTvrp9Upxy7rsX5q1BkwCHIrzM8TrVgenC8YVaGqB
 lQW4jPqz+gB0kXaIQ1u48n1wYuLifQ2nq2pHUNWHNL+U+UlDvXcjC3mmEkpcXAAaEGGi
 7AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733410887; x=1734015687;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
 b=BIppJ1f4Tn7vtgkIv7Wr/o577JDXyDLvTVjIvtfWaIJLQYdcehaVehckiUc8+STF5r
 vEGDai06yWqWwS1hGPwyy1oZK6UHRKJTJQRpNgEy+U8go4xULj9tuGd7xVRRJZr/7/gi
 oyseZ3rryoZYHVr7JmvCuPr5PsJ0o7di9pSN1V9cUpeNHcFzyKmb348FN/Gm/iSRxFbd
 ZXb/J1p6JLJYtU4XugJf2B6ymreBpqZidFyvLtf8U1JPqMsH3VlbCosnTkODbmEPblFi
 sZudysKIqGblCzTZwF6LS+n6KEXkdethGiAOXVguaM3H7D3A1HwSNt5NKYQOPtskZXFl
 UTiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Pac56dKgPufJ4uFiZG/WpbA1jqthESiWb12YSxQMeOn7YkMWLWbDz8DdeloC2fMPmsbS1+MCLv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBXzvrYlztJgV6Q8NKOcePZM50cftUMd5xwLwIwuNbTPdw7aeb
 SkowrtoXfUn3lCdLRZ8M/Oew8SOml76sza1A++hFbqiZJht1XGEfIYa9bu3F3qM=
X-Gm-Gg: ASbGncvuOhsopbyY3lCGQ8ZI55Vv0eNMyEkFghaU6PomCdzBGxU5Sa9QKugQtzQSCtO
 rNzfFltq9zP/T2P/hN6+Dqat2D1F/3LqSbELm6ZDCIJdzmmceNt1GqxeEDoojbBnB6Lqk37B042
 QGHiyn+pzCQMMR66BlkNZhiDgd3VTWw7+xzRBUa9ZpUsmh4nMurZpDilRNrHhQRw44HETL+9C4d
 0r7Jyp3dpMya3NLywCW5j+KCRpH3ri1pKYWhbDQaEtcnn/TrnxS/cOayV01ch3PSj/mkvA=
X-Google-Smtp-Source: AGHT+IEN4o+Oox5ANVYMM6enY3uS/sHjTMeJBzvAdOgxkjHoFq8gCfsd5ag0i0sigeASyixlcr1XHQ==
X-Received: by 2002:a05:600c:1906:b0:434:942c:1466 with SMTP id
 5b1f17b1804b1-434d3fe3665mr70571545e9.29.1733410877656; 
 Thu, 05 Dec 2024 07:01:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 07:01:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:05 +0100
Subject: [PATCH v4 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-1-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uvbHEXTw+a2tX2idu+ViK6cwh2GKBsinSbc9Nbsj/3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA3bFRWVZyYroAh7BnbdOr16taWEJgG0OfOdkw1
 q8cOaJOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HANwAKCRB33NvayMhJ0R9oD/
 4uwOe9t4JiQcOr7JaHYVYqTinY/nVh3yjQKUgRsMDCw/y7ZR2XV1LV9N09Rq9DZSgt/II+yiXkuRAT
 bjxT/brdEgeEjTkEcQItDtvySc51oJEYdeq1kCFqb+1XnhbEbNYg2DsZWy/KM0sV4vFOwt+1VdrckQ
 5+Yh0UR3w1PS8cpD+2WfcMEH8fc3vjJL4HaZJuF+SbKLzLnhExUAYu/sCDEPAG3iaZCy1Tmztf0Zxa
 nvph5tRyDl4oXzeIjvnFadXR9r9Z3xjcu/qy/kANOFC9k22biOavrz8tM0QSCb/Q8lIR7WqomYsV0+
 Jyi+jYMSlTJCeM/4JoUa9x02PN+FrgtY/YvTt5G5NVhIejgBbYNvBJD049qD+86etVuoYjJkP5IDR1
 WKZ5yatzqi+8mdu5oQefSQp6KXDE3z8szzKgr/0XxzAAz5YLhlOPSfLsOnF6tVYOGlX6MvySsaHFry
 HCOmlUYgOFhvl1ntM8Vjqk8wHNdD9wE5vWYHn2jGDcAcHBX9UOzaC1jMfuNWJr6SxuPY0uwA/3M1pv
 /dvujdKWYPgd2FAd9A8bgW4EMFRWYgs3cPHLxW2pk+P+4trvAYXIvhoePzUHFIPiXY53O8DAuEbZ4z
 hxA38RK663xNZEgIT/rRW5WEpljwbsmHMXkOtAkeDeipXVw8b5WjamtYsOWg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Even if the code uses ARRAY_SIZE() to fill those tables,
it's still a best practice to not use magic values for
tables in structs.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..88f18ea6a38a08b5b171709e5020010947a5d347 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -19,6 +19,9 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
+#define GMU_MAX_GX_FREQS	16
+#define GMU_MAX_CX_FREQS	4
+
 /*
  * These define the different GMU wake up options - these define how both the
  * CPU and the GMU bring up the hardware
@@ -79,12 +82,12 @@ struct a6xx_gmu {
 	int current_perf_index;
 
 	int nr_gpu_freqs;
-	unsigned long gpu_freqs[16];
-	u32 gx_arc_votes[16];
+	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
+	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
 	int nr_gmu_freqs;
-	unsigned long gmu_freqs[4];
-	u32 cx_arc_votes[4];
+	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
+	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
 
 	unsigned long freq;
 

-- 
2.34.1

