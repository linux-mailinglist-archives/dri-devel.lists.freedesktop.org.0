Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E47AE0AE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 23:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831DF10E32E;
	Mon, 25 Sep 2023 21:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5857E10E32D;
 Mon, 25 Sep 2023 21:25:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4DD4A61217;
 Mon, 25 Sep 2023 21:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1181C433C7;
 Mon, 25 Sep 2023 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695677103;
 bh=HoOnTELEcUC85sif82a+6bfiATqMr00eOOaa4KC4gpo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BaR9zA9GFDh0IduIP+JwLkT+fzYHeiEqp81N3/bOmQjfHVlXgtMcBTrd21OJ/GR9u
 NfXLKx2Pq8BJRMOvO+ObbrzK3edKY4d7s+JPcTTZjPjzEpzDg2nsyfXksamX9ebDnq
 hbZl0gI7ojAmdWmTEjmQ2NQPBQhzpo+7JtYviBLDoXGk0mk/tvMuo70qSFg/M1KfQD
 yxEnq6uSadlkDXKy/Gb33eyO7TGX40jJn99BufVVSXmyX8s150DoOo8VIU1T71otwi
 UxT1OsuDfReK0LTnogl2esFAYKW+xp06UEHZR6juHUaS2JSBDJDwkzPGtoBingxz50
 Fz1mEB+w28AiQ==
Received: (nullmailer pid 1973086 invoked by uid 1000);
 Mon, 25 Sep 2023 21:24:59 -0000
From: Rob Herring <robh@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/2] dt-bindings: display: msm: Make "additionalProperties:
 true" explicit
Date: Mon, 25 Sep 2023 16:24:25 -0500
Message-Id: <20230925212434.1972368-2-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925212434.1972368-1-robh@kernel.org>
References: <20230925212434.1972368-1-robh@kernel.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it explicit that child nodes have additional properties and the
child node schema is not complete. The complete schemas are applied
separately based the compatible strings.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/msm/qcom,msm8998-mdss.yaml        |  6 ++++++
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml        |  6 ++++++
 .../bindings/display/msm/qcom,sc7180-mdss.yaml         |  8 ++++++++
 .../bindings/display/msm/qcom,sc7280-mdss.yaml         | 10 ++++++++++
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml       |  4 ++++
 .../bindings/display/msm/qcom,sdm845-mdss.yaml         |  8 ++++++++
 .../bindings/display/msm/qcom,sm6115-mdss.yaml         |  6 ++++++
 .../bindings/display/msm/qcom,sm6125-mdss.yaml         |  6 ++++++
 .../bindings/display/msm/qcom,sm6350-mdss.yaml         |  6 ++++++
 .../bindings/display/msm/qcom,sm6375-mdss.yaml         |  6 ++++++
 .../bindings/display/msm/qcom,sm8150-mdss.yaml         |  6 ++++++
 .../bindings/display/msm/qcom,sm8250-mdss.yaml         |  6 ++++++
 .../bindings/display/msm/qcom,sm8350-mdss.yaml         |  8 ++++++++
 .../bindings/display/msm/qcom,sm8450-mdss.yaml         |  8 ++++++++
 .../bindings/display/msm/qcom,sm8550-mdss.yaml         |  8 ++++++++
 15 files changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index e320ab1de6de..2d9edab5a30d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -38,12 +38,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,msm8998-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -52,6 +56,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-10nm-8998
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 4184b84d4c21..5ad155612b6c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -44,18 +44,24 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-14nm-2290
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 3b9c103e504a..3432a2407caa 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -44,18 +44,24 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sc7180-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sc7180-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -64,6 +70,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-10nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 43500dad66e7..bbb727831fca 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -44,18 +44,24 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sc7280-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sc7280-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -64,12 +70,16 @@ patternProperties:
 
   "^edp@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sc7280-edp
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         enum:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index db680fb12b6a..af79406e1604 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -34,12 +34,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sc8280xp-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         enum:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index d6d7ac1b2ef8..6e8b69e5ec62 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -42,18 +42,24 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sdm845-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sdm845-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -62,6 +68,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-10nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 17221b62a642..dde5c2acead5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -32,12 +32,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm6115-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         oneOf:
@@ -50,6 +54,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-14nm-2290
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
index 57f0e3647711..671c2c2aa896 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
@@ -43,12 +43,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm6125-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -57,6 +61,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm6125-dsi-phy-14nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
index db255b1f4c20..e1dcb453762e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -43,12 +43,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm6350-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -57,6 +61,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-10nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
index 30d36fffaedb..b15c3950f09d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
@@ -43,12 +43,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm6375-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -57,6 +61,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm6375-dsi-phy-7nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index 54cdaa827cd3..a2a8be7f64a9 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -47,12 +47,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8150-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -61,6 +65,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-7nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index e887f031b8be..994975909fea 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -46,12 +46,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8250-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -60,6 +64,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,dsi-phy-7nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 60d4aae1131b..163fc83c1e80 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -48,18 +48,24 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8350-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8350-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -68,6 +74,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8350-dsi-phy-5nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index bb22940b9385..001b26e65301 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -38,12 +38,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8450-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -52,6 +56,8 @@ patternProperties:
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -60,6 +66,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8450-dsi-phy-5nm
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 48aea8005c86..1ea50a2c7c8e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -38,12 +38,16 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8550-dpu
 
   "^displayport-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -52,6 +56,8 @@ patternProperties:
 
   "^dsi@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         items:
@@ -60,6 +66,8 @@ patternProperties:
 
   "^phy@[0-9a-f]+$":
     type: object
+    additionalProperties: true
+
     properties:
       compatible:
         const: qcom,sm8550-dsi-phy-4nm
-- 
2.40.1

