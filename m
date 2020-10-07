Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E3286F37
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6246EA32;
	Thu,  8 Oct 2020 07:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFAE6E954
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:49:21 +0000 (UTC)
Date: Wed, 07 Oct 2020 17:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1602092959;
 bh=d2j//6xhs2PPOH5F6O6PlO0HsUSK+06Ub5QJ1wgRpaw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Xc9rQiDbg99CWVIGSugGIzMxY8sYg4tiFj9BWlF6aH8OOY7H8R1vlyPX7Pwfly7kA
 7MbuWJUDnFNRL8mflf1nIuHB8wQotZGBAdmSeenPThWntxwF94BC4ej3QxHtULSL5b
 3BvzC509kBmjqLgQ9viUvX1OyE7GlQPz1TPyVo2U=
To: linux-arm-msm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Caleb Connolly <caleb@connolly.tech>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6 panel
Message-ID: <20201007174736.292968-3-caleb@connolly.tech>
In-Reply-To: <20201007174736.292968-1-caleb@connolly.tech>
References: <20201007174736.292968-1-caleb@connolly.tech>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the OnePlus 6/T common panel driver, example from
arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
new file mode 100644
index 000000000000..23ba369cc2f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-oneplus6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus 6/T panel driver
+
+description: |
+  The OnePlus 6 panel driver encompasses the display panels found in the
+  OnePlus 6 and 6T devices, the panels have almost identical behaviour and
+  are not used by any other devices.
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - samsung,sofef00
+      - samsung,s6e3fc2x01
+
+  reg: true
+  reset-gpios: true
+  port: true
+
+  vddio-supply:
+    description: VDDIO regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    &dsi0 {
+      status = "okay";
+      vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display_panel: panel@0 {
+        status = "okay";
+        compatible = "samsung,sofef00";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0>;
+
+        vddio-supply = <&vreg_l14a_1p88>;
+
+        reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
+
+        port {
+          panel_in: endpoint {
+            remote-endpoint = <&dsi0_out>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
