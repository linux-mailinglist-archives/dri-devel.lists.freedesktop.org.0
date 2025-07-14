Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E65B037F3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C3310E40C;
	Mon, 14 Jul 2025 07:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="FPEQSb0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Mon, 14 Jul 2025 03:22:38 UTC
Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw
 [219.87.157.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154CF10E1E7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Vp72IOwJz5lZsziOOZo4RHilItGxQQe6XXbK9dG32tE=;
 b=FPEQSb0i3TGC2k2mpcYGH13OZNsoO0kKlUPgpsAxan8C7kqHkuwESaq5
 4ZDmFnSwfLka+TjTN3HuTlzbochavETU4/BCtx0qXGkcYMj0pN6FfBof5
 cmhXyJ6nZo+NHG8i7moXK+XmHpOCDiWPmcnXLST4SmcqcjsR88rSGI/7J
 vWFtTvvXvtAsRBwUVTP6X6sXxDYGRLpp1IoUWY7bx5b3n+/B3/r2pWx24
 3ILqX0tlwIKQBnWfN7b5XH/QBw18t8U5EDiS8MxcpT2HakDKS3Cfl8pq9
 0QaME2MJywWBKj1ic0WArHsKHNXz5cFFKlQIdi7mJ5SEa++w//CX9kBiz w==;
X-CSE-ConnectionGUID: nOaJW3VISzyNeQOWZEwX3w==
X-CSE-MsgGUID: qGqotRWrTai2egIul78qlg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 14 Jul 2025 11:15:22 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 56E3FI69091131;
 Mon, 14 Jul 2025 11:15:18 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.15) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 11:15:17 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Date: Mon, 14 Jul 2025 11:14:32 +0800
Subject: [PATCH 1/3] dt-binding: display: Add a device tree binding for the
 ITE IT61620 MIPI DSI to HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250714-it61620-0714-v1-1-3761164d0b98@ite.com.tw>
References: <20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw>
In-Reply-To: <20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth
 Hung <kenneth.Hung@ite.com.tw>, Pet Weng <pet.weng@ite.com.tw>, Pin-yen Lin
 <treapking@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462909; l=4482;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=S+k3JFNx6WEPslDNIQleb7IOdje4oFPzM9acWqDJ1to=;
 b=5UFi44n7tDt/PAZ1NRlQY9ZluZmMaLpyCeKFb9EXcd9AsTKBxOE6iGyyItULQlR6Mn5dFAYs+
 mc7xMe1iyGVC6J1lQU+7c2AV+W+gvGlXYHkhsV6KFKQBjWnF/uLE1D7
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.15]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: DAB28E45DFC27A003B88E63C16F971EC3E76C4EAB78125C4F6B1FA0022E07CFB2002:8
X-MAIL: mse.ite.com.tw 56E3FI69091131
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

This chip receives MIPI DSI input and outputs HDMI, and is commonly
connected to SoCs via I2C and DSI.

Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
---
 .../bindings/display/bridge/ite,it61620.yaml       | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ff8ff390a1c0c31bb05ba0e237490cff2942cd05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it61620.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT61620 MIPI DSI to HDMI Bridge
+
+maintainers:
+  - Pet Weng <pet.weng@ite.com.tw>
+
+description: |
+  The ITE IT61620 is a high-performance, low-power HDMI bridge that converts
+  MIPI DSI input to HDMI 1.4b TMDS output. It supports up to 4 lanes of MIPI
+  D-PHY 2.0 input at 2.5Gbps per lane (10Gbps total), compatible with DSI-2 v2.0.
+
+  The HDMI transmitter side supports up to 4Kx2K@30Hz resolutions, and is
+  compliant with HDMI 1.4b and HDCP 1.4.
+
+  For audio, the IT61620 supports up to 8-channel LPCM via I2S (multi-line or
+  TDM mode), with optional S/PDIF or DSD (for SACD). It supports audio
+  sampling rates up to 192kHz.
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    const: ite,it61620
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    maxItems: 1
+    description: interrupt specifier of INT pin
+
+  reset-gpios:
+    maxItems: 1
+    description: gpio specifier of RESET pin
+
+  ivdd-supply:
+    description: core voltage
+
+  ovdd-supply:
+    description: I/O voltage
+
+  ovdd1833-supply:
+    description: flexible I/O votage
+
+  pinctrl-names:
+    items:
+      - const: default
+
+  pinctrl-0:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  dsi-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of DSI input lanes used (1, 2 or 4)
+    minimum: 1
+    maximum: 4
+    default: 4
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: A port node pointing to DSI host port node
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Video port for HDMI output
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - reset-gpios
+  - ivdd-supply
+  - ovdd-supply
+  - ovdd1833-supply
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmibrdg: ite61620@58 {
+                compatible = "ite,it61620";
+                reg = <0x58>;
+                #sound-dai-cells = <0>;
+                interrupts-extended = <&pio 128 IRQ_TYPE_LEVEL_LOW>;
+                pinctrl-names = "default";
+                pinctrl-0 = <&it61620_pins>;
+                reset-gpios = <&pio 127 GPIO_ACTIVE_LOW>;
+                ivdd-supply = <&pp1000_hdmi_x>;
+                ovdd-supply = <&pp3300_vio28_x>;
+                ovdd1833-supply = <&pp1800_vcamio_x>;
+                dsi-lanes = <4>;
+                status = "okay";
+
+                ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                                reg = <0>;
+                                it61620_dsi_in: endpoint {
+                                        remote-endpoint = <&dsi_out>;
+                                };
+                        };
+
+                        port@1 {
+                                reg = <1>;
+                                it61620_hdmi_out: endpoint {
+                                        remote-endpoint = <&hdmi_connector_in>;
+                                };
+                        };
+                };
+        };
+    };

-- 
2.34.1

