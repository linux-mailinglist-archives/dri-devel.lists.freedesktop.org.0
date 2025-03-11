Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D83A5CE79
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8C910E66B;
	Tue, 11 Mar 2025 19:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EcHuhj2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC4F10E66F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:26 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43ce5cd91e5so3684435e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719745; x=1742324545; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HMwQylNN1keD1LXzQIzfgxocXgJrdLeSwuocytue+I0=;
 b=EcHuhj2eTbVMq5bgDDe7Utwdn38o/+4rd63ZuD219/anGYRC9RF2Ak8woMUFUxFkTu
 1plhazKTnRQBM1Bn5cJK62jKqjpamCgqkDAz3kKSGIJrI0byo1Ruk9n12TLiwt3Z7uvg
 QDjcH3lIX0FuwRoCB9ax1afC7vgWxA+U5T6krPRrWgbbR1hCU+q9RzeZdRfdC+3+2fQK
 quK0Ttx0YkLEJsyBe0bG/OItWQlZ0TlpXBaueAjYQks4AKBVG/6zxLcVBBQtOcg+6h+C
 EVI/cmbZ3cMNmr0fcmyi2oXaVo8T3uPnn1nKLzW2Ks2VAXywHLYodfy+zJHly7GpI+v/
 7hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719745; x=1742324545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMwQylNN1keD1LXzQIzfgxocXgJrdLeSwuocytue+I0=;
 b=WKenJw9fNAS9Th1y/0ot7UFV4bd3CDClyzXa9p7VQi+eciHr4CMG2KSbHhgtyaKRyY
 c1i56dKZUCiSP/DiJNaiPqPjiGWM7iNacrtM0BWbkTsoaX7Mo4W+B+x3QebkNMYEBu2M
 CQf+630BuE9OJ/+rO4m9/M7NSxdx1E9aGQAlSMtL2f0DcovtBG7o//meCNnzd3UWNe8U
 WmEy64DPxRzpGy1g1XAqhlnqpwPtBj2xrD+5VlcEbJ8p+rV4THqnDbmOr+LdgD82ygv9
 75MSH5BS7rw67vZ1yoWB7+vE3qVPv3woBKzpmrJdfghRy25mPrWE4xcya09I2c3T4cks
 zg0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnmUqAPj6JJnjnwZT+BEFpqQrt4o+BFirE8R5IjHx4372+w9dHv2tSLrcA7h/gAPYVr4t1Mits840=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRCIX5ImdUUeV8PMVZjaoOcX7cMbUXkcGzeU4Dh8wKZzMyPz8v
 QyGyaESfh6lIkgd0UYmNrQfIwKuYm6nbx70/Gw+wq9OWPVxP4O8eQmedi4U7GOg=
X-Gm-Gg: ASbGncsbZKGJnPD/v3Oa0if/63pbFIboKka1hJYnx2jV1SZo+KBopkL5RFAYqQstIwV
 GjnfMSUGI4n1Dc9dy0wjNfsnkMP33xVGr55eKZo0RwxesWx+LHJU8/mfjQhdsUyUClU6cLMSxEd
 7y0xPGuTqcHJn0dz+otGV49itXc+BG4jOqe5fdlF9+PmFvqnHcd6DUa/LTEQjqzgoc/ULT14P54
 Necg/8Xpj1WYCgD/EBh3NQ5Op4/wa2XIctI398PKRRx9kNMQmEm1EkLKexKwNaFzJGpmbpMuU1T
 rZd1Z6JgfwherTkgeqW5kjuB1VRGP/5YDct5Fcq0Gkj5SCHNYzW52PTzuuZ4PMB7YIuz4w==
X-Google-Smtp-Source: AGHT+IFtSACGiTtY/7OwcqqLsxGKFPwpnfo/L0NhtuuAhW3jAAZXWSdbOgGKmBqu/tmKYdpHknvnvw==
X-Received: by 2002:a05:600c:310d:b0:43b:c825:6cde with SMTP id
 5b1f17b1804b1-43d01c126a3mr23602955e9.3.1741719744864; 
 Tue, 11 Mar 2025 12:02:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:53 +0100
Subject: [PATCH v4 03/19] dt-bindings: display/msm: dp-controller: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-3-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XAiYLxRtRR03zRuiEeNU+04LRvnGN6GksYFFL4NnpKE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IinIpSionyZrcP3NS3QKIozmXPcBscI9+NJw
 OCnZxrY/2mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIpwAKCRDBN2bmhouD
 1zjOD/oCeI4/7ol8PdiEwfTURIFeuy/KseUOvLUXQiak1Ni/wWLqmwl/UqelmsPvCW7I/e2eJOw
 eVXCVBGoTIoV9Y2aZ6nZu7Sk3NOGFE5ciNIpCN+UAXcuqPGOfnp8cL4TT/48jOCO2CZtnTxHn2R
 kbBGXwEQgXJnxZsAEBrxfW7FNZ51Y75YF8tu7h7RVBsfRH/1OZzCfVniEQBnBvewzAKXl0GeNt6
 GSkvFP3cRdachphRHjR4lag9J6+GnYb2ghG0Nq776jyyhmHpDyEU3xwp4dulaJcY5h2VEjtIlw5
 YeiUwBwXDMQ1AvbAcMnX6eiDCwyV5PQU9x/SspyuFnTpINTt02JWx8erDADvqqjAMmHmWCYJNL+
 IGkkmll4LRhqCgcEmMh9naZI8ZapNeqdSbVaG9uWP1Irp7aMCcKE9aanjVKH5n/jOyFM6aAM7id
 TF3Xl21SO1ogBrVsr2mjUsFpaLRCEocpcn71fComh2rKyM5vwN/E/H+6BynQOJLihoutS4L5HJ/
 V+/KKGku/DuSWFjnHidhaHySAmc0A/dyG6xZdxAd0sWHCusQBz2uGhJ6S6ZmMCGa6DyVVMilnm8
 UXITSz0BFiN2G65O29JXpJBBh/PcHH+VaEXc3jhYzQi2Hg7Dl6CPeb2k0sdnQJYTnBNEPqLP093
 4PoFant8VFgVKLg==
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
2.43.0

