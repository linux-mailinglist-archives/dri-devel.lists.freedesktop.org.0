Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2842AA7B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2416E54C;
	Tue, 12 Oct 2021 17:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAC189FCE;
 Tue, 12 Oct 2021 17:13:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6AmOJ0eJpGlYTQLdna7XWpsT+H9XAhYgfAzrL8mhgD9H0uM8OJ5rGXSyC0GLeqH6HoGO8L6zlGP0tiAHEToZkJvUKMBwRx2wnBn/ax9drn1I52qLhPjN/r85irq58opn2LTEPfTGvLDGUVdS9GMY+FtAJaJ9g+lcAQpODNTOX2LEgbpxDtfz6gLcAXugzqygRRv9956vXIdSsSwWmFirNFtBFQAPR07nrcF8cwD0F6NVL+QZn3e0oNRALuBFphwN/Atf7gfRKz7eb8dY4M0U1AXEy3VlZrfLVSkqTJMCxp4AKm5f7sABes/Puo+ne3yDYxkZSy9sUd/mPJDWBn30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2387Ecpm50AyQpEEPgaG085PdkylS2jbP2iC7VmUXaQ=;
 b=CcSJEEmKX/6b3pW20+l+6zZq9rckFrxE7nI9oDcHR9q7mMxC6O2L3rWUb0GIrnU0CdXKpqZ7NSnHMNJTWzCQWqOqcM2tiqLKdT1VLn8lt90g9xTq8Xtbqe5aAnooDYK3cBzRvgvWzYRr81aTiPY/nfZyNssdr0owJUWWn/YsDqiOqCH+biSYNEZHd7QqDiTJv1j7bKJXddXxvm2u/JZ4iblMOkB4VK5whxgLasKv9GSEiZMiqtICPbfcMCeozdECQLjRofuGa0FYiHY9iZHQudfA9VXaZB+k2o0l8x4m54R0eJMDSKCPEI1oIIWg6VtswsBx2nm7mhw0c09njJl8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2387Ecpm50AyQpEEPgaG085PdkylS2jbP2iC7VmUXaQ=;
 b=ZCGAj1YJOxPDsbQKkRo6BA2SbTrLnKk0gzQciJ6AaqsPO6oi3kyt3sZCJvi1DCB8+yTVNfrdWTAOKn07YBsN4fy9o5pItPZvHEQptqd/xBYSfpX5Ui0loKJmqG2qHgQDlX/F4RCDDNW9VOieUqHVUeLGu63L3mSE7fh7SLpbxiI=
Received: from MW4PR04CA0299.namprd04.prod.outlook.com (2603:10b6:303:89::34)
 by BN6PR12MB1779.namprd12.prod.outlook.com (2603:10b6:404:108::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 17:13:04 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::af) by MW4PR04CA0299.outlook.office365.com
 (2603:10b6:303:89::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:04 +0000
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
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:04 +0000
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
Subject: [PATCH v1 04/12] mm: add device coherent vma selection for memory
 migration
Date: Tue, 12 Oct 2021 12:12:39 -0500
Message-ID: <20211012171247.2861-5-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a1a9b0e1-7f71-453c-a073-08d98da38d84
X-MS-TrafficTypeDiagnostic: BN6PR12MB1779:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1779232B63735F686685319BFDB69@BN6PR12MB1779.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkptXdbxVq06w0dR/YprwieV8oRRqDmloEl19FQRlT7wkE+7spI31vuJPrlsr1O8PDqA7PqDZ/yj6jK4Fd6BWWStSq52nVQa3YhZhP7x9aVFd6InEIt75H1jIr1Ppa1szFoWZ2WeGEg3Q0Kv37a14EWX/F7aAqMfqZivsfPDKFrocfwIM9u5B8u5UIlzpb9HtwRPv2xLRMwrAcyNikwa+ikct9+2rVlStzWaeNPcYhNzY45efXqR5Zz85Ey5ztz6edgEYTIH4Se/7eOkr/kfr0b/onhV3dWarXIqI49PHVn/otpBrYRdYNydZ1yKrxZ4dsBxHvyDpJq3LHuMr0yrMz1TZNeTZIQlR+S2FWEwK7ObhhlBgd0i9PO0NyoGyPY7AOm5YDdDD0m0X4ys2KRul49uUyAumWjeVGTOJRK6YlSFY04jdc9cquEjRZQ089EDTCWhUhM7Qmk/WT8VKMxaCV/kWchAiLrOyZy8LYm/3pZ8T26nrFapk/Itt5PmlAA6m6z+pc/YC+Y7JhqoyuAHp1FQKq7m3uqOQdd1JmvmhRGfUPY/lo/R3XBTbWfccrEHWUoBUlEeVvfvHNeqZgmMIkZ1W25Z3c+CDeL8feJciJg1Xfs6pJ/u0ck6RKf6vrswgPMaNCj/cLQdshJ0Oq2DswjqDye7bYcOyt2HCJ/eWKxRcBcBYlXqXWjJSxadu2VaRncXiXN7ezxB2HdWjs+dK9tzHwtHEms4VhOlAmwb/tE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(26005)(8936002)(81166007)(1076003)(508600001)(7696005)(336012)(70206006)(83380400001)(82310400003)(6666004)(2616005)(8676002)(16526019)(4326008)(186003)(70586007)(356005)(426003)(36756003)(36860700001)(2906002)(5660300002)(7416002)(54906003)(47076005)(110136005)(44832011)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:04.1251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a9b0e1-7f71-453c-a073-08d98da38d84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1779
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

This case is used to migrate pages from device memory, back to system
memory. Device coherent type memory is cache coherent from device and CPU
point of view.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
v2:
condition added when migrations from device coherent pages.
---
 include/linux/migrate.h | 1 +
 mm/migrate.c            | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 4bb4e519e3f5..b1cae5073d69 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -156,6 +156,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate.c b/mm/migrate.c
index 2bda612f3650..b40cd5a69f65 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2406,8 +2406,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
-				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
 				mpfn = MIGRATE_PFN_MIGRATE;
@@ -2415,6 +2413,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 			}
 			page = vm_normal_page(migrate->vma, addr, pte);
+			if (!is_zone_device_page(page) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+				goto next;
+			if (is_zone_device_page(page) &&
+			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
+			     page->pgmap->owner != migrate->pgmap_owner))
+				goto next;
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.32.0

