Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A2CD46B7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 00:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F2D10E457;
	Sun, 21 Dec 2025 23:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135EA10E2C1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 23:32:20 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 551671F8DE;
 Mon, 22 Dec 2025 00:32:17 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:10 +0100
Subject: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Casey Connolly <casey.connolly@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4484;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=nvkr5z8Z55u6fmmyLhYwW4pSBb8DLE4Wh0AYWIsyhXo=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN7SIPmbL0hP9TadE2haOZSVX7GCP15AG4YR
 SO5hJZ0tbGJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDewAKCRDxYtIxx+SG
 djiTEACSoEAVhRCMT+g4BF1qeU/yQsfCshPwoeY/6gvI9SsMTmk07JuQOZL2N0lv6V8DReWM3G7
 bhNhrPs/QRfItDxiD8yXeWq7Ncu+yXAgR/EdGowhKlkzyi2ZjyNBh6BYgmcCBxmykq096lrtc/P
 ZEaGe5LEJ/ASbn+kcd/CNyZYhxByhSzjE9isqYQRzrHwCGE0UvgsWzq1nhOgE0iHDhA0KsKU4x+
 oyy7kUr2RWOV+gVp2S0Z1+GPv+rnOWncv2eoBrRUZ0UOJdBZTLYe2YPFgCzCTJtDNykjASw0SNc
 jS7X2wJG7yBjwPwihGpPnle0CiDNLtJB743RyiyEdI+19fP6D+RjqjOv9f1uRtS8p8A8vD2jB2s
 CkqfjgFYZjgOAEkKhloRz+Z6Y15uccI3CkYHi8FZf14mgKp/06RunfsdP9rl0xd1mAG1CAPMGzL
 pmFr4pPSz8VofXh9gJDuY7CxI71YFIk1ibRIjYw2+3sNNQr08RfrQ+WNnfU1bwgGkLw28mTcdYm
 5CDZV9QbQfH+C/roSEBJJaI11uoY2ZtkOx+6lEVWV6T/nGts35xt2tWlcYJ9e6Z0N4z+/P0Cmy9
 HxSXsTJpl2ihM3TkNELFaUxBJdSVbA8r2khVRE/QxOOEwy4M63ahYoXYcTFdCW67D9qyYSgDQGo
 Mf/5KjyXRtMvjWg==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

Document the Samsung SOFEF01-M Display-Driver-IC and 1080x2520@60Hz
command-mode DSI panels found in many Sony phones:
- Sony Xperia 5 (kumano bahamut): amb609tc01
- Sony Xperia 10 II (seine pdx201): ams597ut01
- Sony Xperia 10 III (lena pdx213): ams597ut04
- Sony Xperia 10 IV (murray pdx225): ams597ut05
- Sony Xperia 10 V (zambezi pdx235): ams605dk01
- Sony Xperia 10 VI (columbia pdx246): ams605dk01

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/display/panel/samsung,sofef01-m.yaml  | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
new file mode 100644
index 000000000000..a8ff5223677c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SOFEF01-M DDI for 1080x2520@60Hz 6.0"/6.1" OLED DSI panels
+
+maintainers:
+  - Marijn Suijten <marijn.suijten@somainline.org>
+
+description: |
+  Samsung SOFEF01-M Display-Driver-IC found in multiple Sony smartphones, paired with
+  the following panel:
+   - Sony Xperia 5 (kumano bahamut): amb609tc01
+   - Sony Xperia 10 II (seine pdx201): ams597ut01
+   - Sony Xperia 10 III (lena pdx213): ams597ut04
+   - Sony Xperia 10 IV (murray pdx225): ams597ut05
+   - Sony Xperia 10 V (zambezi pdx235): ams605dk01
+   - Sony Xperia 10 VI (columbia pdx246): ams605dk01
+
+  The assembly features a Samsung touchscreen compatible with
+  samsung,s6sy761.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: samsung,sofef01-m-amb609tc01
+    then:
+      properties:
+        vci-supply:
+          description: DisplayIC Operation supply (3.0V)
+
+      required:
+        - vci-supply
+
+    else:
+      properties:
+        vci-supply: false
+
+properties:
+  compatible:
+    enum:
+      - samsung,sofef01-m-amb609tc01 # 6.1"
+      - samsung,sofef01-m-ams597ut01 # 6.0"
+      - samsung,sofef01-m-ams597ut04 # 6.0"
+      - samsung,sofef01-m-ams597ut05 # 6.0"
+      - samsung,sofef01-m-ams605dk01 # 6.1"
+
+  port: true
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  vddio-supply:
+    description: I/O voltage supply (1.8V)
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - vddio-supply
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
+        panel@0 {
+            compatible = "samsung,sofef01-m-amb609tc01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l17a_3p0>;
+            vddio-supply = <&vreg_l14a_1p8>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,sofef01-m-ams597ut01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&pm6125_l12>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index fcd99a8f9c71..93468dde9df2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8194,6 +8194,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-sofef00.c
 
+DRM DRIVER FOR SAMSUNG SOFEF01 DDIC
+M:	Marijn Suijten <marijn.suijten@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
+
 DRM DRIVER FOR SHARP MEMORY LCD
 M:	Alex Lanzano <lanzano.alex@gmail.com>
 S:	Maintained

-- 
2.52.0

