Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE442AA7D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6045A6E5CD;
	Tue, 12 Oct 2021 17:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3EA89FCE;
 Tue, 12 Oct 2021 17:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flxfKHN2zpfAsuKbV21hvaQA6xo350N6RW58Tt3BlSgEJtShX9apzUMzPl97U9R3mLk5PoyKKjCOXl0ZwpaGhM0gSzON28L7Wj5Dvk1g0U4fGBCLL836tTB/CL/BEdCsSLIDRDcQZARKsd//miLvJMhb0TXyFMmAakG1dXh1jl1asAZWWaQW9vp2YmowPlSY4hdOqBg7O+xnJGM833xn32iVk2kwY7v+245HWrjHWmlJH92G/a/b+mEtb3oA3ZPgTYj/vJrtJstdevxUPu00tE54aXujedCnAkzN/jo28w7C8RZjr1cNWhIzCOqPSk1bQDOfPZOGafxVUv0GKkl2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3JARPoydLGt1UDbIwVdt/aNNvnM7zBb7jbo/f49f+o=;
 b=YoJguOy7WsdsFLjaHPFJ4HGmP1lCwrbe9fUEZDYUs4mvMHlQPsmpsHY71GHkynFyrzEttrzdM0kEqSHPFwXa9sD5pJGlEMm9OJ4kHwHm25+jEEuXWDfmux77g+kXx/350TdEsIefuX/sYy1Joe/LnZjmQBb0PEl91Fsk2vsPYG1nUOoD2rnHCv61L9KLuyP5txUV6pd94v/s1r6KJpG+RE3sW/RnsUXSwDlhjcasZGn8n18rjDuqrXMivp0FuqUb+gG4OXJtd2clLc8fewILU4avar43eHei5gJq1jm9MQjeS0ScYIxVDsI6p5XDCkCDrxmazaBe4v1Xa9d6SS+hCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3JARPoydLGt1UDbIwVdt/aNNvnM7zBb7jbo/f49f+o=;
 b=Y4nkbjZIJjPGJCDkXZYncRUwvZs0dfaUNWsLT885bEimkPFx9i8vBUNYPlcfc6y0nuzKEQNuaKz+dCGou3yzuWz3X5SS/RnRhGM673pVS2ttNiw2IvIrLFALHKiNBzaJa+uwp8grefi7UtWq1MD17hdHUh1WHsG+3NJ0CqkeXGs=
Received: from MW4PR04CA0285.namprd04.prod.outlook.com (2603:10b6:303:89::20)
 by MN2PR12MB3423.namprd12.prod.outlook.com (2603:10b6:208:cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 17:13:03 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::f2) by MW4PR04CA0285.outlook.office365.com
 (2603:10b6:303:89::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:02 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:13:00 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 03/12] mm: add zone device coherent type memory support
Date: Tue, 12 Oct 2021 12:12:38 -0500
Message-ID: <20211012171247.2861-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211012171247.2861-1-alex.sierra@amd.com>
References: <20211012171247.2861-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 236139f5-bc16-4995-8fc3-08d98da38cc3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3423:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34237232EA0F218F0B30786DFDB69@MN2PR12MB3423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkG+W1gtKysYliQM0nqipM15O89mNmHuRRCXW9pKjvmWMoKP3kPwvfzfXYAJcHvTe+WZBd6XF1e6yTaeZoOrf7MmCDKKb9XnFMjdH7QdZzWyy9p9lNIqKq4F9dnP3Eg0sIfF5xd2jAessoJKC77c/yHgbydmf93F21HGwzBcDhDf0jrMCg/NDkXwugh6u73HT6UahUCyZg0XJcmLwDEEnGadZ8Z47ATezfX8hF+vYhXjfE6HgQlNBEhT55cFNij6eeuW6pKdaVapmKzgnQXF3Vk2gJUP+3B5TdJC0tpV+QcD/YudOfBbvQs4g/Xfi4ejzdprMcEsVLeDMqrNpDdrUnJa9zWtnX5V7qwtKuEWHIxyz1YO84rwB3LLY8zQr+sOTuE6xnDZfiFleoHcSmbamXEDIMswKsE+PBcNnqnT5CYOTtnLxEdwhmJLlyXTGLKC4fHtGEdnO0YpzrbG77rnHRlU3F6HAPEIAkRF12vyThC03sfcaCZrdj7TuIMX1oR/3UpgZ0TfJZzs64iP6OKGRlZ3JERPz4zO+R870n4V0ixEUun7Xd6s1dqBOnv7cU4v2+zKOmI2iwkMvwphRzCurHzpsHqsPAzeyORjgpscBUl9U1Y0wjar6R96dBQUYx7apHTBzw4+YmgTPuT0IjwiBT4lhrThi6QWJ9SsefDG5woATJx8otALv8JWUpUZHh5H+g7Ohqf178Svx7jFEWDURlvPgfpokB7GTP+hjfo0DM4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(36860700001)(83380400001)(7696005)(316002)(70206006)(16526019)(186003)(1076003)(36756003)(47076005)(8936002)(82310400003)(4326008)(7416002)(336012)(356005)(5660300002)(26005)(2616005)(2906002)(8676002)(6666004)(81166007)(508600001)(110136005)(426003)(44832011)(54906003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:02.8379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 236139f5-bc16-4995-8fc3-08d98da38cc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3423
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

Device memory that is cache coherent from device and CPU point of view.
This is use on platform that have an advance system bus (like CAPI or
CCIX). Any page of a process can be migrated to such memory. However,
no one should be allow to pin such memory so that it can always be
evicted.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/memremap.h |  8 ++++++++
 include/linux/mm.h       |  8 ++++++++
 mm/memcontrol.c          |  6 +++---
 mm/memory-failure.c      |  6 +++++-
 mm/memremap.c            |  2 ++
 mm/migrate.c             | 19 ++++++++++++-------
 6 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 77ff5fd0685f..d64cd2e8147a 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -39,6 +39,13 @@ struct vmem_altmap {
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/vm/hmm.rst.
  *
+ * MEMORY_DEVICE_COHERENT:
+ * Device memory that is cache coherent from device and CPU point of view. This
+ * is use on platform that have an advance system bus (like CAPI or CCIX). A
+ * driver can hotplug the device memory using ZONE_DEVICE and with that memory
+ * type. Any page of a process can be migrated to such memory. However no one
+ * should be allow to pin such memory so that it can always be evicted.
+ *
  * MEMORY_DEVICE_FS_DAX:
  * Host memory that has similar access semantics as System RAM i.e. DMA
  * coherent and supports page pinning. In support of coordinating page
@@ -59,6 +66,7 @@ struct vmem_altmap {
 enum memory_type {
 	/* 0 is reserved to catch uninitialized type fields */
 	MEMORY_DEVICE_PRIVATE = 1,
+	MEMORY_DEVICE_COHERENT,
 	MEMORY_DEVICE_FS_DAX,
 	MEMORY_DEVICE_GENERIC,
 	MEMORY_DEVICE_PCI_P2PDMA,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e24c904deeec..8bc697006a5c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1187,6 +1187,14 @@ static inline bool is_device_private_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+static inline bool is_device_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
+		page->pgmap->type == MEMORY_DEVICE_COHERENT);
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 9a6bfb4fd36c..fe5a96428dce 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5526,8 +5526,8 @@ static int mem_cgroup_move_account(struct page *page,
  *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
  *     target for charge migration. if @target is not NULL, the entry is stored
  *     in target->ent.
- *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
- *     (so ZONE_DEVICE page and thus not on the lru).
+ *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_COHERENT
+ *     or MEMORY_DEVICE_PRIVATE (so ZONE_DEVICE page and thus not on the lru).
  *     For now we such page is charge like a regular page would be as for all
  *     intent and purposes it is just special memory taking the place of a
  *     regular page.
@@ -5561,7 +5561,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
 		 */
 		if (page_memcg(page) == mc.from) {
 			ret = MC_TARGET_PAGE;
-			if (is_device_private_page(page))
+			if (is_device_page(page))
 				ret = MC_TARGET_DEVICE;
 			if (target)
 				target->page = page;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 6f5f78885ab4..1076f5a07370 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1373,12 +1373,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
 		goto unlock;
 	}
 
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
+	switch (pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 		/*
 		 * TODO: Handle HMM pages which may need coordination
 		 * with device-side memory.
 		 */
 		goto unlock;
+	default:
+		break;
 	}
 
 	/*
diff --git a/mm/memremap.c b/mm/memremap.c
index ab949a571e78..56033955d1f4 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -294,6 +294,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
 			WARN(1, "Device private memory not supported\n");
 			return ERR_PTR(-EINVAL);
@@ -493,6 +494,7 @@ void free_zone_device_page(struct page *page)
 {
 	switch (page->pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 		free_device_page(page);
 		return;
 	case MEMORY_DEVICE_FS_DAX:
diff --git a/mm/migrate.c b/mm/migrate.c
index e3a10e2a1bb3..2bda612f3650 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2565,7 +2565,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -2854,7 +2854,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or coherent page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2925,10 +2925,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 			swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
 			entry = swp_entry_to_pte(swp_entry);
+		} else if (is_device_page(page)) {
+			entry = pte_mkold(mk_pte(page,
+						 READ_ONCE(vma->vm_page_prot)));
+			if (vma->vm_flags & VM_WRITE)
+				entry = pte_mkwrite(pte_mkdirty(entry));
 		} else {
 			/*
-			 * For now we only support migrating to un-addressable
-			 * device memory.
+			 * We support migrating to private and coherent types
+			 * for device zone memory.
 			 */
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
@@ -3034,10 +3039,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_device_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and coherent
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-- 
2.32.0

