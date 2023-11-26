Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C567F937F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 16:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0B310E113;
	Sun, 26 Nov 2023 15:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ABA10E107
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 15:46:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507c5249d55so5236426e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 07:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701013611; x=1701618411;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dvYwFATyIvmV3iv8lQG/WHQRHMyZF8eGnwS5y8SkTH4=;
 b=QSx3Gg7en3veAIkoAqobVSH1XyC/WuB5CmqjkpaYQtBufwcdj7UU+wYno+l91it3mp
 YUWyt/p7USO6v06SXgc138UeDf4PDTcAlK33NFt5UK6Y+UfJhsZnDZQ0bD/6iMs48ECe
 zr5yIqKIXNg0cgPGYaRoSoUyW4PnZK/k/qCSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701013611; x=1701618411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvYwFATyIvmV3iv8lQG/WHQRHMyZF8eGnwS5y8SkTH4=;
 b=KuzqtMMGVZin+KrIwGmaMwejy68xQE/J3X7qi5CHPOls47nDcLBvZ9Pl1UB98zQz4Q
 NWyxfut38akpWfBH045/myFA9jxilCr6FH4HHyThJRHY3N24v43XN05k39YRtlKzqAyq
 Ss4qhe4/5XMSRu8hWv/IjjbW1HTR5qoDLQjGMswNTpq/p6bjUm48Zi6ZIIRhphUDDHFt
 /0aXekOYA6GFJZfrGddA0cnj33nnV53/qwWmznyhpkkHQR8i5cem+/Mqcyf1Y5nk8yXJ
 bsy3BEZdFPF+7YS1mqbEVKt7eDs0Bx6h5bHj/iAqF8Szdj+dat263HSMTy5gZA4rfi0S
 nFOA==
X-Gm-Message-State: AOJu0YxkgK5CnVzC0eRzrw9tjO8tMb7kWe5thBwa+TbyiQuw1qs9jbGR
 McCfZwgulM94GoZ57K4Wx26j+Q==
X-Google-Smtp-Source: AGHT+IFRT43+21ag7z11Y59I4mpDM38vIvgjT3QRpkqVhX7AzY8w5hDd/69qhJ30RrFss7BIU9kZYA==
X-Received: by 2002:ac2:5a0f:0:b0:509:4f70:f6f3 with SMTP id
 q15-20020ac25a0f000000b005094f70f6f3mr6257684lfn.64.1701013611530; 
 Sun, 26 Nov 2023 07:46:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a170906591800b009fdc684a79esm4656158ejq.124.2023.11.26.07.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 07:46:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] dt-bindings: display: panel: Add Ilitek ili9805
 panel controller
Date: Sun, 26 Nov 2023 16:44:59 +0100
Message-ID: <20231126154605.15767-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
References: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

Add documentation for "ilitek,ili9805" panel.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add $ref to panel-common.yaml
- Drop port, reset-gpios, and backlight
- Set port and backlight ad required
- Replace additionalProperties with unevaluatedProperties

 .../display/panel/ilitek,ili9805.yaml         | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
new file mode 100644
index 000000000000..e08af5f0b2e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9805.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9805 based MIPI-DSI panels
+
+maintainers:
+  - Michael Trimarchi <michael@amarulasolutions.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - giantplus,gpm1790a0
+      - const: ilitek,ili9805
+
+  avdd-supply: true
+  dvdd-supply: true
+  power-supply: true
+  reg: true
+
+required:
+  - compatible
+  - avdd-supply
+  - dvdd-supply
+  - reg
+  - reset-gpios
+  - port
+  - backlight
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
+            compatible = "giantplus,gpm1790a0", "ilitek,ili9805";
+            reg = <0>;
+            power-supply = <&reg_display>;
+            avdd-supply = <&avdd_display>;
+            dvdd-supply = <&dvdd_display>;
+            reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mipi_dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.42.0

