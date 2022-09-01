Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA75A9476
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51CB10E6B3;
	Thu,  1 Sep 2022 10:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B0410E6A6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id by6so17375635ljb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
 b=kXkcAHCKeVbArfeueplPddDNJ6GGQ33c16EWLmeN+VykMBSabEJuCPbPFTczn1hMtQ
 kKnA29lmLHn/fxL2z9cQPVPM2PjyUzaLNOHEOLR7bF6/26mDgi7OOyFlNs763rSGbXLP
 L5J5ACqVcoITHp9lapY8B6yVjzCkTjaAQ+aEF/lzXpGCtx+ElOefZVCruXe3yZ1p9qBL
 AXYKb7W3cQM1KjwBd0z1ydtA1Rlao07eSvGRwJjp8DS7FXbgpHCGq0jby3a8yUKTNK0M
 UJIpwozUSNqnCq9K+Wb6pl3D4Ejk1KRT88xvtXjcSFej3ZREhHuHtqvkhoaPTAEvKY5w
 TSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
 b=qOUdjL9/eZ4cEfKPSItMnOhFhxa79kg0M+0oKXcS7NoCC5mbOYT7ynx1xwhrk+3ehE
 JUekMtPCJOVEDl6T0XfjeEi52mBAqp2VR/LRbsFqgtqBQ0w8lT1Ijg7mTvlHITApWI40
 8qoVsIyiIziDKM3+mihRrQi3jQdu3bFoW1CpjqFCQG4axpUjygEu0TAYgj5W6VueN/TW
 XN1zP/seBVJYVC+KOaG9LLQzubunALtCG8du9sQgPZGQqF+mjFXuKX5wPk31l8KVWhbb
 6QJDZPunvVUXiyHlmalclCv5h56898m5aB8eAAEX4Ge0yD/MtNbPKYeY/twEHYz+Xi7v
 tTGQ==
X-Gm-Message-State: ACgBeo0snLAzjQ6f7wJDBn3oVghO9EAEyZOAVrkhMD7Nuv9t+yBlMlEG
 RQLYc5RQ1F+eCOIaH1rv/P3z5Q==
X-Google-Smtp-Source: AA6agR648tmCUlzFuOWdj2ovCrgM3LOaJhn94D1LipEaS+mOZAZyZddv9ZH7JgjawGcjowk4eZiGTA==
X-Received: by 2002:a2e:140d:0:b0:268:cb78:40de with SMTP id
 u13-20020a2e140d000000b00268cb7840demr302489ljd.232.1662027805313; 
 Thu, 01 Sep 2022 03:23:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 11/12] dt-bindings: display/msm: add missing device nodes
 to mdss-* schemas
Date: Thu,  1 Sep 2022 13:23:11 +0300
Message-Id: <20220901102312.2005553-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
schemas.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/mdss-msm8998.yaml    | 12 +++++++++
 .../bindings/display/msm/mdss-qcm2290.yaml    |  6 +++++
 .../bindings/display/msm/mdss-sc7180.yaml     | 18 +++++++++++++
 .../bindings/display/msm/mdss-sc7280.yaml     | 26 +++++++++++++++++++
 .../bindings/display/msm/mdss-sdm845.yaml     | 12 +++++++++
 5 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
index 3482468fb2d4..f00a48a24521 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
@@ -44,6 +44,18 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
index 7a6c3178f02c..1160c5435236 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
@@ -50,6 +50,12 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
index 27d944f0e471..38e474ae90a3 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
@@ -50,6 +50,24 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
index db843412abf9..fcacbc5c5e2c 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
@@ -49,6 +49,32 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
index 0bc148f7fbd9..09a8aa9837ea 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
@@ -48,6 +48,18 @@ patternProperties:
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

