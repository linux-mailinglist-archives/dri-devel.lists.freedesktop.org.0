Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B521535CE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CED26F8C0;
	Wed,  5 Feb 2020 17:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9816F8B8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:01:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580922097; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7DUhFiRSM+eRxfIS8UQQZG95uYXWL3eYV9xeTSLQqKg=;
 b=eVGUbxzudoH+u0LgPejn6d9BkEHGyNfDxmMQq8kF2TOtjI7m8r4n2AiM8yG5wUXQiUGi7hA5
 aZ4ShbMkKRpkrCd6wP7j9zQ/7mkLa6pDWeeD3aw33n+GUlUkyrzasMzfgcG0WcpAPFUeQvVq
 ygoVtqm0O8NnmomRCU06KbkhS1Y=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3af4eb.7f79dcaa2f48-smtp-out-n02;
 Wed, 05 Feb 2020 17:01:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F1467C433A2; Wed,  5 Feb 2020 17:01:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EF247C43383;
 Wed,  5 Feb 2020 17:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF247C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: Update the GMU bus tables for sc7180
Date: Wed,  5 Feb 2020 10:01:21 -0700
Message-Id: <1580922081-25177-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixup the GMU bus table values for the sc7180 target.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 85 ++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index eda11ab..e450e0b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -7,6 +7,7 @@
 
 #include "a6xx_gmu.h"
 #include "a6xx_gmu.xml.h"
+#include "a6xx_gpu.h"
 
 #define HFI_MSG_ID(val) [val] = #val
 
@@ -216,48 +217,82 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
+static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
-	struct a6xx_hfi_msg_bw_table msg = { 0 };
+	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
+	msg->bw_level_num = 1;
+
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x01;
+
+	msg->ddr_cmds_addrs[0] = 0x50000;
+	msg->ddr_cmds_addrs[1] = 0x5003c;
+	msg->ddr_cmds_addrs[2] = 0x5000c;
+
+	msg->ddr_cmds_data[0][0] =  0x40000000;
+	msg->ddr_cmds_data[0][1] =  0x40000000;
+	msg->ddr_cmds_data[0][2] =  0x40000000;
 
 	/*
-	 * The sdm845 GMU doesn't do bus frequency scaling on its own but it
-	 * does need at least one entry in the list because it might be accessed
-	 * when the GMU is shutting down. Send a single "off" entry.
+	 * These are the CX (CNOC) votes - these are used by the GMU but the
+	 * votes are known and fixed for the target
 	 */
+	msg->cnoc_cmds_num = 1;
+	msg->cnoc_wait_bitmask = 0x01;
+
+	msg->cnoc_cmds_addrs[0] = 0x5007c;
+	msg->cnoc_cmds_data[0][0] =  0x40000000;
+	msg->cnoc_cmds_data[1][0] =  0x60000001;
+}
 
-	msg.bw_level_num = 1;
+static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+{
+	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
+	msg->bw_level_num = 1;
 
-	msg.ddr_cmds_num = 3;
-	msg.ddr_wait_bitmask = 0x07;
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x07;
 
-	msg.ddr_cmds_addrs[0] = 0x50000;
-	msg.ddr_cmds_addrs[1] = 0x5005c;
-	msg.ddr_cmds_addrs[2] = 0x5000c;
+	msg->ddr_cmds_addrs[0] = 0x50000;
+	msg->ddr_cmds_addrs[1] = 0x5005c;
+	msg->ddr_cmds_addrs[2] = 0x5000c;
 
-	msg.ddr_cmds_data[0][0] =  0x40000000;
-	msg.ddr_cmds_data[0][1] =  0x40000000;
-	msg.ddr_cmds_data[0][2] =  0x40000000;
+	msg->ddr_cmds_data[0][0] =  0x40000000;
+	msg->ddr_cmds_data[0][1] =  0x40000000;
+	msg->ddr_cmds_data[0][2] =  0x40000000;
 
 	/*
 	 * These are the CX (CNOC) votes.  This is used but the values for the
 	 * sdm845 GMU are known and fixed so we can hard code them.
 	 */
 
-	msg.cnoc_cmds_num = 3;
-	msg.cnoc_wait_bitmask = 0x05;
+	msg->cnoc_cmds_num = 3;
+	msg->cnoc_wait_bitmask = 0x05;
 
-	msg.cnoc_cmds_addrs[0] = 0x50034;
-	msg.cnoc_cmds_addrs[1] = 0x5007c;
-	msg.cnoc_cmds_addrs[2] = 0x5004c;
+	msg->cnoc_cmds_addrs[0] = 0x50034;
+	msg->cnoc_cmds_addrs[1] = 0x5007c;
+	msg->cnoc_cmds_addrs[2] = 0x5004c;
 
-	msg.cnoc_cmds_data[0][0] =  0x40000000;
-	msg.cnoc_cmds_data[0][1] =  0x00000000;
-	msg.cnoc_cmds_data[0][2] =  0x40000000;
+	msg->cnoc_cmds_data[0][0] =  0x40000000;
+	msg->cnoc_cmds_data[0][1] =  0x00000000;
+	msg->cnoc_cmds_data[0][2] =  0x40000000;
+
+	msg->cnoc_cmds_data[1][0] =  0x60000001;
+	msg->cnoc_cmds_data[1][1] =  0x20000001;
+	msg->cnoc_cmds_data[1][2] =  0x60000001;
+}
+
+
+static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
+{
+	struct a6xx_hfi_msg_bw_table msg = { 0 };
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 
-	msg.cnoc_cmds_data[1][0] =  0x60000001;
-	msg.cnoc_cmds_data[1][1] =  0x20000001;
-	msg.cnoc_cmds_data[1][2] =  0x60000001;
+	if (adreno_is_a618(adreno_gpu))
+		a618_build_bw_table(&msg);
+	else
+		a6xx_build_bw_table(&msg);
 
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, &msg, sizeof(msg),
 		NULL, 0);
-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
