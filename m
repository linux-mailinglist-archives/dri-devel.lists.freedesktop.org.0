Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE35B1FE8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD5E10EB01;
	Thu,  8 Sep 2022 14:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCFB10EAFE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:59:57 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id f24so17982597plr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 06:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uBX7AFPsGNpi09ZLgJTSk7omj1yoYlNTHSdXs9g/ZQE=;
 b=vmi6Iu6rO9ZJTYd5xlE1Hl8I8lsDOBhqmqlH8MSqkLGYIm5Z4TYFisNM0zsxo7twIC
 lG/W1dc6D+Hvr+o6o9vcCTxcFcPc8Hg1M21g4+S/8qI5KyKNQOtkdiOw8SXA+G9gMS5M
 kP4Fq//G28Bk7C89BRXHsIkUYgKdO23dgzZz2e0F+XMm3bW5aXxV7MLe/YzJViw6BE7Y
 UcaO2SzJuAT0zaVPM1o2s0MdJZTwLjkIINJwSeG23FDoYCvzTw/yra+Uj/1/Rg5CL+K4
 nqI/LvYudVi8a3Vui1jy/Z/lV41zmZ/06Vs5xe0tnczzcPqWK1Da7jdwbmwhFFogF5Qg
 z/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uBX7AFPsGNpi09ZLgJTSk7omj1yoYlNTHSdXs9g/ZQE=;
 b=qJrSnu6CTjsiKAUHFowv2C7kCtQc9A3Y3AT9DmV41e9NGtaHBEfmzeY4rqDqhaJTmF
 cWp4fqR2rx14UB4subkaYVEu1pVLTBtqZJFIxcTLg3PNRvPv/b45mZNWMSNvOwU3EXNp
 7lg19Tus4QTWhwX9nVu0RpoUTOxQQZ03qR+AnVnv5K71TCc0j5fj/5R3ghoc35WA4eQV
 v1nIif8Tk67A8t0BYsZfmJc7+I69Ngf6oYcI1zEpjvLlLF+wb+zz3Uvq52GTDAcnAus8
 mF1FP0sOMuJ+CZ37z6wV5rPLyETxaoj499vwCj49Ab0a4xzxsJWrfTr9konsP//1r7MF
 WS7A==
X-Gm-Message-State: ACgBeo0HRFv1UYmMLfJ9P563vfGIAoSB4qEx91ncKEQ1RZcuUYESu2Xn
 QfdpbmI886ilFtAqGbB5zNtjuQ==
X-Google-Smtp-Source: AA6agR5RIbCSuKlZztKCcBKDkegrRYP1SvT5Mf7jJoQF2DsnRKlyRpWZGxUeOK0WwlSUW/QIe15Caw==
X-Received: by 2002:a17:90a:cc04:b0:200:b869:5ba4 with SMTP id
 b4-20020a17090acc0400b00200b8695ba4mr4489374pju.234.1662645596561; 
 Thu, 08 Sep 2022 06:59:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:f525:b238:30b0:311e])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a170902d2c700b001709e3c755fsm7073200plc.230.2022.09.08.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:59:56 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: display: Document Jadard JD9365DA-H3 DSI
 panel
Date: Thu,  8 Sep 2022 19:29:39 +0530
Message-Id: <20220908135940.299324-3-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908135940.299324-1-jagan@edgeble.ai>
References: <20220908135940.299324-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
dot matrix LCD with 800RGBx1280 dots at maximum.

Document it.

Cc: dri-devel@lists.freedesktop.org
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- collect Krzysztof ack
- rebased on drm-misc-next

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
index fc62434f693f..ef45fbac0ba0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6388,6 +6388,11 @@ S:	Orphan / Obsolete
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

