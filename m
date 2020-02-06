Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A70155C71
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CF86FD2A;
	Fri,  7 Feb 2020 17:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90C6EA84
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 13:33:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 016DXPWk005683; Thu, 6 Feb 2020 14:33:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BC2Cnt1GrsiwMGu01GohYQG+iMq/3tQ6n0UDWLiGk8A=;
 b=LFYsFGVyA8kbk+rHDtG5qqKPuzXJIQH6n7hoaTub6eo3mHZP3Yqm3A3SuZ/dIwT70OLJ
 ++WdYweFM565znM/W2nLtF2tZna+DhFEPLgDfClNt5c4qG9OAquqR9ipZhMJEtAMaizu
 BhKWgA18ADmDKDMdnrYmwdSTIw2s0GRzbDvZxBy5mCyLqEHwJK0j32K5s2IobPMwtSVv
 LcxVm12XtnH6SIvk3qoMdOC6OegSPavtyqv68e333YvyGWX5SyS9bY7Bs2aw17cZq74D
 E/xYXVOHVchyMHxOQ4zPbGVPNhIYfImQm50ODaXHUWqad74mHWJJtam/Ckv3cHM/HR+z yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhkyqv5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2020 14:33:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50696100038;
 Thu,  6 Feb 2020 14:33:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4279F2BC7DB;
 Thu,  6 Feb 2020 14:33:51 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 6 Feb 2020 14:33:50
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <philippe.cornu@st.com>
Subject: [PATCH v4 2/3] dt-bindings: panel: Convert raydium,
 rm68200 to json-schema
Date: Thu, 6 Feb 2020 14:33:43 +0100
Message-ID: <20200206133344.724-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200206133344.724-1-benjamin.gaignard@st.com>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE3.st.com
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert raydium,rm68200 to json-schema.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/display/panel/raydium,rm68200.txt     | 25 ----------
 .../bindings/display/panel/raydium,rm68200.yaml    | 56 ++++++++++++++++++++++
 2 files changed, 56 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
deleted file mode 100644
index cbb79ef3bfc9..000000000000
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
-
-The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
-panel connected using a MIPI-DSI video interface.
-
-Required properties:
-  - compatible: "raydium,rm68200"
-  - reg: the virtual channel number of a DSI peripheral
-
-Optional properties:
-  - reset-gpios: a GPIO spec for the reset pin (active low).
-  - power-supply: phandle of the regulator that provides the supply voltage.
-  - backlight: phandle of the backlight device attached to the panel.
-
-Example:
-&dsi {
-	...
-	panel@0 {
-		compatible = "raydium,rm68200";
-		reg = <0>;
-		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
-		power-supply = <&v1v8>;
-		backlight = <&pwm_backlight>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
new file mode 100644
index 000000000000..09149f140d5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm68200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
+
+maintainers:
+  - Philippe CORNU <philippe.cornu@st.com>
+
+description: |
+             The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
+             panel connected using a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    const: raydium,rm68200
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
+  reset-gpios:
+    maxItems: 1
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
+    dsi@0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "raydium,rm68200";
+        reg = <0>;
+        reset-gpios = <&gpiof 15 0>;
+        power-supply = <&v1v8>;
+        backlight = <&pwm_backlight>;
+      };
+    };
+...
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
