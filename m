Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF291BEED8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 06:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95C96EA8F;
	Thu, 30 Apr 2020 04:00:38 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5FA6EA8F
 for <dri-devel@freedesktop.org>; Thu, 30 Apr 2020 04:00:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588219236; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=h4kCJNETn7m8Ad7wR1nijxpoOjZhXlKIL1/i8b1sVbg=;
 b=da5VOsnH8SjmBuKe7biEzCO5xrIywZl/YbpMRgaOEzy5q4mcBHHcAE0dIu4sW4nCbkcioC1G
 vpKSwiSb7qAmxmWslZZhXP/mBcFLQF0DNEz3uMF6NxwmNDoy1wFTQDWPlbC4CYurvfL5T6Of
 K8eJf94ScWSzaLca5KFQng6rBWw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaa4d44.7fd35ec48dc0-smtp-out-n02;
 Thu, 30 Apr 2020 04:00:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 37AAAC44788; Thu, 30 Apr 2020 04:00:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B895DC433D2;
 Thu, 30 Apr 2020 03:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B895DC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: arm-smmu: Add sc7180 compatible string and
 mem_iface clock
Date: Thu, 30 Apr 2020 09:29:47 +0530
Message-Id: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
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
Cc: saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 robin.murphy@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a new compatible string for sc7180 and also an
additional clock listing needed to power the TBUs and the TCU.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
v2: Addressed review comments from Doug

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6515dbe..ba5dba4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
+              - qcom,sc7180-smmu-v2
               - qcom,sdm845-smmu-v2
           - const: qcom,smmu-v2

@@ -113,16 +114,23 @@ properties:
       present in such cases.

   clock-names:
+    minItems: 2
+    maxItems: 3
     items:
       - const: bus
       - const: iface
+      - const: mem_iface

   clocks:
+    minItems: 2
+    maxItems: 3
     items:
       - description: bus clock required for downstream bus access and for the
           smmu ptw
       - description: interface clock required to access smmu's registers
           through the TCU's programming interface.
+      - description: clock required for the inner working of SMMU TBUs and the
+          TCU like the pagetable walks and the TLB flushes.

   power-domains:
     maxItems: 1
--
1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
