Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09C49240E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC11E112A1F;
	Tue, 18 Jan 2022 10:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57687112A4D;
 Tue, 18 Jan 2022 10:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkCac25QF1y34kibMu3HUhT81Sm+StAyKYtjp+/ngwzW3VUR6fFF5HvcQ4GxglbDfvlYm7kFpcSYHJe7zi/jeLaHFDYNHWa51+vmxMYUNjbKw9eNMj7ddNXKSpempBmpTLEfsfb2GKV55NBGx9MpA2zfZ5pcLfF0gSr0aScqIWSHc4D6uA8x3RXZ7Q1ZxGY8ry4lBzNViuyC/ou6vQqU5Zpomubz0/I1eqODjKcZ1nvHOd6AMtI8V3kIy4JHNiliYCaGw1tIG7k4dhkPPzjb22obomGgjc05ulcfOF9ldrx9/JI6k1+lIuTI3kMxG2z/ZOO5MSxeu5oBmkzE034eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibUUUyiKmRZLUIMNMC6RuVofhyqybsw+qjPKAhe+zNE=;
 b=i0rQhCkPxl58B+FXU8P57vfgoqLED7V5ZoCLhJh9bxIUQlGiq+iJdx8zKJuqCL+Ln1QBcM3w2wjc0hLdPU0BAQeOj5csnGbqZWCXUfk2ApZFN+ao5Ro+/g2TjwVCkBmfGHiU/ipU4UCsYO+/ZOn7wnS7kXkOmp0/zjMGaeI6htMM+BBhXUjDgkZaAOABdKIGoGYE74ll+NdWbvsYUo+ClubtLeiMqxm2KuzRKHoKki1oroZFsckYitZyg4A3IXMN234BFTydaj3M5vjYOuxVatVzkfWYZ6PyVhXVICVgERWGhd9NPbEVpev9jdVIwkBenQ35ltR8V1/TwrdMkAUXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibUUUyiKmRZLUIMNMC6RuVofhyqybsw+qjPKAhe+zNE=;
 b=ZiJiFXjlgyQnmCyxXx402HC41AXIlZCO4Dsz2wkmm5U2VRaH3McWATGmMLtcfiYXgo9r5SyfSOqfwa1Vw/lKd9n1VmZDcjQ/zelSzgjvMKcbLsXgxWdffX6DTP99p0pEGaP4phxojzo0x8D9cb9J2ZBoLVmbYMR7/rb2mpojoK4=
Received: from DS7PR06CA0029.namprd06.prod.outlook.com (2603:10b6:8:54::29) by
 CH0PR12MB5314.namprd12.prod.outlook.com (2603:10b6:610:d5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Tue, 18 Jan 2022 10:46:03 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::cf) by DS7PR06CA0029.outlook.office365.com
 (2603:10b6:8:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 18 Jan 2022 10:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 10:46:03 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 04:45:55 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 4/6] drm: implement a method to free unused pages
Date: Tue, 18 Jan 2022 16:15:02 +0530
Message-ID: <20220118104504.2349-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104504.2349-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220118104504.2349-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78d7a10a-2cb0-45a0-6a64-08d9da6fb963
X-MS-TrafficTypeDiagnostic: CH0PR12MB5314:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5314B6FB0C105F069E9772F2E4589@CH0PR12MB5314.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BmH72/iE91DVXIHPPG1eDgf5e93+nBnWoNFqMgt3LxuunfQbnXZ6BWm0WHte76Zo5YAhmWh/yth1jW7p69WLZeMGTY6QkY2XM4IHCiHskt6MyJed+eV2OVG/zi7loI3e78URMRprs9bLywDQWTvMeZ9a8sssHBI0LseiLG5F689A05Qu89QyQ3DPog3/rMyCB0out3PsLNOlgFgIRZJ9vG+pNCeYetRZHpkddF6WoKNdCNbHS84ZnbdSbtkBWjekIyZccKVNs/c4rYdHPlWE6ILGAplmJ67SgYl/T03K23oMV7SKOVEVj8JBtZ4vMg4m3g97rMVg0lH0FPhCIH+b8bivHuhU9Qq2Jui7j1T3SBMls+2VFdrvOQTUgtziJQo6g274gidUXiP2q4aJKHLjeG/d4Qjh+i3Zgpm9MN5b7k+ohtpyzkQuEju3NGYx4givfhgJ3akxPXgBXFnLy5K+mabWjzwWmvVnCdIGINwanCdrk6JK8vuowpSggZ5nq3JAdImfyd3oD3C+VHu0YKC3M2zVlqXh2NA2wL8t0CK36urAujhpx/HIHqTUvTjT8tQcoJXnFL6EHo5fgJGVai7EmRWfw2Ez3lSq74HpK04mWxzWnRBwh8nOFGdKjr2qSFmuZsj/AVwzATLbYujIpiCXq6qn5Yt1WYIkyZVfp/MwawXsP+4zO6Jk16nUDRTwJfbQLOlGh9xLUncCUhAm9+jgpLLo8n5uJ70G/jlDrrjUVE3z2r1cMjncOlt063s6j0VpY191GRHKJISaEC7he49f0s5YHAeIXK/iuL/gQPV0C1o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(36756003)(8936002)(47076005)(70206006)(70586007)(8676002)(82310400004)(40460700001)(6666004)(1076003)(54906003)(36860700001)(336012)(186003)(316002)(86362001)(7696005)(356005)(16526019)(26005)(83380400001)(4326008)(110136005)(508600001)(5660300002)(2906002)(2616005)(81166007)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:46:03.5067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d7a10a-2cb0-45a0-6a64-08d9da6fb963
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5314
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

v3(Matthew Auld):
  - remove trim method error handling as we address the failure case
    at drm_buddy_block_trim() function

v4:
  - in case of trim, at __alloc_range() split_block failure path
    marks the block as free and removes it from the original list,
    potentially also freeing it, to overcome this problem, we turn
    the drm_buddy_block_trim() input node into a temporary node to
    prevent recursively freeing itself, but still retain the
    un-splitting/freeing of the other nodes(Matthew Auld)

  - modify the drm_buddy_block_trim() function return type

v5(Matthew Auld):
  - revert drm_buddy_block_trim() function return type changes in v4
  - modify drm_buddy_block_trim() passing argument n_pages to original_size
    as n_pages has already been rounded up to the next power-of-two and
    passing n_pages results noop

v6:
  - fix warnings reported by kernel test robot <lkp@intel.com>

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 65 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
 include/drm/drm_buddy.h                       |  4 ++
 3 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 6aa5c1ce25bf..c5902a81b8c5 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -546,6 +546,71 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
 	return __alloc_range(mm, &dfs, start, size, blocks);
 }
 
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
+int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 new_size,
+			 struct list_head *blocks)
+{
+	struct drm_buddy_block *parent;
+	struct drm_buddy_block *block;
+	LIST_HEAD(dfs);
+	u64 new_start;
+	int err;
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
+	mark_free(mm, block);
+	mm->avail += drm_buddy_block_size(mm, block);
+
+	/* Prevent recursively freeing this node */
+	parent = block->parent;
+	block->parent = NULL;
+
+	new_start = drm_buddy_block_offset(block);
+	list_add(&block->tmp_link, &dfs);
+	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
+	if (err) {
+		mark_allocated(block);
+		mm->avail -= drm_buddy_block_size(mm, block);
+		list_add(&block->link, blocks);
+	}
+
+	block->parent = parent;
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_block_trim);
+
 /**
  * drm_buddy_alloc_blocks - allocate power-of-two blocks
  *
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 3662434b64bb..53eb100688a6 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
+
+		mutex_lock(&bman->lock);
+		drm_buddy_block_trim(mm,
+				     original_size,
+				     &bman_res->blocks);
+		mutex_unlock(&bman->lock);
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 424fc443115e..17ca928fce8e 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -145,6 +145,10 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags);
 
+int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 new_size,
+			 struct list_head *blocks);
+
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
-- 
2.25.1

