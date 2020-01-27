Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF9514B0F9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773776ED19;
	Tue, 28 Jan 2020 08:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D2F6E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 14:26:21 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id n96so3010162pjc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 06:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xzArnJ4nbXkSs60iOFR6uhKTS+Tvj4YygIxD9MfWiRA=;
 b=hSMEE1B5iSa+2xKjYf4EB30SIERgx+rjJJ9WMZIvQgxhWxgasCg25yxXD1CPr/u/93
 uhoe/8m5NcL0C/4YDPDoETvfZU1kenKFT+3sPA8/JnKw64umkTW7CvAlgppOdGGTs9ve
 KqWw7zWpSRxMkefoulqmobc7focOHlG+tr2HnwCVQ1mU1IHzM85Tfu/CPrmW3H9QJ+o5
 BHC5VfCWw2a3dB7J3uthnD97W7uc29Jv9lowuIP53fpMwAnKQDP+AzvMjeBhwqnjFR6y
 Z5jzZMt0G9atPj8QkFhmyh9QtbMMyI+sw+LYl0YK0WiWfOeDJ18d2zcuibpkio8mAl5T
 IJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xzArnJ4nbXkSs60iOFR6uhKTS+Tvj4YygIxD9MfWiRA=;
 b=SlQSYtz1Rd6N7hbAvSIk/RkL23s5/Mj4bgPBh12tmycRi+WgBuTnLZ1XhT9Dq+Q1ug
 pSdD7S1agVwrLEJxOQmHVot6v0LwG5Ct6jdNDjtCOeVPj6EdUixYfYNQnC20coDrhnHi
 bX9001dJMGkZQMo4KRRjTmc0HTYTS2O959H1TYnR3zVA8jEmn+lahaEzkPZerT8fq/fa
 xepSoKI8SW+WlnE43AXPBmsL1lew3csEaHgKwq0eEFmeO4uHR2yWVwG/FInCUe5RwGAx
 QCqfmCAdUk05jxpXjtvqJGiltfbjhRsBYjPs8YhvwYhEjipGcpzQ1bZhjV4PhHrZeps6
 oBCA==
X-Gm-Message-State: APjAAAXjNrty/9dhi2W7bwvRddljIaL4AJhkXO6zL28w6YrxZs9NLH6J
 KgJnUIwHk26g/pXxq53OnprzOd/rtoLc9g==
X-Google-Smtp-Source: APXvYqyTcIXitQoWpeemzRjVONjwGn1dlh/73PwPJXsBE8iCjmuflUK9yssu8BE53heR85oV9RCdJA==
X-Received: by 2002:a17:902:a416:: with SMTP id
 p22mr18067830plq.107.1580135180945; 
 Mon, 27 Jan 2020 06:26:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 y23sm4725690pfn.101.2020.01.27.06.26.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Jan 2020 06:26:20 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 2/3] dt-bindings: add binding for tft displays based on
 ilitek, ili9486
Date: Mon, 27 Jan 2020 19:56:14 +0530
Message-Id: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580134320.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
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

v4 changes:
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
