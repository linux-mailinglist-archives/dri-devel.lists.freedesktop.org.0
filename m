Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF87AE7A6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2E610E36A;
	Tue, 26 Sep 2023 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792DD10E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF5C761331
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B18C433C9;
 Tue, 26 Sep 2023 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716041;
 bh=Wc6oOu7MTbbmpU3cjtCGSKKfAvkHPvs3/mMSRMDuGqc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IsaCXZ0U0jO0vTENmemGLv1pY/Id8z5utXMYhYursmphhjKqM8zOz/kwzXr6RhG76
 pBw5UxrHRAq4cE8bgUyzmF5O09PofCQ4Gq8vV9DdX/YSNuWnz3WGjTlTN5qYtirfi8
 5zUdvsTTdcTFZ0Xw3VjfC3p1K6kLIGApvT5Var4jrLKzRguO7wBbCuGJ3jEfZMMxK8
 vSg00dydmO1MKm+iwDs0eTQYxlsS8jvQcJ3OJXtYDJs684965hIkEv3RVpoV86P5aC
 SX7ohOTF+GKu1j1U63Ny1YnrW5IMJwXOqpmBFXSe8joVj1lFG3WINulc17NdfyYo1Q
 bHIyAV2103tFg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] accel/habanalabs: minor cosmetic update to habanalabs.h
Date: Tue, 26 Sep 2023 11:13:45 +0300
Message-Id: <20230926081345.240927-9-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926081345.240927-1-ogabbay@kernel.org>
References: <20230926081345.240927-1-ogabbay@kernel.org>
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
- Align fields in struct hl_userptr
- Fix comments

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 31 ++++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index a8ccc04e7f92..2a3acdbf9171 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright 2016-2022 HabanaLabs, Ltd.
+ * Copyright 2016-2023 HabanaLabs, Ltd.
  * All Rights Reserved.
  *
  */
@@ -553,8 +553,7 @@ struct hl_hints_range {
  *              allocated with huge pages.
  * @hints_dram_reserved_va_range: dram hint addresses reserved range.
  * @hints_host_reserved_va_range: host hint addresses reserved range.
- * @hints_host_hpage_reserved_va_range: host huge page hint addresses reserved
- *                                      range.
+ * @hints_host_hpage_reserved_va_range: host huge page hint addresses reserved range.
  * @sram_base_address: SRAM physical start address.
  * @sram_end_address: SRAM physical end address.
  * @sram_user_base_address - SRAM physical start address for user access.
@@ -593,7 +592,7 @@ struct hl_hints_range {
  * @mmu_pte_size: PTE size in MMU page tables.
  * @mmu_hop_table_size: MMU hop table size.
  * @mmu_hop0_tables_total_size: total size of MMU hop0 tables.
- * @dram_page_size: page size for MMU DRAM allocation.
+ * @dram_page_size: The DRAM physical page size.
  * @cfg_size: configuration space size on SRAM.
  * @sram_size: total size of SRAM.
  * @max_asid: maximum number of open contexts (ASIDs).
@@ -695,7 +694,7 @@ struct hl_hints_range {
  * @configurable_stop_on_err: is stop-on-error option configurable via debugfs.
  * @set_max_power_on_device_init: true if need to set max power in F/W on device init.
  * @supports_user_set_page_size: true if user can set the allocation page size.
- * @dma_mask: the dma mask to be set for this device
+ * @dma_mask: the dma mask to be set for this device.
  * @supports_advanced_cpucp_rc: true if new cpucp opcodes are supported.
  * @supports_engine_modes: true if changing engines/engine_cores modes is supported.
  * @support_dynamic_resereved_fw_size: true if we support dynamic reserved size for fw.
@@ -1959,17 +1958,17 @@ struct hl_ctx_mgr {
  * @dma_mapped: true if the SG was mapped to DMA addresses, false otherwise.
  */
 struct hl_userptr {
-	enum vm_type		vm_type; /* must be first */
-	struct list_head	job_node;
-	struct page		**pages;
-	unsigned int		npages;
-	struct sg_table		*sgt;
-	enum dma_data_direction dir;
-	struct list_head	debugfs_list;
-	pid_t			pid;
-	u64			addr;
-	u64			size;
-	u8			dma_mapped;
+	enum vm_type			vm_type; /* must be first */
+	struct list_head		job_node;
+	struct page			**pages;
+	unsigned int			npages;
+	struct sg_table			*sgt;
+	enum dma_data_direction		dir;
+	struct list_head		debugfs_list;
+	pid_t				pid;
+	u64				addr;
+	u64				size;
+	u8				dma_mapped;
 };
 
 /**
-- 
2.34.1

