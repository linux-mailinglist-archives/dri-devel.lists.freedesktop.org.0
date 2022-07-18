Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3FE578CDE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 23:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38C8112244;
	Mon, 18 Jul 2022 21:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org
 [213.239.216.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34EEC1121FF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 21:37:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.178.197.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 2C6471401E7;
 Mon, 18 Jul 2022 21:31:10 +0000 (UTC)
From: Caleb Connolly <caleb@connolly.tech>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 3/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Date: Mon, 18 Jul 2022 22:30:50 +0100
Message-Id: <20220718213051.1475108-4-caleb@connolly.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718213051.1475108-1-caleb@connolly.tech>
References: <20220718213051.1475108-1-caleb@connolly.tech>
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
Cc: Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[caleb: convert to yaml]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../bindings/display/panel/lg,43408.yaml      | 41 +++++++++++++++++++
 .../display/panel/panel-simple-dsi.yaml       |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,43408.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,43408.yaml
new file mode 100644
index 000000000000..0529a3aa2692
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,43408.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43408 1080x2160 DSI panel
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+description: |
+  This panel is used on the Pixel 3, it is a 60hz OLED panel which
+  required DSC (Display Stream Compression) and has rounded corners.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,sw43408
+
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+
+  backlight: false
+  power-supply: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - data-mapping
+  - width-mm
+  - height-mm
+  - panel-timing
+  - port
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 2c00813f5d20..4498078cb1ee 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -45,6 +45,8 @@ properties:
       - lg,acx467akm-7
         # LG Corporation 7" WXGA TFT LCD panel
       - lg,ld070wx3-sl01
+        # LG Corporation sw43408 1080x2160 OLED
+      - lg,sw43408
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
-- 
2.36.1

