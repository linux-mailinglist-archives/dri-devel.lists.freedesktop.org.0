Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E352927FD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 15:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7099F6E97F;
	Mon, 19 Oct 2020 13:15:07 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A566E986
 for <dri-devel@freedesktop.org>; Mon, 19 Oct 2020 13:15:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603113306; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=EDT6u1q6ACEvrBc2BppeDYMdoHFAYde7oPctSzlqmv4=;
 b=Jh+tSGTInYWgFwFQzCIHGwFfHVsxDS2omfGKgzeMxnJ0pCn60BT6Xyy0tZCv7d8tIeEbC2vI
 tj8HPI6z8/3dd8PSCSestCpRt4OUx75Nx31WlIquSIDlVkyyCy5cfutLCKPCaUGnvJF5V5nn
 FBR8bukOohpcIAuJ72m+FFcUnP8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f8d914ae9e942744c17efb8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 13:14:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F0D6C433AD; Mon, 19 Oct 2020 13:14:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4E74C433FF;
 Mon, 19 Oct 2020 13:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E4E74C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: drm/msm/gpu: Add cooling device support
Date: Mon, 19 Oct 2020 18:44:28 +0530
Message-Id: <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603113268-21161-1-git-send-email-akhilpo@codeaurora.org>
References: <1603113268-21161-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cooling device support to gpu. A cooling device is bound to a
thermal zone to allow thermal mitigation.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 1af0ff1..a496381 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -39,6 +39,10 @@ Required properties:
         a4xx Snapdragon SoCs. See
         Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
 
+Optional properties:
+- #cooling-cells: The value must be 2. Please refer
+	Documentation/devicetree/bindings/thermal/thermal.txt for detail.
+
 Example 3xx/4xx:
 
 / {
@@ -61,6 +65,7 @@ Example 3xx/4xx:
 		power-domains = <&mmcc OXILICX_GDSC>;
 		operating-points-v2 = <&gpu_opp_table>;
 		iommus = <&gpu_iommu 0>;
+		#cooling-cells = <2>;
 	};
 
 	gpu_sram: ocmem@fdd00000 {
@@ -98,6 +103,8 @@ Example a6xx (with GMU):
 		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
 		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
 
+		#cooling-cells = <2>;
+
 		/*
 		 * Look ma, no clocks! The GPU clocks and power are
 		 * controlled entirely by the GMU
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
