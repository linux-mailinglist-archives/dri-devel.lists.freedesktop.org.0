Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDCD1B671B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590EB6EA3D;
	Thu, 23 Apr 2020 22:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0AA6E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:34:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587656065; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=c60sDXlBNEoK7Y04Iypm9ZERS99PDjwjUDg2EmJspSo=;
 b=GGAdEg5BfYut9wMf/YDQcJwQ11/iu9xKhpN+ipGYFNezic2t6e7StKyUSoH7c1MStMh6i3PN
 4g7gRhqTnjgbLaQfWwnxzHKv0NSqs9Sr2xd144KLtYAfnl9BxnevehRf0lns3wvYZcBqbpnz
 vUAsXzQ/jBdcnxQXL2C/cHi576o=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b57e.7f51b2a31768-smtp-out-n03;
 Thu, 23 Apr 2020 15:34:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0A6D2C44788; Thu, 23 Apr 2020 15:34:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03296C433D2;
 Thu, 23 Apr 2020 15:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03296C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kgunda@codeaurora.org
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, robh@kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings to
 .yaml format
Date: Thu, 23 Apr 2020 21:03:34 +0530
Message-Id: <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the qcom-wled bindings from .txt to .yaml format.
Also replace PM8941 to WLED3 and PMI8998 to WLED4.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 .../bindings/leds/backlight/qcom-wled.txt          | 154 ---------------
 .../bindings/leds/backlight/qcom-wled.yaml         | 208 +++++++++++++++++++++
 2 files changed, 208 insertions(+), 154 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
deleted file mode 100644
index c06863b..0000000
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
+++ /dev/null
@@ -1,154 +0,0 @@
-Binding for Qualcomm Technologies, Inc. WLED driver
-
-WLED (White Light Emitting Diode) driver is used for controlling display
-backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
-platforms. The PMIC is connected to the host processor via SPMI bus.
-
-- compatible
-	Usage:        required
-	Value type:   <string>
-	Definition:   should be one of:
-			"qcom,pm8941-wled"
-			"qcom,pmi8998-wled"
-			"qcom,pm660l-wled"
-
-- reg
-	Usage:        required
-	Value type:   <prop encoded array>
-	Definition:   Base address of the WLED modules.
-
-- default-brightness
-	Usage:        optional
-	Value type:   <u32>
-	Definition:   brightness value on boot, value from: 0-4095.
-		      Default: 2048
-
-- label
-	Usage:        required
-	Value type:   <string>
-	Definition:   The name of the backlight device
-
-- qcom,cs-out
-	Usage:        optional
-	Value type:   <bool>
-	Definition:   enable current sink output.
-		      This property is supported only for PM8941.
-
-- qcom,cabc
-	Usage:        optional
-	Value type:   <bool>
-	Definition:   enable content adaptive backlight control.
-
-- qcom,ext-gen
-	Usage:        optional
-	Value type:   <bool>
-	Definition:   use externally generated modulator signal to dim.
-		      This property is supported only for PM8941.
-
-- qcom,current-limit
-	Usage:        optional
-	Value type:   <u32>
-	Definition:   mA; per-string current limit; value from 0 to 25 with
-		      1 mA step. Default 20 mA.
-		      This property is supported only for pm8941.
-
-- qcom,current-limit-microamp
-	Usage:        optional
-	Value type:   <u32>
-	Definition:   uA; per-string current limit; value from 0 to 30000 with
-		      2500 uA step. Default 25 mA.
-
-- qcom,current-boost-limit
-	Usage:        optional
-	Value type:   <u32>
-	Definition:   mA; boost current limit.
-		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
-		      1680. Default: 805 mA.
-		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
-		      1500. Default: 970 mA.
-
-- qcom,switching-freq
-	Usage:        optional
-	Value type:   <u32>
-	 Definition:   kHz; switching frequency; one of: 600, 640, 685, 738,
-		       800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
-		       4800, 9600.
-		       Default: for pm8941: 1600 kHz
-				for pmi8998: 800 kHz
-
-- qcom,ovp
-	Usage:        optional
-	Value type:   <u32>
-	Definition:   V; Over-voltage protection limit; one of:
-		      27, 29, 32, 35. Default: 29V
-		      This property is supported only for PM8941.
-
-- qcom,ovp-millivolt
-	Usage:        optional
-	Value type:   <u32>
-	Definition:   mV; Over-voltage protection limit;
-		      For pmi8998: one of 18100, 19600, 29600, 31100.
-		      Default 29600 mV.
-		      If this property is not specified for PM8941, it
-		      falls back to "qcom,ovp" property.
-
-- qcom,num-strings
-	Usage:        optional
-	Value type:   <u32>
-	Definition:   #; number of led strings attached;
-		      value: For PM8941 from 1 to 3. Default: 2
-			     For PMI8998 from 1 to 4.
-
-- interrupts
-	Usage:        optional
-	Value type:   <prop encoded array>
-	Definition:   Interrupts associated with WLED. This should be
-		      "short" and "ovp" interrupts. Interrupts can be
-		      specified as per the encoding listed under
-		      Documentation/devicetree/bindings/spmi/
-		      qcom,spmi-pmic-arb.txt.
-
-- interrupt-names
-	Usage:        optional
-	Value type:   <string>
-	Definition:   Interrupt names associated with the interrupts.
-		      Must be "short" and "ovp". The short circuit detection
-		      is not supported for PM8941.
-
-- qcom,enabled-strings
-	Usage:        optional
-	Value tyoe:   <u32 array>
-	Definition:   Array of the WLED strings numbered from 0 to 3. Each
-		      string of leds are operated individually. Specify the
-		      list of strings used by the device. Any combination of
-		      led strings can be used.
-
-- qcom,external-pfet
-	Usage:        optional
-	Value type:   <bool>
-	Definition:   Specify if external PFET control for short circuit
-		      protection is used. This property is supported only
-		      for PMI8998.
-
-- qcom,auto-string-detection
-	Usage:        optional
-	Value type:   <bool>
-	Definition:   Enables auto-detection of the WLED string configuration.
-		      This feature is not supported for PM8941.
-
-
-Example:
-
-pm8941-wled@d800 {
-	compatible = "qcom,pm8941-wled";
-	reg = <0xd800>;
-	label = "backlight";
-
-	qcom,cs-out;
-	qcom,current-limit = <20>;
-	qcom,current-boost-limit = <805>;
-	qcom,switching-freq = <1600>;
-	qcom,ovp = <29>;
-	qcom,num-strings = <2>;
-	qcom,enabled-strings = <0 1>;
-};
diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
new file mode 100644
index 0000000..b835443b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for Qualcomm Technologies, Inc. WLED driver
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Kiran Gunda <kgunda@codeaurora.org>
+
+description: |
+  WLED (White Light Emitting Diode) driver is used for controlling display
+  backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
+  platforms. The PMIC is connected to the host processor via SPMI bus.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8941-wled
+      - qcom,pmi8998-wled
+      - qcom,pm660l-wled
+
+  reg:
+    maxItems: 1
+
+  default-brightness:
+    description: |
+      brightness value on boot.
+    minimum: 0
+    maximum: 4095
+    default: 2048
+
+  label: true
+
+  qcom,cs-out:
+    description: |
+      enable current sink output.
+      This property is supported only for WLED3.
+    type: boolean
+
+  qcom,cabc:
+    description: |
+      enable content adaptive backlight control.
+    type: boolean
+
+  qcom,ext-gen:
+    description: |
+      use externally generated modulator signal to dim.
+      This property is supported only for WLED3.
+    type: boolean
+
+  qcom,current-limit:
+    description: |
+      mA; per-string current limit.
+      This property is supported only for WLED3.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    default: 20
+    minimum: 0
+    maximum: 25
+
+  qcom,current-limit-microamp:
+    description: |
+      uA; per-string current limit.
+    default: 25
+    minimum: 0
+    maximum: 30000
+    multipleOf: 25
+
+  qcom,current-boost-limit:
+    description: |
+      mA; boost current limit.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,switching-freq:
+    description: |
+      kHz; switching frequency.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200, 4800, 9600 ]
+
+  qcom,ovp:
+    description: |
+      V; Over-voltage protection limit.
+      This property is supported only for WLED3.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 27, 29, 32, 35 ]
+      - default: 29
+
+  qcom,ovp-millivolt:
+    description: |
+      Over-voltage protection limit. This property is for WLED4 only.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 18100, 19600, 29600, 31100 ]
+      - default: 29600
+
+  qcom,num-strings:
+    description: |
+      number of led strings attached.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,enabled-strings:
+    description: |
+      Array of the WLED strings numbered from 0 to 3. Each
+      string of leds are operated individually. Specify the
+      list of strings used by the device. Any combination of
+      led strings can be used.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+
+  qcom,external-pfet:
+    description: |
+      Specify if external PFET control for short circuit
+      protection is used. This property is supported only
+      for WLED4.
+    type: boolean
+
+  qcom,auto-string-detection:
+    description: |
+      Enables auto-detection of the WLED string configuration.
+      This feature is not supported for WLED3.
+    type: boolean
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: over voltage protection interrupt.
+      - description: short circuit interrupt.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: ovp
+      - const: short
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pm8941-wled
+
+    then:
+      properties:
+        qcom,current-boost-limit:
+          enum: [ 105, 385, 525, 805, 980, 1260, 1400, 1680 ]
+          default: 805
+
+        qcom,switching-freq:
+          default: 1600
+
+        qcom,num-strings:
+          enum: [ 1, 2, 3 ]
+
+        interrupts:
+          maxItems: 1
+
+        interrupt-names:
+          maxItems: 1
+
+    else:
+      properties:
+        qcom,current-boost-limit:
+          enum: [ 105, 280, 450, 620, 970, 1150, 1300, 1500 ]
+          default: 970
+
+        qcom,switching-freq:
+          default: 800
+
+        qcom,num-strings:
+          enum: [ 1, 2, 3, 4 ]
+
+        interrupts:
+          minItems: 2
+
+        interrupt-names:
+          minItems: 2
+
+required:
+  - compatible
+  - reg
+  - label
+
+additionalProperties: false
+
+examples:
+  - |
+    backlight@d800 {
+        compatible = "qcom,pm8941-wled";
+        reg = <0xd800 0x100>;
+        label = "backlight";
+
+        qcom,cs-out;
+        qcom,current-limit = <20>;
+        qcom,current-boost-limit = <805>;
+        qcom,switching-freq = <1600>;
+        qcom,ovp = <29>;
+        qcom,num-strings = <2>;
+        qcom,enabled-strings = <0 1>;
+     };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
