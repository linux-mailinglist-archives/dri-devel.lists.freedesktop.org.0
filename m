Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5CE166633
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A279A6EE41;
	Thu, 20 Feb 2020 18:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440966EE3F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:27:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582223231; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bhsJb7HicDLjaH3zB60iJ72a18KQ/U1jBQRM2V9JZUY=;
 b=wmUda+j7BbJcaA4FjLKJyP4tSVP9Z5HKJ9lmV3F67M/ziVU7KTYgFHbObFmkLY0NmZGS0Ox2
 ZQolBBGsa2BmFxY3kFw1G0jLGDF8H5T87xSi6sd2oC/vga3ymNdLqIBsmDfHZi81bxGKcjZK
 mjrsqLoXZpoykx21tgOktdr0nb8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4ecf78.7fb7bb9946f8-smtp-out-n02;
 Thu, 20 Feb 2020 18:27:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5D5F6C447A0; Thu, 20 Feb 2020 18:27:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A17EC433A2;
 Thu, 20 Feb 2020 18:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2A17EC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: display: msm: Convert GMU bindings to YAML
Date: Thu, 20 Feb 2020 11:26:53 -0700
Message-Id: <1582223216-23459-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 smasetty@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
text bindings.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 .../devicetree/bindings/display/msm/gmu.txt        | 116 ------------------
 .../devicetree/bindings/display/msm/gmu.yaml       | 130 +++++++++++++++++++++
 2 files changed, 130 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
deleted file mode 100644
index bf9c7a2..0000000
--- a/Documentation/devicetree/bindings/display/msm/gmu.txt
+++ /dev/null
@@ -1,116 +0,0 @@
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
-Optional properties:
-- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
-        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
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
-
-a3xx example with OCMEM support:
-
-/ {
-	...
-
-	gpu: adreno@fdb00000 {
-		compatible = "qcom,adreno-330.2",
-		             "qcom,adreno";
-		reg = <0xfdb00000 0x10000>;
-		reg-names = "kgsl_3d0_reg_memory";
-		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "kgsl_3d0_irq";
-		clock-names = "core",
-		              "iface",
-		              "mem_iface";
-		clocks = <&mmcc OXILI_GFX3D_CLK>,
-		         <&mmcc OXILICX_AHB_CLK>,
-		         <&mmcc OXILICX_AXI_CLK>;
-		sram = <&gmu_sram>;
-		power-domains = <&mmcc OXILICX_GDSC>;
-		operating-points-v2 = <&gpu_opp_table>;
-		iommus = <&gpu_iommu 0>;
-	};
-
-	ocmem@fdd00000 {
-		compatible = "qcom,msm8974-ocmem";
-
-		reg = <0xfdd00000 0x2000>,
-		      <0xfec00000 0x180000>;
-		reg-names = "ctrl",
-		             "mem";
-
-		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
-		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
-		clock-names = "core",
-		              "iface";
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		gmu_sram: gmu-sram@0 {
-			reg = <0x0 0x100000>;
-			ranges = <0 0 0xfec00000 0x100000>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
new file mode 100644
index 0000000..776ff92
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -0,0 +1,130 @@
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
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+       Phandle to a IOMMU device and stream ID. Refer to ../../iommu/iommu.txt
+       for more information.
+
+  operating-points-v2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the OPP table for the available GMU frequencies. Refer to
+      ../../opp/opp.txt for more information.
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
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
