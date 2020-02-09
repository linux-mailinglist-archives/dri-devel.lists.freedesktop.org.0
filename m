Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F9A157153
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6EB6EB8B;
	Mon, 10 Feb 2020 08:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC936E854
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 18:06:33 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u131so2605956pgc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2020 10:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JZlAL4NuWzFvfP/W/48KSozeEPDNM5gniNDWfhy9y5g=;
 b=s2Qss8dPdOLCCEfMPKu6Xcbd6DM3n67ZPOshUeQVx7Cev1cS8jTx9olmbHQDSnYu+l
 eHolgl/MgC2HWZor6nBWReFb3QkLfQqODI7Z5BUpD27KS655bK2AdPYcss5FljdhEn/d
 0/jiMQsXT+RYQdmy142UJNyxwHGzDF8hsKUCvQjVR+eWPic9ZSipOkF3jyCt2ddy93uM
 4qSSFe/dEtkXBSeYSMC497rwxe9P1BNYSWbgTwl3QsIf0RaKtPOu7wt0j0HT9dYpFhjR
 z3P2ZOb7IshhaJP1tFFELinKdSaEjHTwoW4XPIkpKdTh0utRr9dsl/4wfMYM/DQ3n7QD
 G2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JZlAL4NuWzFvfP/W/48KSozeEPDNM5gniNDWfhy9y5g=;
 b=LTtl6NlYM4swokqClyO0j80VXnOH89F+NJwM7KrOnAAlh6qpqjuQ2zvcDtG+3kRWiM
 UbszRznC/jOI5W7C9sq2Cz/rq9IiPkswDKib/Z1zM0HrNaIanahrNS0JMDr+C2/GuaM/
 0HD6a60T1ggXnaRJxHdtB4k2PaSqbbCla+8gfs2yBgdqAKnV2ySyGJiJSe/T4OTK2LPL
 YjyD1YfpdOkbVZYCMM3zRFGWHu8HI+QL/GvD8OFYHlKS9kWDRlancrI/2kxePdddeyzK
 qMaMRYvK45nKFl9H3ssDVmpC9+5hm3tvUATWweYeP9aNNE+tMOu3tUvRzoSvUAJ9pVGs
 xlTg==
X-Gm-Message-State: APjAAAUHOupCohCqSkYWMUEfxXlne5JRdaJ1Ll+z3bmBo8bP0Me45iBA
 S9CeGKrKGQrhvWU6A7YBMAM=
X-Google-Smtp-Source: APXvYqx+6H4wFOF17krW/I9xmVFN3KeVeN4skXjNQPbOkSDavEyC0oNINkk2bbEjkpcfnCbhNmwVWg==
X-Received: by 2002:aa7:95b0:: with SMTP id a16mr8883719pfk.253.1581271592875; 
 Sun, 09 Feb 2020 10:06:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:508e:1313:1d5a:1ea5])
 by smtp.gmail.com with ESMTPSA id d73sm9758518pfd.109.2020.02.09.10.06.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 09 Feb 2020 10:06:32 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Noralf Tronnes <noralf@tronnes.org>
Subject: [PATCH v5 1/2] dt-bindings: add binding for tft displays based on
 ilitek, ili9486
Date: Sun,  9 Feb 2020 23:36:26 +0530
Message-Id: <8938c7a53598db793bbcddf205dcf35bcc19a18e.1581270802.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
References: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This binding is for the tft displays based on ilitek,ili9486.
ozzmaker,piscreen and waveshare,rpi-lcd-35 are such displays

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---

v2 changes:
* Changing file from txt to yaml format
* removed ilitek,ili9486 from compatible string

v3 changes:
* no changes

v4 changes:
* no changes

v5 changes:
* made changes according to Sam Ravnborg's comment
  for making compatible part less complex
---
 .../bindings/display/ilitek,ili9486.yaml           | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
new file mode 100644
index 0000000..66e93e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ilitek,ili9486.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9486 display panels device tree bindings
+
+maintainers:
+  - Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+
+description:
+  This binding is for display panels using an Ilitek ILI9486 controller in SPI
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # Waveshare 3.5" 320x480 Color TFT LCD
+        - waveshare,rpi-lcd-35
+          # Ozzmaker 3.5" 320x480 Color TFT LCD
+        - ozzmaker,piscreen
+      - const: ilitek,ili9486
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
+            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+
+            display@0{
+                    compatible = "waveshare,rpi-lcd-35", "ilitek,ili9486";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+                    rotation = <180>;
+                    backlight = <&backlight>;
+            };
+    };
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
