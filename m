Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6365A02DC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84DDC7E5F;
	Wed, 24 Aug 2022 20:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BED710F764
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 18:44:00 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 73so13003657pgb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=e6xmGRsUy5CVWXkkBzqW8hMvVXzIsvM15KrfP8pRT4c=;
 b=XlQJ6Pmf6FM6P9HgS86MvAkKQN5SRDZxo5dgNmSgYZCoAqoxS+So9IQBVGnp0QofFD
 dq7/OgJPv2fuAcj/nixndjIJEUHDWd1+tUutCAnEdITIeSA4hktyjdPmbNlZjSLn0Lw4
 6HYeCCxT+BV7E/asoB7YLIr/tyGLQcgSl+D/R23WOwB+6/F8X/7P+TBf+eBk9ycAA5iR
 EKGC5rVusVLP4Hhgc3Jw1rRMXiaRwJP77jOivbYEPZAj/66TEo9iRCoKZqoxPc3xc345
 J4K0t66nNXqJsiimEEWVEp/4pSdsclPkZfOZhgLPnLUHClFzsyxL0qQLgDUfg2BBUswL
 twiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=e6xmGRsUy5CVWXkkBzqW8hMvVXzIsvM15KrfP8pRT4c=;
 b=1SUSqYAX3FA98hlQ9H1Ex4aNgj/k+Ts+bD8j8O2Nm3ScQPYrSARNn1NNdv5hQTQAiC
 6/5Gyrn392iIiLTBpch9moA8C31JhyHSD+nxmxavpRniW5fEqqfkDILhE0s1/X04FMwD
 2/RVkytPDO2Sin2+PwTgA4YKSpTideG5J9mUiF3r9ZCFEr1efJllZ2ywoi/wOfurqhwT
 LqY1GVDwecLjYpPe2lmIvVxKUzfIX6ojIb6Rfmh7vxmv8ItBucEEk3S298WHojKoiqZ4
 D3kHXmpUOL4fPGCOOH6btHYo6B7u9w02X0IPz+52+DQ6AOei8CJa8CE1x8xS/nQWHY7B
 6cSw==
X-Gm-Message-State: ACgBeo1FobkvqYc3zoXqz52i3lfD2xDxt4zx8SA+/0oLKGJ8egry89QH
 379I9qdu5yrAnRlKsGr9TjG4rQ==
X-Google-Smtp-Source: AA6agR5Vx2++EIQt2E3SmDU8RYJqzEEOCmAhZPT/gsoZWote+lPS70tGrRxhjo0nJhxCwidCNofz4Q==
X-Received: by 2002:a63:4625:0:b0:42a:d055:22df with SMTP id
 t37-20020a634625000000b0042ad05522dfmr6035867pga.312.1661280239746; 
 Tue, 23 Aug 2022 11:43:59 -0700 (PDT)
Received: from localhost.localdomain ([23.27.44.55])
 by smtp.gmail.com with ESMTPSA id
 b187-20020a62cfc4000000b0053641e66825sm7767647pfg.173.2022.08.23.11.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 11:43:59 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 3/4] dt-bindings: display: Document Jadard JD9365DA-H3 DSI
 panel
Date: Wed, 24 Aug 2022 00:12:41 +0530
Message-Id: <20220823184242.3554472-3-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823184242.3554472-1-jagan@edgeble.ai>
References: <20220823184242.3554472-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
dot matrix LCD with 800RGBx1280 dots at maximum.

Document it.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 .../display/panel/jadard,jd9365da-h3.yaml     | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
new file mode 100644
index 000000000000..23dfd5b5496e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/jadard,jd9365da-h3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Jadard JD9365DA-HE WUXGA DSI panel
+
+maintainers:
+  - Jagan Teki <jagan@edgeble.ai>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - chongzhou,cz101b4001
+      - const: jadard,jd9365da-h3
+
+  reg: true
+
+  vdd-supply:
+    description: supply regulator for VDD, usually 3.3V
+
+  vccio-supply:
+    description: supply regulator for VCCIO, usually 1.8V
+
+  reset-gpios: true
+
+  backlight: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vccio-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "chongzhou,cz101b4001", "jadard,jd9365da-h3";
+            reg = <0>;
+            vdd-supply = <&lcd_3v3>;
+            vccio-supply = <&vcca_1v8>;
+            reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+            backlight = <&backlight>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c96115c620f..2ef50447e6e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6466,6 +6466,11 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/i810/
 F:	include/uapi/drm/i810_drm.h
 
+DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
+M:	Jagan Teki <jagan@edgeble.ai>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
 S:	Supported
-- 
2.25.1

