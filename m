Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4F6939F2
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16710E47F;
	Sun, 12 Feb 2023 20:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B70010E47B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3966FB80D3A;
 Sun, 12 Feb 2023 20:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F0EC433D2;
 Sun, 12 Feb 2023 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234740;
 bh=laiY+AnXjc4lJpjrfcHOHt9JDiWy9xZoMTV8BTKrWcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dMwt68vKQqMbuR4fhs4p2Hl+nz0Req8Jbowbw2aZvfFdfnIyVQdddG1yroQzSV9pN
 6OmGTU2ZP5TCa9GBYcDknzQqyZlik2X0JvGKwZK2F1lbSO5PqrUtrRfZ+fj4T3U6+z
 DyCRGi3y1scMEPhv/IDZhPfLbNotPQY2vXIxyxz57R8LV/hYalRfZ7WZX1XAHqLmG1
 1q3qyHE2LmgLbUzvwvcfERkQeLLATe6qLi/d5mxQKkHG2ksgjk2dBeFVmX6OnrklVp
 m7G1Ad06toEFEOu4Q+oolsnL3PPYMPf9fJ4jlQ0aS5qxP1I8diRTYwIpw9wNuk421e
 9pzReZjo7i2RQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 24/27] habanalabs: rename security function parameters
Date: Sun, 12 Feb 2023 22:44:51 +0200
Message-Id: <20230212204454.2938561-24-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

To match their description above the function

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/security.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/security.c b/drivers/accel/habanalabs/common/security.c
index 5f03ade07ead..297e6e44fd0c 100644
--- a/drivers/accel/habanalabs/common/security.c
+++ b/drivers/accel/habanalabs/common/security.c
@@ -502,7 +502,7 @@ int hl_init_pb_single_dcore(struct hl_device *hdev, u32 dcore_offset,
 int hl_init_pb_ranges_single_dcore(struct hl_device *hdev, u32 dcore_offset,
 		u32 num_instances, u32 instance_offset,
 		const u32 pb_blocks[], u32 blocks_array_size,
-		const struct range *regs_range_array, u32 regs_range_array_size)
+		const struct range *user_regs_range_array, u32 user_regs_range_array_size)
 {
 	int i;
 	struct hl_block_glbl_sec *glbl_sec;
@@ -514,8 +514,8 @@ int hl_init_pb_ranges_single_dcore(struct hl_device *hdev, u32 dcore_offset,
 		return -ENOMEM;
 
 	hl_secure_block(hdev, glbl_sec, blocks_array_size);
-	hl_unsecure_registers_range(hdev, regs_range_array,
-			regs_range_array_size, 0, pb_blocks, glbl_sec,
+	hl_unsecure_registers_range(hdev, user_regs_range_array,
+			user_regs_range_array_size, 0, pb_blocks, glbl_sec,
 			blocks_array_size);
 
 	/* Fill all blocks with the same configuration */
-- 
2.25.1

