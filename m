Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682D14B0FB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA746ED1D;
	Tue, 28 Jan 2020 08:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CCF6EBB6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 14:08:23 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x185so4969913pfc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 06:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u78xsBHoRWmrBCkJd5Sg0uInyXB7ez3BBaQ+xCkEex4=;
 b=hvjWptts/TWwtVwrXU2IdLwGu43HKriIlwL3VcsmBLdEyDdbY7TrHWfLUZlyifrs0l
 +6+/c03EQV4t14dbzu6boCbZ3O0zk1cuY/11IEx0MaFHI0islyQtINLgZZEvvUmyHMAm
 Pk9fNYuWiIX+JMYcSQuGsv//hyGu8CtZX5Wa0k1ZF0SA42xZ49KDWHqfHF/fOpNn+5g9
 ghrzhkORjX7KbT7WdUQN7Bf6edkWX2U28ZcJ8cvosO4mL8aU/iJvvM7jDGXtADg2Hqbc
 D+9DWxl/9lOdpd7Lm10hap0SAWbAbyWSAm1jkCLTT/Gc936G+NckYNTOoIRoXHzHWh+E
 5UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u78xsBHoRWmrBCkJd5Sg0uInyXB7ez3BBaQ+xCkEex4=;
 b=QSZrjb0qv8KLLtpFOtoaUpwsv9S+l6e7ellaEMtCtlWbKEB0tdFl7P0VkJVoDLtsxF
 QXX31hV9ee9QEcsqb0ONriuEHcA0z6RhYuBkeU7x/cmmVVQ/Mvq4jQbqhJHSoYuZrgP9
 vEF2fsHD7AKxUtRZXpLM6TbyZVX/qgYqE0sXLcod7dic01mrSWJZ4viNr8ut7TQNZHUT
 X6oaY6GJwoLSf8tvWgjHSdWS0MaC6VVbD+HMTeWb9XSc2gLw0bl5O5Y3wpAs1ip9TT+B
 KtqLOkApWPedP9hjfEs+iF9y0s4icx3SCv6WL3445Nb3CuuglC+0zDnBVZVZ+awx5uYM
 rVHA==
X-Gm-Message-State: APjAAAVqog3X84qsTuX1eTOUdcwujsBtAULkzVx0sK9TZAHSvFd9i7sL
 IRKuZ7XIYy3o4S0KlfL5XYE=
X-Google-Smtp-Source: APXvYqwDiHPcnJloMB8Q9IsXFFkyY3GYscvI6xaaTckkJPAG7sTHVCDqmTV5bCVWK2YdBOTDCRmqXw==
X-Received: by 2002:a63:642:: with SMTP id 63mr19076704pgg.73.1580134102833;
 Mon, 27 Jan 2020 06:08:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 13sm16004582pfi.78.2020.01.27.06.08.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Jan 2020 06:08:22 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 2/3] dt-bindings: add binding for tft displays based on
 ilitek, ili9486
Date: Mon, 27 Jan 2020 19:37:56 +0530
Message-Id: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580133212.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
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
