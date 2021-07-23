Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD23D3372
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 06:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061EE6FA36;
	Fri, 23 Jul 2021 04:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72486FA35
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:06:53 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so2096674pjh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B7rhomLLzwRgFfNNTM797mpLG3BiqS6x3e33hEPmJTQ=;
 b=SGgCTbvwYG1v+5tp6r3T4PLgjP/4PBx3FlYRSZedUbj8Q7Kly0YN2p2Q9sGasqkcP9
 zniQ+1QPUF/TaPtGoLFABC3ATUvZgbHOnbpFMc8DQQA6mijc9N8YXLNOo3bShwinLK2L
 mRCXD+rwSUYOescplYpusojv62U32AmIZNUWpSVEjoJxxKbIRdDCmyOLco577IjYeAeR
 HzseF5PMoRs2RJS33HBAft8nYJrTMnN6lUZ8YgkzvjOqwhaEgt4YUdtFroZ71fy/GQ2p
 Z71CdFvti5fjEzCU/KSQ9iT7fMlXcXipr4BQxQ5MY+0r4Gp06cZard3Ft6MBSKGvllsX
 mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B7rhomLLzwRgFfNNTM797mpLG3BiqS6x3e33hEPmJTQ=;
 b=P8LxSyvU0qCmoPuJDjbbhxEvpyPM29Mhy1pZjaks0BsanLD5JOMmKnHU7DB/utw3ut
 RPde4f4v9kfLz7d+VLXzk4cJkrysjLJLI9Mj2YKFAjbIlO2zJ0xwDVLiALjxLiTDniTH
 niL3Oi/k0I/4uPI2/udwBjB//F4UYLnnyLnDOfsOAAQikhAyqpsBi1E0QdOb9IYKLk8D
 3sIa1qc084U3bTJyY6hK5VIT+Ks5RYlK589KA/Gq9u/9cGSVegPh/0CNJ7gUYiqSmJ1r
 kju7iAU9VH7NKZpDOVSAfrQaDxmE8+QLl95d4Mneyq+jfQq+uWDSSCZ7sRAXRe6aix7m
 waJw==
X-Gm-Message-State: AOAM532nY6rIvemceNdzSSMmTk3ngW9qolwNAblhX2YXEdnAkkcFWCxf
 h1gOlitpwjcSh4uKc5xxjvY=
X-Google-Smtp-Source: ABdhPJykvEEecxAO8ZNgVcwsI6ew9t6mtT9/SC/ITDuPpUox4KucwUVfybx2mBKvkZiM9vXgiLdpFw==
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr2633175pfz.58.1627013213589; 
 Thu, 22 Jul 2021 21:06:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id p3sm35474910pgi.20.2021.07.22.21.06.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jul 2021 21:06:53 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
Subject: [PATCH v3 1/3] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Fri, 23 Jul 2021 12:06:41 +0800
Message-Id: <1627013203-23099-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
References: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/lkml/1626853288-31223-2-git-send-email-dillon.minfei@gmail.com/
---
v3:
- collect reviewed-by tags from linus.
- add link address.

 .../bindings/display/panel/ilitek,ili9341.yaml     | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 000000000000..2ed010f91e2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek-9341 Display Panel
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+description: |
+  Ilitek ILI9341 TFT panel driver with SPI control bus
+  This is a driver for 320x240 TFT panels, accepting a rgb input
+  streams with 16 bits or 18 bits.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # ili9341 240*320 Color on stm32f429-disco board
+        - st,sf-tc240t-9370-t
+      - const: ilitek,ili9341
+
+  reg: true
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX) of this DBI panel
+
+  spi-3wire: true
+
+  spi-max-frequency:
+    const: 10000000
+
+  port: true
+
+  vci-supply:
+    description: Analog voltage supply (2.5 .. 3.3V)
+
+  vddi-supply:
+    description: Voltage supply for interface logic (1.65 .. 3.3 V)
+
+  vddi-led-supply:
+    description: Voltage supply for the LED driver (1.65 .. 3.3 V)
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - port
+
+examples:
+  - |+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: display@0 {
+                 compatible = "st,sf-tc240t-9370-t",
+                              "ilitek,ili9341";
+                 reg = <0>;
+                 spi-3wire;
+                 spi-max-frequency = <10000000>;
+                 dc-gpios = <&gpiod 13 0>;
+                 port {
+                         panel_in: endpoint {
+                           remote-endpoint = <&display_out>;
+                      };
+                 };
+             };
+        };
+...
+
-- 
2.7.4

