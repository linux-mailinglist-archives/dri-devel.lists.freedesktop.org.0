Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1612719D90C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D7B6EBEF;
	Fri,  3 Apr 2020 14:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8538B6EBEF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:25:03 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t4so2731712plq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=vKBRMX/UzCOn34k/kAwE26KCgVenN+ytvHTmdWU7Okc=;
 b=ZMtQ3Z/uwSYiMhhw2nTl6CsbXXgH9xLLOhxQrgzJsrv3UW4kLSwgmTsE+7IuS36SVf
 nNr3S9XTiC1OASHDsk3Kjfy1pztgLDzzIXtliEDLztXZmr+sVH40xM7/Q9Gd23g7LO7t
 QfJPhwHti/wJtJsJ6E7HVd7ge9OGsfoe7PzWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vKBRMX/UzCOn34k/kAwE26KCgVenN+ytvHTmdWU7Okc=;
 b=uVrcQi3T7MDWd/hBNGgAF9xA2oFhq4JIzHuYzV6INEIgsc3Q8v1Al+bCoFjgB+B6qt
 JJj/L9nmoSFsgHm6zGbvqDxYTlOfOIXi95bWVMpTizDqI8xw8PY/Pp/3yddmB9r5DggM
 YJbOKqR4v2F0ggDZMJSCFIHHCJqPAgE2nk8lOP4SDZnnewYYBxQFjdN31DDpIE84DF+g
 8W0ju6J4FCswE1hJgaCEBi+6WPsdWbG82wvmhIRYCUDaDJTJTbvIo8MRzKS2qQ/TJ+d1
 tM6u9bsBMEkAN/C++beTW5Gf+uX2VTs74IX41zhRhf4e8c4E1sUfXnPjuZzfj1pWu8sY
 JG1A==
X-Gm-Message-State: AGi0Pub2yGLzNS6RCenJLLwZ/clakJoZaCsIQNrtTCr2mwrGaufgSrV+
 RWLkQl/StEH2pa4gatrgLsFq9Q==
X-Google-Smtp-Source: APiQypK/FOTXW2tO2HaeGhqMJi79/X/DjEIrHqAV05vSXxlPqEGWtElSKJxS/FsqoFPl8lB1RiTSIg==
X-Received: by 2002:a17:90b:3615:: with SMTP id
 ml21mr10361300pjb.145.1585923902916; 
 Fri, 03 Apr 2020 07:25:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:9cd7:b821:2c84:e325])
 by smtp.gmail.com with ESMTPSA id g75sm5857060pje.37.2020.04.03.07.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 07:25:02 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: display: panel: Convert feiyang,
 fy07024di26a30d to DT schema
Date: Fri,  3 Apr 2020 19:54:51 +0530
Message-Id: <20200403142453.25307-1-jagan@amarulasolutions.com>
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
Changes for v3:
- update the licence, used (GPL-2.0-only OR BSD-2-Clause) since
  I'm the author for old binding
- use panel-common.yaml
- mark true for common properties 
- use maxItems: 1 for reg
- update example
Changes for v2:
- fix dt_binding_check 

 .../display/panel/feiyang,fy07024di26a30d.txt | 20 -------
 .../panel/feiyang,fy07024di26a30d.yaml        | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 20 deletions(-)
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
index 000000000000..95acf9e96f1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: feiyang,fy07024di26a30d
+
+  reg:
+    description: DSI virtual channel used by that screen
+    maxItems: 1
+
+  avdd-supply:
+    description: analog regulator dc1 switch
+
+  dvdd-supply:
+    description: 3v3 digital regulator
+
+  reset-gpios: true
+
+  backlight: true
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
