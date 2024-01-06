Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33505825DC6
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 02:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CAD10E087;
	Sat,  6 Jan 2024 01:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450E510E087
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 01:56:36 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7b7fdde8b98so5867239f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 17:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704506195; x=1705110995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i+LWwQUxPGNKn5U+Qf5QO1Fu+mbBj3ic6g6L9xHp8GI=;
 b=RZyHHym1Dq2cRPA6Q8el2tBo6Maz9EPRU3AnzZ6jb2bF6k1xLwdDFQN+zo/G03ef1I
 Y+2QqJD0qDjXgF5Do8TDS8g2NnYILoJb02TaIcPxtrPp2grk8ADnJPPZwjlJa8m81LL6
 aph4vULw8E9vcTs+cLMwmXTJLRXOUtu0evHVj9U9Ub3BIHf51TaXKhVKn3YTO5ne98OD
 YVZdf7H+2rYSmFEqVxdbeysm4c6CMLcouxHHdhSbx9uVOOhxuYsrsIm4Q3UCF/fndy6U
 hHwnFACndTmWKR347PUVmoCXFjx+zgBf2U9JBbI91SfqZx5Fjh66rKnv2ars2htWJWGX
 00qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704506195; x=1705110995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i+LWwQUxPGNKn5U+Qf5QO1Fu+mbBj3ic6g6L9xHp8GI=;
 b=J8m47aIXf4jlQaLJU1Y1APQankCnYnXBuSreGJw9lxcd2BjDHv/zdwRXSWcCbeNpcA
 t16w82iluYhtNRBcRNKh1IBAFomblS9Ylw3hzsFZ69RYRfJ5MWXIreQpdEp6OSbVsKvz
 QmsTBtqeNC5RD+i3sOoKF6XoCMT3v1nxjYcxYnET6uGxMqO2XFp6WMRkLvrMCLPu8IOz
 C0YK3TIEqfRXKmzmU0qJUrImLX0ipJWm/2xNltQ+qjjZBSOKxVdlBvIbvzn8uStqugrf
 wCsZws01fvdjOOqwVJPsaBe09sRGAagwnNHf2sZ8UJkYerPbbCyOW5iGfTTS4LBhYaN+
 d1kA==
X-Gm-Message-State: AOJu0YzIJP31KcA6dTqpTkDpH35oF1U1V1DDIsTYe6S1uAPdA67qBiSb
 zCKjOzYSoikcbJh9rcISZjoZBZM07BKJ/A==
X-Google-Smtp-Source: AGHT+IFdiuig3TpYrWIETZpc8CXoJcAvcEpJgmpxciXZY/wiR/jgla6c4yBDcdI5Nou6kpEQaAHuYQ==
X-Received: by 2002:a5e:c905:0:b0:7bb:f472:c322 with SMTP id
 z5-20020a5ec905000000b007bbf472c322mr459304iol.15.1704506194946; 
 Fri, 05 Jan 2024 17:56:34 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:df15:214a:36d9:2326])
 by smtp.gmail.com with ESMTPSA id
 ci13-20020a0566383d8d00b0046e06d79884sm459581jab.26.2024.01.05.17.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 17:56:34 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 1/2] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
Date: Fri,  5 Jan 2024 19:56:21 -0600
Message-ID: <20240106015623.193503-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Add binding for the i.MX8MP HDMI parallel video interface block.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

V5:  I tried to help move this along, so I took Lucas' patch and
     attempted to apply fixes based on feedback.  I don't have
     all the history, so apologies for that.
     Removed the pipe character from the Description.
     Increased the register size from 0x40 to 0x44.
     
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
new file mode 100644
index 000000000000..3377f152f319
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI Parallel Video Interface
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+description:
+  The HDMI parallel video interface is a timing and sync generator block in the
+  i.MX8MP SoC, that sits between the video source and the HDMI TX controller.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-hdmi-pvi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input from the LCDIF controller.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the HDMI TX controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    display-bridge@32fc4000 {
+        compatible = "fsl,imx8mp-hdmi-pvi";
+        reg = <0x32fc4000 0x44>;
+        interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                pvi_from_lcdif3: endpoint {
+                    remote-endpoint = <&lcdif3_to_pvi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                pvi_to_hdmi_tx: endpoint {
+                    remote-endpoint = <&hdmi_tx_from_pvi>;
+                };
+            };
+        };
+    };
-- 
2.43.0

