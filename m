Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3F1CC3CC
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 20:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3D06E3A8;
	Sat,  9 May 2020 18:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1068E6E3A4;
 Sat,  9 May 2020 18:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz45G31MQjbyucWLbE28RwS7DdDE38G3RHcqGIDgQLEmJh8aGmiOjFvJJE5jF7InOiKD+hAnx7ApONLPwwIv2ss/cfj+xKAJSfaSPSd0rBaaGQ9QvgC758cpi759VIP6p/VA6n4km3gaKd4RHudDYjCa+05TT4d+P3UEDCB0QA7tyx3bHhCgzGdIjw53cmdaovqdikk6inLIMceSj3GEFy3RbauV1PtCMW2VRwLa9Lnh85R4WOx3Z3tTI6msDLRaB7LMSmTrd2DJnNoVqDNja7gkzTt9H6ZFBK/LrQPBdaqjX5riCTIFd9vrUjSPVRxh0AUXKq/ZXPtgfU0gx/LEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjeDr4vh00REZhKlhOWQnvTcL0JviTbO0j9R0Tu/D7U=;
 b=ARmxlFMOKR/0rthiAZA2+R08Fz4wWv1OGyqGVs+HLfH1Irw3vi+cY+9/hIKEfpuSdDVd758GtKc+cpAkzkuX6aWJfXT051Ae0PwWStP7WXS41WnE4wJqmkTPi0TWUUfUOI5g51f9+XwIQ4yBOKgLj47YsJq9uqZeCQC5fUfxng+1llcp9kkQn4UJWiIJCzmYvNGh0z9gxTRn8nZKlSDWHjxV3oktp7zZBBN3fucVref23HHbppNnUbEki3P5THhNAh9XGik0HQzmiXf32lkdgWMrKosV9JVKx4UXScIOylUouG/FtdGfs9dgdyOKYsHtjEZrwFpKF4U5kx4UxWXYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjeDr4vh00REZhKlhOWQnvTcL0JviTbO0j9R0Tu/D7U=;
 b=WJ6L9POxtEfQdZvafZkE09V+HC9HlqC7hw4tH68C1gI2B+HnR3r5wOS9K79qxhoWRa6be2ekH47SM716/zmJGrwhmy8KjoEEm+bDZ/r4exWJwV9jkoq4uCNN0V6+yPOxyBDPl3RXADpWDAePrubNXSW2UuxbKwVKrjq3M5BNVHI=
Received: from DM5PR20CA0020.namprd20.prod.outlook.com (2603:10b6:3:93::30) by
 BN6PR12MB1396.namprd12.prod.outlook.com (2603:10b6:404:1b::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.26; Sat, 9 May 2020 18:52:19 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::10) by DM5PR20CA0020.outlook.office365.com
 (2603:10b6:3:93::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 18:52:19 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 18:52:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:18 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:18 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 9 May 2020 13:52:17 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/ttm: Add destroy flag in TTM BO eviction interface
Date: Sat, 9 May 2020 14:51:49 -0400
Message-ID: <1589050310-19666-6-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(33430700001)(316002)(7696005)(2616005)(4326008)(426003)(478600001)(356005)(70206006)(44832011)(110136005)(33440700001)(82310400002)(70586007)(54906003)(8676002)(2906002)(8936002)(47076004)(5660300002)(36756003)(186003)(81166007)(86362001)(82740400003)(6666004)(336012)(26005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6e1134a-d550-4c93-f7c5-08d7f44a19b8
X-MS-TrafficTypeDiagnostic: BN6PR12MB1396:
X-Microsoft-Antispam-PRVS: <BN6PR12MB13961E8204D92725845FF745EAA30@BN6PR12MB1396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:80;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q3c3lxqooF8D9HRubA+yEiIWXRaGlm9+zhMvjRBOwo7s4MM2nXde3GQvDhd8tJafcshJcK9rscdAyd+ed91JmFJz9GtLV+2pB/YfAQUbgTrSjRl6n4ts6hI+uV/pnZI0GrJTBOIV8rliMENbTcgQygmmpPxgAZ1gnb+zq4HsYUt1BLkOfgZkxLymvALBlD0UbqDQCDDp0vZKlMkExENARv3o541A5HbeaRird7lFp/ReID84620RcxVosQfkmEIW1D1p4A+E/00KdxTIEPq62d9/ch9m+p+E4LcX8hp0Ynm3qYyElNPOWxgUV8qAsTmnJpa+ZvoLfdpoksaC4Irk2CEPMSbgY0t1hoWe358aScjBGbJFi1xEr58G6XESzKAF/vckRv6OJiRS/5/lSPPP29AFo0dEuSGu1rhjAAJRhCTw5Ajq4vDQxbuzMmUI1h32gszr/WzyvcHJTKVEbiVz2t0xtXT57+kqd5rE1UuB1G6+25jsJwJ4S32n+W9gB4c+8HMzoASU3ZhwndUqaUqKuk2QY+alRkiU0/n52aSfQqCIwzbfsASuOJHkg1UR37BZiH5l2iRPm/mYJOdxm9y+aA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 18:52:19.1604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e1134a-d550-4c93-f7c5-08d7f44a19b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1396
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will allow to invalidate, destroy backing storage and notify users
of BOs when device is unpluged.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c            |  4 +--
 drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                | 41 ++++++++++++++++++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 ++---
 include/drm/ttm/ttm_bo_api.h                |  2 +-
 8 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 1a4894f..f96c6d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1145,7 +1145,7 @@ static int amdgpu_debugfs_evict_gtt(struct seq_file *m, void *data)
 	if (r < 0)
 		return r;
 
-	seq_printf(m, "(%d)\n", ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_TT));
+	seq_printf(m, "(%d)\n", ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_TT, false));
 
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 22afd11..82d43d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1046,7 +1046,7 @@ int amdgpu_bo_evict_vram(struct amdgpu_device *adev)
 		return 0;
 	}
 #endif
-	return ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_VRAM);
+	return ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_VRAM, false);
 }
 
 static const char *amdgpu_vram_names[] = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6b1629c..f3eea89 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -759,7 +759,7 @@ nouveau_do_suspend(struct drm_device *dev, bool runtime)
 	}
 
 	NV_DEBUG(drm, "evicting buffers...\n");
-	ttm_bo_evict_mm(&drm->ttm.bdev, TTM_PL_VRAM);
+	ttm_bo_evict_mm(&drm->ttm.bdev, TTM_PL_VRAM, false);
 
 	NV_DEBUG(drm, "waiting for kernel channels to go idle...\n");
 	if (drm->cechan) {
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index ab72dc3..45bb89b 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -359,10 +359,10 @@ int qxl_bo_check_id(struct qxl_device *qdev, struct qxl_bo *bo)
 
 int qxl_surf_evict(struct qxl_device *qdev)
 {
-	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_PRIV);
+	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_PRIV, false);
 }
 
 int qxl_vram_evict(struct qxl_device *qdev)
 {
-	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_VRAM);
+	return ttm_bo_evict_mm(&qdev->mman.bdev, TTM_PL_VRAM, false);
 }
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 140d94c..3eeeb8d 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -429,7 +429,7 @@ int radeon_bo_evict_vram(struct radeon_device *rdev)
 			return 0;
 	}
 #endif
-	return ttm_bo_evict_mm(&rdev->mman.bdev, TTM_PL_VRAM);
+	return ttm_bo_evict_mm(&rdev->mman.bdev, TTM_PL_VRAM, false);
 }
 
 void radeon_bo_force_delete(struct radeon_device *rdev)
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index eae61cc..a17f87c2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -42,6 +42,7 @@
 #include <linux/module.h>
 #include <linux/atomic.h>
 #include <linux/dma-resv.h>
+#include <drm/drm_drv.h>
 
 static void ttm_bo_global_kobj_release(struct kobject *kobj);
 
@@ -652,7 +653,8 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_device *bdev, int resched)
 EXPORT_SYMBOL(ttm_bo_unlock_delayed_workqueue);
 
 static int ttm_bo_evict(struct ttm_buffer_object *bo,
-			struct ttm_operation_ctx *ctx)
+			struct ttm_operation_ctx *ctx,
+			bool destroy)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_mem_reg evict_mem;
@@ -665,18 +667,23 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	placement.num_busy_placement = 0;
 	bdev->driver->evict_flags(bo, &placement);
 
-	if (!placement.num_placement && !placement.num_busy_placement) {
+	evict_mem = bo->mem;
+	evict_mem.mm_node = NULL;
+	evict_mem.bus.io_reserved_vm = false;
+	evict_mem.bus.io_reserved_count = 0;
+
+	if (destroy || !placement.num_placement && !placement.num_busy_placement) {
 		ret = ttm_bo_pipeline_gutting(bo);
 		if (ret)
 			return ret;
 
-		return ttm_tt_create(bo, false);
-	}
+		ret = ttm_tt_create(bo, false);
 
-	evict_mem = bo->mem;
-	evict_mem.mm_node = NULL;
-	evict_mem.bus.io_reserved_vm = false;
-	evict_mem.bus.io_reserved_count = 0;
+		if (bdev->driver->move_notify)
+			bdev->driver->move_notify(bo, true, &evict_mem);
+
+		return ret;
+	}
 
 	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
 	if (ret) {
@@ -785,7 +792,8 @@ static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
 			       uint32_t mem_type,
 			       const struct ttm_place *place,
 			       struct ttm_operation_ctx *ctx,
-			       struct ww_acquire_ctx *ticket)
+			       struct ww_acquire_ctx *ticket,
+			       bool destroy)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
 	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
@@ -846,7 +854,7 @@ static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
 
 	spin_unlock(&ttm_bo_glob.lru_lock);
 
-	ret = ttm_bo_evict(bo, ctx);
+	ret = ttm_bo_evict(bo, ctx, destroy);
 	if (locked)
 		ttm_bo_unreserve(bo);
 
@@ -919,7 +927,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 		if (mem->mm_node)
 			break;
 		ret = ttm_mem_evict_first(bdev, mem->mem_type, place, ctx,
-					  ticket);
+					  ticket, false);
 		if (unlikely(ret != 0))
 			return ret;
 	} while (1);
@@ -1428,7 +1436,8 @@ int ttm_bo_create(struct ttm_bo_device *bdev,
 EXPORT_SYMBOL(ttm_bo_create);
 
 static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
-				   unsigned mem_type)
+				   unsigned mem_type,
+				   bool destroy)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
@@ -1450,7 +1459,7 @@ static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
 		while (!list_empty(&man->lru[i])) {
 			spin_unlock(&glob->lru_lock);
 			ret = ttm_mem_evict_first(bdev, mem_type, NULL, &ctx,
-						  NULL);
+						  NULL, destroy);
 			if (ret)
 				return ret;
 			spin_lock(&glob->lru_lock);
@@ -1494,7 +1503,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 
 	ret = 0;
 	if (mem_type > 0) {
-		ret = ttm_bo_force_list_clean(bdev, mem_type);
+		ret = ttm_bo_force_list_clean(bdev, mem_type, false);
 		if (ret) {
 			pr_err("Cleanup eviction failed\n");
 			return ret;
@@ -1510,7 +1519,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 }
 EXPORT_SYMBOL(ttm_bo_clean_mm);
 
-int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
+int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type, bool destroy)
 {
 	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
 
@@ -1524,7 +1533,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return 0;
 	}
 
-	return ttm_bo_force_list_clean(bdev, mem_type);
+	return ttm_bo_force_list_clean(bdev, mem_type, destroy);
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 71e45b56..350064f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -468,7 +468,7 @@ static int vmw_request_device(struct vmw_private *dev_priv)
 	if (dev_priv->cman)
 		vmw_cmdbuf_remove_pool(dev_priv->cman);
 	if (dev_priv->has_mob) {
-		(void) ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB);
+		(void) ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB, false);
 		vmw_otables_takedown(dev_priv);
 	}
 	if (dev_priv->cman)
@@ -501,7 +501,7 @@ static void vmw_release_device_early(struct vmw_private *dev_priv)
 		vmw_cmdbuf_remove_pool(dev_priv->cman);
 
 	if (dev_priv->has_mob) {
-		ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB);
+		ttm_bo_evict_mm(&dev_priv->bdev, VMW_PL_MOB, false);
 		vmw_otables_takedown(dev_priv);
 	}
 }
@@ -1227,7 +1227,7 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	if (dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
 		dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
 		spin_unlock(&dev_priv->svga_lock);
-		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
+		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM, false))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index b9bc1b0..9d57b8c 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -597,7 +597,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type);
  * -ERESTARTSYS: The call was interrupted by a signal while waiting to
  * evict a buffer.
  */
-int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type);
+int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type, bool destroy);
 
 /**
  * ttm_kmap_obj_virtual
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
