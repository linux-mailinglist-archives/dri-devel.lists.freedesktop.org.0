Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F1D82619F
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 22:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530A210E0D6;
	Sat,  6 Jan 2024 21:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F3D10E0D6
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 21:09:23 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7b7fdde8b26so36136939f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 13:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704575362; x=1705180162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MpqArUruxHthfiLtOjcLaZ/Ap5x71s3jiZYTNE9aCKM=;
 b=C6RKAwAlJwUl1O55K9ZDzvNu5TBuTeGYYumjfb+uPwHC9FvDNeMN6DT/CxrX7cCy4d
 zJjpxtpF+e60zMYrbzUErggNfpG0nSHdvCRG+wnNcQZ9f83FAgxWBzY1Ue7H5vvyNuVh
 o+a12WqtklwU4RwED7Pyyctr70LxSm/QPS27EhxwXklfjLE+17eLyCVpSzmTTB3uaPdO
 CpVkDj46UEwH1yKFJZAKmTvMYPdq+KbAt1z5rGILS9ZlGWjPUYeuUTyKHHlYFo8tpk1g
 XIPv8ywZrD5QeXeXiDWUY5XIy1oNEfJBHoJ6K9ArUXIDKAvFk6z0G8OeVHHwLYiRlTmK
 +BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704575362; x=1705180162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MpqArUruxHthfiLtOjcLaZ/Ap5x71s3jiZYTNE9aCKM=;
 b=SP0hvKrI1X8eC6C+rRe33PeV5lbIRdddjbLecan8x/eo10rmMSibqNoyw0tPDpaYFF
 hklJMuTw2r1B2p1Gsb2IPI7TdhA7tM7JAsz/fYONu5yDHw1sylIqfku/23b8WA+iQBwu
 je3eWQ5jOhL7HeKccC34hwLkNr7CM35o73d1BKqsbrPjCsQ42+ZXjWMpINYS8wuo07O7
 Y4TsTBD38e9RuOoV2XtL97ydS/c0L+f9T2yh+Rcp0GT+Z8CjSuGoEuXPadnwxzDjRAm9
 a09v+hwBodmKz+Y4fBkKC9jd60QRQxnX8/7WmQ+Sm1ygB/iTIPAM9De4A3ECueEoCAyo
 DtFw==
X-Gm-Message-State: AOJu0YxX/rpoK5uAOTH7yxELbQUyBaoTo1tO1il8FohzxvvxgKGwkoYb
 FDfoamZpiHoG2ZBxK9DQn8B6WKzs2VSUkA==
X-Google-Smtp-Source: AGHT+IFb4btxWMK6n5kZJTsVDWdazUiCBKAMxLkzc886XWvkwtjRyFou5s5BpAAgdwWzzUJhFIL5Og==
X-Received: by 2002:a6b:7404:0:b0:7bb:af7d:6264 with SMTP id
 s4-20020a6b7404000000b007bbaf7d6264mr1730720iog.28.1704575361907; 
 Sat, 06 Jan 2024 13:09:21 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:af2f:17f0:33a3:d6fe])
 by smtp.gmail.com with ESMTPSA id
 d101-20020a0285ee000000b0046d2e9a04a9sm1312615jai.135.2024.01.06.13.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 13:09:21 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 1/2] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
Date: Sat,  6 Jan 2024 15:09:13 -0600
Message-ID: <20240106210915.5135-1-aford173@gmail.com>
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
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
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

