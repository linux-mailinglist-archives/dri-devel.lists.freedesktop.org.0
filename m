Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CEB4396F9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC11989FC5;
	Mon, 25 Oct 2021 13:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243D389F85;
 Mon, 25 Oct 2021 13:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXFFf7yzP2wbSXgdrvTlXDUZPk2dSMGdk9c1teLfcwL/SWNcBSOSBUwM/FXCDjmqrgHwM8ofg1RoRo7a4TXfdfA8+/9rfVkpW67KLFM+sCmgUyd8VpZ7RAG15CteI0Z0L7nBwzI6h/ZOzTVyuMiFt2kVknq+pByXRZ2RYczF5SKzmTZAfCdMS77OlPYqQoGvs4DotOjzdBxWiQfzNP+Yeiu/xRe+P4BBZuM+0GDp2J57QYHjOpX4fgXejkQE8frNdu+S9599HryPcT//ABKlDHHqRnHmPt0bas+Q1vtr71TK14Z1Q9BhLNiLv8PCBTAh9lo9AJDsDkRY1NfotBiWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po1KAhTqGzlm4ui6KHoME0VZWKStwwSRFHUbicWsIRs=;
 b=hujnCWLnQCxPQwNui3ePHyhnPo1BgF1ieEpiDKoWvP5xx6l/SUAGE1R1wW/rT144KoSfpd/GxTzn6tKf1U33NcK5YKJUOpf7Fsw9Xwe0c8KY3Gz2Dxs19OrbWEq/9CZzcy+3PUOp2mstEZLjPP2zSeIQ+liEkTceu+x1OkepaIFaU3Y2lksckg+GU+hfGcTUzwRn2SVJdgA+c1fn2cH/T65SBpOa9OFCK7alNgjp4+KeLN3++p3pSpEwPJBiPd6dnXo/F2FsjTMkhVM1ehipzoTrrBBXFRcFMngpCO6PyOnqAiS+dASwD9iA+Y68QetRW+BhKFmyV7U40K7jPmzVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po1KAhTqGzlm4ui6KHoME0VZWKStwwSRFHUbicWsIRs=;
 b=r+DUp5ZON049ZUa6VzmK26HT2C1Kq3gGf29Ml5iI+rN/yOCLkRJvxbgrj3BKAE65nftEHijXcEhIrpJ/Z29lz2KTKLPf+EvXydP8Ef/EDhsz1Uyboo2EO2TxIVvVSDmnSCITzyr+GvuqaKMcDu9ya0EGfNTjsRHq8j3G0NqAR90=
Received: from MW4PR04CA0107.namprd04.prod.outlook.com (2603:10b6:303:83::22)
 by DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 13:01:17 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::f1) by MW4PR04CA0107.outlook.office365.com
 (2603:10b6:303:83::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 13:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:01:16 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:01:11 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 8/8] drm/amdgpu: add drm buddy support to amdgpu
Date: Mon, 25 Oct 2021 18:30:31 +0530
Message-ID: <20211025130033.1547667-6-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e63aeb19-c7c2-49d1-9d5b-08d997b7883c
X-MS-TrafficTypeDiagnostic: DM6PR12MB5520:
X-Microsoft-Antispam-PRVS: <DM6PR12MB5520E14D608D255B49724528E4839@DM6PR12MB5520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4X0HCQneeyGH2Set8BH2SaC21gMFWGf3sMcd83oayw0oMVQBxjZGFMKnB7TpE4Kw8KaKqMFZWgj8Jdz3xx/TSzv9Rqs3DcJL8gVzVksn1ms+ISHBulK8Fr/Q5GgFPT7y8m1EOOZUhMT14VxgE17wD8aiQw80Qzjava4NIYO0m4jwgA2dKNaDFLBh75dO5ecZgz7TBHUYAYr67Zjx/GBb1vzFxuAOCaGJVcZCGN6AAgYlID4ABmPInf2iC7UKuvG9Z2V3ce2FU8a3pbryK3LIVbovYd4idSNHMUV+0MeSqXB7+V0fCk4xfHDQMTj8qy8nUZ9yS7+57RetrwqXdIIsGITAmIaWgLf5BPfwUW4/fCb9h6zSk9bKTXaSPGFVCYKXg0MTP1R1lhpIlIAakW/vRpgLXyvjex3NI+jmPBLFbExK4qpj2lnegX9kqWLGaqjuShbTXWkOYU7mUHsDlZj7yPV0MnIJICwig+SMdQdu5ZVjg/T+oec220Zc3pm9pjsW3vGW1JyYxKs8IF9QfZ8JhS7W44fScNx1fhp1o/1jX93Au847m6v2OVjhpLTd9Pp2aN1M9vNxlvhtCnVacaiN9D7HUubEKM5oSxvh6FVhfOo7yOUjaqSvIkwxVI0Yza/YDUqpuCHJORfBXHP7tBKUoblQn8RegltrK/MEMsBcQk0tL7w3biHvq7bWA4Cq7clchyo81eqr1zRDmBeQAIb2vKD1+5t1fuvVsPV6Wg6mDsw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(110136005)(81166007)(54906003)(86362001)(6666004)(316002)(82310400003)(36756003)(70586007)(47076005)(426003)(8676002)(26005)(336012)(36860700001)(186003)(508600001)(4326008)(8936002)(356005)(1076003)(83380400001)(16526019)(2616005)(30864003)(7696005)(70206006)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:01:16.8609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e63aeb19-c7c2-49d1-9d5b-08d997b7883c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5520
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

- Remove drm_mm references and replace with drm buddy functionalities
- Add res cursor support for drm buddy

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 239 ++++++++++--------
 3 files changed, 221 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index acfa207cf970..da12b4ff2e45 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -30,12 +30,15 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_range_manager.h>
 
+#include "amdgpu_vram_mgr.h"
+
 /* state back for walking over vram_mgr and gtt_mgr allocations */
 struct amdgpu_res_cursor {
 	uint64_t		start;
 	uint64_t		size;
 	uint64_t		remaining;
-	struct drm_mm_node	*node;
+	void			*node;
+	uint32_t		mem_type;
 };
 
 /**
@@ -52,27 +55,63 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 				    uint64_t start, uint64_t size,
 				    struct amdgpu_res_cursor *cur)
 {
+	struct drm_buddy_block *block;
+	struct list_head *head, *next;
 	struct drm_mm_node *node;
 
-	if (!res || res->mem_type == TTM_PL_SYSTEM) {
-		cur->start = start;
-		cur->size = size;
-		cur->remaining = size;
-		cur->node = NULL;
-		WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
-		return;
-	}
+	if (!res)
+		goto err_out;
 
 	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
 
-	node = to_ttm_range_mgr_node(res)->mm_nodes;
-	while (start >= node->size << PAGE_SHIFT)
-		start -= node++->size << PAGE_SHIFT;
+	cur->mem_type = res->mem_type;
+
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		head = &to_amdgpu_vram_mgr_node(res)->blocks;
+
+		block = list_first_entry_or_null(head,
+						 struct drm_buddy_block,
+						 link);
+		if (!block)
+			goto err_out;
+
+		while (start >= amdgpu_node_size(block)) {
+			start -= amdgpu_node_size(block);
+
+			next = block->link.next;
+			if (next != head)
+				block = list_entry(next, struct drm_buddy_block, link);
+		}
+
+		cur->start = amdgpu_node_start(block) + start;
+		cur->size = min(amdgpu_node_size(block) - start, size);
+		cur->remaining = size;
+		cur->node = block;
+		break;
+	case TTM_PL_TT:
+		node = to_ttm_range_mgr_node(res)->mm_nodes;
+		while (start >= node->size << PAGE_SHIFT)
+			start -= node++->size << PAGE_SHIFT;
+
+		cur->start = (node->start << PAGE_SHIFT) + start;
+		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->remaining = size;
+		cur->node = node;
+		break;
+	default:
+		goto err_out;
+	}
 
-	cur->start = (node->start << PAGE_SHIFT) + start;
-	cur->size = min((node->size << PAGE_SHIFT) - start, size);
+	return;
+
+err_out:
+	cur->start = start;
+	cur->size = size;
 	cur->remaining = size;
-	cur->node = node;
+	cur->node = NULL;
+	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
+	return;
 }
 
 /**
@@ -85,7 +124,9 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
  */
 static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 {
-	struct drm_mm_node *node = cur->node;
+	struct drm_buddy_block *block;
+	struct drm_mm_node *node;
+	struct list_head *next;
 
 	BUG_ON(size > cur->remaining);
 
@@ -99,9 +140,27 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		return;
 	}
 
-	cur->node = ++node;
-	cur->start = node->start << PAGE_SHIFT;
-	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		block = cur->node;
+
+		next = block->link.next;
+		block = list_entry(next, struct drm_buddy_block, link);
+
+		cur->node = block;
+		cur->start = amdgpu_node_start(block);
+		cur->size = min(amdgpu_node_size(block), cur->remaining);
+		break;
+	case TTM_PL_TT:
+		node = cur->node;
+
+		cur->node = ++node;
+		cur->start = node->start << PAGE_SHIFT;
+		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		break;
+	default:
+		return;
+	}
 }
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 639c7b41e30b..a8ac9902ab29 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -26,6 +26,7 @@
 
 #include <linux/dma-direction.h>
 #include <drm/gpu_scheduler.h>
+#include <drm/drm_buddy.h>
 #include "amdgpu.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
@@ -40,12 +41,13 @@
 
 struct amdgpu_vram_mgr {
 	struct ttm_resource_manager manager;
-	struct drm_mm mm;
+	struct drm_buddy_mm mm;
 	spinlock_t lock;
 	struct list_head reservations_pending;
 	struct list_head reserved_pages;
 	atomic64_t usage;
 	atomic64_t vis_usage;
+	uint64_t default_page_size;
 };
 
 struct amdgpu_gtt_mgr {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7b2b0980ec41..9893ab583465 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -32,8 +32,12 @@
 #include "atom.h"
 
 struct amdgpu_vram_reservation {
+	uint64_t start;
+	uint64_t size;
+	uint64_t min_size;
+	unsigned long flags;
+	struct list_head block;
 	struct list_head node;
-	struct drm_mm_node mm_node;
 };
 
 static inline struct amdgpu_vram_mgr *
@@ -196,10 +200,10 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
  * Calculate how many bytes of the MM node are inside visible VRAM
  */
 static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
-				    struct drm_mm_node *node)
+				    struct drm_buddy_block *block)
 {
-	uint64_t start = node->start << PAGE_SHIFT;
-	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
+	uint64_t start = amdgpu_node_start(block);
+	uint64_t end = start + amdgpu_node_size(block);
 
 	if (start >= adev->gmc.visible_vram_size)
 		return 0;
@@ -220,9 +224,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct ttm_resource *res = bo->tbo.resource;
-	unsigned pages = res->num_pages;
-	struct drm_mm_node *mm;
-	u64 usage;
+	struct amdgpu_vram_mgr_node *node = to_amdgpu_vram_mgr_node(res);
+	struct drm_buddy_block *block;
+	u64 usage = 0;
 
 	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
 		return amdgpu_bo_size(bo);
@@ -230,9 +234,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
 		return 0;
 
-	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
-	for (usage = 0; pages; pages -= mm->size, mm++)
-		usage += amdgpu_vram_mgr_vis_size(adev, mm);
+	list_for_each_entry(block, &node->blocks, link)
+		usage += amdgpu_vram_mgr_vis_size(adev, block);
 
 	return usage;
 }
@@ -242,21 +245,30 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_mm *mm = &mgr->mm;
+	struct drm_buddy_mm *mm = &mgr->mm;
 	struct amdgpu_vram_reservation *rsv, *temp;
+	struct drm_buddy_block *block;
 	uint64_t vis_usage;
 
 	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
-		if (drm_mm_reserve_node(mm, &rsv->mm_node))
+		if (drm_buddy_alloc(mm, rsv->start, rsv->start + rsv->size,
+					rsv->size, rsv->min_size, &rsv->block,
+					rsv->flags))
 			continue;
 
-		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
-			rsv->mm_node.start, rsv->mm_node.size);
+		block = list_first_entry_or_null(&rsv->block,
+						 struct drm_buddy_block,
+						 link);
 
-		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
-		atomic64_add(vis_usage, &mgr->vis_usage);
-		atomic64_add(rsv->mm_node.size << PAGE_SHIFT, &mgr->usage);
-		list_move(&rsv->node, &mgr->reserved_pages);
+		if (block) {
+			dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
+				rsv->start, rsv->size);
+
+			vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
+			atomic64_add(vis_usage, &mgr->vis_usage);
+			atomic64_add(rsv->size, &mgr->usage);
+			list_move(&rsv->node, &mgr->reserved_pages);
+		}
 	}
 }
 
@@ -280,11 +292,15 @@ int amdgpu_vram_mgr_reserve_range(struct ttm_resource_manager *man,
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&rsv->node);
-	rsv->mm_node.start = start >> PAGE_SHIFT;
-	rsv->mm_node.size = size >> PAGE_SHIFT;
+	INIT_LIST_HEAD(&rsv->block);
+
+	rsv->start = start;
+	rsv->size = size;
+	rsv->min_size = size;
+	rsv->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
 	spin_lock(&mgr->lock);
-	list_add_tail(&mgr->reservations_pending, &rsv->node);
+	list_add_tail(&rsv->node, &mgr->reservations_pending);
 	amdgpu_vram_mgr_do_reserve(man);
 	spin_unlock(&mgr->lock);
 
@@ -312,16 +328,16 @@ int amdgpu_vram_mgr_query_page_status(struct ttm_resource_manager *man,
 	spin_lock(&mgr->lock);
 
 	list_for_each_entry(rsv, &mgr->reservations_pending, node) {
-		if ((rsv->mm_node.start <= start) &&
-		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
+		if ((rsv->start <= start) &&
+		    (start < (rsv->start + rsv->size))) {
 			ret = -EBUSY;
 			goto out;
 		}
 	}
 
 	list_for_each_entry(rsv, &mgr->reserved_pages, node) {
-		if ((rsv->mm_node.start <= start) &&
-		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
+		if ((rsv->start <= start) &&
+		    (start < (rsv->start + rsv->size))) {
 			ret = 0;
 			goto out;
 		}
@@ -333,28 +349,6 @@ int amdgpu_vram_mgr_query_page_status(struct ttm_resource_manager *man,
 	return ret;
 }
 
-/**
- * amdgpu_vram_mgr_virt_start - update virtual start address
- *
- * @mem: ttm_resource to update
- * @node: just allocated node
- *
- * Calculate a virtual BO start address to easily check if everything is CPU
- * accessible.
- */
-static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
-				       struct drm_mm_node *node)
-{
-	unsigned long start;
-
-	start = node->start + node->size;
-	if (start > mem->num_pages)
-		start -= mem->num_pages;
-	else
-		start = 0;
-	mem->start = max(mem->start, start);
-}
-
 /**
  * amdgpu_vram_mgr_new - allocate new ranges
  *
@@ -370,13 +364,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
-	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
+	unsigned long lpfn, pages_per_node, pages_left, pages, n_pages;
+	uint64_t vis_usage = 0, mem_bytes, max_bytes, min_page_size;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	uint64_t vis_usage = 0, mem_bytes, max_bytes;
-	struct ttm_range_mgr_node *node;
-	struct drm_mm *mm = &mgr->mm;
-	enum drm_mm_insert_mode mode;
+	struct amdgpu_vram_mgr_node *node;
+	struct drm_buddy_mm *mm = &mgr->mm;
+	struct drm_buddy_block *block;
 	unsigned i;
 	int r;
 
@@ -395,10 +389,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_sub;
 	}
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		pages_per_node = ~0ul;
-		num_nodes = 1;
-	} else {
+	else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		pages_per_node = HPAGE_PMD_NR;
 #else
@@ -407,11 +400,10 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 #endif
 		pages_per_node = max_t(uint32_t, pages_per_node,
 				       tbo->page_alignment);
-		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
 	}
 
-	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
-			GFP_KERNEL | __GFP_ZERO);
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+
 	if (!node) {
 		r = -ENOMEM;
 		goto error_sub;
@@ -419,9 +411,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 	ttm_resource_init(tbo, place, &node->base);
 
-	mode = DRM_MM_INSERT_BEST;
+	INIT_LIST_HEAD(&node->blocks);
+
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
-		mode = DRM_MM_INSERT_HIGH;
+		node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
+	if (place->fpfn || lpfn != man->size)
+		/* Allocate blocks in desired range */
+		node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
+	min_page_size = mgr->default_page_size;
+	BUG_ON(min_page_size < mm->chunk_size);
 
 	pages_left = node->base.num_pages;
 
@@ -429,36 +429,63 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
 
 	i = 0;
-	spin_lock(&mgr->lock);
 	while (pages_left) {
-		uint32_t alignment = tbo->page_alignment;
-
 		if (pages >= pages_per_node)
-			alignment = pages_per_node;
-
-		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
-						alignment, 0, place->fpfn,
-						lpfn, mode);
-		if (unlikely(r)) {
-			if (pages > pages_per_node) {
-				if (is_power_of_2(pages))
-					pages = pages / 2;
-				else
-					pages = rounddown_pow_of_two(pages);
-				continue;
-			}
-			goto error_free;
+			pages = pages_per_node;
+
+		n_pages = pages;
+
+		if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+			n_pages = roundup_pow_of_two(n_pages);
+			min_page_size = (uint64_t)n_pages << PAGE_SHIFT;
+
+			if (n_pages > lpfn)
+				lpfn = n_pages;
 		}
 
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
-		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
+		spin_lock(&mgr->lock);
+		r = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
+					(uint64_t)lpfn << PAGE_SHIFT,
+					(uint64_t)n_pages << PAGE_SHIFT,
+					 min_page_size, &node->blocks,
+					 node->flags);
+		spin_unlock(&mgr->lock);
+
+		if (unlikely(r))
+			goto error_free_blocks;
+
 		pages_left -= pages;
 		++i;
 
 		if (pages > pages_left)
 			pages = pages_left;
 	}
-	spin_unlock(&mgr->lock);
+
+	/* Free unused pages for contiguous allocation */
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		uint64_t actual_size = (uint64_t)node->base.num_pages << PAGE_SHIFT;
+
+		r = drm_buddy_free_unused_pages(mm,
+						actual_size,
+						&node->blocks);
+
+		if (unlikely(r))
+			goto error_free_blocks;
+	}
+
+	list_for_each_entry(block, &node->blocks, link)
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
+
+	block = list_first_entry_or_null(&node->blocks,
+					 struct drm_buddy_block,
+					 link);
+
+	if (!block) {
+		r = -ENOSPC;
+		goto error_free_res;
+	}
+
+	node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
 
 	if (i == 1)
 		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
@@ -472,12 +499,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	*res = &node->base;
 	return 0;
 
-error_free:
-	while (i--)
-		drm_mm_remove_node(&node->mm_nodes[i]);
+error_free_blocks:
+	spin_lock(&mgr->lock);
+	drm_buddy_free_list(mm, &node->blocks);
 	spin_unlock(&mgr->lock);
-	kvfree(node);
-
+error_free_res:
+	kfree(node);
 error_sub:
 	atomic64_sub(mem_bytes, &mgr->usage);
 	return r;
@@ -494,28 +521,28 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *res)
 {
-	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
+	struct amdgpu_vram_mgr_node *node = to_amdgpu_vram_mgr_node(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct drm_buddy_mm *mm = &mgr->mm;
+	struct drm_buddy_block *block;
 	uint64_t usage = 0, vis_usage = 0;
-	unsigned i, pages;
 
 	spin_lock(&mgr->lock);
-	for (i = 0, pages = res->num_pages; pages;
-	     pages -= node->mm_nodes[i].size, ++i) {
-		struct drm_mm_node *mm = &node->mm_nodes[i];
-
-		drm_mm_remove_node(mm);
-		usage += mm->size << PAGE_SHIFT;
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
+	list_for_each_entry(block, &node->blocks, link) {
+		usage += amdgpu_node_size(block);
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
 	}
+
 	amdgpu_vram_mgr_do_reserve(man);
+
+	drm_buddy_free_list(mm, &node->blocks);
 	spin_unlock(&mgr->lock);
 
 	atomic64_sub(usage, &mgr->usage);
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
-	kvfree(node);
+	kfree(node);
 }
 
 /**
@@ -669,9 +696,18 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
+	struct drm_buddy_mm *mm = &mgr->mm;
+	struct drm_buddy_block *block;
 
 	spin_lock(&mgr->lock);
-	drm_mm_print(&mgr->mm, printer);
+	drm_printf(printer, "default_page_size: %lluKiB\n",
+		   mgr->default_page_size >> 10);
+
+	drm_buddy_print(mm, printer);
+
+	drm_printf(printer, "reserved:\n");
+	list_for_each_entry(block, &mgr->reserved_pages, link)
+		drm_buddy_block_print(mm, block, printer);
 	spin_unlock(&mgr->lock);
 
 	drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
@@ -696,15 +732,20 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
+	int err;
 
 	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
 
-	drm_mm_init(&mgr->mm, 0, man->size);
+	err = drm_buddy_init(&mgr->mm, man->size << PAGE_SHIFT, PAGE_SIZE);
+	if (err)
+		return err;
+
 	spin_lock_init(&mgr->lock);
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
+	mgr->default_page_size = PAGE_SIZE;
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
@@ -737,10 +778,10 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 		kfree(rsv);
 
 	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
-		drm_mm_remove_node(&rsv->mm_node);
+		drm_buddy_free_list(&mgr->mm, &rsv->block);
 		kfree(rsv);
 	}
-	drm_mm_takedown(&mgr->mm);
+	drm_buddy_fini(&mgr->mm);
 	spin_unlock(&mgr->lock);
 
 	ttm_resource_manager_cleanup(man);
-- 
2.25.1

