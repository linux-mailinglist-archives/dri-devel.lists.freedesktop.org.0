Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FF249D4EE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 23:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A31610E97B;
	Wed, 26 Jan 2022 22:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F3E10E974;
 Wed, 26 Jan 2022 22:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVMJ62KaMMcrjfBOgXUgfJo1FJQ4LdeRbJTbL7f09PkasquvtJo5qDBNd43nmCIIDjZnSZJEgWN43dP840P6reGPCaD0tmjcAqMT1zutTtoCHxUcwdOmx2WVvHPUPMkXj1Ml01knsHVsW85zuF1KLsURppz/C0Fkklj+/ulMcSSv4n7k3EyVD7vH3RrkSmWkA4Yte5OI70ZS1CxMNEShOKOrLBl+EcumgrN5StjDYZJUgV6ZnWfLxjnCKMWUat8uaoUz6VFfiCUngaV+8mJTRciSIFXYJNG5lUrLryhxZYcozCfNWEa/s/M0petZAEdCeMW46u/b7uyK03Kd0w25gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jecuX40XGqXfqe13o0rlRRt/d8eeaBkxa3LzFd5jFRc=;
 b=UjuwYbqnBAvBUki2sfCiYGLdcDieG2zRPbDr90XDt1NO+oZfeEHfkpbuiEJ6ruP3/4po2TA4uzfw5GqdmMWeI59eorxSb46GN1YW6dC5ODi5yHpjD6wPVzGv2rmKhcEOKPnXOXHeEekdwHXx/yAT5PROiz06m90PyZMKmxV+DXAQSeqIpvYZzLseXrFmUju0GNNyZXSovNci4FMfguBtEaocgdu/9XztLfab0IVA6waA5243PDfATM1SAq4gSvxrPnD5m8efPtVcDFEAb9YKNBgGnCRSV5dmryDq92bWIlnmIGXEmpUU0oFx9RRBr76i7TiPLOAW/lga+82DLZpoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jecuX40XGqXfqe13o0rlRRt/d8eeaBkxa3LzFd5jFRc=;
 b=XbFqLbl4pNa6ETLZ05BoxuJfcFXVx3jA8hYb9EOgfeX7aw3GlKYKFiCGlDBu03YYbUyXOZBuYtUDf+zWRGyIXWonXs/Jeoef9hiSuQyVI9RWhnc9lP9EtcfOS7NYaTNZSQZbFeoCHLLuATKeytrNmdsJo8QoInn1rXxzCH6DZPI=
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 BYAPR12MB2936.namprd12.prod.outlook.com (2603:10b6:a03:12f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 22:07:37 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::35) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Wed, 26 Jan 2022 22:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 22:07:36 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 16:07:32 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v10 2/5] drm: implement top-down allocation method
Date: Thu, 27 Jan 2022 03:36:08 +0530
Message-ID: <20220126220611.3663-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126220611.3663-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220126220611.3663-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c266ca51-3fa4-45ed-c1ef-08d9e11842d7
X-MS-TrafficTypeDiagnostic: BYAPR12MB2936:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB293670BC545A1F8F03A4846DE4209@BYAPR12MB2936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXgj+Xe5ca2mucX92PGeCPq+WrbVndPUlLQmDXGzFW3b6pORq9x0HVj0twDxmUYOLpUoO6aiNvisqyjm6lcscuFNEfXph4wnffEffF0GWXssKn2HeJ3E54oT2aTudSqHy4iW1VmOyhHtTmS3LZ6jwqpPWpIY8X2l4UV0hW/xpKh2DozjHSLadXzJTt4LRyst6pZzKRcB6RO9gX0mdbYEMh+ksuNiJRxNiJj6otWFSWdvRrBxxsW4IO+3r3OfJ4MNAmS9Vpd1bvfT6FcpFsZ/7sjOpuHAg+TN27QQA0zca1u2nfM5YBSMO48TACR3+OrnDquzr85AJH19NmM1UUqovSIlld2kOEBS0rcyzXcUkgAlkUEBCj52hDyxczNuhrn1BEqhpLVaTMjN7w87pQ/byDCkqjam8tyrKRjK40AwSpRJDxk5pDa7Cxx9kcX7vAhO0I7LIVMsvTPUBux+BqqpccGRiP6sPa6YDkTFPVkILGd4Sq/J9UPjV7rCaSRQEISwFcUQAwOM0fHppzZpk8lZ1doMhsBUPir1hvCSUq6wlQsb8iuky0SdPaihzO3qiOJ4tMWbzgJ9Jz+HpOo5lxXidU9cOLif2UTtr8JAe66MpDVCu8+O4UyF25YvDvg6RmvvifRnva+IVzM7q7EmEYlDLNiRXR2mBc5xaGQ0WQaegydKFnTSBqp9hcQs+ckcfSgo0VLwrAYs/tnSgwQQPZWtqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(1076003)(2616005)(508600001)(4326008)(82310400004)(6666004)(426003)(186003)(36860700001)(7696005)(16526019)(83380400001)(36756003)(336012)(86362001)(40460700003)(26005)(8676002)(356005)(5660300002)(54906003)(110136005)(316002)(8936002)(70206006)(70586007)(2906002)(81166007)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 22:07:36.5599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c266ca51-3fa4-45ed-c1ef-08d9e11842d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2936
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
 include/drm/drm_buddy.h                       |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index cfc160a1ef1a..30cad939a112 100644
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
index b9b420cabc14..45b091626278 100644
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
index 54f25a372f27..f0378fb48d06 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -23,6 +23,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

