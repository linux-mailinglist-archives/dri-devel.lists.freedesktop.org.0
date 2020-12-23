Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B4F2E2166
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998ED6E88D;
	Wed, 23 Dec 2020 20:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098A86E88A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:35:39 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhDIw-1kMhiX0Owc-00eKzN; Wed, 23 Dec 2020 21:35:35 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH V2 4/4] dt-bindings: gpu: Convert v3d to json-schema
Date: Wed, 23 Dec 2020 21:35:14 +0100
Message-Id: <1608755714-18233-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:8l1QBIyfbcmygp6sKvqk88+MrbnuszvfhC6KxlA/1Jam7bL/V/y
 1jcxqxUWThEsP0qOdg+fU4wcNHBj8qNPmKzawJJQ89gcUmJ4P8MP3UptQ9hQkC6zcIZaJ4u
 UiiikxnudmKhxuRmQUEZMHwuvkZ3o+9tlUEfgO+aDe0hHOJFoqsseZ9LYLftAoaLX9yp7CX
 lcSRnjow3QbL+bUgdMt3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1vWRgUyN88=:/dHN6T8aZLTMdETssAukiW
 FWNnk4Nq89+xaVJn4pgzJjj9ymrYrDewiAHl7tCttG+OrYxXqIfgrMljDFoK0Ppty1MVkeBSx
 eS33zi/BGSlfVQNOrP+7LV9qa+wrFulcOOrS1aIq5STxaq+fj1nQJKbB6NxjQpfWPkRzrfQyo
 2ZwmT57ILoTYcX8kTib/g7lidw7BpET+VibHZZs2JnjCu4MQ8ERhiviyfnHCrygJ+iKFPVaVF
 tQUit++ZdfhhMsQnKwh1VXsD7ymWZ+R5Oz64/Mp65mxpEOeuOPXj05glsxR2lXnJBzSV3jPDg
 GAE+Opsa4+QpJm4z3vcwVCfUqjNkigGJ+Ouc1uJHBhC6UAhO2EIPwScbzmq6rwZzHokdfA2ao
 3YBOmS9euihq993eqWH1tDFc8dn197lQwHRU0cw+298YrXkl0XUY9SQ2TBHP9iuGY2wI47B7p
 p0/D1KkjOA==
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
 .../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 76 ++++++++++++++++++++++
 2 files changed, 76 insertions(+), 33 deletions(-)
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
index 0000000..a2b06d42
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -0,0 +1,76 @@
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
+      - description: hub register
+      - description: core0 register
+      - description: GCA cache controller register (if GCA controller)
+      - description: bridge register (if no external reset controller)
+    minItems: 2
+    maxItems: 4
+
+  reg-names:
+    items:
+      enum: [ bridge, core0, gca, hub ]
+    minItems: 2
+    maxItems: 4
+
+  interrupts:
+    items:
+      - description: hub interrupt
+      - description: core interrupt (if it doesn't share the hub's interrupt)
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
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
