Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817927ADA67
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5805B10E268;
	Mon, 25 Sep 2023 14:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0A210E268
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:50:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-405524e6740so43442365e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653439; x=1696258239; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iqDQqT2DLj9ftb1a+cS59Q82hjk6LlDusCS/om2BnIQ=;
 b=qbjhK7s+dIDjG/nIn/B49LdZek5t+Ex8w1BxEmZDDBlo/ATVfWGF/FNy3Sbu8tYtYf
 AexyvXgOCX/eq5+gkAQB8TRtMVkD3E/7FIaP8TwCOvz5ge+WRhYKfhh0OadqgaKNDzzg
 d/pgfvhg592buexg4nPprL8IKWjR9uKy2MnPxZDyOtKDnxLOJhPDcUS1TQwnnXIIEgtA
 pWspCHPWuvzRIl5q5exzSyDUwVFGVBeqUu8gn1xba7Y3ihb6DJPFXRcbvUkTzc/4sBK+
 5efj/cY+uJdw2bjhQDy6WQlaxZ9BPFSQlT2Hd4IES4gWSLwAZK+QDxzhY6GuK803Oswa
 xziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653439; x=1696258239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqDQqT2DLj9ftb1a+cS59Q82hjk6LlDusCS/om2BnIQ=;
 b=aizF7PklvBZl+ilMvBLvGxen7Xbq7rSy2NZL6ClfI38uq15sHOHj5fRPjZVrxQxGW/
 sP3wJrCLmNIqZ435HzqWSLARdR+peesNGj2rBl9kqPWHdwPcjyzw0suDR+RRJ89uSUes
 efeOcDXy/z4UPJO1tShnWnfc6myU5GHAWP4/24JGwjab9TEuqSQ17L4hF6rCoLUrd7dK
 N7OjJLLKF+2cTgXL/iM8w8wJAiiA/BCYHO3Y5q5rxFsPmHogpQ7JcEJZN39m8kZ4MAyB
 r4WzTqe+NseLPrfnhrf+6sCxPUJ6/etfFqvC1L+Fb8u+AKHfQcCZEwSQVHZ+GtN/wZvH
 ZRBA==
X-Gm-Message-State: AOJu0YxIMaQePclHgd0R0AVGbGop/wslDqo/ZhRFT6yAmBXYueTx1z1w
 9byCtIg+t+4du9f0At5R3Fg3v62WsfANQRBfNrtUjg==
X-Google-Smtp-Source: AGHT+IGb3673GOOtKMB73cB0OpDzVMreybHEgPR0HZphki/E0Du6EKRHegiTKTBna0+j64IS3Gi2kg==
X-Received: by 2002:adf:eb84:0:b0:314:dc0:2fca with SMTP id
 t4-20020adfeb84000000b003140dc02fcamr5633684wrn.29.1695653439086; 
 Mon, 25 Sep 2023 07:50:39 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:50:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 25 Sep 2023 16:50:31 +0200
Subject: [PATCH v5 02/10] dt-bindings: display/msm/gmu: Allow passing QMP
 handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v5-2-3dc527b472d7@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=1312;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3t6V8wanxGXA/i0mTDCvRvjHggKHs3OjhBjkt6x7rlo=;
 b=GoJwpk3Vnxi78DXqBVEHwcY7i3nunpLwnIlz6jJr9Ti3ctmzI5ms3Pb95nenYzkdUPJL4B0HD
 FzG0v1hhsYSCC5QdQyBqa/CbKk4AQMNbfRbzIsJD+5+s0LuZx6TuW9g
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When booting the GMU, the QMP mailbox should be pinged about some tunables
(e.g. adaptive clock distribution state). To achieve that, a reference to
it is necessary. Allow it and require it with A730.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 428eb138881a..4e1c25b42908 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -64,6 +64,10 @@ properties:
   iommus:
     maxItems: 1
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM
+
   operating-points-v2: true
 
   opp-table:
@@ -251,6 +255,9 @@ allOf:
             - const: hub
             - const: demet
 
+      required:
+        - qcom,qmp
+
   - if:
       properties:
         compatible:

-- 
2.42.0

