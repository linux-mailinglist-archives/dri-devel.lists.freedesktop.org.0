Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F927F8B6C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 15:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E005A10E311;
	Sat, 25 Nov 2023 14:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AF510E2BE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 14:18:01 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so36081151fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921880; x=1701526680; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OMfZuIt+BqG7KJ9nvVW95qPOCXnGA5QHM/Q3t0t9+4M=;
 b=rnmGuGnGFH9g0OAHilo1s7ruRB3NP0uPbOvY+U76UkANOjtNJeg3RuTk1ZKG1GaZ3n
 cZjW4KMkiRyeFDVIsUx1fM8D1vEVe5ewfcBszOY0ZRqfLF7H+gSyUQSunFn4P+lJZh4b
 Bv/Q+0+Osbdk44sexc7ODsgBSzSXhgld/U+D0ekjbpqPl4b58xCQuSYUEqXtHNwedX8I
 f8HmTLIfKsZ5Ymo6OSQdP96hkryoyDxXIw06yyYIrxELfw5mTlvz2aJTitimGsDxqV2P
 Zr668FX9NkMj9ILGdQh6Z/wJHd5cM73z0oWKYZZOV26yWZ89ZYvVfPscSomMt68Pp+Bs
 65eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921880; x=1701526680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMfZuIt+BqG7KJ9nvVW95qPOCXnGA5QHM/Q3t0t9+4M=;
 b=A3VBeg8jdd/gS6nfiAo3Id5HfzrwbGJTnSPCSQd2Suu4tlX2KZwFZHb2+4ojZPSGdt
 nbNNHmuAexjYFh/BOMCM5sC6v5HFycnKW9zgC5Os8lqfBhqeOCc9t8cjjuDtVe9V3ca7
 JBnQuHwPF04Qx5Ks+ZieZlIU+F4T7xbS8xCOqSlVeThTCxJVN1/KW29a67/seoACdW5q
 oGvFupCmlYGHlwLVAPVF0T73i95bqu0Uos2InHLx8vXC990IfLmc+Ipff/Uslngoe60L
 aT1vzWOY5YR9tVL3h4Ku51ZUaUKAB9PE+rxQsPag524lTNmn06TUWuJZe8JxBbKqKmjS
 n/UA==
X-Gm-Message-State: AOJu0YyfrjjSVBSDpsdhjKpNJgQwMFKevggdU7ZO/rlCwV5AYYU4Apay
 HTP87oGdEGS4uFNVn+SUuHGE6A==
X-Google-Smtp-Source: AGHT+IGY8/ylhRHLmys2VuwyghOEp5L7XnbE9NC1OHEjDt/EDFIyFNSFmFVQ5bIXBVUTdxQp2wEScQ==
X-Received: by 2002:a2e:350d:0:b0:2c6:ed74:39bd with SMTP id
 z13-20020a2e350d000000b002c6ed7439bdmr4479087ljz.12.1700921879933; 
 Sat, 25 Nov 2023 06:17:59 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:59 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:34 +0100
Subject: [PATCH 06/12] dt-bindings: firmware: qcom,scm: Allow interconnect
 for everyone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-6-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1089;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zKRggNekRjMo2HWiE/Zd6htFQdzWQ+j1rvOWJYZk1Dg=;
 b=J86IamNFPWjvFl8R15HeGrbbKv6nxOgsRyV2gcyGjGQvv0D4Sonw6dL4ASTha1oCz3/d/YNgs
 sy9rMHIgH7XD+CMd35v3AcW4emIGcmWa0HZbVIBI6fy/CV5AVKhIpjD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every Qualcomm SoC physically has a "CRYPTO0<->DDR" interconnect lane.
Allow this property to be present, no matter the SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 0613a37a851a..f3a87a8426d0 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -178,21 +178,6 @@ allOf:
           minItems: 3
           maxItems: 3
 
-  # Interconnects
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - qcom,scm-qdu1000
-                - qcom,scm-sc8280xp
-                - qcom,scm-sm8450
-                - qcom,scm-sm8550
-    then:
-      properties:
-        interconnects: false
-
   # Interrupts
   - if:
       not:

-- 
2.43.0

