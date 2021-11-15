Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DB451246
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8600E6EA99;
	Mon, 15 Nov 2021 19:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C586E03D;
 Mon, 15 Nov 2021 19:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHNFPUR1F4ucdtYzzliXS+Eg+T5uVIjqv5mNavgaphlN+jx0U4RMj7vYNExby0t+v/UPxHBZzYyJkicn6+RHz1FmBFSEzikCvrA4ft4vYDt5pY4CTjVgJoXpYnHOeWgN18yhGVFUvn2bg+FT4QAYq40qFACMZYO2nI/iXX/sf7RjZv+GxcEUBiM3GkKFT20WBbegKYiclPf8W9WreK3ONnxp6piN2Sl0yf45aOpwHGW6l5mCD6rQ4FRP8Zq+zjfEz9LipGBnEatwW1DsJTaH9qfuKbdan1HqgLffl3XD1E36UEbqw0wwKQ7AZmWjv1ylcHWEBurP7NX6D7jnkpFvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLqF0BMC+Lpkdl20tM3fsP3f368I9Gx6A/zUulaBmc4=;
 b=UQsnaUM/L+VIm/nTuPgd2k8qFGUfN5QaWV5kedUQu+QeuIjgfC3q0QxYQ10L7Btk1wWqVpbdSY1FOGLjbZNCjBrzjPa+oAyfHCEgvEdD3Fl3Kmz9+tCucGjjPcbXvwIPD1YNsfMyrhZXyuZoBSTmc2PJQ0pslvs4vu6aUrZIceE//O/AzJpue12npwJRs9budgGVJBrdjWGxDjypgfFTth4qStx7ifrnJzdIM+57hnxHToI4d9ntoooNyWDRDNnmZF6omHNeMuDdEGJ3rpKVcuJiGszSYy3E4ZTThg9sXCXPM5FY6bRA101Fv6FsYT1+flLTsld3rV3euDns8hIeAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLqF0BMC+Lpkdl20tM3fsP3f368I9Gx6A/zUulaBmc4=;
 b=YQdsGIjma2OfoJ8QRL1XeSitNiRiB/qO/JqU4XyatBwGwOeQ1mmZce70mP9+Kb5HaOCvCo1775w3cEMGBnOHrGpn6qYocp4gYkFtpq1rMs89B1ZmVAlx+pt3TsnnhbfCz8+cAtrVgb8+dPPe6xwmp1cQCDwyRJMPIlLyQCCdggQ=
Received: from MW4PR03CA0244.namprd03.prod.outlook.com (2603:10b6:303:b4::9)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 19:33:25 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::76) by MW4PR03CA0244.outlook.office365.com
 (2603:10b6:303:b4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Mon, 15 Nov 2021 19:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:33:22 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:33:20 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 0/2] Remove extra ZONE_DEVICE page refcount  
Date: Mon, 15 Nov 2021 13:33:04 -0600
Message-ID: <20211115193306.27734-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d221db-024e-44c6-73f7-08d9a86ec93c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4566:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45663F919337A071273A7730FD989@MN2PR12MB4566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/IzQs8YAPEmALQXsQypKf57PGKN3SUZ3tPHZJHVZBpkcq7kai7cTdkbb5GvUTYfXt+2v1EA0eYZBpm77p5Y71uPF7aKuLsHR8ZfvN217R1YiT+6eoIwDu3sdjcKFv9vxJbXSe/s8bwGBXhaGPEUbhGflizblYnWrS6rENcJHhHH3hNs5RSA5dSrWkY5vwBA5Mfh/8kFOXro41WJAB4ykEiKLu+i8wuECu9BjlykF9aCfx9T0uYIuhpUI3oOdxI/LQtMasvPYVtDdO16kTwAufcvJTd0DHk9s5K0gnr0lYD797HragCQxKleGJblTC+ojbv2ufEtKxuOYphjYBFlbn//+rNywA1w2Lv9ul4Xqpi+ukrdu/c/6oijacLSDX1REFmDAEIUZqb47fRe/s3FaNw4OJCkww7LDpJjD46cXJq6p3+OFJK3Ba9MzEVSsy2iCNwpO+H5pjtpv+YCquL13pYaw/IemCTMxUJC4n5yv7YdYXCMn+F2WqDMWXvnfoJJT1mI5sv4osWzYay2c+61f2ztykxuf7XVv/9xElOJBlhCYYzL6u9sBooPB/cSZF4B7efc9MXCdO4Ze/l6/8rf6o1iaAwna8PPg/CwkH8hJSTTyAT5ucmnFMlzgxxb61P0ozf961M/iBplgg59ZPFFeAys0CZ/5ZDNTzBoKGt6VhshUFVJ+Q7Hbq4uSgFuop8nUC7oMKYMlhaevKumQbZ517ECivSpmOXopNd4NFsEg6cVVxHPLN0v7nvbzWpShUGsPu6005apuMRLB2N1h1o2zvww3rMrf8il4Km/3uAJ2LsuUDWUouVeOtQB7Umj+iuj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(508600001)(83380400001)(8676002)(36756003)(426003)(86362001)(8936002)(2616005)(7696005)(110136005)(316002)(1076003)(36860700001)(5660300002)(81166007)(44832011)(54906003)(82310400003)(70206006)(356005)(70586007)(26005)(7416002)(186003)(47076005)(336012)(4326008)(16526019)(6666004)(966005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:33:22.4127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d221db-024e-44c6-73f7-08d9a86ec93c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566
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

This patch includes Ralph Campbell’s ZONE_DEVICE refcount cleanup and
additionally the changes necessary to avoid breaking the separately
submitted MEMORY_DEVICE_COHERENT page migration code.
Ralph’s original description:
ZONE_DEVICE struct pages have an extra reference count that complicates
the code for put_page() and several places in the kernel that need to
check the reference count to see that a page is not being used (gup,
compaction, migration, etc.). Clean up the code so the reference count
doesn't need to be treated specially for ZONE_DEVICE.
Following a suggestion by Christoph, we attempted to combine this
cleanup with the device patch migration patch series, however this
caused xftests 413 to fail with a warning, the root cause of which has
large kernel footprint than just device memory. Fixing this issue
properly will require cooperation between multiple development groups
working across multiple kernel subsystems, as is apparent from the
discussion under the earlier, combined patch submission.
We therefore propose to break this work out separately as its own patch,
so it can receive the cooperative development work it needs. The deep
problem arises from the get_user_pages API, which has proved troublesome
for many years. It is possible that a concerted effort to repair this
particular refcount issue properly will be a step in the direction of
rationalizing this popular and problematic API.
In the larger picture, this API rationalization work probably deserves
an agenda item at the upcoming Filesystem, MM & BPF Summit:
https://events.linuxfoundation.org/lsfmm/

The wide ranging discussion following previous iterations of the
migration patchset focused almost exclusively on the refcount cleanup
patch. The thread is here:
https://lore.kernel.org/linux-mm/20211014153928.16805-3-alex.sierra@amd.com/
and links a number of previous threads. It is apparent that there is a
lot of work in progress by a number of developer groups in parallel,
and that there are issues with the order in which this work should be
attempted and merged.
Jason provided his list of “balls in the air”:
 - Joao's compound page support for device_dax and more
 - Alex's DEVICE_COHERENT
 - The refcount normalization
 - Removing the pgmap test from GUP
 - Removing the need for the PUD/PMD/PTE special bit
 - Removing the need for the PUD/PMD/PTE devmap bit
 - Remove PUD/PMD vma_is_special
 - folios for fsdax
 - shootdown for fsdax
It is not clear that the refcount cleanup in this patch should be the
first item on the list to be merged, however it has proved to be a good
starting point for a cooperative effort to address the underlying
issues.
Ralph, if you would prefer to take back “ownership” of this patch, it’s
yours, otherwise we will be happy to keep it in play and get it merged
when some other pieces of the puzzle fall into place.

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  3 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
 fs/dax.c                                 |  8 +--
 fs/ext4/inode.c                          |  5 +-
 fs/fuse/dax.c                            |  4 +-
 fs/xfs/xfs_file.c                        |  4 +-
 include/linux/dax.h                      | 10 ++++
 include/linux/memremap.h                 |  7 ++-
 include/linux/mm.h                       | 11 ----
 lib/test_hmm.c                           |  2 +-
 mm/internal.h                            |  7 +++
 mm/memcontrol.c                          |  6 +-
 mm/memremap.c                            | 72 +++++++-----------------
 mm/migrate.c                             |  5 --
 mm/page_alloc.c                          |  3 +
 mm/swap.c                                | 45 ++-------------
 17 files changed, 62 insertions(+), 134 deletions(-)

-- 
2.32.0

