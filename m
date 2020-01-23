Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287F14626D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 08:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3811C6FB0A;
	Thu, 23 Jan 2020 07:19:24 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1D6F9B7
 for <dri-devel@freedesktop.org>; Thu, 23 Jan 2020 07:19:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579763962; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GEgbDb1BS32ifGcjv9cWytEuOjIKz9pOs581KwKPxxI=;
 b=qR0crKU8FekWiTzcDIIQxvi8Vygd22XbVABe1a29/KOLkr8yzpCFpwyYsY9l2Vizi8kZqia5
 l9p3iJQUwhHgW5Yh3BGSIQrdLMCeuv2Nmq50s63D+86Q2Bh10FMRD7srNQjBeCSueYbGcuNt
 aLBviqw01XLXSjRAa0hiGkyN1FU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2948f3.7fdd7ce35928-smtp-out-n01;
 Thu, 23 Jan 2020 07:19:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 84BF0C433A2; Thu, 23 Jan 2020 07:19:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2622CC43383;
 Thu, 23 Jan 2020 07:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2622CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm: msm: Add 618 gpu to the adreno gpu list
Date: Thu, 23 Jan 2020 12:49:03 +0530
Message-Id: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
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
Cc: Sharat Masetty <smasetty@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds Adreno 618 entry and its associated properties
to the gpulist entries.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fbbdf86..cb3a6e5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -167,6 +167,17 @@
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
 	}, {
+		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
+		.revn = 618,
+		.name = "A618",
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
 		.revn = 630,
 		.name = "A630",
-- 
1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
