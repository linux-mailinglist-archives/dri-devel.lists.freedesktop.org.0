Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDEC584167
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37FE112116;
	Thu, 28 Jul 2022 14:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220F10FF88;
 Thu, 28 Jul 2022 14:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq7RAxagcnFHIysdsuF8u9orkPOCZH+KLVLSZTnhDwalKoPd3xi0VRtVPP8BWau9SVpgeHJemRA84B5OhQ4qWGHH7wwJO2kcJPaEJhYtKpwL9V0qU/OGyl/fjBuNtQErlVVWLEN15iB6ubuoni0JhdAh+5omfl9z+Bm/vfGpFRXlcTO5g9fVSWlEg75z9oUwr+7e0Mp7BY3zcFD8KCN2w/skZVu7z14uYQefZOQLMIBIRBPycICDH7w5IVcfl/tmjh7/6zEOZjfSZHtDFoqobnQt+KNbRv9WZMAdaxpgS3e3HSSg+ZMcReukrJGGUCoIwMifwQSxzADJ5+vWnLg4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0UakgAHlFrof7eqbmHQa6D5ExQew0/x4ddYS/HaBAI=;
 b=QmbX82KeZy5zJ2tJYO6sqI2dCpxB6adCxpMRfP3kA8b1ibTIXE3jKgTrofLyXPi8CBrimCeRmYfxdwRH7IyAgmNJPnvFgQj0E7wFFjkQ0aOmS+sSTh1P1aqjxWimvDLfQA62LpROaH/jEQP87g7oqrXEgQoWvLHioueqA+/wUfifZ/f6FQs79uRsZHoVA0d1eOjQMF0KWDSiXD8TUj5VH/89TmbaH648q/iEf+kUCVKHPEKkTuGcAWmDi+Ds0dvF9zXBDznUVxGti+beM4c57xYhUKfv+g1nhg2SbeCREdRc5VNcVTlK+M8p7HopVQoStiT6nGsDvQ/FKmaJrW4Gbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0UakgAHlFrof7eqbmHQa6D5ExQew0/x4ddYS/HaBAI=;
 b=Sr/wMjMk9yEU8tLErGf7Bu+3yU0jV+EOR4dHazH2jnJQCHprNrFPnVRQuO4p3bvpmIvcvc2C8+oOVcSwv66bAu5khacKBDVN9Ayas3u4k6kLJLoUAlq3ydqtzP21HqiaufdVqzVZuxjETUmj2ZjXbyVcU0XR62C5DQ+3Oh2w2m8=
Received: from MW2PR16CA0026.namprd16.prod.outlook.com (2603:10b6:907::39) by
 CY5PR12MB6275.namprd12.prod.outlook.com (2603:10b6:930:20::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.25; Thu, 28 Jul 2022 14:34:19 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::bd) by MW2PR16CA0026.outlook.office365.com
 (2603:10b6:907::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 14:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.11 via Frontend Transport; Thu, 28 Jul 2022 14:34:18 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 09:34:15 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 3/6] drm/amdgpu: Implement intersect/compatible functions
Date: Thu, 28 Jul 2022 07:33:12 -0700
Message-ID: <20220728143315.968590-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 624378e2-b8b8-4046-f78d-08da70a6417b
X-MS-TrafficTypeDiagnostic: CY5PR12MB6275:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppPHBvEZA2kjAdT1Xc1eCkTcU6+4+IT8g1dtsy7zqybS48uTdjWJjPfhxfZQbV7x0AwXpLjQcKouVZy4uqjoCOJkdFQWGFLVe7hSJR+YSjDNcG0IHGzo1bQ0+uHkW9ujrCu4lJRQjORQ8YBtS3S5Iwgv66aujaUgIlohepu1rlPymwd/rQSX3/F23eT/UIppq8owt1wnTb1jMZURBKWaVN3v5UhrcgUSm9kvBv/51e+hl43VWMMXprwk+d3dyVwcJEWNBexiim0uJa6ylKMoHaN9Erk7Z9rwBYY//evp1KJvAVVnv/8CE5jQOZGG5CZWr4bNWjZBQ8BF9QkY8wJnP3Kk+fTbkh3qXwo5NnRnBGqU9riVpJXqtGWjKuE0OFBRgoO1DDyKdBW1FWNIbwo4z/QpxkR2VqkEGTJRpAqSrQVoVlMdgbM8ffODT6L0gO7qTgyD8nUt6OPaqEI5i4k9C19FWgSyv++TWkLugdPiVgsKySIJktds5U59Y89TyQ1Ji3VOktr6zs69cwCAwj33GoX+QNQGuEV8aM4xgmoVo31wjHPcfnM8Eq7B9tjq4mJrPIEct3jb7p97Z67VEXMUfKwBcyKJV9b9p7d1Ynpr6CfRYbn9PkUTE8XKbau/8hT4pdLCwFY5QsIn0PbHlZPAM7Bnf6o1stN2lPy0m+DbXlYv7RlbQb814Cgij9QH6os/Gq8hWPemcZtlxjamlTwwF0wukywvmmT9SU8elPsOYPbuojIvZoH6cqoLbKwvos/rWIS230sBqg9ws6FY/gK2Ld6bN5yANth8goZ+sxgcilNB+yZa7teM8XYEgbG+emMf9qsUknvrvcupRVk00xpAUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(40470700004)(26005)(1076003)(54906003)(36860700001)(2616005)(47076005)(6666004)(40460700003)(36756003)(2906002)(316002)(426003)(336012)(83380400001)(478600001)(70206006)(8936002)(7696005)(70586007)(82310400005)(8676002)(5660300002)(4326008)(82740400003)(81166007)(110136005)(16526019)(41300700001)(356005)(40480700001)(86362001)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:34:18.9997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624378e2-b8b8-4046-f78d-08da70a6417b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6275
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a new intersect and compatible callback function
fetching start offset from backend drm buddy allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 38 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 63 ++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8c6b2284cf56..c38752622e9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -204,6 +204,42 @@ void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 	amdgpu_gart_invalidate_tlb(adev);
 }
 
+/**
+ * amdgpu_gtt_mgr_intersect - test for intersection
+ *
+ * @man: Our manager object
+ * @res: The resource to test
+ * @place: The place for the new allocation
+ * @size: The size of the new allocation
+ *
+ * Simplified intersection test, only interesting if we need GART or not.
+ */
+static bool amdgpu_gtt_mgr_intersect(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	return !place->lpfn || amdgpu_gtt_mgr_has_gart_addr(res);
+}
+
+/**
+ * amdgpu_gtt_mgr_compatible - test for compatibility
+ *
+ * @man: Our manager object
+ * @res: The resource to test
+ * @place: The place for the new allocation
+ * @size: The size of the new allocation
+ *
+ * Simplified compatibility test.
+ */
+static bool amdgpu_gtt_mgr_compatible(struct ttm_resource_manager *man,
+				      struct ttm_resource *res,
+				      const struct ttm_place *place,
+				      size_t size)
+{
+	return !place->lpfn || amdgpu_gtt_mgr_has_gart_addr(res);
+}
+
 /**
  * amdgpu_gtt_mgr_debug - dump VRAM table
  *
@@ -225,6 +261,8 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
 	.alloc = amdgpu_gtt_mgr_new,
 	.free = amdgpu_gtt_mgr_del,
+	.intersects = amdgpu_gtt_mgr_intersect,
+	.compatible = amdgpu_gtt_mgr_compatible,
 	.debug = amdgpu_gtt_mgr_debug
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7a5e8a7b4a1b..0876d370dbb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -720,6 +720,67 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
 	return atomic64_read(&mgr->vis_usage);
 }
 
+/**
+ * amdgpu_vram_mgr_intersect - test each drm buddy block for intersection
+ *
+ * @man: TTM memory type manager
+ * @res: The resource to test
+ * @place: The place to test against
+ * @size: Size of the new allocation
+ *
+ * Test each drm buddy block for intersection for eviction decision.
+ */
+static bool amdgpu_vram_mgr_intersect(struct ttm_resource_manager *man,
+				      struct ttm_resource *res,
+				      const struct ttm_place *place,
+				      size_t size)
+{
+	struct amdgpu_vram_mgr_resource *mgr = to_amdgpu_vram_mgr_resource(res);
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		/* Don't evict BOs outside of the requested placement range */
+		if (place->fpfn >= (start + num_pages) ||
+		    (place->lpfn && place->lpfn <= start))
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * amdgpu_vram_mgr_compatible - test each drm buddy block for compatibility
+ *
+ * @man: TTM memory type manager
+ * @res: The resource to test
+ * @place: The place to test against
+ * @size: Size of the new allocation
+ *
+ * Test each drm buddy block for placement compatibility.
+ */
+static bool amdgpu_vram_mgr_compatible(struct ttm_resource_manager *man,
+				       struct ttm_resource *res,
+				       const struct ttm_place *place,
+				       size_t size)
+{
+	struct amdgpu_vram_mgr_resource *mgr = to_amdgpu_vram_mgr_resource(res);
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		if (start < place->fpfn ||
+		    (place->lpfn && (start + num_pages) > place->lpfn))
+			return false;
+	}
+
+	return true;
+}
+
 /**
  * amdgpu_vram_mgr_debug - dump VRAM table
  *
@@ -753,6 +814,8 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
 	.alloc	= amdgpu_vram_mgr_new,
 	.free	= amdgpu_vram_mgr_del,
+	.intersects = amdgpu_vram_mgr_intersect,
+	.compatible = amdgpu_vram_mgr_compatible,
 	.debug	= amdgpu_vram_mgr_debug
 };
 
-- 
2.25.1

