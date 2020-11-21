Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C4A2BBD30
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3226E971;
	Sat, 21 Nov 2020 05:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1538C6E96E;
 Sat, 21 Nov 2020 05:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZmU1pxwJFJ5NDbte4eH8PXQAV2dQP4ZuMfjZjRnG+KIgHVvG+SNcYAMZxKqckWuwIa98Hxr9GpiOIJx7unYstLwnVfvCqdsEpOSAH6fWMDdCdR1kmN4xElYaiJapORfhh+Rf39vtiC0AIyr03gdDO5ehiOgvh8J72CZ3ak+/htLPYKPumho1/GaVxIBQmLl//gauQ3AxZYMeiegWrrP37ymhHnLkAoKzMGoS6+/JiuPJ2alMLWaLfN8BM/L79GzjjYvhpwVP63xrIkpa3kwzSzlCksRCowWyJC+whZ1wmhjLhIziIRwnjNlcRa419r5JZ8S+ufrXk2cslY8Bnt+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KdivjN7Oh9cJqu9H8om7yVfPITx5vxLjTC2i/j/QHw=;
 b=STiggak1fnuVGFiFnz7hSXXKeJSZGDD9qa7FCMCxRNTk7xNqeJKkoyXPSEVylewamjnxALx7y6IWfLcX3AUPs9J5hjjNiQ8rhjLsMDeqhdwJZSAcedTMj0oJyI6c9B7NTgQC1STw0KjSZZ939QWFo5o3ZpdFRBIuQOSGpZvhnpkZWBfdICwoZGs7/9MHJM4pwdtGM8xqowxgOQLhPSYQgsltreR4JKSG5e5M3JEevziX6woXjkaXpbgw0tpwdh6d9GgsYmRvqdroJLXgxoWC8ZphVMpYlQ6mES0Advl6z6Naw9qNbNcr8stnKPgcCFg1qqoiqMeDVcE634Zw04cDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KdivjN7Oh9cJqu9H8om7yVfPITx5vxLjTC2i/j/QHw=;
 b=QA8Ift0DuwRWLQ8kXiseO+de0UoIMyauBt70i08lMeNwIJxy8jGaYnHwZaD+D5CQppQ1XBDIh+BqHrRsjETP21acHOAnicObwMWWcHvhSL7TcmipZZNqV+qQDlZd07EqWWHQ6wVx6t1FtnlMHcahcAQzM3kJ76Ntrss/k+9HVrQ=
Received: from DM6PR06CA0093.namprd06.prod.outlook.com (2603:10b6:5:336::26)
 by BYAPR12MB4629.namprd12.prod.outlook.com (2603:10b6:a03:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Sat, 21 Nov
 2020 05:21:35 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::74) by DM6PR06CA0093.outlook.office365.com
 (2603:10b6:5:336::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:33 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:33 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:32 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 03/12] drm/ttm: Remap all page faults to per process dummy
 page.
Date: Sat, 21 Nov 2020 00:21:13 -0500
Message-ID: <1605936082-3099-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eeaaa99-cfac-4a5a-7d7e-08d88ddd5015
X-MS-TrafficTypeDiagnostic: BYAPR12MB4629:
X-Microsoft-Antispam-PRVS: <BYAPR12MB46294707AACFDCC33C3317C0EAFE0@BYAPR12MB4629.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JATpGtlXXpyRwVcnbMAbRBcxlu4FmW442Mb++mlix+0p8n2cT11kx8DPBOf8w9o600nyDbBB40/ZZlWrLwMyzIMpYa2HKeZJEIwbniNSs76d+OHQoAFDr0k0csN/UaJ4WYrGv/pf6Vp34auBb3ZlW+W/sc4OcZVQqAdNyYtO12CKWEROh5oRqfX36+o3EbYjbR90Ct62jS76TxH7P7v2pM42R7iOjlcgCwfGEYUqNhN+ZeGbxRABQqY0/mXWf8PNV2dsOf4c075gOWBVUe7EfOlf2ButxhL5/H7qJmblycpgd6WbypYdtXvv4gK1JE1G+u5N7tYIy8WxEzztzS9jjXODt+7KYPHKRWXyRhvZYX9K7Y5/5uj5hJSFSBJhkXb1zq+wee6SZdLyP803Xe26KQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(7416002)(36756003)(2906002)(316002)(110136005)(54906003)(83380400001)(6666004)(356005)(70586007)(70206006)(478600001)(4326008)(82740400003)(44832011)(81166007)(5660300002)(426003)(186003)(26005)(336012)(2616005)(8936002)(8676002)(82310400003)(47076004)(86362001)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:34.2830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eeaaa99-cfac-4a5a-7d7e-08d88ddd5015
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4629
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On device removal reroute all CPU mappings to dummy page
per drm_file instance or imported GEM object.

v3:
Remove loop to find DRM file and instead access it
by vma->vm_file->private_data. Move dummy page installation
into a separate function.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 54 +++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 01693e8..f2dbb93 100644
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
@@ -420,23 +422,59 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
 
+vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct ttm_buffer_object *bo = vma->vm_private_data;
+	struct drm_file *file = NULL;
+	struct page *dummy_page = NULL;
+
+	/* We are faulting on imported BO from dma_buf */
+	if (bo->base.dma_buf && bo->base.import_attach) {
+		dummy_page = bo->base.dummy_page;
+	/* We are faulting on local BO */
+	} else {
+		file = vma->vm_file->private_data;
+		dummy_page = file->dummy_page;
+	}
+
+	/* Let do_fault complete the PTE install e.t.c using vmf->page */
+	get_page(dummy_page);
+	vmf->page = dummy_page;
+
+	return 0;
+}
+
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t prot;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
 	vm_fault_t ret;
+	int idx;
+	struct drm_device *ddev = bo->base.dev;
 
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
 
-	prot = vma->vm_page_prot;
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
+	if (!drm_dev_enter(ddev, &idx)) {
+		ret = ttm_bo_vm_dummy_page(vmf);
+		if (ret)
+			return ret;
+	} else {
+		ret = ttm_bo_vm_reserve(bo, vmf);
+		if (ret)
+			goto exit;
 
-	dma_resv_unlock(bo->base.resv);
+		prot = vma->vm_page_prot;
+
+		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+		if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+			goto exit;
+
+		dma_resv_unlock(bo->base.resv);
+
+exit:
+		drm_dev_exit(idx);
+	}
 
 	return ret;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
