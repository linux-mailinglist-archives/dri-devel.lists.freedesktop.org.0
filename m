Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82C18C5E5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 04:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1511E6EABC;
	Fri, 20 Mar 2020 03:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C1E6EABC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 03:36:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584675414; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=M3t+oAG+0rKLDlYPz2q1I8Jp5bRrYW00ieIVzeM0aqE=;
 b=eXKbDCPrVQV/eIEnuJadYV8hh+PUEQAYLbiQfZUKBjSWSmjnlnhcAoVwFAs2oO14HemGjPk4
 g1+6yDkpBBcjESwFSRqyomWrGzq6l1OnP19Tga+4hQsX+keNU2f9KB79rlLRSQx+V+CVT5sI
 ATZZVHL924vceUcKjK1blnhw3J4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e743a42.7f324d5e1c00-smtp-out-n04;
 Fri, 20 Mar 2020 03:36:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3F528C433D2; Fri, 20 Mar 2020 03:36:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63388C432C2;
 Fri, 20 Mar 2020 03:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63388C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: display: msm: Convert GMU bindings to YAML
Date: Thu, 19 Mar 2020 21:36:10 -0600
Message-Id: <20200320033611.7623-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320033611.7623-1-jcrouse@codeaurora.org>
References: <20200320033611.7623-1-jcrouse@codeaurora.org>
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
 freedreno@lists.freedesktop.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
text bindings.  The 'sram' text from the old binding never applied to
the GMU so it was not converted but all the other properties were correct.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 .../devicetree/bindings/display/msm/gmu.txt   |  65 ---------
 .../devicetree/bindings/display/msm/gmu.yaml  | 123 ++++++++++++++++++
 2 files changed, 123 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
deleted file mode 100644
index 90af5b0a56a9..000000000000
--- a/Documentation/devicetree/bindings/display/msm/gmu.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Qualcomm adreno/snapdragon GMU (Graphics management unit)
-
-The GMU is a programmable power controller for the GPU. the CPU controls the
-GMU which in turn handles power controls for the GPU.
-
-Required properties:
-- compatible: "qcom,adreno-gmu-XYZ.W", "qcom,adreno-gmu"
-    for example: "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
-  Note that you need to list the less specific "qcom,adreno-gmu"
-  for generic matches and the more specific identifier to identify
-  the specific device.
-- reg: Physical base address and length of the GMU registers.
-- reg-names: Matching names for the register regions
-  * "gmu"
-  * "gmu_pdc"
-  * "gmu_pdc_seg"
-- interrupts: The interrupt signals from the GMU.
-- interrupt-names: Matching names for the interrupts
-  * "hfi"
-  * "gmu"
-- clocks: phandles to the device clocks
-- clock-names: Matching names for the clocks
-   * "gmu"
-   * "cxo"
-   * "axi"
-   * "mnoc"
-- power-domains: should be:
-	<&clock_gpucc GPU_CX_GDSC>
-	<&clock_gpucc GPU_GX_GDSC>
-- power-domain-names: Matching names for the power domains
-- iommus: phandle to the adreno iommu
-- operating-points-v2: phandle to the OPP operating points
-
-Example:
-
-/ {
-	...
-
-	gmu: gmu@506a000 {
-		compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
-
-		reg = <0x506a000 0x30000>,
-			<0xb280000 0x10000>,
-			<0xb480000 0x10000>;
-		reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
-
-		interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "hfi", "gmu";
-
-		clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
-			<&gpucc GPU_CC_CXO_CLK>,
-			<&gcc GCC_DDRSS_GPU_AXI_CLK>,
-			<&gcc GCC_GPU_MEMNOC_GFX_CLK>;
-		clock-names = "gmu", "cxo", "axi", "memnoc";
-
-		power-domains = <&gpucc GPU_CX_GDSC>,
-				<&gpucc GPU_GX_GDSC>;
-		power-domain-names = "cx", "gx";
-
-		iommus = <&adreno_smmu 5>;
-
-		operating-points-v2 = <&gmu_opp_table>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
new file mode 100644
index 000000000000..0b8736a9384e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2019-2020, The Linux Foundation, All Rights Reserved
+%YAML 1.2
+---
+
+$id: "http://devicetree.org/schemas/display/msm/gmu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Devicetree bindings for the GMU attached to certain Adreno GPUs
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description: |
+  These bindings describe the Graphics Management Unit (GMU) that is attached
+  to members of the Adreno A6xx GPU family. The GMU provides on-device power
+  management and support to improve power efficiency and reduce the load on
+  the CPU.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-gmu-630.2
+      - const: qcom,adreno-gmu
+
+  reg:
+    items:
+      - description: Core GMU registers
+      - description: GMU PDC registers
+      - description: GMU PDC sequence registers
+
+  reg-names:
+    items:
+      - const: gmu
+      - const: gmu_pdc
+      - const: gmu_pdc_seq
+
+  clocks:
+    items:
+     - description: GMU clock
+     - description: GPU CX clock
+     - description: GPU AXI clock
+     - description: GPU MEMNOC clock
+
+  clock-names:
+    items:
+      - const: gmu
+      - const: cxo
+      - const: axi
+      - const: memnoc
+
+  interrupts:
+    items:
+     - description: GMU HFI interrupt
+     - description: GMU interrupt
+
+
+  interrupt-names:
+    items:
+      - const: hfi
+      - const: gmu
+
+  power-domains:
+     items:
+       - description: CX power domain
+       - description: GX power domain
+
+  power-domain-names:
+     items:
+       - const: cx
+       - const: gx
+
+  iommus:
+    maxItems: 1
+
+  operating-points-v2: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - iommus
+  - operating-points-v2
+
+examples:
+ - |
+   #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
+   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+   #include <dt-bindings/interrupt-controller/irq.h>
+   #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+   gmu: gmu@506a000 {
+        compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
+
+        reg = <0x506a000 0x30000>,
+              <0xb280000 0x10000>,
+              <0xb480000 0x10000>;
+        reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
+
+        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+                 <&gpucc GPU_CC_CXO_CLK>,
+                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+        clock-names = "gmu", "cxo", "axi", "memnoc";
+
+        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "hfi", "gmu";
+
+        power-domains = <&gpucc GPU_CX_GDSC>,
+                        <&gpucc GPU_GX_GDSC>;
+        power-domain-names = "cx", "gx";
+
+        iommus = <&adreno_smmu 5>;
+        operating-points-v2 = <&gmu_opp_table>;
+   };
-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
