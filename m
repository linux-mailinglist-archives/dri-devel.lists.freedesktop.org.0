Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610ED8261C2
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 22:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5246710E0E9;
	Sat,  6 Jan 2024 21:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25CF10E0E9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 21:51:53 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7bc332d3a8cso49187239f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 13:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704577912; x=1705182712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TjQrh5h1eahZONpR05p3w9rNE8So3C2WDYnYx2WcRS0=;
 b=HmcrfK9ck8qNMWMG2V46IUW8B5QKxWSCDzQgU+YWWz3OATn+UkjQo7GLG+f6KTeBu4
 JaHkItm/vl7KjLSnRrUnAq0NPfn01LvQ6ugFTIEIxx3cAUbdBhgNBBUZl2Xjzjc/Yeek
 5eoGb2jg4+mcIqJBHXAsttiYVduCce5CMmQumw2vh18/1m3xxiM83QzHRbGJmo+MWMU9
 A2SpQ9T5nRopI7ewcClZoE8PxH2XYJ38d1xvLWlT2KH7ovbC1QY9HEljCKUaHX06NESL
 e6fX7MzDBKsdDx28J8EMMZyY01ln9cOm/NTum+15ezZjWRnDFkzHgqIGFGk0vI+Bq/tx
 eO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704577912; x=1705182712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TjQrh5h1eahZONpR05p3w9rNE8So3C2WDYnYx2WcRS0=;
 b=l2dz/ADA0YPamNMKHKeC4B7d9sbXz3TmnCeNkCBGvhFNp8n3W31t9O1R0bjse0u7Ho
 fTMjaYo3ufTC6U4rx1eibf8zLD0IbDBRzoapL+84os8bh/bSu4tuEQ1nN9baYM68SxsM
 WlQAsQXvKBQWReziejtdC/1JaSaE3R6cTuD6GUW/YYsomxpisESW49k3wQf0lYAt8bJM
 z+MdlT9Ho3DGIqOwU7AJG8/Tri3IJq/piu3KOrx6OAGXq2tYj3L3AbvU+I7ALAnEjgAK
 CbfzmibYDJ6dGkFVUHYG7JxrsnCe4Ox88682rATk3JTAxLPrzkDFWdhU58FW6snIdKdg
 eWnw==
X-Gm-Message-State: AOJu0YwOayXmjY2ECo27VIjV0YyLvOzLHoC2WCVZK1uMo76CAVfXhYir
 Cx0it2SfD9k+Q3UOba8DygCGMqTT9eoUGA==
X-Google-Smtp-Source: AGHT+IGakRogLZjAWssqGnL0f0EpuAWiQoMP5dWkzx6jPvFAPrDve3HXtEzEkbVbG3bMAbQM9SmCDA==
X-Received: by 2002:a05:6602:1408:b0:7b7:cd4f:fa2 with SMTP id
 t8-20020a056602140800b007b7cd4f0fa2mr3127747iov.18.1704577912502; 
 Sat, 06 Jan 2024 13:51:52 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:af2f:17f0:33a3:d6fe])
 by smtp.gmail.com with ESMTPSA id
 du4-20020a056638604400b0046dc6ede06dsm1347498jab.5.2024.01.06.13.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 13:51:52 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 1/2] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
Date: Sat,  6 Jan 2024 15:51:44 -0600
Message-ID: <20240106215146.147922-1-aford173@gmail.com>
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
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Add binding for the i.MX8MP HDMI parallel video interface block.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V7:  No Change

V6:  Add s-o-b message for myself (Adam)

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

