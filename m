Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609673FFC01
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 10:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B626E859;
	Fri,  3 Sep 2021 08:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345226E859
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tr0ddP4NgNhsSZnuHub7Y4GakNla0tVT7enxei0s1S0=; b=Q/nHAd5T8WYrSTxrSIy328lNo3
 DI+wrnGaWxfe8kh/npvZbiPE7STAqTWJWyfNIx1Raowk/5M8rysxsEqJ+5YFclEbtlAynNFH67Jo7
 NE1hhIX6eckDq+Psa+Wdf42Aa6NbIJBP8APcJ/ZRxrVQulpUKveOG0qJ+ouh1TAlkE2v6QZLT7LGk
 RkKd9OKoG9D8sK7PRewsg2fPymBRVjROfpATQhov8ZB6baAerAS2unP79TMdNVMXXg89JYfV8QVBf
 mzsUoD9ySlIRjXhGRA0edbFBJZAyG9gDp30pp7bnyDh6RPhL0roRSJnxjm7+DXys7L+EmHMJI0/+O
 EKxlUkGQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mM4cI-0004xK-R5; Fri, 03 Sep 2021 11:32:06 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v4 1/3] dt-bindings: Add YAML bindings for NVDEC
Date: Fri,  3 Sep 2021 11:31:53 +0300
Message-Id: <20210903083155.690022-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210903083155.690022-1-mperttunen@nvidia.com>
References: <20210903083155.690022-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add YAML device tree bindings for NVDEC, now in a more appropriate
place compared to the old textual Host1x bindings.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v4:
* Fix incorrect compatibility string in 'if' condition
v3:
* Drop host1x bindings
* Change read2 to read-1 in interconnect names
v2:
* Fix issues pointed out in v1
* Add T194 nvidia,instance property
---
 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
new file mode 100644
index 000000000000..33d01c7dc759
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra NVDEC
+
+description: |
+  NVDEC is the hardware video decoder present on NVIDIA Tegra210
+  and newer chips. It is located on the Host1x bus and typically
+  programmed through Host1x channels.
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
+      - description: DMA read 2 memory client
+      - description: DMA write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: read-1
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
+if:
+  properties:
+    compatible:
+      contains:
+        const: nvidia,tegra194-nvdec
+then:
+  properties:
+    nvidia,instance:
+      items:
+        - description: 0 for NVDEC0, or 1 for NVDEC1
+
+additionalProperties: true
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
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD1 &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
+            interconnect-names = "dma-mem", "read-1", "write";
+            iommus = <&smmu TEGRA186_SID_NVDEC>;
+    };
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 69932194e1ba..ce9e360639d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6230,6 +6230,7 @@ L:	linux-tegra@vger.kernel.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/tegra/linux.git
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+F:	Documentation/devicetree/bindings/gpu/host1x/
 F:	drivers/gpu/drm/tegra/
 F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
-- 
2.32.0

