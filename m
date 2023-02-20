Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58A669C78F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 10:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF04110E62B;
	Mon, 20 Feb 2023 09:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7B610E62B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 09:19:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2BEC60CA3;
 Mon, 20 Feb 2023 09:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82723C433EF;
 Mon, 20 Feb 2023 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676884785;
 bh=r0xDHBJceeddksXLSeSnGYYc+XcC31oPO32xYhBo70A=;
 h=From:To:Cc:Subject:Date:From;
 b=CHnWs/twTMVnJ3jXTzgvFwcmH1d7TsoMSNUdg+YDtkBFtYPP/gzuLITgZC9+75fHT
 HKmG3shs3GOCJMx1iOopyWjcBBKq/BNL1SdWSY8+rz9vowEZ338x2HoxPtNGeki5VL
 oy0gbC1fv18/WZMT5eIDIBviVLSIkRVCmmEirZqwN4fqWZemG7bKUxDmenCiDAUPpe
 xnH9KkV5pqiTAlXnXRYZUze8vc4oJQ1z5UUMXuQzWfofNETpcbpdE55pLqV6XL9NGn
 9UcV5l2iknkLvM3SeCV7m3hnUpc5zMRc5+ilVixhe2IYOv2osDY15mGww/IkFdOVEr
 +o7wQUT/u2XlQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] habanalabs: organize hl_device structure comment
Date: Mon, 20 Feb 2023 11:19:36 +0200
Message-Id: <20230220091939.3467487-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Sagiv Ozeri <sozeri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sagiv Ozeri <sozeri@habana.ai>

Make the comments align with the order of the fields in the structure

Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 7b6b4ff20a3b..de4ff525cbcb 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3296,6 +3296,8 @@ struct hl_reset_info {
  * @supports_mmu_prefetch: true if prefetch is supported, otherwise false.
  * @reset_upon_device_release: reset the device when the user closes the file descriptor of the
  *                             device.
+ * @supports_ctx_switch: true if a ctx switch is required upon first submission.
+ * @support_preboot_binning: true if we support read binning info from preboot.
  * @nic_ports_mask: Controls which NIC ports are enabled. Used only for testing.
  * @fw_components: Controls which f/w components to load to the device. There are multiple f/w
  *                 stages and sometimes we want to stop at a certain stage. Used only for testing.
@@ -3309,8 +3311,6 @@ struct hl_reset_info {
  *                         Used only for testing.
  * @heartbeat: Controls if we want to enable the heartbeat mechanism vs. the f/w, which verifies
  *             that the f/w is always alive. Used only for testing.
- * @supports_ctx_switch: true if a ctx switch is required upon first submission.
- * @support_preboot_binning: true if we support read binning info from preboot.
  */
 struct hl_device {
 	struct pci_dev			*pdev;
@@ -3457,7 +3457,7 @@ struct hl_device {
 	u8				supports_ctx_switch;
 	u8				support_preboot_binning;
 
-	/* Parameters for bring-up */
+	/* Parameters for bring-up to be upstreamed */
 	u64				nic_ports_mask;
 	u64				fw_components;
 	u8				mmu_enable;
-- 
2.25.1

