Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94A2E216A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5DB6E88A;
	Wed, 23 Dec 2020 20:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD0989E26
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:37:02 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWAWq-1kXruK2Ok6-00XaWK; Wed, 23 Dec 2020 21:27:54 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 4/4] dt-bindings: gpu: Convert v3d to json-schema
Date: Wed, 23 Dec 2020 21:27:25 +0100
Message-Id: <1608755245-18069-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
References: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:pX/LN56hT9ajMLlvxi29HcfZUurA9LJeN+C603L1/ANg4ENBvmH
 w8uwkjHfG6FBZOFYjf91uWTVS/K0USc5MX0apWyoBD+22FozIOQ6/wN95vavl47a/80dTji
 RUQrvmeCw/ZYYws++GuhRIa9GvSLxmdtRGcRUu2gjJgB89mAya4j41QMQDK0keaYHUqzrUz
 88bgQvA0pJMUS2pJzpYww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MTZMVL0SRCw=:7t1UOboAV7RXRen5IK5vNN
 4kljnlRgpqvLiqqsER3IfX064HPPfA7PbeGz+0U6elUWCax0Eit8Wvtr9JR9lsp0AJJH1xmQv
 0m6EmOh8sy1mRdzGhlDOnsdxNeIfpJL1bMkS1n6DE4vwHDXPdoZLyXKLyJRIJlPfxaNXCKjVn
 IbpmCpfC1f0MN2S5HeJBhPJsdpETgxn+JH9NfNJNCkagO4dInWRv50wb0+TOC7sGU8uTZixIo
 ZxKk+d/G65zAuiSfV0dDtuLp1Q+i1LaeFW1PTE8VRxz8TBhxGlOBbN+LFDi1kERXQ75nJrz5b
 hwt0adj65U1+FDKDjoNuOUsPHBE+SF5ZR3F3a5chsBHl9goWlSzTI+KGp9HbB/r9gn6oHGKuh
 97ddwBBGaJF0hup+mjwkUBIJTceOyb8QkLQk7XJyb6m07oYhq0I5IiV0ELFnlo5+N5feeixhg
 P6ufpw7wdA==
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
