Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D74939A8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 12:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC2510EAC6;
	Wed, 19 Jan 2022 11:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F5610EAC6;
 Wed, 19 Jan 2022 11:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK55STIvsLR5zvKNTmz9RLLU3HurX6bQu3FnuCgCKmoOlmyW7GAW7THqgf3UGquyfc5xLms95CzR4sCUB5wMZHuSSYV9IgPs8aCufc9AAt/4/EIGFO2zsj81VTcTaK3lUs2ugP4XKNSqM3Lcm2Ewt8Qkef0XAHZbuFGyPao2iGsnTBA86L07qDQA7vX3jjuRdnewUcH1TLQoLUiRxIxX7uwm+cyH3ZhfYMGU0Et1w4qbFfVacc35UByiP5dcumWO1CVSV6JHOkIE+kpEeI5QNF9D3sLT310fzbN1Oau5mx8Hu8YtIVlMYGmxrR1Z3E7Y5MBzgduv53ApJ17cgqTA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fEwF10gb2Zem3pxpj4UXllxgQbOdIzc3WeqlbbBfuM=;
 b=Y+HILVjTjF095QQYFkzLxmAkNMitYodOrgRWuQgvkuzxBBqg2xhDv7ujBMMmBp32/92n0a3ao9BefOBo1dZVD+lYT/YQHXKRPmSagB+dUHIav3GjuwqZlPpsGF333jswLNsxlmRtFd2S6HoEDN3AEpTEbUNdU3hVVFmlIi9nklJYEFC8wthg+PmJhsACPDrHliJusxkg4vri7UIkBhrPGvyueRZXNFpMtZYaVRGOrRrtNzQfxS7ZSXkFPTXedK5CylRudhPk3ROxyZDbcK/K/EZCRaiSAP98JbBarerM3RYlDDxyoXcZqIxdujmugyl7vX8ZHaR0k80iTLZbGeg31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fEwF10gb2Zem3pxpj4UXllxgQbOdIzc3WeqlbbBfuM=;
 b=Qc3xqf469SNI4Q1/AwM19RvL/A6Z4M2kvwWOsnier6zMaGZPQ0fSvt86J8MHX72tBWgebKKL2Wg6vx4MyFUiyZfNq/uxG3OIWnWsnf4iMZzcHDbUe4BL0B41KEZs3zScC1fpd1YSjvVPA3T4J9G/nYO0CEwFru0hJ4cbaZrhGZw=
Received: from BN9PR03CA0261.namprd03.prod.outlook.com (2603:10b6:408:ff::26)
 by MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 11:37:55 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::b6) by BN9PR03CA0261.outlook.office365.com
 (2603:10b6:408:ff::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 19 Jan 2022 11:37:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 11:37:55 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 05:37:51 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 3/6] drm: implement top-down allocation method
Date: Wed, 19 Jan 2022 17:07:15 +0530
Message-ID: <20220119113718.3311-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2814fb6e-c1ae-43fe-f79a-08d9db402275
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB36137A7DC1B643CAE7FA5B7BE4599@MN2PR12MB3613.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlG6f8eMeGoiFqDKeHap1m6VoxqPpRKiQw1si7H6pxcTED5kLFshqG2/Fw6WO55UM5IadfrJ2bj3EjZ3xW/owRI3OfEP4JoMr2g9fRlzh5f20eewLv8bpnIK6t4itnDzNLwU9RO6U7aJ5IJ4uli4R+W0Ejh+J/ozEbPGDaK4fgAbYufGDUQJC58NRUZmgsCQ1iq2uNaS1kNtyiSn8OTrB7zDUDUe03kL1PEo2Dou2iP1fLUPZi1BdZ9cGASq3UU5rzTbeCoNUGvWqXF9LzDBTLEyxGmGtmE+fEVNkppeSaGb9zAEyzbbuTd2B0tixRErs26yN4ZcmYsPCdxQiL0xIMrjjPoNt9KVLessRCxRO3ENkx8vWQkcVs5JnhgfIdy2ddBhBMzm+1AjJX4GrrRzWRD2l0DxpQ52gh0O02Qxqk+q1k7hCtbMk2F0LQH8cNq1DRWBz8/XHIzYN2yELL+EkC8wBFefLxSi2ziApLVychnsPVla6r6qKlKKnTxPFlGwazlqOGs08EGdEfGSE8/ao3FkYOAENstjui1Ta61rIAKIiqSfaeE9O+6FJ9skVwmhzJjO0Ea6bS/YpcLAv36aJKgKiiPzT7QNGza0PvPB1FJudG3eMNGciIN59y+3zB1q+p6qsTBz1mRiM61FgdyqjfC0Ak17TYiY6ph7GEubqXKNbLTzVsS5dTGTmpWSco2j7+BedGaEGjjiXMY39SoD8pZzfVi2VzJ3Ywf2Vqa4STykkNjanCY0bK2/hdBeFAsegpKE9wL82rTtMDTA6/8o7ZrOB2q1LyuT5DKwbYaTdiI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(83380400001)(47076005)(81166007)(5660300002)(16526019)(2616005)(110136005)(336012)(426003)(54906003)(508600001)(40460700001)(86362001)(8936002)(82310400004)(186003)(356005)(1076003)(2906002)(7696005)(4326008)(8676002)(36756003)(26005)(6666004)(70206006)(36860700001)(316002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 11:37:55.1713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2814fb6e-c1ae-43fe-f79a-08d9db402275
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
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

v2:
  - Fix alignment issues(Matthew Auld)
  - Remove unnecessary list_empty check(Matthew Auld)
  - merged the below patch to see the feature in action
     - add top-down alloc support to i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
 include/drm/drm_buddy.h                       |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 954e31962c74..6aa5c1ce25bf 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -371,6 +371,26 @@ alloc_range_bias(struct drm_buddy *mm,
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
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+		    drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
+}
+
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy *mm,
 		    unsigned int order,
@@ -381,11 +401,17 @@ alloc_from_freelist(struct drm_buddy *mm,
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			block = get_maxblock(&mm->free_list[i]);
+			if (block)
+				break;
+		} else {
+			block = list_first_entry_or_null(&mm->free_list[i],
+							 struct drm_buddy_block,
+							 link);
+			if (block)
+				break;
+		}
 	}
 
 	if (!block)
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 1411f4cf1f21..3662434b64bb 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 865664b90a8a..424fc443115e 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -28,6 +28,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

