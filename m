Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C56EB9B4
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCD510E2BF;
	Sat, 22 Apr 2023 14:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF3D89CC1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:43:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f7a7f9667bso1200668f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682091809; x=1684683809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGhninvCfwM3cEyNcZ4WVCLboSbKUZEfNvggheMtKI8=;
 b=qq5fZeLPGJBiR9WhxWVr/J2CJptqhk9VO5SyqMuOtE/wlt0cn3bA5tQnKH7Fzvp8+t
 mUSsTPeg36zmG9mmFLDh6jBXWURqB90UmXSIkSxoF4c7IDP1MH8KxDGY1+VRnsi3gLYU
 zMKDZgKWr5HuGtUMzABagGDObqud77iPIHM98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682091809; x=1684683809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGhninvCfwM3cEyNcZ4WVCLboSbKUZEfNvggheMtKI8=;
 b=BqXqTxEMPt0GgReLy5sQ0gZQcGi8mBZCGOihG23BFhJvcMxSnOUQ31b1A5uZIprMlN
 SZ7FyBx0YeE0Zm+hDdp9nLdoa7gaApTzyvD2pH5I6tnGnvp20o7ec9gt5qCt/gkQ9Kiw
 axf4zuyGrOj+8IjFnTrhtGBr1jATIEuijF00bkynvwDURNdkgw6cCRmVHWKyQ3oB8M6U
 K532s5KALda22E8+cFX6LjjZwxb0pLgKbdrfneZtEc16KBely5oY0DuBk2ySV+JdporV
 w8vlUoyFADK4KYXH1F1w2WCZjkVfUC73TPZNRu3Ptl+hNuHX2sXjPfsUcswHmOTeHdM8
 l8YQ==
X-Gm-Message-State: AAQBX9eT+Jgf+l02nMDGNA5czMp/RFp4ElT6vkFsYR+qV/eiJeHAcNEI
 ZMUHOE20CcvoF2DHoto43rVvtQ==
X-Google-Smtp-Source: AKy350bNOn0XaJOZbHF/mKa+8yWb9j1RXhwzD+mFTe+LakHPYoh+l9jh6N7W7PRZUGF+DcSi/r7iFw==
X-Received: by 2002:a5d:4147:0:b0:301:8080:a8fa with SMTP id
 c7-20020a5d4147000000b003018080a8famr4768749wrq.27.1682091809492; 
 Fri, 21 Apr 2023 08:43:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.127.129])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b002e51195a3e2sm4651609wrw.79.2023.04.21.08.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 08:43:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: display: panel: Add synaptics r63353 panel
 controller
Date: Fri, 21 Apr 2023 17:43:02 +0200
Message-Id: <20230421154308.527128-2-dario.binacchi@amarulasolutions.com>
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

Add documentation for "synaptics,r63353" panel.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../display/panel/synaptics,r63353.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
new file mode 100644
index 000000000000..13e6ed39e124
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
@@ -0,0 +1,58 @@
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
+properties:
+  compatible:
+    items:
+      - enum:
+          - sharp,ls068b3sx02
+      - const: synaptics,r63353
+
+  avdd-supply: true
+  dvdd-supply: true
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
+            compatible = "sharp,ls068b3sx02", "synaptics,r63353";
+            reg = <0>;
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

