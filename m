Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667B552B93B
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4AF10E298;
	Wed, 18 May 2022 11:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B3D10E2C5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 11:56:16 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c12so2646949eds.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+A/4woOo192qqTkRjLVbL7AmgutNUKDEYrhbPWSEIww=;
 b=hBLSKEJTHtC3+1dEDg7GT1nUV/CKzTUjoKk2zRSn2QL3s+ZYozYyV8Qm9goHinditO
 hOuJoM0D1UmXoosbZsi45uE7L8vFjD02riODsVQs09mvqP/xijtDIExjOi2hvWDPfbF0
 C0lgEvp/VMB1UV9x2xlvSBPZgVQawsjavHsRFlSFZqwzmFPeBJjjJs8x3O31Y4kbgnhy
 T/6xE7Zbob8c3d/tfogiJ/MNGVJnH5V1kZYPGXabj3l/cm2mVU2uObVGVaaZmDwvAKN2
 MPYeqZNtwgNk4+M3jfSZwwfdRrpam+pdcaX26nBeCmqTPJmL7KCU8TvAO03QWxQWW7Us
 Egpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+A/4woOo192qqTkRjLVbL7AmgutNUKDEYrhbPWSEIww=;
 b=4ganEzUJTgLCaztc2J18JuMxJp0GsJMcfXCIzwqPSNbf5dWWnYJUjUSfjKzQTImUI+
 1SsEVVUUb1nhQBDRoRhZhx+ReZVgZPc2LkFzK+rRLU7qBqpzyHkdDIYHqboAyU2+ZpbM
 0FW5b+pIf4ZLEixmlWp9+EObMxzZhJmv9mCveRxy5LNO2xSfZtjWaoDJCjnqgdV/+zmB
 54l9RcaPUiAErS7JDtIV9CJ+kyg1aSejrj0VcUjxS+1eayC422ix/W6Nd/aQ3O+bDM88
 NBAbFVzKVwjyAMmtq/3ReLIrldjbIDYzecjSROSYErSklfAh+gtCX0u++33eBY5BoFXB
 9nxw==
X-Gm-Message-State: AOAM533uKlLsC/jCVX7AnJoy7V6K9RSVyupJbpmQEgTEogTokcL05gMo
 4KQOlSzw6XApZZzOUDuZ2so=
X-Google-Smtp-Source: ABdhPJw7EAfh/9Ch9Mnt9pi5tInayRrDWvKmcdnqjM7XPkDEyaDSMw1+dTgaaqvWbhBX7BcIeMNEaA==
X-Received: by 2002:a05:6402:5108:b0:427:e323:4c67 with SMTP id
 m8-20020a056402510800b00427e3234c67mr23894739edd.326.1652874974666; 
 Wed, 18 May 2022 04:56:14 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 dq20-20020a170907735400b006f5294986besm873999ejc.111.2022.05.18.04.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 04:56:14 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v2 1/3] dt-bindings: display: add new bus-format property for
 panel-dpi
Date: Wed, 18 May 2022 13:55:38 +0200
Message-Id: <20220518115541.38407-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220518115541.38407-1-max.oss.09@gmail.com>
References: <20220518115541.38407-1-max.oss.09@gmail.com>
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
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
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

Changes in v2:
    - Fix errors found by dt_binding_check

 .../bindings/display/panel/panel-dpi.yaml     | 11 +++++++++
 .../dt-bindings/display/dt-media-bus-format.h | 23 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/dt-bindings/display/dt-media-bus-format.h

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index dae0676b5c6e..a20b5898941e 100644
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
+
     panel {
         compatible = "startek,startek-kd050c", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
         backlight = <&backlight>;
+        bus-format = <DT_MEDIA_BUS_FMT_RGB888_1X24>;
 
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

