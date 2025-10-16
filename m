Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B1BE4821
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C54110EA2D;
	Thu, 16 Oct 2025 16:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oY8we5aE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B94110E0C7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CD0ED4A6FC;
 Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA534C4CEFE;
 Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760631419;
 bh=Qkiyvvuujfy0+hCv+b+iybEvtauHe7+M206ftVJiL6s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=oY8we5aEuM1Xab4vCXjBxoSVUbwTNoGd6+WX8pryWMoIy4cgsTDpti/QMOIetiV2+
 /xWwYGlT3pvnrIP1/NQxFW1yTjsjKFnNYF2AxmIopfRwI7PFZ0lLfqbqH1ZrDC8sgg
 FGqMrTZ1ZuAztd0LU59t/uWgKZRF9wTKgA9fnLibnnBTdYkIvst25JrSDiKAUEXxys
 FhCMs0VEI43nhFqBMP5zAttnsL382rsf+WbZXpDcv84VgeEeQ7IYDZs+iNwDQl6qDn
 RGXcQUFKtNOQV9XG0OOCWLZ1XMSPie0Ca0RJglDpj5weh6bV4a2eXDXPXgWuUng+j/
 UFkmutzM3Yi/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 93588CCD199;
 Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 16 Oct 2025 18:16:56 +0200
Subject: [PATCH v3 1/8] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-s6e3fc2x01-v3-1-ce0f3566b903@ixit.cz>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
In-Reply-To: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Sb4b37DxYW3GNWkR8ByZZP12N7nY3x9gmVU7fcdXF6o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo8Rp50NSlifCBwThrfHb5PQbAS3p84TC/e56ri
 cTQ9h5m5CyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPEaeQAKCRBgAj/E00kg
 cqp7D/9kbCvdPNQOq5UcWkFNL38MMOk3pdCq0sNYeD7/7RkYutfvJYtW3C7y4Oo1EsC6XHliT9X
 dmPzaTOdXkr3wg3c0L01Ws1pQTgNqdeXWA20fzYjjOFzK0pvK+LDAwIpElMmSeq/N5kR4XTP8rZ
 Sjcp0PFd3NWgvLV5kv3pIG+J9U34K6XbasdNUZUSKRsehuKGXcR5yK7Kg44cukias7u6E/6IM5J
 TU2s2oiKrwSQ6V68Hrm1hpBAtcLqb3ULLlct1CI0zzVa2IStkGh9bQzjr3o/tEVv9GNQSI7Zkoe
 bRW70QEFELa8GRaO9AAVQJ5Nq3rJgI4xJpBDIIG9wT5h3ZHN+kwMCxHwtqZdhkckGksLWLJoo9S
 dcYuWYvR08fswaUqS6WEwSEXueyBcBu0fkSVQq2UeBclCugP5L2NJf+bUhbxZdwLVW6V1IziOF+
 RrbUk3I3ecZGPOJ3hVI/H39g8VTHzKPDjJvyCjaXPwNRomCQPrdCeT6um7yOCsgN1+LZA/z1Yqq
 K5jWASmsNwP8/8nuR2RRmTe25qDUTYbZtzm6D576sW9p7rdPhEW++TZjMZ7zpCEhXcdjhKpoVcd
 hNLswPSRRtiBDYG8kpabvhz1WqtXeCxBAVp2BnVlfehUtpMiMB3rsp5FCO7aqR6ePUqL17WlLkC
 iqFWgE3LfY9UN4g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.

Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel

panel-simple-dsi cannot be used because it's limited to one
power-supply, while we use three.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 81 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
new file mode 100644
index 0000000000000..d48354fb52ea0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E3FC2X01 AMOLED DDIC
+
+description: The S6E3FC2X01 is display driver IC with connected panel.
+
+maintainers:
+  - David Heidelberg <david@ixit.cz>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # Samsung 6.41 inch, 1080x2340 pixels, 19.5:9 ratio
+          - samsung,s6e3fc2x01-ams641rw
+      - const: samsung,s6e3fc2x01
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  port: true
+
+  vddio-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+  poc-supply:
+    description: POC regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vddio-supply
+  - vci-supply
+  - poc-supply
+
+unevaluatedProperties: false
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
+            compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
+            reg = <0>;
+
+            vddio-supply = <&vreg_l14a_1p88>;
+            vci-supply = <&s2dos05_buck1>;
+            poc-supply = <&s2dos05_ldo1>;
+
+            te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+            pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
+            pinctrl-names = "default", "sleep";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4250ceabf6ff4..d11dd6c7a6b27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8056,6 +8056,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SAMSUNG S6E3FC2X01 DDIC
+M:	David Heidelberg <david@ixit.cz>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
+
 DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
 M:	Dzmitry Sankouski <dsankouski@gmail.com>
 S:	Maintained

-- 
2.51.0


