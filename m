Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56B724560
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71C710E356;
	Tue,  6 Jun 2023 14:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11D610E356
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:12:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6ef9a928fso51643045e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686060734; x=1688652734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGY9TCQS8TEAFvSGwYEA7aVQSCRdWtRRVueHUxdsl0A=;
 b=CC0rLczqRuSN9jOQdI9c11sNEzlv4hGHuQjE4KH+0qlYApeaIHZQVKsN27GA90Fi2l
 HfMcL8RNG3SvdhgiTAtU0k5khGeqAhwUk2xoZiPmt2+azjIoiH05lV3uZL9dvp0wCtyX
 ME6WfA76iaZ0AQtKvSBa9ClEjQCGaE2+kagDGMgziCuXwn2ntHDiXwBt7PjwnrCpUxxL
 pjLjxzHUb8gpcMMLSnXaazKflizahnd1jpg6jX8NqUczWwVxyeNhD3BDTaAOW+uIbRau
 I4sTQ4KVlpKznilRhvuWYl4r4HCc1tLei8DrMVvi8/VBhabGmRMP6xjx8t5H89qER9J3
 UH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060734; x=1688652734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGY9TCQS8TEAFvSGwYEA7aVQSCRdWtRRVueHUxdsl0A=;
 b=aq+Ud4Gjt5fFGwq2F7SbQgyB+SV7BfC7sHaAfwOmTM0KF1if/+18dekoBbHxeKg26u
 boHIlpwXZsVNQuyx0M1UW/jxW4TIKtfRzPWLcA2/vVeNMZuOHlZutqBvYBr2dVhYGWr/
 m1I0/OjYWlUSumbtE1+8Ft/AKsajyEXDE9/NXSB3tW0A65Ct/dhVoKqRHkoQ4hUmfnZ0
 f4CIdMj7r0rHHUigvYrS6v5TYYrrTdGHE8dSNKvuUX1ceNHH6Pl3PRxPru9EW9lcG8l0
 /TPUZJL6MXcLLqqCemoz+91F7j4iOv23vhG05pcakW5bGJHjdt+fC6b2JUhMMA1f6SoX
 a8Zw==
X-Gm-Message-State: AC+VfDzq13nfx3NmA1OFluo+L1dMd9iEl0JX//drV59ZFG9sFT3mFN9A
 Jwlj/woM991kMCn226mdqio=
X-Google-Smtp-Source: ACHHUZ4YM9OS0oZ2YgCyoHeXx+qk6i3GZi17h3730ytUvjaoEe3PRNJ/g9WR8oUiOw7Ce6nxqLoWhw==
X-Received: by 2002:a05:600c:230f:b0:3f7:e497:aa03 with SMTP id
 15-20020a05600c230f00b003f7e497aa03mr1855187wmo.28.1686060733499; 
 Tue, 06 Jun 2023 07:12:13 -0700 (PDT)
Received: from fedora.. ([212.15.177.3]) by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b0030903371ef9sm12694315wrv.22.2023.06.06.07.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 07:12:13 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v3 2/3] dt-bindings: display: panel: add fannal,c3004
Date: Tue,  6 Jun 2023 16:07:56 +0200
Message-Id: <20230606140757.818705-3-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606140757.818705-1-pavacic.p@gmail.com>
References: <20230606140757.818705-1-pavacic.p@gmail.com>
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
v4 changelog:
  - add spaces between properties
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
 .../bindings/display/panel/fannal,c3004.yaml  | 78 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
new file mode 100644
index 000000000000..bbddb036094b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
@@ -0,0 +1,78 @@
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
+
+  reset-gpios: true
+
+  vdd-supply:
+    description: power supply voltage
+
+  vddio-supply:
+    description: power supply voltage for IO
+
+  width-mm:
+    description: physical panel width [mm]
+
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c22c828ab46..4f4492d0f6c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6427,6 +6427,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 F:	drivers/gpu/drm/panel/panel-ebbg-ft8719.c
 
+DRM DRIVER FOR FANNAL C3004373132019A
+M:	Paulo Pavacic <pavacic.p@gmail.com>
+S:	Maintained
+C:	matrix:r/linux-drm:matrix.org
+F:	Documentation/devicetree/bindings/display/panel/panel-fannal,c3004.yaml
+
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-- 
2.40.1

