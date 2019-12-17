Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBE124148
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427A6E245;
	Wed, 18 Dec 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1786E0D2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 18:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605753;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=szAPfkhbEBP+X/6kBh4POpGrJM2G/F0sHfDcy7IRZ+g=;
 b=V73gYJxQM/v2jM2mWEhQNQYz7aqvr3fE6zvClMSOhIWzXcKB39b6poDERkfolKVuXm
 /eR4d7VPiejReNrdCx8LsyTlnBzf1DCtv46Mx7P1p2ijXhvVkdZq+by9Ytfscl2cm4Ca
 fg/8scJmXoHxBX8OnqfNN5yk2uoYpuzYLH9wWAoNqeObubaCGnVOtxCX62EFD21BEaHZ
 NtTZY7r7s7r6Gt/hESCBoTzN7QMeEe7VrGcRoqdBYmyP8J9N+OyiVL90Sp1WWCrvbWd0
 ZBUzkiSCt1U3Ngfib049Ddir1tEe2TnhTGgY52FuuY6oCzVov5OFeb3iEF9VaWD2Qt4v
 VBew==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
 with ESMTPSA id q020e2vBHI282dU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 17 Dec 2019 19:02:08 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v4 1/8] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Date: Tue, 17 Dec 2019 19:01:59 +0100
Message-Id: <aedc895985d966cf709d153d5b0bed07f59bdcfd.1576605726.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1576605726.git.hns@goldelico.com>
References: <cover.1576605726.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Imagination PVR/SGX GPU is part of several SoC from
multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo
and others.

With this binding, we describe how the SGX processor is
interfaced to the SoC (registers, interrupt etc.).

In most cases, Clock, Reset and power management is handled
by a parent node or elsewhere.

Tested by make dt_binding_check dtbs_check

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
new file mode 100644
index 000000000000..44799774e34d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination PVR/SGX GPU
+
+maintainers:
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |+
+  This binding describes the Imagination SGX5 series of 3D accelerators which
+  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
+  Allwinner A83, and Intel Poulsbo and CedarView and more.
+
+  For an almost complete list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
+  
+  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by
+  this binding but the extension of the pattern is straightforward.
+  
+  The SGX node is usually a child node of some DT node belonging to the SoC
+  which handles clocks, reset and general address space mapping of the SGX
+  register area.
+
+properties:
+  compatible:
+    enum:
+    # Example: BeagleBoard A/B/C, OpenPandora 600MHz
+      - ti,omap3-sgx530-121, img,sgx530-121, img,sgx530
+    # Example: BeagleBoard XM, GTA04, OpenPandora 1GHz
+      - ti,omap3-sgx530-125, img,sgx530-125, img,sgx530
+    # Example: BeagleBone Black
+      - ti,am3352-sgx530-125, img,sgx530-125, img,sgx530
+    # Example: Pandaboard, Pandaboard ES
+      - ti,omap4-sgx540-120, img,sgx540-120, img,sgx540
+      - ti,omap4-sgx544-112, img,sgx544-112, img,sgx544
+    # Example: OMAP5 UEVM, Pyra Handheld
+      - ti,omap5-sgx544-116, img,sgx544-116, img,sgx544
+      - ti,dra7-sgx544-116, img,sgx544-116, img,sgx544
+    # Example: CI20
+      - ingenic,jz4780-sgx540-120, img,sgx540-120, img,sgx540
+    # the following entries are not validated with real hardware
+    # more TI SoC
+      - ti,am3517-sgx530-125, img,sgx530-125, img,sgx530
+      - ti,am4-sgx530-125, img,sgx530-125, img,sgx530
+      - ti,ti81xx-sgx530-125, img,sgx530-125, img,sgx530
+    # Example: Banana-Pi-M3 (Allwinner A83T)
+      - allwinner,sun8i-a83t-sgx544-116, img,sgx544-116, img,sgx544
+    # Example: Atom Z5xx
+      - intel,poulsbo-gma500-sgx535, img,sgx535-116, img,sgx535
+    # Example: Atom Z24xx
+      - intel,medfield-gma-sgx540, img,sgx540-116, img,sgx540
+    # Example: Atom N2600, D2500
+      - intel,cedarview-gma3600-sgx545, img,sgx545-116, img,sgx545
+
+  reg:
+    maxItems: 1
+
+  interrupts:
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
+  - |+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@fe00 {
+      compatible = "ti,omap-omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";
+      reg = <0xfe00 0x200>;
+      interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
