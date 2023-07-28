Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82785766F2A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524A010E6FC;
	Fri, 28 Jul 2023 14:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD80910E6F4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:17:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPOHC-0006G3-J4; Fri, 28 Jul 2023 16:17:06 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPOHA-002jHP-Jy; Fri, 28 Jul 2023 16:17:04 +0200
Received: from localhost ([::1] helo=dude03.red.stw.pengutronix.de)
 by dude03.red.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPOH9-00APcf-Ro; Fri, 28 Jul 2023 16:17:03 +0200
From: Johannes Zink <j.zink@pengutronix.de>
Date: Fri, 28 Jul 2023 16:16:55 +0200
Subject: [PATCH v4 1/3] dt-bindings: display: move LVDS data-mapping
 definition to separate file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230523-simplepanel_support_nondefault_datamapping-v4-1-e6e7011f34b5@pengutronix.de>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 Johannes Zink <j.zink@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the LVDS data-mapping property is required in multiple bindings: move
it to separate file and include instead of duplicating it.

Signed-off-by: Johannes Zink <j.zink@pengutronix.de>

---

Changes:

v3 -> v4: none

v2 -> v3: worked in Conor's and Laurent's review findings (thank you
          for reviewing my work): drop +| on description

v1 -> v2: worked in Rob's review findings (thank you for reviewing my
          work): extract common properties to
          file and include it instead of duplicating it
---
 .../bindings/display/lvds-data-mapping.yaml        | 84 ++++++++++++++++++++++
 .../devicetree/bindings/display/lvds.yaml          | 77 +++-----------------
 2 files changed, 93 insertions(+), 68 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
new file mode 100644
index 000000000000..d68982fe2e9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/lvds-data-mapping.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LVDS Data Mapping
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
+  incompatible data link layers have been used over time to transmit image data
+  to LVDS devices. This bindings supports devices compatible with the following
+  specifications.
+
+  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
+  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
+  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
+  Semiconductor
+  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
+  Electronics Standards Association (VESA)
+
+  Device compatible with those specifications have been marketed under the
+  FPD-Link and FlatLink brands.
+
+properties:
+  data-mapping:
+    enum:
+      - jeida-18
+      - jeida-24
+      - vesa-24
+    description: |
+      The color signals mapping order.
+
+      LVDS data mappings are defined as follows.
+
+      - "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [LDI] and
+        [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
+
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
+      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
+
+      - "jeida-24" - 24-bit data mapping compatible with the [DSIM] and [LDI]
+        specifications. Data are transferred as follows on 4 LVDS lanes.
+
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
+      DATA1     ><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
+      DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
+
+      - "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
+        Data are transferred as follows on 4 LVDS lanes.
+
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
+      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
+      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
+
+      Control signals are mapped as follows.
+
+      CTL0: HSync
+      CTL1: VSync
+      CTL2: Data Enable
+      CTL3: 0
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/display/lvds.yaml b/Documentation/devicetree/bindings/display/lvds.yaml
index 7cd2ce7e9c33..224db4932011 100644
--- a/Documentation/devicetree/bindings/display/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/lvds.yaml
@@ -6,83 +6,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: LVDS Display Common Properties
 
+allOf:
+  - $ref: lvds-data-mapping.yaml#
+
 maintainers:
   - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
   - Thierry Reding <thierry.reding@gmail.com>
 
-description: |+
-  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
-  incompatible data link layers have been used over time to transmit image data
-  to LVDS devices. This bindings supports devices compatible with the following
-  specifications.
-
-  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
-  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
-  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
-  Semiconductor
-  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
-  Electronics Standards Association (VESA)
-
-  Device compatible with those specifications have been marketed under the
-  FPD-Link and FlatLink brands.
+description:
+  This binding extends the data mapping defined in lvds-data-mapping.yaml.
+  It supports reversing the bit order on the formats defined there in order
+  to accomodate for even more specialized data formats, since a variety of
+  data formats and layouts is used to drive LVDS displays.
 
 properties:
-  data-mapping:
-    enum:
-      - jeida-18
-      - jeida-24
-      - vesa-24
-    description: |
-      The color signals mapping order.
-
-      LVDS data mappings are defined as follows.
-
-      - "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [LDI] and
-        [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
-
-      Slot          0       1       2       3       4       5       6
-                ________________                         _________________
-      Clock                     \_______________________/
-                  ______  ______  ______  ______  ______  ______  ______
-      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
-      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
-      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
-
-      - "jeida-24" - 24-bit data mapping compatible with the [DSIM] and [LDI]
-        specifications. Data are transferred as follows on 4 LVDS lanes.
-
-      Slot          0       1       2       3       4       5       6
-                ________________                         _________________
-      Clock                     \_______________________/
-                  ______  ______  ______  ______  ______  ______  ______
-      DATA0     ><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
-      DATA1     ><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
-      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
-      DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
-
-      - "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
-        Data are transferred as follows on 4 LVDS lanes.
-
-      Slot          0       1       2       3       4       5       6
-                ________________                         _________________
-      Clock                     \_______________________/
-                  ______  ______  ______  ______  ______  ______  ______
-      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
-      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
-      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
-      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
-
-      Control signals are mapped as follows.
-
-      CTL0: HSync
-      CTL1: VSync
-      CTL2: Data Enable
-      CTL3: 0
-
   data-mirror:
     type: boolean
     description:
-      If set, reverse the bit order described in the data mappings below on all
+      If set, reverse the bit order described in the data mappings on all
       data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
 
 additionalProperties: true

-- 
2.39.2

