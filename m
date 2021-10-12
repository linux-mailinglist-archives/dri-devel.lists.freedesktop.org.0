Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987FD42AA73
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF9D89FD4;
	Tue, 12 Oct 2021 17:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292ED89F3C;
 Tue, 12 Oct 2021 17:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2VPpTvDvyxWPkGTVFwOSf/gV96ZUfijuM3e2pD7yiqQiEudvKDhkt9skX1kNGoqmhEC0zZ32ok0xPC2EFGiHIuVxa6i3u4PTAh/Gdiz93oESsdKarPFPfILEqxlGNVDmYtxsu8lkR8VYT08zjcjKRSq5wPxtrVvaJ8/Jr1ujrZJ9cGqOj9WLVRUYKbs3pQJmPkVxTdpe9We3k+cs1Rr6C9maV2JPxR+AJ+p9/KxavD6HOma1X570Eh8qc0P34VJP2GYztlxjV0eG/c5N2hhVG+xWlRVR9n6zXrEd7i7m8PXDiPbnibVo4H0oACVfmGb+MJLEhv0Tp6hnXVEnMAX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prqqgRWlNmUY+FCzPMwMlLKkTVbC2ZOWpWdIq8n/6hw=;
 b=Lb5Qg+CPF4sDaEJkxridy8L2rJnXquolU+UL/QMcHfoVoYP46tGr1krZhJ7NAMHmL86YzwrymoujchfK4JW6owAq9XxaTpz/7PW2gYA3dw1Xv0foWOlxRDgqOKuYWmOWsKu+KHzYRPpVYvV4T6wpVoJk2jrOZAa62dQYPu37no5WJQ4rAmG7neOMP+ktgqeR9okjRFFecVqOODjM92vgNYQayyqwE1eEwTE9FagTJFardbNcLcqUpUKLJGvo4PrWpYwf2P8PaHwFOhy2TLOCHXA0yVZgNvqPIg3mZbmJeySP5XZOeOwgXnq1jf+T2ppS6pYYCo3Inke19QpCg6lt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prqqgRWlNmUY+FCzPMwMlLKkTVbC2ZOWpWdIq8n/6hw=;
 b=W299mrfcLzyYpKyLdyQ0Quo0yXPX3ylduTuyWyZQcFDnirtn7NucX5b4ebrTdrrS2UdDRJa0/6sfZ+lWohnNoNAeOk9wj6nbNGAhalU+g+TzwhT3IOW8HX0BoWhf7RKAei6EMgCh6v0PfaSOGS9cq3n4RgOmUJgSzy4R7V6n0ts=
Received: from MW4PR04CA0284.namprd04.prod.outlook.com (2603:10b6:303:89::19)
 by SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 17:13:01 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::43) by MW4PR04CA0284.outlook.office365.com
 (2603:10b6:303:89::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:01 +0000
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
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:01 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:12:58 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 01/12] ext4/xfs: add page refcount helper
Date: Tue, 12 Oct 2021 12:12:36 -0500
Message-ID: <20211012171247.2861-2-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8e3ea715-00a1-4afb-5580-08d98da38bac
X-MS-TrafficTypeDiagnostic: SA0PR12MB4512:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4512F560EFC73D900A16DF58FDB69@SA0PR12MB4512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jtMTfNAceBhf8FQmAGtJoBdU7jveQ/4yan0XVhsAoqNyHR3XrSzcIs+JJ3kPYTiKPJuGd5HcRq1ysyXZ8Uzv81vreesR+Bl2pCHx6/FpiTx4HYu167XAkqfyaIBaEnWx5p3U22UFDg/1dwaF+7xkQOlr5QlojKUUCO8IbJ+8iRr+gxrJBGm92OHNFUKj5ZJCK+H3U32xXMxyqzMEQRhFwNDRwqp3VgWt7Hsj01+ywBKjE4h8KwOLUe8UIM6EYse0WUygxM5M5hWlJyYH/vejVnMdzpcqVU/lyRGEv/8nMKc+uVUn6zK/LvBuMT6L+HJY2Mzof4Yql+tSxRwNR5UUNUboCRg4dV/jDic7Q0vcI7f8/87dOTtW0jTSR7BZ229aX2LpQIpJPX3JYcte4jjcopgzH6Xb5eb5Quuc62whqZYs8B+kONoPdbFlS9HfQW77ubcvzUxD9mt2rOLP1DL/wjGvQqXIoXm3fydffjyMhczopYa8eKmIYuGQhr+NeH3MPNfRM/4ZLM8TvbcGwqCfJCEtAlEGWSNb7MTXTCwxD19GoGAJedDDB7bmc7BluurpwHpodgqPQ9sWdaku6gcctXLAe3/seVQu+xz8sGirqavCT6mIvC9x5XiFpxHZO6hnDfKRDMZEw1SMaTIgCXvBumPfKNFAohxf4YUiBUuJJD6h9s2YiaEMOjQ4kYahKTnV6sqFfOoAZRzTCW8vWSO3MfvcQbPLkFuFzlJpIaz4AE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(8676002)(336012)(7416002)(7696005)(86362001)(36860700001)(4326008)(83380400001)(1076003)(2906002)(316002)(44832011)(5660300002)(81166007)(2616005)(426003)(54906003)(186003)(16526019)(82310400003)(8936002)(6666004)(508600001)(70586007)(70206006)(47076005)(26005)(110136005)(356005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:01.0389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3ea715-00a1-4afb-5580-08d98da38bac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512
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

From: Ralph Campbell <rcampbell@nvidia.com>

There are several places where ZONE_DEVICE struct pages assume a reference
count == 1 means the page is idle and free. Instead of open coding this,
add a helper function to hide this detail.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Theodore Ts'o <tytso@mit.edu>
Acked-by: Darrick J. Wong <djwong@kernel.org>
---
v3:
[AS]: rename dax_layout_is_idle_page func to dax_page_unused

v4:
[AS]: This ref count functionality was missing on fuse/dax.c.
---
 fs/dax.c            |  4 ++--
 fs/ext4/inode.c     |  5 +----
 fs/fuse/dax.c       |  4 +---
 fs/xfs/xfs_file.c   |  4 +---
 include/linux/dax.h | 10 ++++++++++
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 62352cbcf0f4..c387d09e3e5a 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -369,7 +369,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_page_unused(page));
 		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
 		page->mapping = NULL;
 		page->index = 0;
@@ -383,7 +383,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (page_ref_count(page) > 1)
+		if (!dax_page_unused(page))
 			return page;
 	}
 	return NULL;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index fe6045a46599..05ffe6875cb1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3971,10 +3971,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(ei));
+		error = dax_wait_page(ei, page, ext4_wait_dax_page);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index ff99ab2a3c43..2b1f190ba78a 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -677,9 +677,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page(inode, page, fuse_wait_dax_page);
 }
 
 /* dmap_end == 0 leads to unmapping of whole file */
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 396ef36dcd0a..182057281086 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -840,9 +840,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page(inode, page, xfs_wait_dax_page);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index b52f084aa643..8b5da1d60dbc 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
 	return mapping->host && IS_DAX(mapping->host);
 }
 
+static inline bool dax_page_unused(struct page *page)
+{
+	return page_ref_count(page) == 1;
+}
+
+#define dax_wait_page(_inode, _page, _wait_cb)				\
+	___wait_var_event(&(_page)->_refcount,				\
+		dax_page_unused(_page),				\
+		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
+
 #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
 void hmem_register_device(int target_nid, struct resource *r);
 #else
-- 
2.32.0

