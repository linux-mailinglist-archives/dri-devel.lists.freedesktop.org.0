Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F2827786
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 19:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62E610E2AA;
	Mon,  8 Jan 2024 18:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B11310E299
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 18:33:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 408IX6FU118807;
 Mon, 8 Jan 2024 12:33:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704738786;
 bh=yg38KC2ZKTFR0ScGRWiccjiUlUuHqrkcGMhyumVCTFE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FWjdeP1CM2quAtrMyPQL9SmnaBqF9OLzRI4+dQDl+c4Err+eH9yIPuCsMAe/ADM63
 6oNONabE0rlS8XYF/TYcHJC36MlEJtAvdUe/pXw2SM/HFk8lExk4si9xR0Y9GHpPNY
 /OOrDfQP6NXf2HX3yHPgFskKXW3FZ7dW2AWPBLI8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 408IX6aZ123884
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jan 2024 12:33:06 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jan 2024 12:33:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jan 2024 12:33:06 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 408IX3hB051691;
 Mon, 8 Jan 2024 12:33:05 -0600
From: Andrew Davis <afd@ti.com>
To: Frank Binns <frank.binns@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>
Subject: [PATCH RFC v2 02/11] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Date: Mon, 8 Jan 2024 12:32:53 -0600
Message-ID: <20240108183302.255055-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108183302.255055-1-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Andrew Davis <afd@ti.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
multiple vendors. Describe how the SGX GPU is integrated in these SoC,
including register space and interrupts. Clocks, reset, and power domain
information is SoC specific.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../bindings/gpu/img,powervr-sgx.yaml         | 124 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
new file mode 100644
index 0000000000000..bb821e1184de9
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 Imagination Technologies Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,powervr-sgx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies PowerVR SGX GPUs
+
+maintainers:
+  - Frank Binns <frank.binns@imgtec.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,omap3430-gpu # Rev 121
+              - ti,omap3630-gpu # Rev 125
+          - const: img,powervr-sgx530
+      - items:
+          - enum:
+              - ingenic,jz4780-gpu # Rev 130
+              - ti,omap4430-gpu # Rev 120
+          - const: img,powervr-sgx540
+      - items:
+          - enum:
+              - allwinner,sun6i-a31-gpu # MP2 Rev 115
+              - ti,omap4470-gpu # MP1 Rev 112
+              - ti,omap5432-gpu # MP2 Rev 105
+              - ti,am5728-gpu # MP2 Rev 116
+              - ti,am6548-gpu # MP1 Rev 117
+          - const: img,powervr-sgx544
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks: true
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: mem
+      - const: sys
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am6548-gpu
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun6i-a31-gpu
+              - ingenic,jz4780-gpu
+    then:
+      allOf:
+        - if:
+            properties:
+              compatible:
+                contains:
+                  const: allwinner,sun6i-a31-gpu
+          then:
+            properties:
+              clocks:
+                minItems: 2
+                maxItems: 2
+              clock-names:
+                minItems: 2
+                maxItems: 2
+        - if:
+            properties:
+              compatible:
+                contains:
+                  const: ingenic,jz4780-gpu
+          then:
+            properties:
+              clocks:
+                maxItems: 1
+              clock-names:
+                maxItems: 1
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    gpu@7000000 {
+        compatible = "ti,am6548-gpu", "img,powervr-sgx544";
+        reg = <0x7000000 0x10000>;
+        interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&k3_pds 65 TI_SCI_PD_EXCLUSIVE>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b205795da04e..00ba13e019fa6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10462,6 +10462,7 @@ M:	Matt Coster <matt.coster@imgtec.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+F:	Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
 F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
-- 
2.39.2

