Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B433882C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 10:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CB36F4E5;
	Fri, 12 Mar 2021 09:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD416F4E5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 09:02:51 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y13so1423525pfr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coMaeMgwYndIuacusZtcjMM2Bpuh2O6iPW8BYwVPuYo=;
 b=gkCeYdJatw7igkk2aK8sIdyamQHpJJDqCfzeFQbDf2QdM6wEdjoo3pgGPBZ/VQ2rCK
 5SXbqGtipGvPHi7eSevO2BMl9O8STKUwEqQksCiVlkBPe3y5A2Vkgir07rqUZq2KbQo/
 5rOEml9oq0vLcQMl4/cgDmF5U9lZoy+409Y/sZdkvhV6R6fT+dQ1/HEtqoIX/zYYmKyu
 yA2EvkrQb/M2NwXdzUsuYD3RE/mOzFUgS5U6iMbiecWzFayXXxE5EvbWAc2cNb7hHVh5
 hnKLgqE3iK7VF1IAQjQZGlGqIi37jVpISjW7zrnS9twtYhIq0hAuA5ZK2bIOOaxFnLZM
 fm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coMaeMgwYndIuacusZtcjMM2Bpuh2O6iPW8BYwVPuYo=;
 b=j9NOL6gtnEYLynjWoLLG2dbGWbj4cTHSkea65sh05sA0ZWAg2zlTvuUSEkNP/vYsG2
 EY3qWxG1CP4tDjy3OHpCkRXZI14tzq+cw/Xa3mdqAx8+BaBjU986o95iYOkYKzor2gnb
 NOKaW6LbhDDjbE2TbL0olx8enmDeKtjUmcoj69l8TLWBnWoNR6p1W7outLjATbwj8El2
 tpTIwjk4nKuqE+sn/6xNWbyk3gEpfvAMhX3LvWbs/1zpFW+HnHG+AmRnCXMGzy4Vmy9M
 6CpGd6jNAa7gcr0D0xi4PrprBwctUX3Tdt3nMWV5x3lqEqiojA3rcJyXRB+eiLOJzH8g
 O2sg==
X-Gm-Message-State: AOAM532SI05H1Rp1Rt6j7Bo0FJdPiH4Vz+uGwfQVI3VuEB2kh5ErjaO6
 4Razkp7Yzo31AEPeKGtMuKs=
X-Google-Smtp-Source: ABdhPJyVYSOxPTEHpvK9d/fG0S60rVOswnNg32MxML3ktLFfobsQHWxlfkCrCf5DOFYv6b5lAG2IQw==
X-Received: by 2002:a65:5c42:: with SMTP id v2mr11042664pgr.339.1615539767596; 
 Fri, 12 Mar 2021 01:02:47 -0800 (PST)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id e24sm4862903pgl.81.2021.03.12.01.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:02:47 -0800 (PST)
From: Carlis <zhangxuezhi3@gmail.com>
To: zhangxuezhi1@yulong.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org
Subject: [PATCH v2] dt-bindings: display: sitronix,
 st7789v-dbi: Add Waveshare 2inch LCD module
Date: Fri, 12 Mar 2021 09:02:41 +0000
Message-Id: <20210312090241.98359-1-zhangxuezhi3@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Carlis" <zhangxuezhi1@yulong.com>

Document support for the Waveshare 2inch LCD module display, which is a
240x320 2" TFT display driven by a Sitronix ST7789V TFT Controller.

Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
---
v2:change compatible name.
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
