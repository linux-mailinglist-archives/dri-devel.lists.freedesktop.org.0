Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC974D1BB4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 16:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA9F10E347;
	Tue,  8 Mar 2022 15:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF2310E341;
 Tue,  8 Mar 2022 15:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkTtQNr9AYSl0yF11KL0jdFKPaVvGWy0TRTnuOvFSGVrdoFjkO/KFeEHigUpNGST0LO5fDEDe3F1xXqbG8qXiQn7WUiBUxqxqpJtZABCqzZu/6FDdQgfsvH6GDP3c/UR84GgvtrSOZokXYo/2cZ50Ki+mSbFNoRBQX/v/CnmJLNLubV2A2gm3XM4+73T9xoHy/PnBLOxqmU5pwur0OPkGvwfvMCLuUF8bImKhgQDcYn218nKlNY0vBADd6yhrqY+Xv1BL0TsC3GF7c+lVeWBU+x0ZnkoxDbs8OZDNokugHiYiXavi3+nM1n1b/NKr8GGp5hQbPKMppNQ2McMIBkhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdZfFgsOPvTEDaYfg1GUcFCCcl9XmujA3LaqP/sFVAU=;
 b=Lrbm5MCA754taet66EZKISH6Bzd15yVsgN73PnVcPxh6KKdmKF0D79CY0jYOczsSt03BzbiZiezCCYgQneKvC54MqL9pEsof//4SOl9EIh1++LKM58k+V3E776SH1KpHXX/6s81K7tcO8Af6j8xtqbTL2Yxz25NiENjloMdTPpg4sF617yHUwoQSIPMM5XkzhcHeTbb1QHRKx/ZwdP7F/4LEn83n0f6rcAUEK5LZg2AUCDYnwmgfR7ogXKjXwcXbfsvVs7gbGIFI9ovmLhGMTco5lLeVuTF8yTDRjgco1+sLyi/RriUVfVBsx/MGgpuuhcXwTOkhpKtVXyvgjCXmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdZfFgsOPvTEDaYfg1GUcFCCcl9XmujA3LaqP/sFVAU=;
 b=csGNGp7cVZGaNvwriMu8Refy3OujUY0kryXCAiov2brAdvJv9TS1mpaGx8Flw4lim1nPqVh1I4JiSBckZbpvNH1vhnLrKhok4r9Q4ExYrofJNXdkAvI9BPPPduCbjIaMwT96RWpG2RWJ/vDmVoaYJkIzLYFVY/VgWmqiUYI7zbw=
Received: from MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::12)
 by CY4PR1201MB0070.namprd12.prod.outlook.com (2603:10b6:910:18::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Tue, 8 Mar
 2022 15:28:35 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::60) by MW4P223CA0007.outlook.office365.com
 (2603:10b6:303:80::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 15:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 15:28:35 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 09:28:33 -0600
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: CRIU Refactor restore BO function
Date: Tue, 8 Mar 2022 10:28:12 -0500
Message-ID: <20220308152812.7929-2-david.yatsin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308152812.7929-1-david.yatsin@amd.com>
References: <20220308152812.7929-1-david.yatsin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d86024c-7071-4ab1-ebb9-08da01184fd6
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0070:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0070B45C8D7C31FD3163DE5395099@CY4PR1201MB0070.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wB6axVK/kzlvgr29X1wzcNoi7q1PrMw8tf8/mJBnLi8Gr3hSeSYEvBN45fYvz5vAqN7HE+GgqIiuMJ7BtJk5GGtLxpTpyaurUDyVHIyy7I3m/0423hjj3y253Qer8uFF1CYEBWtghQ5ku5F37lmxI1q4ii7yO1pZO94Di2A0OdI8p6P2maHDcsFtFbIYa68Aj7EmJohPXXvjMVb17f2yiqyvSUBEmH8xMRq7ipIVTpjUKkRnrwXXPX8bw3rf/IgUSi0aewDLOWNxM8TL4Yh/Vbdz/J3j6HjM709n2P8JD9r4uif3OikEtanup2iy90eKWyQs7BrtaWz5x1QYjWB7p/iVhb2exN9o6nxs4ntjTao/1Jkk8ukFWKB6Sav1ed9HKI245uhmebmBcfeuqUm6hXdaVDNcc/go4ckxy2RytzFVS7VK5bwNDPqtyaCxCjKpgrzHw3gTYOfx4lzi5n/lIw1RKfOXV4X0ZApYGXadx4SvBUFQrDgj99SG32niCfrbUgKijrOgNNds5JtKWpRt9S806xCBp/KNj/r75uTVrw3s9mHVtUSpyIXRHQNpDm6zl26WG/001CBIJvURCOk2CkLTbqQ6UmxoAtyug2grM/8UTNBYfyLIjPPTtcZW6Mk+cx3/33qokDLTOZIaMN5OQT/ngrnRrWePyddv1+QSJzTs0LUv0Tu1cVAl0EFicJeKRBl1rGHY5x3V+wDupJUTQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(426003)(16526019)(26005)(2616005)(336012)(508600001)(83380400001)(40460700003)(36756003)(7696005)(6666004)(1076003)(5660300002)(316002)(81166007)(2906002)(82310400004)(86362001)(54906003)(110136005)(356005)(47076005)(36860700001)(70206006)(450100002)(70586007)(4326008)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:28:35.4643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d86024c-7071-4ab1-ebb9-08da01184fd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0070
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
Cc: Felix.Kuehling@amd.com, David Yat Sin <david.yatsin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor CRIU restore BO to reduce identation before adding support for
IPC.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 271 +++++++++++------------
 1 file changed, 129 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 789bdfbd3f9b..2c7d76e67ddb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2094,6 +2094,132 @@ static int criu_restore_devices(struct kfd_process *p,
 	return ret;
 }
 
+static int criu_restore_memory_of_gpu(struct kfd_process_device *pdd,
+				      struct kfd_criu_bo_bucket *bo_bucket,
+				      struct kfd_criu_bo_priv_data *bo_priv,
+				      struct kgd_mem **kgd_mem)
+{
+	int idr_handle;
+	int ret;
+	const bool criu_resume = true;
+	u64 offset;
+
+	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
+		if (bo_bucket->size != kfd_doorbell_process_slice(pdd->dev))
+			return -EINVAL;
+
+		offset = kfd_get_process_doorbells(pdd);
+	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
+		/* MMIO BOs need remapped bus address */
+		if (bo_bucket->size != PAGE_SIZE) {
+			pr_err("Invalid page size\n");
+			return -EINVAL;
+		}
+		offset = pdd->dev->adev->rmmio_remap.bus_addr;
+		if (!offset) {
+			pr_err("amdgpu_amdkfd_get_mmio_remap_phys_addr failed\n");
+			return -ENOMEM;
+		}
+	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
+		offset = bo_priv->user_addr;
+	}
+	/* Create the BO */
+	ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(pdd->dev->adev, bo_bucket->addr,
+						      bo_bucket->size, pdd->drm_priv, kgd_mem,
+						      &offset, bo_bucket->alloc_flags, criu_resume);
+	if (ret) {
+		pr_err("Could not create the BO\n");
+		return ret;
+	}
+	pr_debug("New BO created: size:0x%llx addr:0x%llx offset:0x%llx\n",
+		 bo_bucket->size, bo_bucket->addr, offset);
+
+	/* Restore previous IDR handle */
+	pr_debug("Restoring old IDR handle for the BO");
+	idr_handle = idr_alloc(&pdd->alloc_idr, *kgd_mem, bo_priv->idr_handle,
+			       bo_priv->idr_handle + 1, GFP_KERNEL);
+
+	if (idr_handle < 0) {
+		pr_err("Could not allocate idr\n");
+		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->adev, *kgd_mem, pdd->drm_priv,
+						       NULL);
+		return -ENOMEM;
+	}
+
+	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
+		bo_bucket->restored_offset = KFD_MMAP_TYPE_DOORBELL | KFD_MMAP_GPU_ID(pdd->dev->id);
+	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
+		bo_bucket->restored_offset = KFD_MMAP_TYPE_MMIO | KFD_MMAP_GPU_ID(pdd->dev->id);
+	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
+		bo_bucket->restored_offset = offset;
+	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+		bo_bucket->restored_offset = offset;
+		/* Update the VRAM usage count */
+		WRITE_ONCE(pdd->vram_usage, pdd->vram_usage + bo_bucket->size);
+	}
+	return 0;
+}
+
+static int criu_restore_bo(struct kfd_process *p,
+			   struct kfd_criu_bo_bucket *bo_bucket,
+			   struct kfd_criu_bo_priv_data *bo_priv)
+{
+	struct kfd_process_device *pdd;
+	struct kgd_mem *kgd_mem;
+	int ret;
+	int j;
+
+	pr_debug("Restoring BO size:0x%llx addr:0x%llx gpu_id:0x%x flags:0x%x idr_handle:0x%x\n",
+		 bo_bucket->size, bo_bucket->addr, bo_bucket->gpu_id, bo_bucket->alloc_flags,
+		 bo_priv->idr_handle);
+
+	pdd = kfd_process_device_data_by_id(p, bo_bucket->gpu_id);
+	if (!pdd) {
+		pr_err("Failed to get pdd\n");
+		return -ENODEV;
+	}
+
+	ret = criu_restore_memory_of_gpu(pdd, bo_bucket, bo_priv, &kgd_mem);
+	if (ret)
+		return ret;
+
+	/* now map these BOs to GPU/s */
+	for (j = 0; j < p->n_pdds; j++) {
+		struct kfd_dev *peer;
+		struct kfd_process_device *peer_pdd;
+
+		if (!bo_priv->mapped_gpuids[j])
+			break;
+
+		peer_pdd = kfd_process_device_data_by_id(p, bo_priv->mapped_gpuids[j]);
+		if (!peer_pdd)
+			return -EINVAL;
+
+		peer = peer_pdd->dev;
+
+		peer_pdd = kfd_bind_process_to_device(peer, p);
+		if (IS_ERR(peer_pdd))
+			return PTR_ERR(peer_pdd);
+
+		ret = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->adev, kgd_mem, peer_pdd->drm_priv,
+							    NULL);
+		if (ret) {
+			pr_err("Failed to map to gpu %d/%d\n", j, p->n_pdds);
+			return ret;
+		}
+	}
+
+	pr_debug("map memory was successful for the BO\n");
+	/* create the dmabuf object and export the bo */
+	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+		ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base, DRM_RDWR,
+					    &bo_bucket->dmabuf_fd);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static int criu_restore_bos(struct kfd_process *p,
 			    struct kfd_ioctl_criu_args *args,
 			    uint64_t *priv_offset,
@@ -2101,8 +2227,7 @@ static int criu_restore_bos(struct kfd_process *p,
 {
 	struct kfd_criu_bo_bucket *bo_buckets = NULL;
 	struct kfd_criu_bo_priv_data *bo_privs = NULL;
-	const bool criu_resume = true;
-	int ret = 0, j = 0;
+	int ret = 0;
 	uint32_t i = 0;
 
 	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
@@ -2140,149 +2265,11 @@ static int criu_restore_bos(struct kfd_process *p,
 
 	/* Create and map new BOs */
 	for (; i < args->num_bos; i++) {
-		struct kfd_criu_bo_bucket *bo_bucket;
-		struct kfd_criu_bo_priv_data *bo_priv;
-		struct kfd_dev *dev;
-		struct kfd_process_device *pdd;
-		struct kgd_mem *kgd_mem;
-		void *mem;
-		u64 offset;
-		int idr_handle;
-
-		bo_bucket = &bo_buckets[i];
-		bo_priv = &bo_privs[i];
-
-		pr_debug("kfd restore ioctl - bo_bucket[%d]:\n", i);
-		pr_debug("size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
-			"gpu_id = 0x%x alloc_flags = 0x%x\n"
-			"idr_handle = 0x%x\n",
-			bo_bucket->size,
-			bo_bucket->addr,
-			bo_bucket->offset,
-			bo_bucket->gpu_id,
-			bo_bucket->alloc_flags,
-			bo_priv->idr_handle);
-
-		pdd = kfd_process_device_data_by_id(p, bo_bucket->gpu_id);
-		if (!pdd) {
-			pr_err("Failed to get pdd\n");
-			ret = -ENODEV;
-			goto exit;
-		}
-		dev = pdd->dev;
-
-		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
-			pr_debug("restore ioctl: KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL\n");
-			if (bo_bucket->size != kfd_doorbell_process_slice(dev)) {
-				ret = -EINVAL;
-				goto exit;
-			}
-			offset = kfd_get_process_doorbells(pdd);
-		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
-			/* MMIO BOs need remapped bus address */
-			pr_debug("restore ioctl :KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP\n");
-			if (bo_bucket->size != PAGE_SIZE) {
-				pr_err("Invalid page size\n");
-				ret = -EINVAL;
-				goto exit;
-			}
-			offset = dev->adev->rmmio_remap.bus_addr;
-			if (!offset) {
-				pr_err("amdgpu_amdkfd_get_mmio_remap_phys_addr failed\n");
-				ret = -ENOMEM;
-				goto exit;
-			}
-		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
-			offset = bo_priv->user_addr;
-		}
-		/* Create the BO */
-		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->adev,
-						bo_bucket->addr,
-						bo_bucket->size,
-						pdd->drm_priv,
-						(struct kgd_mem **) &mem,
-						&offset,
-						bo_bucket->alloc_flags,
-						criu_resume);
+		ret = criu_restore_bo(p, &bo_buckets[i], &bo_privs[i]);
 		if (ret) {
-			pr_err("Could not create the BO\n");
-			ret = -ENOMEM;
-			goto exit;
-		}
-		pr_debug("New BO created: size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n",
-			bo_bucket->size, bo_bucket->addr, offset);
-
-		/* Restore previuos IDR handle */
-		pr_debug("Restoring old IDR handle for the BO");
-		idr_handle = idr_alloc(&pdd->alloc_idr, mem,
-				       bo_priv->idr_handle,
-				       bo_priv->idr_handle + 1, GFP_KERNEL);
-
-		if (idr_handle < 0) {
-			pr_err("Could not allocate idr\n");
-			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
-						(struct kgd_mem *)mem,
-						pdd->drm_priv, NULL);
-			ret = -ENOMEM;
+			pr_debug("Failed to restore BO[%d] ret%d\n", i, ret);
 			goto exit;
 		}
-
-		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
-			bo_bucket->restored_offset = KFD_MMAP_TYPE_DOORBELL |
-				KFD_MMAP_GPU_ID(pdd->dev->id);
-		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
-			bo_bucket->restored_offset = KFD_MMAP_TYPE_MMIO |
-				KFD_MMAP_GPU_ID(pdd->dev->id);
-		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
-			bo_bucket->restored_offset = offset;
-			pr_debug("updating offset for GTT\n");
-		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
-			bo_bucket->restored_offset = offset;
-			/* Update the VRAM usage count */
-			WRITE_ONCE(pdd->vram_usage, pdd->vram_usage + bo_bucket->size);
-			pr_debug("updating offset for VRAM\n");
-		}
-
-		/* now map these BOs to GPU/s */
-		for (j = 0; j < p->n_pdds; j++) {
-			struct kfd_dev *peer;
-			struct kfd_process_device *peer_pdd;
-
-			if (!bo_priv->mapped_gpuids[j])
-				break;
-
-			peer_pdd = kfd_process_device_data_by_id(p, bo_priv->mapped_gpuids[j]);
-			if (!peer_pdd) {
-				ret = -EINVAL;
-				goto exit;
-			}
-			peer = peer_pdd->dev;
-
-			peer_pdd = kfd_bind_process_to_device(peer, p);
-			if (IS_ERR(peer_pdd)) {
-				ret = PTR_ERR(peer_pdd);
-				goto exit;
-			}
-			pr_debug("map mem in restore ioctl -> 0x%llx\n",
-				 ((struct kgd_mem *)mem)->va);
-			ret = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->adev,
-				(struct kgd_mem *)mem, peer_pdd->drm_priv, NULL);
-			if (ret) {
-				pr_err("Failed to map to gpu %d/%d\n", j, p->n_pdds);
-				goto exit;
-			}
-		}
-
-		pr_debug("map memory was successful for the BO\n");
-		/* create the dmabuf object and export the bo */
-		kgd_mem = (struct kgd_mem *)mem;
-		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
-			ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base,
-						    DRM_RDWR,
-						    &bo_bucket->dmabuf_fd);
-			if (ret)
-				goto exit;
-		}
 	} /* done */
 
 	/* Copy only the buckets back so user can read bo_buckets[N].restored_offset */
-- 
2.17.1

