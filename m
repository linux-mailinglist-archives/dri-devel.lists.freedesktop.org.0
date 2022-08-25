Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319FD5A0D3E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 11:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43AD11B550;
	Thu, 25 Aug 2022 09:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1DD113B9D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:15 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n24so16855980ljc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DvaJK17gV4B+bl1ZbEWU+oqW67fAbVfCADxcKfyU+fo=;
 b=jrMX2sKeb7fmWWgdwU0PRGp30JE12BX2p6j9usPnDrXjswJ4bzVW1QN3IlrPHB62Bi
 +EFnKvG7IvmbLuwH4GiwE2lrxqWAUCT6nk1vVWJlPSGkwMh+CqVpZwkOw9MGxIyghOWG
 c6I7mhb7EPuxMwtG2InqAxOCsfKCjOUpJ5v8uBazJEdiDtbVyrc22rrbpbVVazy1e9Pn
 8RWOnSABSUWvSzKr8KqT/gD5zeUgri2Fx4v6K0YE7yrk3ICuVMgfSsMuCE23gku0kQWQ
 HC6R1yJRJdZDWFOE49kEHMX+aI0ArOyaY0j+ucltO6vQjFr81G+RRj4zgJDJxc2othN1
 48Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DvaJK17gV4B+bl1ZbEWU+oqW67fAbVfCADxcKfyU+fo=;
 b=w+GoIwOjUZEjsbtAu+9F0SucpDllO5ad98EJxU/jcsz2+iWh3F+9DaAd+svPzZdLFd
 0pqojk2xFoZvZSF4MLd/hK5ViH1slfTtjPurUZSbfPQ6eopRqMrgcoYGLCGsNTUwjIt3
 5lT2AR4Co01nyk5o4rFKztfHbHZWXVFtd4IqJvaZKcer9+d7nNkzDp2bzWOc74gjM8eT
 /pXq6tXYtAKmzBVumn2bUrgvHD5hKHoTXHtlz8IJDii1g4Jpgk7jn6TBmlYFv5y2LZRU
 rrcirHgH2WrTxfuJOxINAFKR9JNpDhBySI+ShuUUmJwUWN3s2nUPgjbZCZKF81lMSpgb
 lQHQ==
X-Gm-Message-State: ACgBeo3r7U6BQ2tE62b6cHh3dGKXmy0kt9WgkFucv9VvEDWKJ+U+u6VS
 yJ6SyoPrcjw0HT375ToFwKzknA==
X-Google-Smtp-Source: AA6agR6YfoBwsTqR20ybFZO3sNncqpFoke6wtT679ceGxCwxo1h5VJwbmkf3yMwRokjXS5wG7ZrvsA==
X-Received: by 2002:a2e:84d7:0:b0:261:e692:511a with SMTP id
 q23-20020a2e84d7000000b00261e692511amr847690ljh.32.1661421074575; 
 Thu, 25 Aug 2022 02:51:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 10/10] dt-bindings: display/msm: add support for the
 display on SM8250
Date: Thu, 25 Aug 2022 12:51:03 +0300
Message-Id: <20220825095103.624891-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
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

Add DPU schema and extend MDSS schema to describe MDSS and DPU blocks on
Qualcomm SM8250 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sm8250.yaml      | 123 ++++++++++++++++++
 .../devicetree/bindings/display/msm/mdss.yaml |  51 ++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
new file mode 100644
index 000000000000..26e71a0feb96
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SM8250
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: |
+  Device tree bindings for the DPU display controller for SM8250 target.
+
+properties:
+  compatible:
+    const: qcom,sm8250-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display ahb clock
+      - description: Display hf axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    mdss@ae00000 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "qcom,sm8250-mdss";
+      reg = <0x0ae00000 0x1000>;
+      reg-names = "mdss";
+
+      interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+                      <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
+      interconnect-names = "mdp0-mem", "mdp1-mem";
+
+      power-domains = <&dispcc MDSS_GDSC>;
+
+      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+               <&gcc GCC_DISP_HF_AXI_CLK>,
+               <&gcc GCC_DISP_SF_AXI_CLK>,
+               <&dispcc DISP_CC_MDSS_MDP_CLK>;
+      clock-names = "iface", "bus", "nrt_bus", "core";
+
+      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      iommus = <&apps_smmu 0x820 0x402>;
+      ranges;
+
+      display-controller@ae01000 {
+        compatible = "qcom,sm8250-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "core", "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SM8250_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_in>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            endpoint {
+              remote-endpoint = <&dsi1_in>;
+            };
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index 1b469893732a..57fa8dedc82b 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sc7180-mdss
       - qcom,sc7280-mdss
       - qcom,sdm845-mdss
+      - qcom,sm8250-mdss
 
   reg:
     minItems: 1
@@ -232,6 +233,30 @@ allOf:
         iommus:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock
+            - description: Display hf axi clock
+            - description: Display sf axi clock
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: nrt_bus
+            - const: core
+
+        iommus:
+          minItems: 1
+
   - if:
       properties:
         compatible:
@@ -441,6 +466,32 @@ allOf:
               enum:
                 - qcom,dsi-phy-10nm
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-mdss
+    then:
+      patternProperties:
+        "^display-controller@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,sm8250-dpu
+
+        "^dsi@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,mdss-dsi-ctrl
+
+        "^dsi-phy@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,dsi-phy-7nm
+
 required:
   - compatible
   - reg
-- 
2.35.1

