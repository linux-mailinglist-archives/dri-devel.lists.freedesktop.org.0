Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4692EFF17
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 11:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83336E925;
	Sat,  9 Jan 2021 10:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EAF6E8D2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 10:51:01 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N32y5-1jxBIV0NZN-013JIJ; Sat, 09 Jan 2021 11:50:58 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH V3] dt-bindings: gpu: Convert v3d to json-schema
Date: Sat,  9 Jan 2021 11:50:32 +0100
Message-Id: <1610189433-29985-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:imqKG2uiaQo+o2R33iawuqIPeJETqoF5GAJTQGv6dQvlrXg7mfs
 VKaf1e5dU3aTGxCy74JIepxcIscjph8olbvhsGoVU6MoGshLhitbTHTRjPztGBc+QdiuX3l
 qhJ43U5RicGj3KpFrNMTkzXurH7pwuHxHTO7hhJTtpFrkOeA3b8yEHYPd192mr+qPeYFMnM
 qHdgMfdiFsFZVPJkD/zHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wnqIwCKaMRE=:zwFuUE1p1zGYuSqyiBBZvj
 haVgEuZzeRhhNPbH+nIydsXSGrXUCCnuZ0FKb3I6EOv9jmbZf+qqvUEOrzIMN08Gx6ovBQ/jT
 NJQq0s0rqUPLCLC1dBMpurGsLOmnZvGucaXhD7AM/D0RcCb4xw924X46Qa4WtRh2XmrL2B09L
 GkIwaHNkVl+tHbf+qeg9GXB3wEQVfCr+eyMD14vEWhVzswmP/sr0/4CnpXRq1OMW9qBmPfvng
 Jgwqew3a+5m2gQpG/YokcrfURr34Vp5wOvwwFDZShqjgQdE97nI1ccOEvJgqTFo4aozJTHdLB
 gkJMMOZv/poPjDre9wgnSMOHyd/rQeVo6QJd+TeAIpehFOmrVJ1j1LPsSHBSHhp63hTQrt1aq
 0tE8WqLofHsgRxxl9H2yhAfmA6H/xDPB6lvWKEj/e+9+gn8Jqr7hWk3Ej36vgnwFBn/fjdf8Q
 xgrZR8FKwg==
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts the v3d bindings to yaml format.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---

Changes in V3:
- drop redundant maxItems in case we already have items defined
- fix order of reg-names enum
- tag required items in description
- add reg-names to required properties
- drop clock-names

 .../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 72 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
deleted file mode 100644
index b2df82b..0000000
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Broadcom V3D GPU
-
-Only the Broadcom V3D 3.x and newer GPUs are covered by this binding.
-For V3D 2.x, see brcm,bcm-vc4.txt.
-
-Required properties:
-- compatible:	Should be "brcm,7268-v3d" or "brcm,7278-v3d"
-- reg:		Physical base addresses and lengths of the register areas
-- reg-names:	Names for the register areas.  The "hub" and "core0"
-		  register areas are always required.  The "gca" register area
-		  is required if the GCA cache controller is present.  The
-		  "bridge" register area is required if an external reset
-		  controller is not present.
-- interrupts:	The interrupt numbers.  The first interrupt is for the hub,
-		  while the following interrupts are separate interrupt lines
-		  for the cores (if they don't share the hub's interrupt).
-		  See bindings/interrupt-controller/interrupts.txt
-
-Optional properties:
-- clocks:	The core clock the unit runs on
-- resets:	The reset line for v3d, if not using a mapping of the bridge
-		  See bindings/reset/reset.txt
-
-v3d {
-	compatible = "brcm,7268-v3d";
-	reg = <0xf1204000 0x100>,
-	      <0xf1200000 0x4000>,
-	      <0xf1208000 0x4000>,
-	      <0xf1204100 0x100>;
-	reg-names = "bridge", "hub", "core0", "gca";
-	interrupts = <0 78 4>,
-		     <0 77 4>;
-};
diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
new file mode 100644
index 0000000..3b543d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/brcm,bcm-v3d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom V3D GPU Bindings
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+  - Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - brcm,7268-v3d
+      - brcm,7278-v3d
+
+  reg:
+    items:
+      - description: hub register (required)
+      - description: core0 register (required)
+      - description: GCA cache controller register (if GCA controller present)
+      - description: bridge register (if no external reset controller)
+    minItems: 2
+
+  reg-names:
+    items:
+      enum: [ hub, core0, bridge, gca ]
+    minItems: 2
+    maxItems: 4
+
+  interrupts:
+    items:
+      - description: hub interrupt (required)
+      - description: core interrupts (if it doesn't share the hub's interrupt)
+    minItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    gpu@f1200000 {
+      compatible = "brcm,7268-v3d";
+      reg = <0xf1204000 0x100>,
+            <0xf1200000 0x4000>,
+            <0xf1208000 0x4000>,
+            <0xf1204100 0x100>;
+      reg-names = "bridge", "hub", "core0", "gca";
+      interrupts = <0 78 4>,
+                   <0 77 4>;
+    };
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
