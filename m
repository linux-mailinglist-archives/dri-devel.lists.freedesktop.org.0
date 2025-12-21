Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8ACD46A5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 00:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868E010E454;
	Sun, 21 Dec 2025 23:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214FC10E44C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 23:32:22 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C06B51F8F3;
 Mon, 22 Dec 2025 00:32:19 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:12 +0100
Subject: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3328;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=o7qgLyKR3gmE3A9JJ/aKnDkkY53cKTO9FZjFLxBjFDM=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN7VcP6CCLF0zOevWL7RXlwh8hYA02Tk+bVd
 AFq3evtEK+JAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDewAKCRDxYtIxx+SG
 drXYD/9RcaLxIyGfUOYhYZQN+jAdDOgf6+k29oCFe1jwoDOLez8WvF886BiZAh2lPMG815+QbfD
 QY0Fv8UP9A7YJHwXalJrOhFO6m7qcPDWVH4xI6KVOkD/5bDqcM/AjhWs86xDgDy4bXyA6uzlqbM
 O0YJQlqE2u8fkgoakPBeVg1gBkBvvPw1J18qd8nLWFHFZgUkSqeWqE4WhCTrF7E0MS8ogV8cHnK
 9HwzYzuoO2hzbSidkQaCxAAtixOQpEmdAMXr/4vBOnB2QihDp2mWwTUsDSy4+ldjZA/EajVHYKA
 vKbQ1X43j0nw8pXTTN3PZ9CQ9Yjqu2y5FDkSt4p/DGysx1DfmJkNXKMuORf64d/Kz478ac+MNDI
 2rGjKjrXNyFhek1PxQ08KyKITsMCyFEuNqzev71KvWtjZkSBp+IFBi/bFIb3+7BgQauQHTikm1X
 eEuPK8lFICdFjalf5PvNgVwxFadsKBAUM+pKO637anRvDvCRbC35r6BcqgkC+VX2dVPjUKw05Y4
 3S/19G5vncpQu+rYQw3SPFU55qtWYfyC89pk7xs4N5q/MgJnEsmHnGX3Rz87HI1RupTgVQ2ylnT
 YpFrVvJa/OO3yDQ3hP+yP+REVXwktjsWNw/bL0edLWI7j/kNijUrFHJNN6DWaT7Trkw0q+oCe56
 /+LpT6M6zkQ3s9g==
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

Document the Samsung SOFEF03-M Display-Driver-IC and 1080x2520@120Hz DSI
command-mode panels found in the Sony Xperia 5 II and Sony Xperia 5 III.
It requires Display Stream Compression 1.1 which allows the panels to be
driven at 120Hz, even though a 60Hz mode is available too.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/display/panel/samsung,sofef03-m.yaml  | 79 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
new file mode 100644
index 000000000000..5712eca2773d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,sofef03-m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SOFEF03-M DDI for 1080x2520@120Hz 6.1" OLED DSI panels
+
+maintainers:
+  - Marijn Suijten <marijn.suijten@somainline.org>
+
+description: |
+  Samsung SOFEF03-M Display-Driver-IC found in the Sony Xperia 5 II (edo pdx206, amb609vp01
+  panel) and
+  Sony Xperia 5 III (sagami pdx214, amb609vp04
+  panel) smartphones.  It is always programmed with Display Stream Compression 1.1 enabled.
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
+      - samsung,sofef03-m-amb609vp01
+      - samsung,sofef03-m-amb609vp04
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
+            compatible = "samsung,sofef03-m-amb609vp01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l11c_3p0>;
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
index cd2c924749d3..e48dd7f5a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8200,6 +8200,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-sofef01.c
 
+DRM DRIVER FOR SAMSUNG SOFEF03 DDIC
+M:	Marijn Suijten <marijn.suijten@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
+
 DRM DRIVER FOR SHARP MEMORY LCD
 M:	Alex Lanzano <lanzano.alex@gmail.com>
 S:	Maintained

-- 
2.52.0

