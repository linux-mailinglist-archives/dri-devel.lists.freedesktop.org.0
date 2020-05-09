Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949651CC3CF
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 20:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B16E3AA;
	Sat,  9 May 2020 18:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4231A6E3AA;
 Sat,  9 May 2020 18:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Reyl+T6yfme4nl0QNheDO/Bv4N8euU3Sxf8J36lE9Za3WjVChJCMedu1NYbwKGTj9i38Rhd0lyErXSn+Xl/V8OFBnwwIn/1mUTSYgvrMFl8nw3zykuLtFNC9p+CBcMML7uxtpgokMbVTmZwgO+i+OZLQWjM6n1A9MovlcicqRE5N0P3Lq/Zd0787atom+ggtOh5ST1w38w0SuDxM+u0iSp8rljq8/hdZ+dIkiPGNz9ZuFau3mwNl2y2q3O8ZX+4SdMqcLkO3XCcy9T5hXggssBqgXTMYpapIy3CF9lw8b9K2J1zkLIhhjP3mzvOuAQbZcRgS3Kn7LU9DxtLmMQx07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTlcwSYa5JrGVeAxmWhBbCz16wSKrkzCfnRUtvpEEpk=;
 b=fDu4ecsaUV9qiFf3QK9rmfOXRXfuqLXNTvvLDaK+p2yUf5RIQ259+v6MGnQww91lhtjzkZ2nRRfpWvwpW4Pk8xib0pLRu5IVKkfDScnsQP4QsFfAV531jmH7z0d1T0NWZk2zLeP4IKbFNHhwSRAtdTfKp0+2m09u/lUbDVdwikYjiZaXkULA1pksvapy18aYQyHNXgXXPrNG7jTWW1uBwEgRA906cyu8VX9liLRXoXwqOSU7nYGV09w7ZdnrSMxjeG1LDZBro0/9k4N2jfnVJ9hDLm24u0fupAS9iivBTOudO5Yag+zA3BC/uM6lJIVS0L7wvQJIIjPsvvwbbR6xwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTlcwSYa5JrGVeAxmWhBbCz16wSKrkzCfnRUtvpEEpk=;
 b=ZH0eLpmf3wZ9PLvTWtjz/4DbNjf6UW7z0/Mv0Lfww9sEM4WOKh6oVQeUwgkPJsMzuk2OmkzriDrmoUr7g7vzjeDKN/mtRelFn1V895eHuzYOCmugscKWkMAp9UfVWIVi7hjl2h+PxYVUeTBTLu78/IskIgo3JhdfVw3mv6HQHY0=
Received: from MW2PR16CA0054.namprd16.prod.outlook.com (2603:10b6:907:1::31)
 by CY4PR12MB1749.namprd12.prod.outlook.com (2603:10b6:903:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Sat, 9 May
 2020 18:52:21 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::11) by MW2PR16CA0054.outlook.office365.com
 (2603:10b6:907:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 18:52:21 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 18:52:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:20 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:19 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 9 May 2020 13:52:19 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdgpu: Use TTM MMs destroy interface
Date: Sat, 9 May 2020 14:51:50 -0400
Message-ID: <1589050310-19666-7-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966005)(33430700001)(186003)(26005)(36756003)(2616005)(5660300002)(47076004)(7696005)(44832011)(82740400003)(478600001)(336012)(6666004)(2906002)(356005)(8936002)(316002)(4326008)(33440700001)(426003)(82310400002)(86362001)(54906003)(8676002)(70586007)(70206006)(81166007)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cb8c349-46fe-4eaa-fee5-08d7f44a1aec
X-MS-TrafficTypeDiagnostic: CY4PR12MB1749:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1749E5BF5A3C3B8A270EAA4CEAA30@CY4PR12MB1749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9RdyIQVkJYlz4WmvapVJDRS0D3diogpflmcuzlt0GTo5MS+G4qS38kh3nVslMAkWmzyyebcu2bGjAq35fXAO/VDEnjQRFnD1gh1FRim+JSqh8+2kX6wVB7Qfo2yygI2VEAY1hwbRIYrwzkK3emJW9758eu63cgrbFc93kAEUlIrM30TcLRNZXj000tz5NqwP0JuSCyNdW3gpab6hUAtecU566oZOFspdhSMq/emzO2B+/ArRwHxR9XW7928OhdQGL3Gav26n4CPP344O3y+D1JcT0J38R3+lUGl2HvgFdivqQLkajzbkpF3IpgQXElhhq1BoxgfOQAlh3td+/BbWeODwqzIvtw3HD2CtDQ/yKTmmT38w+dh0VzyQcnIoclqJwvqVTU7w0hFbwFQB69WvgMpJRyt9Eam9rDVtuRyOO7zRAz32lrxa9YUqjadK+KrW/bX0qRuBWoBnL1Wl3zOnBgywjWgmvE5IfTchgcplaYG6u1lv82xm+Rd80L8OB64ILW79bYPELhZ7HoNCr1PNJmb7we15SrrMr6I05MumfhnqLwb0SrDg26zdK4xPPyZBNrWaIpoKLblFQTjEiv5jg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 18:52:21.1022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb8c349-46fe-4eaa-fee5-08d7f44a1aec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1749
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 11410a9..338b946 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1145,7 +1145,11 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 
 	drm_dev_unplug(dev);
 
+	/* Will trigger SIGBUS on all subsequent CPU accesses */
 	amdgpu_force_unmap_user_space_mappings(dev);
+
+	/* Will trigger VMFAULTs on all subsequent GPU successes */
+	amdgpu_bo_destroy_mms(adev);
 	wait_event(adev->user_clients_done,
 		   !atomic_read(&dev->open_count) &&
 		   !atomic_read(&adev->exported_dma_bufs_count));
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 82d43d0..7eac00b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1049,6 +1049,17 @@ int amdgpu_bo_evict_vram(struct amdgpu_device *adev)
 	return ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_VRAM, false);
 }
 
+int amdgpu_bo_destroy_mms(struct amdgpu_device *adev)
+{
+	int r;
+
+	r = ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_VRAM, true);
+	if (!r)
+		return ttm_bo_evict_mm(&adev->mman.bdev, TTM_PL_TT, true);
+
+	return r;
+}
+
 static const char *amdgpu_vram_names[] = {
 	"UNKNOWN",
 	"GDDR1",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 7d41f7b..4892265 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -269,6 +269,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 			     u64 min_offset, u64 max_offset);
 int amdgpu_bo_unpin(struct amdgpu_bo *bo);
 int amdgpu_bo_evict_vram(struct amdgpu_device *adev);
+int amdgpu_bo_destroy_mms(struct amdgpu_device *adev);
 int amdgpu_bo_init(struct amdgpu_device *adev);
 int amdgpu_bo_late_init(struct amdgpu_device *adev);
 void amdgpu_bo_fini(struct amdgpu_device *adev);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
