Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E40A389A3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E26110E562;
	Mon, 17 Feb 2025 16:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FA3/HWiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAE810E55B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:56 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab7c4350826so81824066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810515; x=1740415315; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
 b=FA3/HWiurA0/w/qHCEu07Sw1lCz7h4kRaAMolcqAljuP+FHkMn99sVy9ud2XaAjqhh
 cWbGfTnlQfm9WlXxNz681FUMEts34hgbREWl07bk0xqq+3+1o2ncFRlEZjjMeOo3tRRE
 muRAAaZUtwbynMCioxrUsO/+A6+KKLa6rqtnaSdvDPS2P0blxuACry5dv6LDbXkf1QUV
 9IL3BhU+dPzDRvJnF7lEOI/S4xlrNVV+K+3AHUivYp3zKxVRAErdyzR8rIAokc23eX7N
 DyLpw6xf4VeBqTBQbXue4avytqqdKOStl3fetxD0eSoXpIpM2grc8W5aSS9+XAKP1iaj
 3zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810515; x=1740415315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
 b=omIdYdLLrZWGsq88YX+ap8qSSmv7AUSihudmk481ZT+kpso7miTgnMcHs18fmFh+X9
 ryeTuzpgop6n37clQPuT2j+Ga1QJq0JuLjLNu5xWQOpmBc1dHtR4Tm5gcjKJ1tvZSnnS
 UeNUcAD3iAHQFPruh6uecWD0oeVrRHIQnd99ls60sXdJikPEAbRFABX2cV98uyZ1lZlN
 ZlxUV0oIENMQ/4INXkgOy+fkKsnqpMVE9qcDnjuYm66uiwe7sVaXBtDumsSIOXoyNqQQ
 OoYJCRiZIe9E5Ows1cLYfJyC+GEZGglQ9BwzsLGm1MGNHmc/Z4IMdeUtxJVJXIZh8NZI
 U2iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5lVPmzghEhE8PCJWObhg3LnVl9zo+gD2aKSC9XBvT0RwQL7Jau/ltsoEtcB8eeHn1G6OIS4/AQGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi2ThsbNGbBdwfhhdzA43odgTPEdvX5PhQKYITg27RW0lbFevP
 LGAW58eWY3jBxhQUV9bARC2XR7C9p1FSG9qSfjq43Y11XJrxaO9BffVkL5JzV3g=
X-Gm-Gg: ASbGncvAts2UebgBi6lZJcisREBFQI4Spsb8H2aHMpMQSG2JNY/KqEwBCdEsHHk12Xo
 IveGs/6/g23/311zhOWxqGvrIQuLLeEx8BrpFgbTjRFjIf1o8pMGtWgjMDRx+YFK3AH6RA2Pbql
 oaiMfBVPRuCZd8YP6KXxhR3W6Oi1fI+7RyiaEHq2SykLQcx1f5klbRcaOssrMSyf6XSJsI3LhFJ
 T+eF5bqWELOB4h2PTirTDrBmAEUcAlqBkJrkjEcyFVc4+BheqvZlm2Fpnu0fZDwMtsTVexNDqw7
 d2KtGpyYNyh/QtMmqywOUcV2YKx3kkw=
X-Google-Smtp-Source: AGHT+IEIgMe3Zp9oHQ4Syg1NZNLW8FsB/EJ7MQIdDLhWkmOzna77K5vxKjgo/9kiS9CX5WEtLSbYmw==
X-Received: by 2002:a17:907:94d6:b0:ab7:c28f:de59 with SMTP id
 a640c23a62f3a-abb70e5eca0mr359398366b.13.1739810515074; 
 Mon, 17 Feb 2025 08:41:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:27 +0100
Subject: [PATCH v2 06/16] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-6-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wuNorwTHo7H+r6fks+wU5k9KNptYwXQHEEJmyB74PrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a8M0ppGAPuvU237GTUaCnPIFlVNVO8lpNEg
 nmOdaJ6puKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvAAKCRDBN2bmhouD
 1586D/0TlmzBwoFRFvrE2FQgg35s/J27/+TjwG9xEUecqB0DEv4ujNC1p5agIJnOqtMBUO3n3Sx
 /6Jwj2KdiKl0ivINu00TjVBcZE4VInceNltD1NmOSXuvAzK4LO5K4vumUesM6fOIeRRqxvXUEgc
 NtvO0+5CuCyR3u5oNI+qiYEoS+hKCjVit9JWNUBHFF2nkJiZkZsa+Kq/LavG05tIuEetCKareQk
 jIp3VcwxnwviONFosiLRpIm4NpQkhmq0KbCFdYukY1kvEpKwQXEldZ9cqBjaY+hR4nkPqW1A0ei
 v0OWJCAKaX6ydmCctzR0MC2RJPZ4MeS3CbkdMrv0S6a+UjI/qrmrx1FFenjRpFr7nL0fQ7W5VtC
 G/+6U+5H+AiHBHc4Cn9ABokj8KJUVIwb8/THU7eDNmd3z/Ug9uowBeX0bzJOQuYxFFghYiJjD/J
 tPgjdpUKbkbx7n4eBWOKkcIU280g5e7KMQnwHe7b+ov6xGsVilWHT3LmjtL0aeJgWeHijQBtiWE
 jbYbCjPUVHSu2dvbXgKztIh3sFc0rabC9LN5Yf1rArms5jpjZ26uwpZmWeejivhKE1Wm87jc6XW
 g6HjnTdqaCOPQTcC5u4wKOgXispduB6DmsokG/upPHzPKQ/+2EW6QloDMyrPJDisPYsV2TbgdFM
 HXBzIqJMeuYMkPQ==
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

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.43.0

