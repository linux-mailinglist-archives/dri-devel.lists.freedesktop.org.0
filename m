Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21479333FEE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 15:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A7B6EA1D;
	Wed, 10 Mar 2021 14:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8A46EA1D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 14:08:26 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y13so8674719pfr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tBolFQ1x2rNRaMhk8uUnuZteScWBmrRscFwYnmlVlLM=;
 b=NC67tWn9Zz+V51f/hWtxsUzbDZ4INedGgotRy1QUl6bRbLuEKwy+fEXP0i07mTYM+K
 Vresn4aZqR2Deuh1QUuIBzSBn+llkgG56uOUosGun0aj77dq0+ue3yaMs9/PBvHKs2w8
 Lo1meQrZFrBQSy+JXtBLxQNNqWFwpjfTQyzR76gUHV+CsRG/dvTmlpdYxQsHgAts0dLg
 nbEDHLOQTunUlV38YsZdO9OD9nBYYqQT6TAMM/G7ULdqmflr8jEVbXrV53aLkUCdvlDF
 MrLKRzPQSYcfh6jzDVp62EejkO+MlG2F0+jbfD60KSIK6scv0V/rjP1Oz/MpNmK6vAvw
 YrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tBolFQ1x2rNRaMhk8uUnuZteScWBmrRscFwYnmlVlLM=;
 b=gwKrYbnbxtFBG275ROn2QfbSXx1mq7X2xJM3azMma9fVdCog1STOSPSz6qGS3RKadH
 8zA4TytkSur01IjfZAT2jFOOf9HizVLnoKtnpe1892XTjhftSyvZaKasNbQVNqBPOLSR
 ltToo7+mR4U5ShydOm/uVI5FaiLNo6TkW82wwfc/cabRdC/QT10z8p60i4zWI2AAlL11
 +4+8mlbM+dGs+0b7Fup1iBAnS8h18k/2EKtZwKySbjNFAQ/gaIhJWYDRhcvV2XHl6q3y
 DQJmU/3s1IfhR1NqHmToqx4Pk3+gwnFE2dw6IqKVSZhfbSQEqCkQs3vRtjM9IsHOIKW9
 YObA==
X-Gm-Message-State: AOAM530nBRwxSj8DUrL9zqtjFB9/VduzeqOzOX/Kb/uknT94iLbd8ktP
 yOd/33+OOR5vt1VlWec4Z4k=
X-Google-Smtp-Source: ABdhPJynonVj9YRFbVmgszHf+Qi3NNAnFYN3UzFg5ezxSROchVMTZ7qZNJi9sYU+kdrAQWLGAhNALQ==
X-Received: by 2002:aa7:850a:0:b029:1fc:ccaf:5d5c with SMTP id
 v10-20020aa7850a0000b02901fcccaf5d5cmr3025497pfn.80.1615385306290; 
 Wed, 10 Mar 2021 06:08:26 -0800 (PST)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id s76sm16413671pfc.110.2021.03.10.06.08.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:08:25 -0800 (PST)
From: Carlis <zhangxuezhi3@gmail.com>
To: zhangxuezhi1@yulong.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org
Subject: [PATCH] dt-bindings: display: sitronix,
 st7789v: Add Waveshare 2inch LCD module
Date: Wed, 10 Mar 2021 22:08:35 +0800
Message-Id: <1615385315-130920-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Carlis" <zhangxuezhi1@yulong.com>

Document support for the Waveshare 2inch LCD module display, which is a
240x320 2" TFT display driven by a Sitronix ST7789V TFT Controller.

Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
---
 .../bindings/display/sitronix,st7789v.yaml         | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7789v.yaml

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/sitronix,st7789v.yaml
new file mode 100644
index 0000000..8a0f21a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7789v.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7789v.yaml#
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
+              - waveshare,ws-2inch-lcd
+          - const: sitronix,st7789v
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
+                    compatible = "waveshare,ws-2inch-lcd", "sitronix,st7789v";
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
