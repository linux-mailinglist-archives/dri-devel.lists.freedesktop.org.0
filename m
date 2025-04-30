Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA679AA4C37
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7A910E7B3;
	Wed, 30 Apr 2025 13:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z4MgSeba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBF910E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3978ef9a778so260061f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018074; x=1746622874; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5DqxNn+UoD7iamnGtY9TgLsPSi/cCuXwa0uWwu1jgxA=;
 b=Z4MgSebaUjgtb5wiodcxWxTbUwIa52kb2sovP2Blzwabiq/JKwHwbpsu7LPftAFhTO
 t9083Rdwuaso3Jc0M+aLoyx8NJES2RqEq3SeWr68gB70BuG7o8749pMwbfVXKpBEFDNj
 0EWEggWQrdWRRrcjjEfIF6RGeQDK+Yk1ec43wtyt9NYuVQOK50JBI5rnVZFNsxWl7pIt
 nd2wxsPoCT6jmW3pjvA/FN4Qw997kiUwvkMFdanIRTQGQhsYkvbO4xZa6e6wNkoNybRO
 93JmIYO7Z218FY9wRiiNQ/oTwFoWzjdY6r3gUKL/Rq1o6edH0islLdMtA3JOck+7PHw5
 K+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018074; x=1746622874;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DqxNn+UoD7iamnGtY9TgLsPSi/cCuXwa0uWwu1jgxA=;
 b=ocLPLHlVZjdcbNYGY4WS63yR4rauE1OwXGvVcvVlz8IzvqPQxB8LGe17fAsvUrjIRk
 vOkeCV3BrVvecxYc8QZX+xov8O6dcvX4jWsoDvVOSGsNhTKSj3NotZYm7QbOlYA+JCK6
 Zj3bd1Rd09pWsF/VuVaTn3ZjaZS0zIoHAiX0Th2nPNECki+Sv95X6PRR2Ts38PhyuEr5
 ec6PB5OJBa+V0yhmiOiFzhigT70cGXp307zmFgpjtH/09P0qEIlRJtRkj4x9uwuU/Its
 tmoVh0GvMdlppRTTB/BkvTDN9yNqC20Kwf/Izr6gpDcxCGIMDv1gjEW3slfiTfcYgkJB
 OzdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/utebbWYu9FrU6dusLB9lII4/zZWH4NVe5qlJ29IL1fzbQ1GMtkCjvikB1EKZRnMj9EoG6ys4HlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+S+Kp+8WXX8HRBr1qbc8KIkcI+TgEMApbspxndhNnzkgbNnmV
 jmCNDBTyuC2BEBcrtFIDQodTT6H5ffhL76n7TeR9jwV754QbbhgXgvdXpmFhn1M=
X-Gm-Gg: ASbGncvwZpujXLgGP7NehxMD7Dhdvkk2apZPsEvd6KhZpuBQ1jXPyutaq1ttd9eC7Io
 dLyk/G43ImT7Yk6BxBZgD6tvWc/hJ6mTwp0rJEsFZAy7xEpN4y+MQ9vcU6jE41GMI+OcCra43Du
 HFmaDsm1rZBnOuxPUnxTuircJl1Z+T4KhX7jJlRwWiTm41RtxMeI1ny0ZJPySLkV25Gp35oTKNT
 xupPGC0mayjBoEn7xEOXUUNAOc6LE2Sje9kjdCG4jHx5PfIcFcmqXHUAnjHZSjU+G0txddqu15z
 bRBNXZzwrTA9aoaLWyY5sHPSITt41TLpkbXqCgBserd/RIQYaFuYfIa7i0Y=
X-Google-Smtp-Source: AGHT+IGBVWwBGr97Pgn5thROq7Wn5mBmawppBRb/WcGWKf6ABPhBLHfvBEY9IGyyMBgaUaKDfEDYwA==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id
 ffacd0b85a97d-3a08ff35f51mr815792f8f.0.1746018073615; 
 Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:33 +0200
Subject: [PATCH v5 03/24] dt-bindings: display/msm: dp-controller: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-3-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h2E0Qu9mtfOPc6WOXOdr8B2EUlTMKmMwT95e+uaYoFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh71UGHnWgpuzZGk5SCnNpPWKK18fJgvG/kuR
 yjfgU0YoJOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9QAKCRDBN2bmhouD
 16DxD/0dpiL0ZWMmbsC/O716FLuR4a7LbUfU79DS35TsXf0SX7b9G3TTgdzKCecKJ4nRqO/0Bik
 RfAoWMIRHt8Caw+lic14c4j1wGuqjiRmDWqG9Hyb/78A9TRDe4Rx790uR7PYGxlDODd6KxiQTfd
 Hku6UORjGcYyGG+G5u8JRzJ6JcBoE35ad8apIFNoTMRtJywIVTfCvdLVLIGlbv6e7zT+mBwyvHE
 GK6kxlSdPbXmQDDwPSVJKN3WGWY2yMzrM0m+CLY8rmJyV2RmVwwU2kE/fzRm47viq8JMJCbyNQm
 4xyWv9TTi/9UGwj2R8DZ4qhOSNvHixbHrFg5TYYGa9d8OUdbC6+ga6tRmGeoA6N7wQ2hKaPYe8L
 oSi84mvp1SS0calcSD060NU8XZ8hsayuGYwhpdWpNsIrkRtAe43tJvPJ5WsgN2HHTUoFxstoXm7
 MAJAQIW2q5lyVYgXUrshcEV0d/HscPN7fdj3GQ1+6qJLHMQ1tdmtUXu/KGO7tMTqHtJ9MKYhZh5
 7tq4g8ONujqhPtRm6NCaqK31+29YTkgMG9t0a73stfi+UjeDGWTT87sa+GvFRCq8GV0hiDE8cJ2
 JY7azY426J7ZK33JtY9fWmYbOlLTFJTyItNwQo96Flu3hI26LkG71tgzMCkZsk4agSpYjkAHI3j
 XuGfiW7Jr4275og==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant - both are of version
v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
MST for DPTX0 and 2x MST for DPTX1.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Extend commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.45.2

