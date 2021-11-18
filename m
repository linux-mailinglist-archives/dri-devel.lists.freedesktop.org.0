Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B308455392
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 04:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4D56E895;
	Thu, 18 Nov 2021 03:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212E46E86D;
 Thu, 18 Nov 2021 03:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qy+OHiBjljSip5QpXvIurJOzm2/dICFdx//MfJGAmE1fQZfhwIuKnVSYFEZOtAUtOjsKLljdWx0SLteIU65zlgbQpRObiREc424xiv1W2L9EcZ9sQ5vvxXMd8CoD+9TGB6j8yxPrqUh//weaJjt1c4wcldhXZzkuSo3pOx9UpQRl2atmFCoKg8LcRd9cUnJ7QcUWL1vrT25R0+/fwLrsz91yXkGM2npRd8SgnX9d+cXioAfiN38JPuWyq9WfW+xXmPbYDLSAapkOPbAc3vsrvnH8oUHAFNbXtI3Y4yzSkZv2ehaHDRf8M/dhPZUmg4DOB2+duhQ8Gk36nYTKT84ekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD9n2ptZVeGj3n6Sty0PvnVgxG2bzYrcU6sw8FGaaSQ=;
 b=g/M2C8HTN4NK1rJlmxd4Q13kAWObpEd8dRTKgOTOLTVnW3+idwRsE1BJqXl5eS2MmaUQSh6iUdmG5elOmUymvFPvknLGQ3tnWlNhrcKf4/c/jDG3iFY6pvYtsgihPy5rGJysEwK5hNFrqlV6gBX+bNq3eVXzpuuM9Bux9TsuVZjirm4gyDBhWWJDImQUMeJ+F2C1UKDnlFO9AmxxcCeRFQdEviMf6nW1bw/KsQFhO6+tihfgUM/+5uw4FaCIpB4TJhUBkp/k+rSCUVtPBkBk3jyGVeaiGH1Kpk5Pnt5YeR/slDMl298qkGgnvirV/Jg4ncK9u9NEIeD9DAqpeWZ3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD9n2ptZVeGj3n6Sty0PvnVgxG2bzYrcU6sw8FGaaSQ=;
 b=1AkiUTbg7cBXyGYbj8ROHADO7OQPwkN/olFwp0FiuYbnQVCFUEMSUrq+SvGF4tl3JX6Zx0QyMqkbUgGJFObcgMbiCiWEp5D5Y+LZcgqluymgzFNpsjrDDVSDL/m6ty6quT4JJPM5LhRMn1vwIMKCqW5jHP01oxl0gqIfFKnFo7A=
Received: from BN1PR10CA0007.namprd10.prod.outlook.com (2603:10b6:408:e0::12)
 by MN2PR12MB3325.namprd12.prod.outlook.com (2603:10b6:208:ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 03:56:13 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::87) by BN1PR10CA0007.outlook.office365.com
 (2603:10b6:408:e0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Thu, 18 Nov 2021 03:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 03:56:13 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 21:56:12 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: Implement DMA buf fd export for RDMA
Date: Wed, 17 Nov 2021 22:55:59 -0500
Message-ID: <20211118035559.327835-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211118035559.327835-1-Felix.Kuehling@amd.com>
References: <20211118035559.327835-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0160d5a5-82ac-4ad7-45b8-08d9aa475d96
X-MS-TrafficTypeDiagnostic: MN2PR12MB3325:
X-Microsoft-Antispam-PRVS: <MN2PR12MB33252C9559801238198C4043929B9@MN2PR12MB3325.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5SG44QXN8bvPHmd+x8lk8lpKnfM2rBa3jiK22e+K2+nZKut/bZt4vEmZ/UYMqk8noUitamKTB5zILZp8fBhF2GFhsgDteTINLmSSmAIfVQtHOn7vgl0GxooRJi/n3PqzBTy0DW1qd9KW/3/k/qpN2U7sF1mchiyUjAdqcqHLE5HCaOeQuq8Wtg1bieMpcPPaHDCzlWeCZANbF/ZU7TNfXXFTx/oVjA8CIK8e9EkHRp2LKH9uq1zwnz3vvqF8sCSOBesS315hlz0gb4FKtw5pAQmFvdcyN/b2IOsL1MCptj1zS2yPC7vGRjLSYfIKgkcWfr8m+AwmS2CzCFjcBs7+SRTy0zCejoa74igHMYF+ZVnRdB8CLjTR7NQWKBJ0CAvDkEKgE06y/oew0GgOU6ELt2tcEDKq7BwbyrNEJIlU0TQTSWZoiVWLD6ZCOS4OT0DiUlL8GeqBB+EoeXWzlmwfFkVNk+neAn54nr9U6FTu8MVgtaVUy3dsDCgtqe1zIrChHoYfdqFYiquw9DCXlH1p7jPVHhKUQc8cFDLH9ydOK0aq/R7JRgi6rFSJXVFsVSGq7WvDc/dfS5c6mW3qBd8ZwiktZjnUkfd8BvK11g2EbQG4b5fudYWDoAQVrp/9b22wGnNg0bvyW0BEALks9QL8oKLSfEZ6basia+TXCpj2KlY0+oaygaV0dolt53XqazNolabvxm8qOYArxS5cWxUEFJcdSePlOWlniTA3aVUtL4bW2bXYxrFn4FTeazzje/5CG7H8t01Hi++wCr2isZ8hGZzPLUrrag09VQN1LyngtWHYC86NYQ/8D2ZNZkBMc9Eu
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(450100002)(6666004)(336012)(2906002)(2616005)(36860700001)(4326008)(426003)(356005)(70206006)(70586007)(83380400001)(316002)(47076005)(5660300002)(7696005)(82310400003)(508600001)(26005)(966005)(86362001)(6916009)(1076003)(16526019)(186003)(8676002)(8936002)(36756003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 03:56:13.8715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0160d5a5-82ac-4ad7-45b8-08d9aa475d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3325
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exports a DMA buf fd of a given KFD buffer handle. This is intended for
the new upstreamable RDMA solution coming to UCX and libfabric.

The corresponding user mode change (Thunk API and kfdtest) is here:
https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/commits/fxkamd/dmabuf

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 45 +++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 55 +++++++++++++++++++
 include/uapi/linux/kfd_ioctl.h                | 14 ++++-
 4 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index fcbc8a9c9e06..840de82460a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -294,6 +294,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
+int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
+				      struct dma_buf **dmabuf);
 int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index d53d19b9d6dc..9f57e5091fa8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -641,6 +641,21 @@ kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
 	return 0;
 }
 
+static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
+{
+	if (!mem->dmabuf) {
+		struct dma_buf *ret = amdgpu_gem_prime_export(
+			&mem->bo->tbo.base,
+			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
+				DRM_RDWR : 0);
+		if (IS_ERR(ret))
+			return PTR_ERR(ret);
+		mem->dmabuf = ret;
+	}
+
+	return 0;
+}
+
 static int
 kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
 		      struct amdgpu_bo **bo)
@@ -648,16 +663,9 @@ kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
 	struct drm_gem_object *gobj;
 	int ret;
 
-	if (!mem->dmabuf) {
-		mem->dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base,
-			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
-				DRM_RDWR : 0);
-		if (IS_ERR(mem->dmabuf)) {
-			ret = PTR_ERR(mem->dmabuf);
-			mem->dmabuf = NULL;
-			return ret;
-		}
-	}
+	ret = kfd_mem_export_dmabuf(mem);
+	if (ret)
+		return ret;
 
 	gobj = amdgpu_gem_prime_import(adev_to_drm(adev), mem->dmabuf);
 	if (IS_ERR(gobj))
@@ -2065,6 +2073,23 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	return ret;
 }
 
+int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
+				      struct dma_buf **dma_buf)
+{
+	int ret;
+
+	mutex_lock(&mem->lock);
+	ret = kfd_mem_export_dmabuf(mem);
+	if (ret)
+		goto out;
+
+	get_dma_buf(mem->dmabuf);
+	*dma_buf = mem->dmabuf;
+out:
+	mutex_unlock(&mem->lock);
+	return ret;
+}
+
 /* Evict a userptr BO by stopping the queues if necessary
  *
  * Runs in MMU notifier, may be in RECLAIM_FS context. This means it
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 4bfc0c8ab764..ddbc28951ac1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1787,6 +1787,58 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	return r;
 }
 
+static int kfd_ioctl_export_dmabuf(struct file *filep,
+				   struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_export_dmabuf_args *args = data;
+	struct kfd_process_device *pdd;
+	struct dma_buf *dmabuf;
+	struct kfd_dev *dev;
+	void *mem;
+	int ret = 0;
+
+	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
+	if (!dev)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+
+	pdd = kfd_get_process_device_data(dev, p);
+	if (!pdd) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	mem = kfd_process_device_translate_handle(pdd,
+						GET_IDR_HANDLE(args->handle));
+	if (!mem) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	ret = amdgpu_amdkfd_gpuvm_export_dmabuf(mem, &dmabuf);
+	mutex_unlock(&p->mutex);
+	if (ret)
+		goto err_out;
+
+	ret = dma_buf_fd(dmabuf, args->flags);
+	if (ret < 0) {
+		dma_buf_put(dmabuf);
+		goto err_out;
+	}
+	/* dma_buf_fd assigns the reference count to the fd, no need to
+	 * put the reference here.
+	 */
+	args->dmabuf_fd = ret;
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&p->mutex);
+err_out:
+	return ret;
+}
+
 /* Handle requests for watching SMI events */
 static int kfd_ioctl_smi_events(struct file *filep,
 				struct kfd_process *p, void *data)
@@ -1959,6 +2011,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
 			kfd_ioctl_set_xnack_mode, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_EXPORT_DMABUF,
+				kfd_ioctl_export_dmabuf, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index af96af174dc4..3b80af5f5bdf 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -32,9 +32,10 @@
  * - 1.4 - Indicate new SRAM EDC bit in device properties
  * - 1.5 - Add SVM API
  * - 1.6 - Query clear flags in SVM get_attr API
+ * - 1.7 - Add DMA buf export ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 6
+#define KFD_IOCTL_MINOR_VERSION 7
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
@@ -450,6 +451,12 @@ struct kfd_ioctl_import_dmabuf_args {
 	__u32 dmabuf_fd;	/* to KFD */
 };
 
+struct kfd_ioctl_export_dmabuf_args {
+	__u64 handle;		/* to KFD */
+	__u32 flags;		/* to KFD */
+	__u32 dmabuf_fd;	/* from KFD */
+};
+
 /*
  * KFD SMI(System Management Interface) events
  */
@@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_SET_XNACK_MODE		\
 		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
 
+#define AMDKFD_IOC_EXPORT_DMABUF		\
+		AMDKFD_IOWR(0x22, struct kfd_ioctl_export_dmabuf_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x22
+#define AMDKFD_COMMAND_END		0x23
 
 #endif
-- 
2.32.0

