Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E69E5453
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 12:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46210EE1F;
	Thu,  5 Dec 2024 11:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X0hitfMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8275D10E5C4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733399144;
 bh=uPC7d2PZhR6VYtSMBuY3w/VZxXfnYYEEedsTFX2S8Xg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X0hitfMoyueFi/joURN/UT6kJUKHzwuV1Fk2/JOwRVCJvG3gm5lUt4I/GulxkZid5
 LTuTFqKIzBKfaxcRziyiuA9+fOpA3XIX+2EwqjSaiCpENiObVgGJe1J0iyABl4RkoS
 BqM3ieNxVAJJAUqdaI1QNNWcdZ3eIlMtdFYyjlN2aXakiUeCNrPNAZPxTY/UzzY5q6
 DJHv00oeOsAq/84qAQBYtRnORhIXh1kyOy7So/peWWVakSuTAs2xYW5o749QyXDjXf
 UuOFV91SZTGliPrlL4i93qFnykNjDgMeV3cnf1jKat4QxVoJu9Ws/9wesQwpI5BNnX
 sn807Ibho6wFQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 30A1D17E3661;
 Thu,  5 Dec 2024 12:45:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: [PATCH v2 07/15] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Date: Thu,  5 Dec 2024 12:45:09 +0100
Message-ID: <20241205114518.53527-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
and MT8188 SoCs.

This fully supports the HDMI Specification 2.0b, hence it provides
support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
xvYCC, with output resolutions up to 3840x2160p@60Hz.

Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
(VRR) and Consumer Electronics Control (CEC).

This IP also includes support for HDMI Audio, including IEC60958
and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
according to HDMI 2.0.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8195-hdmi.yaml        | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
new file mode 100644
index 000000000000..73b1dfaa1adb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek HDMI-TX v2 Encoder
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - CK Hu <ck.hu@mediatek.com>
+
+description:
+  The MediaTek HDMI-TX v2 encoder can generate HDMI format data based on
+  the HDMI Specification 2.0b.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-hdmi-tx
+      - mediatek,mt8195-hdmi-tx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: HDMI Peripheral Bus (APB) clock
+      - description: HDCP and HDMI_TOP clock
+      - description: HDCP and HDMI_TOP reference clock
+      - description: VPP HDMI Split clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hdcp
+      - const: hdcp24m
+      - const: hdmi-split
+
+  i2c:
+    type: object
+    $ref: /schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
+    unevaluatedProperties: false
+    description: HDMI DDC I2C controller
+
+  phys:
+    maxItems: 1
+    description: PHY providing clocking TMDS and pixel to controller
+
+  phy-names:
+    items:
+      - const: hdmi
+
+  pinctrl-0: true
+
+  pinctrl-names:
+    items:
+      - const: default
+
+  power-domains:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port, usually connected to the output port of a DPI
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port that must be connected either to the input port of
+          a HDMI connector node containing a ddc-i2c-bus, or to the input
+          port of an attached bridge chip, such as a SlimPort transmitter.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        hdmi-tx@1c300000 {
+            compatible = "mediatek,mt8195-hdmi-tx";
+            reg = <0 0x1c300000 0 0x1000>;
+            clocks = <&topckgen CLK_TOP_HDMI_APB>,
+                     <&topckgen CLK_TOP_HDCP>,
+                     <&topckgen CLK_TOP_HDCP_24M>,
+                     <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>;
+            clock-names = "bus", "hdcp", "hdcp24m", "hdmi-split";
+            interrupts = <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH 0>;
+            phys = <&hdmi_phy>;
+            phy-names = "hdmi";
+            power-domains = <&spm MT8195_POWER_DOMAIN_HDMI_TX>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&hdmi_pins>;
+            #sound-dai-cells = <1>;
+
+            hdmitx_ddc: i2c {
+                compatible = "mediatek,mt8195-hdmi-ddc";
+                clocks = <&clk26m>;
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    hdmi_in: endpoint {
+                        remote-endpoint = <&dpi1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    hdmi_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.47.0

