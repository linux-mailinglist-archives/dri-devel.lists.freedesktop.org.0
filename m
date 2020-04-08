Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060DD1A29EF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437916EAEB;
	Wed,  8 Apr 2020 19:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB236EAE7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g27so8958864ljn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fb/O1iqzcyrS2v32LjG3WdrjYOHgeGYkkI2/ikLgijE=;
 b=IIdKm/dsQzEeEE8IwgUYjNSiF4ThVF7FrfU2Do8OhBrAzUWHOpnWItkhjkbKjSZsQ+
 4MnGDdkhyGGNRMkTbV3Yk8igK+BobCgPcvhrnYK3m/TLFuDAi5476fV5wZCnZInL2wFy
 22z6F/DkiNI7p8T190JgKke31C6A0SorYNJoV1A4Ampb1LDT6MGj3RrdZYQcp+alC2cv
 Qa0+vBC70v99g/lEuDtNzHiG7ZETcAuFOdvNV1iy/Sc6fT5X9nF1d1H3C1ktUEqaFsSC
 mNufRPd2/MVA5rizaBrju7nOJcjkl6ixmmKgiB8IPGOIqs0+Ax8KtFB1+y942/M1c/Ia
 dMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fb/O1iqzcyrS2v32LjG3WdrjYOHgeGYkkI2/ikLgijE=;
 b=P7AH++EC+g1lJDXJ2AAQ7ICdKPNdsWw6nQMXwti1JerDnV8hfOFvx7L3k45QrYwnx/
 /boM8hCN5li+my8hZhq3Xj8OiJsUbRyIeK+qj58agDx8TdihBICqpHD8jhgTursGt32A
 2B4FiqNuduh7aIDB6Nw05SRTD74U4Vpeh+LaK+4VQqUlcQu3akTGhHjDT1ISvU/SD8ot
 dpfRTlWB6oTmznbV3XY7yljwNpsgQyak4JnsRyhHV176i+hOvQjudgvvXwZLsyXAZrq/
 w20fWxKl8n6lKDu7o4vqC1/ac8Pm5oLbHHI/qisE0hFzIsMBEsdUGt2Ih2kqyauYjVF4
 AS5w==
X-Gm-Message-State: AGi0Publ2N3bPmgPSQtsLbAzqmZMyYPyL5fDOk3E66vfNxY2yV7u3mWu
 Z1L7Vtp1NXRnfrYIG+7z6JEfLZUsQWU=
X-Google-Smtp-Source: APiQypJDB0CsAPR1jEdlchfIOvppvvjcTprhDMVNzMBHv/ajNX2nk8Oz7+aBOS6HEvdTY9A9bvRkiA==
X-Received: by 2002:a2e:8903:: with SMTP id d3mr6244305lji.266.1586375529315; 
 Wed, 08 Apr 2020 12:52:09 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:08 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 26/36] dt-bindings: display: convert sony,
 acx565akm to DT Schema
Date: Wed,  8 Apr 2020 21:50:59 +0200
Message-Id: <20200408195109.32692-27-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - drop use of spi-slave.yaml (Maxime)
  - add unevaluatedProperties (Maxime)
  - rename node in example to panel (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/sony,acx565akm.txt | 30 ----------
 .../display/panel/sony,acx565akm.yaml         | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
deleted file mode 100644
index e12333280749..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Sony ACX565AKM SDI Panel
-========================
-
-Required properties:
-- compatible: "sony,acx565akm"
-
-Optional properties:
-- label: a symbolic name for the panel
-- reset-gpios: panel reset gpio
-
-Required nodes:
-- Video port for SDI input
-
-Example
--------
-
-acx565akm@2 {
-	compatible = "sony,acx565akm";
-	spi-max-frequency = <6000000>;
-	reg = <2>;
-
-	label = "lcd";
-	reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&sdi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
new file mode 100644
index 000000000000..95d053c548ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,acx565akm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony ACX565AKM SDI Panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sony,acx565akm
+
+  label: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@2 {
+            compatible = "sony,acx565akm";
+            spi-max-frequency = <6000000>;
+            reg = <2>;
+
+            label = "lcd";
+            reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
+
+            port {
+                lcd_in: endpoint {
+                    remote-endpoint = <&sdi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
