Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9217948A2F5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC9010E20B;
	Mon, 10 Jan 2022 22:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4D910E3F8;
 Mon, 10 Jan 2022 22:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtgTD7zewdJN1JC7kVA3bALOE5wQW7HAIOHxoYwHzx429Cihy3jp0kHR9GvvNtTSG09wm0v3RBV1Otn/8WypMdamKXNlLliEznZKQnoqIwRR5Iumpg7C6Oi8y/Wpd7dQlNT2ZZUrHLbPTpR3T0I3v3ofj5qpjqDHIInQXr3UADklaab6408d2ioSx3w3Q2v8M+ed+iRCMOTPL2m1PPBHAPm10GZqW3krR6Hs+W4gxQhS1ok7+NeqWzbiFnZQvmzsNOVxUl/IJhiUMW/jNJkEkTTjVBE8rgl3eZykxnhw4i7kzPsK8m9MTvw/VvPr1DUXCV9Faml/pgI3HZeer4kA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=NAhe/iU1vCUzkyqyiN5VcfH526piea5RVxTlT/33MM63CiBy/XaxdaO8uTMh25twjGAcSYqEM86yDtHsJDjG3lEWWaEpxUZYUUCVNotCITVxKuYs3HF4rRbfW9HTlMJCLbvbhU225Csk/C7SGxlStWDiwwptfDf/R+c+gBEb56FcyiVMZgF1ktVi2vX+abLTSn9dLOvNpy9lhGdUqNikwIDS04trMYBUopRvTdcUTVGgaAVEU6OID8InItEYus/sfhNYoFwpgdOEMW0ZhYvdOZTEnKFnAAAx9dULRa98PqdcrGAAjjAlVv8Xxqfs1WxSmPwJpX7m6OJq9pp7C5ANNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=MsdVhfjAkCdaxzJbalXOmX8P21jGe7XvmZ2QnKQxoypH5Ar+DSJkJ3onPdexqE1k7fgmcJgCKllzA1BxVKHDQSVdUb2hbyZuEo41Q9me/Sns3dtvaeXxHiT603/SklVYz3L0U3bMZ0tdDE7D2mzkT1jAWvNA5VWOVdkwGP3JyCo=
Received: from BN7PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:20::39)
 by DM6PR12MB3225.namprd12.prod.outlook.com (2603:10b6:5:188::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 22:32:15 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::94) by BN7PR02CA0026.outlook.office365.com
 (2603:10b6:408:20::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Mon, 10 Jan 2022 22:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 22:32:14 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:32:13 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v3 04/10] drm/amdkfd: add SPM support for SVM
Date: Mon, 10 Jan 2022 16:31:55 -0600
Message-ID: <20220110223201.31024-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220110223201.31024-1-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58083dcd-525f-4a3a-dfd4-08d9d4890d5a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3225:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB322599C53D9BEDFA087C5B19FD509@DM6PR12MB3225.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqbHVJOPBZsHDFc4jor7rO5o0lKd5wOFDT09ZiBvVR4BOk0qBjyM1Wztmx6n/JisuPJENKIOLhESCSeuc48cgZ/3vPbybIhkculzM8qiPoDVReseM2d4c1wVJyvcl1j0+MJZ5C+po9ztACfUONvIsl2APnXkMD1kshA42rQY8WzaG7/CQ20lNZS2GSp1JIoX4kBKzF+I5VWIGwgExqcg54g82jTc9jfI1xrkf3juoDtrgaU6qv6dHEl6m1UYImYlMChWSqB9Dler8/BfcgH1iNG9yIO3kWpUB0ErkaZJYVQ4rrd2Okr1rjNRNMrjAgdsTvuP3SsCV4xJAAv8txh/ouCiMnI2pWrSAG9O0nXatiI9H5i+qltfy7aItU99LlidwGP8n6wd0gUzwoeCawVhx2h6pF/hTqYrDxNhNEvZpexEuWgaeLN+9HWnDY9yhCXf3HDoT6TyqU39NMfvh9A2PEC8pqf4CyZt1xFNzUk0SaXpu12beER/1HNrZWW3nn1kum1uF/uAtXwv4uZA7CWp99Q7m+0yIdu6YjDzagm6AFJO87DngkvG5N/J97KOZv53mRzQw64FdyPrUHgC+Mlmz8YiP1qmcApCGrT8VIsFJoJHo0n3MAyI1GCTSKCRgsUsA5pYEb2KuQj4kj6KMI8cl+asU8/KHP88BOeJRfaTcwSfv7WV430STckRT62KyHHjqp5Yms909ePjJOoGpzfbH4dKdmWqAPXjuwmlwqtrj0084eyB8bIOtercWcc5qPtPnwesKvDU03Euf2bln6XAdV3s8fTcFCvHzOx2/YmzutQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(426003)(508600001)(336012)(44832011)(16526019)(8936002)(2616005)(186003)(70586007)(2906002)(70206006)(26005)(54906003)(110136005)(4326008)(82310400004)(40460700001)(36860700001)(316002)(5660300002)(47076005)(86362001)(36756003)(356005)(81166007)(83380400001)(7416002)(6666004)(8676002)(1076003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:32:14.8834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58083dcd-525f-4a3a-dfd4-08d9d4890d5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3225
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_COHERENT to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
v7:
Remove lookup_resource call, so export symbol for this function
is not longer required. Patch dropped "kernel: resource:
lookup_resource as exported symbol"
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 29 +++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index aeade32ec298..9e36fe8aea0f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -935,7 +935,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -950,28 +950,34 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-	if (IS_ERR(res))
-		return -ENOMEM;
+	if (adev->gmc.xgmi.connected_to_cpu) {
+		pgmap->range.start = adev->gmc.aper_base;
+		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
+		pgmap->type = MEMORY_DEVICE_COHERENT;
+	} else {
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+		if (IS_ERR(res))
+			return -ENOMEM;
+		pgmap->range.start = res->start;
+		pgmap->range.end = res->end;
+		pgmap->type = MEMORY_DEVICE_PRIVATE;
+	}
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
-	pgmap->range.start = res->start;
-	pgmap->range.end = res->end;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
-
+	pgmap->flags = 0;
 	/* Device manager releases device-specific resources, memory region and
 	 * pgmap when driver disconnects from device.
 	 */
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
-
 		/* Disable SVM support capability */
 		pgmap->type = 0;
-		devm_release_mem_region(adev->dev, res->start, resource_size(res));
+		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+			devm_release_mem_region(adev->dev, res->start,
+						res->end - res->start + 1);
 		return PTR_ERR(r);
 	}
 
@@ -984,3 +990,4 @@ int svm_migrate_init(struct amdgpu_device *adev)
 
 	return 0;
 }
+
-- 
2.32.0

