Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A54202904
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD2D6E432;
	Sun, 21 Jun 2020 06:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1696E429;
 Sun, 21 Jun 2020 06:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfCkh8mtE8PzF3fcSBisOue9ty4JiyoX/UWl7rpY6Pz85Z9VLmT+95Od3oe1z7TvE9lOfUjj6ROSxJEUBnlhM7H6Y5aYLOr2xDFyalSRJkpbkoQ5DMQVhRx4kbC8LrhtegFeVcb5HZV2S1Z+bmTbMCCXR3qO0KPEBfY0F68pHfw/etIIu00tH++H/zp1qPAOAZkxVJ5FuDYDD9vrezJddcOAZudjb0xtwmmMWRKSedbxkgvZENkRKQnETA3M51wsdP6x0jJ0BM7F+4zVPrITxkRx/W/jSbHUuiRxukIhqPb4sox8iQMl5mCTUz/OdSVzTzmD5Gs+H19MWD63v+PfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1rpjBDgVFtT3sOaRH3UdkS29znTqSN7f10TADoAmIM=;
 b=k2/PfeyBKvwf9FJri8BbAuH2e8r+mpswsImd9/qEI9lIgljz3UXcQ5xDQDP9M5fPs7j7yYOglUgOLm18DPFa2rWGJx+/Y/S6Ub6zyw7Whi5nnXrv4H6ImRe18fz2MODoPsE5elSEo0VFGKMyrdaoRViHoF6YdpCITOq6VJam7qcPdTK0I2B5r7PSOHEZPZFX/U6A5rfNQ46rwg2paJp9IXIiAIjfpFv0v5Y+XP4cimFRHktiQlrOVpMJ/qkf+SYqGc+jo86PGVQnaia+YhFU+UB0x28ZxKRpTKgn/zTvMxiuemQJaqCB4aUNAAn+USUbjdW5ZmPGAr2KBTMtYUChTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1rpjBDgVFtT3sOaRH3UdkS29znTqSN7f10TADoAmIM=;
 b=tchMP52qMq4UUu98bevekBCUtX8g7PflIl8yV4gbZ9Kb5S9NDwi/NY5Q1MIEi+gNaVKlMiAV9Msa2RMqWiy4BhJtJ829Un7S6nFWwpNsuUdajpjIKwn5X3GBPz4MDQA7OojAbMaPTISLkVSz1RzuJiRNt5mZeDOETHSoau2GkGc=
Received: from BN6PR17CA0036.namprd17.prod.outlook.com (2603:10b6:405:75::25)
 by MN2PR12MB4520.namprd12.prod.outlook.com (2603:10b6:208:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sun, 21 Jun
 2020 06:05:42 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::f6) by BN6PR17CA0036.outlook.office365.com
 (2603:10b6:405:75::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:40 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:39 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:39 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/8] drm/ttm: Remap all page faults to per process dummy
 page.
Date: Sun, 21 Jun 2020 02:03:02 -0400
Message-ID: <1592719388-13819-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(47076004)(82740400003)(186003)(6666004)(8936002)(8676002)(36756003)(70206006)(70586007)(110136005)(54906003)(316002)(478600001)(5660300002)(86362001)(7696005)(83380400001)(426003)(2906002)(356005)(336012)(44832011)(82310400002)(81166007)(26005)(2616005)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b81da50-a404-46e1-088c-08d815a92031
X-MS-TrafficTypeDiagnostic: MN2PR12MB4520:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45206B75B48CD9BF4911DB2FEA960@MN2PR12MB4520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5QzQh19oe2gkEXow8N25mXhf5ASuH8rNT3Vx7slZBvXI889qeRi0vhx0bKvAuhoxidzjL7qNpT/vKI5tjMdAgzEEhby5EfTvIay42i5PhQdS6eDf7BRn0aqABv1jwZpDOOKfPCI2UJmgOXZ+4UHav5IUvtDCEuTQ2vhmreLRDHj/+AJ5KsYy4DRwPhNMorMlc/SuywUsBm3kqdkZ8hQUhOEMJ7sL3jR5AFSylo8DRrHBfBEtjZnxBWxesKd1OHL5npVt2rC1YumPDXbRPv5mxRaqZFtFc9h0qTibbJgVGNecwcvUVY4lNres/C8OCUJh/qdwvNysZKTXsNqdjbflH2DlZE50yHDYijHtAVWVRsA3nL+RGZELqaYnPgFzTmCGJwNagJxqcOGtPU2O9Pr2yQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:40.6226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b81da50-a404-46e1-088c-08d815a92031
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4520
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

On device removal reroute all CPU mappings to dummy page per drm_file
instance or imported GEM object.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 65 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 389128b..2f8bf5e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -35,6 +35,8 @@
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/drm_vma_manager.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <linux/mm.h>
 #include <linux/pfn_t.h>
 #include <linux/rbtree.h>
@@ -328,19 +330,66 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 	pgprot_t prot;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
 	vm_fault_t ret;
+	int idx;
+	struct drm_device *ddev = bo->base.dev;
 
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
+	if (drm_dev_enter(ddev, &idx)) {
+		ret = ttm_bo_vm_reserve(bo, vmf);
+		if (ret)
+			goto exit;
+
+		prot = vma->vm_page_prot;
 
-	prot = vma->vm_page_prot;
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
+		if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+			goto exit;
+
+		dma_resv_unlock(bo->base.resv);
+
+exit:
+		drm_dev_exit(idx);
 		return ret;
+	} else {
 
-	dma_resv_unlock(bo->base.resv);
+		struct drm_file *file = NULL;
+		struct page *dummy_page = NULL;
+		int handle;
 
-	return ret;
+		/* We are faulting on imported BO from dma_buf */
+		if (bo->base.dma_buf && bo->base.import_attach) {
+			dummy_page = bo->base.dummy_page;
+		/* We are faulting on non imported BO, find drm_file owning the BO*/
+		} else {
+			struct drm_gem_object *gobj;
+
+			mutex_lock(&ddev->filelist_mutex);
+			list_for_each_entry(file, &ddev->filelist, lhead) {
+				spin_lock(&file->table_lock);
+				idr_for_each_entry(&file->object_idr, gobj, handle) {
+					if (gobj == &bo->base) {
+						dummy_page = file->dummy_page;
+						break;
+					}
+				}
+				spin_unlock(&file->table_lock);
+			}
+			mutex_unlock(&ddev->filelist_mutex);
+		}
+
+		if (dummy_page) {
+			/*
+			 * Let do_fault complete the PTE install e.t.c using vmf->page
+			 *
+			 * TODO - should i call free_page somewhere ?
+			 */
+			get_page(dummy_page);
+			vmf->page = dummy_page;
+			return 0;
+		} else {
+			return VM_FAULT_SIGSEGV;
+		}
+	}
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
