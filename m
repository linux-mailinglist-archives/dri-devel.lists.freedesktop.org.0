Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E16528A59
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 18:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FF51121D2;
	Mon, 16 May 2022 16:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9339D10FDBC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 16:29:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l18so29697290ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJB5QWTkjOe+A3TmBJQWslNfP6ImokdCskIDq0K0JSM=;
 b=DnhHqyh6nEcagUBSwSL40ZweMeOpDzDwVizgwFmVcHjJ/CbyNvQe/YL0Q/Sm4VGTef
 snsNOJJGUmDBwBZmNxTZi/yeO28knuXU3t/9CaHyTMjnNfnA+TzcqyFqKjxsB9Y/ucmF
 K10r77Qx0BDVHbx/Qbc2sjxngOV2307zrtQNiPA3dNgys+L3hEaytD7diKMlFZoqZ+gH
 mxnrwG53b5Owa7VQ1Inessh3sUouGHbZEOLGjWEZ+vUC/vH9cRhFpaz4XhdzC+B9FsMz
 4u2kjGEkmvPsnNVLbrePD09DJ2kODMtCttp9GHbTS2BuFJ4fysxycGxi/1+iRChtNXib
 6Hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJB5QWTkjOe+A3TmBJQWslNfP6ImokdCskIDq0K0JSM=;
 b=kVsUitUNRS8XanB1anTr5g1bZUFvpVUbD2Ii8Ok0PzYlE7lY+Iq70sIb7IKSbDGshG
 KLP+wgt/Cua8ahZH1LOU2ymTE9ZoxAoYPNTYirMTNLufguby5Fjuamcm6Q/zbgtmBXyn
 LiRQY2duirVwu1XBZjHeZ/+qNW5mh5iohkx0vAqJPlZeTf2ynSacBoQ1me9053EkK3ws
 rOst3xhxY+r+EcEDnowWV2qXHEawGA7Pm/7ws8Jh4z0BS20RTzcJ0kpqWmYexR8Ci2Wg
 LeeFWg5QzpxmI3bYFsoENEhiKPaiL+IdtxZNcB1vuBNjuaz3+Y6MEn7Ud67y7Q65qHHK
 oL0Q==
X-Gm-Message-State: AOAM532V1tN5cba4ROvqkhg9LpC2CSJ4zSfzA/kuDEqwUEFzlrHD9Kcr
 SVDIr8nMaWiTye7qcDw9BX0=
X-Google-Smtp-Source: ABdhPJyZcntD5axDOHiDmfr5EqB4Uv2Nmp/U52P8mLja7/bBTGWg/cytwgQKXKtLEFZNZBC9ymNpMw==
X-Received: by 2002:a17:907:3e8f:b0:6f4:4f42:a75f with SMTP id
 hs15-20020a1709073e8f00b006f44f42a75fmr16158090ejc.695.1652718549038; 
 Mon, 16 May 2022 09:29:09 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906004900b006f3ef214e3bsm58819ejg.161.2022.05.16.09.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:29:08 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v1 1/2] dt-bindings: display: add new bus-format property for
 panel-dpi
Date: Mon, 16 May 2022 18:28:25 +0200
Message-Id: <20220516162826.23025-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220516162826.23025-1-max.oss.09@gmail.com>
References: <20220516162826.23025-1-max.oss.09@gmail.com>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>

The property is used to set the enum bus_format and infer the bpc
for a panel defined by 'panel-dpi'.
This specifies how the panel is connected to the display interface.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 .../bindings/display/panel/panel-dpi.yaml     | 11 +++++++++
 .../dt-bindings/display/dt-media-bus-format.h | 23 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/dt-bindings/display/dt-media-bus-format.h

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index dae0676b5c6e..ca44e96c3001 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -21,6 +21,14 @@ properties:
       - {}
       - const: panel-dpi
 
+  bus-format:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Describes how the display panel is connected to the display interface.
+      Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
+      The mapping between the color/significance of the panel lines to the
+      parallel data lines are defined in [1].
+      [1] https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
   backlight: true
   enable-gpios: true
   height-mm: true
@@ -39,11 +47,14 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/display/dt-media-bus-format.h>
+    ...
     panel {
         compatible = "startek,startek-kd050c", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
         backlight = <&backlight>;
+        bus-format = "DT_MEDIA_BUS_FMT_RGB888_1X24";
 
         port {
             lcd_in: endpoint {
diff --git a/include/dt-bindings/display/dt-media-bus-format.h b/include/dt-bindings/display/dt-media-bus-format.h
new file mode 100644
index 000000000000..c0f2a7b59aa1
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
+#define DT_MEDIA_BUS_FMT_RGB565_1X16		1
+#define DT_MEDIA_BUS_FMT_RGB666_1X18		2
+#define DT_MEDIA_BUS_FMT_RBG888_1X24		3
+#define DT_MEDIA_BUS_FMT_RGB666_1X24_CPADHI	4
+#define DT_MEDIA_BUS_FMT_BGR888_1X24		5
+#define DT_MEDIA_BUS_FMT_GBR888_1X24		6
+#define DT_MEDIA_BUS_FMT_RGB888_1X24		7
+#define DT_MEDIA_BUS_FMT_RGB888_1X32_PADHI	8
+
+#endif /* __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H */
-- 
2.20.1

