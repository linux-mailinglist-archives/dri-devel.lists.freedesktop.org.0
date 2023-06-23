Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F4873B759
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 14:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A882C10E633;
	Fri, 23 Jun 2023 12:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFF810E106
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 12:33:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fa0253b9e7so5808865e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687523578; x=1690115578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P2tkpRDl6YU96Nh7jBYMd8ESBJCSjcrZ+y32/h2bXPs=;
 b=IrKGN8JXGC9MOxmBbhMrdrf7E6Yp4x6OuIydbdOQC87dk/ZN2eFN840BPhI0GU7IhG
 l4u/6U8/N+mqQvivQvjiIeCylUbsDDCl8FReJOxAkuxr8a7z4CpZRksrVkVPQla47Nam
 V6MRaGB9dK7eImupVomweB2D0WgErmsCYhPpzglq/rA1+8qIn8Kt2h8hDlCA9PbZ3FIN
 DLfau6z6R/tz45JVYk7fv+J70Df0IxqB3MltIkVJnt5XRKcXkfguuRORuX0N1RuoXqly
 EVDacHq+roOBRU6qtO/WywFa4dEIqCwNQkFB9AIi+jthEJ80CkPcvAULwfEHig4owzIv
 e2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687523578; x=1690115578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2tkpRDl6YU96Nh7jBYMd8ESBJCSjcrZ+y32/h2bXPs=;
 b=DQBTCPxaLekKnatRMXCRXmsOOi2HpkXBwSrC3kA989JzoJYAI202b1dC+L11/Uz9AJ
 hU9jn12Q/Q6Q9hmqnd5mSbavW2eBQ0JlkoRywvRmFO2xl7RdneedK7lCkDnykBqIEHUw
 wgi6Y77gEkQk2Oxnnbr+w5VY/O7OoSp/PuL6PhjZ0DHqfOkP0UdsnyPvm3ZQUnK8S85W
 BJp+BCv41oDFRL3l9wvYQneXStr9UA8hXTen/Mkdkp2cWZIF1rrOUQEchcYul6gJVJN9
 BboZCXXSFhzwKzex7FPgCIC/h092gWYhFt+Mb5l6ZMbZLFIRGcZV1w00JV0bUqV42VPM
 7kvA==
X-Gm-Message-State: AC+VfDxSc6lVNCFry24YXnrqSGPY0gjYtMZ3KYLe9Dtz/43+kNd6hLjj
 nCp6g+MGgnsy8EYpFwh86qyQjg==
X-Google-Smtp-Source: ACHHUZ5VzwBONmwxXGEaxg4RhSRavbQ/bpdx8jgTb28wVq5pcwNUX8XCNpD1JJByuVDeI8gwAR2qYg==
X-Received: by 2002:a05:600c:230c:b0:3f8:f1db:d1f5 with SMTP id
 12-20020a05600c230c00b003f8f1dbd1f5mr20321561wmo.5.1687523578288; 
 Fri, 23 Jun 2023 05:32:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003f91e32b1ebsm2228105wmi.17.2023.06.23.05.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 05:32:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 23 Jun 2023 14:32:53 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: msm: sm8350-mdss: document
 displayport controller subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-1-733ed383f6b6@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=caVzMd69wXTQ+33nJeZoOo496o5Nce9dpncJonnsfyE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBklZD283en2Mx8djk1FG46qOpOb6BTHhq/59+w5Uas
 VD664YOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJWQ9gAKCRB33NvayMhJ0Z+wD/
 99O9y7oeBfmjLXZr88q1qYcTUgzHNBYlR7UwQNzP3RADgzkWB8T7mlXVgkkoeAXh32sDKH0PM/SPOK
 MpMznWRg3W31vcc3C5iwjTW+Jr3ZG7/4dT7k9ZhBQK6rVpkLLRfLvT+J5b9VK6q+fjliKcw+2Z7tBp
 YWfvBJ8HO05AnC/TEmThzm4wtn+za7lYTLTd2u0EjO+963A52m9+9bfM+tP7oTZ93ZGUQIi1UiFYDJ
 CuPTH3GUsk9/D58unZ3hPs3lob4dS9/tE7CW/+VgaY2gXY5V9tV99GFyptGNNmjYlDrwykEzRnUPQo
 rpkfAFwhdtSD5+QJ8D8U1vwLVzRP/ZQn9tzqR2iXlGAyXP1zpwvMyzhfee/Y+90fkAs7+1jcczwIJ1
 BCTQ39gh1o2ccd134gtawC3ztSN2Cqh99F2SctCVVc0HNRucujGLQ6EiJU31a2YBJUsO4E58Kb0+gR
 dKrc1EdzY+vCUbhIcL9LGhntNbEOm5Q2AiUnoSmsrJWqeKX9IWaRmDGpRcAB4uAzQTBFB/k1mugL7C
 T/KZ2K8l/JH2tIu+NcRha4SPdyFvJKYxH77lQjjZSrBuSD7UZGhYAw8KplY0IdJ5SKBwJGax0Q8JWL
 nKmEtTvpK54NAYsqUJdgPZwQ8D/6hALf6yT9UvIrtLYhQbOncWUOlffLMWIg==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the optional displayport controller subnode of the SM8350 MDSS.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 79a226e4cc6a..f2cbeb435f1b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -52,6 +52,12 @@ patternProperties:
       compatible:
         const: qcom,sm8350-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:

-- 
2.34.1

