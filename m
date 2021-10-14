Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C36E42DE69
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44F96E182;
	Thu, 14 Oct 2021 15:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162216E182;
 Thu, 14 Oct 2021 15:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS4lnx1/cBZIGKUIuXbmGNKkETz4x9iZ4Pdq2q3H0m8CE0iwLtlUjQlS3gf+AHHxacHe/lQTreH4qEEPOR3uYW1oRREtS5xINY2BzRdV0UDUC8ZLXTIqEY+cTP+zLFCNp3IOY9igHT7T3FkgrRtH5eddatv3d9w+McFKXJIY5KRTyBkok9ZVkBvVBnClIORqGrdBmM9rtiqVAyETl0H34e2xkEfcbYahDdL9am9IqZ2A9hywkptkIX8TQfd7gwrBYbUALO9wxNJxaDS4jRV3+zl/M6uP4Ht2rFmiOjH0umeXkphoxKV9PePk8lStUYx72wfzh17eOHX3rSSijCoyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bn8qAdDaHiVmdCG6MQFYTmjp/vL9YDLKlxT4aAjtWk=;
 b=Mv1i760n2OsTdL2S5+yvAZnOlh5K/PMocGjIOZzku41x5K15WfNP1PPP8GeS9WcCkp5qYbfaa0SPeI0PeB3nM4wJZ6cRj/25h+rtB/PIn2jJC4RIEdSjedRuVENa59LGa/yMN9yqC5bmBqs/foL/2U1eUlCG+v+pHbH/4fShI4qQoz3v7ZsLzTVGeH1JglNRdRiypyuI75ENCovacz56Mi1bY5o70LNDFxfXMf9y/pvOBVqByEuwaVU9f4nq3gt5wi4u102GB7D+JP48ILP/OnSkK865Esh4fVeIyiItn5H8iQsQmUtJvI1To7RaZLqTpvD82Tw3bMiKjKdEXyu/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bn8qAdDaHiVmdCG6MQFYTmjp/vL9YDLKlxT4aAjtWk=;
 b=R9ZBGs/3eD0RRB71PnzbmYMoZkQll5BNmSGbqpBckbpIE47PjSXlj8MYxTdL/6VOu27TjMitZr+c+YGGVb7CeFcd/SjGaayqFIE1T0Zcdp+t++/yhb72hn95WP9yYdnzfU93qmYpdnyeULuGZ0FY7YJfSOhJUGsSXOpSy21lou8=
Received: from CO2PR04CA0100.namprd04.prod.outlook.com (2603:10b6:104:6::26)
 by DM6PR12MB4579.namprd12.prod.outlook.com (2603:10b6:5:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 15:39:40 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::15) by CO2PR04CA0100.outlook.office365.com
 (2603:10b6:104:6::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 15:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 15:39:39 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 10:39:38 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>,
 <willy@infradead.org>
Subject: [PATCH v1 0/2] mm: remove extra ZONE_DEVICE struct page refcount
Date: Thu, 14 Oct 2021 10:39:26 -0500
Message-ID: <20211014153928.16805-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caa3a6e3-5675-483e-9d6e-08d98f28d5ef
X-MS-TrafficTypeDiagnostic: DM6PR12MB4579:
X-Microsoft-Antispam-PRVS: <DM6PR12MB45795BA9EB7B10B5A17DBA95FDB89@DM6PR12MB4579.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXNT7Z9fWgkFHWDdcCVO70GKwG7fiGEZwJKOrrCcswA7Qt+FPao17nlmJywARoaiL+B61aeTNsFJxmHVL+56+83TxoikoWWUe+EhOq2J6xfzzKYMHG7fbF3wa7gKlV2PI+I/i6I6FeT1BtMXUV21Vs1O1J5KBk1LpEy+jgPZ6qCfjmrHwCx9RM6uF8deUXgLVL9WR2YMH3zSeBnMgGtHAUPdFlxuoHaV4UusH575XmLyCH7F/R1NhHQ8dcKdwCL03CNdjGeSFxEZqpCPnR1t7CXQ4N+Woco0tRkQcRb3j56iIFs1Ef6UKpG4IiLFLF5yp1N66FZBJO0CLqyXknI/7m9SFzrtZa8IXBZUZmuin8usmiEs/FNoeI8MHo/HmGkL1DrKuBNTZ0EzIHrYn4zKXH8sqDvb78Fz527z4ErbND7PUuZsRn5fk2EW3hfbDOKpx5//iuAvEZohEO/kQvveHXVkSObsdA/aaBbYU4RG9xfq3g4AOckb/MUTNzLKiAh2kRTiIsQdEBBwmGvY9Uh95HHgeNg9s33d3Tul+Bs+lObfIkTBaIeqwc+ETcezJ+f39YoasGNeWPw7dezM20UpKESYu+1Fr3c9YsuYGQE8hcgoi/G45jOsB3PdSCZyFVCRBiIuTgHLhpxJuBkZ0IrhUICF8GvMvOrHMM8jdiLbNnhAmuX9CU/UMB8JTnk7gsSsEwfdZMO54g5v/Qlrte7gpgG2s+fHEsNGCREdeS0hIF9gQ76CrGQvtQI9f/COH6m+2Ym4bf74MLfybu1Fdgi/wgf0bbitVQnAPhJTNs8RWoq+69R4hxx9OoXbwUjS8SM/8iFDLQRbF2RG9x5YNZv96AU39ayCAis6lheSJ77BDHQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(8936002)(36756003)(81166007)(7696005)(110136005)(36860700001)(44832011)(186003)(2616005)(16526019)(7416002)(966005)(47076005)(83380400001)(356005)(508600001)(54906003)(82310400003)(26005)(70586007)(70206006)(6666004)(5660300002)(1076003)(316002)(426003)(4326008)(86362001)(2906002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 15:39:39.8541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caa3a6e3-5675-483e-9d6e-08d98f28d5ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4579
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

This patch cleans up ZONE_DEVICE page refcounting. Quoting Matthew
Wilcox, "it removes a ton of cruft from every call to put_page()"
This work was originally done by Ralph Campbell and submitted as RFC.
As of today, it has been ack by Theodore Ts'o / Darrick J. Wong, and
reviewed by Christoph Hellwig.
https://lore.kernel.org/linux-mm/20201001181715.17416-1-rcampbell@nvidia.com/

"MEMORY_DEVICE_COHERENT for CPU-accessible coherent device memory"
patchset depends on this patchset.
https://lore.kernel.org/linux-mm/20211012171247.2861-1-alex.sierra@amd.com/

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 fs/dax.c                               |  8 +--
 fs/ext4/inode.c                        |  5 +-
 fs/fuse/dax.c                          |  4 +-
 fs/xfs/xfs_file.c                      |  4 +-
 include/linux/dax.h                    | 10 ++++
 include/linux/memremap.h               |  7 +--
 include/linux/mm.h                     | 11 ----
 lib/test_hmm.c                         |  2 +-
 mm/internal.h                          |  8 +++
 mm/memcontrol.c                        |  6 +--
 mm/memremap.c                          | 69 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 ++
 mm/swap.c                              | 45 ++---------------
 16 files changed, 60 insertions(+), 131 deletions(-)

-- 
2.32.0

