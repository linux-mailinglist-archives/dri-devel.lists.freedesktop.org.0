Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE88A733F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 20:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C54112DBD;
	Tue, 16 Apr 2024 18:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="UgG/gtxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCF4112CEF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 18:31:14 +0000 (UTC)
Received: from david-ryuzu.localdomain
 (ipbcc3a836.dynamic.kabel-deutschland.de [188.195.168.54])
 by mail.mainlining.org (Postfix) with ESMTPSA id 3A167E20E8;
 Tue, 16 Apr 2024 18:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1713292272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnGPoQ0r3htGk+5p1b1VSDz+6cHpvgMQDQZH9FEMlN4=;
 b=UgG/gtxCkxIJEfg7a7fu45DFLfcwBY0E+RUDaQpVsMIE9WnflnfqMQ8u1GvK8WXQtJgVzX
 iOdogn3yqI+WsfO0ZkRWs2A1TpuyyF/c5D9dSMlZAeIrDgngMqYHHAy6rxBPfPU/4Ea30B
 YprKphN89Dd86Qu0vlh/zmRG3CwLlFfIC0TlDzgvzil2riGp4673fmdMeKnYa5bLqRGEs2
 /YEL2IvF2GwT5lxiX4fhHh0lFJ1As10OlE2Z9/CM1g4RBZLCaGbCQC2Rkc0SHzb+nXBYS2
 S2bBVhgT6h2KD1uFGk2PSvKFhFS0a7lUw9aePHhl70OSVZE8cZPkvy4bs51sSA==
From: David Wronek <david@mainlining.org>
Date: Tue, 16 Apr 2024 20:30:48 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Raydium RM69380
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-raydium-rm69380-driver-v3-1-21600ac4ce5f@mainlining.org>
References: <20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org>
In-Reply-To: <20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, David Wronek <david@mainlining.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713292268; l=3057;
 i=david@mainlining.org; s=20240121; h=from:subject:message-id;
 bh=H4PFzqvmKwXu3PaRjVJ2GZOn4+++zfi7W3Cn2y64I2E=;
 b=8R6vLaLnAFMrla6QeH3sC3y4q+4yQ2ldcUICK1JxwYhChkT0O7xPmnRmNrG+rY/0zIDOUrufg
 z6y3FWAE77RDQ5oDJO7p8/+lzXxBRHydsJIuA54NV3HebqlZhsF2UEi
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=PJIYyFK3VrK6x+9W6ih8IGSJ5dxRXHiYay+gG1qQzqs=
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

Raydium RM69380 is a display driver IC used to drive OLED DSI panels.
Add a dt-binding for it.

Signed-off-by: David Wronek <david@mainlining.org>
---
Note:
Depends on commit 48a516363e29 ("dt-bindings: display: panel: add common dual-link schema")
---
 .../bindings/display/panel/raydium,rm69380.yaml    | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
new file mode 100644
index 000000000000..0ac7d033cbe0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm69380.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM6380-based DSI display panels
+
+maintainers:
+  - David Wronek <david@mainlining.org>
+
+description:
+  The Raydium RM69380 is a generic DSI panel IC used to control
+  OLED panels.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lenovo,j716f-edo-rm69380
+      - const: raydium,rm69380
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the RM69380 panel driver. The compatible
+      string determines how the RM69380 panel driver shall be configured
+      to work with the indicated panel. The raydium,rm69380 compatible shall
+      always be provided as a fallback.
+
+  avdd-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be active low
+
+  ports: true
+  reg: true
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - vddio-supply
+  - reset-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lenovo,j716f-edo-rm69380", "raydium,rm69380";
+            reg = <0>;
+
+            avdd-supply = <&panel_avdd_regulator>;
+            vddio-supply = <&vreg_l14a>;
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&mdss_dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&mdss_dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.44.0

