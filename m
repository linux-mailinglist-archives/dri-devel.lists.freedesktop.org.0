Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40856A0768D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262DD10EDC2;
	Thu,  9 Jan 2025 13:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="voxUVeZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E5E10EDC4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385e971a2a0so44973f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428130; x=1737032930; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4C8lFM4usc2WCSKaYFakQWoC1zk+7BImjfAxgt/bKlA=;
 b=voxUVeZSN3IyhK8bYJhbE+uFWeN8Hq3zTn9XlDFjXd41GCfbhu55dhToss+X9pTdOC
 KcD1A5JNyfJwfnblN+wx9Z2bx9VOrgNUAf9bM6Xj/A/eTiwETIgoq2zlHszw0ZMLGu7t
 buN/ChbpaYuPxCsUutQFd78dzz4zXSsXC3Xd4snR63A+IKtra/cLJM5MLBU74rdNRMDT
 vfbzTsx/QoL5ypuHFaON6Rj09/6OJ1aJmouezuklZjU15cGYVwffB5eeJUG56QV5TfQi
 min2neTQbmTIt7T8dRbveti7S5XdI7uJY08K4Li4Op+8zT3tnuPBBunJB6oKmiv6Py8C
 DHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428130; x=1737032930;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4C8lFM4usc2WCSKaYFakQWoC1zk+7BImjfAxgt/bKlA=;
 b=IV+b2VgKipfnC1pJFQRUPaWfjNQE3S4bNPYVHPqeYjIpJKYaYQ77hLthfqtSf71lMY
 4/p/kkdY/o8TYGKh9Nm/YTjjsEvYSslygW1CxAKC/WuU2k/PeINRC1y6CzFvLtVA5y94
 GmK7ucJMEzgCo5yd/54KxPW1nqL1L5r8jzOhbSDbCf/v0aAdxkm1fIUpwQhDjmrHyv7l
 yMy2YYsnLIcESmX/ThUlFEmpU9QG3ZRLnKsA+amlfa29GhWcuyWytWYa05AXPmPtmBB+
 cGpBLOgxwW0PbQjm0ckfX1bQJQCc1ppWueppeVdknZttsQIMeiLCel0jNxO9bBuyu3MJ
 +L1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyX63FrgCnd19fJ1NH7HmA3k9VGRrJXLEoTp/umnQAJVgsojyc3J3HyV2Sud3gMB6/BHwsf35priU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkvsfXiR4fLJanreNY1FB22+Qo3yqyYW+8J0upvMKyEjpbcE6R
 3py2qYqUHPXxcUk2YEdjOqb31EnotlAYNqjjSSfN+BeldYMmx1m8bjki0HcF+X8=
X-Gm-Gg: ASbGncsXFkFcUfyXMcUYrPm/TXdV3v+HUcxuVhf3Q4rVAlCcqNpMny2lm7uy10nyS5z
 zTcoaK+XSy19kW9lc0/qreyt+podQFuXbOHv9znzoX4orAnWR+A8iqzerAgGZ0V49NjE32K0RFZ
 n2YwPzBJJG0447bHecpW26Z1wbD+mqnq3dNvCCMOrj6imaliw8UpuLu6f4ol9cc6Fh5H0U+/q9b
 qyz7iAmUxsv31bGF5o30vXKkR+BBdrTWumWE8NuRDxxDnMg+wF0C8hHNOJSrJGhP7AsOMxV
X-Google-Smtp-Source: AGHT+IEUQcwvPKcbMIyP5ZKenACaYFV8nmJntcoucqUL76PjNvM3RVPBbc04BbNpWGPXqI3Qhp3mCg==
X-Received: by 2002:a05:6000:1ac5:b0:385:f3d8:66b9 with SMTP id
 ffacd0b85a97d-38a873122f8mr1918123f8f.11.1736428130154; 
 Thu, 09 Jan 2025 05:08:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:30 +0100
Subject: [PATCH RFC 03/11] dt-bindings: display/msm: dsi-phy-7nm: Add
 SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-3-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=e0kdcE7yovOEd8OkvRzLucewo18gCGxr8FZ8czNmUJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pSigc0AOsfkJ1vj+FW+h4c8exWR+2AjLU03
 XWEbwBbG9CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUgAKCRDBN2bmhouD
 18w/D/9j523hP6tsD4X4WpxZoWwq7ujCH3x9l7dPbgGmHHl+HyR+0usvRdMuj7f/q3ivtb1FC6N
 6tN9mdgETOhx7VB97ygMjvjJ1QFxhK4nmjOEmoe/Krsy3Zs5HOeWscofNGoTD5Zpi8zhR1t735y
 d/RLYaGNjybkPSXgeb1rgK2kygDY9TwMX/Ar3qJXk10HzJ27jmpc075iyX0kVywNbBX1hwivVc7
 Q2NvlUl+/Ph603mtdOK+CT6V3sgWaJbqAiUe/cO4UvM4kbvG9fTAt6XAKAVbGSL95yTMpIY5/H0
 eilgDltfq1/4fi8V/l1IfDz5LLZPyFXBJ45v/yu1xlViobbDzth8+kFSmBE6CIq8UNw714il5WJ
 L2hgMqP2+/YrXKvkQt/KjC3tqr7OtM7k+aDChiBqvk8Aa74O9rFRtkIYzmb1PXgLcn/Sn3x5pyW
 t3O7e45CyXFRNshgaqgq4tgOtQyDS1DV9am9enzibdw1GGc1rYWS4UvNaQWDL6rfyJdtIYIXXDr
 QKRcKklKuL2q+rrOZCG7UUYzqoY/0NoJ03aoJrmx00bbrLXtzMlqv+sHJWtKY/9ULc9UsHqSSDm
 ExSklXiwEDeHUUhVU+TvAw3M1wktdjJ36KSvMu2TdwaJybCjTRWMsx1Sz6d3P9oQzyrCFsqOSqA
 gLs4C6IxVhpCPyQ==
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

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 7e764eac3ef31829e745673ea91d4135921d61e5..e356a65a97e901104a29ffe8e5ac04dbaaad6bd3 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0

