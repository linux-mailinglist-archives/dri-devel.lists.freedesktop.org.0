Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9F619072B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD4D6E44F;
	Tue, 24 Mar 2020 08:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1686E3B0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 17:47:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584985676; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FHCIE9pVij43Bvdm5jn6UC/e3wsml/qXvMbN4wAr6KU=;
 b=Q/z16VXtkff7L8dZVuMY9eUOA6kvGQfZvUU5s/RjEnPEhXeMVZsYV96ic8jhfAGTrcV2j5JI
 FhTyAjYvurbnnfGRCMO/ez0aF1NXpQwGfAZSCnB/oHJ4ch5gfgc28B2obSV4tXLK0NlEggBy
 LF+vlwjJi7mCXDqIr2db8O+lVms=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e78f64a.7efbf9788fb8-smtp-out-n01;
 Mon, 23 Mar 2020 17:47:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A6152C433D2; Mon, 23 Mar 2020 17:47:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AB8B8C432C2;
 Mon, 23 Mar 2020 17:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB8B8C432C2
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
Subject: [PATCH V4 3/4] backlight: qcom-wled: Add WLED5 bindings
Date: Mon, 23 Mar 2020 23:16:57 +0530
Message-Id: <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
 .../bindings/leds/backlight/qcom-wled.yaml         | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 8a388bf..159115f 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -20,6 +20,7 @@ properties:
        - qcom,pm8941-wled
        - qcom,pmi8998-wled
        - qcom,pm660l-wled
+       - qcom,pm8150l-wled
 
   reg:
     maxItems: 1
@@ -28,10 +29,23 @@ properties:
     maxItems: 1
     description:
       brightness value on boot, value from 0-4095.
+      For pm8150l this value vary from 0-4095 or 0-32767
+      depending on the brightness control mode. If CABC is
+      enabled 0-4095 range is used.
     allOf:
       - $ref: /schemas/types.yaml#/definitions/uint32
         default: 2048
 
+  max-brightness:
+    maxItems: 1
+    description:
+      Maximum brightness level. Allowed values are,
+      for pmi8998 it is  0-4095.
+      For pm8150l, this can be either 4095 or 32767.
+      If CABC is enabled, this is capped to 4095.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
   label:
     maxItems: 1
     description:
@@ -124,6 +138,31 @@ properties:
       value for PM8941 from 1 to 3. Default 2
       For PMI8998 from 1 to 4.
 
+  qcom,modulator-sel:
+    maxItems: 1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the modulator used for brightness modulation.
+      Allowed values are,
+               0 - Modulator A
+               1 - Modulator B
+      If not specified, then modulator A will be used by default.
+      This property is applicable only to WLED5 peripheral.
+
+  qcom,cabc-sel:
+    maxItems: 1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the CABC pin signal used for brightness modulation.
+      Allowed values are,
+              0 - CABC disabled
+              1 - CABC 1
+              2 - CABC 2
+              3 - External signal (e.g. LPG) is used for dimming
+      This property is applicable only to WLED5 peripheral.
+
   interrupts:
     maxItems: 2
     description:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
