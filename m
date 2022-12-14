Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852F64CF20
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230D710E034;
	Wed, 14 Dec 2022 18:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A852410E034
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 18:06:23 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-142b72a728fso17626839fac.9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lJuELApsBW0bc4szk9ypcA4YHRJo5ia7+cbg67UL5U=;
 b=fQA4VQ3OCWwd4w7xebn1Qy4gZqGHSwP5LXVazCqCe8zjxYEn2DuQpUNeQn1UV3xRfc
 5T4/Pb3zcFy2cfW8Jt37iwM3ll42EkIw3gzS/7KJ006EVaVOQNWxBMrEsr9xLHMPq8+c
 yCrVR/QKBFkfidQKQZArP1zg53V9jcnx3CwWSHnZiNc0tKMPvYlnpy2a0M2+zF8/Ji9y
 YxZbgEuq7W3ilpe1WySlDOec1kG/bHjI9tFXf+dBP56VYaL+Rs9c4WJimct7U3DTfhBC
 OjH2THC0ZXm7dcTU2I0HtlxkYVQJUijBSjA1H1mQKzPxA251jMEKptNBK9PFmVwEcRYZ
 1mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5lJuELApsBW0bc4szk9ypcA4YHRJo5ia7+cbg67UL5U=;
 b=nSLTqGs9ky7pfcUW5z2mab6iGPvFXKe4bhxPcSPy79ih8yj0xMXIUPuAsw7IFLynNi
 1ZMOj7pVbvGP1sfZQsqY22KfwO4DR9ujPcnYuUaFJulBhz5diEVihMD5cNSUx197Go9D
 Gpw0wdprRibtDQJy5UopHaGJOcZGgDZhqIMaiZEXTONmNDsfq7ORnyO3iWykhWaQ2k58
 V7CO/mjcVQ1WJxgbgd+v0Chl73tQn14ljKM6n58IhalRZ6L+NBr//YwFX5Ac2q/V9eG5
 mRdN10y7Wc2B+E8/7Zk5XZdK5sZQKagndWRBdz9ldoinvVIaSKD9Bgbj80PFMysgfsP+
 7T/w==
X-Gm-Message-State: ANoB5pkHpL5NsnXdtWDpF49jjYd9Js4ZtITbSanTw7WURG4glq5vOsJ6
 KK1jjlqx4C6ZjG5qYTL0Vzz1ZMcrlRY=
X-Google-Smtp-Source: AA0mqf6CRpxND5wX8WG7PknsUegtAvu6jzYKe5UJkUYKfgSI1v4Wo1cOWfkO7nuSIfYbb++M3voP3g==
X-Received: by 2002:a05:6870:8c1d:b0:144:ee4d:b687 with SMTP id
 ec29-20020a0568708c1d00b00144ee4db687mr10323543oab.19.1671041182006; 
 Wed, 14 Dec 2022 10:06:22 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a056870b00800b0013b0b19100fsm3034008oae.32.2022.12.14.10.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 10:06:21 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 2/4] dt-bindings: display: panel: Add Magnachip D53E6EA8966
Date: Wed, 14 Dec 2022 12:06:09 -0600
Message-Id: <20221214180611.109651-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221214180611.109651-1-macroalpha82@gmail.com>
References: <20221214180611.109651-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 tzimmermann@suse.de, sam@ravnborg.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for Magnachip D53E6EA8966 based panels such as the
Samsung AMS495QA01 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../display/panel/magnachip,d53e6ea8966.yaml  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/magnachip,d53e6ea8966.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/magnachip,d53e6ea8966.yaml b/Documentation/devicetree/bindings/display/panel/magnachip,d53e6ea8966.yaml
new file mode 100644
index 000000000000..0a57a303a758
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/magnachip,d53e6ea8966.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Magnachip D53E6EA8966 based display panel
+
+description: |
+  Magnachip D53E6EA8966 based display panels, such as the one found on
+  the Anbernic RG503 that is combined with a 940x544 OLED Samsung
+  AMS495QA01.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams495qa01
+
+  reg: true
+  reset-gpios:
+    description: reset gpio, must be GPIO_ACTIVE_LOW
+  elvdd-supply:
+    description: regulator that supplies voltage to the panel display
+  enable-gpios: true
+  port: true
+  vdd-supply:
+    description: regulator that supplies voltage to panel logic
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_3v3>;
+
+            port {
+                mipi_in_panel: endpoint {
+                  remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.34.1

