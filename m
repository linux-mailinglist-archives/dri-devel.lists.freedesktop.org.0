Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55F7FF190
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35610E712;
	Thu, 30 Nov 2023 14:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F71B10E709
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 14:17:24 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54acdd65c88so1068018a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 06:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701353842; x=1701958642;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iaOjjsreRhqLG2eeFhkZ0z2jBZuyXeD7iIf15AVT+Us=;
 b=idUbxRJlTWCkO+UphlEBaGF2uoLedogamXURrHqVnnjU0tBkTAh1osR61RLMFsEYeg
 ogShtx700rdI3zk6n7bQEnOgVtc4EzQSmk3odrA435P/llHoNvklAUWr0YNSsE06ff2x
 H6nBYe80rGCwOxIx6NhCUikMcu9o7nIAI92pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701353842; x=1701958642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iaOjjsreRhqLG2eeFhkZ0z2jBZuyXeD7iIf15AVT+Us=;
 b=kpEAtAyUzoYsfyeZ692hVahkOLVY55LewsqrvARFWNJPG+ANC0D5IijbtdZAyidHf8
 GZ0QCBlq+3ynOtOvS9sT1vvpJY2n7ID9i1AC7AMF7qHgRz3ETldZXkDcl/QPU1nubq+A
 XHPPcwo2m8xmrhvgScn/nuxz7IGMQnRPoPsjT/6/Q3FQ1FmCkJTtlL/Udy5bD3efdSfM
 c5k/M4sQyyvmcisnXphiMjUAmMqDaxpQBVE6Cal/zDz/0bhBNfvVENqXQSRlydCalIaO
 BZ8xJoUnlrsdDZVeiVG9562TAokuovzvdqK+b016nEbngW5ddflDh2c5LJrhRPoWEM/3
 8l5g==
X-Gm-Message-State: AOJu0YymVBlsHk1ImWHPMMMurp3nTJFBw/t3+/vUypaQHaJA6ZmgATh0
 O4FQ6oOjpcupZ0CHgmKP25rnig==
X-Google-Smtp-Source: AGHT+IF6RKovQQ9aR3sj/MtWo+qCffcSgX+8LVBA8oYQK+LDLy9/izTzq6IYmC4r8MD53qOXfxBbLA==
X-Received: by 2002:a17:906:221c:b0:a19:34e1:990a with SMTP id
 s28-20020a170906221c00b00a1934e1990amr413692ejs.22.1701353842474; 
 Thu, 30 Nov 2023 06:17:22 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 my18-20020a1709065a5200b009f28db2b702sm716064ejc.209.2023.11.30.06.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:17:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] dt-bindings: display: panel: Add Ilitek ili9805
 panel controller
Date: Thu, 30 Nov 2023 15:16:24 +0100
Message-ID: <20231130141705.1796672-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
References: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Drop power-supply

Changes in v2:
- Add $ref to panel-common.yaml
- Drop port, reset-gpios, and backlight
- Set port and backlight ad required
- Replace additionalProperties with unevaluatedProperties

 .../display/panel/ilitek,ili9805.yaml         | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
new file mode 100644
index 000000000000..f4f91f93f490
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
@@ -0,0 +1,62 @@
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
+          - tianma,tm041xdhg01
+      - const: ilitek,ili9805
+
+  avdd-supply: true
+  dvdd-supply: true
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
2.43.0

