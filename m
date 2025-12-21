Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F8CD46A8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 00:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A16910E453;
	Sun, 21 Dec 2025 23:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C9610E44C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 23:32:24 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3B7C21F8F6;
 Mon, 22 Dec 2025 00:32:22 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:14 +0100
Subject: [PATCH v2 08/11] dt-bindings: display: panel: Describe Samsung
 SOUXP00-A DDIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-8-82a87465d163@somainline.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=/iR5CzoiFkWbOtdy8+W4+GSjg3vkYkraDiDO7C+nebQ=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN74vkoKHGxGx90rfBgsw+KYznmlSq0SdL+1
 AhDLfmSWxSJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDewAKCRDxYtIxx+SG
 didhD/0bYv29PN7+x0r2muNxXI/7SfnOdOx/566FFFSuWHbifUtjqai3ffp1IDn/AmrujnHTcC5
 dqk0Wa5GkxPvPr2UBzBnpKCrZfxieQfdUQebGwdRNgNz32wSYYy8OB+UmMXlnHDdVlfbQ9sIvaE
 uvAKCaRm0HiWY4Quercn+cifGCUy77KhGYZHPfPUkijHTIj7U4ZC8PApdgh0YJY7JrazX7Meq7J
 rJfRvz/BRFPh1TA8L7dfSXG8iWCDRrAtXvIFbgkLMy3wMkM9IZKPaXYpUxwhRVdZNHZdTfWlvFY
 TMlbbHvhUTKh4/LRebJrx26+8xhdHMfkPeLEbLr9u6RFSBb5N5WVFkSGbUU0FgYvJcXEnsT4dU1
 ttWgmHIxDkN2pjoihBPTUV1jdZXgyRr7FfTsWdNAjnx3Ea9MzRzhd0WxWZEm5szk1PUtnl7flJf
 giS8Sx4dsurJkGB0CjZ+H02cKX3zbisAkfO+FvKGYoNsW9sZLH9Vu72Z4O9RadeDMclTz758Puj
 16kFnor2CXBRNGUL8204TY5VQsUJPa4374U7i8GeyZtfkyJMczGs5FruJLGLItUUNPEjWhtC6qq
 vlwH9osHNZDHZryQqmuD2/FIkbZrzW7KzRDJQZXUR8Q7d0Ppajh4acNiqrZOEh9CmEjFGvl4wNP
 SM5CgqCv7BOfDPw==
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

Document the Samsung SOUXP00-A Display-Driver-IC and 11644x3840@60Hz
6.5" DSI command-mode panels found in the Sony Xperia 1 with amb650wh01
panel and Sony Xperia 1 II with amb650wh07 panel. It requires Display
Stream Compression 1.1.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/display/panel/samsung,souxp00-a.yaml  | 79 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,souxp00-a.yaml b/Documentation/devicetree/bindings/display/panel/samsung,souxp00-a.yaml
new file mode 100644
index 000000000000..bfbb8c0a41cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,souxp00-a.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,souxp00-a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SOUXP00-A DDI for 1644x3840@60Hz 6.5" OLED DSI panels
+
+maintainers:
+  - Marijn Suijten <marijn.suijten@somainline.org>
+
+description: |
+  Samsung SOUXP00-A Display-Driver-IC found in the Sony Xperia 1 (kumano
+  griffin, amb650wh01 panel) and Sony Xperia 1 II (edo pdx203, amb650wh07 panel)
+  smartphones.  It is always programmed with Display Stream Compression 1.1
+  enabled.
+
+  The assembly features a Samsung touchscreen compatible with
+  samsung,s6sy761.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - samsung,souxp00-a-amb650wh01
+      - samsung,souxp00-a-amb650wh07
+
+  port: true
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  vci-supply:
+    description: DriverIC Operation supply (3.0V)
+
+  vddio-supply:
+    description: I/O voltage supply (1.8V)
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - vci-supply
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
+            compatible = "samsung,souxp00-a-amb650wh01";
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
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 28135743ca0c..7f32ff371799 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8206,6 +8206,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-sofef03.c
 
+DRM DRIVER FOR SAMSUNG SOUXP00 DDIC
+M:	Marijn Suijten <marijn.suijten@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,souxp00-a.yaml
+
 DRM DRIVER FOR SHARP MEMORY LCD
 M:	Alex Lanzano <lanzano.alex@gmail.com>
 S:	Maintained

-- 
2.52.0

