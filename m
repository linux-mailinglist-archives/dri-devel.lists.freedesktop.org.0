Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803D4A853A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A0710F7DF;
	Thu,  3 Feb 2022 13:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FA510F7D5;
 Thu,  3 Feb 2022 13:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMm+awwPAN93pzt0jqRbqpeCBX1j9lkmDoDIkOz4p9tTj0Z2sPfnuH+/pUGxsuGAGAujOM8SvSih59E2gpUwzFnP5L9SEBIRqlRHbkCDGGiGe/SOPwqW+GTjQr8o4QxQ+CuYPwoVmHDEY3L5sCGw/SrIJFkLPC39BH4FwGVHBoGdizBB26lehVR0WStZ6XB5txnaYv0sQCoQmjW6yycIiZVNQ2a9GxVZny0z6qJY5bH92vSvviPMwnaOPYTRPlWxJBrdfZZ/RldIMkNxZV4regnzAXS0+1ztbAj4aEPnz8eh4pJk1PaRYtgv5tNf2UT41Q7NmtVopdg1LYiw2jv7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMFLTpso+WStbZFYDeNTYF+bu+RrIUM2dDIejWL9ypc=;
 b=Ps4ajvJmZeDzu2iuA0AOCbB8jlqmgZG9w5cdiNUjtXTFvvPIh1SxTLs+jgW8FboCQvBw/uqRbENyiX7snJXbjY7QfmKRV4xd5Y4KZIDx9lLzjmjAG8O4nbvYN3pGTH8HPkukRPGCsDCNm96UyytMqyKZQrNokNgbsOfEM9ek+0eTW2l+lafEXjxqEEe55f1a7doRVLOHdOxECKOIGB+V/ZdT/9JpSitiTUedrfq2+ZkAL3ANixMVoTVenv8EawCuoMEEYxQOWbfp+K+tpqiTi00Ol3cNobWqM3QbHRFpklM/Iadw/cJbcX2k7Bv8iasGwxfNSvkQho7vllaN0zsFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMFLTpso+WStbZFYDeNTYF+bu+RrIUM2dDIejWL9ypc=;
 b=P4vIugantSJHL/C7PqKd+MAwzJ2HP2HpG6pXtGQtwQfhRUrtekxf1OZpfVpJZx15rqxWVAW8kjSH8zrbsjV9KvcAFE5runmFCjv5lJIyPq9QksxH1T3+VPn4a9gKyj2BEvRARBmsPeoXuAcOF3xffiR6gweBcmM07GXGbsYXnMc=
Received: from BN0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:408:e5::35)
 by MN2PR12MB3741.namprd12.prod.outlook.com (2603:10b6:208:162::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:33:06 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::38) by BN0PR02CA0060.outlook.office365.com
 (2603:10b6:408:e5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 13:33:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:33:06 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 07:33:03 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/selftests: add drm buddy optimistic testcase
Date: Thu, 3 Feb 2022 19:02:31 +0530
Message-ID: <20220203133234.3350-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb1980df-016b-401e-eaa9-08d9e719b640
X-MS-TrafficTypeDiagnostic: MN2PR12MB3741:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB374132165CD5EC07EBEFEDE6E4289@MN2PR12MB3741.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L4rnvPWBVHrW71YsK9AS0/DLhTXIrJBISPbuS0v3EgYdj0tgc0vU9lyb79008Mvsi1YIkdwfRN/v3SFDWgDiJs9i500p3BdLU8emQP9VtYg+NBz4FiNnUzDd+aE/8D5hKx0GW6xaLanox84AHssMLo4I9VOBYvW187E6bhjbRwKBqeqHbaxEvZTYIrou9fASNSp+vuXMI7yVIsMpUYQZawFKBrEVlVA5vRC+zy5fdePHOETIU8gxQOOJpTs36x9+/fPTTojZDn45KMVrscSK7snTl5crpkCV4IL0saT366bwVfw1FHM/JTBZjViJaxzLmdz9GTc/RBwSN0UYWVGtRGzfwYJ0XEOwnw8kFDlBvJQ/gRLYzYIIIVig0U/WfZTY1MD/H7HH/LRVhfM70QjKCNVmpETCu9Ntom8/yb1qkuvp93gB0r1KOYOnUDm5jmFFvkmo7waN9HgDvh41WtfHvqQT/CVixtf4SgLOSIHvwHDPIAUgXzDBytiwoQoo4XFya0xkjQyzVM5JyT62MOPXSjJJWINkIntNnJU+IBrlxxS0CU+61jdPmEAGF/AyK0Yyzru0PiOgTjG9OzAKGPcvbEcnMABHzPhvzQDWtvaIrJAp1RxS/scvQmWqJk2Sk8lNqyoeZ/B6Zxt+Ip9io41Q8VVeysfcEmi5C8qes+cVUp73Wr+T7BMSatejRdU6Rg4gfayv/oeWDj3Cub3GVxQ8sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2906002)(83380400001)(70586007)(82310400004)(70206006)(47076005)(8936002)(36860700001)(7696005)(6666004)(86362001)(8676002)(4326008)(40460700003)(2616005)(336012)(426003)(508600001)(186003)(26005)(1076003)(16526019)(5660300002)(356005)(36756003)(81166007)(110136005)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:33:06.6917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1980df-016b-401e-eaa9-08d9e719b640
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3741
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

create a mm with one block of each order available, and
try to allocate them all.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |  1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index 3230bfd2770b..21a6bd38864f 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -9,3 +9,4 @@
 selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
 selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
 selftest(buddy_alloc_range, igt_buddy_alloc_range)
+selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index e347060c05a2..b193d9556fb4 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -17,6 +17,11 @@
 
 static unsigned int random_seed;
 
+static inline u64 get_size(int order, u64 chunk_size)
+{
+	return (1 << order) * chunk_size;
+}
+
 static inline const char *yesno(bool v)
 {
 	return v ? "yes" : "no";
@@ -309,6 +314,83 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
 	*size = (u64)s << 12;
 }
 
+static int igt_buddy_alloc_optimistic(void *arg)
+{
+	u64 mm_size, size, min_page_size, start = 0;
+	struct drm_buddy_block *block;
+	unsigned long flags = 0;
+	const int max_order = 16;
+	struct drm_buddy mm;
+	LIST_HEAD(blocks);
+	LIST_HEAD(tmp);
+	int order, err;
+
+	/*
+	 * Create a mm with one block of each order available, and
+	 * try to allocate them all.
+	 */
+
+	mm_size = PAGE_SIZE * ((1 << (max_order + 1)) - 1);
+	err = drm_buddy_init(&mm,
+			     mm_size,
+			     PAGE_SIZE);
+	if (err) {
+		pr_err("buddy_init failed(%d)\n", err);
+		return err;
+	}
+
+	BUG_ON(mm.max_order != max_order);
+
+	for (order = 0; order <= max_order; order++) {
+		size = min_page_size = get_size(order, PAGE_SIZE);
+		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+		if (err) {
+			pr_info("buddy_alloc hit -ENOMEM with order=%d\n",
+				order);
+			goto err;
+		}
+
+		block = list_first_entry_or_null(&tmp,
+						 struct drm_buddy_block,
+						 link);
+		if (!block) {
+			pr_err("alloc_blocks has no blocks\n");
+			err = -EINVAL;
+			goto err;
+		}
+
+		list_del(&block->link);
+		list_add_tail(&block->link, &blocks);
+	}
+
+	/* Should be completely full! */
+	size = min_page_size = get_size(0, PAGE_SIZE);
+	err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+	if (!err) {
+		pr_info("buddy_alloc unexpectedly succeeded, it should be full!");
+		block = list_first_entry_or_null(&tmp,
+						 struct drm_buddy_block,
+						 link);
+		if (!block) {
+			pr_err("alloc_blocks has no blocks\n");
+			err = -EINVAL;
+			goto err;
+		}
+
+		list_del(&block->link);
+		list_add_tail(&block->link, &blocks);
+		goto err;
+	} else {
+		pr_info("%s - succeeded\n", __func__);
+		err = 0;
+	}
+
+err:
+	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_fini(&mm);
+	return err;
+}
+
 static int igt_buddy_alloc_range(void *arg)
 {
 	unsigned long flags = DRM_BUDDY_RANGE_ALLOCATION;
-- 
2.25.1

