Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B882955EC61
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9ED1121B5;
	Tue, 28 Jun 2022 18:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CE611250F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 18:19:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ay16so27496925ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDzRSgTFisXj4PhtHzenD5g/xgSjfVV7DuADmvvCFi4=;
 b=KjOrEhBWvtHjEyKbpXF7eQD4bLkJuwue0iuwTZJTw5hNgkEN3O8cqoFiHp+R0M4qIB
 hUKCXk0gVivWEe2CV525KldBaU74ez+Dftnz1LAn5nhEow3JsRXIdzxrqcsG+/1jXMW8
 i2YDIRSMtjoPBIC3qlsemd6lYJI7q1vRHBTMjqO1HccKPG1yEp8xyOplZzUU2xqDgOd4
 FNh4mBA2WnIZOjMUJaVeCeMM9FZ1SZbgCdcWGENLoAUz1txjfIU5v3MyVZE1d8piLRHw
 2zxvdhlNcPxImU9pyVOt4je3tu4t9JZmwhXA8BH20N1AURbZRn6cRp5jrLk/uRA2pBL9
 Htug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDzRSgTFisXj4PhtHzenD5g/xgSjfVV7DuADmvvCFi4=;
 b=he9oierOnB0xEQ2XosnwX2QbvDsoKObG/SoRX5yjvqLHlnOmNg5Uro/9MetSH0R0RQ
 o5Se+IQNF0XhbaH+nQsogVsEjNKSKhcMWkjnvjlXwC5qT937UvXVu//+2iqIuxKyBesC
 28JYlw4056hxA3wkB+LXiAVcR/bUbgZeT5pGXcbComSuOXqQHMz3WYQPJ2Us0h+6IkfQ
 QqgCFK867GAW0ghFfLUk3HCc/FP9yYgHjdjxacJt1Pf04gbB2UQEMeP1HVxij0Q9G6Tp
 hbjQaIUM4uMxfAg7pDGeCZetwavdvCwVvHzpAvUlAhAxBoPGsyBCSpHVer2VwGf9UUg7
 nEjA==
X-Gm-Message-State: AJIora91LjfQDW+r38pNdGrXoKW4fzNBbPtIMXysgQgRWKJUm5PyJmvG
 2ZOYzlLdKd4/0UeezAA+bho=
X-Google-Smtp-Source: AGRyM1vBJjG4uIergMlENJ7RYpKM+QuPhC2nbICQYgDNlFIIXLBRz8dC3CqcVT568BW5XQ2Qui0HdQ==
X-Received: by 2002:a17:907:60c8:b0:726:d5c1:385c with SMTP id
 hv8-20020a17090760c800b00726d5c1385cmr3812511ejc.490.1656440361725; 
 Tue, 28 Jun 2022 11:19:21 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090638c100b007219c20dcd8sm6730824ejd.196.2022.06.28.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:19:21 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v3 2/4] dt-bindings: display: add new bus-format property for
 panel-dpi
Date: Tue, 28 Jun 2022 20:18:36 +0200
Message-Id: <20220628181838.2031-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220628181838.2031-1-max.oss.09@gmail.com>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>

The property is used to set the enum bus_format and infer the bpc
for a panel defined by 'panel-dpi'.
This specifies how the panel is connected to the display interface.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

Changes in v3:
- Changed the V4L number space as suggested by Rob Herring
- Set constraints for bus-format as suggested by Rob Herring, used
  the range reserved for RGB formats.
- Editorial changes as suggested by Rob Herring
- Moved the bus-format property under the port/endpoint node as
  suggested by Rob Herring

Changes in v2:
- Fix errors found by dt_binding_check

 .../bindings/display/panel/panel-dpi.yaml     | 26 ++++++++++++++++++-
 .../dt-bindings/display/dt-media-bus-format.h | 23 ++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/display/dt-media-bus-format.h

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index dae0676b5c6e..52f5db03b6a8 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -26,7 +26,28 @@ properties:
   height-mm: true
   label: true
   panel-timing: true
-  port: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description:
+      Input port node, receives the panel data.
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+
+        properties:
+          bus-format:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0x1001
+            maximum: 0x1fff
+            description: |
+              Describes how the display panel is connected to the display interface.
+              Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
+              The mapping between the color/significance of the panel lines to the
+              parallel data lines are defined in:
+              https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
+
   power-supply: true
   reset-gpios: true
   width-mm: true
@@ -39,6 +60,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/display/dt-media-bus-format.h>
+
     panel {
         compatible = "startek,startek-kd050c", "panel-dpi";
         label = "osddisplay";
@@ -47,6 +70,7 @@ examples:
 
         port {
             lcd_in: endpoint {
+                bus-format = <DT_MEDIA_BUS_FMT_RGB888_1X24>;
                 remote-endpoint = <&dpi_out>;
             };
         };
diff --git a/include/dt-bindings/display/dt-media-bus-format.h b/include/dt-bindings/display/dt-media-bus-format.h
new file mode 100644
index 000000000000..a032d9724ed4
--- /dev/null
+++ b/include/dt-bindings/display/dt-media-bus-format.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2022 Max Krummenacher <max.krummenacher@toradex.com>
+ */
+
+#ifndef __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H
+#define __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H
+
+/*
+ * Attention: Keep these macro names in sync with
+ * include/uapi/linux/media-bus-format.h
+ */
+
+#define DT_MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define DT_MEDIA_BUS_FMT_RGB666_1X18		0x1009
+#define DT_MEDIA_BUS_FMT_RBG888_1X24		0x100e
+#define DT_MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
+#define DT_MEDIA_BUS_FMT_BGR888_1X24		0x1013
+#define DT_MEDIA_BUS_FMT_GBR888_1X24		0x1014
+#define DT_MEDIA_BUS_FMT_RGB888_1X24		0x100a
+#define DT_MEDIA_BUS_FMT_RGB888_1X32_PADHI	0x100f
+
+#endif /* __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H */
-- 
2.20.1

