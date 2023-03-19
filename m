Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407D56C0079
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FC510E50A;
	Sun, 19 Mar 2023 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D242110E50A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:59:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F0867CE0CE4;
 Sun, 19 Mar 2023 09:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2E4C433EF;
 Sun, 19 Mar 2023 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679219940;
 bh=tLBz4DPxBU0Iy/uKoxMZ7lWbpOUQGe44bZnZu986Djo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NyNMBfDCMjUxo6rV7vvgu4g58F8CM2CPijxgI8LmqQ6gSabQnbQY6+eg7xVEMF7nl
 2pKZBHINY5pYDIuJxXl1Q2CWUc2iAw2DuIWa5BsJ590yRMd8faSj/MBTjdHKOg9/Vv
 /iI4M5aavxCsDU7n4mDSoJWehnpZX+fdI0YUym6TAWaeR5ACD+6SBRBxLt970LEO5A
 AKAv+0TxyRmuDFqqboQyKu8mPGWqCA0U1FHu33t5XMnsddP/wPWcegCQfZz/N/5m0a
 tLsNzHCAD4gMk76TRJA6az+w6OsUVe6gZAQXmcNf5Zjm0KybonBVER8LxFJP9wcbzs
 T2/CM0fpNj9OQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] accel/habanalabs: remove redundant TODOs
Date: Sun, 19 Mar 2023 11:58:50 +0200
Message-Id: <20230319095850.692040-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319095850.692040-1-ogabbay@kernel.org>
References: <20230319095850.692040-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

As mmu refactor and nic resume are not relevant anymore, remove
their TODO comments.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index b13f998ae09d..edcbda3d9b40 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2340,7 +2340,6 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 	prop->dmmu.num_hops = MMU_ARCH_6_HOPS;
 	prop->dmmu.last_mask = LAST_MASK;
 	prop->dmmu.host_resident = 1;
-	/* TODO: will be duplicated until implementing per-MMU props */
 	prop->dmmu.hop_table_size = prop->mmu_hop_table_size;
 	prop->dmmu.hop0_tables_total_size = prop->mmu_hop0_tables_total_size;
 
@@ -2356,7 +2355,6 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 	prop->pmmu.host_resident = 1;
 	prop->pmmu.num_hops = MMU_ARCH_6_HOPS;
 	prop->pmmu.last_mask = LAST_MASK;
-	/* TODO: will be duplicated until implementing per-MMU props */
 	prop->pmmu.hop_table_size = prop->mmu_hop_table_size;
 	prop->pmmu.hop0_tables_total_size = prop->mmu_hop0_tables_total_size;
 
@@ -6906,9 +6904,6 @@ static int gaudi2_compute_reset_late_init(struct hl_device *hdev)
 	size_t irq_arr_size;
 	int rc;
 
-	/* TODO: missing gaudi2_nic_resume.
-	 * Until implemented nic_hw_cap_initialized will remain zeroed
-	 */
 	gaudi2_init_arcs(hdev);
 
 	rc = gaudi2_scrub_arcs_dccm(hdev);
-- 
2.40.0

