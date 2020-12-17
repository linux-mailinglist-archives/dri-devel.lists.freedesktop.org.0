Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3A12DDFBB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6064A89B70;
	Fri, 18 Dec 2020 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978226E40C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 15:01:11 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id z12so3792712pjn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 07:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mvtZ/A2o5dxmBEUAMb5gj2Nsf7pPvcRBvo5uPvFwDHA=;
 b=P5S84wnBWrc+jI977mdnBx8BHjwaLXu+wGQZucy9i+KHvwtgAq3f6PmSQf45pmX9u4
 6tw1v33TxjIdmApm69r1aNbvKfTb3FXd0XI87QmRmpV02qsbFwWZf0ouK1bjIQYGhAND
 q90Uj8kZ8zePACluJZTkaMHlyLrX6YApLih33jpLc9/31+a2kje1lG2LHVFmxLuRcKc2
 pfMrwLhFSGBPCNRf03x+9e3yJjKV5hzH+o/8A/NMQy6gVw3KXPMUVPY0dYzEx99xQoUs
 cpQT6saVYrbtqZHtxcY29gUBJnF8OuFjqEy6dC9rXGuUNEp38tKHx5JBzK2n5ZGGwI5d
 ycCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mvtZ/A2o5dxmBEUAMb5gj2Nsf7pPvcRBvo5uPvFwDHA=;
 b=JKeZRy/QG2bSZcm3E7l2QayA6vU0/Ry0C4rEX8A2juXPujp/klgp8cvetAKintPZ7A
 q3MEAFYPG2QvMY0xJcFvPseCMBBxjxRDTNduub0Y+v+D2dGWig1byGmkiCmQfBSIK3y9
 Ddp50zPRt952M++r4qoKlvv/Gu7MQTw4vkjykhwy1mK5e94s4IUV2XAs2AQ9XLCSehhj
 0YxecFZHyW4168htj+GPLY/Y9K5fKXc/vDq1DTdw4MGjFAbxIpK6bDNZ8DRe05UXnSTq
 aSTw4bgTn5orrTO41mf9EAGlgQ8DTp/+24VbXsiLcP1lCIfOE23EiIQigkvM12ysQ8Z3
 CPJg==
X-Gm-Message-State: AOAM530RcK6tvSLyVQYPPRvemu+TPSyei8hVO5HTKlsuc7RIw8h246lO
 +cxAWFH+QBG6fp+kRyfHyfU=
X-Google-Smtp-Source: ABdhPJxEqwPbhdTjXuC65gja94BfYxBMGCw0JrdDxIOxyieZUWD2PMka+Egar82GTDNdonGuOay/Wg==
X-Received: by 2002:a17:902:d716:b029:dc:24a1:77a2 with SMTP id
 w22-20020a170902d716b02900dc24a177a2mr3917114ply.64.1608217269785; 
 Thu, 17 Dec 2020 07:01:09 -0800 (PST)
Received: from localhost.localdomain (1-171-2-187.dynamic-ip.hinet.net.
 [1.171.2.187])
 by smtp.gmail.com with ESMTPSA id o140sm6189074pfd.26.2020.12.17.07.01.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 07:01:09 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com
Subject: [PATCH v5 4/6] mfd: rt4831: Adds DT binding document for Richtek
 RT4831 core
Date: Thu, 17 Dec 2020 23:00:42 +0800
Message-Id: <1608217244-314-4-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608217244-314-1-git-send-email-u0084500@gmail.com>
References: <1608217244-314-1-git-send-email-u0084500@gmail.com>
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: ChiYuan Huang <cy_huang@richtek.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831 core.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
This patch depends on
 "backlight: rt4831: Adds DT binding document for Richtek RT4831 backlight"
 "regulator: rt4831: Adds DT binding document for Richtek RT4831 DSV regulator"

since v5
- Revert mfd dt-binding to v3 patch.

since v4
- remove v3 regulator binding patch, directly merge it into mfd binding.

since v3
- Move include/dt-bindings/leds/rt4831-backlight.h to patch 0002.
- Add dual license tag in mfd binding document.

since v2
- Add regulator-allow-bypass flag in DSVLCM.
---
 .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml

diff --git a/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml b/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
new file mode 100644
index 00000000..4762eb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/richtek,rt4831.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4831 DSV and Backlight Integrated IC
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  RT4831 is a multifunctional device that can provide power to the LCD display
+  and LCD backlight.
+
+  For Display Bias Voltage DSVP and DSVN, the output range is about 4V to 6.5V.
+  It's sufficient to meet the current LCD power requirement.
+
+  For the LCD backlight, it can provide four channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+  Datasheet is available at
+  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
+
+properties:
+  compatible:
+    const: richtek,rt4831
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  enable-gpios:
+    description: |
+      GPIO to enable/disable the chip. It is optional.
+      Some usage directly tied this pin to follow VIO 1.8V power on sequence.
+    maxItems: 1
+
+  regulators:
+    $ref: ../regulator/richtek,rt4831-regulator.yaml
+
+  backlight:
+    $ref: ../leds/backlight/richtek,rt4831-backlight.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/rt4831-backlight.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rt4831@11 {
+        compatible = "richtek,rt4831";
+        reg = <0x11>;
+
+        regulators {
+          DSVLCM {
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <7150000>;
+            regulator-allow-bypass;
+          };
+          DSVP {
+            regulator-name = "rt4831-dsvp";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6500000>;
+            regulator-boot-on;
+          };
+          DSVN {
+            regulator-name = "rt4831-dsvn";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6500000>;
+            regulator-boot-on;
+          };
+        };
+
+        backlight {
+          compatible = "richtek,rt4831-backlight";
+          default-brightness = <1024>;
+          max-brightness = <2048>;
+          richtek,bled-ovp-sel = /bits/ 8 <RT4831_BLOVPLVL_21V>;
+          richtek,channel-use = /bits/ 8 <RT4831_BLED_ALLCHEN>;
+        };
+      };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
