Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401487FA476
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7438E10E322;
	Mon, 27 Nov 2023 15:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5110E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:28:58 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50aab3bf71fso5908294e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098937; x=1701703737; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tCPGBitG9/6KXdvU+lPUvXD7HIIGNEDSeEGVdElqkaM=;
 b=XH+hgWH/3/uC1YMU88cuMblEwv94NpBUtQcCsJPh1ls3oHif/JOONHs1Xp60wNglI6
 VY+UlRaWkTgSOr7cI1aXptZxeBldxkXBpiv99qHp+JDB1bWJcnjySj8jn7Xu9mCVFVEi
 hrZaRe5KYXvQmk/hmUP24lm9e2xtIp1KMUt5nm1jV+bvq3XgzewjeHdP1n014MzAAhKh
 pjqJWRmnFREzF3ZfAz923zpqHK65ql3pAeEhxRhAlavFNuDMeGvGWPkSZsszkhuwfK0A
 W20wKvT+5s8ZXZFDiSbBtUrPJnPZWjplwFRPcHEz05mQ8eAxBK9HGYgBC1SNluVQ21LZ
 OKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098937; x=1701703737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tCPGBitG9/6KXdvU+lPUvXD7HIIGNEDSeEGVdElqkaM=;
 b=pokf6fFpT+/vp4BoUGgxyQyRt141lOXG/2Y/aw9qc2nSwBNiMl/+G+ih7QK/upH0Ah
 Q33s4fysQBGehghkjh8eSvzOlI2O1Hbba+K0JEB/OaLqsRv0WI8s8E1WQkqj0nKg5XWf
 RcZ99N7j4MGET4ch4711olRcQ2pg3eCFEV10/+i7Dslq5OeFijjLyK3ZpQQsZhRi8zyS
 94V606YH2fBp3T0vViOfcq4y6jXVzIZFxSef4gP9TUL94Kn3lSaigl4lR0ct7Iz5YpTC
 FYgjK6hqJanAyNg59qQEFyEJJecUrAQKJKpikppsy7cOOpT338Ydl4rbT7CaWVsNJo5a
 HI2w==
X-Gm-Message-State: AOJu0YyzPxlEoOsJWcW50wj+XA1TMrl9iV1PYLo2Epo7+/zi54vVojSq
 QM+owx52wV8vrYZtolniy17xFA==
X-Google-Smtp-Source: AGHT+IH9HFjsaRyEGI/bPEJt0t/pme1c29F8+9ebs0nRfu5ekDAC+NwjiRH9hv37y5bc3wqPAZ2OmQ==
X-Received: by 2002:ac2:4344:0:b0:50b:aee8:bdfb with SMTP id
 o4-20020ac24344000000b0050baee8bdfbmr3090897lfl.2.1701098936988; 
 Mon, 27 Nov 2023 07:28:56 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:28:56 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:42 +0100
Subject: [PATCH v2 02/12] dt-bindings: display: msm: Add reg bus and
 rotator interconnects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-2-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
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
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=10671;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AI8ujGLZlBaJZlOW2pjBLpvVqMuO/BaY4E8wkJtK6AM=;
 b=92JPSK9FgauS056u7gnbDz0tlni42SCYcsIB7205V/h69eeky/CTMVYu3yBn8m9nzQflpHtdq
 QkP37nctQDvDO4bHhFeyPD3umxJLk4TKtT6t5EUgXCgzknfSc2Ms6b/
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

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
other connection paths:
- a path that connects rotator block to the DDR.
- a path that needs to be handled to ensure MDSS register access
  functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
  interconnect.

Describe these paths to allow using them in device trees and in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[Konrad: rework for one vs two MDP paths, update examples]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml   | 18 ++++++++++++++----
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml        | 14 ++++++++++----
 .../bindings/display/msm/qcom,sc7180-mdss.yaml         | 14 ++++++++++----
 .../bindings/display/msm/qcom,sc7280-mdss.yaml         | 14 ++++++++++----
 .../bindings/display/msm/qcom,sm6115-mdss.yaml         | 10 ++++++++++
 .../bindings/display/msm/qcom,sm6125-mdss.yaml         |  8 ++++++--
 .../bindings/display/msm/qcom,sm6350-mdss.yaml         |  8 ++++++--
 .../bindings/display/msm/qcom,sm6375-mdss.yaml         |  8 ++++++--
 .../bindings/display/msm/qcom,sm8450-mdss.yaml         | 13 ++++++++-----
 9 files changed, 80 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index f69196e4cc76..c6305a6e0334 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -61,17 +61,27 @@ properties:
 
   ranges: true
 
+  # This is not a perfect description, but it's impossible to discern and match
+  # the entries like we do with interconnect-names
   interconnects:
     minItems: 1
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    minItems: 1
-    items:
-      - const: mdp0-mem
-      - const: mdp1-mem
+    oneOf:
+      - minItems: 1
+        items:
+          - const: mdp0-mem
+          - const: cpu-cfg
+
+      - minItems: 2
+        items:
+          - const: mdp0-mem
+          - const: mdp1-mem
+          - const: cpu-cfg
 
   resets:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index d71a8e09a798..f0cdb5422688 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -36,10 +36,14 @@ properties:
     maxItems: 2
 
   interconnects:
-    maxItems: 1
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 1
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -98,8 +102,10 @@ examples:
         interrupt-controller;
         #interrupt-cells = <1>;
 
-        interconnects = <&mmrt_virt MASTER_MDP0 &bimc SLAVE_EBI1>;
-        interconnect-names = "mdp0-mem";
+        interconnects = <&mmrt_virt MASTER_MDP0 &bimc SLAVE_EBI1>,
+                        <&bimc MASTER_APPSS_PROC &config_noc SLAVE_DISPLAY_CFG>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
 
         iommus = <&apps_smmu 0x420 0x2>,
                  <&apps_smmu 0x421 0x0>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 3432a2407caa..7a0555b15ddf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -36,10 +36,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 1
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 1
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -106,8 +110,10 @@ examples:
         interrupt-controller;
         #interrupt-cells = <1>;
 
-        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
-        interconnect-names = "mdp0-mem";
+        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>,
+                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_DISPLAY_CFG>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
 
         iommus = <&apps_smmu 0x800 0x2>;
         ranges;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index bbb727831fca..2947f27e0585 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -36,10 +36,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 1
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 1
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -118,8 +122,10 @@ examples:
         interrupt-controller;
         #interrupt-cells = <1>;
 
-        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
-        interconnect-names = "mdp0-mem";
+        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>,
+                        <&gem_noc MASTER_APPSS_PROC &cnoc2 SLAVE_DISPLAY_CFG>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
 
         iommus = <&apps_smmu 0x900 0x402>;
         ranges;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index dde5c2acead5..309de1953c88 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -29,6 +29,16 @@ properties:
   iommus:
     maxItems: 2
 
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
index 671c2c2aa896..3deb9dc81c9c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
@@ -35,10 +35,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
index e1dcb453762e..c9ba1fae8042 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -35,10 +35,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
index b15c3950f09d..8e8a288d318c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
@@ -35,10 +35,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 001b26e65301..747a2e9665f4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -30,10 +30,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 3
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 3
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -91,9 +91,12 @@ examples:
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
-        interconnects = <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
-                        <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+        interconnects = <&mmss_noc MASTER_MDP_DISP &mc_virt SLAVE_EBI1_DISP>,
+                        <&mmss_noc MASTER_MDP_DISP &mc_virt SLAVE_EBI1_DISP>,
+                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_DISPLAY_CFG>;
+        interconnect-names = "mdp0-mem",
+                             "mdp1-mem",
+                             "cpu-cfg";
 
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 

-- 
2.43.0

