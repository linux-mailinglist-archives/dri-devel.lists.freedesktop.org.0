Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C6157FE91
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C7B99E58;
	Mon, 25 Jul 2022 11:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07899F03;
 Mon, 25 Jul 2022 11:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNyMghcAoxNR589IX/zEvqYsQayWRtbyXxJ48+mCoaAkFX3pwAG58eL9zlHrJKFrraPJpGImxtHU2j7cmwQ1IMILptuD9cuXhA/9lKdP7lQQo4jjLEeJJjVl8s6fN4k2v9FmbaPRHgZkDkxluJKhygy7X3t3SkexgMetO9L8xiM8DBO4pNBkI939QPVQhlcYP/DcG8+KUr9JTugO3PY2aS0GAHkRIMF7yv9OpvCrZKMtzAzCMu0CFZfhd/9li71amGxVHEjuucl7dI3n+m4lAiVO93W4hSas4XYXwlb7xqlETqs9w3ALwcqgr9vmk9mkALdvzn0Qnp5VpzrzB/hb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4jeD1FwCiZsoUEqT0QALsMbgVdYUPyrZP2J1Zm+tlo=;
 b=gkv9l3mYIefGnK974buOMNcexQb1sgHul0YbEbiDE08mz2MvbrPxOS6qpMOgLLN1uspM5Fr8odQSrCY8QG6/hYABrG6PRsrnrOOjzJQrEimmKFEsMrrCz9XN20RLxem48kc5S8nqcQdnHMvV2qdv4Qkr1Nhxia+kowYWsCZXKiLscLn9bODRuDco8hmJBNjDoWtYnZm9YghRm861HuHqBSAE1eS/6qrz4UoWpmuKiDdD6gr9PxYpXaOdqcljzkV7KcfsH5o2mRZ2OPddrtuTzr2acBZqUu0U0dQ8M1zV3v5JaF4hSgSzvabywDRPooNkcXf9LXiLaID4gPqeucIohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4jeD1FwCiZsoUEqT0QALsMbgVdYUPyrZP2J1Zm+tlo=;
 b=eyRvxGP/63b5k2yW61ymZMiQv0QBt68bMshzlmlafI/uw2GrLgr95VHouPgIBhC3qdujaXNHoj+xCUG2Kku3Fo/q7/SlHwVAYihKxZW2K9+ySUlxaby9gY1AbjV4usF9+X5L6MuuCZ5BF3+tr0kQBZ+AJGe46oX5zI9c5XRJnvg=
Received: from BN9PR03CA0244.namprd03.prod.outlook.com (2603:10b6:408:ff::9)
 by DM6PR12MB3241.namprd12.prod.outlook.com (2603:10b6:5:186::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 11:43:39 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::8b) by BN9PR03CA0244.outlook.office365.com
 (2603:10b6:408:ff::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 25 Jul 2022 11:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 11:43:38 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 06:43:35 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 5/6] drm/nouveau: Implement intersect/compatible functions
Date: Mon, 25 Jul 2022 04:42:39 -0700
Message-ID: <20220725114240.4844-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e24697d-b1ae-4ffc-c37d-08da6e32ea8f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3241:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CddLj6nh8lPyEjnlDLm99HJ5dSpisyY/yxN8GFdV4EuaXL81ht0w9p3boDsx/AS1TvlOur0PyFAQowGWYaWbz47fsgsHSeIlfDNzUUorUcOhS6QFXoo5atEMO6xUM9cetMnEjkknCy1xwtIII+mDzihbjriw3TYM2nJJQFbyXclpOVevkgVcusrR9v3duixMn0fqeymrBJ1VLuEaZvUk8k5V0sj+3Grq9WbhRuaWFyD/8u4OHA41bdxW+8ja/eSirczVk8ASqdDrBkydIQlaNUZ1zVlZgFQJm6ecgrzc46liKvsadDoB2Z/VntlLUL8rGG6gi1lJCZnHXn1Zg3B7o2ba2pW3SuM3vjkoMQJxZbqCpP8i65yDmMVn4Ai73DCMaaEeBsVSiUwGO7Eh7X1eyATwh+yoMcU+t6RNVO+7WcIqH+Cl4f8JKKPjKtZGAePjxeSXArljymzY5Mi+bUit3rBOnXH7dc9KS/LCmkvodFc1iVuba0pB5vpMJjBSXVIUwOpIBlj2Z/zsTnd+2nXNcU/a7OhFuDQDHW12bimvYMO+L2W7xcIWgD8Z32MVl4yzKjVYtYiHl0mlJdDCN2invfS0W5MR/vAvNQJQm4FJn4wnPBVtoHNIfRgFOtXQGMWVLpyih5wA6jYHrZ5OwycdQXw/qPn9zKAAOy46C3plId9yavfm7MU1muQbgx/zA7vmRCsDQpHFpUFGr1bpt+4q+uAHStxUGRkJCt7Alk+gnyVh1Pzg2k4Uv/e7BPUTQAwMuyEMfn38pVAwvyoGZ/gs92QyBXND1Lrv9qkpzz969ri3lY00RGlBAouhD6NYwZtANCUBU73TSwCqsd1RLdl84w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(36860700001)(356005)(36756003)(82740400003)(86362001)(26005)(8936002)(336012)(47076005)(16526019)(2616005)(1076003)(426003)(81166007)(83380400001)(7696005)(40460700003)(478600001)(110136005)(54906003)(40480700001)(41300700001)(316002)(186003)(4326008)(8676002)(5660300002)(70586007)(82310400005)(70206006)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 11:43:38.7806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e24697d-b1ae-4ffc-c37d-08da6e32ea8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3241
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
fetching the start offset from struct ttm_resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_mem.h |  6 ++++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 24 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 2e517cdc24c9..18f1c22fbc2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -187,3 +187,32 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
 	*res = &mem->base;
 	return 0;
 }
+
+bool
+nouveau_mem_intersect(struct ttm_resource *res,
+		      const struct ttm_place *place,
+		      size_t size)
+{
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (res->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= res->start))
+		return false;
+
+	return true;
+}
+
+bool
+nouveau_mem_compatible(struct ttm_resource *res,
+		       const struct ttm_place *place,
+		       size_t size)
+{
+	u32 num_pages = PFN_UP(size);
+
+	if (res->start < place->fpfn ||
+	    (place->lpfn && (res->start + num_pages) > place->lpfn))
+		return false;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 325551eba5cd..4910e0e992ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -25,6 +25,12 @@ int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
 		    struct ttm_resource **);
 void nouveau_mem_del(struct ttm_resource_manager *man,
 		     struct ttm_resource *);
+bool nouveau_mem_intersect(struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+bool nouveau_mem_compatible(struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
 int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 85f1f5a0fe5d..c5e6f0eac47e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -42,6 +42,24 @@ nouveau_manager_del(struct ttm_resource_manager *man,
 	nouveau_mem_del(man, reg);
 }
 
+static bool
+nouveau_manager_intersect(struct ttm_resource_manager *man,
+			  struct ttm_resource *res,
+			  const struct ttm_place *place,
+			  size_t size)
+{
+	return nouveau_mem_intersect(res, place, size);
+}
+
+static bool
+nouveau_manager_compatible(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size)
+{
+	return nouveau_mem_compatible(res, place, size);
+}
+
 static int
 nouveau_vram_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
@@ -73,6 +91,8 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_vram_manager = {
 	.alloc = nouveau_vram_manager_new,
 	.free = nouveau_manager_del,
+	.intersect = nouveau_manager_intersect,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -97,6 +117,8 @@ nouveau_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_gart_manager = {
 	.alloc = nouveau_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersect = nouveau_manager_intersect,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -130,6 +152,8 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nv04_gart_manager = {
 	.alloc = nv04_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersect = nouveau_manager_intersect,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
-- 
2.25.1

