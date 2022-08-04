Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358535899A9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8C812BA10;
	Thu,  4 Aug 2022 09:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8719268F;
 Thu,  4 Aug 2022 09:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVswnelQmvtaKEv81KUOzw/A6a55X8MrSLxn0ugIIKEGUN8NBk5fSTJxZTwB87G44+BNFIxxXT7cXSEcuDlKAJf7syQ/mp2uSrTI453tyeMyd1rVmZbHfDUf0mGi2XhFRa3iqhqvaROzfREvR0oez4zFrBbDcl7iqbr6OgLiDhEdij3o3P0tieKJPQjISt+pcOxVRamXzSfjdxCc1P7ruUqnTusJS3E5X0so3BROWsbPB2eA6WmuDEg01mHL5KH+LlgQafQ+XFjW9WGNkGVUlNbdYWRGnOhHi61QR5qOgOSBjWyxYnpkS9VTcAb2exLCu6VX+7gV1aK+dsBW7160jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P04dvtCfC2VffX4AzEaJGgocu8FdpxqMFhwH6JUkJCU=;
 b=hWBOxbNP8fWithOhDh4FMe6pes5cjmxqmx0BW+/qnxvn9+vFjeR9RNaVGAMzE+dA8IIY5DI1IvThO1bjy4ojtIZKNepczKuW234v7Leiud4B6uulH/O5ru08UwaUqEQbODUIm0eNIULbKiKXb34EKQBQsqypD3P1PO/+kYxPgG5bdb4BIVLC3OC+TyRuZ9/d03tctvOx0tTW3TivzYedAQklVWpp2zzDGR+8jKeCBciGBOcdTVoPJe+26FtV/vaAXtVod/5xD3brlfhbV7QsSrhS1BDmrj1GVIT54+h43XRYmB+CwGpKhLodhjyc4Ig5z3C6nbCayzVv3L/pppKn/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P04dvtCfC2VffX4AzEaJGgocu8FdpxqMFhwH6JUkJCU=;
 b=XvUUanGOe/4edkwd0xKIJk2KPis/qBB77JcXSVp6ML2PpvvXPlu42PtLJjMXG2e+Bg1R4j4GcCGpYoeDK8pvvq4dUtfQ9nUO2hyKL8aXYd57sp5IHNiOATM8oCuiWMrVfGGrq2uEhep7b4YyJirAGESs0f7yX6CQ+cJzMWYgJck=
Received: from DS7PR03CA0342.namprd03.prod.outlook.com (2603:10b6:8:55::14) by
 BN6PR12MB1444.namprd12.prod.outlook.com (2603:10b6:405:10::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Thu, 4 Aug 2022 09:00:35 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::8e) by DS7PR03CA0342.outlook.office365.com
 (2603:10b6:8:55::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Thu, 4 Aug 2022 09:00:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 09:00:35 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 04:00:26 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 6/6] drm/ttm: Switch to using the new res callback
Date: Thu, 4 Aug 2022 01:59:52 -0700
Message-ID: <20220804085952.6137-6-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cf57f4a-0dc7-4b54-9a36-08da75f7cb47
X-MS-TrafficTypeDiagnostic: BN6PR12MB1444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16+sYPs4dZ9ftCpsOwauWbzCjQfI9KbP8ccd/xlXuD/ECR3q8O6S1TSFAtklgNDnwmCrQuO1RHJH6XUwjgikk9VOW5wawrw98Xl3fqdZB6IAUDUQ2zcIYxBwxYh5Yxjmg0vmyavNywsgqDQqUzQAQt9cabjhUWAZZ1JJ9/TB6PmjQ3BqX6RTmxjfog2Tom8g2MV/r0h0sJbcGiTZpdwsrok5Ce4jMp/LYFM3oCi5Uyrsj68cMfTcUkGJE+fXpWI0fh5+DiGScK3C1zgyTycWY0Z6ePkVS4PWpYQrdbKiphj7IIOJSgCIX8pxMI7Qxct31n39AOj/smyfJWKPVoNmOWPXtj0/hjHrtS9fUAlXQ6alXIRJYhUbOxw1CfYD8Ib7bTdBY5wkKATyCJG1z0tsJazfw3EtkESvvQPgzs1Z6LxR/JXn8oRsvqTXRWkPWbeA7EKaKoVizllcAvY87kW70V2mI3u/qnuHNRigoeq++xYqzbEB5Q7G3AJOcu30wHSz7sD+DIA5BlPPOCGLD8maINLJKebPyF7gTA4dP/7rs3O8jcytiRR0Qi1guHKLpJNG1FGHVQMtfHGRWvqe9229CVnhlr+KCbl0AXriE8sQlpaXbBkj0zRxbeI8UHUHKD5mG+vNdcmdfD2UsZ7fFL4VgNNJG+ZoW6jC078KuGleNX8xs02xB8g9iLybxbZu15kE42DR04hCSaom7rrzS6n/CPoJiBczUcmLcvQZw2XJB5WsuRPgzPmFaXEQVdUIgm8OxhSjAHvfnJUzY1wAVoSs0PH0WhY9HE7kaXc1dnbY9hvyHRCZFmUFPQakkuf2tEeMLOVPqi0ntiq2+niu3Qtnjg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(40470700004)(46966006)(36840700001)(110136005)(54906003)(40460700003)(316002)(478600001)(2906002)(82310400005)(40480700001)(70206006)(70586007)(4326008)(8676002)(5660300002)(8936002)(81166007)(36860700001)(356005)(83380400001)(186003)(82740400003)(86362001)(7696005)(26005)(41300700001)(6666004)(66574015)(426003)(336012)(36756003)(47076005)(16526019)(1076003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 09:00:35.3092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf57f4a-0dc7-4b54-9a36-08da75f7cb47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1444
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

Apply new intersect and compatible callback instead
of having a generic placement range verfications.

v2: Added a separate callback for compatiblilty
    checks (Christian)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
 drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
 drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
 3 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 170935c294f5..7d25a10395c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
-	unsigned long num_pages = bo->resource->num_pages;
 	struct dma_resv_iter resv_cursor;
-	struct amdgpu_res_cursor cursor;
 	struct dma_fence *f;
 
+	if (!amdgpu_bo_is_amdgpu_bo(bo))
+		return ttm_bo_eviction_valuable(bo, place);
+
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -1351,40 +1352,20 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			return false;
 	}
 
-	switch (bo->resource->mem_type) {
-	case AMDGPU_PL_PREEMPT:
-		/* Preemptible BOs don't own system resources managed by the
-		 * driver (pages, VRAM, GART space). They point to resources
-		 * owned by someone else (e.g. pageable memory in user mode
-		 * or a DMABuf). They are used in a preemptible context so we
-		 * can guarantee no deadlocks and good QoS in case of MMU
-		 * notifiers or DMABuf move notifiers from the resource owner.
-		 */
+	/* Preemptible BOs don't own system resources managed by the
+	 * driver (pages, VRAM, GART space). They point to resources
+	 * owned by someone else (e.g. pageable memory in user mode
+	 * or a DMABuf). They are used in a preemptible context so we
+	 * can guarantee no deadlocks and good QoS in case of MMU
+	 * notifiers or DMABuf move notifiers from the resource owner.
+	 */
+	if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
 		return false;
-	case TTM_PL_TT:
-		if (amdgpu_bo_is_amdgpu_bo(bo) &&
-		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
-			return false;
-		return true;
 
-	case TTM_PL_VRAM:
-		/* Check each drm MM node individually */
-		amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
-				 &cursor);
-		while (cursor.remaining) {
-			if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
-			    && !(place->lpfn &&
-				 place->lpfn <= PFN_DOWN(cursor.start)))
-				return true;
-
-			amdgpu_res_next(&cursor, cursor.size);
-		}
+	if (bo->resource->mem_type == TTM_PL_TT &&
+	    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
 		return false;
 
-	default:
-		break;
-	}
-
 	return ttm_bo_eviction_valuable(bo, place);
 }
 
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
index 357249630c37..3d70e0f50a88 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -316,6 +316,8 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
 {
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
 	unsigned i;
 
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
@@ -324,8 +326,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
-		if (res->start < heap->fpfn || (heap->lpfn &&
-		    (res->start + res->num_pages) > heap->lpfn))
+		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
 			continue;
 
 		if ((res->mem_type == heap->mem_type) &&
-- 
2.25.1

