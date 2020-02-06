Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B0155C64
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0B16EAF1;
	Fri,  7 Feb 2020 17:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFB26EA81
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 13:34:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 016DXqXK015963; Thu, 6 Feb 2020 14:33:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Yc8uKyAQ5aTQ/8M3IgvB5KF089I1g5bisQyWh+bHrbA=;
 b=g8RkrBi1KTARF0zBwGReGmY3MuRpKGBJaE5Z8Z7YWoLzYPIM9oQnWSMdGJNB2LKB8Rl9
 cnAtprh99OSm1+E4bx61E0x3zEtoPLRV/sgA4ELdlIPkOLHys7M8Cm3hyU+pcTHDwdI2
 gquvQLZ9X2vx6WRLH3dm78qghKBpMqSo2UIkIrjfBafqIzRulU/2kdq6megrZWrVAhtC
 RQW447NwMI7IjYZEcRgGbsbHW+sYOf1LCrIEaau5d9i0mSYx+Kl7hJ2dgfxn7JMzoPHe
 m3uPxktE/9PSNsmWW8mmWUFwwI8HTWlMYJK0CesXCRm03i6Ghxlty+Eq+hVsyUKBxM1r yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhk8h5ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2020 14:33:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEABA10002A;
 Thu,  6 Feb 2020 14:33:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 932842BC7DC;
 Thu,  6 Feb 2020 14:33:50 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 6 Feb 2020 14:33:49
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <philippe.cornu@st.com>
Subject: [PATCH v4 1/3] dt-bindings: one file of all simple DSI panels
Date: Thu, 6 Feb 2020 14:33:42 +0100
Message-ID: <20200206133344.724-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200206133344.724-1-benjamin.gaignard@st.com>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_01:2020-02-06,
 2020-02-06 signatures=0
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

To complement panel-simple.yaml, create panel-simple-dsi.yaml.
panel-simple-dsi-yaml are for all simple DSP panels with a single
power-supply and optional backlight / enable GPIO.

Migrate panasonic,vvx10f034n00 over to the new file.

The objectives with one file for all the simple DSI panels are:
    - Make it simpler to add bindings for simple DSI panels
    - Keep the number of bindings file lower
    - Keep the binding documentation for simple DSI panels more consistent

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
version 4:
- remove orisetech,otm8009a and raydium,rm68200 compatibles
- remove reset-gpios optional property

version 3:
- add orisetech,otm8009a and raydium,rm68200 compatibles
- add reset-gpios optional property
- fix indentation on compatible enumeration

 .../display/panel/panasonic,vvx10f034n00.txt       | 20 -------
 .../bindings/display/panel/panel-simple-dsi.yaml   | 67 ++++++++++++++++++++++
 2 files changed, 67 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
deleted file mode 100644
index 37dedf6a6702..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Panasonic 10" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "panasonic,vvx10f034n00"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "panasonic,vvx10f034n00";
-			reg = <0>;
-			power-supply = <&vreg_vsp>;
-			backlight = <&lp8566_wled>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
new file mode 100644
index 000000000000..8b60368a2425
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple DSI panels with a single power-supply
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the DSI panels that
+  requires only a single power-supply.
+  There are optionally a backlight and an enable GPIO.
+  The panel may use an OF graph binding for the association to the display,
+  or it may be a direct child node of the display.
+
+  If the panel is more advanced a dedicated binding file is required.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+      # compatible must be listed in alphabetical order, ordered by compatible.
+      # The description in the comment is mandatory for each compatible.
+
+        # Panasonic 10" WUXGA TFT LCD panel
+      - panasonic,vvx10f034n00
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  enable-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - reg
+
+examples:
+  - |
+    mdss_dsi@fd922800 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "panasonic,vvx10f034n00";
+        reg = <0>;
+        power-supply = <&vcc_lcd_reg>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&ltdc_out>;
+          };
+        };
+      };
+    };
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
