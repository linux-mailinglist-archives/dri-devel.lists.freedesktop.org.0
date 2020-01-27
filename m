Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615014B0EE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D51B6ED11;
	Tue, 28 Jan 2020 08:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7646EBCB;
 Mon, 27 Jan 2020 14:52:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RElJVx005845; Mon, 27 Jan 2020 15:52:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bq3kXYZcY/UNoSpC2QX0gFiJR264ksBW4ivMZzBcXTA=;
 b=hYT8HwiTwz0IjvIB7GyPonjpBknKxWKuo10D7fd4uoCTq4a2Qmwdn320eB4Lbg8thBQY
 PXk6GsH0f3coUbb/TpZQg3vSwbxMWdpm8N5iO4QI2H8lEBZv221DEKNCWAtSgHzrpUb+
 az1HnqB+vnjtMQVyGgsVMBz2ww0A5RclLiWS8VrWP5217qUfhEWCo0QGHh2oRUGfyH4U
 soU3q+WlGkOgdHoYjDwPDELr/K1dzMQJWtwBzHL5KsE731eV6k9fb6J/mzwFBG4Mivae
 lrMEmk01+TPkXpLHoENm2oP6a3NHMjCSin4UlZ4blvKiNHihGqYBWQOxTOBuHb+BXKRN vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpasjqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 15:52:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D27910002A;
 Mon, 27 Jan 2020 15:52:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7530C2BEC53;
 Mon, 27 Jan 2020 15:52:26 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jan 2020 15:52:25
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <l.stach@pengutronix.de>, <linux+etnaviv@armlinux.org.uk>,
 <christian.gmeiner@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH] dt-bindings: display: Convert etnaviv to json-schema
Date: Mon, 27 Jan 2020 15:52:23 +0100
Message-ID: <20200127145223.8283-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_04:2020-01-24,
 2020-01-27 signatures=0
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
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
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>,
 linux-kernel@vger.kernel.org, philippe.cornu@st.com,
 pierre-yves.mordret@st.com, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert etnaviv bindings to yaml format.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/display/etnaviv/etnaviv-drm.txt       | 36 -----------
 .../bindings/display/etnaviv/etnaviv-drm.yaml      | 72 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
 create mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.yaml

diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
deleted file mode 100644
index 8def11b16a24..000000000000
--- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Vivante GPU core devices
-========================
-
-Required properties:
-- compatible: Should be "vivante,gc"
-  A more specific compatible is not needed, as the cores contain chip
-  identification registers at fixed locations, which provide all the
-  necessary information to the driver.
-- reg: should be register base and length as documented in the
-  datasheet
-- interrupts: Should contain the cores interrupt line
-- clocks: should contain one clock for entry in clock-names
-  see Documentation/devicetree/bindings/clock/clock-bindings.txt
-- clock-names:
-   - "bus":    AXI/master interface clock
-   - "reg":    AHB/slave interface clock
-               (only required if GPU can gate slave interface independently)
-   - "core":   GPU core clock
-   - "shader": Shader clock (only required if GPU has feature PIPE_3D)
-
-Optional properties:
-- power-domains: a power domain consumer specifier according to
-  Documentation/devicetree/bindings/power/power_domain.txt
-
-example:
-
-gpu_3d: gpu@130000 {
-	compatible = "vivante,gc";
-	reg = <0x00130000 0x4000>;
-	interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&clks IMX6QDL_CLK_GPU3D_AXI>,
-	         <&clks IMX6QDL_CLK_GPU3D_CORE>,
-	         <&clks IMX6QDL_CLK_GPU3D_SHADER>;
-	clock-names = "bus", "core", "shader";
-	power-domains = <&gpc 1>;
-};
diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.yaml b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.yaml
new file mode 100644
index 000000000000..5a6c387f168d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/etnaviv/etnaviv-drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Vivante GPU Bindings
+
+description: Vivante GPU core devices
+
+maintainers:
+  -  Lucas Stach <l.stach@pengutronix.de>
+
+properties:
+  compatible:
+    const: vivante,gc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI/master interface clock
+      - description: GPU core clock
+      - description: Shader clock (only required if GPU has feature PIPE_3D)
+      - description: AHB/slave interface clock (only required if GPU can gate slave interface independently)
+    minItems: 2
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+      - const: shader
+      - const: reg
+    minItems: 2
+    maxItems: 4
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
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    gpu@130000 {
+      compatible = "vivante,gc";
+      reg = <0x00130000 0x4000>;
+      interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clks IMX6QDL_CLK_GPU3D_AXI>,
+               <&clks IMX6QDL_CLK_GPU3D_CORE>,
+               <&clks IMX6QDL_CLK_GPU3D_SHADER>;
+      clock-names = "bus", "core", "shader";
+      power-domains = <&gpc 1>;
+    };
+
+...
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
