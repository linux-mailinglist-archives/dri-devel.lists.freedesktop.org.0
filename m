Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C63EC9C6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Aug 2021 16:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9124F89B99;
	Sun, 15 Aug 2021 14:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6089B12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 14:56:22 +0000 (UTC)
X-UUID: 60e751fceb864d88996422cc0743d433-20210815
X-UUID: 60e751fceb864d88996422cc0743d433-20210815
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1244554965; Sun, 15 Aug 2021 22:56:16 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 22:56:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 15 Aug 2021 22:56:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Fabien
 Parent" <fparent@baylibre.com>, <hsinyi@chromium.org>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 03/13] dt-bindings: mediatek: add mediatek,
 dsc.yaml for mt8195 SoC binding
Date: Sun, 15 Aug 2021 22:56:00 +0800
Message-ID: <20210815145610.2050-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
References: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Add mediatek,dsc.yaml to describe DSC module in details.
2. Add mt8195 SoC binding to mediatek,dsc.yaml.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,dsc.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
new file mode 100644
index 000000000000..f94a95c6a1c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display DSC controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The DSC standard is a specification of the algorithms used for
+  compressing and decompressing image display streams, including
+  the specification of the syntax and semantics of the compressed
+  video bit stream. DSC is designed for real-time systems with
+  real-time compression, transmission, decompression and Display.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8195-disp-dsc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DSC Wrapper Clock
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  mediatek,gce-client-reg:
+      description:
+        The register of display function block to be set by gce. There are 4 arguments,
+        such as gce node, subsys id, offset and register size. The subsys id that is
+        mapping to the register of display function blocks is defined in the gce header
+        include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+      $ref: /schemas/types.yaml#/definitions/phandle-array
+      maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    dsc0: disp_dsc_wrap@1c009000 {
+        compatible = "mediatek,mt8195-disp-dsc";
+        reg = <0 0x1c009000 0 0x1000>;
+        interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+        clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+    };
+
-- 
2.18.0

