Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C64341CC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E4F6E171;
	Tue, 19 Oct 2021 22:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95136E199;
 Tue, 19 Oct 2021 22:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOcKKffzcDnzn6n3rtPPPlKpb1G/p3vsNT+pn6sy+Du+2X6LqNBojMRbrOJ25GsVkaW5L/wOSH6hDNI+BY7OLBWwFy3Dp3lQ/tm1MM8W5nIGEl+vdzxQbTUiHWQaNVCgTku/8pSLxfeiCo6eTNw/WwAeHbeHObE/87EzW/rS5GJKu18Mc2FTkKQOA7zNMFuD+AB3y2K6qmrsmk4MEdypaevAsHh6jS+r731NICoQlmd8nEcO/abJpP2SYJYWs3m1a2+mwiNq5kCQYTsjbc60gJiLf1GUrTsxvb5ZwEoY8mBnPOsPcICHIHpCVikzRaAY4clhaWQ8ZsL5bBcz9Waw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/xfRfK1JvoiFD6MEeRGhaE9eC4U5qnrjPQoE6YMPsY=;
 b=PyzNSQyosO7xkqjw72A9jDc9qNaCGIkwSoaV4IP1SoD89FJVcX9SdhBwWybgAKSa822EYX1QFU0dCTLloz9iyWc6j95sdjQko3y/PDgRBAOaWXDTqJaqv5Upnohh0D2JW6mHp9i2VJ2YnkfzBrrxcheQy7acxCg/zx4vsN/Q8fe3v9sgdBW14OxYxJbHGR8mEuWGj78K/hj9+0/UrZgMpZQrD5szlzAbGI3lboLtHjCN8QSo5eQ2IngKLg/htHcu2ELD/Aj7xmy4cqbHl68oo0mdGFpdD+0fCDzTul76B78w2ZP5n1+FlNkEitssRyS4ycgk+hefrjCQJs54qpg8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/xfRfK1JvoiFD6MEeRGhaE9eC4U5qnrjPQoE6YMPsY=;
 b=Y+Rqnf3U6YmjR4klmwP1rhYmORM4YtCYGVZ4f/MoPHy27mQcvQfIbVIJlj4wOK0BBgQzrVPFBk4hM6MU0OCFIzMKRc+/l14OOagUwghTjYvGLxOpilXRuJw36FpcXZ5NZFhG4r4fkjNAHynWfCQnt/3+mrC7BPA1Zij+K/TNKak=
Received: from MWHPR11CA0023.namprd11.prod.outlook.com (2603:10b6:301:1::33)
 by BN9PR12MB5132.namprd12.prod.outlook.com (2603:10b6:408:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 22:55:27 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::d4) by MWHPR11CA0023.outlook.office365.com
 (2603:10b6:301:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:26 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:20 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 08/13] drm: export functions and write description
Date: Wed, 20 Oct 2021 04:24:04 +0530
Message-ID: <20211019225409.569355-9-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecedb80b-5131-476a-d088-08d993538ab7
X-MS-TrafficTypeDiagnostic: BN9PR12MB5132:
X-Microsoft-Antispam-PRVS: <BN9PR12MB51322133C2D88125C62E89D7E4BD9@BN9PR12MB5132.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UwSZbmof7lh7xLjlbHuIPd2XGqJwlZvVevwfeIOk9EJF1WnbMdoFSmE3sH5dZ3xe0oAlDs6lYQKinjuytSBHuoi1b73D2sIJyCrIrvJiUQLL7zAnlYPx2W/0gNbwEeTaJwTyOPQl0T4p36E/Gmq3e92HDYbiNyV5YIO6J59FN/HotdbH0zRrijfvhEQkMxys3Nt3glrloqPamcVemTNX7cuvSo7FQG/qR9IQfMMOzFngJfcXbeU20TdUgsjTJZekSOjENJmGq4aIXSvYol0eZg34XuyJE5dyjbiAOT8UGPbPecXv8juFnzLDcb87dQkBzBvYF83Wo/Wt1eStBRFTOXHmgfNkaNHh2SGfvN88IRtcGl6wJ6NtbmK3OFZIR1wxXGYCvFaVuZg9FWYxldfhfTflC/oPV6sypruVirJeCiKseSElyI0oZMqq08mFNhBjeqinx8TJuZplYXq2E+I336/AobUg4nn/7cEn0y4gDDWYV8tzxfoNZu9Ort1sIpkO2O8nstMTKn6VT1btS6ZbTnpdA4wBXcIxHat4OABLCVKoOPBLlUG9MFf1A/69mqrCU3opp3sScCkVJKemO//e8MCcpWWifYQb01Jmi7/a5UZhZ/8NDceBHirOYZgQPGpZ/AxE8FiC/eoZMGw+3WKJvHpURApcDcmg0VMFpGk0WOnWpimzk9ZD9P4OpNtPMHMkOj9Lsvh6CH7YnAtJRCbBXA7b1j29CYVgSWQvvCTL9U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36756003)(83380400001)(82310400003)(2906002)(356005)(81166007)(47076005)(86362001)(1076003)(36860700001)(6666004)(70586007)(5660300002)(426003)(2616005)(336012)(4326008)(186003)(8676002)(16526019)(8936002)(26005)(7696005)(54906003)(110136005)(70206006)(316002)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:26.7047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecedb80b-5131-476a-d088-08d993538ab7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5132
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

Export functions and write kerneldoc description

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 89 ++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 3e3303dd6658..5eb7c4187009 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -63,6 +63,18 @@ static void mark_split(struct drm_buddy_block *block)
 	list_del(&block->link);
 }
 
+/**
+ * drm_buddy_init - init memory manager
+ *
+ * @mm: DRM buddy manager to initialize
+ * @size: size in bytes to manage
+ * @chunk_size: minimum page size in bytes for our allocations
+ *
+ * Initializes the memory manager and its resources.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
 int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
 {
 	unsigned int i;
@@ -144,7 +156,15 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
 	kfree(mm->free_list);
 	return -ENOMEM;
 }
+EXPORT_SYMBOL(drm_buddy_init);
 
+/**
+ * drm_buddy_fini - tear down the memory manager
+ *
+ * @mm: DRM buddy manager to free
+ *
+ * Cleanup memory manager resources and the freelist
+ */
 void drm_buddy_fini(struct drm_buddy_mm *mm)
 {
 	int i;
@@ -159,6 +179,7 @@ void drm_buddy_fini(struct drm_buddy_mm *mm)
 	kfree(mm->roots);
 	kfree(mm->free_list);
 }
+EXPORT_SYMBOL(drm_buddy_fini);
 
 static int split_block(struct drm_buddy_mm *mm,
 		       struct drm_buddy_block *block)
@@ -235,6 +256,12 @@ void drm_buddy_free(struct drm_buddy_mm *mm,
 	__drm_buddy_free(mm, block);
 }
 
+/**
+ * drm_buddy_free_list - free blocks
+ *
+ * @mm: DRM buddy manager
+ * @objects: input list head to free blocks
+ */
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
 {
 	struct drm_buddy_block *block, *on;
@@ -245,6 +272,7 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
 	}
 	INIT_LIST_HEAD(objects);
 }
+EXPORT_SYMBOL(drm_buddy_free_list);
 
 static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
 {
@@ -256,6 +284,20 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
+/**
+ * drm_buddy_free_unused_pages - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @actual_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and it can be freed.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
 int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
 				u64 actual_size,
 				struct list_head *blocks)
@@ -342,6 +384,7 @@ int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
 		__drm_buddy_free(mm, block);
 	return err;
 }
+EXPORT_SYMBOL(drm_buddy_free_unused_pages);
 
 static struct drm_buddy_block *
 alloc_range(struct drm_buddy_mm *mm,
@@ -494,13 +537,31 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
 	return ERR_PTR(err);
 }
 
-/*
- * Allocate power-of-two block. The order value here translates to:
+/**
+ * drm_buddy_alloc - allocate power-of-two blocks
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @end: end of the allowed range for this block
+ * @size: size of the allocation
+ * @min_page_size: alignment of the allocation
+ * @blocks: output list head to add allocated blocks
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
+ *
+ * alloc_range() invoked on range limitations, which traverses
+ * the tree and returns the desired block.
+ *
+ * alloc_from_freelist() called when *no* range restrictions
+ * are enforced, which picks the block from the freelist.
+ *
+ * blocks are allocated in order, order value here translates to:
  *
- *   0 = 2^0 * mm->chunk_size
- *   1 = 2^1 * mm->chunk_size
- *   2 = 2^2 * mm->chunk_size
- *   ...
+ * 0 = 2^0 * mm->chunk_size
+ * 1 = 2^1 * mm->chunk_size
+ * 2 = 2^2 * mm->chunk_size
+ *
+ * Returns:
+ * 0 on success, error code on failure.
  */
 int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    u64 start, u64 end, u64 size,
@@ -573,7 +634,15 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
+EXPORT_SYMBOL(drm_buddy_alloc);
 
+/**
+ * drm_buddy_block_print - print block information
+ *
+ * @mm: DRM buddy manager
+ * @block: DRM buddy block
+ * @p: DRM printer to use
+ */
 void drm_buddy_block_print(struct drm_buddy_mm *mm,
 			   struct drm_buddy_block *block,
 			   struct drm_printer *p)
@@ -583,7 +652,14 @@ void drm_buddy_block_print(struct drm_buddy_mm *mm,
 
 	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
 }
+EXPORT_SYMBOL(drm_buddy_block_print);
 
+/**
+ * drm_buddy_print - print allocator state
+ *
+ * @mm: DRM buddy manager
+ * @p: DRM printer to use
+ */
 void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p)
 {
 	int order;
@@ -611,6 +687,7 @@ void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p)
 		drm_printf(p, ", pages: %llu\n", count);
 	}
 }
+EXPORT_SYMBOL(drm_buddy_print);
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/i915_buddy.c"
-- 
2.25.1

