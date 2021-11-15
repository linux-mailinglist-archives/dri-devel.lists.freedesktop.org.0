Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C2D451248
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4116EA90;
	Mon, 15 Nov 2021 19:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695736E5D1;
 Mon, 15 Nov 2021 19:33:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ggu2RnG4mQOQkFOqEy7+vOyMy1l9ESYMrO5uTJUOpHrGQaMPMwqt7Hf1NcOpKkLUWUXlRlnbeq5FLN7/6WHIoe8YGYfCWuuimeAv1kya7xA0zUh9Z0z2Zs51x3KxvZ64EcfP+muNVUsJXIvyIzocK5i20a573Xb11eNMZoUejxb9yAJ7MG9tYbI//fAQV77eCB8FESr1bAzHYaHXu07DURHAfGp6fXhHYx4QtkMDudAce6MevsbL2GXE/jj5SGxl+8WK8TU40B9joNdLFBzFhr3CQahcWOZC6SmlYthznOapuU7JcOGlberCDj9YmrXlCnY5Mdyyyw55C4RMMHs0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL06HOrjQA2i40zvbmNuX4zIkQj8aQxAio/2P0AiUDg=;
 b=mtjKBkbYOLe4ZBrc/8APKh8LU+x0gwP6HcxcAF5YFfEiY9dJ/Zc+JC22kl/In08GKZl7epkM/NjNjOduBHxL8GrRdZ/bLod7siXlneA/MfS0TsXqOjWD5M5x3FUicdherE3TDwp1UeRUSodblw0p/FLi1DZO09iqK81qzC8FAy/90ifNT+wTTzc07N2z0whybfV8nxdcAFQlYvrB/G3sycSPOYhCtlZk9M65KnPcQnAMAal0GcOckrBx4R15J9GjeHRa9CKVBH0z5RDhVTEWg1/Q33eZtFBbaMDMQU7l8BNZCK0npK58dCICYUxf2UP80vvON8YwBsCTvQOppV4AwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL06HOrjQA2i40zvbmNuX4zIkQj8aQxAio/2P0AiUDg=;
 b=O8LYBjIYaXgC4kZdqPFfWq7U4HRAOnJdYdnDLmU6AuBHk3+htHaAaCIwOW722LlS6arw8WATF124OJ73wS9FuRGBMIDZOszAl7yspTZFQKLU1qHHNL5iIkEcJVeM05Jxmj7Abdl2rCG71mm3ilIoraMhBUIGR6xkFSiCn5yjok8=
Received: from MW4PR03CA0259.namprd03.prod.outlook.com (2603:10b6:303:b4::24)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 19:33:27 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::ce) by MW4PR03CA0259.outlook.office365.com
 (2603:10b6:303:b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 19:33:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:33:27 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:33:22 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Date: Mon, 15 Nov 2021 13:33:06 -0600
Message-ID: <20211115193306.27734-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193306.27734-1-alex.sierra@amd.com>
References: <20211115193306.27734-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55420332-6505-4eb7-e57d-08d9a86ecc1a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4469:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44695FE7832B68E3DD4302CFFD989@MN2PR12MB4469.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mjtfb1UGaqS9r+WEvMF3EKIQce/Aoce5QQxIEpDP1R+zQhezE5fxz65lo6aHUWGdVB1hrEzkz8yrEDhMynzrnEl2ClBec07kIfHSL+dSyAPdKCGaJ+w4QX3oNeYTOId/VnXST9AuBCjNoLGlIwTKY8aZfN7zvCC/emiMQDlCgmxZmB9fNzd73YAvOLhoHWbpJtIiklL9/LdjJIi0qzg5fgxorlmKoYkTO7wOt8yGvKAIi7DHfuJfcFJbk4mC23Uy6zrXo9/a3hihCQ7PYehqN5xzm/a8U0gBS8nyJwIZTPgnSWra/ObFMMYl646fnPUrKdroBqsoHUQUmpWGa7BPGa2vU90gVQgOM6pUNMyiJTNlWNLAOvXAlSgprJJCcdXhMeW3dzDgsXAUbMs1dkYJokzfWA7C4XEo2mSo2FNDKt1g8F6tYRmJeuwEK3xxWRmpgvE7iL9yEvPxjHG8jJwcjSEclrdtebCWngGgtOGNS/20As1oJGE+MVVjvsjImjpzYU2VlKA5j1ZQpb7g+WjK4BrlxZLTvn11YJksY3xfii/p2iUye/6mXdhENgbjmpXGKMU6fpREAPKVF21YTnNk0/66b64bERG5d1WEuWZms7M+AgkRzqS9igYc85jD3HpZu9Q0w3DdzvGiXV95jrr6pnha+X6JrvY/6N6C96ubbtoZa0uh6Pxx9ef6QSoBz+rdbQ7fZcR8s/G5u5Gkl+GVqVMsgHkc+51eouBBuw+r0kA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(508600001)(8676002)(7696005)(81166007)(7416002)(1076003)(83380400001)(44832011)(110136005)(86362001)(54906003)(36860700001)(36756003)(426003)(336012)(4326008)(6666004)(5660300002)(356005)(2616005)(82310400003)(47076005)(8936002)(186003)(26005)(2906002)(16526019)(30864003)(316002)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:33:27.2270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55420332-6505-4eb7-e57d-08d9a86ecc1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

ZONE_DEVICE struct pages have an extra reference count that complicates the
code for put_page() and several places in the kernel that need to check the
reference count to see that a page is not being used (gup, compaction,
migration, etc.). Clean up the code so the reference count doesn't need to
be treated specially for ZONE_DEVICE.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  3 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
 fs/dax.c                                 |  4 +-
 include/linux/dax.h                      |  2 +-
 include/linux/memremap.h                 |  7 ++-
 include/linux/mm.h                       | 11 ----
 lib/test_hmm.c                           |  2 +-
 mm/internal.h                            |  7 +++
 mm/memcontrol.c                          |  6 +-
 mm/memremap.c                            | 72 +++++++-----------------
 mm/migrate.c                             |  5 --
 mm/page_alloc.c                          |  3 +
 mm/swap.c                                | 45 ++-------------
 14 files changed, 48 insertions(+), 123 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index a7061ee3b157..4de7c77ea17b 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -712,7 +712,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 
 	dpage = pfn_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 out_clear:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 3e405f078ade..c1b41c301a67 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -224,7 +224,8 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	page = pfn_to_page(pfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
-	get_page(page);
+	VM_BUG_ON_PAGE(page_ref_count(page), page);
+	init_page_count(page);
 	lock_page(page);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..8bc7120e1216 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -324,7 +324,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 			return NULL;
 	}
 
-	get_page(page);
+	init_page_count(page);
 	lock_page(page);
 	return page;
 }
diff --git a/fs/dax.c b/fs/dax.c
index 84803c835650..72bb6f1e155c 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -572,14 +572,14 @@ static void *grab_mapping_entry(struct xa_state *xas,
 
 /**
  * dax_layout_busy_page_range - find first pinned page in @mapping
- * @mapping: address space to scan for a page with ref count > 1
+ * @mapping: address space to scan for a page with ref count > 0
  * @start: Starting offset. Page containing 'start' is included.
  * @end: End offset. Page containing 'end' is included. If 'end' is LLONG_MAX,
  *       pages from 'start' till the end of file are included.
  *
  * DAX requires ZONE_DEVICE mapped pages. These pages are never
  * 'onlined' to the page allocator so they are considered idle when
- * page->count == 1. A filesystem uses this interface to determine if
+ * page->count == 0. A filesystem uses this interface to determine if
  * any page in the mapping is busy, i.e. for DMA, or other
  * get_user_pages() usages.
  *
diff --git a/include/linux/dax.h b/include/linux/dax.h
index c9c27fbf0b98..1d3e25d51fc6 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -218,7 +218,7 @@ static inline bool dax_mapping(struct address_space *mapping)
 
 static inline bool dax_page_unused(struct page *page)
 {
-	return page_ref_count(page) == 1;
+	return page_ref_count(page) == 0;
 }
 
 #define dax_wait_page(_inode, _page, _wait_cb)				\
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index ff4d398edf35..8340e39241fc 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -74,9 +74,10 @@ enum memory_type {
 
 struct dev_pagemap_ops {
 	/*
-	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
-	 * reach 0 refcount unless there is a refcount bug. This allows the
-	 * device driver to implement its own memory management.)
+	 * Called once the page refcount reaches 0. The reference count
+	 * should be reset to one with init_page_count(page) before reusing
+	 * the page. This allows the device driver to implement its own
+	 * memory management.
 	 */
 	void (*page_free)(struct page *page);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d23b6ebd2177..e7bee143d683 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1241,17 +1241,6 @@ static inline void put_page(struct page *page)
 {
 	page = compound_head(page);
 
-	/*
-	 * For devmap managed pages we need to catch refcount transition from
-	 * 2 to 1, when refcount reach one it means the page is free and we
-	 * need to inform the device driver through callback. See
-	 * include/linux/memremap.h and HMM for details.
-	 */
-	if (page_is_devmap_managed(page)) {
-		put_devmap_managed_page(page);
-		return;
-	}
-
 	if (put_page_testzero(page))
 		__put_page(page);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9e2cc0cd4412..50f3f33d5705 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -595,7 +595,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	}
 
 	dpage->zone_device_data = rpage;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 
diff --git a/mm/internal.h b/mm/internal.h
index cf3cb933eba3..505e2c0785e1 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -670,5 +670,12 @@ void vunmap_range_noflush(unsigned long start, unsigned long end);
 
 int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
+#ifdef CONFIG_DEV_PAGEMAP_OPS
+void free_zone_device_page(struct page *page);
+#else
+static inline void free_zone_device_page(struct page *page)
+{
+}
+#endif
 
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index e0275ebe1198..a986e21d085e 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5515,11 +5515,7 @@ static struct page *mc_handle_swap_pte(struct vm_area_struct *vma,
 	 */
 	if (is_device_private_entry(ent)) {
 		page = pfn_swap_entry_to_page(ent);
-		/*
-		 * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
-		 * a refcount of 1 when free (unlike normal page)
-		 */
-		if (!page_ref_add_unless(page, 1, 1))
+		if (!get_page_unless_zero(page))
 			return NULL;
 		return page;
 	}
diff --git a/mm/memremap.c b/mm/memremap.c
index 94d6a1e01d42..56c1e989c90a 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
 
@@ -37,34 +38,6 @@ unsigned long memremap_compat_align(void)
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-DEFINE_STATIC_KEY_FALSE(devmap_managed_key);
-EXPORT_SYMBOL(devmap_managed_key);
-
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_COHERENT ||
-	    pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_dec(&devmap_managed_key);
-}
-
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_COHERENT ||
-	    pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_inc(&devmap_managed_key);
-}
-#else
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-}
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 static void pgmap_array_delete(struct range *range)
 {
 	xa_store_range(&pgmap_array, PHYS_PFN(range->start), PHYS_PFN(range->end),
@@ -104,16 +77,6 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
 	return (range->start + range_len(range)) >> PAGE_SHIFT;
 }
 
-static unsigned long pfn_next(unsigned long pfn)
-{
-	if (pfn % 1024 == 0)
-		cond_resched();
-	return pfn + 1;
-}
-
-#define for_each_device_pfn(pfn, map, i) \
-	for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(pfn))
-
 static void dev_pagemap_kill(struct dev_pagemap *pgmap)
 {
 	if (pgmap->ops && pgmap->ops->kill)
@@ -166,20 +129,18 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 
 void memunmap_pages(struct dev_pagemap *pgmap)
 {
-	unsigned long pfn;
 	int i;
 
 	dev_pagemap_kill(pgmap);
 	for (i = 0; i < pgmap->nr_range; i++)
-		for_each_device_pfn(pfn, pgmap, i)
-			put_page(pfn_to_page(pfn));
+		percpu_ref_put_many(pgmap->ref, pfn_end(pgmap, i) -
+						pfn_first(pgmap, i));
 	dev_pagemap_cleanup(pgmap);
 
 	for (i = 0; i < pgmap->nr_range; i++)
 		pageunmap_range(pgmap, i);
 
 	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
-	devmap_managed_enable_put(pgmap);
 }
 EXPORT_SYMBOL_GPL(memunmap_pages);
 
@@ -382,8 +343,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 	}
 
-	devmap_managed_enable_get(pgmap);
-
 	/*
 	 * Clear the pgmap nr_range as it will be incremented for each
 	 * successfully processed range. This communicates how many
@@ -498,16 +457,9 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page)
+static void free_device_page(struct page *page)
 {
-	/* notify page idle for dax */
-	if (!is_device_page(page)) {
-		wake_up_var(&page->_refcount);
-		return;
-	}
-
 	__ClearPageWaiters(page);
-
 	mem_cgroup_uncharge(page);
 
 	/*
@@ -534,4 +486,20 @@ void free_devmap_managed_page(struct page *page)
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);
 }
+
+void free_zone_device_page(struct page *page)
+{
+	switch (page->pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
+		free_device_page(page);
+		return;
+	case MEMORY_DEVICE_FS_DAX:
+		/* notify page idle */
+		wake_up_var(&page->_refcount);
+		return;
+	default:
+		return;
+	}
+}
 #endif /* CONFIG_DEV_PAGEMAP_OPS */
diff --git a/mm/migrate.c b/mm/migrate.c
index 166bfec7d85e..97ffe988e09e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -358,11 +358,6 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 {
 	int expected_count = 1;
 
-	/*
-	 * Device private pages have an extra refcount as they are
-	 * ZONE_DEVICE pages.
-	 */
-	expected_count += is_device_page(page);
 	if (mapping)
 		expected_count += thp_nr_pages(page) + page_has_private(page);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b37435c274cf..9fe358706dd8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6580,6 +6580,9 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		__init_single_page(page, pfn, zone_idx, nid);
 
+		/* ZONE_DEVICE pages start with a zero reference count. */
+		set_page_count(page, 0);
+
 		/*
 		 * Mark page reserved as it will need to wait for onlining
 		 * phase for it to be fully associated with a zone.
diff --git a/mm/swap.c b/mm/swap.c
index af3cad4e5378..d124915be116 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -114,12 +114,11 @@ static void __put_compound_page(struct page *page)
 void __put_page(struct page *page)
 {
 	if (is_zone_device_page(page)) {
-		put_dev_pagemap(page->pgmap);
-
 		/*
 		 * The page belongs to the device that created pgmap. Do
 		 * not return it to page allocator.
 		 */
+		free_zone_device_page(page);
 		return;
 	}
 
@@ -908,29 +907,18 @@ void release_pages(struct page **pages, int nr)
 		if (is_huge_zero_page(page))
 			continue;
 
+		if (!put_page_testzero(page))
+			continue;
+
 		if (is_zone_device_page(page)) {
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
-			/*
-			 * ZONE_DEVICE pages that return 'false' from
-			 * page_is_devmap_managed() do not require special
-			 * processing, and instead, expect a call to
-			 * put_page_testzero().
-			 */
-			if (page_is_devmap_managed(page)) {
-				put_devmap_managed_page(page);
-				continue;
-			}
-			if (put_page_testzero(page))
-				put_dev_pagemap(page->pgmap);
+			free_zone_device_page(page);
 			continue;
 		}
 
-		if (!put_page_testzero(page))
-			continue;
-
 		if (PageCompound(page)) {
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
@@ -1134,26 +1122,3 @@ void __init swap_setup(void)
 	 * _really_ don't want to cluster much more
 	 */
 }
-
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-void put_devmap_managed_page(struct page *page)
-{
-	int count;
-
-	if (WARN_ON_ONCE(!page_is_devmap_managed(page)))
-		return;
-
-	count = page_ref_dec_return(page);
-
-	/*
-	 * devmap page refcounts are 1-based, rather than 0-based: if
-	 * refcount is 1, then the page is free and the refcount is
-	 * stable because nobody holds a reference on the page.
-	 */
-	if (count == 1)
-		free_devmap_managed_page(page);
-	else if (!count)
-		__put_page(page);
-}
-EXPORT_SYMBOL(put_devmap_managed_page);
-#endif
-- 
2.32.0

