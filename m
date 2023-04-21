Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16A6EB9B8
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23EB10E2E5;
	Sat, 22 Apr 2023 14:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D4910E245
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:43:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3010889c6ebso1180209f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682091815; x=1684683815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Rh5L0vsYaIJ9UtaeVaKtzuEvdISSccm2v33XZZjkI4=;
 b=Nf5g+P/2+GOnJtcEETuFuhmiT6sxWDb6M/P8XwlazYJzQwW+ryb8LT/aCq3QZmzpHg
 0jyLaje0Akfc1PqNEne8n2TBpyR4vRHCS8Bl5tfmjXt5I9o1krBiH9+pXPXGLo/yiOoL
 f0MfOzY040ehJ8oafyUGYk1kmQpoEkpb43mNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682091815; x=1684683815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Rh5L0vsYaIJ9UtaeVaKtzuEvdISSccm2v33XZZjkI4=;
 b=HBBTk7JNkGgMlN9OttdpFV1Ujf0k51GfyvQOTJqR9SphFxuZWP4DbRl0lgETegcUUy
 AkaPY8WTPrqqK9sjf2Hc+1FXyLvkJCIeWG6Sd6m7lExPz/XHdBQqPbIP9WZzv2ApMxrj
 UFUomR4JDLSgWcMswE37KfHdrwG12fV9SJzF8HbhKoi0K0vnT9z7ntrTrkH8fKY3q4h4
 qLWr7XD8CNzNE1PuBqXLAFBuLytEr9J4x/veXvck/feIeTcezEcFa5uaCqlOHDRtQ//0
 /fikUzJCXk1MQkRCnXUbqlGh2PdlRtl2yrZvM4RvKgRORydTAXDuVfd6Z8gMPFMiIJt5
 SACg==
X-Gm-Message-State: AAQBX9d6Iq9TmdYxbGk5OlBPIgScbK9vlssL2HEGgkv8EBobwx9EbChm
 h/FuLUlmcTpg79UhdIhmZLEkjg==
X-Google-Smtp-Source: AKy350Z4jDGfwkjgv5nKn5t4OLHWR40djybZIow/2j2qoDHhl3eeH7HhQlGAOSGiV0g/WfUXMy3PmQ==
X-Received: by 2002:a05:6000:1b85:b0:2fb:2a43:4a97 with SMTP id
 r5-20020a0560001b8500b002fb2a434a97mr4068854wru.39.1682091815035; 
 Fri, 21 Apr 2023 08:43:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.127.129])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b002e51195a3e2sm4651609wrw.79.2023.04.21.08.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 08:43:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: display: panel: Add Ilitek ili9805 panel
 controller
Date: Fri, 21 Apr 2023 17:43:05 +0200
Message-Id: <20230421154308.527128-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
References: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Apr 2023 14:45:29 +0000
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
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

Add documentation for "ilitek,ili9805" panel.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../display/panel/ilitek,ili9805.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
new file mode 100644
index 000000000000..57c36cf22e4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
@@ -0,0 +1,60 @@
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
+  port: true
+  reg: true
+  reset-gpios: true
+  backlight: true
+
+required:
+  - compatible
+  - avdd-supply
+  - dvdd-supply
+  - reg
+  - reset-gpios
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
+
+        panel@0 {
+            compatible = "giantplus,gpm1790a0", "ilitek,ili9805";
+            reg = <0>;
+            power-supply = <&reg_display>;
+            avdd-supply = <&avdd_display>;
+            dvdd-supply = <&dvdd_display>;
+            reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
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
2.32.0

