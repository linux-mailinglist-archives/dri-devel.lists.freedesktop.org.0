Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDABCD4699
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 00:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8810E329;
	Sun, 21 Dec 2025 23:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8663E10E2C1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 23:32:17 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E41A61F8B3;
 Mon, 22 Dec 2025 00:32:14 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:08 +0100
Subject: [PATCH v2 02/11] dt-bindings: display: panel: Describe LGD
 LH599QH3-EDB1 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-2-82a87465d163@somainline.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3041;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=OK1k8FK0F6DLCPjBBSuTHt+z5WcOjkmIrAgnrfTzVRQ=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN6tM8c5Y6IC95UptfyrwrfbIkEq5rrRAziY
 bmBMuRHW0aJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDegAKCRDxYtIxx+SG
 du0NEAC1IbOXq8fmVLdxsasmg9ueFVTuDKmvcw3GmzRqRfWE2ZDVJXxWOM6YZ85DsLJhVQsqmw0
 ZZNMn7otoX8UZKuD2bcU4ct/uYoayQAAOHZa0SA7WqVX9Rb/iGmmYingLW5MnNmLIVkv2+kLlS7
 CzXnrsckd9qkulEjRREHXrpHgP7pr+weKWmGL7b3mT1liq9oY/WqbXXN0DNrq9AdEfR7regiJRj
 8gA+FEyF5zM2fNygB9M/b0E7ylwI9TyTxyZ2vzjsVSma9P4Rh6YcxosZuDZaVSRdJcNp6WYqxfR
 2cnq7EzhcW4MVpVWVvb5cTUvqA+y71eXmlADcNw1kwxrs1i3wu2UqUvZ3gr4WXC2amxxpu1vdOm
 jQNV63u1zxq6uu9eaTdwifNKbJNZWC4QxbPk3nFlI4FWr5h3lyuYkFAiSKZv+f/wupznM3H8IjR
 LrBLL6QAtB1DNa8cqweIDVxd+ra6GuPDh1kEezATOJUU7DlJTbZY/hngKL+FohQ/R5K2DY1TqMz
 44VPPHWPHwJdT+jdGloOG0wasIjd6Vbxuq3ioDOgOcT/ZO6vGQm2anhZ3BgFzTnTuAKBxTcLIvJ
 pVoIsb8jX7BniBRtroWrL6DtjPuaPHMTrbn3hepKjQ68Fa0UoFwenZGlEE/6I0LjCZIZDgjnSIO
 7AY8K8r3M2Rww7Q==
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

Document the LG-Display LH599QH3-EDB1 OLED DSI panel found on the Sony
Xperia XZ3.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/display/panel/lgd,lh599qh3-edb1.yaml  | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lgd,lh599qh3-edb1.yaml b/Documentation/devicetree/bindings/display/panel/lgd,lh599qh3-edb1.yaml
new file mode 100644
index 000000000000..245d14c0a1a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lgd,lh599qh3-edb1.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lgd,lh599qh3-edb1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG Display LH599QH3-EDB1 1440x2880 6.0" OLED DSI command-mode panel
+
+maintainers:
+  - Marijn Suijten <marijn.suijten@somainline.org>
+
+description: |
+  LG Display LH599QH3-EDB1 6.0" 1440x2880 (9:18 aspect ratio) 60Hz panel, found
+  in the Sony Xperia XZ3 smartphone.  It is always programmed with Display
+  Stream Compression 1.1 enabled.
+
+  The assembly features an Atmel maXTouch digitizer, described separately as
+  atmel,maxtouch.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lgd,lh599qh3-edb1-um1
+
+  port: true
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  avdd-supply:
+    description: Analog voltage supply (3.0V)
+
+  vddio-supply:
+    description: I/O voltage supply (1.8V)
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - avdd-supply
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
+            compatible = "lgd,lh599qh3-edb1-um1";
+            reg = <0>;
+
+            avdd-supply = <&vreg_l28a_2p8>;
+            vddio-supply = <&vreg_l14a_1p8>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 0dbf349fc1ed..6a358fee4cae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7931,6 +7931,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
+DRM DRIVER FOR LGD LH599QH3-EDB1 PANELS
+M:	Marijn Suijten <marijn.suijten@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lgd,lh599qh3-edb1.yaml
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paulk@sys-base.io>
 S:	Supported

-- 
2.52.0

