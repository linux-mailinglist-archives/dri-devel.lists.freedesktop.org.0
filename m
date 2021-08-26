Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1593F8CFE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 19:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA386E888;
	Thu, 26 Aug 2021 17:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 137249 seconds by postgrey-1.36 at gabe;
 Thu, 26 Aug 2021 17:27:44 UTC
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown
 [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC696E051;
 Thu, 26 Aug 2021 17:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsZw5mjBk1TD/IYbCCgB4Yhefl1FUVNKtUKIoRfyTA0D4Yn/3TZyJNR0Zhhw0MdKM3dQlOR6Z3GMnSrcI7UjGeAoLoXnWfoeobWDHHiEIBvU54yvEr6iG6fhnUbNluz6houjycG3AUWQLwijq7OdGPp592kqowo2KKe1WXgp+VRCKvZyGRULXHPwJ7q0jDsfUueMJ/IuxomS00c8ccVhVEmmbuHZc/uQatyS8E1/cgtTgaWzMt4R4Gg5fUSijWbMMvzC1SaR1SmBfFt19ssfPNkPshXoC1BV99g6sFFyIUIhpFhHjbhgeFmpRSIat/gQKpsb/HVAdHnkymXa04JRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8p2OECCbMREYULrN+nWfym8HEYOFUtgXUtH7Xavsig=;
 b=ixXdQ0ng1jKgdMK2nu+gKnllVagljX2wvoP1v/vL/L4J6nyQeUxs/DCZ2vAqNR/TzSYbR3e9NPbHGpuEoIQfkyXP2JKTnT2UEW64WE/X9PFhTrzugzyaX1bQUCQHqYuADPoVH4SM0VCnO0WefSD5lawvw4yOMwEqS+l5C5jA/n9PS7EWjwk9TRCCPO7Rvmdth+RWIkdh/mm24yUqWLWpq0P5ZqRgD0qsgXhjsN0gtROtiYZxAdwCMVU1jqRWTUonnf/fhJ+NPr8fBtK0y7ER9QMcgeD9dj5RyU0CCFan7sKLH9OqLnmmtgl6kzcKUX++dOmk8BoL74gHhRw0rlp3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8p2OECCbMREYULrN+nWfym8HEYOFUtgXUtH7Xavsig=;
 b=IFKrPA12HriMq51lnrU98N2y94LhcqfknzCs96BHnXQ5SC8Iw6tk/7AMXu5yrNtQlER6WBps0Wxctj+8cyCzLyZ2xP0PO/ohUxuXDX+LmtAceDtaZuQcqxnT/k/smvxTsIsxyJUU4FNIAD1/gOsrpnIjpmHiftFra+fKltTh2N8=
Received: from BN9PR03CA0555.namprd03.prod.outlook.com (2603:10b6:408:138::20)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 17:27:42 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::c8) by BN9PR03CA0555.outlook.office365.com
 (2603:10b6:408:138::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 17:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 17:27:42 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 26 Aug 2021 12:27:40 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: [PATCH v2 1/4] drm/ttm: Create pinned list
Date: Thu, 26 Aug 2021 13:27:05 -0400
Message-ID: <20210826172708.229134-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
References: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ef2969f-4946-40e2-16fe-08d968b6cf69
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:
X-Microsoft-Antispam-PRVS: <DM6PR12MB405877D55B289E029978F269EAC79@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPwT1DYBorMppAeJzkqfnPujRNu5DWsEmMZ7oAb8cAfw5+880WJZdQVQST666RSJPRTWWfARddx27freL9Rr/wQYpmiLEB3xT5z4qny1O82yqktPy+60EXXCUcZLRkPtMGVc1kvzJnR6lPeM1JJlYfOZd2N4QF4joAM72TuTQPfLoHyHkAxqZ2xuSXNkQYJkpJPJ8adSRS2DTXimXP0XgSIIWqOc96Aqv6nkSX2WCQkNsSIbYzfXSAlEWNMJIjod7ivqKqEuVQlNZrSWFv1JX62cvIdMLGCVhjLw826VHZSE0j8QXrqKfnujMMVNxOPQv/JgdhyYy2LUUpsZIdUNEprfErKe735FPG7jFfp+L+0ZFODdc3S0Ze7LgVGGgegksb5PippJ254F2UDUSjgkexQ947TxYccoDDtHCJe2HY+pAJfL1VEXMr9ds+utC9zBt4GBqNkzZ06VPhA/YBTVgSko1YtnfJ5UufWrPN/QDHkSkEQgD9uw5qUT6J2JOFL9C3IMTIYbqirh97kc4YlRGSuKGRrtPe9WHUvxPgnrQ+lnoyMnfxQT6OcQcFpqkiQbBpvBI2sQ5T399LXTN6xZAEa9RhfNd0QAwUf+S4I15Lxk7HsHG9KD8wlY+jK5qHLQbTEDR6x36+PA+vU0zcLRT/2b6ETUtJ6zdvn/qQoP3/DRPQOM6hKXoKsVBfdeS85nrH0EQ205G8488eSTcFmZLhQM0WM5s3eER7OUa9nrWsU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(82310400003)(356005)(81166007)(7696005)(4326008)(1076003)(83380400001)(2616005)(8936002)(44832011)(478600001)(36860700001)(316002)(54906003)(82740400003)(426003)(336012)(186003)(16526019)(70206006)(8676002)(86362001)(26005)(66574015)(6666004)(70586007)(110136005)(47076005)(5660300002)(2906002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 17:27:42.2313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef2969f-4946-40e2-16fe-08d968b6cf69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This list will be used to capture all non VRAM BOs not
on LRU so when device is hot unplugged we can iterate
the list and unmap DMA mappings before device is removed.

v2: 
Reanme function to ttm_bo_move_to_pinned
Keep deleting BOs from LRU in the new function
if they have no resource struct assigned to them.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 30 ++++++++++++++++++++++++++----
 drivers/gpu/drm/ttm/ttm_resource.c |  1 +
 include/drm/ttm/ttm_resource.h     |  1 +
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1b950b45cf4b..64594819e9e7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -69,7 +69,29 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	}
 }
 
-static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
+static inline void ttm_bo_move_to_pinned_or_del(struct ttm_buffer_object *bo)
+{
+	struct ttm_device *bdev = bo->bdev;
+	struct ttm_resource_manager *man = NULL;
+
+	if (bo->resource)
+		man = ttm_manager_type(bdev, bo->resource->mem_type);
+
+	/*
+	 * Some BOs might be in transient state where they don't belong
+	 * to any domain at the moment, simply remove them from whatever
+	 * LRU list they are still hanged on to keep previous functionality
+	 */
+	if (man && man->use_tt)
+		list_move_tail(&bo->lru, &man->pinned);
+	else
+		list_del_init(&bo->lru);
+
+	if (bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(bo);
+}
+
+static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
 {
 	struct ttm_device *bdev = bo->bdev;
 
@@ -98,7 +120,7 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
 		dma_resv_assert_held(bo->base.resv);
 
 	if (bo->pin_count) {
-		ttm_bo_del_from_lru(bo);
+		ttm_bo_move_to_pinned_or_del(bo);
 		return;
 	}
 
@@ -339,7 +361,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	ttm_bo_del_from_lru(bo);
+	ttm_bo_move_to_pinned_or_del(bo);
 	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
@@ -1154,7 +1176,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		return 0;
 	}
 
-	ttm_bo_del_from_lru(bo);
+	ttm_bo_move_to_pinned_or_del(bo);
 	/* TODO: Cleanup the locking */
 	spin_unlock(&bo->bdev->lru_lock);
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2431717376e7..91165f77fe0e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -85,6 +85,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
+	INIT_LIST_HEAD(&man->pinned);
 	man->move = NULL;
 }
 EXPORT_SYMBOL(ttm_resource_manager_init);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 140b6b9a8bbe..1ec0d5ebb59f 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -130,6 +130,7 @@ struct ttm_resource_manager {
 	 */
 
 	struct list_head lru[TTM_MAX_BO_PRIORITY];
+	struct list_head pinned;
 
 	/*
 	 * Protected by @move_lock.
-- 
2.25.1

