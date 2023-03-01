Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8100B6A6C68
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 13:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF5110E0C5;
	Wed,  1 Mar 2023 12:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE50F10E0BB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 12:34:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E1A0B8102B;
 Wed,  1 Mar 2023 12:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC0BC433EF;
 Wed,  1 Mar 2023 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677674096;
 bh=CDNdwRHOEyT8xJFpmFJlkfYSflUnxA8xUXiCk8FJqFs=;
 h=From:To:Cc:Subject:Date:From;
 b=QiNqQsfXQ371HEIMVcdOnh+XKI7AM44S4p64pfWgPhlViLGYPiCtTHmZ1hM0SEpp8
 qABAwDW5WH73jlWJpB1zdZq4BhtbvW3BrMPbFfsLJbys2ylm4zKgHqIAxvo3AzvoZJ
 WdgpbPbEn+YI6CXBQlt8+mBF6OcmkNGZo8u7beE+X0NlolVsq2TeVvzZCKtcF2utWp
 YvDN1KHVtoCkctTkUguw0zNr11kGziqy+hnf0+rSCKDWdEVTg30AQ/+CcAVbJJ327R
 bUJjvQ1XprVTSN0L4QvHoVetNRKHNwDV8i25NLKNsBaey/PGxnEo9KqXa1qGebAsnC
 4s0Tr9WnM8YlQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] habanalabs: fix few misspelled words in the code
Date: Wed,  1 Mar 2023 14:34:46 +0200
Message-Id: <20230301123450.4127848-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

Run spell checker on the code and fix accordingly.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/command_submission.c | 2 +-
 drivers/accel/habanalabs/common/habanalabs.h         | 4 ++--
 drivers/accel/habanalabs/common/memory.c             | 4 ++--
 drivers/accel/habanalabs/common/memory_mgr.c         | 2 +-
 drivers/accel/habanalabs/common/mmu/mmu.c            | 6 +++---
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c   | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 74ccafeb38dc..2cebc1c47248 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -657,7 +657,7 @@ static inline void cs_release_sob_reset_handler(struct hl_device *hdev,
 	/*
 	 * we get refcount upon reservation of signals or signal/wait cs for the
 	 * hw_sob object, and need to put it when the first staged cs
-	 * (which cotains the encaps signals) or cs signal/wait is completed.
+	 * (which contains the encaps signals) or cs signal/wait is completed.
 	 */
 	if ((hl_cs_cmpl->type == CS_TYPE_SIGNAL) ||
 			(hl_cs_cmpl->type == CS_TYPE_WAIT) ||
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 597c7f1037d1..954e071d7961 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2976,8 +2976,8 @@ struct cs_timeout_info {
  * @cq_addr: the address of the current handled command buffer
  * @cq_size: the size of the current handled command buffer
  * @cb_addr_streams_len: num of streams - actual len of cb_addr_streams array.
- *                       should be equal to 1 incase of undefined opcode
- *                       in Upper-CP (specific stream) and equal to 4 incase
+ *                       should be equal to 1 in case of undefined opcode
+ *                       in Upper-CP (specific stream) and equal to 4 in case
  *                       of undefined opcode in Lower-CP.
  * @engine_id: engine-id that the error occurred on
  * @stream_id: the stream id the error occurred on. In case the stream equals to
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 88f5178d2df7..5d8fac9741c3 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -2230,11 +2230,11 @@ static struct hl_mmap_mem_buf_behavior hl_ts_behavior = {
  * allocate_timestamps_buffers() - allocate timestamps buffers
  * This function will allocate ts buffer that will later on be mapped to the user
  * in order to be able to read the timestamp.
- * in additon it'll allocate an extra buffer for registration management.
+ * in addition it'll allocate an extra buffer for registration management.
  * since we cannot fail during registration for out-of-memory situation, so
  * we'll prepare a pool which will be used as user interrupt nodes and instead
  * of dynamically allocating nodes while registration we'll pick the node from
- * this pool. in addtion it'll add node to the mapping hash which will be used
+ * this pool. in addition it'll add node to the mapping hash which will be used
  * to map user ts buffer to the internal kernel ts buffer.
  * @hpriv: pointer to the private data of the fd
  * @args: ioctl input
diff --git a/drivers/accel/habanalabs/common/memory_mgr.c b/drivers/accel/habanalabs/common/memory_mgr.c
index 0f2759e26547..9f57bcef3be3 100644
--- a/drivers/accel/habanalabs/common/memory_mgr.c
+++ b/drivers/accel/habanalabs/common/memory_mgr.c
@@ -275,7 +275,7 @@ int hl_mem_mgr_mmap(struct hl_mem_mgr *mmg, struct vm_area_struct *vma,
 
 	if (atomic_cmpxchg(&buf->mmap, 0, 1)) {
 		dev_err(mmg->dev,
-			"%s, Memory mmap failed, already mmaped to user\n",
+			"%s, Memory mmap failed, already maped to user\n",
 			buf->behavior->topic);
 		rc = -EINVAL;
 		goto put_mem;
diff --git a/drivers/accel/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
index a42ae8bc61e8..17581b1bcc77 100644
--- a/drivers/accel/habanalabs/common/mmu/mmu.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu.c
@@ -540,8 +540,8 @@ static void hl_mmu_pa_page_with_offset(struct hl_ctx *ctx, u64 virt_addr,
 		u32 page_off;
 
 		/*
-		 * Bit arithmetics cannot be used for non power of two page
-		 * sizes. In addition, since bit arithmetics is not used,
+		 * Bit arithmetic cannot be used for non power of two page
+		 * sizes. In addition, since bit arithmetic is not used,
 		 * we cannot ignore dram base. All that shall be considered.
 		 */
 
@@ -757,7 +757,7 @@ u64 hl_mmu_get_next_hop_addr(struct hl_ctx *ctx, u64 curr_pte)
  * @mmu_prop: MMU properties.
  * @hop_idx: HOP index.
  * @hop_addr: HOP address.
- * @virt_addr: virtual address fro the translation.
+ * @virt_addr: virtual address for the translation.
  *
  * @return the matching PTE value on success, otherwise U64_MAX.
  */
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
index 1dfbe293ecec..25b5368f37dd 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
@@ -2657,7 +2657,7 @@ int gaudi2_coresight_init(struct hl_device *hdev)
 	/*
 	 * Mask out all the disabled binned offsets.
 	 * so when user request to configure a binned or masked out component,
-	 * driver will ignore programing it ( happens when offset value is set to 0x0 )
+	 * driver will ignore programming it ( happens when offset value is set to 0x0 )
 	 * this is being set in gaudi2_coresight_set_disabled_components
 	 */
 
-- 
2.39.2

