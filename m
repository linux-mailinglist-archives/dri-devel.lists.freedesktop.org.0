Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F885833F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4158910EC50;
	Fri, 16 Feb 2024 17:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fuN4UO3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC3B10EC49
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 17:01:21 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so2219870a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 09:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708102880; x=1708707680; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uXAA6feqe7ITmVt5QxnaZYVqRK0lZp3lcWFLVwQYYf4=;
 b=fuN4UO3WnDDkm0qnhAR+dGQdJNPGyBMItL5SprNa6umc1bSfBzBsjiTLmY3aCTDRlc
 eW72EuzLOuClD6tYRwSP4xcTNZqXV21DOVj/6ROt6mxk2V63lhbwYnCGX+tqOmcNBEwj
 LfkriPemfEhLhVJft70MZc7Stt/umTyHsyes3sjp1wbm6cAzoC5ta0nWg8Po/T1br2C7
 Wz9QQCzMWjnUiz2lxJRY9MEwi0W0x1T3bbwfTJRq08o3Y7zjIl8YCnujMnyLxSO2lGym
 Lxa+b+zCpU6kNBxAdDZ5iTnNUTBn6tPFawP6MOLAuKi8rpf1+BpFxAPk1wXEr1hrZXlq
 al6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708102880; x=1708707680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXAA6feqe7ITmVt5QxnaZYVqRK0lZp3lcWFLVwQYYf4=;
 b=CpB+ApDAb/UpXK6ZUS8xWP59/7hyxy5Y+cZlhcMVKuY0YbBKiL68yRQUEJyyfM1V6j
 Urrv25S0p4Pwbz+smY0KV8G5eNa4zPaZ/SNz7TN6rTdcDzzI1O3o2LBghts9hvYLCkyF
 4gKfJOwBiC6sSDY0c8mNDS4BOx0kxTa7jCB7susRHssaVsWbToLTCWYKlL1yagrWXDaV
 pyS3IvQj4hZ/GWlyq5aILBVp470lGzYcfi32s3i5G8bNy30f843G7ZEkCUAyfMJTydCa
 cg5mHsYXA0FLOlsmMZDUkw4o1cX9cmp2N3MAfB6+CDusLtg5Wy1x+chSx9iuiA7S0l/r
 xcSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPcNGLxKVeeH/xee/sTyep+nn3jZCfrUgM4QzZN4arjNO1khQJ2N2ZndguFeCYA21AQCoAAWuEaW+BCBjdPf6z3GjlkF9WTP7YJziIsmU8
X-Gm-Message-State: AOJu0Yw4mWKusMEBrIDjCL2qc126N+Cf5VWo5i30NPxHIvII2kL8lfh7
 8EoU+6ly1HppkeDOIB4onOWJMjhZ+QYRgEMC4PcOnNXSnwNifIzTyV3RZ6U2cYA=
X-Google-Smtp-Source: AGHT+IEO2GYnWZztWy4XVywiNgZP0RuxxOlupGrJMYJD8z2qtV3pisYWh1Ggd55fo+KivYfDs38Q2g==
X-Received: by 2002:aa7:c517:0:b0:561:dd88:cffc with SMTP id
 o23-20020aa7c517000000b00561dd88cffcmr3984240edq.28.1708102880426; 
 Fri, 16 Feb 2024 09:01:20 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 u20-20020aa7d894000000b00563a6c9fd71sm159706edq.16.2024.02.16.09.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 09:01:20 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 16 Feb 2024 19:01:05 +0200
Subject: [PATCH v3 1/4] dt-bindings: display/msm: Document the DPU for X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-x1e80100-display-v3-1-28b1c33ac8c0@linaro.org>
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
In-Reply-To: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=848; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=u4L61jxb3pk7DyZvt+6wEP3FQgg6lRJc0FDd03RRCBk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlz5TYbMJUWE9HZuo+njQfmr+vjOQUCQV6QLLZ/
 4kzPkjW3U6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc+U2AAKCRAbX0TJAJUV
 VvKnD/9g6oILdR5vqRFFbgbtXaC5J7KXoj68K2u393MveLTILQFQN0LAfdRRujCfb3ELEOigDfA
 NXO/3X6gmcOogYPWCTQpX0B0cn1vO6bVnKNHHbn/dKk+mQlSrsMIOxikE35TlNr4ou3LT++k4oG
 C64KVfOcCdgWP7H4C8jbANe6I/UsVApD2AKEeN+6f8WUqsyPc8lMo8uPZEpiYz4edOen+Bcyl9N
 3Hzek00KbEqtp24QIiq5A2yfuUugZWl5Fqm/az0HBRfnK92jJB0vYmerrDJ70ssgZhGrveTjood
 PBnNWc8dlUm5E5XDAUF44LXGe75PjBSWC3whVq4WwD0TTZXmtcMGRYrTiYbsZb3NVp8E7hFP+wJ
 Db5C+Is3VPxuAbyC/LL7SoKtj5inVWu0aazj8Xfkvo+addk4KdoN9DoU2go0trFXBiFba+Vxo2l
 dePKe0I6hx3uqnfwyyK29id4FeHeYLQo4hor+CwwngJvQWPnEHVZygsKvgpCxF9ltt2qF8eNwCi
 Ooms9WXbRJ4KRuIX74ifLnFUjbowX2gSmf3zo6ErTJQyXmaNbG4HUrSiukniIG51vL/lJYFD1lJ
 wiYV1soMShJTjUOgeSxA8HwxnTOiurmI073VGg5K9Z8zMPfZyt9cXmR2WZ5ugfRkrY8rR6mfANU
 O7zD6kYzw9TDUlw==
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

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..c4087cc5abbd 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    enum:
+      - qcom,sm8650-dpu
+      - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1

