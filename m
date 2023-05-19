Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977AD709E79
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C182A10E5CB;
	Fri, 19 May 2023 17:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C10C10E3A4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 14:25:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f475366522so21246425e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684506335; x=1687098335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXL/sILoWENE3XBFz1jyrq42x+BgMkEmVV3BRtYQa0Q=;
 b=YcB1o1a36BNLAprjM6dWjokGpYysOeAU42OoeY4hhjvq+oZJ/O6ahscJvJJ+CLczDz
 sL5iYNswIapoQeBwm/FlDrHrTZ2j08UZ6wzgvGryd2MARBlmwMH0PeJL7rIztafeJwag
 Vub7GL3cKL6lCfTioP2cODsWWwkz6uwEZ2WFTRG0RQGNmKD3DbM28DUFhUrz6ctNXu5H
 eyk6oN0Wi6HmF2ts02vujMj+mK0+xHRN1zezCWjh/NcezmO9ZI28M33vrR0IZBNE4yjo
 HDJ38MberoUJbmx3l6bp+p+qjY42fkZhsIrClpyyHvn8ODIzGGyjmEhe27zsRudB3fQd
 VsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684506335; x=1687098335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXL/sILoWENE3XBFz1jyrq42x+BgMkEmVV3BRtYQa0Q=;
 b=Oz03GGS5rfO8n3SvhstkuTSXlAG97GYuZAHz6WPlhwhcxEH1pR7ECXwNG0Sw0nvlNM
 bQgNq7dLcCFqJwkLU5Yxc3mTp1+i8tIYhyXd9U8BkdoBZKbFkNsP3rac/Tma/S3p6/jP
 D+2M6FsRNTOKYGf2u3UxeZSf9mfTOONfO9uOwnhQkE3N2GUKYLDTK3jNiZ+Ij+1uMAO4
 t9HBqMLaXSaRazgS7wRzp4+Rq1Ubn7QkTLf4gkpr8VZBwNCpbcZPWeyLs7j/Vg5Et0f4
 gOVqv5JR8sMBvI82/gNgAeLxoIeiyGj5M8AaR0o9xowomb+A8wh+lRzmK/zUKb/sf+/E
 EjVA==
X-Gm-Message-State: AC+VfDz4ebTIeAvkq1wgN07L1mz7fvZAtFjOLetE2eJI2Zcbfn6MnYb2
 Al+3fRVi1plv9iDHzn7abn0=
X-Google-Smtp-Source: ACHHUZ6DEEtxI4PqKANjVq7Q/b0VWEQq6K+AFaI3Nf8PB6N/OnFiCs10kk/8RYmpJIt9yL4yV3/qgw==
X-Received: by 2002:a7b:ce96:0:b0:3f4:1a97:ab07 with SMTP id
 q22-20020a7bce96000000b003f41a97ab07mr1562669wmj.8.1684506334498; 
 Fri, 19 May 2023 07:25:34 -0700 (PDT)
Received: from fedora.. ([95.168.116.22]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d4fcc000000b003062b2c5255sm5451748wrw.40.2023.05.19.07.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 07:25:34 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: add fannal,c3004
Date: Fri, 19 May 2023 16:24:55 +0200
Message-Id: <20230519142456.2588145-2-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519142456.2588145-1-pavacic.p@gmail.com>
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 May 2023 17:44:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
Fannal C3004 is a 480x800 MIPI DSI Panel which requires
DCS initialization sequences with certain delays between certain
commands.

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
---
v3 changelog:
  - renamed yml file
  - refactored yml file to describe fannal,c3004
  - added matrix URI to MAINTAINERS
v2 changelog:
  - revised driver title, now describes purpose
  - revised description, now describes hw
  - revised maintainers, now has only 1 mail
  - removed diacritics from commit/commit author
  - properties/compatible is now enum
  - compatible using only lowercase
  - revised dts example
  - modified MAINTAINERS in this commit (instead of driver commit)
  - dt_bindings_check checked yml
  - checkpatch warning fixed
---
 .../bindings/display/panel/fannal,c3004.yaml  | 75 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 ++
 3 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
new file mode 100644
index 000000000000..a86b5ce02aa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/fannal,c3004.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fannal C3004 MIPI-DSI
+
+maintainers:
+  - Paulo Pavacic <pavacic.p@gmail.com>
+
+description: |
+  Fannal C3004 is a 480x800 panel which requires DSI DCS
+  initialization sequences.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: fannal,c3004
+
+  reg: true
+  reset-gpios: true
+
+  vdd-supply:
+    description: power supply voltage
+  vddio-supply:
+    description: power supply voltage for IO
+
+  width-mm:
+    description: physical panel width [mm]
+  height-mm:
+    description: physical panel height [mm]
+
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "fannal,c3004";
+            reg = <0>;
+            pinctrl-0 = <&pinctrl_mipi_dsi_rst>;
+            pinctrl-names = "default";
+            reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&reg1>;
+            vddio-supply = <&reg2>;
+            width-mm = <93>;
+            height-mm = <56>;
+            panel-timing {
+                clock-frequency = <27000000>;
+                hactive = <480>;
+                vactive = <800>;
+                hfront-porch = <30>;
+                hback-porch = <30>;
+                hsync-len = <8>;
+                vback-porch = <30>;
+                vfront-porch = <30>;
+                vsync-len = <8>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..f962750f630a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -462,6 +462,8 @@ patternProperties:
     description: Facebook
   "^fairphone,.*":
     description: Fairphone B.V.
+  "^fannal,.*":
+    description: Fannal Electronics Co., Ltd
   "^faraday,.*":
     description: Faraday Technology Corporation
   "^fastrax,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c22c828ab46..62374c8424b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6427,6 +6427,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 F:	drivers/gpu/drm/panel/panel-ebbg-ft8719.c
 
+DRM DRIVER FOR FANNAL C3004373132019A
+M:	Paulo Pavacic <pavacic.p@gmail.com>
+S:	Maintained
+C:	matrix:r/mipi-dsi-bringup:matrix.org
+F:	Documentation/devicetree/bindings/display/panel/panel-fannal,c3004.yaml
+
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-- 
2.40.1

