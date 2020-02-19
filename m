Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC281651A9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 22:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057C26ECBC;
	Wed, 19 Feb 2020 21:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584FC6ECBD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 21:33:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582148000; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ut8jzi9vRb4lppctqPUVYJg9Q2+ACOmilLmkDbNVngA=;
 b=scycKBIWnaIKIOi8JhAsWDNw9Vn9QY5mV0468X3ECaAW+cPMJ4bS5Ij0Iujm83m0XsCsJzXy
 U1jD11o7voeNYNEzr8i3uNZXRgZAW/HcxupbTIhFtuviCCz/l203wpkG+VkRygV9vuY2TY67
 U2/0BKp2unXlPDGFe+0d11Pw0/A=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4da993.7fc39d6c92d0-smtp-out-n03;
 Wed, 19 Feb 2020 21:33:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E6847C447A0; Wed, 19 Feb 2020 21:33:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 10EEAC4479C;
 Wed, 19 Feb 2020 21:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10EEAC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: display: msm: Add required dma-range
 property
Date: Wed, 19 Feb 2020 14:32:56 -0700
Message-Id: <1582147978-31475-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
References: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GMU node now requires a specific dma-range property so that the driver
can use the DMA API to do the few memory allocations required by the GMU.
This sets the IOMMU iova allocadtor to match the 'uncached' part of the
GMU virtual address space.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 776ff92..6952d5a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -83,6 +83,13 @@ properties:
       Phandle to the OPP table for the available GMU frequencies. Refer to
       ../../opp/opp.txt for more information.
 
+  dma-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Describe the dma-address range for the device. This should always
+      describe the range between 0x60000000 and 0x80000000 which represents
+      the uncached region of the GMU address space.
+
 required:
   - compatible
   - reg
@@ -95,6 +102,7 @@ required:
   - power-domain-names
   - iommus
   - operating-points-v2
+  - dma-ranges
 
 examples:
  - |
@@ -127,4 +135,6 @@ examples:
 
         iommus = <&adreno_smmu 5>;
         operating-points-v2 = <&gmu_opp_table>;
+
+        dma-ranges = <0 0x60000000 0 0x60000000 0 0x80000000>;
    };
-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
