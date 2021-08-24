Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF663F6AC3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 23:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610C46E0D7;
	Tue, 24 Aug 2021 21:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766EA89956;
 Tue, 24 Aug 2021 21:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lc7faOdvB5BU6ZZrs5EwKwEhUei7Q5yQAzCkssybj41y2RkjzFjXWLrlp0VmrJfjhhTDwzaEEfql2Pca7KX3e8XM6ZDWsEBi+GNVf017YkxEmZzZd4K6mKC3PcsiAFXsxDpzgsgRKlbzXF7Pbl5Eoksu3+uBlqfi4L17FT5AXWkHu50TeC3Hm/MCnQNGz8fIN6gUDvNYxkxZ1+n0VotqdpqIEs1EntS9MceHXNu4NJ8bw4NZT1BYzPDEwUc2sHZuPKhO8Kq2NNu8IPPb3hgvfmydF1oMz85y1qGSXrPJN0ybxocaM5bxALdErjFlrdnLhsukrL8rfAo9visEQ9hf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR+vxD0UyRyl1iLBDS44VrFQma2+Bc6q1K7WPu8TqDQ=;
 b=F+4X+KstVFGMtOgrTV3ywCL8eONPUZUx+WpJpYtW4OyHmgzHHeOfE8TNibSsAw/0b6fqJ/AjZ2v1j76QYbjt+SI4oGOvdl7thGqoy1TTBIVxP+erngvfYhOLf/wOzS5IgH0O0K15uUfuZ7u7VvVEcHwFHZNxKKUWHhjbrYzT9LaX++2DRyT5G2EpYuq55nSIaDzO7Vdg3fA0a7Qtd5v83elXqdaIdGISvPJ4taVIEBCHk1JyVjGUQW+5Mud73EojORqboEQdqOogKNL4sDdkYVgjrrbNmy6yGM1kwfExD23AJzM6Fxzr8L8DcRdq2RnmZSVzeMKkSVkQIR/s/Zvm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR+vxD0UyRyl1iLBDS44VrFQma2+Bc6q1K7WPu8TqDQ=;
 b=qAcZpH0QPpb7BpYmYdNik3Eq7YWvf5yugV4dcobnQ8sQSQqx7pOFmghlHgHZzL5PIFO9GJcqC0Y1OfPIK8tsxvXwZhzTZPuegkQzF6EK5+XmRFz0Eh5+i1OPKIHWbM66eLC0COG9ucvAenDczWd3VPn+8ZrXNvQrNbmzpdIb5x8=
Received: from BN9PR03CA0152.namprd03.prod.outlook.com (2603:10b6:408:f4::7)
 by DM4PR12MB5088.namprd12.prod.outlook.com (2603:10b6:5:38b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 21:01:42 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::7b) by BN9PR03CA0152.outlook.office365.com
 (2603:10b6:408:f4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 21:01:42 +0000
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
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 21:01:42 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 24 Aug 2021 16:01:39 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
Date: Tue, 24 Aug 2021 17:01:19 -0400
Message-ID: <20210824210120.49812-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d7cb3f1-1af3-4767-0517-08d967425fe7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5088:
X-Microsoft-Antispam-PRVS: <DM4PR12MB508859B6F1C6444E9E247B27EAC59@DM4PR12MB5088.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lel73pvFaTL5p1aCgyFzU+gSuBfwWoYoHDEl2BnQijIHVx5iJUtnO1Q9NRxL1+323PV5cOLfSYB2jnVVWHvMAeN6JEVt31dWnfBHwT+ubimMx7OjKDvS950lSlbTQfs/hG9886+sRNQ5EOrVVV4e8RUkNdNnDZr9mslmsNrp3zH7XmzhqGtKH8syZMjXh9Cj1hdC7FVTzmSkxLhcy527ABHFd0ufsc4YiHDPXGRd7AJ6YeMKv02TElhEULME+iaEjZg0otwHdFWywLC5knhUPQ0/3wJWWamNTjPzaGT3ltEWbm0q2G/PcInQxhWUSbqU/ifrDOgDyaQsl+SF8oWxsmek97KKyEBQ5VUDSQLuod/CXBt2VSGRuq2KsF4e6gkIRXqGNEfMXGC7HwjS+H+NDg1YOdHmZAPgrwSFr+9bG+0C6+EjFCEDmlVlAUnl/RUoBzO/Wda3eV0kn03rSDlB72FThPXLIoW9JzgGJFWS18muW2L6e0gikGpOeOw34FIrVxqQLYS748hIBf2WVQ1i1tnw2DiX+DhZBNqEMYXtOPHi9u4fsV5OapJsPttngtTcRoFreAQOS0UabTe+kPXD4FzLihhKUIdpO5ej/6BGIK7Chf4AgmuqclWlgZmGFjv4cibxCCmeREhhfHPrR4rQsXmA3bIhlEUaSsdz4Bln2L4G/5vrRf+MvqYQ9yInGgPy2TAlBUc9ZPTihF3M1SaSwC0iM6M7q0xAlsH3/zCcIkc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(46966006)(336012)(36860700001)(70206006)(426003)(82740400003)(70586007)(356005)(8676002)(8936002)(47076005)(81166007)(4326008)(316002)(36756003)(16526019)(86362001)(6666004)(186003)(83380400001)(44832011)(2906002)(5660300002)(26005)(2616005)(7696005)(110136005)(1076003)(54906003)(478600001)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 21:01:42.3684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7cb3f1-1af3-4767-0517-08d967425fe7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5088
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

Handle all DMA IOMMU group related dependencies before the
group is removed and we try to access it after free.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 50 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
 3 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0b5764aa98a4..288a465b8101 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3860,6 +3860,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 	amdgpu_device_ip_fini_early(adev);
 
+	amdgpu_ttm_clear_dma_mappings(adev);
+
 	amdgpu_gart_dummy_page_fini(adev);
 
 	amdgpu_device_unmap_mmio(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 446943e32e3e..f73d807db3b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -64,6 +64,7 @@
 static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 				   struct ttm_tt *ttm,
 				   struct ttm_resource *bo_mem);
+
 static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 				      struct ttm_tt *ttm);
 
@@ -2293,6 +2294,55 @@ static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
 	return result;
 }
 
+void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev)
+{
+	struct ttm_device *bdev = &adev->mman.bdev;
+	struct ttm_resource_manager *man;
+	struct ttm_buffer_object *bo;
+	unsigned int i, j;
+
+	spin_lock(&bdev->lru_lock);
+	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
+		man = ttm_manager_type(bdev, i);
+		if (!man || !man->use_tt)
+			continue;
+
+		while (!list_empty(&man->pinned)) {
+			bo = list_first_entry(&man->pinned, struct ttm_buffer_object, lru);
+			/* Take ref against racing releases once lru_lock is unlocked */
+			ttm_bo_get(bo);
+			list_del_init(&bo->lru);
+			spin_unlock(&bdev->lru_lock);
+
+			if (bo->ttm) {
+				amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
+				ttm_tt_destroy_common(bo->bdev, bo->ttm);
+			}
+
+			ttm_bo_put(bo);
+			spin_lock(&bdev->lru_lock);
+		}
+
+		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
+			while (!list_empty(&man->lru[j])) {
+				bo = list_first_entry(&man->lru[j], struct ttm_buffer_object, lru);
+				ttm_bo_get(bo);
+				list_del_init(&bo->lru);
+				spin_unlock(&bdev->lru_lock);
+
+				if (bo->ttm) {
+					amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
+					ttm_tt_destroy_common(bo->bdev, bo->ttm);
+				}
+				ttm_bo_put(bo);
+				spin_lock(&bdev->lru_lock);
+			}
+		}
+	}
+	spin_unlock(&bdev->lru_lock);
+
+}
+
 static const struct file_operations amdgpu_ttm_iomem_fops = {
 	.owner = THIS_MODULE,
 	.read = amdgpu_iomem_read,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index e69f3e8e06e5..02c8eac48a64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -190,6 +190,7 @@ bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm);
 uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_resource *mem);
 uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 				 struct ttm_resource *mem);
+void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev);
 
 void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
 
-- 
2.25.1

