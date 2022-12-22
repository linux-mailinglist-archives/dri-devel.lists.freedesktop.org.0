Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0376542FA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5239210E4F6;
	Thu, 22 Dec 2022 14:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966489C2C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:28:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id x22so5252409ejs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IiR9nJxZj0ahc9gYg7Q4kSlDraiLVtIVMlRjW0NAGg4=;
 b=kVO3wEjlUNasPOkQM+Z8XVHJ1D4eroDcNYLwjW2XFT1X4tvZMLhYsMzwjZLJn31O39
 yjmuS0HuXq1lSB/v+qiLEd/JfdlhFFF8ZoQZQOBhosIrGG7z23XCxzQvXdMMDv4liNZw
 CXZVDY5Fjvl3VTQ47YozPl/DmcpQBwyFeaKUtTFc7iNlEb2i2fR1IqIi04TSpIC2ixLn
 ThK0qRxwTTZQS2Vn/11sFIAtVgqcN1YwPPxG6L1IP1MG7340wDX88+f7bnFFdDiViIBQ
 1PSn4OcmRKU4pr4HNe2SPzP1VeNxXmPRiRltzh1VP1EPFGrGxrpjeAXekFVl0dvLvzKG
 vTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IiR9nJxZj0ahc9gYg7Q4kSlDraiLVtIVMlRjW0NAGg4=;
 b=o4/f6XlqeQ898LWLd/ef0EFLZKMVrmj5mb71g4M3efchscwdXI83IkCmL7vZK9Q3Qd
 fu0k+nSf/e5RWHEf0fnkB8CfevvXDfQrMDnwX0me/UNKHEiTkG/v6im+BJLJoYW1qihM
 b1jaVvoLNqlXrI2TJK5+QwTXqPX6t2T1IFwCYtQuClzGldUIO0OnxkHq/aFbFD8oWi8x
 9R4KDVb7hZNEtp2itKi/8zEY8KnYZuToYJLikYSlDzWoL+fjFqX2me0C2aY52t8cyc2L
 EIKpdrFJMin/dH40AynSnUYe6boW6gvh78yVJc8YLZIYWmj0UO5sAnzvojpImec/32jX
 Z4pw==
X-Gm-Message-State: AFqh2kpneCzXsLk7SvAlIJy3IWwSVx31Fae5uwr643G3N9mq4UnUSc++
 PwWAfuj8gYU+6SzwMKx0epU=
X-Google-Smtp-Source: AMrXdXve0iWMaQ1w3rvzZqthvoHgo3T68e7FSilnYAFSXme6eZvnTnnigr0DKcN5f6y2xvY0Z41wqA==
X-Received: by 2002:a17:906:5956:b0:81b:f617:eb99 with SMTP id
 g22-20020a170906595600b0081bf617eb99mr4531596ejr.67.1671719334856; 
 Thu, 22 Dec 2022 06:28:54 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 vf20-20020a170907239400b0081586470b7csm298343ejb.173.2022.12.22.06.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:28:54 -0800 (PST)
Message-ID: <0336a3c4-4a43-c983-11d7-e2ae16187fc8@gmail.com>
Date: Thu, 22 Dec 2022 15:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 08/17] dt-bindings: usb: convert fcs,fusb302.txt to yaml
To: heiko@sntech.de
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Language: en-US
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert fcs,fusb302.txt to yaml.

Changed:
  Add vbus-supply property

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V6:
  Add unevaluatedProperties
  Drop unused labels
---
 .../devicetree/bindings/usb/fcs,fusb302.txt   | 34 ----------
 .../devicetree/bindings/usb/fcs,fusb302.yaml  | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/fcs,fusb302.txt
 create mode 100644 Documentation/devicetree/bindings/usb/fcs,fusb302.yaml

diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
deleted file mode 100644
index 60e465429..000000000
--- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Fairchild FUSB302 Type-C Port controllers
-
-Required properties :
-- compatible             : "fcs,fusb302"
-- reg                    : I2C slave address
-- interrupts             : Interrupt specifier
-
-Required sub-node:
-- connector : The "usb-c-connector" attached to the FUSB302 IC. The bindings
-  of the connector node are specified in:
-
-	Documentation/devicetree/bindings/connector/usb-connector.yaml
-
-
-Example:
-
-fusb302: typec-portc@54 {
-	compatible = "fcs,fusb302";
-	reg = <0x54>;
-	interrupt-parent = <&nmi_intc>;
-	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-
-	usb_con: connector {
-		compatible = "usb-c-connector";
-		label = "USB-C";
-		power-role = "dual";
-		try-power-role = "sink";
-		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-			     PDO_VAR(3000, 12000, 3000)
-			     PDO_PPS_APDO(3000, 11000, 3000)>;
-		op-sink-microwatt = <10000000>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.yaml b/Documentation/devicetree/bindings/usb/fcs,fusb302.yaml
new file mode 100644
index 000000000..b396ea0ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fairchild FUSB302 Type-C Port controller
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    const: fcs,fusb302
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vbus-supply:
+    description: VBUS power supply
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vbus-supply
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      typec-portc@54 {
+        compatible = "fcs,fusb302";
+        reg = <0x54>;
+        interrupt-parent = <&nmi_intc>;
+        interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+        vbus-supply = <&vbus_typec>;
+
+        connector {
+          compatible = "usb-c-connector";
+          label = "USB-C";
+          power-role = "dual";
+          try-power-role = "sink";
+          source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+          sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+                       PDO_VAR(3000, 12000, 3000)
+                       PDO_PPS_APDO(3000, 11000, 3000)>;
+          op-sink-microwatt = <10000000>;
+        };
+      };
+    };
--
2.20.1

