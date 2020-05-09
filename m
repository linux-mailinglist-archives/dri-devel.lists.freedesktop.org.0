Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8871CC3CE
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 20:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF61D6E3B8;
	Sat,  9 May 2020 18:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39436E398;
 Sat,  9 May 2020 18:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axiX86+NpVT5DPzkriq3pz/nBu/VJ4vkQAnSp38l256xF6fHOw5Z8R+roNdusU14k9I6e59IrF9aXoz4jw8sFLMF8BRI74DWrU18mqMqYW20C6q6C1Uq43X9DlIkQmARvGDc0ucrDFgeUQykB2oEUNvyDZBzw2qWluq4EqqFwNJ5kqE/snZdvp+PwGnaHxgxTt5Sj/ZqAVDbdIxnqvehKtUqOqFbx1Knriq3HKBOCHyJku9qkU432FJIgD7wtworYQv2s6JG+M7dNVICGInZ6FfaZ5uCcSQkQsq1D3HpvWIPey9KGh/6pdAx54+pe4o6hmvqPv0uGk5RpdYoc1slXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W9BKV/jtDYbnBXpvIQ0FEk7nr+GMOiFZC6YHQNjNBs=;
 b=TtSKz3f0NfKtj4Z4OhD53SBhi+cOB7eM95yK9SSb0DsjI+Nc83/xbf2BjAIq1SjUto/3RfiXEi56i0Pt1D8kIrNF2lYerM6BQliQsmWlB7aoJ3u0kOp0xSTi+2UonfJT79FbdpEZPmj+c7nDDcZof371vF/rk+YSRlfKfv3LqpirBHs55FTa05168AlZwaM4XQxa5/YKo5717nYfyqzXZDpHek8kV0QDNtWt9l9MhAC0LIG55FS8miiOwS3Py5cb4JYOOCskeW/jx+fURGkmInenljKCim7z8mgOfzYxyUAt3CnXKIMHsafyJ+re+n+8YdZEV9nhnwMZGfnDGGp8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W9BKV/jtDYbnBXpvIQ0FEk7nr+GMOiFZC6YHQNjNBs=;
 b=ObvLJD4KWGBdW745gEOg33aDA/B1AonQwpX0H5Isz2L5dpbfjwYbve1I4h74Md7Ffe5hGvj/XkxKqUYqeUj1Kur4LqCHfjVU0r0jkDwQVaolPmQTecTDFu83O+JfTl93wgGnivtJf63+V3MaTepvj1rd0BgLApcEE7lian7NVNg=
Received: from MWHPR15CA0060.namprd15.prod.outlook.com (2603:10b6:301:4c::22)
 by DM5PR12MB1532.namprd12.prod.outlook.com (2603:10b6:4:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.33; Sat, 9 May 2020 18:52:16 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::25) by MWHPR15CA0060.outlook.office365.com
 (2603:10b6:301:4c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 18:52:16 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 18:52:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:14 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:14 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 9 May 2020 13:52:13 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdgpu: Force unmap all user VMAs on device removal.
Date: Sat, 9 May 2020 14:51:46 -0400
Message-ID: <1589050310-19666-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966005)(33430700001)(5660300002)(186003)(36756003)(47076004)(8676002)(4326008)(82310400002)(70206006)(26005)(6666004)(70586007)(316002)(54906003)(8936002)(110136005)(7696005)(2906002)(81166007)(2616005)(82740400003)(336012)(33440700001)(86362001)(478600001)(426003)(44832011)(356005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2e79030-255f-4ae0-dec5-08d7f44a1770
X-MS-TrafficTypeDiagnostic: DM5PR12MB1532:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15328F8AFB3771B05C6B146AEAA30@DM5PR12MB1532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajEflt1lmlYk3TByr9fJ8cafSrdM350h5wTMfnPu7ENNIc+H3EMQdqOteq3IjhS4MuX82s/sHMLWKzc6y4XKqbAWNlsAWcaNUrj0gxGWPfcY5pZrWNQzi96RaO0sf4Txg93PmTz725WPGs8R0dUsGMiN/2SQZqncp45JQ30IhVfYpauGBJHW70kabwP0Tkrq4JaOfpXeDdK02f+D+FfR/utaJOncaBbOi/ddfhFqnVIRzBELb5U9w2o3XGMFCSNjiT+eqbdv/sedevKRlsqiuU/9Bu0F1xvetHpBzMZaeVBThPoBnTzXXhNYPxY3NJH7WFaFai32/4gsei1VO8jzghZCKz5uuOD+rEEoi9mDIAgNk/wcrtzTL9UJ/1MgR+DW0auuIxHkl/q2SQsdXGdtTa6kWaW+hX19wNqodGrqU3xfWT1SVaCxAWDtl2jyLtzjzhxJmF2WAdeA/fWqtPUd7RgZOANd/+oYCWaYIk0Aqx5W3QdNVltEZY2VYT7ZaS1788UIGtWZL54NWEA5dgvXgd4XyRbAc1PvhZB5zl2lp0hanPgY1zl+VPjRnxfKVHTH6/gegEEQI0vxRhZSBgdTzA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 18:52:15.2625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e79030-255f-4ae0-dec5-08d7f44a1770
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
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

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 14 ++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 ++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e6978a2..4da52b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1374,8 +1374,10 @@ amdgpu_device_ip_get_ip_block(struct amdgpu_device *adev,
 			      enum amd_ip_block_type type)
 {
 	int i;
-
 	for (i = 0; i < adev->num_ip_blocks; i++)
+
+
+
 		if (adev->ip_blocks[i].version->type == type)
 			return &adev->ip_blocks[i];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 76a6198..ea2b47e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1130,16 +1130,22 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	return ret;
 }
 
+static void amdgpu_force_unmap_user_space_mappings(struct drm_device *dev)
+{
+	struct amdgpu_device *adev = dev->dev_private;
+
+	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
+}
+
 static void
 amdgpu_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-#ifdef MODULE
-	if (THIS_MODULE->state != MODULE_STATE_GOING)
-#endif
-		DRM_ERROR("Hotplug removal is not supported\n");
 	drm_dev_unplug(dev);
+
+	amdgpu_force_unmap_user_space_mappings(dev);
+
 	amdgpu_driver_unload_kms(dev);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 3d822eb..22afd11 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -35,6 +35,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_cache.h>
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -1361,6 +1362,9 @@ int amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	if (!amdgpu_bo_is_amdgpu_bo(bo))
 		return 0;
 
+	if (drm_dev_is_unplugged(adev->ddev))
+		return -ENODEV;
+
 	abo = ttm_to_amdgpu_bo(bo);
 
 	/* Remember that this BO was accessed by the CPU */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
