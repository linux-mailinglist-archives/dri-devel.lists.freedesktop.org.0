Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC4C811413
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D602610E2B0;
	Wed, 13 Dec 2023 14:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269410E2A2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:04:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so8920382e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702476291; x=1703081091;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dqXlBbcQt0R29oSjxr4jyi0yptqDX27ArBU37Ndav8=;
 b=eg9mQOKc+jzHwzo1MBqC7nW5J8WzktzZnUarNV86+s89cHUGEocN8IXtFcPCRc7DMO
 LnBSYc5JiUa8x5xdiZ9DI8TvlLdBgUY7kqTvzd5DCU/RwJKY+TvbY9KpD0N6o7gdkgiS
 FHdaUtriG64N0o/SEJMfYdS1QMITrCanmeZJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702476291; x=1703081091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dqXlBbcQt0R29oSjxr4jyi0yptqDX27ArBU37Ndav8=;
 b=ZNIeIuVM9SidHVedttYuIuM08c0B/pcBSdq5DGqSJSPLSpN/SQ9WybdLSOiSZDnb87
 xEn/88lVehNARPRfquGKsh2Cd+DIZaFOvnJRr5WUBegvq4SYU4iKhOCO+4JIsKP5VglG
 EP+qMYXxcc+g/c4iUQZhZOzGbIGvi3udlExDrGq4Ii9upPafzOic7yQEurbvPoJdpgME
 WvF34OSfxQmMRLefYDmf3kI06ZFGmvu8zMja6XSbP/NLBGQM7NKVR6KdnpbCRUiFQwFS
 CQ6y9ZRR68YW4BUftDT19fNAAhzkwKdJC8pGIAJDwuJNvvytoHT5t3MQTtZgbK9Zd1yE
 UJmQ==
X-Gm-Message-State: AOJu0Yy6sEiyuYF53w9zXaFJa1Jv1AntBVGnqmA/x9I36X3jwi0jGSkn
 MvZnWe9GE7//7CRbEa+80UKQgg==
X-Google-Smtp-Source: AGHT+IHfw1WlP9inuYGIENHnhTTUJtDuxBwuDowubx41cZfFvg/ZN3KRTyRxbBmkckspL7A9vZiN8g==
X-Received: by 2002:a05:6512:5c3:b0:50b:f9b2:ced with SMTP id
 o3-20020a05651205c300b0050bf9b20cedmr3452370lfo.22.1702476291575; 
 Wed, 13 Dec 2023 06:04:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 sf22-20020a1709078a9600b00a1ca020cdfasm7797635ejc.161.2023.12.13.06.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 06:04:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] dt-bindings: display: panel: Add synaptics r63353
 panel controller
Date: Wed, 13 Dec 2023 15:03:44 +0100
Message-ID: <20231213140437.2769508-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213140437.2769508-1-dario.binacchi@amarulasolutions.com>
References: <20231213140437.2769508-1-dario.binacchi@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

Add documentation for "synaptics,r63353" panel.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v3)

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski.
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.

Changes in v2:
- Add $ref to panel-common.yaml
- Drop port, reset-gpios, and backlight
- Set port and backlight ad required
- Replace additionalProperties with unevaluatedProperties

 .../display/panel/synaptics,r63353.yaml       | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
new file mode 100644
index 000000000000..e5617d125567
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/synaptics,r63353.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics R63353 based MIPI-DSI panels
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
+          - sharp,ls068b3sx02
+      - const: syna,r63353
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
+            compatible = "sharp,ls068b3sx02", "syna,r63353";
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

