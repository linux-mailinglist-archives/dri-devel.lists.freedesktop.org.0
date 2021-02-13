Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181131AABA
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 11:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212146E40C;
	Sat, 13 Feb 2021 10:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07866E40C
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FVyYtRwRXp6mNAGUHvqXR7rUywbBXvP63wrm/PTvdkc=; b=DxOJowKs/6HBl3DAzGXwlUk+gM
 XIGpVw/RRF64il1wt0SPf0v+iiIARWW+Fp/gKO3wmvJiBXi/A96MUvmp9EjBSkBrURTCLdBzS87Dc
 gAl/j18biGxPPfyWe2Ff+m7ueSCFVAq48Ez39V7q64ajAedTsorh+v+oaAtCFgNgUKI8+y7bmOXtx
 3Mfq+dalfQqwMnatsYUFYluYzGI2g49bx+d2jtFgJc6nLlhY5+spgRqrb2Sy6ZaYahEOMUKD6q1Zc
 hDk/sWlbSxNX7+HB7EpAavzJqDZHwgn7Zfgs4LYBIGJB7HTIyab2I2z6wIXvOLZ+nf9bzrRazzjk6
 z/ma58ig==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lArxe-0002D2-Li; Sat, 13 Feb 2021 12:15:34 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Subject: [PATCH 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
Date: Sat, 13 Feb 2021 12:15:10 +0200
Message-Id: <20210213101512.3275069-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210213101512.3275069-1-mperttunen@nvidia.com>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the original Host1x bindings to YAML and add new bindings for
NVDEC, now in a more appropriate location. The old text bindings
for Host1x and engines are still kept at display/tegra/ since they
encompass a lot more engines that haven't been converted over yet.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 ++++++++++++++++++
 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 220 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
new file mode 100644
index 000000000000..613c6601f0f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra20-host1x.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Host1x
+
+maintainers:
+  - Thierry Reding <treding@gmail.com>
+  - Mikko Perttunen <mperttunen@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^host1x@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra20-host1x
+      - const: nvidia,tegra30-host1x
+      - const: nvidia,tegra114-host1x
+      - const: nvidia,tegra124-host1x
+      - items:
+          - const: nvidia,tegra132-host1x
+          - const: nvidia,tegra124-host1x
+      - const: nvidia,tegra210-host1x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Syncpoint threshold interrupt
+      - description: General interrupt
+
+  interrupt-names:
+    items:
+      - const: syncpt
+      - const: host1x
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: host1x
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: host1x
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+
+additionalProperties:
+  type: object
+
+if:
+  properties:
+    compatible:
+      contains:
+        anyOf:
+          - const: nvidia,tegra186-host1x
+          - const: nvidia,tegra194-host1x
+then:
+  properties:
+    reg:
+      items:
+        - description: Hypervisor-accessible register area
+        - description: VM-accessible register area
+    reg-names:
+      items:
+        - const: hypervisor
+        - const: vm
+  required:
+    - reg-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    host1x@50000000 {
+        compatible = "nvidia,tegra20-host1x";
+        reg = <0x50000000 0x00024000>;
+        interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
+                      <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+        interrupt-names = "syncpt", "host1x";
+        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
+        clock-names = "host1x";
+        resets = <&tegra_car 28>;
+        reset-names = "host1x";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x54000000 0x54000000 0x04000000>;
+    };
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
new file mode 100644
index 000000000000..9a6334d930c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra VIC
+
+maintainers:
+  - Thierry Reding <treding@gmail.com>
+  - Mikko Perttunen <mperttunen@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^nvdec@[0-9a-f]*$"
+
+  compatible:
+    enum:
+      - nvidia,tegra210-nvdec
+      - nvidia,tegra186-nvdec
+      - nvidia,tegra194-nvdec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: nvdec
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: nvdec
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: DMA read memory client
+      - description: DMA write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: write
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    nvdec@15480000 {
+            compatible = "nvidia,tegra186-nvdec";
+            reg = <0x15480000 0x40000>;
+            clocks = <&bpmp TEGRA186_CLK_NVDEC>;
+            clock-names = "nvdec";
+            resets = <&bpmp TEGRA186_RESET_NVDEC>;
+            reset-names = "nvdec";
+
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
+            interconnect-names = "dma-mem", "write";
+            iommus = <&smmu TEGRA186_SID_NVDEC>;
+    };
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 8170b40d6236..b892419c6564 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5950,6 +5950,7 @@ L:	linux-tegra@vger.kernel.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/tegra/linux.git
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+F:	Documentation/devicetree/bindings/gpu/host1x/
 F:	drivers/gpu/drm/tegra/
 F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
