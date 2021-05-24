Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4238E781
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E56E5A3;
	Mon, 24 May 2021 13:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41923899E9;
 Mon, 24 May 2021 13:28:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTKJdzURLbKAP5/2ruxGf2aGvmUjI9E7VgC27tpJXlM2Vwlu5Qrhdjkbf0lEwDTfk8Z//SfkvhLc22UjC/oLnC3R8p9CYhbIUJJhWTgGcKeuFTZ9cqYc4gNdkINn37HFmW5wCGdzIOGP0UebS3+hHLaj78pZG/9oVNF6HxuNO1YOc62zv6yaXY10cQ527eftkLvwh4vZGDXJs7oNDfX44IvhISM1Re5a2w0ZjZZex6MhZQIoKXbf9bxH29TbQMYNllfVxrLusXBP7xyjQFAxZtpdCHpcg6n6LFGey3BQ9XwW2e7R5RfFma12qXVZb/2h6chCDcsCgLWCdt8zwOQq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ1Ns5M/+kaEP7q50Qd1RgGUv0ka0CpFUxlhrzxst08=;
 b=K9FDfMyEt2Thaio8eSHhS6tTVLT1Ta+H3rXEMCmUXbCaK+u8kBhMrsWPGp1vJ3A3roGa5AFtNmrn6pNswR2VSBL7GwUnkloZ8bD/nVVxG6rXSaWV0wypuQXZx8T9RvN7Jtd7ReknMsFlAt8YGxENCSIj1eNdQBdbmk9nRf+qIcriW57DQaCvcAfEWMWqvFQuEm2JXTeRRUAsFTxAu+jxr+aaBFzLsII5RGT4lKDDk1Wqvk+EPgF4GnjJAHG4fUnJ2b8dTHQ8gkPZbgKJnRCJaZaGmd1+kHOpOmFOw4F/qEOc/UTU/FtWpOCeJ+16I1K4ym4MQoKkX8sQGMbdPl0dIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ1Ns5M/+kaEP7q50Qd1RgGUv0ka0CpFUxlhrzxst08=;
 b=tjRs2gI6oRIJaRGSwdUIBCZaYby2yg/HvZGFwKTcL8UYFHUhvzYGGURcDhLEhHRt6LEj9DWVCkNTeRmUOEne1AZELXsffv8wq1TB+vM6P0OAnTY5ZecQsP0lumbr7atIPbKonuuA1+KMH2m71elFfQldO5+JQAFpdPfjtZecgdohAv0kzURsjrqljm3qB6knJ6V/dvbbghJ0ySifNBbWGPHKsWjIQx09Zmg1deNTN7nK3zTpf6GfswL+PnH9JpxYuwDU/vDhWJn+JC95In6BYjIZuw3DbTRVqEqqyjt2Exf1Yz6YtNSBs2PbvJOghoS2D+cQx2o7vvWt0M5TAbie2A==
Received: from MW4PR04CA0027.namprd04.prod.outlook.com (2603:10b6:303:69::32)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 13:28:52 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:69:cafe::c3) by MW4PR04CA0027.outlook.office365.com
 (2603:10b6:303:69::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 13:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:28:52 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:28:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v9 05/10] mm: Rename migrate_pgmap_owner
Date: Mon, 24 May 2021 23:27:20 +1000
Message-ID: <20210524132725.12697-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210524132725.12697-1-apopple@nvidia.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9973e2be-a130-4a81-5f51-08d91eb7df38
X-MS-TrafficTypeDiagnostic: BL1PR12MB5078:
X-Microsoft-Antispam-PRVS: <BL1PR12MB50780D5DBBEC4D8540585FC4DF269@BL1PR12MB5078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpGh7Y3JkCYRlQHpdmet6LcqKvij6oU1EtkW4B6ulXAknWwAffkWYQ8BBSysJLzFP+wC3QabY1xR9XQpRmLtjcuj2im+JrbJx4Ihm8LOEtorX1dc1wGmdchAXtR+yVpdyHPViwhU3H7yfjzk6Ufl9lQ+9owv4iPwBhiULximvMuGiKVi61Jy2JpCP725lMjOcRhSh4LeSSUIpCdhHKaH4vhs1SOLwdD3xYSjoo0vjNNZTCZ7xU1J298oBTeIyrvcmUCFQQAV4rdCf0fOAGwnIqYj4XVXDXQ65mmkfKlSgQjH8qmoK2uIMqUzt49bcKL3AfVPor/XTP+lTiEZ17Weaa/YY8BrnJnCAiKcOg2/dSlZx4g+1f30CzI1PBRkDwdKZS/53jSZBCjW6/BGDd9/NGbDcXXPiRsdK+P5zVrF82EVoCgJxSyis+7fpfjFm+MmqgH7ZGrL161vvcSITkEHVUXTlxWijuAXccZMuc+QSrBZ6e9wB3Vd/zfZtXSnl0cx/R5DMyPobgwrHOhSmA2z33vlgzfxJUNZZ4mmCGfQbxwYt4R1ycPSFrZyV7kaHaLGL+uAnqKatP5MZzakyIDdBDpeV9Q2AJc9Lhmu0nH4MA1BetwvbTlqEa1ED53EFTxqVFogghYqIzOAXct9HoenyTroz7YnsALaKC6Yob5+qWY=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(36840700001)(26005)(1076003)(426003)(36860700001)(2616005)(186003)(16526019)(7416002)(8936002)(356005)(336012)(4326008)(478600001)(7636003)(82310400003)(70206006)(6666004)(83380400001)(82740400003)(47076005)(5660300002)(36756003)(86362001)(36906005)(70586007)(8676002)(107886003)(54906003)(110136005)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:28:52.1308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9973e2be-a130-4a81-5f51-08d91eb7df38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 jhubbard@nvidia.com, peterx@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MMU notifier ranges have a migrate_pgmap_owner field which is used by
drivers to store a pointer. This is subsequently used by the driver
callback to filter MMU_NOTIFY_MIGRATE events. Other notifier event types
can also benefit from this filtering, so rename the
'migrate_pgmap_owner' field to 'owner' and create a new notifier
initialisation function to initialise this field.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Peter Xu <peterx@redhat.com>

---

v9:

Previously part of the next patch in the series ('mm: Device exclusive
memory access') but now split out as a separate change as suggested by
Peter Xu.
---
 Documentation/vm/hmm.rst              |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c |  2 +-
 include/linux/mmu_notifier.h          | 20 ++++++++++----------
 lib/test_hmm.c                        |  2 +-
 mm/migrate.c                          | 10 +++++-----
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 09e28507f5b2..3df79307a797 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -332,7 +332,7 @@ between device driver specific code and shared common code:
    walks to fill in the ``args->src`` array with PFNs to be migrated.
    The ``invalidate_range_start()`` callback is passed a
    ``struct mmu_notifier_range`` with the ``event`` field set to
-   ``MMU_NOTIFY_MIGRATE`` and the ``migrate_pgmap_owner`` field set to
+   ``MMU_NOTIFY_MIGRATE`` and the ``owner`` field set to
    the ``args->pgmap_owner`` field passed to migrate_vma_setup(). This is
    allows the device driver to skip the invalidation callback and only
    invalidate device private MMU mappings that are actually migrating.
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index f18bd53da052..94f841026c3b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -265,7 +265,7 @@ nouveau_svmm_invalidate_range_start(struct mmu_notifier *mn,
 	 * the invalidation is handled as part of the migration process.
 	 */
 	if (update->event == MMU_NOTIFY_MIGRATE &&
-	    update->migrate_pgmap_owner == svmm->vmm->cli->drm->dev)
+	    update->owner == svmm->vmm->cli->drm->dev)
 		goto out;
 
 	if (limit > svmm->unmanaged.start && start < svmm->unmanaged.limit) {
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 1a6a9eb6d3fa..8e428eb813b8 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -41,7 +41,7 @@ struct mmu_interval_notifier;
  *
  * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
  * a device driver to possibly ignore the invalidation if the
- * migrate_pgmap_owner field matches the driver's device private pgmap owner.
+ * owner field matches the driver's device private pgmap owner.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP = 0,
@@ -269,7 +269,7 @@ struct mmu_notifier_range {
 	unsigned long end;
 	unsigned flags;
 	enum mmu_notifier_event event;
-	void *migrate_pgmap_owner;
+	void *owner;
 };
 
 static inline int mm_has_notifiers(struct mm_struct *mm)
@@ -521,14 +521,14 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
 	range->flags = flags;
 }
 
-static inline void mmu_notifier_range_init_migrate(
-			struct mmu_notifier_range *range, unsigned int flags,
+static inline void mmu_notifier_range_init_owner(
+			struct mmu_notifier_range *range,
+			enum mmu_notifier_event event, unsigned int flags,
 			struct vm_area_struct *vma, struct mm_struct *mm,
-			unsigned long start, unsigned long end, void *pgmap)
+			unsigned long start, unsigned long end, void *owner)
 {
-	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
-				start, end);
-	range->migrate_pgmap_owner = pgmap;
+	mmu_notifier_range_init(range, event, flags, vma, mm, start, end);
+	range->owner = owner;
 }
 
 #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
@@ -655,8 +655,8 @@ static inline void _mmu_notifier_range_init(struct mmu_notifier_range *range,
 
 #define mmu_notifier_range_init(range,event,flags,vma,mm,start,end)  \
 	_mmu_notifier_range_init(range, start, end)
-#define mmu_notifier_range_init_migrate(range, flags, vma, mm, start, end, \
-					pgmap) \
+#define mmu_notifier_range_init_owner(range, event, flags, vma, mm, start, \
+					end, owner) \
 	_mmu_notifier_range_init(range, start, end)
 
 static inline bool
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 80a78877bd93..5c9f5a020c1d 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -218,7 +218,7 @@ static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
 	 * the invalidation is handled as part of the migration process.
 	 */
 	if (range->event == MMU_NOTIFY_MIGRATE &&
-	    range->migrate_pgmap_owner == dmirror->mdevice)
+	    range->owner == dmirror->mdevice)
 		return true;
 
 	if (mmu_notifier_range_blockable(range))
diff --git a/mm/migrate.c b/mm/migrate.c
index 05740f816bc4..e5429a44e7a3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2526,8 +2526,8 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
 	 * that the registered device driver can skip invalidating device
 	 * private page mappings that won't be migrated.
 	 */
-	mmu_notifier_range_init_migrate(&range, 0, migrate->vma,
-		migrate->vma->vm_mm, migrate->start, migrate->end,
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
+		migrate->vma, migrate->vma->vm_mm, migrate->start, migrate->end,
 		migrate->pgmap_owner);
 	mmu_notifier_invalidate_range_start(&range);
 
@@ -3037,9 +3037,9 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			if (!notified) {
 				notified = true;
 
-				mmu_notifier_range_init_migrate(&range, 0,
-					migrate->vma, migrate->vma->vm_mm,
-					addr, migrate->end,
+				mmu_notifier_range_init_owner(&range,
+					MMU_NOTIFY_MIGRATE, 0, migrate->vma,
+					migrate->vma->vm_mm, addr, migrate->end,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-- 
2.20.1

