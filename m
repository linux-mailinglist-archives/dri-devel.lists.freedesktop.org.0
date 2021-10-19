Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD03D4341C8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805E06E10F;
	Tue, 19 Oct 2021 22:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3593E6E10A;
 Tue, 19 Oct 2021 22:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4m9EaUZy/nmGdmEpZ4lOTzGFvL5INB768VJJqJzDL2y3H1OBWAZLfgg0TZHCHIUxie92hGbJqHXtiMmiDzj11bc591EeOXNFIusYL/7YHxPS8N4hUapBUiUETK6x5ZLzAFZEo4RGs4pAaboegSyW5k8YuBn1u0mC3vkfeaOG7qCCDMTMYXxXHbfbEqLwK8s8LGkTK4+Su6Jp5OkjI9el4w6nqssdjEYSgylHD09epEYmo+F3ccsUC2FsI652SNDLdmsTT9AHM+PC5iCoBEQCIUg8rMQQGCHwdt5XbWGIoSE2Cx+IJEzG9ErcjoAcPAllMkJ2tIrnS8MdGkg7xrsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNNEWnBC6xiliPuVBS8tklV65cRJHhAiqGKXNpIHt1s=;
 b=d22vWBMSZziqWpTmt4e8X07DRl61qKkzXGiAF5MLBrWHG+xHykNFkvtp7R43n/UrCdVMFsa6+94X4bYKU/svBfyCk3dXae0x6p0QD50LN4C7AbE7OG1SrcGOMUguBxKHUF9BjqckCZbAu5eApBS2FlgATnsNCMQW9PlHdaoHR3dHcO5+gaIK6CDr5Q12mtp4L7zkQUBzex2D9m3EmF4szVLCRyt4nKeco8/5MCQOdbQ0S2hRi4Oa1TuWaMCBXl/XNnGJ8ALiZfq+DUL1pyoe5DK0OixlUE9PO5YmSU3KCg5Q7uaw0kUM6p2+qzQP8tOrcuFqsuJ80GX0RfbN5uIDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNNEWnBC6xiliPuVBS8tklV65cRJHhAiqGKXNpIHt1s=;
 b=ISZv4gSPBo3PiL3a/LsnGiyzyoI3qCi3YZa59leHn8rkLTAQl//nGSQ+m6Z+2+3kFgS36OlliwVURXlTJsBaqgbHsCf6MbdF9866tbSdSLNIqruPjwcTUX6YLHFotmWOrPoh8zYMPuN24GAu7KKK/2OoZGedED6YViY/LtOxBTQ=
Received: from MW3PR06CA0014.namprd06.prod.outlook.com (2603:10b6:303:2a::19)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 22:55:19 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::d0) by MW3PR06CA0014.outlook.office365.com
 (2603:10b6:303:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:19 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:15 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 06/13] drm: implement top-down allocation method
Date: Wed, 20 Oct 2021 04:24:02 +0530
Message-ID: <20211019225409.569355-7-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 69d65cbb-360c-4f39-d792-08d993538626
X-MS-TrafficTypeDiagnostic: DM6PR12MB4073:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4073F86F3343E40E8CFCBB53E4BD9@DM6PR12MB4073.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUdQloySIKKYQ0/57fntMPEGHvlG62U+5nUZfYxYXsILMXBBLQAyKNomyHPFyNdgSSTrQgJE8NPucxUNq39KZRfMAIRkCLo4E+w3ARIgKanwNpH0oO8QdSnRdgTim9qeAuRoDydHM5wdp1Zt9TzunlGqbRsfbQSX6EUUzETGNDuq+rX4Lk0pyNfo/BsOUFC2AOvWMsRxcQF9/sFIMKRb9KBD9BZnXt6FeWQpp5wKgdWyNgMHUMJFgtj+pqorKI1ENEUGV1ecnMMOOF9sze+TitMWIisix/Db81dD7BhFF7z7ebyoiW84CVxrhfwClYiM515Jw5A99qb21XBRhGgtVM+iWTAv7yx5cOfgY+A4eqq/QMY0nSg7oDY6UJsuPvsAwkaqRyEW6m/v0W17Q+pzm4TWfP95mgaXpcBgSb4ey1tJ1BRVr1D99Ivz/gK3FBuRJ2Qaz26/xjmwzWdhU88eSkeo747bvHhbn46cjYQJQl5mN3207YQwKkOm+NS+/JteG+LDXcdRR4dsUmEssQfS8O6Hx2admQFASBInsUR7z7xanU6XTbIKGw7JyOoEYUQFY2yKs4dJ0Mzvhbx9b6GZzyD3a6cvxGFRZcp0h7eAItvfpFb9JY67hGjsMSX1LZsYYpVXFZTiJqxq7T1ln5E6shhmHieVakkEcL/ykRUAu2q7gi1oLSC3hFB3VuvrreodWVvI7q4XuIhVDeUi/4bZoytHXLv1nVXxy3gHIMIuu1g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2616005)(356005)(2906002)(8936002)(81166007)(16526019)(82310400003)(6666004)(316002)(54906003)(70206006)(1076003)(83380400001)(508600001)(5660300002)(47076005)(36756003)(336012)(110136005)(4326008)(186003)(86362001)(7696005)(26005)(70586007)(426003)(36860700001)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:19.0287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d65cbb-360c-4f39-d792-08d993538626
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073
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

Implemented a function which walk through the order list,
compares the offset and returns the maximum offset block,
this method is unpredictable in obtaining the high range
address blocks which depends on allocation and deallocation.
for instance, if driver requests address at a low specific
range, allocator traverses from the root block and splits
the larger blocks until it reaches the specific block and
in the process of splitting, lower orders in the freelist
are occupied with low range address blocks and for the
subsequent TOPDOWN memory request we may return the low
range blocks.To overcome this issue, we may go with the
below approach.

The other approach, sorting each order list entries in
ascending order and compares the last entry of each
order list in the freelist and return the max block.
This creates sorting overhead on every drm_buddy_free()
request and split up of larger blocks for a single page
request.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 42 +++++++++++++++++++++++++++++++------
 include/drm/drm_buddy.h     |  1 +
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 138e9f1a7340..42ce4f8f4e0e 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -334,6 +334,27 @@ alloc_range(struct drm_buddy_mm *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+get_maxblock(struct list_head *head)
+{
+	struct drm_buddy_block *max_block = NULL, *node;
+
+	max_block = list_first_entry_or_null(head,
+					     struct drm_buddy_block,
+					     link);
+
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+				drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
+}
+
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy_mm *mm,
 		    unsigned int order,
@@ -344,13 +365,22 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		if (!list_empty(&mm->free_list[i])) {
-			block = list_first_entry_or_null(&mm->free_list[i],
-							 struct drm_buddy_block,
-							 link);
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			if (!list_empty(&mm->free_list[i])) {
+				block = get_maxblock(&mm->free_list[i]);
 
-			if (block)
-				break;
+				if (block)
+					break;
+			}
+		} else {
+			if (!list_empty(&mm->free_list[i])) {
+				block = list_first_entry_or_null(&mm->free_list[i],
+								 struct drm_buddy_block,
+								 link);
+
+				if (block)
+					break;
+			}
 		}
 	}
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index ebf03d151845..19c7e298613e 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -27,6 +27,7 @@
 		|| size__ > end__ - start__; \
 })
 
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 0)
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
-- 
2.25.1

