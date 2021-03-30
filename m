Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCE834E2EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 10:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D12F6E875;
	Tue, 30 Mar 2021 08:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5E96E875
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 08:15:13 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id s11so5570659pfm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 01:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3gDOC0Z8XAHbqFwCKdnmHJhX1d7vqsYcID7spPCLu5I=;
 b=pGCNEDaTrN3AHSTGljZgtNy5UYQtAcSOIdS0yv7w1jopGUUYzsIS6WjcT/JHAd2GOV
 YwV/D9YJNr6dany6dy6hcm1wLekHfBihFXlCdsrdDEXQG6AJ3exPJPPT+SMA4t6yGX4T
 s+fbUUhfsoFRmnMM8jFcYatzrYqEdP3+kAMFjI9vwtLxMYLfKQ0yHzkmcIKGDO54jzSz
 Na7+EujqqnAXCbwkPG2YYjxJ6dzn+d36xycvEGF/St3VleFR1EJlIhW35rFKLbS9gnjN
 gutr+YWB77FVgmpasJyJLu4QIFrfXOmdAEE8Rj89MHzBIjXzpfd9xnj7AgduAtnC/55/
 XQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3gDOC0Z8XAHbqFwCKdnmHJhX1d7vqsYcID7spPCLu5I=;
 b=rw9XPZLqCmpgPovql/7VpW7nFNapHi7JvOnsU14LkmrbCGcl+gNtgZJMuzQRFRU4tx
 DbwEIDJpzzwCwxjCdcceBcG7tmZT3gwXHf5DcjVel3CPADiifKgPWsHFRCc0FPUH5Oo2
 Fxib7y7FIwRiG2f4DGfpUxRD9s2KZ76cSBC9nasUnPLvkuvGv6WJrcjrAXtWxd/YoFBp
 V2YisALiaCuvDRslPuvfkPRDzhYzKq4s88OEUfX+60fVnsAHBhZ4cb8G5HyjxxPwmhTi
 VeAHfnjg82K2/B3YcaKFWjsLcgNRe26y+qzeC/xCOHil+/tQYhr06QuKT+59GiRBgdj6
 M6Gw==
X-Gm-Message-State: AOAM531BDjFtWVXq/l2IMVapucDUDgv3FA868VpOZuA1sTMxRKimd81K
 PVtKP6D5MxTKB5BBpA+7sC4=
X-Google-Smtp-Source: ABdhPJxg6ZAutLMLoP1f0Pv7BdtYsOfweV3TfVh6CMeUI036JsmhfN+aCX8NawWvcWOk66blgOnprg==
X-Received: by 2002:a62:dd8e:0:b029:20a:309:2fcd with SMTP id
 w136-20020a62dd8e0000b029020a03092fcdmr28785940pff.35.1617092112627; 
 Tue, 30 Mar 2021 01:15:12 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id f20sm19496672pfa.10.2021.03.30.01.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 01:15:12 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: david@lechnology.com, zhangxuezhi1@yulong.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Subject: [PATCH v3 1/1] dt-bindings: display: sitronix,
 st7789v-dbi: Add Waveshare 2inch LCD module
Date: Tue, 30 Mar 2021 08:15:05 +0000
Message-Id: <20210330081505.116351-1-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Xuezhi Zhang" <zhangxuezhi1@yulong.com>

Document support for the Waveshare 2inch LCD module display, which is a
240x320 2" TFT display driven by a Sitronix ST7789V TFT Controller.

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
v2:change compatible name.
v3:change auther name.
---
 .../display/sitronix,st7789v-dbi.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml b/Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
new file mode 100644
index 000000000000..6abf82966230
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7789v-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7789V Display Panels Device Tree Bindings
+
+maintainers:
+  - Carlis <zhangxuezhi1@yulong.com>
+
+description:
+  This binding is for display panels using a Sitronix ST7789V
+  controller in SPI mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          Waveshare 2" 240x320 Color TFT LCD
+        items:
+          - enum:
+              - waveshare,ws2inch
+          - const: sitronix,st7789v-dbi
+
+  spi-max-frequency:
+    maximum: 32000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+            compatible = "gpio-backlight";
+            gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
+    };
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0{
+                    compatible = "waveshare,ws2inch", "sitronix,st7789v-dbi";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
+                    rotation = <270>;
+            };
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
