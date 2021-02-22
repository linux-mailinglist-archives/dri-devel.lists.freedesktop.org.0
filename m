Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A5321B7F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 16:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FD06E138;
	Mon, 22 Feb 2021 15:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813C76E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 15:35:02 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id gm18so3997563pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=2U8z9Rh9hQENfZBHEjdzikqpHVnTZc9rkP25ytLoLPU=;
 b=f5b0xj9I7Q2Tdl970OI1nAueN9gZ9C/8xSu7nxLdEu37PQanoVd6pG9SLWKaVCs3zo
 RebudpQ7qZ95dPitRY/WfCM/UhkBTkD9BIDVSiilPneUXbeSmb4yFHv6L/1qxMH8uEGS
 hqHbrmIJFNTtaRoMb08qGRnuySLIkuc1nlNRs+qXz8EjLTTbc4p0KthZ/a7GeZKwNB3t
 IXasK8dqli+nFMMwrmmFbuBujHR8oWfp0ezeGEce5fMZC2kDcNaOFygWyRCUrpV1AAJ/
 UNKNK7T4cc+R6AL2VfrxxdNz1Ave33xHISD6aribpFnjVjCAx93ovzYqVUanCsKOfz66
 4ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2U8z9Rh9hQENfZBHEjdzikqpHVnTZc9rkP25ytLoLPU=;
 b=m0FddnvHJZUnkOvLT7RnC9759IxMPr0w6zSdFV4fBlObkqiBTjk9GOj9g3mXLRq5wD
 kVfF+IsXQxUWJRJpEefr6GG8aur+D5N0j23ga6V0VIo5TCYk2TZa+ygoSTk2XaUJxAON
 hAlHQauKPLFQaBzkKWOoJW6v7Mn6Xrj44VAY9jSL5W1lCCWIwPKD+ha28WO2gPysT+Ep
 o8Xs4bS/ZbYlnims/d1YU5DA7yyaVSzjyctCgWtc8Ee1ZSgZtunZ+6MHMYVKsxMfxB3m
 jtxLaUPswksS4AvhLVChoknvqsL2HJUVO2NCHODALUG4zx0r8nMRWU6h9D3495dy5zEn
 O41g==
X-Gm-Message-State: AOAM533AGJO5Ee7cHBvszSQ+f+VznPtt0FnVelFVv0IGQphszUwrEpjE
 ALFv547JTN8H27lKKBBsH3oRwg==
X-Google-Smtp-Source: ABdhPJx5RtOzgQKUgQ8ekAvGjECJ4YXFYw0+bp7A8XgvPW7G4TLCBTqESYK3dBHLMVlpG4t8tCf9NQ==
X-Received: by 2002:a17:90a:fb4e:: with SMTP id
 iq14mr24519817pjb.18.1614008102050; 
 Mon, 22 Feb 2021 07:35:02 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id s62sm11692837pfb.148.2021.02.22.07.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 07:35:01 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: pihsun@chromium.org, drinkcat@google.com, marcheu@chromium.org,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: Add STARRY 2081101QFH032011-53G
Date: Mon, 22 Feb 2021 23:34:54 +0800
Message-Id: <20210222153454.20198-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
QFH032011-53G.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../display/panel/innolux,himax8279d.yaml     | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
new file mode 100644
index 000000000000..ae2d6d39fed5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,himax8279d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: INNOLUX HIMAX8279D DSI Display Panel
+
+maintainers:
+  - Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
+      - starry,2081101qfh032011-53g
+
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp1800-supply
+  - avdd-supply
+  - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "starry,2081101qfh032011-53g";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
+            status = "okay";
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
