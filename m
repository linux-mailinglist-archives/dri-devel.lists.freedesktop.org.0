Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5714E95F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150156FAA4;
	Fri, 31 Jan 2020 08:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxa1.seznam.cz (mxa1.seznam.cz [IPv6:2a02:598:a::78:90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD2A6E901
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 20:38:59 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc14a.ko.seznam.cz (email-smtpc14a.ko.seznam.cz [10.53.11.165])
 id 5f612a08046f7e615ec8e656; Thu, 30 Jan 2020 21:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
 t=1580416729; bh=V6HBTKotURyKJ2paipIoehYbXxJf+uIZbTmi1MmUXEw=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=O23UBWKNXJpRbQBPpgaNJ7/G5VCv+fi6FvTC2QjGuuSwnBNeKvlfgS9sU26EZ0Qed
 QcSTZGrmaG6SJP6GcgsniidJiAO5TwKid1M8LU6WwpG3p14C+z2YO3qZ4pJeVvmNmn
 x28WbjRQN4WwwKh0476p5JLHan9YW7/Y+qgarZBg=
Received: from localhost.localdomain (unknown [212.69.128.228])
 by email-relay10.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
 Thu, 30 Jan 2020 21:38:46 +0100 (CET)  
From: michael.srba@seznam.cz
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Date: Thu, 30 Jan 2020 21:35:54 +0100
Message-Id: <20200130203555.316-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Srba <Michael.Srba@seznam.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
use of their S6E88A0 controller.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
Hi,
I recall now that tabs cause a syntax error in yaml, should be easy to check 
in checkpatch.pl?
I hope there are no more embarassing oversights left.

Changes in v2: use yaml format for the binding
Changes in v3: fix oversights too embarassing to admit here
---
 .../panel/samsung,s6e88a0-ams452ef01.yaml     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
new file mode 100644
index 000000000000..298fc9a78297
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams452ef01#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode DSI controller
+
+maintainers:
+  - Michael Srba <Michael.Srba@seznam.cz>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e88a0-ams452ef01
+  reg: true
+  reset-gpios: true
+  vdd3-supply:
+     description: core voltage supply
+  vci-supply:
+     description: voltage supply for analog circuits
+
+required:
+  - compatible
+  - reg
+  - vdd3-supply
+  - vci-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel@0 {
+            reg = <0>;
+
+            compatible = "samsung,s6e88a0-ams452ef01";
+
+            vdd3-supply = <&pm8916_l17>;
+            vci-supply = <&reg_vlcd_vci>;
+            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
