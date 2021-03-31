Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91234F730
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 05:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D659C6E9D8;
	Wed, 31 Mar 2021 03:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31476E9D8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:06:38 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id c17so13532614pfn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PuKYh+7/SwWSPDSj+RYvOzQGYT9KgG+npGBidcALI1g=;
 b=XiALZjoTAsRF7SAeMMjlGFO8GhBInfT4x9TKG1O8oDyv4Cdre3FinqAs6Oee+/rPHj
 yfaB9/rCPTBxLeXchHnFUuPISOkVNQN7QTOnofxsPr2o7WlpwObTDL/7qFAZblFfc5bb
 b2tjTes9GmLB53p+ocMYZSfYgnap2HAXZbcFGXE5hYzZatgmwUB1IIDkYv3ZZ0NqDFWw
 8b1Hx5jM4b7bkP7wJbmAGBqMbLJJWVzMZbWHXzjWiFVWRlo0PWBY7DGa8x18hA201YLC
 FxsW6VUEDmZcvIcEyHxBtbo/Ui5b9UvbYvMGJnypaEEKvv/YHENUelrNCKF1NA0ZARCn
 r2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PuKYh+7/SwWSPDSj+RYvOzQGYT9KgG+npGBidcALI1g=;
 b=B89fYYaJ7BIOoHhbLqzQEejdGCPBgr/dGTX8IwwX6V/jmtQs6qdc139lo1inkb5IoZ
 VMX1xzOgHieETUcIq0YF6QkVxQiUv/adzez7rEfOBaFP/Qny6MXkPjsrEbDBeQ0vWrWS
 ADWFhakLIEWDMWCw7p4OqAMK0mNhryx+NyKdF7DZIUUABv5iF5nGm8lcBhFF0d173p1a
 LK0m3imZT9qGa+K4NIjHF5XFDAtXAcRiyb6jdy8k/hVX+/NhdZP5mLKYezpIanytm4Pe
 OQmhdlGr/PF3N+Z9uIWaH7L+8IXG9dWjffSmmEzeK4bDd608WkS+EVA00xUhjvGbhX0S
 Tpng==
X-Gm-Message-State: AOAM532mutRvezumEU48V0hInBa74VrCP1cWvbLvfcjXKMoyZq5BhMiv
 IEJLbrcRaGV/+cM+UupUjkE=
X-Google-Smtp-Source: ABdhPJzQYTt2Way0sS/KW989AK9p50mQqMVE4ZaUwaIuW7ErKJSZl02r21d7UXdbl4LVyBrSaiiFGQ==
X-Received: by 2002:a63:5805:: with SMTP id m5mr1142689pgb.370.1617159998273; 
 Tue, 30 Mar 2021 20:06:38 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id k21sm375376pfi.28.2021.03.30.20.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 20:06:37 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, zhangxuezhi1@yulong.com,
 robh+dt@kernel.org
Subject: [PATCH v4 2/2] dt-bindings: display: sitronix,
 st7789v-dbi: Add Waveshare 2inch LCD module
Date: Wed, 31 Mar 2021 03:05:50 +0000
Message-Id: <20210331030550.119493-3-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331030550.119493-1-zhangxuezhi3@gmail.com>
References: <20210331030550.119493-1-zhangxuezhi3@gmail.com>
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
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tzimmermann@suse.de,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Document support for the Waveshare 2inch LCD module display, which is a
240x320 2" TFT display driven by a Sitronix ST7789V TFT Controller.

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
v2:change compatible value.
v3:change author name.
v4:delete a maintainer.
---
 .../display/sitronix,st7789v-dbi.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml b/Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
new file mode 100644
index 000000000000..79eb8f3fc25d
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
+  - Xuezhi Zhang <zhangxuezhi1@yulong.com>
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
