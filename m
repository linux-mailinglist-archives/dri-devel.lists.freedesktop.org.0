Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB06B1FD2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47E510E7C3;
	Thu,  9 Mar 2023 09:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082EC10E7BC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 09:19:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so768260wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 01:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678353544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=lRJV1vGvT2v+KwmS6EdWHltspQE51HUVFTaEa/Jlk6Er8WvwcLPr2aV0htuhi919P/
 bIj1ck1/BwNY4nkfiS4DIcfLCkJYOkf5zwQAdUsE7F/IyYKwtgtQ59pLBpcONBBYrAo4
 uQUOU3tqSfYqdp1MCQHcQbBU+GCPFcgdYq22u99DZv9p3NZdIQ9Eljdz32eh2YxLoNB1
 pRQliFzO+jwpAF2bpxjXM0xVkEQulSVESjBCVx8wQsZEd2HvDX+Vl/YeBBCQY5g3u4P9
 3/PcgaubSwTExm/8L8btXrqPQix0tla6OKY3ygTH8/GNRJYNDboFnj/UJhQ/DVc7X0oz
 tkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678353544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=kRwzY+p1MGPKgc7YlrIFNXg/gZS+iLEmsxuVNuN7HnyR9S/Y5Hekv8ycvUhNjr4cME
 7fW/vgVJd32UFtrXSDr6327QbLYNRr0vNAvLkJG11HZil18LfLCCYLH9AaOKLAZ/wOVM
 1R9DdQfWhn8NODSKvBeQkIkGz6zghkXWT0ENfMTYrxYsThQmpNHe2n44fPd79VJ6y7n9
 uUBNnflarVM6llV5YJvZU2/r9e7BqcrPehHKLgPiM6opfUJFRt0O8gfaRmllFBKbr14t
 7GnfwVZFno9jNJtbLR6IPXG13o+fGhw6WFfIInul3siJ7IGstE1oic1Qsotk8lNEmDhe
 xMMw==
X-Gm-Message-State: AO0yUKWgQj67W+vYCtWj/Uz3NXYP3cCDlMdem/K252Ix64V3oaEuyKBz
 nfYcjimXNA83Kr6Ig/CCoBvwYg==
X-Google-Smtp-Source: AK7set9dRRR+gtTk41EMbIG56sxDpbwryXnhbCaZpdKrzlOBOqNEIw9pqbn9129F2BxRwsaMlD8IRw==
X-Received: by 2002:a05:600c:1d94:b0:3eb:9693:3857 with SMTP id
 p20-20020a05600c1d9400b003eb96933857mr14932657wms.5.1678353544446; 
 Thu, 09 Mar 2023 01:19:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b003ebfc075eaasm2177066wmq.16.2023.03.09.01.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 01:19:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Mar 2023 10:19:00 +0100
Subject: [PATCH v4 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v4-1-dca33f531e0d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SM8450 & SM350 shares the same DT TX IP version, use the
SM8350 compatible as fallback for SM8450.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 +++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0e8d8df686dc..f0c2237d5f82 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -15,16 +15,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-dp
-      - qcom,sc7280-dp
-      - qcom,sc7280-edp
-      - qcom,sc8180x-dp
-      - qcom,sc8180x-edp
-      - qcom,sc8280xp-dp
-      - qcom,sc8280xp-edp
-      - qcom,sdm845-dp
-      - qcom,sm8350-dp
+    oneOf:
+      - enum:
+          - qcom,sc7180-dp
+          - qcom,sc7280-dp
+          - qcom,sc7280-edp
+          - qcom,sc8180x-dp
+          - qcom,sc8180x-edp
+          - qcom,sc8280xp-dp
+          - qcom,sc8280xp-edp
+          - qcom,sdm845-dp
+          - qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8450-dp
+          - const: qcom,sm8350-dp
 
   reg:
     minItems: 4

-- 
2.34.1

