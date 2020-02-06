Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46C155C76
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667316FD2F;
	Fri,  7 Feb 2020 17:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C776FA41
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 13:34:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 016DX36v016463; Thu, 6 Feb 2020 14:33:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uw83YHkEimIhhPOEeMx2nLPySoUUuETqUW2sGayUiPM=;
 b=0z00dx/CAms+OVIefxU9IODEGW7IBlVO6dXKyAw4L/yLkKeQ/hJo5Bn7vm+yIETHS+ST
 Z/ZMksUD2k4oCF6k6wpCzzGT4Yo181tnKQLXcIs0+gsL8ts5zpyb3uqM022YIXveWptK
 9eai6YcIuHVvrFSm/w/g4sTHyOunPGXwytXayPEeC8R281Ixo3wfC2qmuea6f+dulzRb
 l4eWNPRc65ES71CgyoRxtRfK4mQL7HYi80QaZCK4M5Xd2daUZdyCsYvlrGsIG7MBvvmJ
 LM4zNz8uzt5hj2ZBxPZOdycdiKuBHXKjm3Ag6I2O2wcA/xQbFJGmoWHD3qXK1yXL+XCw 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhku156e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2020 14:33:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E536E10003B;
 Thu,  6 Feb 2020 14:33:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D75B72BC7DB;
 Thu,  6 Feb 2020 14:33:51 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 6 Feb 2020 14:33:51
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <philippe.cornu@st.com>
Subject: [PATCH v4 3/3] dt-bindings: panel: Convert orisetech,
 otm8009a to json-schema
Date: Thu, 6 Feb 2020 14:33:44 +0100
Message-ID: <20200206133344.724-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200206133344.724-1-benjamin.gaignard@st.com>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
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

Convert orisetech,otm8009a to json-schema.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/display/panel/orisetech,otm8009a.txt  | 23 ----------
 .../bindings/display/panel/orisetech,otm8009a.yaml | 53 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
deleted file mode 100644
index 203b03eefb68..000000000000
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
-
-The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
-a MIPI-DSI video interface. Its backlight is managed through the DSI link.
-
-Required properties:
-  - compatible: "orisetech,otm8009a"
-  - reg: the virtual channel number of a DSI peripheral
-
-Optional properties:
-  - reset-gpios: a GPIO spec for the reset pin (active low).
-  - power-supply: phandle of the regulator that provides the supply voltage.
-
-Example:
-&dsi {
-	...
-	panel@0 {
-		compatible = "orisetech,otm8009a";
-		reg = <0>;
-		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
-		power-supply = <&v1v8>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
new file mode 100644
index 000000000000..6e6ac995c27b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/orisetech,otm8009a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
+
+maintainers:
+  - Philippe CORNU <philippe.cornu@st.com>
+
+description: |
+             The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
+             a MIPI-DSI video interface. Its backlight is managed through the DSI link.
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    const: orisetech,otm8009a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
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
+  - reg
+
+examples:
+  - |
+    dsi@0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "orisetech,otm8009a";
+        reg = <0>;
+        reset-gpios = <&gpiof 15 0>;
+        power-supply = <&v1v8>;
+      };
+    };
+...
+
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
