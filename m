Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6170B0C1
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9E10E202;
	Sun, 21 May 2023 21:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3714C10E1FA
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:23:17 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 384BD3F35F;
 Sun, 21 May 2023 23:23:15 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 21 May 2023 23:23:09 +0200
Subject: [PATCH RFC 07/10] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M Display-IC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230521-drm-panels-sony-v1-7-541c341d6bee@somainline.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
In-Reply-To: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Caleb Connolly <caleb@connolly.tech>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the SOFEF06-M Display-IC and 1080x2520 panel found in the Sony
Xperia 5 II (6.1").

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/display/panel/samsung,sofef03-m.yaml  | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
new file mode 100644
index 0000000000000..617218dfe8b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,sofef03-m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SOFEF03-M 1080x2520 6.1" OLED DSI panel
+
+maintainers:
+  - Marijn Suijten <marijn.suijten@somainline.org>
+
+description: |
+  Samsung SOFEF03-M Display-IC panel found in the Sony Xperia 5 II
+  (edo pdx206) smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - samsung,sofef03-m
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
+            compatible = "samsung,sofef03-m";
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

-- 
2.40.1

