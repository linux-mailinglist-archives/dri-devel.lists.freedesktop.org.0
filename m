Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BA59AC4D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 09:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E98510E26E;
	Sat, 20 Aug 2022 07:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E3310E062;
 Sat, 20 Aug 2022 07:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC1Ci55I+TLkeT+JlL0kVPVfKxpWjfbeEBaxjBaCocizLNTyLxSzC85JRIHcCNh+vM8IXqjjeXd9sq17xjz/+89smLNxxA5nDZLCFj29fwGfK19fh2YmvH/vNitP4Dm5/AkLdwAL0OJKRuzvzpliCXTzGp79c7fxyyS1LWNuODyms0MulRwxgIdhs4PlYHeheb0juCZPzTGtNbzWCJ+a49A+BsAfY0d0dBAgUOups6sa2VciusIyEnd0qezuOBm/jLK/LpLfWNLA73AI+P75lhkyEB7h2HTSZ1vW7X6Mbc08/F6zgZxsPDInMYU6kBy04pKc5Kbp9Z6Ng0TWyaFdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM0N5U5eMdS/BppyetVaUGM9/4TitGf79Rb9ORBXzBI=;
 b=WIhy7W5popDrsRgFdZ2qk+JPf82bzf9XA5PyrXvhaVRYaTaqZFx3wd7Imiq7xgDcMQu0ppsFxoYzNJKXIxhvwEZmEb+b8gjP7rNYvZJgrxX6NM4iCJp4N6SE4FbK5TckXi8AMvCgeNN2UbBWO16WyO8wRsq2kt7FS2hZl15vjhsQwG5yBZhlmJHjYCYvrh0nGX5TWRXnB3hjGlDm6YLL0KOQfYOHVsv+T1344Cj8meMeyQav/fkZAZ5Rw0Dejn4bBOyUiV67lxa45ssilk/C1RiqZB5YHrIqhWhCu9ukDg6mCh9zmLfgOE5KfuwKHuf/YJQV4fReS3AUkY0EwKFmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM0N5U5eMdS/BppyetVaUGM9/4TitGf79Rb9ORBXzBI=;
 b=KfL7iv4/o26hpbMzaCFAVwA55pF1FShGOZxIyTI0UuKqyAXbcR0Ab9pEssfbITMhX1cxIAYw/U9PXjJG8qde6SkmHdiYjkNYoWOM4/kSHkQCPeFMd05L0SOaAo55hS9/ajBKd47x2OaH277rtuFD69cMnvIqu3ByxFQjNT5r+B8=
Received: from MW2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:907::29) by
 BYAPR12MB3239.namprd12.prod.outlook.com (2603:10b6:a03:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Sat, 20 Aug
 2022 07:33:37 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::ea) by MW2PR16CA0016.outlook.office365.com
 (2603:10b6:907::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Sat, 20 Aug 2022 07:33:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Sat, 20 Aug 2022 07:33:37 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sat, 20 Aug 2022 02:33:33 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v6 3/6] drm/amdgpu: Implement intersect/compatible functions
Date: Sat, 20 Aug 2022 00:33:01 -0700
Message-ID: <20220820073304.178444-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9979f2aa-020c-4286-687f-08da827e4ba1
X-MS-TrafficTypeDiagnostic: BYAPR12MB3239:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZRPEzOjQPEh3ga1VAOk1RUQAhDbJtoyk3DFuYGuHNHZw/6DXZB5Z6DDDCYDmvIOQJ/rYHnisavTvct842K2I/hluXb2W5y3sCFxeZa1+BmoEW9WdkRrSO7ErWrrjbkU/nCfN0hAg1nyPEHBfO3URJ0iM4UDw3tNUh8xtwstDUvyVOOmZZx6Kk1ZoDWZSFKISwMs8fkajvQdfBY+goEv3ugCsHYHbKsB6AV7LPZ1FZLHN9wlygVn784QA4MkpoLj9YADn9AnMqEuMC9Y76PYqFkBnvH7RrdVufmdShec3yxFINdo0fX2xKBBFjfcfzbrfPaGzPnKa0GvLFnBF4+qSiV2FJ/jUdUr4gr8jGLWcMmYbvKw08IoEORvFIo2dpuFLKOh5m5A7+HtLnCukFrQvs+3dv696Cx1z0HHnGAgOhMCs8GyxXDoTxidYJGtHSfB9rBCObXA0tRdBqrUumCmmBwkPR/1p9AIno/VDJaeTG+jiLA+RUk4ASFcjbV4INyqJ6gQiwu7C2Y0zM4TF8524Cl0lXu/yAosUQ7eQhmevI5thLSTC22JbqpT9UJcuNP6GqTvFNKiYlQvv24aAOofqKyd9NqbZbreGbkiu+xpBpu4doqk2ePrcL9NacuO6vES5dg3Xfrt0ME6RlyPvffi2UXgFHsk4QmsQtPXpVyYU3C2Usty6Ul0OhB9pM++o+XjvPMRftV638/F9OPVDUwsNcCJYF6sbBqxMZ9L5FtZwdbg0DySSWkYozBsXwud0AwjFgPgrlBOoT9SDP4Hrb3fWcr4J0WbraDvGZuulw4uM7y0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(40470700004)(46966006)(336012)(2616005)(1076003)(83380400001)(47076005)(16526019)(2906002)(5660300002)(54906003)(186003)(8936002)(7696005)(41300700001)(82310400005)(26005)(36756003)(478600001)(426003)(6666004)(4326008)(81166007)(356005)(40460700003)(82740400003)(36860700001)(86362001)(70206006)(70586007)(8676002)(110136005)(316002)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 07:33:37.0831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9979f2aa-020c-4286-687f-08da827e4ba1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3239
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 38 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 68 ++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8c6b2284cf56..1f3302aebeff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -204,6 +204,42 @@ void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 	amdgpu_gart_invalidate_tlb(adev);
 }
 
+/**
+ * amdgpu_gtt_mgr_intersects - test for intersection
+ *
+ * @man: Our manager object
+ * @res: The resource to test
+ * @place: The place for the new allocation
+ * @size: The size of the new allocation
+ *
+ * Simplified intersection test, only interesting if we need GART or not.
+ */
+static bool amdgpu_gtt_mgr_intersects(struct ttm_resource_manager *man,
+				      struct ttm_resource *res,
+				      const struct ttm_place *place,
+				      size_t size)
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
+	.intersects = amdgpu_gtt_mgr_intersects,
+	.compatible = amdgpu_gtt_mgr_compatible,
 	.debug = amdgpu_gtt_mgr_debug
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 28ec5f8ac1c1..d1a2619fa89f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -720,6 +720,72 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
 	return atomic64_read(&mgr->vis_usage);
 }
 
+/**
+ * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
+ *
+ * @man: TTM memory type manager
+ * @res: The resource to test
+ * @place: The place to test against
+ * @size: Size of the new allocation
+ *
+ * Test each drm buddy block for intersection for eviction decision.
+ */
+static bool amdgpu_vram_mgr_intersects(struct ttm_resource_manager *man,
+				       struct ttm_resource *res,
+				       const struct ttm_place *place,
+				       size_t size)
+{
+	struct amdgpu_vram_mgr_resource *mgr = to_amdgpu_vram_mgr_resource(res);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		unsigned long fpfn =
+			amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(amdgpu_vram_mgr_block_size(block) >> PAGE_SHIFT);
+
+		if (place->fpfn < lpfn &&
+		    (place->lpfn && place->lpfn > fpfn))
+			return true;
+	}
+
+	return false;
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
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		unsigned long fpfn =
+			amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(amdgpu_vram_mgr_block_size(block) >> PAGE_SHIFT);
+
+		if (fpfn < place->fpfn ||
+		    (place->lpfn && lpfn > place->lpfn))
+			return false;
+	}
+
+	return true;
+}
+
 /**
  * amdgpu_vram_mgr_debug - dump VRAM table
  *
@@ -753,6 +819,8 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
 	.alloc	= amdgpu_vram_mgr_new,
 	.free	= amdgpu_vram_mgr_del,
+	.intersects = amdgpu_vram_mgr_intersects,
+	.compatible = amdgpu_vram_mgr_compatible,
 	.debug	= amdgpu_vram_mgr_debug
 };
 
-- 
2.25.1

