Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01C653626
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044BE10E46D;
	Wed, 21 Dec 2022 18:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3522810E1D1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:23:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ud5so38839231ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I8bHMUqENRt0vHg2+ln10JPBh/wNz9sMNq+zKIXFVzY=;
 b=F1We4HR4kaz9DAtLcoLZlAZ8ezAcRL+vFHXFCFq9L2rdsQFBkDOa6PsRjRMCSZdu4O
 bG3GmcD1fEWI7WQ6v7+hmIg8tVK1XhIWIm/0/qsrpg+RvaHWdTNCmrQ1+538wrrWcAGn
 xRn8xDjhurrxURajLVCfuHGmTHwnnnUtZwlFLUu88UYZvBnqOKGZXuWW2etehJvAxPNY
 EsZiCUCod1hVM+/8EkGNs3+eCJ/Vs+ZT9Rss7L6I7JuG7+xcBTdx9x+C0E4Y+PlvRy2t
 JALyWQSoKu4XrUN6T+T2+oEMp/QSutJfir7nEy5+dAYGgOIUC+41tsAEUNQcYTCwAWww
 qUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I8bHMUqENRt0vHg2+ln10JPBh/wNz9sMNq+zKIXFVzY=;
 b=ey6OU5eQqmIYvlvJJxJFmaTo/WfPsDke09vpHAcKjd3fzikb4H6uYvcLvVOt+9mh1S
 C28K1v9Ec8dzsCyFa+umBSrqhbBI9NfdIi8AmIQx8FVBsbOF9tzPOXBtapeTHBJNvXuA
 80Q2jBPl3EGSU8Z4b4rAZiiHxol2qAngFIdPYTM8W1jK5VxwidVdapfrQMpkmVMxky4p
 JVaaB8b8H918EQJp+bOpkyd9uMWFCDmqFUTvPk50xHeueAaJudWhL+q/PsnDQ96RAH02
 J/sqEWOPQ1r6DQrbJozBwvqUZArmDe1pDrS5FoKxfl8ji54sK6X8T6Ddcc6YCyE0Fpdv
 iPGw==
X-Gm-Message-State: AFqh2kqjV+VY8VwxKlzVN3u4rkAIjAYYov/KG2YL/UORaXpxjShS7CMG
 Mmgq28FSVlao7RyIzgD8a7w=
X-Google-Smtp-Source: AMrXdXsxUOH/lAF8WRHYe33yxE8xdirpltA08OXaL7of17FvVtMHNrIjxtHjPmygwWrZSToTHaTKUg==
X-Received: by 2002:a17:906:1410:b0:7c0:eba3:e2e with SMTP id
 p16-20020a170906141000b007c0eba30e2emr2006134ejc.31.1671647024682; 
 Wed, 21 Dec 2022 10:23:44 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 k4-20020aa7c044000000b0046856c307d0sm7388176edo.5.2022.12.21.10.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:23:44 -0800 (PST)
Message-ID: <fc68bedc-ff93-13bc-aa06-7920f5e53de6@gmail.com>
Date: Wed, 21 Dec 2022 19:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 05/12] dt-bindings: usb: convert fcs,fusb302.txt to yaml
To: heiko@sntech.de
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert fcs,fusb302.txt to yaml.

Changed:
  Add vbus-supply property

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/usb/fcs,fusb302.txt   | 34 ----------
 .../devicetree/bindings/usb/fcs,fusb302.yaml  | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 34 deletions(-)
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
index 000000000..9b172fda9
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.yaml
@@ -0,0 +1,66 @@
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
+      fusb302: typec-portc@54 {
+        compatible = "fcs,fusb302";
+        reg = <0x54>;
+        interrupt-parent = <&nmi_intc>;
+        interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+        vbus-supply = <&vbus_typec>;
+
+        usb_con: connector {
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

