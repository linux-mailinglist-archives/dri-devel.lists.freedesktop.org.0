Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E5691CE0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 11:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B216E10ECC7;
	Fri, 10 Feb 2023 10:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171C410E107
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 10:34:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso5971828wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 02:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HgLUw1PhteCNPI8sPDiupyYC9yeutB/HXKoZYukFVKI=;
 b=xLSuCxtgzIt1SrtWhhHQbOXoV910RujM7FZAYSUlNOYFH/wQwtAbjnP1PU89PRSWpq
 JG3c/DRgCgtvvyediOtIPoy4035xUKs9hdBJePfO42ZFaxPn5oI7RF5/I+faQdjnmB8v
 gws507y9JPogUHvr54LnbClFUBMjlqy1QWrw4u5EN8bfL6tCB0x/pqOqvB0sgFX7gzXG
 v2kTOGiLum/gfWjuUAbH04MK/Cr1e4FhjeQW/YZN/wjQxyzx5MPcK0/xcbuMjP4cfrWZ
 1wqpKBtkiP8dLxVyxUELvV36YfN6GssLDtS+d8wXN64heEqBayMH/+ej8R18Or0TqJzf
 VUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HgLUw1PhteCNPI8sPDiupyYC9yeutB/HXKoZYukFVKI=;
 b=3aHNSBBMwWstZhBMoDe94dwob04EcBNovF18jzDNT/GK4/3b+RU8NZOoE4717K7n+0
 9F1UOKsoWK/V1EpmwxjaJdj22B7kpy7tHME69aomGhN1KjBiTZ14UYo3oHGOxKLU41hN
 oeSHE9JxIG7viDtkglqb3j5tuYjAAj8bvV81nvirkdHk2wqpBPpCnzV7cU8KXOFb+9SS
 MPyckHiKBpiCFym8Fg9D/pL674DhMKDHKiYcDUwo2FlfYLrLAKiNZxwEP43GNTXSNUaa
 KGor33bOYjys4sO8HyfjFaQx6noXMPc3Iwz7rbU+jud3N2Io8vXkBuWZ6lS3iEscIYKw
 w+oA==
X-Gm-Message-State: AO0yUKVk+/hvW+4JMg4J3Dgm5RwJEThKGXL3SRazMo46Q6CMDmK7DEUf
 +ERjhM8N2ssxhmziX3xLdNcWFg==
X-Google-Smtp-Source: AK7set9cuj8TlG1EIrMpXEoARaeczICbTNeZbhRngvYeX65Qs5XdVco0wZ80MHNMBz40jtEjjWmrwg==
X-Received: by 2002:a05:600c:340a:b0:3dc:45a7:2b8a with SMTP id
 y10-20020a05600c340a00b003dc45a72b8amr12542640wmp.10.1676025295517; 
 Fri, 10 Feb 2023 02:34:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm7937958wmq.48.2023.02.10.02.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 02:34:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Feb 2023 11:34:50 +0100
Subject: [PATCH v2 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v2-1-529da2203659@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
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

The SM8450 & SM350 shares the same DT TX IP version, use the
SM8350 compatible as fallback for SM8450.

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

