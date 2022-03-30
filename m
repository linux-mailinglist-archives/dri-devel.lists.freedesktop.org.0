Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D344EB9E6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 07:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DF610F3BD;
	Wed, 30 Mar 2022 05:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C51C10F3BC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:12:20 +0000 (UTC)
X-UUID: d0f022349abf4372afe2f72ada015375-20220330
X-UUID: d0f022349abf4372afe2f72ada015375-20220330
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 565690540; Wed, 30 Mar 2022 13:12:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 30 Mar 2022 13:12:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Mar 2022 13:12:02 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <granquet@baylibre.com>
Subject: Re: [PATCH v9 02/22] dt-bindings: mediatek,
 dp: Add Display Port binding
Date: Wed, 30 Mar 2022 13:12:02 +0800
Message-ID: <20220330051202.19594-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220327223927.20848-3-granquet@baylibre.com>
References: <20220327223927.20848-3-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 msp@baylibre.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 krzk+dt@kernel.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>This controller is present on several mediatek hardware. Currently
>mt8195 and mt8395 have this controller without a functional difference,
>so only one compatible field is added.
>
>The controller can have two forms, as a normal display port and as an
>embedded display port.
>
>Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>---
> .../display/mediatek/mediatek,dp.yaml         | 100 ++++++++++++++++++
> 1 file changed, 100 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
>
>diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
>new file mode 100644
>index 000000000000..802cc406c72b
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
>@@ -0,0 +1,100 @@
>+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>+%YAML 1.2
>+---
>+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
>+$schema: http://devicetree.org/meta-schemas/core.yaml#
>+
>+title: Mediatek Display Port Controller

s/Mediatek/MediaTek/

>+
>+maintainers:
>+  - CK Hu <ck.hu@mediatek.com>
>+  - Jitao shi <jitao.shi@mediatek.com>
>+
>+description: |
>+  Device tree bindings for the Mediatek (embedded) Display Port controller

s/Mediatek/MediaTek/

>+  present on some Mediatek SoCs.

s/Mediatek/MediaTek/

>+
>+properties:
>+  compatible:
>+    items:
>+      - const: mediatek,mt8195-dp-tx
>+      - const: syscon
>+
>+  reg:
>+    maxItems: 1
>+
>+  interrupts:
>+    maxItems: 1
>+
>+  clocks:
>+    items:
>+      - description: faxi clock
>+
>+  clock-names:
>+    items:
>+      - const: faxi
>+
>+  phys:
>+    maxItems: 1
>+
>+  phy-names:
>+    items:
>+      - const: dp
>+
>+  power-domains:
>+    maxItems: 1
>+
>+  ports:
>+    $ref: /schemas/graph.yaml#/properties/ports
>+    properties:
>+      port@0:
>+        $ref: /schemas/graph.yaml#/properties/port
>+        description: Input endpoint of the controller, usually dp_intf
>+
>+      port@1:
>+        $ref: /schemas/graph.yaml#/properties/port
>+        description: Output endpoint of the controller
>+
>+    required:
>+      - port@0
>+
>+required:
>+  - compatible
>+  - reg
>+  - interrupts
>+  - ports
>+
>+additionalProperties: false
>+
>+examples:
>+  - |
>+    #include <dt-bindings/interrupt-controller/arm-gic.h>
>+    #include <dt-bindings/power/mt8195-power.h>
>+    edp_tx: edisplay-port-tx@1c500000 {
>+        compatible = "mediatek,mt8195-dp-tx","syscon";
>+        reg = <0 0x1c500000 0 0x8000>;
>+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
>+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
>+        pinctrl-names = "default";
>+        pinctrl-0 = <&edp_pin>;
>+        phys = <&dp_phy>;
>+        phy-names = "dp";
>+
>+        ports {
>+            #address-cells = <1>;
>+            #size-cells = <0>;
>+
>+            port@0 {
>+                reg = <0>;
>+                edp_in: endpoint {
>+                    remote-endpoint = <&dp_intf0_out>;
>+                };
>+            };
>+            port@1 {
>+                reg = <1>;
>+                edp_out: endpoint {
>+                    remote-endpoint = <&panel_in>;
>+                };
>+            };
>+        };
>+    };
>-- 
>2.34.1
>
>
