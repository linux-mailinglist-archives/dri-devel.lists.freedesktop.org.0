Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2454706FF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C0010E654;
	Fri, 10 Dec 2021 17:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9FC10E654
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:46 +0000 (UTC)
X-UUID: 09cd9be715d342d2a1e6b43b85d86f22-20211211
X-UUID: 09cd9be715d342d2a1e6b43b85d86f22-20211211
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 607911808; Sat, 11 Dec 2021 01:26:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:26:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:40 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 04/17] dt-bindings: soc: mediatek: apu: Add APU power
 compatible
Date: Sat, 11 Dec 2021 01:25:52 +0800
Message-ID: <20211210172605.30618-5-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new document for APU power compatible.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../soc/mediatek/mediatek,apu-pwr.yaml        | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
new file mode 100644
index 000000000000..00f67dddb162
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2021 (C) MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,apu-pwr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APU Power driver bindings
+
+description: |
+  MediaTek AI Process Unit (APU) power driver supports for subsys clock and
+  regulator controller.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-apu-power
+  reg:
+    minItems: 1
+
+  reg-names:
+    minItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  vvpu-supply:
+    description: apu vpu regulator supply.
+
+  vmdla-supply:
+    description: apu mdla regulator supply.
+
+  clocks:
+    description: Contains module clock source and clock names
+
+  clock-names:
+    description: Names of the clocks list in clocks property
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vvpu-supply
+  - vmdla-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    apusys_power: apusys_power@190f1000 {
+      compatible = "mediatek,mt8192-apu-power";
+      reg = <0x190f1000 0x1000>;
+      reg-names = "apu_pcu";
+      power-domains = <&apuspm 0>;
+      vvpu-supply = <&mt6359_vproc1_buck_reg>;
+      vmdla-supply = <&mt6359_vproc2_buck_reg>;
+      clocks = <&topckgen CLK_TOP_DSP_SEL>,
+               <&topckgen CLK_TOP_DSP1_SEL>,
+               <&topckgen CLK_TOP_DSP1_NPUPLL_SEL>,
+               <&topckgen CLK_TOP_DSP2_SEL>,
+               <&topckgen CLK_TOP_DSP2_NPUPLL_SEL>,
+               <&topckgen CLK_TOP_DSP5_SEL>,
+               <&topckgen CLK_TOP_DSP5_APUPLL_SEL>,
+               <&topckgen CLK_TOP_IPU_IF_SEL>,
+               <&clk26m>;
+      clock-names = "clk_top_dsp_sel",
+                    "clk_top_dsp1_sel",
+                    "clk_top_dsp1_npupll_sel",
+                    "clk_top_dsp2_sel",
+                    "clk_top_dsp2_npupll_sel",
+                    "clk_top_dsp5_sel",
+                    "clk_top_dsp5_apupll_sel",
+                    "clk_top_ipu_if_sel",
+                    "clk_top_clk26m";
+    };
-- 
2.18.0

