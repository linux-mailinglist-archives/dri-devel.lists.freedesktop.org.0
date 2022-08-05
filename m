Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C558A99C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 12:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C271B3582;
	Fri,  5 Aug 2022 10:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3AB3CE1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 10:15:08 +0000 (UTC)
X-UUID: e7dffe4506634ecbbccd77b7d1ee3c29-20220805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kYIvg3XhED6UXaxrgjEy7+vfoO4fu7doKfBX7k4ddLI=; 
 b=maCREVJaOX05WG4arGq2NZ/5fVxL/lRpdA1u6montxgwsgipbNNkF07zMHuVK50Xou3TvmnHhPHZJMnP3ouJEbHQFYkhoO/4I9IjMYsPtfBCx0rdpidteKp1JxIAJrDtJ+YQVxmjuyQEsFRXalhfp7tnJ4MS268Qrxg3Dw+Zss0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:5862b806-844e-4532-850e-92d84ba03170, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:20
X-CID-META: VersionHash:0f94e32, CLOUDID:a85bd448-f57f-4088-93dd-066979cdb4e6,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: e7dffe4506634ecbbccd77b7d1ee3c29-20220805
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1316068290; Fri, 05 Aug 2022 18:15:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 5 Aug 2022 18:15:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Aug 2022 18:14:59 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v16 1/8] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 5 Aug 2022 18:14:52 +0800
Message-ID: <20220805101459.3386-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Schneider-Pargmann <msp@baylibre.com>

This controller is present on several mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible field is added.

The controller can have two forms, as a normal display port and as an
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 .../display/mediatek/mediatek,dp.yaml         | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..ff781f2174a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port Controller
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  MediaTek DP and eDP are different hardwares and there are some features
+  which are not supported for eDP. For example, audio is not supported for
+  eDP. Therefore, we need to use two different compatibles to describe them.
+  In addition, We just need to enable the power domain of DP, so the clock
+  of DP is generated by itself and we are not using other PLL to generate
+  clocks.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-tx
+      - mediatek,mt8195-edp-tx
+
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    maxItems: 1
+    description: efuse data for display port calibration
+
+  nvmem-cell-names:
+    const: dp_calibration_data
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input endpoint of the controller, usually dp_intf
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output endpoint of the controller
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                description: |
+                  number of lanes supported by the hardware.
+                  The possible values:
+                  0       - For 1 lane enabled in IP.
+                  0 1     - For 2 lanes enabled in IP.
+                  0 1 2 3 - For 4 lanes enabled in IP.
+                minItems: 1
+                maxItems: 4
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+      - port@1
+
+  max-linkrate-mhz:
+    enum: [ 1620, 2700, 5400, 8100 ]
+    description: maximum link rate supported by the hardware.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+  - max-linkrate-mhz
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    dptx@1c600000 {
+        compatible = "mediatek,mt8195-dp-tx";
+        reg = <0x1c600000 0x8000>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
+        interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+        max-linkrate-mhz = <8100>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dptx_in: endpoint {
+                    remote-endpoint = <&dp_intf0_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                dptx_out: endpoint {
+                    data-lanes = <0 1 2 3>;
+                };
+            };
+        };
+    };
-- 
2.18.0

