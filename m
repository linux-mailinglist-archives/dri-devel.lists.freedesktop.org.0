Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42382B2E31A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3C510E79A;
	Wed, 20 Aug 2025 17:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="N/WmSZBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0512310E798
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710057; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ObMaH3mHphHRVfj/SuZ/lgu0YuH0oSE7BtryjY68mkbDyvb0h7LaNt0tCA12MtojTpgXadK9tDCNciNu/eLIsKHV7vyHigTWHHkqQBo7/r71EzTu7011LgKH1ALsORi9TW01nKCFStbiOPbWSDi+hIi78pLwNtkjUEI2e8bZ6Eo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710057;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fGyg3H1h7qtC7IiosN8D0VNRwjGFKzIOGXQjB2eNft0=; 
 b=j+x5jFfsd6AKI8KR08IB9a+5JJIog/s7sE/gMESu+BhdjX9zxcKTM8kzX/kb4n3njaCa0fXk53u/5gYvWwA/B/aaZOliSd2lG3s3ixQ1/ppoeobdCRT0RBtgPOiYmca/wmTfB7aqcLhTMVBNjvr0O1duQPtSLWCKWCDnbzmXyNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710057; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fGyg3H1h7qtC7IiosN8D0VNRwjGFKzIOGXQjB2eNft0=;
 b=N/WmSZBo6R8xuTcm5Fv3Z60ELBgyDSPG6NCJjDtE+zmmxH+ZrfovuU+qFspB3Qos
 oyP4smH5rmlBCTFziEJ9+wFrb6QqeZmMYvClt1frsRQzDteTWyOpD9YeYf/fq7mspOE
 Nh4L43gjJ7CXDkyiLVkKiZGcbk6LJov7/lQ1oD0s=
Received: by mx.zohomail.com with SMTPS id 1755710054878857.3905028428259;
 Wed, 20 Aug 2025 10:14:14 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 01/14] media: dt-bindings: Convert MediaTek mt8173-mdp
 bindings to YAML
Date: Wed, 20 Aug 2025 14:12:49 -0300
Message-ID: <20250820171302.324142-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Convert the existing text-based DT bindings for MediaTek MT8173 Media Data Path
to a YAML schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 ++++++++++++++++++
 .../bindings/media/mediatek-mdp.txt           |  95 ----------
 2 files changed, 174 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
new file mode 100644
index 0000000000000..f3a08afc305b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 Media Data Path
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+description:
+  Media Data Path is used for scaling and color space conversion.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8173-mdp-rdma
+              - mediatek,mt8173-mdp-rsz
+              - mediatek,mt8173-mdp-wdma
+              - mediatek,mt8173-mdp-wrot
+      - items:
+          - enum:
+              - mediatek,mt8173-mdp-rdma
+              - mediatek,mt8173-mdp-rsz
+              - mediatek,mt8173-mdp-wdma
+              - mediatek,mt8173-mdp-wrot
+          - const: mediatek,mt8173-mdp
+
+  reg:
+    maxItems: 1
+
+  clocks: true
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description: |
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
+
+  mediatek,vpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Describes point to vpu.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp-rdma
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+            - description: Mutex clock
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-mdp-rdma
+              - mediatek,mt8173-mdp-wdma
+              - mediatek,mt8173-mdp-wrot
+    then:
+      required:
+        - iommus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp
+    then:
+      required:
+        - mediatek,vpu
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mdp_rdma0: rdma@14001000 {
+            compatible = "mediatek,mt8173-mdp-rdma",
+                         "mediatek,mt8173-mdp";
+            reg = <0 0x14001000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+            mediatek,vpu = <&vpu>;
+        };
+
+        mdp_rdma1: rdma@14002000 {
+            compatible = "mediatek,mt8173-mdp-rdma";
+            reg = <0 0x14002000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
+        };
+
+        mdp_rsz0: rsz@14003000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14003000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz1: rsz@14004000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14004000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz2: rsz@14005000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14005000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ2>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_wdma0: wdma@14006000 {
+            compatible = "mediatek,mt8173-mdp-wdma";
+            reg = <0 0x14006000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WDMA>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WDMA>;
+        };
+
+        mdp_wrot0: wrot@14007000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14007000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT0>;
+        };
+
+        mdp_wrot1: wrot@14008000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14008000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
deleted file mode 100644
index 53ef26e2c8570..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ /dev/null
@@ -1,95 +0,0 @@
-* Mediatek Media Data Path
-
-Media Data Path is used for scaling and color space conversion.
-
-Required properties (controller node):
-- compatible: "mediatek,mt8173-mdp"
-- mediatek,vpu: the node of video processor unit, see
-  Documentation/devicetree/bindings/media/mediatek-vpu.txt for details.
-
-Required properties (all function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"  - read DMA
-        "mediatek,mt8173-mdp-rsz"   - resizer
-        "mediatek,mt8173-mdp-wdma"  - write DMA
-        "mediatek,mt8173-mdp-wrot"  - write DMA with rotation
-- reg: Physical base address and length of the function block register space
-- clocks: device clocks, see
-  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- power-domains: a phandle to the power domain, see
-  Documentation/devicetree/bindings/power/power_domain.txt for details.
-
-Required properties (DMA function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"
-        "mediatek,mt8173-mdp-wdma"
-        "mediatek,mt8173-mdp-wrot"
-- iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Example:
-	mdp_rdma0: rdma@14001000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-			     "mediatek,mt8173-mdp";
-		reg = <0 0x14001000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA0>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-		mediatek,vpu = <&vpu>;
-	};
-
-	mdp_rdma1: rdma@14002000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-		reg = <0 0x14002000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA1>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-	};
-
-	mdp_rsz0: rsz@14003000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14003000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz1: rsz@14004000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14004000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz2: rsz@14005000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14005000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ2>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_wdma0: wdma@14006000 {
-		compatible = "mediatek,mt8173-mdp-wdma";
-		reg = <0 0x14006000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WDMA>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WDMA>;
-	};
-
-	mdp_wrot0: wrot@14007000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14007000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT0>;
-	};
-
-	mdp_wrot1: wrot@14008000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14008000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT1>;
-	};
-- 
2.50.1

