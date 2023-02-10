Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA0692106
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 15:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8648210ED4E;
	Fri, 10 Feb 2023 14:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D5A10E153
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 14:44:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6436230wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 06:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=bXizAmn2gf0l5vIIzA92CHnCI90y5zxHF1fXqgncVuKHCS77Q3D5dX9iGaIFs9nDhu
 C+H3yF83O/IQfEiQedMza0rr5jnHK1qn0KnFTo3lH5RPjef/1MOizRV2t8dLAF5e1EqE
 aFF5XVqeTnJsryypRP5oYQM32y5dtrFDAFzTrUqzEub1nErdKbjVxYL7blrJpoMDEWMR
 A+d+z+vWmLE+Lu6LP0byail3av2zRMQKxRN5SvkOikfHoPvbNydOKTxmdX2BBfmpc7si
 HTt5Jn9DyQEDoPGtMwqXnTmjodrSANgJ6cIl5EUo1d96F9J5HlKaHHq+D7gJl712Q1k6
 QDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=lyZesy1OTr1ACueMDxIUyHUnJYL3sXOTdWD4mRV31fCJ58SOicNYSvPMx9KtyYxxG1
 8M1vcFjlRjsO1nC3knqAotS+uiRDQLapofGt8rl0MnSSnyaAnx7DebbX8A+W2Q6WbkWF
 Rj+56p9od2YIj3aYgN/FQsw3FVxtg7YmnOJJQZy7ZNdKuVxBvMnUwPgOGlDlyHG9bF2n
 MmZhw8jXsySyBTmydt7Hz4dtxB14YTuatoagpCiF/mvdUNUiVcm2qyR2BIwGe71IxVaP
 Hql5cuR27ws+oKS1LcLgaCQ3srPornzNb3ssMRXbftqcx6dEzlkcw69CEliIGMPIN3nG
 zyQw==
X-Gm-Message-State: AO0yUKVoy2uMs9RqZFIHgaxf+7lbaBZj59qRehu8FnKy7EO4FF8HNvrY
 hpkcfzjXak8Cv2ScVxLHHVzfNQ==
X-Google-Smtp-Source: AK7set+dGBFdCroYD2odoMoBeu4+jdR3D8Rinih/XtZOitYmHrSq67Oop1sb+cCj4mAx9+Ydrjt6QA==
X-Received: by 2002:a05:600c:4d97:b0:3de:e8c5:d833 with SMTP id
 v23-20020a05600c4d9700b003dee8c5d833mr16841360wmp.22.1676040268518; 
 Fri, 10 Feb 2023 06:44:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 l40-20020a05600c1d2800b003dd1b00bd9asm6103000wms.32.2023.02.10.06.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 06:44:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Feb 2023 15:44:21 +0100
Subject: [PATCH v3 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v3-1-636ef9e99932@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
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

