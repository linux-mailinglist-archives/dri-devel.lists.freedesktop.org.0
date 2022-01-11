Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C888448B7FD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A010E869;
	Tue, 11 Jan 2022 20:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7E510E723;
 Tue, 11 Jan 2022 20:15:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwQZgS9h7V6GOTw2PDmZ/ULXQ72ccgN1RsDZTy7SjwGBo9BXJkuPP2/xnz+h8nFTPHIpoFwWrQphhRpy/AqTLis/DAL2KXThwWvo9G2RBgx3ymtazpDb7wiSU/7Zo/6IyFyKTbHDtK0bf2aB2tiGc1oPGUwNI5Qayg/FxAutRBXgcrqQx4Z5WnNyxXVr/q1vLSm06Fvj9p6micQslBFw2DNL5VEb1DFR2y/XdxyMOZQjn0JIg7W+fx38LNw32geJF4j6Jgd/+xlT3g92QlQfNs6amZxOSWAi+gtiM51vJ01cZYoo3ukp0roq6j5qaC2Mc5LoyElRTXKXgRDegtiG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSnkrV0DrTGr94uzqZ7ovMFZFzAa4a6dIn80Ia2k51k=;
 b=WqRiNg4Ak/gyBbY3gMQ+vqwHcSiZHNsaO5VJ811LIgUUCucBwvyWs322+EUwwlIZN530iBb9b8TUTfVTnLQQayXJa4qaefdEGFBA3QE5AEKmbBqM4aaqwOY49PonVTdwdqy6PD/zCd+bciOhKPOMZkDiuP4RGbNhsYPz2akisyVjRNcId9quwSB+RUSw1aoQaVeT+GOMs7SxOJ7o6oasLExWIW4CyV6hBJCeWBGuY9chOxu7EaTYSDlmGgS7wo7Ntb3xMFKR763PGAL1vwFKbtFW0dM0Cd7kZt+mDVQKzA8h0NemisCtE1fgnESMyyT29VdI/3WQFD7B1ADx1wS/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSnkrV0DrTGr94uzqZ7ovMFZFzAa4a6dIn80Ia2k51k=;
 b=ChFGym5fp+3+aMNKObUpUQBu8rVpFPwVbBPZFB3S51aL7V6SA2OtZbJphcPDIG9Z5ZVYMrkFUT6ubeq5UJ3gpmQ9cu6N8cPpvZDB4uG9lBZn+x/aYQg+jGQJ7WxrwmNeHmneGIatErBBJBKs+GBl9GfiC+IY7AhxyOfuer+GCK8=
Received: from BN9P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::6)
 by SN6PR12MB2847.namprd12.prod.outlook.com (2603:10b6:805:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 20:15:03 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::27) by BN9P221CA0013.outlook.office365.com
 (2603:10b6:408:10a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Tue, 11 Jan 2022 20:15:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Tue, 11 Jan 2022 20:15:02 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 14:14:58 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 3/6] drm: implement top-down allocation method
Date: Wed, 12 Jan 2022 01:44:33 +0530
Message-ID: <20220111201436.2254399-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111201436.2254399-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220111201436.2254399-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9acf1050-bd45-468a-14ab-08d9d53f0d23
X-MS-TrafficTypeDiagnostic: SN6PR12MB2847:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB2847C65775ECA53F1F1DC49AE4519@SN6PR12MB2847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1N2JYdn3QrBVix0cA0AzGQ1cDGCCa4UbUK8FfxOmtZaGxjUo7WeRsop2nFHgP1jCxtOhYQ/DUE8tYwzyQgzVqsrPt4ivxYiinoCcbIAyVzFvXhkOCDN+R8if44WwXrPMXWcY6JNVmXHvgaKzsHfVZwbpCjIhWz8Y1te/y+c4x9bf67/cbrlnddvpQ8wXR5Afryruy5cizs9nvjm9yzLlawG4t/VvIwZqO/P8tWK+lBWnM/bunakzJcX0A6lUzNHHbXVYiR6O8mkrfMJUXlOVwF5GdBdqJVMY8CCh/GHHNYJP0BaLlx0YNnUA8jmU/OR/YZ6hlxBrJPxUHmS8e2vm9AyOU4FY4xA8hs8sZ5t9jxFD9zA/dmeZxkTYLKuG3sbM3VNx8LHEqfG6lDM33tybJ5vxv/w8SdcSHgnmLIoz15uAJqA3NERFltvGiCeVH7O1NxfDcxnTMYkZog7a2hqmm9FUVIsvTKnpY6k4UbS9iATM5mFRaLOHCxLWeIOiK9OzhvUStHrIUWJAgcTakWd48rFesByg0OBBRrldN76HOrOi4dBAymCDTxjgehkPf9ODDeMVzo/1BHfGOx0Yb4WvMN/8rFBO3StunvQbcS5dRQPah/v/Tqmhedk2ViXZANzN8JdHQ6dX5h3NBYQWhD5s1Us9ab1G0ep9h1lwUXbNmBPpSUWZ6n+VI7qACWID4HdYJTQYHuMyvqGIks5ljC9yyiaARsRI+/XSaxqBAZrglduI22/ccIZGGfSZGDLuNQSOx2AZyPAWCFz+JVTQnpQiJQO53sIlnquCtzJgoqgaC0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(6666004)(81166007)(54906003)(8936002)(26005)(1076003)(110136005)(36860700001)(83380400001)(356005)(36756003)(7696005)(316002)(2906002)(47076005)(70586007)(336012)(508600001)(426003)(86362001)(40460700001)(82310400004)(4326008)(2616005)(5660300002)(70206006)(16526019)(8676002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 20:15:02.8757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf1050-bd45-468a-14ab-08d9d53f0d23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
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
index 717c37ae8a32..4cc6e88d8e0d 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -369,6 +369,26 @@ alloc_range_bias(struct drm_buddy *mm,
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
@@ -379,11 +399,17 @@ alloc_from_freelist(struct drm_buddy *mm,
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
index 143657a706ae..ae9201246bb5 100644
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

