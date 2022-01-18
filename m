Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520C4929BB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 16:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAD710E226;
	Tue, 18 Jan 2022 15:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC1A10E226
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 15:35:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v123so28537874wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3yHVxlmHcPx/kimFj7FIZeDPGuzhaFHwPOIDMO1PgQM=;
 b=vLIuyvlA3zAecwnB3fRb+67VCWslFLWAYjZ4WGmK9UfO0gZv3nKveZ5+EjPCaSUOEY
 nHL9t/hgzZZKIfPhQj3C7hDYYjRaFvVuOprBXyBjsOFiiZkT28P4AuAAgpptg/s4kR/t
 12//QWqFBiXv8aN1v+Qerknd3vlqxxRV0qjvGzVCx99XNAjM+R/AlH4+L5EhXOYB+Qog
 wsOTBT8HVu2musPzX3xGEcKPojjjg0EMLlkZzg1oB+HdJ+THrEVZ2QFH+cfNEpxsAGgC
 Ey8s5jjaluXXzfdeqBTNhIZp7VB/irpS4qFLim1gisZiRnh19hvuP4uWAw7lQacyGGCJ
 ymbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3yHVxlmHcPx/kimFj7FIZeDPGuzhaFHwPOIDMO1PgQM=;
 b=3FDRo1ERUdHEJmhfkijMaCn7LQGk9Wczjv8UW5K0nSbD4N3gpOlZfElvqpWqY5BbA7
 A4EraNiEQIW7ExGQ5DFVaFBXn4hdn6JI4bazhyOhNHv0nKCfq9Lru4vOfsSRJk4JS5Kq
 8Y+9K+jU6KFF/n4QSMw+/vpSfUid6SGJGLHVrV+cyZ+D8Mpir40x/PV3HHrAwKnpZqJF
 CSdEofqYS+Xhq7wCRyk0ZunlSyNnVsQGNLlu5bZMWgumq/Jn0DN6A2EIZm//id+8tKM/
 7EFoAUKlCcJTPxT3bLEr/oOxxlgek+HOJKpUTt1BNMKaudLfNJkN+I0Dou772wUIZC/+
 c/kg==
X-Gm-Message-State: AOAM531IscKlVQnGKSxdiiv01xKyrApnqX47epxicjE2hPWrcU+7ViFg
 SvrmuWHkZzIRQ2sI9tsNkCbNZQ==
X-Google-Smtp-Source: ABdhPJxnU+By0HtVR7dFHKyv8rh8bWveU22B0NZ1Mi58eyxN5qc3wxwAYK6xKvJ+8VVSCmXCknMSDw==
X-Received: by 2002:a05:600c:2b8f:: with SMTP id
 j15mr27529317wmc.160.1642520118496; 
 Tue, 18 Jan 2022 07:35:18 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
 by smtp.gmail.com with ESMTPSA id ay21sm3402146wmb.0.2022.01.18.07.35.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jan 2022 07:35:18 -0800 (PST)
From: Loic Poulain <loic.poulain@linaro.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Subject: [PATCH 2/2] dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU
 bindings
Date: Tue, 18 Jan 2022 16:47:34 +0100
Message-Id: <1642520854-32196-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org>
References: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema for DPU device
tree bindings

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
 1 file changed, 214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
new file mode 100644
index 00000000..8766b13
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-qcm2290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for QCM2290 target
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
+  and DPU are mentioned for QCM2290 target.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcm2290-mdss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+  ranges: true
+
+  interconnects:
+    items:
+      - description: Interconnect path specifying the port ids for data bus
+
+  interconnect-names:
+    const: mdp0-mem
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,qcm2290-dpu
+
+      reg:
+        items:
+          - description: Address offset and size for mdp register set
+          - description: Address offset and size for vbif register set
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        items:
+          - description: Display AXI clock from gcc
+          - description: Display AHB clock from dispcc
+          - description: Display core clock from dispcc
+          - description: Display lut clock from dispcc
+          - description: Display vsync clock from dispcc
+
+      clock-names:
+        items:
+          - const: bus
+          - const: iface
+          - const: core
+          - const: lut
+          - const: vsync
+
+      interrupts:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      operating-points-v2: true
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI. Each output port contains an endpoint that
+          describes how it is connected to an external interface.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU_INTF1 (DSI1)
+
+        required:
+          - port@0
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - clocks
+      - interrupts
+      - power-domains
+      - operating-points-v2
+      - ports
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    mdss: mdss@5e00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,qcm2290-mdss", "qcom,mdss";
+        reg = <0x05e00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interconnects = <&mmrt_virt MASTER_MDP0 &bimc SLAVE_EBI1>;
+        interconnect-names = "mdp0-mem";
+
+        iommus = <&apps_smmu 0x420 0x2>,
+                 <&apps_smmu 0x421 0x0>;
+        ranges;
+
+        mdss_mdp: mdp@5e01000 {
+                compatible = "qcom,qcm2290-dpu";
+                reg = <0x05e01000 0x8f000>,
+                      <0x05eb0000 0x2008>;
+                reg-names = "mdp", "vbif";
+
+                clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                         <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                         <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                         <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                         <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                clock-names = "bus", "iface", "core", "lut", "vsync";
+
+                operating-points-v2 = <&mdp_opp_table>;
+                power-domains = <&rpmpd QCM2290_VDDCX>;
+
+                interrupt-parent = <&mdss>;
+                interrupts = <0 IRQ_TYPE_NONE>;
+
+                ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                                reg = <0>;
+                                dpu_intf1_out: endpoint {
+                                        remote-endpoint = <&dsi0_in>;
+                                };
+                        };
+                 };
+         };
+...
-- 
2.7.4

