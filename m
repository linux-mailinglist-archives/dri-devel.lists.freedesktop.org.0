Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC896C0068
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC9610E166;
	Sun, 19 Mar 2023 09:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BA510E166
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:41:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F6D060F52;
 Sun, 19 Mar 2023 09:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2179C433EF;
 Sun, 19 Mar 2023 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679218913;
 bh=SVXHTnqcsoEfENHgOOUxqCsfPNAgTZAmaLYepi9QE8E=;
 h=From:To:Cc:Subject:Date:From;
 b=UhgM5d+598LlWKxbwj8zv9LC+ChsMl2zeeXUGMgbg0lN1rdyC243URAEtVE4+Crbi
 RDeoup+zmRJCLxHqPuuJuaSrzw/ROz11Y5224umomXxgxMY9yone07SKLnsAeZYihN
 eSczdPA8j0RwLCb/EGcD0FTnXmY9TWah2zoe+kD+Hfoqw9BIchx6Lrjt6WaoziUh6P
 Bp6NM74Fuku+7RBCALMOgneiMIh9JKMXsZDnhwmhDL5ttOL8/qigDVuKTUlzJBbT7G
 7q44mzZnzOB9BanZ2xYcAALLgPWgXdtei4zIQfGqlsF/EXv5pKKfXWOI1ELRgEvPHB
 cCxq+NoYKMHNg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] accel/habanalabs: regenerate gaudi2 ids_map_extended
Date: Sun, 19 Mar 2023 11:41:45 +0200
Message-Id: <20230319094148.680750-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ohad Sharabi <osharabi@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ohad Sharabi <osharabi@habana.ai>

Some names of events has been modified/added.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../gaudi2/gaudi2_async_ids_map_extended.h    | 76 +++++++++----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
index da0435581d61..ad01fc4e9940 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
@@ -318,37 +318,37 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 	{ .fc_id = 143, .cpu_id = 47, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "MME3_WAP_ECC_DERR" },
 	{ .fc_id = 144, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA2_ECC_SERR" },
+		 .name = "EDMA2_ECC_SERR" },
 	{ .fc_id = 145, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA3_ECC_SERR" },
+		 .name = "EDMA3_ECC_SERR" },
 	{ .fc_id = 146, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA0_ECC_SERR" },
+		 .name = "EDMA0_ECC_SERR" },
 	{ .fc_id = 147, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA1_ECC_SERR" },
+		 .name = "EDMA1_ECC_SERR" },
 	{ .fc_id = 148, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA6_ECC_SERR" },
+		 .name = "EDMA6_ECC_SERR" },
 	{ .fc_id = 149, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA7_ECC_SERR" },
+		 .name = "EDMA7_ECC_SERR" },
 	{ .fc_id = 150, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "HDMA4_ECC_SERR" },
 	{ .fc_id = 151, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "HDMA5_ECC_SERR" },
 	{ .fc_id = 152, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA2_ECC_DERR" },
+		 .name = "EDMA2_ECC_DERR" },
 	{ .fc_id = 153, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA3_ECC_DERR" },
+		 .name = "EDMA3_ECC_DERR" },
 	{ .fc_id = 154, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA0_ECC_DERR" },
+		 .name = "EDMA0_ECC_DERR" },
 	{ .fc_id = 155, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA1_ECC_DERR" },
+		 .name = "EDMA1_ECC_DERR" },
 	{ .fc_id = 156, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA6_ECC_DERR" },
+		 .name = "EDMA6_ECC_DERR" },
 	{ .fc_id = 157, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA7_ECC_DERR" },
+		 .name = "EDMA7_ECC_DERR" },
 	{ .fc_id = 158, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA4_ECC_DERR" },
+		 .name = "EDMA4_ECC_DERR" },
 	{ .fc_id = 159, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
-		 .name = "HDMA5_ECC_DERR" },
+		 .name = "EDMA5_ECC_DERR" },
 	{ .fc_id = 160, .cpu_id = 50, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "KDMA0_ECC_SERR" },
 	{ .fc_id = 161, .cpu_id = 51, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
@@ -1570,35 +1570,35 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 	{ .fc_id = 769, .cpu_id = 202, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PMMU0_SECURITY_ERROR" },
 	{ .fc_id = 770, .cpu_id = 203, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA2_BM_SPMU" },
+		 .name = "EDMA2_BM_SPMU" },
 	{ .fc_id = 771, .cpu_id = 204, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 772, .cpu_id = 205, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA3_BM_SPMU" },
+		 .name = "EDMA3_BM_SPMU" },
 	{ .fc_id = 773, .cpu_id = 206, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 774, .cpu_id = 207, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA0_BM_SPMU" },
+		 .name = "EDMA0_BM_SPMU" },
 	{ .fc_id = 775, .cpu_id = 208, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 776, .cpu_id = 209, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA1_BM_SPMU" },
+		 .name = "EDMA1_BM_SPMU" },
 	{ .fc_id = 777, .cpu_id = 210, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 778, .cpu_id = 211, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA6_BM_SPMU" },
+		 .name = "EDMA6_BM_SPMU" },
 	{ .fc_id = 779, .cpu_id = 212, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 780, .cpu_id = 213, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA7_BM_SPMU" },
+		 .name = "EDMA7_BM_SPMU" },
 	{ .fc_id = 781, .cpu_id = 214, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 782, .cpu_id = 215, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA4_BM_SPMU" },
+		 .name = "EDMA4_BM_SPMU" },
 	{ .fc_id = 783, .cpu_id = 216, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 784, .cpu_id = 217, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA5_BM_SPMU" },
+		 .name = "EDMA5_BM_SPMU" },
 	{ .fc_id = 785, .cpu_id = 218, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 786, .cpu_id = 219, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
@@ -2502,21 +2502,21 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 	{ .fc_id = 1235, .cpu_id = 541, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
 		 .name = "MME3_QM" },
 	{ .fc_id = 1236, .cpu_id = 542, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA2_QM" },
+		 .name = "EDMA2_QM" },
 	{ .fc_id = 1237, .cpu_id = 543, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA3_QM" },
+		 .name = "EDMA3_QM" },
 	{ .fc_id = 1238, .cpu_id = 544, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA0_QM" },
+		 .name = "EDMA0_QM" },
 	{ .fc_id = 1239, .cpu_id = 545, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA1_QM" },
+		 .name = "EDMA1_QM" },
 	{ .fc_id = 1240, .cpu_id = 546, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA6_QM" },
+		 .name = "EDMA6_QM" },
 	{ .fc_id = 1241, .cpu_id = 547, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA7_QM" },
+		 .name = "EDMA7_QM" },
 	{ .fc_id = 1242, .cpu_id = 548, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA4_QM" },
+		 .name = "EDMA4_QM" },
 	{ .fc_id = 1243, .cpu_id = 549, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA5_QM" },
+		 .name = "EDMA5_QM" },
 	{ .fc_id = 1244, .cpu_id = 550, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
 		 .name = "PDMA0_QM" },
 	{ .fc_id = 1245, .cpu_id = 551, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
@@ -2548,21 +2548,21 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 	{ .fc_id = 1258, .cpu_id = 564, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PKT_QUEUE_OUT_SYNC" },
 	{ .fc_id = 1259, .cpu_id = 565, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA2_CORE" },
+		 .name = "EDMA2_CORE" },
 	{ .fc_id = 1260, .cpu_id = 566, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA3_CORE" },
+		 .name = "EDMA3_CORE" },
 	{ .fc_id = 1261, .cpu_id = 567, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA0_CORE" },
+		 .name = "EDMA0_CORE" },
 	{ .fc_id = 1262, .cpu_id = 568, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA1_CORE" },
+		 .name = "EDMA1_CORE" },
 	{ .fc_id = 1263, .cpu_id = 569, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA6_CORE" },
+		 .name = "EDMA6_CORE" },
 	{ .fc_id = 1264, .cpu_id = 570, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA7_CORE" },
+		 .name = "EDMA7_CORE" },
 	{ .fc_id = 1265, .cpu_id = 571, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA4_CORE" },
+		 .name = "EDMA4_CORE" },
 	{ .fc_id = 1266, .cpu_id = 572, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "HDMA5_CORE" },
+		 .name = "EDMA5_CORE" },
 	{ .fc_id = 1267, .cpu_id = 573, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
 		 .name = "PDMA0_CORE" },
 	{ .fc_id = 1268, .cpu_id = 574, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_COMPUTE,
-- 
2.40.0

