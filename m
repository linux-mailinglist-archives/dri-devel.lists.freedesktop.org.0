Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C39149FA4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988C06EA2F;
	Mon, 27 Jan 2020 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059956E9E1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 17:42:07 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x8so3966830pgk.8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YPWYwna9eUbJMVMEpMCCjX5fN6IHGD9XprcoNOSgUZ4=;
 b=rSeI57+fh6+YKWWu4S4mwVmL/PyzqD9YxpxFufTegZiVV6b2N4tJ37CU+S2HtzsGaE
 eN4q2u5w3KoVJTCbppwyGJfpA8mfnM20esqzAGo1R0kU4Np2Xb9BHyy7ECSQOBF2blN3
 xMTh7O3EARDADsZLDNevE55wXoQlZFbylJyITUq5JL9sAApnOi1Rtl7LQSs/p4z05LKl
 onZ3pMqS251aDODkdNDCCDg9DoFV25dQYdv5hfy1Ctn0rGHAY14k0nINoBgeTn1ERgI3
 q7k215jP3/F/jNg4JEtaj+W5Pt1fSvTZXvezRcNfAHCRognNuazUtA2EqQ4D3M7K63+N
 rC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YPWYwna9eUbJMVMEpMCCjX5fN6IHGD9XprcoNOSgUZ4=;
 b=B+94Fb8MY8/NUA15yAmm4L93euQ4pOFS/xtwsioycm9R2qSDBmjGOkIjryTvqPZxV3
 6W/eaJLeoFcXOXxfO/ELP+h20kmHH1dFJZiVAid9GjQ35Gt83Z3E6r7JqsIKdXL66NsL
 D0i//Tvl4AWpgWdJo2OLzREKjHqku4fx9r0rW0QGezxG9MeBIVgjpPHBdoQ4P781un0E
 yhg3LPPCkI7R0kO/n78s01AoUBCxJjWpzP0vyKZ62AjgXN95V0EuPXAxVrhAwMBk5CeZ
 wVmEVn060iSkJofUEchWOY62TCqtm+v7pb1Gk5EXMcSLecM9I8JMrFkVB50gnWSmA4UD
 VWAQ==
X-Gm-Message-State: APjAAAUlCqygx8YkazeYL+Et55MB5zPYPGV7vnt9pFakloD3yyXG0eLk
 gRwQcy8LN8AZf0ziZ0wIgKI=
X-Google-Smtp-Source: APXvYqw5d4OEoiM9lGZLj95d3o5Xh0UTT99Y0RLfrQ2myysqvEKd9EWSpIssA0CRNMwafgeieiXc9Q==
X-Received: by 2002:aa7:9633:: with SMTP id r19mr13119376pfg.90.1580060526569; 
 Sun, 26 Jan 2020 09:42:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 k10sm12388501pjq.14.2020.01.26.09.42.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 26 Jan 2020 09:42:06 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/2] dt-bindings: add binding for tft displays based on
 ilitek, ili9486
Date: Sun, 26 Jan 2020 23:12:00 +0530
Message-Id: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580059987.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
---
 .../bindings/display/ilitek,ili9486.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
new file mode 100644
index 0000000..dd306c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
@@ -0,0 +1,79 @@
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
+    oneOf:
+      - description:
+          Waveshare 3.5" 320x480 Color TFT LCD
+        items:
+          - enum:
+              - waveshare,rpi-lcd-35
+          - const: ilitek,ili9486
+      - description:
+          Ozzmaker 3.5" 320x480 Color TFT LCD
+        items:
+          - enum:
+              - ozzmaker,piscreen
+          - const: ilitek,ili9486
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
+                    compatible = "waveshare,rpi-lcd-35";
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
