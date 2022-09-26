Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD565EACD7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0664710E29E;
	Mon, 26 Sep 2022 16:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CCB10E719
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 16:43:39 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id c81so8947169oif.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zWjMfUGwN+UyYliLqiF6ZvmjC5LhzbeAt3IvP9nKcyw=;
 b=N2wWdAYa/hEHt753vSWYqeEk/Wt6l5HREj9ic07JDQJAOwTCDEp0p4teWxa8mxhkNa
 G/9GFLPECy73C5qzQOG3jL8a9ht/5nHwHi5m6N+nPtOWZtbtz5cuewPpUssWLugNyejb
 1UyV3bM4VRWGIj4KcOAafxe0MuCktsBOgw9FvlnflRnXwwKmnFPUkUWoJAu3j2qKgrlq
 kOnwUvuqhg/wCXPNBq/HBkvLMrAEt192G04gjYEtZLCPHVzsB9yXaTN0z4JdZYD97G54
 DGZ1A0Ht3Fhe9HUWqKCN03bl6nzn3DDdaVkGpFL+K1TgBaHk9arGpXaLCTObkvqpyX25
 gDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zWjMfUGwN+UyYliLqiF6ZvmjC5LhzbeAt3IvP9nKcyw=;
 b=CYP8k9dXxY7QiYCk63VLoPjYYRhDswrA3ZRLptud+LbnfPd0XJFS9glvFwTUgY/J2e
 AUeePv3RplUnsQxndX83DUFxMSP5MHwPHqejopvpJPNdwpkk+FjoWUuEWQrJ5z2XLE6i
 c1SQvcVlIWmPDWU1puaJ+4lWWzX+njl4MiV0SV8OTO6pIs+SnPfGApUxFV8++u28GoVl
 AAEYSE7UHt087a54p8Z51VggBariAmKknWW5qDIIhf3hvMgjkFlKnqgL4Elh3Zq/OcJ7
 OdQSRlAvadTm7fHNvBojmUKzGKiHbhkv8R0apSo6/bDsi/CW4DPoxtxZl9BVDsASiemr
 quLw==
X-Gm-Message-State: ACrzQf1KIM97VvK+ky/31zuKE/szTMZueLGcga0m0B+S+E5f3bIrT/IZ
 fEqnN7QZr9a2oZ4aFkYY+WeKi5hT56k=
X-Google-Smtp-Source: AMsMyM7dxihtRTuooVdSg4E4AEqE6oc3eYoWSd3CfDMo29yfVtNnS9FjMtIhq3K1p2kNtiQgby2egA==
X-Received: by 2002:aca:6004:0:b0:34f:bab2:e513 with SMTP id
 u4-20020aca6004000000b0034fbab2e513mr14904726oib.63.1664210618677; 
 Mon, 26 Sep 2022 09:43:38 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 o83-20020acaf056000000b0034f684ca159sm7318798oih.29.2022.09.26.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 09:43:38 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 1/2] dt-bindings: display: panel: Add Samsung AMS495QA01
 bindings
Date: Mon, 26 Sep 2022 11:43:32 -0500
Message-Id: <20220926164333.7485-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926164333.7485-1-macroalpha82@gmail.com>
References: <20220926164333.7485-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for the Samsung AMS495QA01 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../display/panel/samsung,ams495qa01.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
new file mode 100644
index 000000000000..d736a536b919
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS495QA01 4.95in 960x544 DSI/SPI panel
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams495qa01
+
+  reg: true
+  reset-gpios: true
+  elvdd-supply:
+    description: regulator that supplies voltage to the panel display
+  enable-gpios: true
+  port: true
+  vdd-supply:
+    description: regulator that supplies voltage to panel logic
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            enable-gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_lcd0_n>;
+
+            port {
+                mipi_in_panel: endpoint {
+                  remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

