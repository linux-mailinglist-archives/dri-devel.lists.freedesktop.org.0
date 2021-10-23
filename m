Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA16438489
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1D46E830;
	Sat, 23 Oct 2021 17:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5162D6E824
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 11:14:58 +0000 (UTC)
X-UUID: ce5df9540e7a47ab8c002ca4e845a8f2-20211023
X-UUID: ce5df9540e7a47ab8c002ca4e845a8f2-20211023
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 295213227; Sat, 23 Oct 2021 19:14:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:14:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:51 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 03/13] dt-bindings: soc: mediatek: apusys: Add new document for
 APU tinysys
Date: Sat, 23 Oct 2021 19:13:59 +0800
Message-ID: <20211023111409.30463-4-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 23 Oct 2021 17:35:54 +0000
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

Add new document for APU tinysys.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 .../soc/mediatek/mediatek,apu-rv.yaml         | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml
new file mode 100644
index 000000000000..ee0ff5d656e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# # Copyright 2021 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/mediatek,apu-rv.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek APU Power
+
+description: |
+  APU integrated subsystem having MD32RV33 (MD32) that runs tinysys
+  The tinsys is running on a micro processor in APU.
+  Its firmware is load and boot from Kernel side. Kernel and tinysys use
+  IPI to tx/rx messages.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8192-apusys-rv
+
+  reg:
+    minItems: 1
+
+  reg-names:
+    minItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  interrupts:
+    description: List of interrupts.
+
+  interrupt-names:
+    description: Name list of interrupts.
+
+  mediatek,apusys-power:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the apusys-power handle.
+
+  apu_ctrl:
+    description: handle the ipi state, time sync and deep idle message.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apu-ctrl-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  apu_pwr_tx:
+    description: handle the message trigger from AP side to tinysys.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apupwr-tx-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  apu_pwr_rx:
+    description: handle the message trigger from tinysys to AP side.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apupwr-rx-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  apu_mdw_rpmsg:
+    description: handle the middleware messages.
+    type: object
+
+    properties:
+      compatible:
+        const: "mediatek,apu-mdw-rpmsg"
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - interrupts
+  - mediatek,apusys-power
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/memory/mt8192-larb-port.h>
+
+    apusys_rv@19001000 {
+      compatible = "mediatek,mt8192-apusys-rv";
+      reg = <0x19000000 0x1000>,
+            <0x19001000 0x1000>;
+      reg-names = "apu_mbox",
+                  "md32_sysctrl";
+      mediatek,apusys-power = <&apusys_power>;
+      power-domains = <&apuspm 0>;
+      iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
+      interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>;
+      interrupt-names = "apu_wdt",
+                        "mbox0_irq";
+      apu_ctrl {
+        compatible = "mediatek,apu-ctrl-rpmsg";
+      };
+      apu_pwr_tx {
+        compatible = "mediatek,apupwr-tx-rpmsg";
+      };
+      apu_pwr_rx {
+        compatible = "mediatek,apupwr-rx-rpmsg";
+      };
+      apu_mdw_rpmsg {
+        compatible = "mediatek,apu-mdw-rpmsg";
+      };
+    };
-- 
2.18.0

