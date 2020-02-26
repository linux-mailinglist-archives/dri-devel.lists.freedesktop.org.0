Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E517084E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DB96EBB0;
	Wed, 26 Feb 2020 19:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1F46EBA9;
 Wed, 26 Feb 2020 19:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI3U8w40SGD9RgDiESHGArmcdoSIOHDd6I3hyZZ6/fJWiAdqs1ymKlg/HDr20943phyv95gsJlvOvhUKwiVpcUkLZQ2xejCECilFY5YgvZ06N9Jv7bi968sMEl7yvgiMllFMZ8lzCyGw9NTZ8YUUWfo0y7vwhZOWwwoiUeODrGNoEHZvJvG7KjdtHjVYRRD/jeIUZ35BoyX0a6nIYiVPpCy1hsR3bUK0NFe6yN/kvnzoQck/7Yb0C7gD21+2k1pvhUZzkJ3eA3LBlR4q+Lj0dytBKqA7MuE8TBf7EAbVmhzSvkApas0qpFfhPtfQUbQEvToh10Ho/HyxdBtgMR/Uxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9U7NEPPNIxK9vLDx9ztf8Nw8JMRkapZr2Z7bfi02Ns=;
 b=Mb6HtP9HJ6rsO22+xTCWzbRMwMNzCU1IDYzJBfzNdQPdcUDR1CxdBsgXZYjDl1iVcFcKlnF9wPpWzGJ1lAN3zDwvfK7jGfcdLgyngSN0e9Qtd7bgXGRdlzHGgPD2xggc0AIJHSTiePwbWRDvh9HqeYMgGwYWHreIpGxLLHk3ZEPSztyKApB+7gjY/q8wj8hOrv4GXzyOeic3NipVx/aLMIuAFP1KcLBESvl1lv5dusMM9L4KsBHftZGstlZaISFj7BRcm4qrNQ/HuJTbbdBJXGeiJqkfrBnjr2R3OJrQ57qluwYS03qas1PDgHGLwP9YuVJ2p3nfc8kfnCmIwHpiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9U7NEPPNIxK9vLDx9ztf8Nw8JMRkapZr2Z7bfi02Ns=;
 b=QWpKUaq0iv9VYjHDJgQjF5MMYNX88XViZp6gsTR7bikY+lpGf1oQHb4KvO5/6T3WkWcF++WjX+n7tPDGZ0gcgncQjYCh52vYlpCClIlmlNODmt+UuL2WvvRult93zN2nKtLT3HNEQyFS+GPPaVWECfih6SDoH7vjd2E9yDTRDaQ=
Received: from DM5PR04CA0062.namprd04.prod.outlook.com (2603:10b6:3:ef::24) by
 DM6PR12MB2988.namprd12.prod.outlook.com (2603:10b6:5:3d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Wed, 26 Feb 2020 19:02:12 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ef:cafe::d) by DM5PR04CA0062.outlook.office365.com
 (2603:10b6:3:ef::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:12 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:11 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:11 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:10 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 11/11] drm/amdgpu: Integrate with DRM cgroup
Date: Wed, 26 Feb 2020 14:01:52 -0500
Message-ID: <20200226190152.16131-12-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226190152.16131-1-Kenny.Ho@amd.com>
References: <lkaplan@cray.com; daniel@ffwll.ch; nirmoy.das@amd.com;
 damon.mcdougall@amd.com; juan.zuniga-anaya@amd.com; hannes@cmpxchg.org>
 <20200226190152.16131-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(428003)(189003)(199004)(4326008)(478600001)(26005)(86362001)(2906002)(316002)(5660300002)(110136005)(7696005)(336012)(1076003)(8676002)(186003)(36756003)(426003)(2616005)(356004)(81166006)(70586007)(6666004)(81156014)(70206006)(8936002)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2988; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68aeacbe-ae5b-4aa9-82c1-08d7baee62fd
X-MS-TrafficTypeDiagnostic: DM6PR12MB2988:
X-Microsoft-Antispam-PRVS: <DM6PR12MB29883D89BF34F2D7890572B483EA0@DM6PR12MB2988.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDYwxrqMvkijOuqsl88Ag0EWbKY0O+6qsHJ/RKjoXSmF+q5sOvPwyI4tCdfllUZ1ObXCQYPBKGiDtHfd/u9R3yWPURrEHENgxef25zlk25Sfw/5FdTNHpLIlAwL7WJQtupb4BXzmVQtaQaEuvoPLMhjOOTu6J6ecHT+udVLv8lnboeXDS9KQcjEwccdQKsvok2uXWzaR11G9TpE0/rXRlVDzHLhU/GapS4I7CvXCoNrtGvk0/+pVoA31RfeNKhf5Nb/dECW5ZOnbGehUbcrgfZwcagCAOFAvq1Lwpi/886JAnOI8f7VMyTpVK6iunbI4YPUBsEGDb63BR4oHr/Zl8Y128zW7SbMO7StsiSWN6tzQr+WvvatFvp8LRMKHCXvKeEhf0+m1tRegH4E13M5BN+jBj/txZqkecQ4tTvYl8EUuzQDmaI+qIeO9CVY1UWxi7kaZiT/vH1DlLzHYHpbf/uYG8jWGn506lC5FD+tq1w3EcxyLFf+ns/r2jRbaNFg9jDu13TcPIUypI6JGccQfjf50Ko9CUVAxpnshyy5AkR4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:12.0759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68aeacbe-ae5b-4aa9-82c1-08d7baee62fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2988
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The number of compute unit (CU) for a device is used for the gpu cgroup
compute capacity.  The gpu cgroup compute allocation limit only applies
to compute workload for the moment (enforced via kfd queue creation.)
Any cu_mask update is validated against the availability of the compute
unit as defined by the drmcg the kfd process belongs to.

Change-Id: I2930e76ef9ac6d36d0feb81f604c89a4208e6614
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  29 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   7 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   3 +
 .../amd/amdkfd/kfd_process_queue_manager.c    | 153 ++++++++++++++++++
 5 files changed, 196 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 0ee8aae6c519..1efbc0d3c03e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -199,6 +199,10 @@ uint8_t amdgpu_amdkfd_get_xgmi_hops_count(struct kgd_dev *dst, struct kgd_dev *s
 		valid;							\
 	})
 
+int amdgpu_amdkfd_update_cu_mask_for_process(struct task_struct *task,
+		struct amdgpu_device *adev, unsigned long *compute_bm,
+		unsigned int compute_bm_size);
+
 /* GPUVM API */
 int amdgpu_amdkfd_gpuvm_create_process_vm(struct kgd_dev *kgd, unsigned int pasid,
 					void **vm, void **process_info,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 171397708855..595ad852080b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1418,9 +1418,31 @@ amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
 static void amdgpu_drmcg_custom_init(struct drm_device *dev,
 	struct drmcg_props *props)
 {
+	struct amdgpu_device *adev = dev->dev_private;
+
+	props->compute_capacity = adev->gfx.cu_info.number;
+	bitmap_zero(props->compute_slots, MAX_DRMCG_COMPUTE_CAPACITY);
+	bitmap_fill(props->compute_slots, props->compute_capacity);
+
 	props->limit_enforced = true;
 }
 
+static void amdgpu_drmcg_limit_updated(struct drm_device *dev,
+		struct task_struct *task, struct drmcg_device_resource *ddr,
+		enum drmcg_res_type res_type)
+{
+	struct amdgpu_device *adev = dev->dev_private;
+
+	switch (res_type) {
+	case DRMCG_TYPE_COMPUTE:
+		amdgpu_amdkfd_update_cu_mask_for_process(task, adev,
+                        ddr->compute_eff, dev->drmcg_props.compute_capacity);
+		break;
+	default:
+		break;
+	}
+}
+
 #else
 
 static void amdgpu_drmcg_custom_init(struct drm_device *dev,
@@ -1428,6 +1450,12 @@ static void amdgpu_drmcg_custom_init(struct drm_device *dev,
 {
 }
 
+static void amdgpu_drmcg_limit_updated(struct drm_device *dev,
+		struct task_struct *task, struct drmcg_device_resource *ddr,
+		enum drmcg_res_type res_type)
+{
+}
+
 #endif /* CONFIG_CGROUP_DRM */
 
 static struct drm_driver kms_driver = {
@@ -1462,6 +1490,7 @@ static struct drm_driver kms_driver = {
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
 
 	.drmcg_custom_init = amdgpu_drmcg_custom_init,
+	.drmcg_limit_updated = amdgpu_drmcg_limit_updated,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 675735b8243a..a35596f2dc4e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -451,6 +451,13 @@ static int kfd_ioctl_set_cu_mask(struct file *filp, struct kfd_process *p,
 		return -EFAULT;
 	}
 
+	if (!pqm_drmcg_compute_validate(p, args->queue_id,
+                    properties.cu_mask, cu_mask_size)) {
+		pr_debug("CU mask not permitted by DRM Cgroup");
+		kfree(properties.cu_mask);
+		return -EACCES;
+	}
+
 	mutex_lock(&p->mutex);
 
 	retval = pqm_set_cu_mask(&p->pqm, args->queue_id, &properties);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 063096ec832d..0fb619586e24 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -929,6 +929,9 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 		       u32 *ctl_stack_used_size,
 		       u32 *save_area_used_size);
 
+bool pqm_drmcg_compute_validate(struct kfd_process *p, int qid, u32 *cu_mask,
+		unsigned int cu_mask_size);
+
 int amdkfd_fence_wait_timeout(unsigned int *fence_addr,
 			      unsigned int fence_value,
 			      unsigned int timeout_ms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index cb1ca11b99c3..bd09403e07b5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -23,9 +23,11 @@
 
 #include <linux/slab.h>
 #include <linux/list.h>
+#include <linux/cgroup_drm.h>
 #include "kfd_device_queue_manager.h"
 #include "kfd_priv.h"
 #include "kfd_kernel_queue.h"
+#include "amdgpu.h"
 #include "amdgpu_amdkfd.h"
 
 static inline struct process_queue_node *get_queue_by_qid(
@@ -167,6 +169,7 @@ static int init_user_queue(struct process_queue_manager *pqm,
 				struct queue_properties *q_properties,
 				struct file *f, unsigned int qid)
 {
+	struct drmcg *drmcg;
 	int retval;
 
 	/* Doorbell initialized in user space*/
@@ -180,6 +183,37 @@ static int init_user_queue(struct process_queue_manager *pqm,
 	if (retval != 0)
 		return retval;
 
+#ifdef CONFIG_CGROUP_DRM
+	drmcg = drmcg_get(pqm->process->lead_thread);
+	if (drmcg) {
+		struct amdgpu_device *adev;
+		struct drmcg_device_resource *ddr;
+		int mask_size;
+		u32 *mask;
+
+		adev = (struct amdgpu_device *) dev->kgd;
+
+		mask_size = adev->ddev->drmcg_props.compute_capacity;
+		mask = kzalloc(sizeof(u32) * round_up(mask_size, 32),
+				GFP_KERNEL);
+
+		if (!mask) {
+			drmcg_put(drmcg);
+			uninit_queue(*q);
+			return -ENOMEM;
+		}
+
+		ddr = drmcg->dev_resources[adev->ddev->primary->index];
+
+		bitmap_to_arr32(mask, ddr->compute_eff, mask_size);
+
+		(*q)->properties.cu_mask_count = mask_size;
+		(*q)->properties.cu_mask = mask;
+
+		drmcg_put(drmcg);
+	}
+#endif /* CONFIG_CGROUP_DRM */
+
 	(*q)->device = dev;
 	(*q)->process = pqm->process;
 
@@ -510,6 +544,125 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+#ifdef CONFIG_CGROUP_DRM
+
+bool pqm_drmcg_compute_validate(struct kfd_process *p, int qid, u32 *cu_mask,
+		unsigned int cu_mask_size)
+{
+	DECLARE_BITMAP(curr_mask, MAX_DRMCG_COMPUTE_CAPACITY);
+	struct drmcg_device_resource *ddr;
+	struct process_queue_node *pqn;
+	struct amdgpu_device *adev;
+	struct drmcg *drmcg;
+	bool result;
+
+	if (cu_mask_size > MAX_DRMCG_COMPUTE_CAPACITY)
+		return false;
+
+	bitmap_from_arr32(curr_mask, cu_mask, cu_mask_size);
+
+	pqn = get_queue_by_qid(&p->pqm, qid);
+	if (!pqn)
+		return false;
+
+	adev = (struct amdgpu_device *)pqn->q->device->kgd;
+
+	drmcg = drmcg_get(p->lead_thread);
+	ddr = drmcg->dev_resources[adev->ddev->primary->index];
+
+	if (bitmap_subset(curr_mask, ddr->compute_eff,
+				MAX_DRMCG_COMPUTE_CAPACITY))
+		result = true;
+	else
+		result = false;
+
+	drmcg_put(drmcg);
+
+	return result;
+}
+
+#else
+
+bool pqm_drmcg_compute_validate(struct kfd_process *p, int qid, u32 *cu_mask,
+		unsigned int cu_mask_size)
+{
+	return true;
+}
+
+#endif /* CONFIG_CGROUP_DRM */
+
+int amdgpu_amdkfd_update_cu_mask_for_process(struct task_struct *task,
+		struct amdgpu_device *adev, unsigned long *compute_bm,
+		unsigned int compute_bm_size)
+{
+	struct kfd_dev *kdev = adev->kfd.dev;
+	struct process_queue_node *pqn;
+	struct kfd_process *kfdproc;
+	size_t size_in_bytes;
+	u32 *cu_mask;
+	int rc = 0;
+
+	if ((compute_bm_size % 32) != 0) {
+		pr_warn("compute_bm_size %d must be a multiple of 32",
+				compute_bm_size);
+		return -EINVAL;
+	}
+
+	kfdproc = kfd_get_process(task);
+
+	if (IS_ERR(kfdproc))
+		return -ESRCH;
+
+	size_in_bytes = sizeof(u32) * round_up(compute_bm_size, 32);
+
+	mutex_lock(&kfdproc->mutex);
+	list_for_each_entry(pqn, &kfdproc->pqm.queues, process_queue_list) {
+		if (pqn->q && pqn->q->device == kdev) {
+			/* update cu_mask accordingly */
+			cu_mask = kzalloc(size_in_bytes, GFP_KERNEL);
+			if (!cu_mask) {
+				rc = -ENOMEM;
+				break;
+			}
+
+			if (pqn->q->properties.cu_mask) {
+				DECLARE_BITMAP(curr_mask,
+						MAX_DRMCG_COMPUTE_CAPACITY);
+
+				if (pqn->q->properties.cu_mask_count >
+						compute_bm_size) {
+					rc = -EINVAL;
+					kfree(cu_mask);
+					break;
+				}
+
+				bitmap_from_arr32(curr_mask,
+						pqn->q->properties.cu_mask,
+						pqn->q->properties.cu_mask_count);
+
+				bitmap_and(curr_mask, curr_mask, compute_bm,
+						compute_bm_size);
+
+				bitmap_to_arr32(cu_mask, curr_mask,
+						compute_bm_size);
+
+				kfree(curr_mask);
+			} else
+				bitmap_to_arr32(cu_mask, compute_bm,
+						compute_bm_size);
+
+			pqn->q->properties.cu_mask = cu_mask;
+			pqn->q->properties.cu_mask_count = compute_bm_size;
+
+			rc = pqn->q->device->dqm->ops.update_queue(
+					pqn->q->device->dqm, pqn->q);
+		}
+	}
+	mutex_unlock(&kfdproc->mutex);
+
+	return rc;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 int pqm_debugfs_mqds(struct seq_file *m, void *data)
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
