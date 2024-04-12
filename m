Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62CD8A29D2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 10:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C206110F0D9;
	Fri, 12 Apr 2024 08:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N59tcES4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2A710E7A7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 08:53:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516d264d0e4so1747138e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712912010; x=1713516810; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YxatRE/93mGsglGJYCl3WbRD1jFFlo897Trav2ySzAI=;
 b=N59tcES4ZgXVSTvIV4f/k6OrQ1U474ZBNjFx2dIirah3bZT8yinEawyGClN9gKOomp
 8ti8HpPqv3DifIhJpOWV2MarNQdEhRRfaASpXNz9ACk8j4DpA4GQLyt+E5GA9fIrTc6n
 laHcYp0U+qwyRPQW6UUayFSkIbR8u3vpZ/OkZ+AJggslwcIce+tcXJoyG39fASwdpTHc
 PHh1vV9JqIoPElbFx47NehBD7NSdLqddnyczQ70sNTB0k70DPa7sjwstEVx3pD8Bu4x/
 N0bB2qQH3jEDAmeibtJVvtyBBZmpWU1idfdPwQufHvbSwDcjyxs2/n82Y14JsHLKO1qz
 ILzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712912010; x=1713516810;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YxatRE/93mGsglGJYCl3WbRD1jFFlo897Trav2ySzAI=;
 b=VMpXDYplXh0X6nZaL+UAjn2jJnXZOtdGbcJyDyttO9POU+0+0yBPQuXicLvopDQtFI
 AXGcP/sUSIFADHak4xQB1kOef7zTZgMBIc82Wn31Jik/7j6JnOWMtIzR8hIpGhuU5EDN
 THjCCv0Q6FZmt0REevohzZ06JXRnqrYrhWbQVOzEOGmyxtnEcU1labGyIr2CwwzjfTNb
 RYHADaTWOFD4ZNTX5g82JyvsX27fWaoEiE+ZDdnDUoM+AQMuqB7kN8PMPfTEszBByPxv
 dvozENKIY+ts8gL/X85pOAwARnubMe3+sWeMgCxj+KowZfu1o/zeH7Bhz3V2MrmavJZk
 soJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu8uskN1Y8k2OS6WK1pY+zEGUI6qNaGxZwAO5r7E4c0QDwAIWLoCjq2JhJKWajKwN6abAh780AJbNKaH4g+B84C0194jxeK/aZxADXSiVd
X-Gm-Message-State: AOJu0YzdWbmpLXsbFyh9Oi3DIew7GxDsWYBDn10fLhRAskD14F7XSpvs
 tvQDAIy7vD4KuePr16KhPWYXYbks6hEctrXU+ZDy7/v17RiWHGoUY+6M3AaUMvE=
X-Google-Smtp-Source: AGHT+IHjgkDtt9V366P7Lg32vys821kGAn+wZ3KJVBrDfDCBQOWLQL30EXbA0v1fE9uOESGSbmyVxw==
X-Received: by 2002:ac2:538c:0:b0:517:30a3:d000 with SMTP id
 g12-20020ac2538c000000b0051730a3d000mr538477lfh.28.1712912010091; 
 Fri, 12 Apr 2024 01:53:30 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-133.pol.akademiki.lublin.pl.
 [87.246.222.133]) by smtp.gmail.com with ESMTPSA id
 u9-20020ac248a9000000b00516cbd3e982sm461779lfg.178.2024.04.12.01.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 01:53:29 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 12 Apr 2024 10:53:25 +0200
Subject: [PATCH] drm/msm/a6xx: Avoid a nullptr dereference when speedbin
 setting fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-topic-adreno_nullptr_supphw-v1-1-eb30a1c1292f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIT2GGYC/x3MQQqEMAwAwK9IzltIa734FVlEbdSAtCHVXUH8u
 8XjXOaCTMqUoa0uUPpx5hQL7KeCaR3iQoZDMTh0Hr11Zk/CkxmCUkx9PLZNdu3zIbL+jcUwzk1
 dI3oPZRClmc937773/QDRbrr7bQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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

Calling a6xx_destroy() before adreno_gpu_init() leads to a null pointer
dereference on:

msm_gpu_cleanup() : platform_set_drvdata(gpu->pdev, NULL);

as gpu->pdev is only assigned in:

a6xx_gpu_init()
|_ adreno_gpu_init
    |_ msm_gpu_init()

Instead of relying on handwavy null checks down the cleanup chain,
explicitly de-allocate the LLC data and free a6xx_gpu instead.

Fixes: 76efc2453d0e ("drm/msm/gpu: Fix crash during system suspend after unbind")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0674aca0f8a3..d10323f15d40 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -3058,7 +3058,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
 	if (ret) {
-		a6xx_destroy(&(a6xx_gpu->base.base));
+		a6xx_llc_slices_destroy(a6xx_gpu);
+		kfree(a6xx_gpu);
 		return ERR_PTR(ret);
 	}
 

---
base-commit: 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
change-id: 20240412-topic-adreno_nullptr_supphw-10dbf5330044

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

