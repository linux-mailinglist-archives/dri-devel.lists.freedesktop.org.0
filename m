Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C14652FF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 17:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994A26E4D7;
	Wed,  1 Dec 2021 16:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E936E436;
 Wed,  1 Dec 2021 16:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lc9QSVLDtCqtVb8K909PGCP/ZcFqaYeljp+mIeBR2uzNmQdsMo2kbCS2YxlWJ4elxrcA/bSLfaNRdUMt4XQfVZTg8S87nt/o9IFMy0CgLcOhcCpygdvqgUQ3G+9pea7IH5T9yrsdSnNRqFCxQxNU5zk7uhmp7Ez70DACKZdicljMI3a4eo5nbH07j2XtWftwsUOZ8uAKrC0jnf+N4jl8qpLtAyw6OQvtgFuqRr7E9Zl9dzXST7h+Ap89gBcVpGRuF7zI7h2eKSkDZjavp8nsM9ZfXqmdSJK8kZ2k4xlGuIkvGVau+tIr+TN0whzbmrwtscVsyuv/htdxdTe3fwxoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLMwCNwqP5ZCEYTpHnzZHnbdHzurggXpgKH0IbM+7Ek=;
 b=AvOx+zcAeKOusTZ5AcDMeRKvkvRLGYtFACGYZ08c0CncFrkC/MuBwMN7YpI4Yu+ZOsROvmOBQwb2jADOzZ1RF27qbYnx3KvziF9Z1Kp9p6DL5oDujPBiglOqA77UPIw028wzB0pVTtIPtlCSu9aZCgK9i+T8mKMnS+Zs+cDC+bu5sUH4qMBCXvdv19aYUFb6w410xnaIUtmIIXk82pihiT271jhaESGXUpTCIwkA88MGRqpQDMxkngVEoM93EY9apgkQ/B+tmYxwR8OuNyPYmcsuQ0hNGZABLdHrdp4ClHnzZC3rO23uTuToMgxGADe+IBr64ys12kZttN5IyRYXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLMwCNwqP5ZCEYTpHnzZHnbdHzurggXpgKH0IbM+7Ek=;
 b=qwHD9Ux0ouCJDsFr79VUf7YrRVfAcog+XHminFgMoLNZXM4FEWzRY/XAu0+vZofM6wkPIw9UCtzw/QZ0q3rtNnHUZTMTjF+LxSvap/c8SNr7bRM/CqXkBo0Ifg8wdyfbTp0T/GbtWQnwEaLL8dpOCfFqz8InM/+oLP+6Lmg6h9U=
Received: from BN9PR03CA0377.namprd03.prod.outlook.com (2603:10b6:408:f7::22)
 by CH2PR12MB4874.namprd12.prod.outlook.com (2603:10b6:610:64::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 16:40:57 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::a8) by BN9PR03CA0377.outlook.office365.com
 (2603:10b6:408:f7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 16:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 16:40:57 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 10:40:36 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 4/6] drm: implement a method to free unused pages
Date: Wed, 1 Dec 2021 22:09:36 +0530
Message-ID: <20211201163938.133226-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c75b87e7-b57f-43c8-bbb2-08d9b4e959a9
X-MS-TrafficTypeDiagnostic: CH2PR12MB4874:
X-Microsoft-Antispam-PRVS: <CH2PR12MB48740E1C1831D91CD2467EEBE4689@CH2PR12MB4874.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: noUcpB6axp2/M7eZXM1iSAxBcN7icz/m7/E0BX8o9ATWSzjjTI3BVX2wQBi5VUSik2uUU0ithJysEYSuSmf9G/AvBOoZJBBcUOuCp0LX/7G6B0RnwKl/afkDqemlGTfD5OamiyaEl4y0aClmLn0mySzX8U3YJ4Ot2RkplgDyjoDXisFsh6PqEHMHTzZ9OJKzcGHikXZZnltOt3lJCo5/+uPE2nYvK7ZSAlrb9IKWSJrtK+XpWglmBwdc7dcsR/9B9xX6TOZikP7DCK/kq1XdbJJ7RrZ9HMGJ4ZC5sG01VsPa0ITb1hXhfrb8MP1mBtoA44y1lWqsHB6gpNWtNqREsaqHULhWDJi+NoKVS59fbTSsSBCFabh5WRvt4rfflPBbZDPDcUcq3xG3xurrGiMhA4EY1ONPGdkXci/Z4Tj8qyRT6irxuZLiQit+8EhYMcXmMkEZtRAz6ySDJpsu6rKhjYWrgPOpBXMnxhCCg9PuDvbYNVEO8d8c6/NJI52cRTFFJRi+fQHBuYIoBlcbh4OKBrdRDoxHdlAF5zyPo+DXJd0uc5jyXk39uYedMKTII1OpvIqxMeVKhv4PBH6e+idLW/Bmozu0fCQICBgrphkXm/EL/a5QUleN2s6HGbG4P1CY0kzOvS0CWeFc9g37D5LilJ9wJGn0yFsgpYhQFr10m83Hr1uHV17ZGvWD56gT27RaYnt3cmqWN2XCVA0qSHNK3nQmGBZ9ZLbfplC5hL9HCO8i9opo3V53EvyUHsyp5Kc0r7K+sSyoXDdLzWwrMfRoysgKoEL8RrpIOW2O3x2Kjkk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(86362001)(4326008)(8676002)(36860700001)(186003)(426003)(16526019)(70586007)(2906002)(336012)(316002)(7696005)(26005)(54906003)(110136005)(8936002)(5660300002)(70206006)(508600001)(2616005)(356005)(81166007)(83380400001)(1076003)(36756003)(82310400004)(40460700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 16:40:57.3842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75b87e7-b57f-43c8-bbb2-08d9b4e959a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4874
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On contiguous allocation, we round up the size
to the *next* power of 2, implement a function
to free the unused pages after the newly allocate block.

v2(Matthew Auld):
  - replace function name 'drm_buddy_free_unused_pages' with
    drm_buddy_block_trim
  - replace input argument name 'actual_size' with 'new_size'
  - add more validation checks for input arguments
  - add overlaps check to avoid needless searching and splitting
  - merged the below patch to see the feature in action
    - add free unused pages support to i915 driver
  - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
    are all globally visible

v3:
  - remove drm_buddy_block_trim() error handling and
    print a warn message if it fails

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 72 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
 include/drm/drm_buddy.h                       |  4 ++
 3 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index eddc1eeda02e..707efc82216d 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -434,7 +434,8 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
 static int __alloc_range(struct drm_buddy_mm *mm,
 			 struct list_head *dfs,
 			 u64 start, u64 size,
-			 struct list_head *blocks)
+			 struct list_head *blocks,
+			 bool trim_path)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
@@ -480,8 +481,20 @@ static int __alloc_range(struct drm_buddy_mm *mm,
 
 		if (!drm_buddy_block_is_split(block)) {
 			err = split_block(mm, block);
-			if (unlikely(err))
+			if (unlikely(err)) {
+				if (trim_path)
+					/*
+					 * Here in case of trim, we return and dont goto
+					 * split failure path as it removes from the
+					 * original list and potentially also freeing
+					 * the block. so we could leave as it is,
+					 * worse case we get some internal fragmentation
+					 * and leave the decision to the user
+					 */
+					return err;
+
 				goto err_undo;
+			}
 		}
 
 		list_add(&block->right->tmp_link, dfs);
@@ -535,8 +548,61 @@ static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 	for (i = 0; i < mm->n_roots; ++i)
 		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
 
-	return __alloc_range(mm, &dfs, start, size, blocks);
+	return __alloc_range(mm, &dfs, start, size, blocks, 0);
+}
+
+/**
+ * drm_buddy_block_trim - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @new_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and it can be freed.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			 u64 new_size,
+			 struct list_head *blocks)
+{
+	struct drm_buddy_block *block;
+	u64 new_start;
+	LIST_HEAD(dfs);
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block = list_first_entry(blocks,
+				 struct drm_buddy_block,
+				 link);
+
+	if (!drm_buddy_block_is_allocated(block))
+		return -EINVAL;
+
+	if (new_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
+		return -EINVAL;
+
+	if (new_size == drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+
+	new_start = drm_buddy_block_offset(block);
+
+	mark_free(mm, block);
+
+	list_add(&block->tmp_link, &dfs);
+
+	return __alloc_range(mm, &dfs, new_start, new_size, blocks, 1);
 }
+EXPORT_SYMBOL(drm_buddy_block_trim);
 
 /**
  * drm_buddy_alloc - allocate power-of-two blocks
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 7c58efb60dba..c5831c27fe82 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		mutex_lock(&bman->lock);
+		err = drm_buddy_block_trim(mm,
+				(u64)n_pages << PAGE_SHIFT,
+				&bman_res->blocks);
+		mutex_unlock(&bman->lock);
+		pr_warn("drm_buddy_block_trim failed returing %d for ttm_buffer_object(%p)\n",
+			err, bo);
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 316ac0d25f08..90906d9dbbf0 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -146,6 +146,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    struct list_head *blocks,
 		    unsigned long flags);
 
+int drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			 u64 new_size,
+			 struct list_head *blocks);
+
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
-- 
2.25.1

