Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6CB1A1C2F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DE16E96B;
	Wed,  8 Apr 2020 06:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C229C6E8A3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 15:48:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586274491; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zJmKM10kCOi3CxoHMeerZ71oCXF92PPozf5dFAnoWi8=;
 b=qd7dcLDbLRcGHcLG+LxlRQIdDcRT8TNFBaS8uKa78tr4Oa++yYI6m7JzwA0md5JQkSplO7fp
 f7yqPZ6nEYYpHkWS/VT3tIYckCwbO1cKFaLfHGw0Vt/xYK2UKX/AXTLzL3hpZkvr1rtA4K5h
 LHSJX/uVG8l6UvpGEuA2XksOr40=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8ca0ab.7f4b2514b2d0-smtp-out-n03;
 Tue, 07 Apr 2020 15:47:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E9363C44795; Tue,  7 Apr 2020 15:47:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CFE48C43637;
 Tue,  7 Apr 2020 15:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFE48C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kgunda@codeaurora.org
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Subject: [PATCH V5 3/4] backlight: qcom-wled: Add WLED5 bindings
Date: Tue,  7 Apr 2020 21:17:09 +0530
Message-Id: <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
X-Mailman-Approved-At: Wed, 08 Apr 2020 06:59:23 +0000
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

Add WLED5 specific bindings.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
---
 .../bindings/leds/backlight/qcom-wled.yaml         | 60 ++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 770e780..5714631 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,pm8941-wled
       - qcom,pmi8998-wled
       - qcom,pm660l-wled
+      - qcom,pm8150l-wled
 
   reg:
     maxItems: 1
@@ -28,12 +29,13 @@ properties:
   default-brightness:
     description:
       brightness value on boot.
-    minimum: 0
-    maximum: 4095
-    default: 2048
 
   label: true
 
+  max-brightness:
+    description:
+      Maximum brightness level.
+
   qcom,cs-out:
     description:
       enable current sink output.
@@ -130,6 +132,31 @@ properties:
       This feature is not supported for WLED3.
     type: boolean
 
+  qcom,modulator-sel:
+    description:
+      Selects the modulator used for brightness modulation.
+      Allowed values are,
+           0 - Modulator A
+           1 - Modulator B
+      This property is applicable only to WLED5 peripheral.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+      - default: 0
+
+  qcom,cabc-sel:
+    description:
+      Selects the CABC pin signal used for brightness modulation.
+      Allowed values are,
+           0 - CABC disabled
+           1 - CABC 1
+           2 - CABC 2
+           3 - External signal (e.g. LPG) is used for dimming
+      This property is applicable only to WLED5 peripheral.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1, 2, 3 ]
+
 allOf:
   - if:
       properties:
@@ -179,6 +206,33 @@ allOf:
             - const: ovp
             - const: short
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8150l-wled
+
+    then:
+      properties:
+        default-brightness:
+          minimum: 0
+          maximum: 32767
+        
+        max-brightness:
+          minimum: 0
+          maximum: 32767
+
+    else:
+      properties:
+        default-brightness:
+            minimum: 0
+            maximum: 4095
+        
+        max-brightness:
+          minimum: 0
+          maximum: 4095
+
 required:
   - compatible
   - reg
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
