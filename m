Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32956BEC55
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 16:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB03C10E3C3;
	Fri, 17 Mar 2023 15:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797810E275
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 15:06:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id y14so4732129wrq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679065595;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=b+PT4rbtQaTLoitwvMzSctyfB/PTX2FRLt6w5MfEfjyUObdoeiMt0IvwQn4sXfB4PP
 QaaHwO87rM3LcVGXqMsqAKAPu2biM/oSj1F9FkgEZzK2CJKnuymYOqivN7CmoVMdCwA6
 r0pcek6V8uA2inoYnhCvLu9xU50PgNWuy9xlpmUKlrcJ80BT7m1g/bq9/0YNoxFUy3lY
 YhR8gWbPsx7Ntv2Rv6LefrhNlXuU3t2LtnfME7En4Shl9Ra/O+iXgMl0dsdHURJL5s4E
 ZNHjNnc2VsxQcXLyUqZagM13LQKAH1WxPTUUCtaKdRv0pA8yNWEHIpO3Euz20QqqNmDa
 P0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679065595;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=glMsKZY6XLjOHHdoEIvTuZv1MCfk6EDQ7GDK3FUhuRpc7xY8ekUs//Cu4eliZ+YHD8
 7RVvbFPS52pzhmUC+qgkqR0ZL6Hq7aKycz/qNrk0F6tLk9ed5mDfKxS8j64tnAwZt01S
 d3RtEfli5d5LsMBK9+ujo8upIAbJnWIyz+bRAh1XmIAbl/6T7gFZ72eOa2LO+tLM30pP
 HqoOLn0MUdd0e3pnkTVBgnhl8X3blh7BQ4MZhSCar5LaAWIxneSQEKTYNF7Zeu/sg0AG
 UWcix+Ga/Ey+CmEVhqoQGw/hwvmxgZp8X76qMxi4jIC14BN/IgOWeLYrcShuuDUnnsC5
 DjLA==
X-Gm-Message-State: AO0yUKUghFSdm+kf+lEHy3HDcZ+dPr9k2tXUkVqiKun2XGPuFflLV/eC
 y3wlkMckPerhNLvhxWH2wuowWA==
X-Google-Smtp-Source: AK7set9Mf1yAu2eJOHf8lqanYjVkR/0dk89uLJzzPMVSb0YblJ5QbKXVabOolSXl4Fh0ldJMKeS/MQ==
X-Received: by 2002:adf:f0d0:0:b0:2cf:ea5d:f60a with SMTP id
 x16-20020adff0d0000000b002cfea5df60amr8317040wro.3.1679065595310; 
 Fri, 17 Mar 2023 08:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d58ed000000b002c5493a17efsm2187902wrd.25.2023.03.17.08.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:06:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Mar 2023 16:06:32 +0100
Subject: [PATCH v6 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v6-1-d78313cbc41d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
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

