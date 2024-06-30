Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69491D31A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 20:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9AA10E2B1;
	Sun, 30 Jun 2024 18:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="YAIX0Ezf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7733810E2B1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 18:36:42 +0000 (UTC)
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719772600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YqcFbMJPQOyPCi7l9KNgfXa8T+1VUu7RUN/CRN/b0M=;
 b=YAIX0EzfrWyiG5RdjzpdTVeeZBhtotuv5TzuFkfPTo7vBWP5MVz5zQY1S2b23LP4wVt+3a
 vJPsNylbvoeWl+kkMlP4IfuO41cCpeu2KVv6eGaUw0Q3nyiyeOHsa7OR2n7g0FxKNl7jZJ
 6cV3Q/EVXzsWuFvM1pFVFVXyDiOSXrKu3i6B+HqAjfohaNFWMyoyAOVuuyvbD4FP2fz64W
 IJvSVhPjdCWw0WX5hBQrfw3Lfw7LJxT9d9Iu2CBV+dAZtr0qEz5vQ+7aHeDOJyIqo+Phf7
 zU1BTpuuch4QGs+SGlsKRamptYFz/fBzL30Mnfderk715zUxYXVr70msN1yecg==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:24 +0200
Subject: [PATCH v2 1/8] dt-bindings: panel: document Samsung AMB655X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-1-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=arZv7vt1rR4XnSFoV4a11i3btIAXQX7jpGRdlhwlkkk=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWz0wWKBpv3QkqeTHYFGLxOMM8F+fMWZIgI/
 31zEok0XT2JAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 tuJAD/kBwFfzoQJ0rprMD1nLHBF8QxFmSZva0HikjV4re9t/zIrUxMsdktBHUteQ+avKNEDJ/FF
 5a0bxCcmPRPxxbXb+19HpdhqtIFyykvl/ysSNF2RRO7K0tyLaSZ04mWUAP1cV8jg8e1zNsqp0ni
 tkCe3EqSQwyqOFMZ8WtK9UbYkjDyfEJyxvtiR+tQ4QA5pd3HyBEcu5mda60us6bq2y0StLPTHeE
 +WjySRjaD4nRuLAQAK6s3RwXjlT06AgYupJ6artzPSD/SpmlFe7fYufZ//eLP47AUTfgplMvHgC
 Vc94Vjx+0bu1hV5TDPhb9fa71KUJq2TgMrCGUVkXFAS8ny7Lo+GmPbk/q53cy1ZTJKXNrhLRp+w
 yYIoiyMybIIYwRil+yUCbztB03aKPbuD+s5nVLdLgGU33vDJsdFFumBIIiZs4HXsDInmpA/6J7v
 T5jFBlkgQd2C8Co70iaNINpdEVsQ2cHNRxvkT3/Rmc6EHUNsQhJM2XQshQ8n/rgm/dHtPaGQT6u
 uBHhtoisqi9iAsixMnbRxRqPOr7ei/TSHvpW1UxWZAE51JnDeQXld4u/LPWicaaMAqC/prMDj8w
 dFCLdQbBZDcy+4FUexLYAmly3wExyR/wIWhyaXxs2L3ry+glJFKExQ4z9Aq2H5Pv20m0xusA+7u
 6DApVTgSc1PC/Eg==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
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

Describe the Samsung AMB655X panel. It has three supplies.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 .../bindings/display/panel/samsung,amb655x.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
new file mode 100644
index 000000000000..085ad02ac74f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,amb655x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMB655X 1080x2400 120hz AMOLED panel
+
+maintainers:
+  - Caleb Connolly <caleb@postmarketos.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,amb655x
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description: reset gpio, must be GPIO_ACTIVE_LOW
+
+  vddio-supply: true
+  vdd-supply: true
+  avdd-supply: true
+  enable-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - avdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    panel@0 {
+      reg = <0>;
+      compatible = "samsung,amb655x";
+      vddio-supply = <&vreg_l14a_1p8>;
+      vdd-supply = <&vreg_l11c_3p3>;
+      avdd-supply = <&panel_avdd_5p5>;
+      reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+      pinctrl-0 = <&panel_reset_pins &panel_vsync_pins &panel_vout_pins>;
+      pinctrl-names = "default";
+
+      status = "okay";
+
+      port {
+        panel_in_0: endpoint {
+          remote-endpoint = <&mdss_dsi0_out>;
+        };
+      };
+    };
+
+...

-- 
2.45.0

