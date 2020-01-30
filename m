Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A914E960
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13796FAAB;
	Fri, 31 Jan 2020 08:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxa2.seznam.cz (mxa2.seznam.cz [IPv6:2a02:598:2::90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F166E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 17:27:20 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc15a.ng.seznam.cz (email-smtpc15a.ng.seznam.cz [10.23.11.195])
 id 58bdb51903b3e17059147947; Thu, 30 Jan 2020 18:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
 t=1580405239; bh=2nleulkEI2ScTi+li6MZ2I7MWAzQbblG7BXMZTMIK2U=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=CqOopzMB/tz6VOWOZXJ959NdDbkx3Y96wOKDETJP05KJaT+AQVTYT63WKC0X0VC4b
 pxuZlwovxtnJSFthfXaTen3Bh2Hc3ApvnJpPDO3eT+FSi378lbPJgpH80fzwbXO8kD
 ixb4Mc7t/yZMoP4Zb9MPuGY2TPXX0dq9voVWD9S8=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
 by email-relay12.ng.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
 Thu, 30 Jan 2020 18:14:12 +0100 (CET)  
From: michael.srba@seznam.cz
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Date: Thu, 30 Jan 2020 18:11:27 +0100
Message-Id: <20200130171128.29251-1-michael.srba@seznam.cz>
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
Thanks for the review. I believe I've fixed everything, and I tested that 
I get image on drm-next with these patches applied.

Changes since v1: use yaml format for the binding
---
 .../panel/samsung,s6e88a0-ams452ef01.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
new file mode 100644
index 000000000000..3d9b480ec706
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
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
+  enforce-video-mode: true
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
+		reg = <0>;
+
+		compatible = "samsung,s6e88a0-ams452ef01";
+
+		vdd3-supply = <&pm8916_l17>;
+		vci-supply = <&reg_vlcd_vci>;
+		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+	};
+
+...
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
