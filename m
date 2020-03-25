Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33F5192CAB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 16:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524716E1A2;
	Wed, 25 Mar 2020 15:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577D26E15D;
 Wed, 25 Mar 2020 15:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMN8cqdnzjfgM9CkTDr8RJEg1HpM1LK4/3d6KgGCKNPv12OMpOF3S01XwVjvJO4iJcu89DcedBOZeiNMGHqvz7O1BldO07dG5cDXPiE37iMRNx7mnoGTlVj2D9cIGRJVu0/iIgV9ETCEa+AcWy7nFZoGBmYF59+1S8EXFHIYgDSAZCnQ0lmW/4vEOs44Wst4QKMBJ+aBS574t8J2TKgPOnE+4neggCnfBLOsfuHeeZhYiSzkm9FEv6lCAmgh/fNNbWWYuRFKJZw3PWdb/v+0lRoQ/dkHy8y8fJ+qcbQ56XgoT2+TgOBoWVmiVOgNt5plRtPusjj20JhZJxb2sB8aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQKy3eHMlZMHfY8OaitOQBJmkTnoZnZBEjzNvtspV+A=;
 b=LAhHGWE3Hp9EHuu+sG1bi0GbxpQ8HKYPdR0SrlIMDCmNXKcL7MdSetI/6NUKg3cWF5wqgKib2LAQfmf4JOyEq00TRHHoIvajOHZa9mOt6VPoe0EcaiU7O8PgnpqACwHSagEY0JinWlOTlcuFHmzmWEpK6dsexCRTORydndxFfODTrXeRbJXs3GvD17Fo2B7n0IJ9fQtpyCMgDy6RPE1mxR1dGjCLaz7fe2F8tutsuJKaVZKUsSv661DKHKGWrv6yLhasi7hjL52WDmJnaKl+rdxsiXXQM5dcceicvVUskWSYSPhQatXEaB5yO2sUNihbQ+KKQvfghhb05r1wH3Ypog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQKy3eHMlZMHfY8OaitOQBJmkTnoZnZBEjzNvtspV+A=;
 b=OlCXR63v7jpGG7srjDP1Ym8hzJQc9iJZkV/PrRsPkgxusp75lQOPOWWInEeyUbxgHXlFO+EkBC0BmGnu7hUBw0Fw3GFpTVWnmKFdiFbL29/pozp78fkKHlEQ2CnLH5rZVhLQYBVWKcFPElAVTcUbcQLga6l/R0NlDIAgqsH7udQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB3648.namprd12.prod.outlook.com (2603:10b6:208:c1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19; Wed, 25 Mar
 2020 15:35:21 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 15:35:21 +0000
From: Huang Rui <ray.huang@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: clean up the inteface which is not used
Date: Wed, 25 Mar 2020 23:34:54 +0800
Message-Id: <1585150494-20989-1-git-send-email-ray.huang@amd.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-intel.amd.com (180.167.199.188) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2835.18 via Frontend Transport; Wed, 25 Mar 2020 15:35:19 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [180.167.199.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba06aa35-af23-4a7b-62f7-08d7d0d220c3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3648:|MN2PR12MB3648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB364822F653D29A7BACAD1153ECCE0@MN2PR12MB3648.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(5660300002)(26005)(186003)(16526019)(52116002)(7696005)(478600001)(86362001)(8676002)(8936002)(81166006)(81156014)(956004)(2616005)(316002)(450100002)(2906002)(6486002)(4326008)(66946007)(66556008)(66476007)(36756003)(6666004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3648;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtebaVSMVoEvZAfCaIMMGF42Vp1zKkPCdSchFV37HB+xCIjvROk63taL/QK0cMHyBcnTvGpdMge6YXRPUY+97ZoSgDI+riqPCAVKU21Gc/qnJFWTzHd4IbHU9GUPKnmjQ/3bGMOPdBp02bO0AJh9RORake/ETU9GYBEZCVCtAchjBJ0vW0EDpQ3YB0ijsg0WNr3ijpht4VIP4h2U04ck2HgGFWVc0tNYD/7LT6azHOLPiS0xE1FgBvWxpSHsh4kSq8j/MqafB6YyBqpf/+aHwVkv0mbnbxocsPmyE56CQEkjYe/nK8ftesSbmnRumqBWxSncdOEYW3y/QAu65eOVLEq74gPrj3drCN9ZdoKwxpiL9g7x1ic86JehSH6dzlAzZYexSPPlJ+em/sOhaooNN+dRwwAeMBPTRmA/Wp1tORszmPy8jd8cAzWIVu2Z31z9
X-MS-Exchange-AntiSpam-MessageData: GqIQb89XMQ3M3kjl5FNNpGmTyH7aSYjfM4P201bbUU/wQsgg3LE3JkwvW48x8ka31G7j7xtZJeEZ1dmQLdzDktU/HhP+Y+NCPhcTe0ss2Wc70QJ13XVD3qDve/1L+pzuNrZtNy98FqZgDThKbHjppA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba06aa35-af23-4a7b-62f7-08d7d0d220c3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 15:35:20.9778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFXrzH7u6ueFSo5BB2OZ48c5V2b57o1YON/foEqowuZmBEQo/8qT1RFad5eUuuNBuXcHNJtOTKXMUlky2OjyuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3648
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
Cc: Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

invalidate_caches is actually not used, so clean it up.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 ------
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  7 -------
 drivers/gpu/drm/qxl/qxl_ttm.c              |  6 ------
 drivers/gpu/drm/radeon/radeon_ttm.c        |  6 ------
 drivers/gpu/drm/ttm/ttm_bo.c               |  8 +-------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  6 ------
 include/drm/ttm/ttm_bo_driver.h            | 13 -------------
 7 files changed, 1 insertion(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index cd2bde6..b397148 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -62,11 +62,6 @@
 
 #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
 
-static int amdgpu_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
-{
-	return 0;
-}
-
 /**
  * amdgpu_init_mem_type - Initialize a memory manager for a specific type of
  * memory request.
@@ -1746,7 +1741,6 @@ static struct ttm_bo_driver amdgpu_bo_driver = {
 	.ttm_tt_create = &amdgpu_ttm_tt_create,
 	.ttm_tt_populate = &amdgpu_ttm_tt_populate,
 	.ttm_tt_unpopulate = &amdgpu_ttm_tt_unpopulate,
-	.invalidate_caches = &amdgpu_invalidate_caches,
 	.init_mem_type = &amdgpu_init_mem_type,
 	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
 	.evict_flags = &amdgpu_evict_flags,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1b62ccc..7dd94e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -647,13 +647,6 @@ nouveau_ttm_tt_create(struct ttm_buffer_object *bo, uint32_t page_flags)
 }
 
 static int
-nouveau_bo_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
-{
-	/* We'll do this from user space. */
-	return 0;
-}
-
-static int
 nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 			 struct ttm_mem_type_manager *man)
 {
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 16a5e90..62a5e42 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -48,11 +48,6 @@ static struct qxl_device *qxl_get_qdev(struct ttm_bo_device *bdev)
 	return qdev;
 }
 
-static int qxl_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
-{
-	return 0;
-}
-
 static int qxl_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 			     struct ttm_mem_type_manager *man)
 {
@@ -256,7 +251,6 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 
 static struct ttm_bo_driver qxl_bo_driver = {
 	.ttm_tt_create = &qxl_ttm_tt_create,
-	.invalidate_caches = &qxl_invalidate_caches,
 	.init_mem_type = &qxl_init_mem_type,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &qxl_evict_flags,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index f4af6703..40282bf 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -66,11 +66,6 @@ static struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
 	return rdev;
 }
 
-static int radeon_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
-{
-	return 0;
-}
-
 static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 				struct ttm_mem_type_manager *man)
 {
@@ -774,7 +769,6 @@ static struct ttm_bo_driver radeon_bo_driver = {
 	.ttm_tt_create = &radeon_ttm_tt_create,
 	.ttm_tt_populate = &radeon_ttm_tt_populate,
 	.ttm_tt_unpopulate = &radeon_ttm_tt_unpopulate,
-	.invalidate_caches = &radeon_invalidate_caches,
 	.init_mem_type = &radeon_init_mem_type,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &radeon_evict_flags,
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2445e2b..fd09bbb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -343,14 +343,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	}
 
 moved:
-	if (bo->evicted) {
-		if (bdev->driver->invalidate_caches) {
-			ret = bdev->driver->invalidate_caches(bdev, bo->mem.placement);
-			if (ret)
-				pr_err("Can not flush read caches\n");
-		}
+	if (bo->evicted)
 		bo->evicted = false;
-	}
 
 	if (bo->mem.mm_node)
 		bo->offset = (bo->mem.start << PAGE_SHIFT) +
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index d8ea3dd..3f3b2c7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -736,11 +736,6 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
 	return NULL;
 }
 
-static int vmw_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
-{
-	return 0;
-}
-
 static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 		      struct ttm_mem_type_manager *man)
 {
@@ -866,7 +861,6 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_create = &vmw_ttm_tt_create,
 	.ttm_tt_populate = &vmw_ttm_populate,
 	.ttm_tt_unpopulate = &vmw_ttm_unpopulate,
-	.invalidate_caches = vmw_invalidate_caches,
 	.init_mem_type = vmw_init_mem_type,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index cac7a8a..5f60c1e 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -256,19 +256,6 @@ struct ttm_bo_driver {
 	 */
 	void (*ttm_tt_unpopulate)(struct ttm_tt *ttm);
 
-	/**
-	 * struct ttm_bo_driver member invalidate_caches
-	 *
-	 * @bdev: the buffer object device.
-	 * @flags: new placement of the rebound buffer object.
-	 *
-	 * A previosly evicted buffer has been rebound in a
-	 * potentially new location. Tell the driver that it might
-	 * consider invalidating read (texture) caches on the next command
-	 * submission as a consequence.
-	 */
-
-	int (*invalidate_caches)(struct ttm_bo_device *bdev, uint32_t flags);
 	int (*init_mem_type)(struct ttm_bo_device *bdev, uint32_t type,
 			     struct ttm_mem_type_manager *man);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
