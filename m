Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A0E3F6AC1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 23:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC376E0D9;
	Tue, 24 Aug 2021 21:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51072897DC;
 Tue, 24 Aug 2021 21:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDerxI/9atC0HNDQ1tV5qRYbLvF53OubH3XZVryFi01PUvAdcm/4U1hcyqZlK+q6vSU/JI2SQxeWJVUb8YCwe0FBExH1QMglGZT3JPEHsUY4GxF0eyS75sQch1QZePAI1piJZwYB11b79ht24A6iNoJgjElXFtz0++NCu8Z7MmyexaVI3iRO5wCShvAq0WNoUIwO1v8/AIGfEFFMNHmIL5347nVtghjEeM3ejDiO8uFVz8fyqGgXRQ9PIxMS4hXhlGu3YLV/mnN7ulEvm6S5cBd8orgBGS8FnohEcF5J6sFdSococxjeO9Exe5ASpw+InODcVyhXLEBVWQyquYsuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djB1kWKxkOwN4AMciuiPVqqI4CTGOw4VEaM/8IOYJYk=;
 b=nr6fLQmrn8JY0dlOeSZw2ShgIHtbDxUyzng7fMfD2+L9kJIq1/Gi5DGA6cV0ebJ0Xmsba0Hs8CBjT1tpD5/0AGPuhRmQ/i09XfcdTGmLDZwL+RiTZupB5vwpkEFi+GbARVF4l5VA5i+63rjj6BXfBTYHlxOFRYnqxlDJxEULmjStUqrh0kRAo9tpCFz/aaqkYWkzB8XFohDlUHwgDnmcyJsIaI2FFz0WsjQuSG2GTsdaTaRabAiw8CfIH/WAOSq7mI2iQTg4PNb9uaIp+7uyHYLpanDWPiSmPWtZh3bfjTrc6qiagy6mSenzkYdPer9FdPrlKRighVm5jIaUjUoeCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djB1kWKxkOwN4AMciuiPVqqI4CTGOw4VEaM/8IOYJYk=;
 b=hC/E7DlunVKvUMO+twCOq6YXtdPB1kr3BSTh8cAV/QY8g6U9tE8kzxoJ6buNqzp6QhdxL/J7TGZx9QRjdOni4n47od09aMwlMx1cWwgDAmMlrTGztGisZvOPhe8UgxdoTmC8YG6e3ytlz/M36lwQL05xuk86N5o5NqQgR26bg7I=
Received: from BN9PR03CA0153.namprd03.prod.outlook.com (2603:10b6:408:f4::8)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 21:01:40 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::5f) by BN9PR03CA0153.outlook.office365.com
 (2603:10b6:408:f4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 21:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 21:01:39 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 24 Aug 2021 16:01:38 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: [PATCH 2/4] drm/ttm: Create pinned list
Date: Tue, 24 Aug 2021 17:01:18 -0400
Message-ID: <20210824210120.49812-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d8ef97-5d7a-45da-685d-08d967425e78
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27182E46A76312E7D16692F6EAC59@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pP4rO3Rh5F1rJ2lyhvUwBFJ9lhktZ3wX6G4CmyXaEL654/JVx36EvilwbQETxssLnub0YuTTu/tgHfluFGpTIsQ6BlwNgS1O9ibA6gouoR1MMV3gxJHc9SXf0k9npMFroUderVtfIvo15r7YPTowOmF9nPwCRuheCtLlllLV5iqBIEbkYKkNPXrt9zCQT1m2+z9xgAcwPScn/e8LdCG9zlLCZz+BjGPVecaU55n0nd+IGOkAD7NJ2Wujlw6ZnmNK1duIMQ04kEnqULljGsr8wM/jIa9CHkIKhrNv3w7WG9PoYY80XuNMUl+gyrOBsye1KFdXDh/cpuWPo4QJ04xNQdvrOVIu7Iezp4daUgc+GHlgSKO3mFULsUDoO/KcYSv512EcyJuYsOy4DWykOH8BiBlqj4fqtWM0gFHGckYyyQNgSJl4o4xMQu7ERJWDqh0AvziZr+gmT7Z7z3phtaJ6WTS9QgWWWt8YmlmfbFmcvlVL1IAF8czLTWnsU9Ev7SJdsU+V2DBfN0rZ7xA2N4hfd0cE2+hPNBuI8vdks4mSAa7uLRK2Cdz1foIAnzkw2ht4G45C9Kjr5MKrzauYWP+LqYdVazAdfP9Vg0L0lWmlSA6LqRwnkxRdcI7+e855WIhIrh+tfTme9dej7wDifET/itay/Od+zTI4k+w/u6HVOyNkNAThLU1laCZ12o+gWgQ3ZxyybSBm7J2VT+aqFm8/rKHrhjFR2VzqJDxcW7eXDmQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(36840700001)(46966006)(356005)(81166007)(4326008)(82740400003)(6666004)(54906003)(316002)(7696005)(44832011)(83380400001)(478600001)(2906002)(66574015)(1076003)(8676002)(5660300002)(70586007)(70206006)(36756003)(336012)(36860700001)(47076005)(86362001)(26005)(186003)(2616005)(16526019)(82310400003)(426003)(8936002)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 21:01:39.9647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d8ef97-5d7a-45da-685d-08d967425e78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
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

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 24 +++++++++++++++++++++---
 drivers/gpu/drm/ttm/ttm_resource.c |  1 +
 include/drm/ttm/ttm_resource.h     |  1 +
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1b950b45cf4b..84ba76ace58f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -69,16 +69,34 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	}
 }
 
-static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
+static void ttm_bo_del_from_lru_imp(struct ttm_buffer_object *bo, bool final)
 {
 	struct ttm_device *bdev = bo->bdev;
+	struct ttm_resource_manager *man = NULL;
 
-	list_del_init(&bo->lru);
+	if (bo->resource)
+		man = ttm_manager_type(bdev, bo->resource->mem_type);
+
+
+	if (!final && man && man->use_tt)
+		list_move_tail(&bo->lru, &man->pinned);
+	else
+		list_del_init(&bo->lru);
 
 	if (bdev->funcs->del_from_lru_notify)
 		bdev->funcs->del_from_lru_notify(bo);
 }
 
+static inline void ttm_bo_del_from_lru_final(struct ttm_buffer_object *bo)
+{
+	ttm_bo_del_from_lru_imp(bo, true);
+}
+
+static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
+{
+	ttm_bo_del_from_lru_imp(bo, false);
+}
+
 static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
 				     struct ttm_buffer_object *bo)
 {
@@ -453,7 +471,7 @@ static void ttm_bo_release(struct kref *kref)
 	}
 
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_del_from_lru(bo);
+	ttm_bo_del_from_lru_final(bo);
 	list_del(&bo->ddestroy);
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

