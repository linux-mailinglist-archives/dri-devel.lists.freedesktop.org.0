Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A309518A130
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 18:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5F6E2B1;
	Wed, 18 Mar 2020 17:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6526E2B1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 17:10:16 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id a23so11468889plm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=5yGwpkpoYCkSquYVMeNxifwEPM4Bj0EGc5XBk9JmOnY=;
 b=ozhfUHCHlEf6euXtb3Jfivrf6Bwe0s46ELrjWpUnUtwxM+h4cWvJyGuMlLbyn8MZJd
 WgDPZzUU3LmcVpvf3aPcipNYySomfF6tgvOcD2KZlukUpLEjLHwS8SttdnNte2HKvhd5
 f+BULZfA/fum0Dwde4TB1Cp+PEpwYJsjgUga0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5yGwpkpoYCkSquYVMeNxifwEPM4Bj0EGc5XBk9JmOnY=;
 b=JFJEUiVn2Y7meG4H5veXT3rFUu5EqvrFAev4x4/YZeSh6MupqWeAR1Jy/hedpGydJM
 3Iv9Vge0raBaLkIfFui6pGHXyN0OuvuHBTP7xByAO09N9iKu8Ul1uQfw37HyqLFP6otP
 djKLETRkZ6+dqkv+vlWnnMqItFXwrTqkc9ToD9xGJy9PaIKlqwUrK6rFDbIPNWHrrvGv
 +nKeyzYbM+YTkmonBC+ICf1uiU5TUdBjlTRIBAfsw7i3TZDuNG0X36S7SU3oc2YUPFWg
 zZ6EUUvGuSmUqFsPANRDTG7otDKO+IX7bvxIpw9Se4iPcu6p2782TPxWbP7uIK8iOBIG
 ZgtQ==
X-Gm-Message-State: ANhLgQ2Xily2Zd5C1m2LSAm46OnDll2NEsSs6L2WAr1bftTn0VNZta1W
 oVJg7aSxqSb86TJXWDVxy3wsQQ==
X-Google-Smtp-Source: ADFU+vs3pSg26MKGy0NO8bdDWzIPM310TMVJ0NBjABdW+8L95EeeR/4QVc5b3LfZCCwn0EU2UMO0lA==
X-Received: by 2002:a17:902:9f87:: with SMTP id
 g7mr4757669plq.32.1584551415991; 
 Wed, 18 Mar 2020 10:10:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:1998:878c:c26e:b8be])
 by smtp.gmail.com with ESMTPSA id e6sm6443869pgu.44.2020.03.18.10.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 10:10:15 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Convert feiyang,
 fy07024di26a30d to DT schema
Date: Wed, 18 Mar 2020 22:40:01 +0530
Message-Id: <20200318171003.5179-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the feiyang,fy07024di26a30d panel bindings to DT schema.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- fix dt_binding_check 

 .../display/panel/feiyang,fy07024di26a30d.txt | 20 -------
 .../panel/feiyang,fy07024di26a30d.yaml        | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
deleted file mode 100644
index 82caa7b65ae8..000000000000
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
-
-Required properties:
-- compatible: must be "feiyang,fy07024di26a30d"
-- reg: DSI virtual channel used by that screen
-- avdd-supply: analog regulator dc1 switch
-- dvdd-supply: 3v3 digital regulator
-- reset-gpios: a GPIO phandle for the reset pin
-
-Optional properties:
-- backlight: phandle for the backlight control.
-
-panel@0 {
-	compatible = "feiyang,fy07024di26a30d";
-	reg = <0>;
-	avdd-supply = <&reg_dc1sw>;
-	dvdd-supply = <&reg_dldo2>;
-	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
-	backlight = <&backlight>;
-};
diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
new file mode 100644
index 000000000000..f292c57a5bd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/feiyang,fy07024di26a30d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+properties:
+  compatible:
+    const: feiyang,fy07024di26a30d
+
+  reg:
+    description: DSI virtual channel used by that screen
+
+  avdd-supply:
+    description: analog regulator dc1 switch
+
+  dvdd-supply:
+    description: 3v3 digital regulator
+
+  reset-gpios:
+    description: a GPIO phandle for the reset pin
+
+  backlight:
+    description: Backlight used by the panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "feiyang,fy07024di26a30d";
+            reg = <0>;
+            avdd-supply = <&reg_dc1sw>;
+            dvdd-supply = <&reg_dldo2>;
+            reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
+            backlight = <&backlight>;
+        };
+    };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
