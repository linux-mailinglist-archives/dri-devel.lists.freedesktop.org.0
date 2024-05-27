Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E48CFF40
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 13:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968D410ED7D;
	Mon, 27 May 2024 11:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="q2z6lc32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C2510E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 11:48:05 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716810481; bh=wMKV683tdUXSeWL6//qztdT9QYdnP00891EC9rnPw38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q2z6lc32XsANzKP4xkycrVWuJrdTYtExfaxZ9ZeIeaNDNDeWSdcfnS9uReG8IA5eE
 Ryxr7ORGZTkMDrhg7we/9p+Sfcq+u9yiocbuHiOGtWKl5q0vXNpolOfwFwpdepru/d
 19aZg0dGgEMd/08BrKHWRl11uzKnkk8r0MPM7/ldLUK8Av+zGa3iDX3d+4xko0bLCW
 yW6Zmx+n6p72yCKFb/1Q0l0qjRu98428B7uu4iKK0axuEYecTI1A3nUtTh0wBCstcF
 2MbyKN0X/FvIblqawVQpcJO/vWPZZp+zSfE60FKJoIycpFCPn/oq+bWkgqXRX+IhKq
 CQYofc/XCaHJg==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RBltNg1919357; Mon, 27 May 2024 14:47:55 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 2/9] accel/habanalabs/gaudi2: update interrupts related headers
Date: Mon, 27 May 2024 14:47:39 +0300
Message-Id: <20240527114746.1919292-2-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527114746.1919292-1-obitton@habana.ai>
References: <20240527114746.1919292-1-obitton@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Farah Kassabri <fkassabri@habana.ai>

Align the interrupts related headers to latest release.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 .../gaudi2/gaudi2_async_ids_map_extended.h    | 94 +++++++++----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
index b2dbe1f64430..1db73923de62 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
@@ -330,9 +330,9 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 	{ .fc_id = 149, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "EDMA7_ECC_SERR" },
 	{ .fc_id = 150, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA4_ECC_SERR" },
+		 .name = "EDMA4_ECC_SERR" },
 	{ .fc_id = 151, .cpu_id = 48, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "HDMA5_ECC_SERR" },
+		 .name = "EDMA5_ECC_SERR" },
 	{ .fc_id = 152, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "EDMA2_ECC_DERR" },
 	{ .fc_id = 153, .cpu_id = 49, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
@@ -965,73 +965,73 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 		 .name = "MME3_CTRL_AXI_ERROR_RESPONSE" },
 	{ .fc_id = 467, .cpu_id = 91, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_COMPUTE,
 		 .name = "MME3_QMAN_SW_ERROR" },
-	{ .fc_id = 468, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 468, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PSOC_MME_PLL_LOCK_ERR" },
-	{ .fc_id = 469, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 469, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PSOC_CPU_PLL_LOCK_ERR" },
-	{ .fc_id = 470, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 470, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE3_TPC_PLL_LOCK_ERR" },
-	{ .fc_id = 471, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 471, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE3_NIC_PLL_LOCK_ERR" },
-	{ .fc_id = 472, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 472, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE3_XBAR_MMU_PLL_LOCK_ERR" },
-	{ .fc_id = 473, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 473, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE3_XBAR_DMA_PLL_LOCK_ERR" },
-	{ .fc_id = 474, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 474, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE3_XBAR_IF_PLL_LOCK_ERR" },
-	{ .fc_id = 475, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 475, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE3_XBAR_BANK_PLL_LOCK_ERR" },
-	{ .fc_id = 476, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 476, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_XBAR_MMU_PLL_LOCK_ERR" },
-	{ .fc_id = 477, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 477, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_XBAR_DMA_PLL_LOCK_ERR" },
-	{ .fc_id = 478, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 478, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_XBAR_IF_PLL_LOCK_ERR" },
-	{ .fc_id = 479, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 479, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_XBAR_MESH_PLL_LOCK_ERR" },
-	{ .fc_id = 480, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 480, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_TPC_PLL_LOCK_ERR" },
-	{ .fc_id = 481, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 481, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_NIC_PLL_LOCK_ERR" },
-	{ .fc_id = 482, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 482, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PMMU_MME_PLL_LOCK_ERR" },
-	{ .fc_id = 483, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 483, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE0_TPC_PLL_LOCK_ERR" },
-	{ .fc_id = 484, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 484, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE0_PCI_PLL_LOCK_ERR" },
-	{ .fc_id = 485, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 485, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE0_XBAR_MMU_PLL_LOCK_ERR" },
-	{ .fc_id = 486, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 486, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE0_XBAR_DMA_PLL_LOCK_ERR" },
-	{ .fc_id = 487, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 487, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE0_XBAR_IF_PLL_LOCK_ERR" },
-	{ .fc_id = 488, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 488, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE0_XBAR_MESH_PLL_LOCK_ERR" },
-	{ .fc_id = 489, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 489, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE2_XBAR_MMU_PLL_LOCK_ERR" },
-	{ .fc_id = 490, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 490, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE2_XBAR_DMA_PLL_LOCK_ERR" },
-	{ .fc_id = 491, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 491, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE2_XBAR_IF_PLL_LOCK_ERR" },
-	{ .fc_id = 492, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 492, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE2_XBAR_BANK_PLL_LOCK_ERR" },
-	{ .fc_id = 493, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 493, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE2_TPC_PLL_LOCK_ERR" },
-	{ .fc_id = 494, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 494, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PSOC_VID_PLL_LOCK_ERR" },
-	{ .fc_id = 495, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 495, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PMMU_VID_PLL_LOCK_ERR" },
-	{ .fc_id = 496, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 496, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE3_HBM_PLL_LOCK_ERR" },
-	{ .fc_id = 497, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 497, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_XBAR_HBM_PLL_LOCK_ERR" },
-	{ .fc_id = 498, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 498, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE1_HBM_PLL_LOCK_ERR" },
-	{ .fc_id = 499, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 499, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE0_HBM_PLL_LOCK_ERR" },
-	{ .fc_id = 500, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 500, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE2_XBAR_HBM_PLL_LOCK_ERR" },
-	{ .fc_id = 501, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 501, .cpu_id = 92, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DCORE2_HBM_PLL_LOCK_ERR" },
 	{ .fc_id = 502, .cpu_id = 93, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "CPU_AXI_ERR_RSP" },
@@ -1827,8 +1827,8 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 		 .name = "DEC0_BMON_SPMU" },
 	{ .fc_id = 898, .cpu_id = 330, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_COMPUTE,
 		 .name = "DEC1_SPI" },
-	{ .fc_id = 899, .cpu_id = 330, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_COMPUTE,
-		 .name = "DEC1_SPI" },
+	{ .fc_id = 899, .cpu_id = 330, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "DEC1_BMON_SPMU" },
 	{ .fc_id = 900, .cpu_id = 331, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_COMPUTE,
 		 .name = "DEC2_SPI" },
 	{ .fc_id = 901, .cpu_id = 331, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
@@ -2377,8 +2377,8 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 		 .name = "" },
 	{ .fc_id = 1173, .cpu_id = 479, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
-	{ .fc_id = 1174, .cpu_id = 480, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "" },
+	{ .fc_id = 1174, .cpu_id = 480, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "PSOC_DMA_QM" },
 	{ .fc_id = 1175, .cpu_id = 481, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "" },
 	{ .fc_id = 1176, .cpu_id = 482, .valid = 0, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
@@ -2674,19 +2674,19 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 	{ .fc_id = 1321, .cpu_id = 627, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DEV_RESET_REQ" },
 	{ .fc_id = 1322, .cpu_id = 628, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "ARC_PWR_BRK_ENTRY" },
+		 .name = "PWR_BRK_ENTRY" },
 	{ .fc_id = 1323, .cpu_id = 629, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "ARC_PWR_BRK_EXT" },
+		 .name = "PWR_BRK_EXT" },
 	{ .fc_id = 1324, .cpu_id = 630, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "ARC_PWR_RD_MODE0" },
+		 .name = "PWR_RD_MODE0" },
 	{ .fc_id = 1325, .cpu_id = 631, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "ARC_PWR_RD_MODE1" },
+		 .name = "PWR_RD_MODE1" },
 	{ .fc_id = 1326, .cpu_id = 632, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "ARC_PWR_RD_MODE2" },
+		 .name = "PWR_RD_MODE2" },
 	{ .fc_id = 1327, .cpu_id = 633, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "ARC_PWR_RD_MODE3" },
+		 .name = "PWR_RD_MODE3" },
 	{ .fc_id = 1328, .cpu_id = 634, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
-		 .name = "ARC_EQ_HEARTBEAT" },
+		 .name = "EQ_HEARTBEAT" },
 };
 
 #endif /* __GAUDI2_ASYNC_IDS_MAP_EVENTS_EXT_H_ */
-- 
2.34.1

