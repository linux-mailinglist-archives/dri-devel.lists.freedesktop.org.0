Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88D7481BB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 12:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A7C10E34E;
	Wed,  5 Jul 2023 10:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93F210E11B;
 Wed,  5 Jul 2023 10:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/lCBolXKCh35YTgi8iP3FWhDBml/TTVBXs75qnm/SiW8t3CsgwQ9GZSaRgswvjZMzbbCxqHww4vFobvpmhLIIAaj5yqkvAZUMMX1j6fCj1y8DAfzGMlJXapzIjhqEtOvNXsG0kIe+RpZ+LZ/bcguiMv+hokyCZLUaG6Cwf8g3hidmBY0rq8xh8bKWPTzRj4k6E7b+XPC1Mb4eAkf88/TEY6cmiW0ukL9MZXW4rN+IZj4KZXc569cPU4xTFvoR56rOXxUEZOtQYXcvwEYZcsZWEo+llyzKVYN4IGOMDI17oPv/3hrhqPJhu3cv4WLTsWRdPXYT7R2UR6k2Fuhfvtrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhG/8K1OvK8Te039N1SK7XHIZ+Va/G27okLNhtBch9o=;
 b=KbYtARq31wMTKqZYZRwnsM6OUeS05Ldb9yBoVx6rW8brQMmKHhMQ/ZTj2h44O11pTuFcPi22Wt6ZnXv1eq311+nj9CU1XLHOrw5Ce4R2GZBZGYWiw6x9RTaELOvM7WCqn6sWhJLPcEymcdC2tJka/0ji+0baT6R3VZF6lgS8wn4GF+/TUpQzVlAGKMZdBM5zgDMaDPOTtLjWQFLVe2F+aD+m3jAzx2IIgR9Z/DDjcUXrt73TA3BzF0gS73IDmIiPUeVrByKcSnYYj9hbK40+cdyQjySl4cu32V4ELlMk24d64FDPuKen4Mbf9tGPVXfKWtHEpgz7a1eYZ5JL4x7D6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhG/8K1OvK8Te039N1SK7XHIZ+Va/G27okLNhtBch9o=;
 b=VtOV0CfR3G5Z1/jnXaj3CJhWfXF9afMGMAFv6YBze+i+7aqGQNtSIuQZPfz4uV6XY9rzXQARqlBN8sGYbmd9YtP4kIc+lfJTfENi0Mx9m61H4XImp/59muhy5A18cyTtb90nZamM+gVYbeEHpMDcwIOV82yETH89ZGo/zk7sMO8=
Received: from MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::35)
 by CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 10:08:31 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::ad) by MW4P223CA0030.outlook.office365.com
 (2603:10b6:303:80::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 10:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.44 via Frontend Transport; Wed, 5 Jul 2023 10:08:31 +0000
Received: from lang-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 5 Jul
 2023 05:08:29 -0500
From: Lang Yu <Lang.Yu@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/ttm: fix one use-after-free
Date: Wed, 5 Jul 2023 18:07:32 +0800
Message-ID: <20230705100732.432835-1-Lang.Yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT059:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c57ee59-95f2-482e-a0f3-08db7d3fc901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MoA74oGAM1UxcZMgU83j79/HGkUfEsT2RNEwIrzLNDKwHvVGmoikp+rk8wkYIXIJyQJlqLfp52/58EnYEJ0e0ii33j3HdHLIyiDP2tgd/jbjCXpt0HDPx/AYK+oLQZreIJWadBmmv8u+KEOQMJ5yWnsuPkjqCjWztmGEF6UauJ6/WrRZF3H1tRZRDWn41ELLJS3/wllGU5Px6dv6zzK19Z1NpYNJPSqy2akex3siM/FQIlyut40+Q5B8BW/vfZYwBZoQzviPjxx0PMEsBAkHWkLpMC/92fwr/kdCEx0pRzUWlr+C2cHVTBcmGUAIbq5sOJg38ubvE0knDS2jNuL59uQgVIpqdm4XJT/dx/+h6SwkyfOnQmPwn0TAMaNNJaP1yOa4qeiBovgCgGx1sexFd8f8ojDo7+rJMsphS9CWBAp4qUXAA+uVG6JvXTrNrLS9tbv1rp25czNMZAg1Md4+oEjrDBvG3UMt70rZtxTVwKAp5tggh59w75Zbaymb36djWGo5afb4mftCn56xKNsf/Gvi/VwqlQDBt1h/M7qQG/9MJKDJqOMJpda18Kq1G8RNXqyW5aiV8QSpw64a7ziG+9h6Pn5FE6SU/l5/iylSCRxYQp4N3ZcV4Y+GJpjp9vTEX1fWovH6hQdiOQVoY6rMLWEGYFgy6VjqJEU0dSUtblVpRqeoaEZCu0sWdk37kWvabmhGzU6MluA/JZw97yDYLyaGkXgp1TpxK7l9WJIw0HvbWvtPPBOgyewuwvBxuqPyJdtzO3YhPRm670IW8re93w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(8936002)(5660300002)(2616005)(8676002)(40480700001)(36860700001)(86362001)(426003)(40460700003)(47076005)(83380400001)(82740400003)(81166007)(41300700001)(316002)(36756003)(4326008)(70586007)(54906003)(186003)(336012)(26005)(478600001)(110136005)(6666004)(1076003)(450100002)(16526019)(7696005)(356005)(2906002)(82310400005)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:08:31.0233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c57ee59-95f2-482e-a0f3-08db7d3fc901
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
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
Cc: Lang Yu <Lang.Yu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bo->kref is increased once(kref_init()) in ttm_bo_release,
but decreased twice(ttm_bo_put()) respectively in
ttm_bo_delayed_delete and ttm_bo_cleanup_refs,
which is unbalanced.

Just clean up bo resource in one place for a delayed deleted bo.

Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")

[   67.399887] refcount_t: underflow; use-after-free.
[   67.399901] WARNING: CPU: 0 PID: 3172 at lib/refcount.c:28 refcount_warn_saturate+0xc2/0x110
[   67.400124] RIP: 0010:refcount_warn_saturate+0xc2/0x110
[   67.400173] Call Trace:
[   67.400176]  <TASK>
[   67.400181]  ttm_mem_evict_first+0x4fe/0x5b0 [ttm]
[   67.400216]  ttm_bo_mem_space+0x1e3/0x240 [ttm]
[   67.400239]  ttm_bo_validate+0xc7/0x190 [ttm]
[   67.400253]  ? ww_mutex_trylock+0x1b1/0x390
[   67.400266]  ttm_bo_init_reserved+0x183/0x1c0 [ttm]
[   67.400280]  ? __rwlock_init+0x3d/0x70
[   67.400292]  amdgpu_bo_create+0x1cd/0x4f0 [amdgpu]
[   67.400607]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
[   67.400980]  amdgpu_bo_create_user+0x38/0x70 [amdgpu]
[   67.401291]  amdgpu_gem_object_create+0x77/0xb0 [amdgpu]
[   67.401641]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
[   67.401958]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x228/0xa30 [amdgpu]
[   67.402433]  kfd_ioctl_alloc_memory_of_gpu+0x14e/0x390 [amdgpu]
[   67.402824]  ? lock_release+0x13f/0x290
[   67.402838]  kfd_ioctl+0x1e0/0x640 [amdgpu]
[   67.403205]  ? __pfx_kfd_ioctl_alloc_memory_of_gpu+0x10/0x10 [amdgpu]
[   67.403579]  ? tomoyo_file_ioctl+0x19/0x20
[   67.403590]  __x64_sys_ioctl+0x95/0xd0
[   67.403601]  do_syscall_64+0x3b/0x90
[   67.403609]  entry_SYSCALL_64_after_hwframe+0x72/0xdc

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 89 ++++--------------------------------
 1 file changed, 10 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 326a3d13a829..1e073dfb1332 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -224,82 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	dma_resv_iter_end(&cursor);
 }
 
-/**
- * ttm_bo_cleanup_refs
- * If bo idle, remove from lru lists, and unref.
- * If not idle, block if possible.
- *
- * Must be called with lru_lock and reservation held, this function
- * will drop the lru lock and optionally the reservation lock before returning.
- *
- * @bo:                    The buffer object to clean-up
- * @interruptible:         Any sleeps should occur interruptibly.
- * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
- * @unlock_resv:           Unlock the reservation lock as well.
- */
-
-static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
-			       bool interruptible, bool no_wait_gpu,
-			       bool unlock_resv)
-{
-	struct dma_resv *resv = &bo->base._resv;
-	int ret;
-
-	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
-		ret = 0;
-	else
-		ret = -EBUSY;
-
-	if (ret && !no_wait_gpu) {
-		long lret;
-
-		if (unlock_resv)
-			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
-
-		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
-					     interruptible,
-					     30 * HZ);
-
-		if (lret < 0)
-			return lret;
-		else if (lret == 0)
-			return -EBUSY;
-
-		spin_lock(&bo->bdev->lru_lock);
-		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
-			/*
-			 * We raced, and lost, someone else holds the reservation now,
-			 * and is probably busy in ttm_bo_cleanup_memtype_use.
-			 *
-			 * Even if it's not the case, because we finished waiting any
-			 * delayed destruction would succeed, so just return success
-			 * here.
-			 */
-			spin_unlock(&bo->bdev->lru_lock);
-			return 0;
-		}
-		ret = 0;
-	}
-
-	if (ret) {
-		if (unlock_resv)
-			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
-		return ret;
-	}
-
-	spin_unlock(&bo->bdev->lru_lock);
-	ttm_bo_cleanup_memtype_use(bo);
-
-	if (unlock_resv)
-		dma_resv_unlock(bo->base.resv);
-
-	ttm_bo_put(bo);
-
-	return 0;
-}
-
 /*
  * Block for the dma_resv object to become idle, lock the buffer and clean up
  * the resource and tt object.
@@ -622,8 +546,10 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	}
 
 	if (bo->deleted) {
-		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
-					  ctx->no_wait_gpu, locked);
+		if (locked)
+			dma_resv_unlock(bo->base.resv);
+		spin_unlock(&bdev->lru_lock);
+		ret = ttm_bo_wait_ctx(bo, ctx);
 		ttm_bo_put(bo);
 		return ret;
 	}
@@ -1146,7 +1072,12 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	}
 
 	if (bo->deleted) {
-		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
+		struct ttm_operation_ctx ctx = { false, false };
+
+		if (locked)
+			dma_resv_unlock(bo->base.resv);
+		spin_unlock(&bo->bdev->lru_lock);
+		ret = ttm_bo_wait_ctx(bo, &ctx);
 		ttm_bo_put(bo);
 		return ret == -EBUSY ? -ENOSPC : ret;
 	}
-- 
2.25.1

