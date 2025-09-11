Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44409B53220
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DE210EB01;
	Thu, 11 Sep 2025 12:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZizvmaTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1204A10EB01
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:29:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3db9641b725so603154f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593763; x=1758198563; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FYKFAdjOYASo/WjabAdPI3Sw4noi+10vn2fGFK6NGHo=;
 b=ZizvmaTkIalNPv5NJ6wHNRCC58bGZNwvwwqQEl5Q+kHOXKNZoivf8HHIl7sCK6ojU6
 wRCksXNehhe/eew5qSEGWHJK8oaGy+pi7/Er+knb/hSZ9GmeAR5T14JacVfHwQW5YKSt
 3OcajMKz+MPKBixaQRzFYS8HPUm0YEe1CS2ERxA1yJabcLGg7tEz21XFhbkHp67Pmp8Q
 3E0KbolRula7EcYGf1Uxi9B/qp1j6HB2RkFxrE+gqbEoM5Z2W6W8TQ5PEgrXSinrQIAu
 qyGycD4ziJYFO/V/EcSoZAAeJCg88bqyuOAe4zZ/4CV6fyOQ17ua1T+GeJkR49kYptVy
 M6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593763; x=1758198563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYKFAdjOYASo/WjabAdPI3Sw4noi+10vn2fGFK6NGHo=;
 b=PGjJLjIU6vBgvbkZtCVK5xMHcU/81+QefzpQNA9PPu2a05v3LeuBjehuFu+P15HEvY
 /BgWFptxq+PIPK7aXtx+fsSEamAYpMhvO0u+4qLA3qwhC+KY/9hurmlw2l+uJPx1vJtS
 IGm05H4e2rVCI1tocJ41s97G9llhPCmZyySIkBpAReCHqCIySW/HmSVKONB4DvFdMsiB
 YAlXmizyRsYFKGBF/nUSu654tCmEBEvl7VxXHr82XscQORWdJNKIgk7ZdXzBCoSUcbwq
 4mO4Yy8tNHkqzA3gazY7NiFVVT4hS7nQEYVAZwqqZNo0HzYooYdBvIvntQnLpuIUbQZg
 C3Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIPeXFlQwLdBs/LEJVoO+P8z+TOWRVGQGa5tpEb16vADvoNEpyZoKiUB4eoYYNMTJ03GImsmnoUxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvho8uxqYUyTjdopYkOyhbIKyIp/U7EdoRCztzoDWSvemkvYvv
 zbkjdqJHdKUFwmTT38YKoTyiqGwLEHzO2qgRYZGn7YeWXrlh6c0d9so7BK/avWF3zjY=
X-Gm-Gg: ASbGncvgQwUL3k+sDpgXfUueb0mUSUp1uVJEAftNSALf8M5RyYw2qhSH79X43M9NOsA
 nl25youepSzbAE2lpNfAEIAe5bfT6mlivVqsv5gsXLIctQaFgVZf4nH46oUvv+mjPlD0QAzcFHI
 Fs50M3lMhHtEQ8qPjgH0YPtmWLkGoSHBm9Vzk4q4dmmjnGsWHhn5g8MPPQz240Bu7tZ48L3PBy7
 JLka+DgO886QYKBkviZAXI0RkczguOmiC8COwA8IC8aaFA7ns3g3+WrsUp4YTiHNHqtvw2jq9Wa
 0cBza8hUQEHfGPSRUqRmRA+xbUSvxd1Sb6YOR+f2iVZT2B6M1lPC1NPIUEWn32jI7or4nL0PX1B
 P3yKpR+t3ZGwRstoUOfHTHsFVBYzaWX6vSw==
X-Google-Smtp-Source: AGHT+IE4wZnmN0HF5vilM8y4TE0lu9yYsqD43OkvBy4fyb1qhM9Qox4fLexabkHws0JYYvrRpH+fmg==
X-Received: by 2002:a05:6000:3103:b0:3dc:2912:15c0 with SMTP id
 ffacd0b85a97d-3e636d8f8e9mr16633511f8f.1.1757593762609; 
 Thu, 11 Sep 2025 05:29:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:29:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:51 +0300
Subject: [PATCH 4/6] drm/msm/mdss: Add Glymur device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=VIaFKqE75CM+elK2XI4KYXHHvaxVuznQBropijUaKvI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCUdGmh3ForSq9QMyjokksSbUSHlc5VCaSEp
 Z/TmI90GCWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAlAAKCRAbX0TJAJUV
 VqhRD/98jWD57j5rtDVLUAmyM7r+QH6yH7G4HtwgYCTfk4b9yqkUtRFB99WCwwyLcSIPW+5vWT3
 G/7lYSdK+6ZkOnVdQYfuzZqmVIgMU0nr8gB3LTHyUAsI3ssZP+0mLTJQxH/5OtiDbOoldMPDDri
 WmGQGY8ChrT+z9LFFdHnG3WytJE1RqkKTChVym0dUCmulLNjeiEOZZa5hXZs0vDeXVq0e/+ZxpN
 18XQXNojihi+l6o6Vom8r5GERiFnptA4aMMs1ksRJmewxwr5zDh3lrzdPsKTI4S5sKNoKCOFa44
 SBrHee4vRiqfhVXgmTNTQDOQl8UapqVlEjozHl8rA6nNspaFJeHT9cM6ZpQstSnQUnBMVW5LVUU
 VHFEM2KTUnG/gvgxjBfQbrTtgyu8VGrB9IVGfZxysai6mdioklApSIRaS1MMYKYMFHNUBDDu/Nv
 ZtgzjHw6HOAbuZtsEhqdJfvAzF1NLJaWLQrXAfTJt1W9QyjGBz/7+CYp9WgbkrRKANOQwL/rvAG
 vEzYT/JwTeusAn/XRifhUPHf2oxMCvGzfqITVgG1au/FJiUqutUn8XKtwNEdb3ATi3i0n+ehPta
 91zyKEzsYhb+dsLm8+d5w4Q8ZLhA6RZ1tnuiFrLH8X1+6xggAaWK9fIGS76n7A2bsKxZTB/tS2Q
 F+cXo1n16s7mPxg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add Mobile Display Subsystem (MDSS) support for the Glymur platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..60bd6af83a8846f2ad751ea625a20e419c80638b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -553,6 +553,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.45.2

