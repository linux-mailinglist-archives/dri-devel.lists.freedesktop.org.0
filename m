Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B08A5B9C1B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E2F10EB2A;
	Thu, 15 Sep 2022 13:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1315710EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:55 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id k10so30407811lfm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ndo1IO6KSGAzmetveQB/9obZYM/J/Ip210KxKndrUzM=;
 b=UH47L2i+/vnd0TmZalyeB7upxDWliILvKSRwgjiDpUtgQcUpy9wEYxxk8c1ucndong
 k2/3QP3DJHHc4+R9M/eJ7NEuvTpfYlJZQw1nkzW7KcvZTNFGDf73hQGTxKsJDlv5YL4s
 Z+k+bfdPacU7O2krKBE4pnJ+Yy+4wmo8qJyDMYpPVSDRlNwIq7CvIqxNNyLixtssQoDW
 M3sNqsnIomi6O822VAlkbhzPwIo/oxpl5IoYDF9hfp/KQ6sJmGivBLIcEENYnAHJ8n6A
 I+PUUxiFLdFMHF4eyt8rTH0xoIMGc6/l0ba3W1wOJisTxNu7Of0nphFSvv+OVR0NgmNt
 8fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ndo1IO6KSGAzmetveQB/9obZYM/J/Ip210KxKndrUzM=;
 b=SdfTDDw1Au/mrBdm1KtX2npGEdpfWX2+3bGnbAv1ecyeufqC/jETr8gZtAGmybuJih
 tgfj8LNRgDRxHc4WFME/dTCiEbYX+DXasroqbr2G6owK3YQSudG/Ht5xNnEbbJCZ55K4
 c6wJdX7IOTI0tlYe7Rat3eUWwRB0YmnKwF7SNVBE8U21Is3NEixllIbZ9I5KmH/dRY4b
 YGfU6K4FPZ38pFND82io7EDJQ3mrxiMDoot/wcZhVW/UC7vN9463MjpEwG1E+tTtwzSU
 6a6T9hR8f65DEEBDWzJjllbSM80spIaOAytyMex4G4ji7v8JZWhKsR02Ak2c8bLDmysV
 wbbA==
X-Gm-Message-State: ACgBeo1b1XNuNviYpL/LBDhniJIjqbBBIPXIfcz1Xj1qNXE0S4C8fJ06
 ijxmlaf+rCbCOMAIU0JuxL4xMQ==
X-Google-Smtp-Source: AA6agR6n01iyoqKGBdQc5gaZbn+pQ/KHwhkWUj1DFcwEzgq5eBZvTPrqCN1ZRNmt5KS4Rff1swIY+w==
X-Received: by 2002:a05:6512:b0a:b0:492:dacb:33da with SMTP id
 w10-20020a0565120b0a00b00492dacb33damr12959270lfu.668.1663249072902; 
 Thu, 15 Sep 2022 06:37:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 11/12] dt-bindings: display/msm: add missing device nodes
 to mdss-* schemas
Date: Thu, 15 Sep 2022 16:37:41 +0300
Message-Id: <20220915133742.115218-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/msm/qcom,msm8998-mdss.yaml        | 12 +++++++++
 .../display/msm/qcom,qcm2290-mdss.yaml        |  6 +++++
 .../display/msm/qcom,sc7180-mdss.yaml         | 18 +++++++++++++
 .../display/msm/qcom,sc7280-mdss.yaml         | 26 +++++++++++++++++++
 .../display/msm/qcom,sdm845-mdss.yaml         | 12 +++++++++
 5 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index c2550cfb797e..f749821725b1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -43,6 +43,18 @@ patternProperties:
       compatible:
         const: qcom,msm8998-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm-8998
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index c821220eef55..10883e976380 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -49,6 +49,12 @@ patternProperties:
       compatible:
         const: qcom,qcm2290-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-ctrl-6g-qcm2290
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index e507c091b60f..8a72631a863b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -49,6 +49,24 @@ patternProperties:
       compatible:
         const: qcom,sc7180-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7180-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 15c01935ac28..0173cbe3730f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -48,6 +48,32 @@ patternProperties:
       compatible:
         const: qcom,sc7280-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^edp@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-edp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-dsi-phy-7nm
+          - qcom,sc7280-edp-phy
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index b16622f0d41e..f19a34d7fd6c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -47,6 +47,18 @@ patternProperties:
       compatible:
         const: qcom,sdm845-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

