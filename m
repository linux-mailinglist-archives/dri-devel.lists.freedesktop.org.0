Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328BF7AE79B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31410E364;
	Tue, 26 Sep 2023 08:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DF210E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89E6C61326
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D96C433C8;
 Tue, 26 Sep 2023 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716030;
 bh=Y3Kww83IPJHuqjpVOClGOuciaIoTdLgIMjwrVTvKf5M=;
 h=From:To:Subject:Date:From;
 b=Rn5a+7AspmfXtoTSHXsUAzLzVE3YayWoPPQWyhlOx5inRPFJ7GARtANtPTanzv3ez
 PJFYWbji1Of41+wCUrv2iDqD77AMMP8A/cywW/coreI1znXQub64I5YRG9jHeZdeg2
 BgtYBPbAxeC9Fn3Caab/s3AYdYmS8rTwJZdtZ2TWzDkj8xHXrPPLh53pEa/M2USDu5
 +EksIkmCgaZafY2oynlt9bjgM7i9igGIvGf6vhlWZP6QLrxB+E2T5i0IbtqcTOcXWA
 z3bLxKDJbUbhyzpu/yFffCdnUlFy0mu2WG/Dswz3K0JPxd8UohqXDWnwo9BtxKWRrv
 FKD7PSFRYG3lA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] accel/habanalabs: minor cosmetics update to cpucp_if.h
Date: Tue, 26 Sep 2023 11:13:37 +0300
Message-Id: <20230926081345.240927-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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

- Update copyright years
- Align comments

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 include/linux/habanalabs/cpucp_if.h | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/linux/habanalabs/cpucp_if.h b/include/linux/habanalabs/cpucp_if.h
index 84d74c4ee4d3..86ea7c63a0d2 100644
--- a/include/linux/habanalabs/cpucp_if.h
+++ b/include/linux/habanalabs/cpucp_if.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright 2020-2022 HabanaLabs, Ltd.
+ * Copyright 2020-2023 HabanaLabs, Ltd.
  * All Rights Reserved.
  *
  */
@@ -668,18 +668,15 @@ enum pq_init_status {
  *       Obsolete.
  *
  * CPUCP_PACKET_GENERIC_PASSTHROUGH -
- *      Generic opcode for all firmware info that is only passed to host
- *      through the LKD, without getting parsed there.
+ *       Generic opcode for all firmware info that is only passed to host
+ *       through the LKD, without getting parsed there.
  *
  * CPUCP_PACKET_ACTIVE_STATUS_SET -
  *       LKD sends FW indication whether device is free or in use, this indication is reported
  *       also to the BMC.
  *
- * CPUCP_PACKET_REGISTER_INTERRUPTS -
- *       Packet to register interrupts indicating LKD is ready to receive events from FW.
- *
  * CPUCP_PACKET_SOFT_RESET -
- *      Packet to perform soft-reset.
+ *       Packet to perform soft-reset.
  *
  * CPUCP_PACKET_INTS_REGISTER -
  *       Packet to inform FW that queues have been established and LKD is ready to receive
@@ -750,9 +747,9 @@ enum cpucp_packet_id {
 	CPUCP_PACKET_RESERVED11,		/* not used */
 	CPUCP_PACKET_RESERVED12,		/* internal */
 	CPUCP_PACKET_RESERVED13,                /* internal */
-	CPUCP_PACKET_SOFT_RESET,                /* internal */
-	CPUCP_PACKET_INTS_REGISTER,             /* internal */
-	CPUCP_PACKET_ID_MAX                     /* must be last */
+	CPUCP_PACKET_SOFT_RESET,		/* internal */
+	CPUCP_PACKET_INTS_REGISTER,		/* internal */
+	CPUCP_PACKET_ID_MAX			/* must be last */
 };
 
 #define CPUCP_PACKET_FENCE_VAL	0xFE8CE7A5
-- 
2.34.1

