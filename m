Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F359AC39
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 09:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429DA10E23F;
	Sat, 20 Aug 2022 07:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CCB10E062;
 Sat, 20 Aug 2022 07:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DurebbEcKVtfTkNktiNG6vqLs9LLWq48JjadNZM4Ukmx3+NBn41tCPkYRO5mr6uuVPrneZuIl3if4nbuj8fyUXyQjssf8WRCgwoLVIl8hYGm3U3Zv0UTX8O0eureOD9mVo/Q6Tdu3g/i0LyGt2LsPanuCHmhJZa3G5wmBSR9f81JAAvCHy/YiBmvw1QRiwVwyitCXlU4Rek8CMv2WtTVFyfnkpGHmu1QdL3M6PHh8dXT2Q1T911yCofry243vNFyODGWdunGbOz0uNTzMPJt1C78f8l8rG1e5hs2+0cfqP5cIzaXT44AX8ENx05NIIbifjHKOn2uhcc/V2oVoa2SwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95vY3PQaJkNR45JBAlCZM+yRN05H4Khn3rJicrIZCjQ=;
 b=hP/bQu8rZHHqL3kvJl+E6LuDQ8zdToAEZ9FoxM87SII1+Kc+Z3c8UtiHpE1SBiWeKJMibb5Kt0iGkpnsdI2r+U+sa2WqptOfFUMqTna/AkKRfcOTAW1WD+8YVjmxvoCnXHOhnB3catKvtRtn11yDuo/wcippSjkjffw+ig7ekCLbA79KTcC3zQrXP1D6PDkfkU9T1mlVlqQNk3Yl3MujnuK8v8+wdjyHGnDe66JtVd/Jk0JzoVNGaLnlysylJKNdZiWCcb3PWUJG+SjhOUDZlsyoBRCcTQgk/Wgzek4R3ASCDw0RC94iyJjNJ0MZxDL2QWckNNWfFbXiQDN5huoXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95vY3PQaJkNR45JBAlCZM+yRN05H4Khn3rJicrIZCjQ=;
 b=znmwClcziWcVvyIwkkx4NYqyTx+WP9htVVM+2WFqt9pP/n4MAIN3wV7oPKFxOoRXjWdsSiF3Ss6OhHPgzB9r4efHuz265gPw26DAH2n2YiCZdsKYNUcSvxGcOGhzkEpJHXnXeoo1eXtiLQzOTWr1L/oWE9nA5+txuBl2nEVWJOs=
Received: from MW4PR03CA0010.namprd03.prod.outlook.com (2603:10b6:303:8f::15)
 by CY4PR1201MB0181.namprd12.prod.outlook.com (2603:10b6:910:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Sat, 20 Aug
 2022 07:33:33 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::24) by MW4PR03CA0010.outlook.office365.com
 (2603:10b6:303:8f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.18 via Frontend
 Transport; Sat, 20 Aug 2022 07:33:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Sat, 20 Aug 2022 07:33:33 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sat, 20 Aug 2022 02:33:27 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Date: Sat, 20 Aug 2022 00:32:59 -0700
Message-ID: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9eaf6a0-735e-469d-3fec-08da827e4935
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0181:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85RC85uGTmdErHKPapgJ2uNlG76eMR3gcoN2HujkWSsYlYC615+jdk5KASwXdaUyWum0dp5qXAV36barN62M1FCGneXwitjPTYdbLnNkRpcH//vwlTRE72YyQV1rcfG7rJcH/ekUyEUKnqkXdrARTK+K8+iKsrR4SRScbZcI85/fDVWxxKavI2ykO5d5KmaJmBw+6/efOpXGBl3K/qJ1TMgOyts8UTnOogOULbcE7W7JnDcvr/2D/gFBAliLWYV1AYJ/jHrcjlIkEhdKMoEJSKrLV88/tkJSjSgrGSw9/kMgEg0SuRgKeLPqK60mYQgW9QH7LgKhpj63K5G3vho28XgNHu28RqEJcPn2y6IkJI3/yOOvqg0SphYSy9cCJ4KiN+cbYw8xsjPvVtErI2p/3OjmWIOvuEZu+/p+dMYA/SdI8EmjIAWNjVG/MWr5m88YSEtJ4/6EA62gEgL0Dd55CTqkqfQBXDw1Fr2yASGh8VxlsSApQXX9JoQri73HuFeDu5xxQIQ3Jkkvylb1haN8ztOiWmTYqvQjHpy8JeC+kS1ryHECvBvt8Af/XPFmTmR8n5DNJ3f0PuLRYrVObzzshtSQQX6p01cftwUCQaxO0JcQaEj6SzfegYLXSP6tCNq6xX1bswaakiB1a536af7OAJ9AfUyPLMDVGveqIY4MoHBgGqIDVNoO+OESBP9Jyggwsc8bTkeVQNkD4eZVb0pM6eiOvoyJenUvIClGzRO0lx5IhELIrDXXGsbDanxUj3Cs10fIfqPfIdxrLuuKqjfxhl8fhXk8SfHXyyRlaP//vQuCXRFSrdh94r3WfMhk6nh+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966006)(36840700001)(40470700004)(336012)(1076003)(81166007)(83380400001)(66574015)(8936002)(47076005)(426003)(82740400003)(2616005)(5660300002)(40460700003)(36860700001)(356005)(16526019)(70206006)(70586007)(40480700001)(8676002)(82310400005)(478600001)(316002)(41300700001)(6666004)(2906002)(54906003)(26005)(110136005)(186003)(4326008)(7696005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 07:33:33.0344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9eaf6a0-735e-469d-3fec-08da827e4935
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0181
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

We are adding two new callbacks to ttm resource manager
function to handle intersection and compatibility of
placement and resources.

v2: move the amdgpu and ttm_range_manager changes to
    separate patches (Christian)
v3: rename "intersect" to "intersects" (Matthew)
v4: move !place check to the !res if and return false
    in ttm_resource_compatible() function (Christian)
v5: move bits of code from patch number 6 to avoid
    temporary driver breakup (Christian)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  9 ++--
 drivers/gpu/drm/ttm/ttm_resource.c | 77 +++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++
 3 files changed, 119 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c1bd006a5525..f066e8124c50 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
+	struct ttm_resource *res = bo->resource;
+	struct ttm_device *bdev = bo->bdev;
+
 	dma_resv_assert_held(bo->base.resv);
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
-	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
-	    (place->lpfn && place->lpfn <= bo->resource->start))
-		return false;
-
-	return true;
+	return ttm_resource_intersects(bdev, res, place, bo->base.size);
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 20f9adcc3235..0d1f862a582b 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -253,10 +253,84 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
+/**
+ * ttm_resource_intersects - test for intersection
+ *
+ * @bdev: TTM device structure
+ * @res: The resource to test
+ * @place: The placement to test
+ * @size: How many bytes the new allocation needs.
+ *
+ * Test if @res intersects with @place and @size. Used for testing if evictions
+ * are valueable or not.
+ *
+ * Returns true if the res placement intersects with @place and @size.
+ */
+bool ttm_resource_intersects(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size)
+{
+	struct ttm_resource_manager *man;
+
+	if (!res)
+		return false;
+
+	if (!place)
+		return true;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!man->func->intersects) {
+		if (place->fpfn >= (res->start + res->num_pages) ||
+		    (place->lpfn && place->lpfn <= res->start))
+			return false;
+
+		return true;
+	}
+
+	return man->func->intersects(man, res, place, size);
+}
+
+/**
+ * ttm_resource_compatible - test for compatibility
+ *
+ * @bdev: TTM device structure
+ * @res: The resource to test
+ * @place: The placement to test
+ * @size: How many bytes the new allocation needs.
+ *
+ * Test if @res compatible with @place and @size.
+ *
+ * Returns true if the res placement compatible with @place and @size.
+ */
+bool ttm_resource_compatible(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size)
+{
+	struct ttm_resource_manager *man;
+
+	if (!res || !place)
+		return false;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!man->func->compatible) {
+		if (res->start < place->fpfn ||
+		    (place->lpfn && (res->start + res->num_pages) > place->lpfn))
+			return false;
+
+		return true;
+	}
+
+	return man->func->compatible(man, res, place, size);
+}
+
 static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
 {
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
 	unsigned i;
 
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
@@ -265,8 +339,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
-		if (res->start < heap->fpfn || (heap->lpfn &&
-		    (res->start + res->num_pages) > heap->lpfn))
+		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
 			continue;
 
 		if ((res->mem_type == heap->mem_type) &&
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index ca89a48c2460..5afc6d664fde 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -88,6 +88,38 @@ struct ttm_resource_manager_func {
 	void (*free)(struct ttm_resource_manager *man,
 		     struct ttm_resource *res);
 
+	/**
+	 * struct ttm_resource_manager_func member intersects
+	 *
+	 * @man: Pointer to a memory type manager.
+	 * @res: Pointer to a struct ttm_resource to be checked.
+	 * @place: Placement to check against.
+	 * @size: Size of the check.
+	 *
+	 * Test if @res intersects with @place + @size. Used to judge if
+	 * evictions are valueable or not.
+	 */
+	bool (*intersects)(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+
+	/**
+	 * struct ttm_resource_manager_func member compatible
+	 *
+	 * @man: Pointer to a memory type manager.
+	 * @res: Pointer to a struct ttm_resource to be checked.
+	 * @place: Placement to check against.
+	 * @size: Size of the check.
+	 *
+	 * Test if @res compatible with @place + @size. Used to check of
+	 * the need to move the backing store or not.
+	 */
+	bool (*compatible)(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+
 	/**
 	 * struct ttm_resource_manager_func member debug
 	 *
@@ -329,6 +361,14 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
+bool ttm_resource_intersects(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size);
+bool ttm_resource_compatible(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size);
 bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
 void ttm_resource_set_bo(struct ttm_resource *res,

base-commit: 8869fa666a9e6782c3c896c1fa57d65adca23249
-- 
2.25.1

