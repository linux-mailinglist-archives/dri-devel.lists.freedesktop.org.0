Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A241715DD22
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C586F9FB;
	Fri, 14 Feb 2020 15:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760041.outbound.protection.outlook.com [40.107.76.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6266FA01;
 Fri, 14 Feb 2020 15:57:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIIvsVPPpVI6tWvUMrID6jEca77e1p3kTxs9egltLZFgcznx0nFZFz//OhdkUdqPzAQ30Br45ytpyDyN8LWkMQhvTGDF8xOse0Q863rdK2+lUIMJUo89fW1ALCpPhfJ6VFWtXyxiQobfwJZgLILQ9JFRnFOErYGuJ7hBl3PvWtKd1wNohJmRPceUHNg/EnHZ9fVC69MRwcxHv+e0mkHYlRYaMdHLUcSmulvsbp1bdQEc5OiAPFGAG+OEEhEelwmdy5oG4VSWEA65fd/H/td0HcRvnh/YpbgrzXitV5ZhUpAmms+zQtBB4muwS1yOIK0KMB08wBzxFZ8RYVhg5hoH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rRr9SDapif3gUzcHJzuaeIB3YgcZXIrBlrTW3u0h8A=;
 b=IN88N1EsUgcyKYZ92j4e+BbyjmKW2KmYdemrsLxjPEuqpByPvRITbVMrRDQTamlO+WKbtED8jCYkne2F2HASL5BSY2mVovKUVk0yxBlBaZTaHVYJUgPGw7zU4rdl78usgBcIC4dBn9rx1iWnT++9jx33/9LFo+hje1DZc6bX9DRfx+VKUAKZ3qXrnVTPbUBn6vNsqK9GKMl/sTjko+N+sOnHIZ1bHma3fmwUgb/dqYJ6BnMP3bSStY7LfPTYii68Ko9ckvpmRcnh7RkY8mmbbYUXwpnwnIRpblCCsl7ZwSAvNpbcs02D+56sZf/k+b6lMcawrjN6Gebf/iar5PVNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rRr9SDapif3gUzcHJzuaeIB3YgcZXIrBlrTW3u0h8A=;
 b=XVkGieX5pf421kKdmQTXpyFO7Mrk446+MHJT+dr4T9nACLQ30IQjZcgz7+hjXUj1V16iRVtqfMvysYVAAOx5gu4lZT50NEw1B5jdfPrd+rzDG6TBx7jsIjEAP0p0/EFrF+5iKrWR9VaG+WWAzFRD47rvbTlPUTLOGsr/6LTBoXI=
Received: from CY4PR1201CA0004.namprd12.prod.outlook.com
 (2603:10b6:910:16::14) by DM5PR1201MB0059.namprd12.prod.outlook.com
 (2603:10b6:4:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Fri, 14 Feb
 2020 15:57:19 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::201) by CY4PR1201CA0004.outlook.office365.com
 (2603:10b6:910:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:19 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:19 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:18 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:17 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 11/11] drm/amdgpu: Integrate with DRM cgroup
Date: Fri, 14 Feb 2020 10:56:50 -0500
Message-ID: <20200214155650.21203-12-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(428003)(189003)(199004)(86362001)(81156014)(81166006)(4326008)(26005)(8676002)(5660300002)(186003)(478600001)(426003)(6636002)(8936002)(1076003)(316002)(2616005)(6666004)(110136005)(36756003)(70586007)(336012)(7696005)(70206006)(2906002)(356004)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0059; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 892e099d-0f6f-4533-76ef-08d7b166924c
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0059:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00591AB4A1E4226AAFD8771C83150@DM5PR1201MB0059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kW4hNTcF366MKHSEB8dN+9P+qrp3ekradTTbRiMXmuo1hRldzMaiKfhaUGkddL3S9KvHTEan1vWfrgmp+Fu0n173dh7+R8+Faibm2zrZNXJpcTvMSIT9fHCDeyU7XHF8Zo+kobwuhgJLbqDF3JtL7/X2mSmeEGUv5W7VJgALf6udFPvHrUTT6aLCrVSDVulzYIc0BebLew2dEwy2xf6rsoF43lmWWY6+mx4uzIrRBJkOxRKwKXDMpDtEOowtfQtu8wJUoM0cgjo3B/43+UN65Sj5D0/ndIJgiwtAWPaYITOLxwsk/a6H6TN72CJ2uMamkTuRA1eqP02KPneeS325BIkbUueG/tsIGTNfUSpxqgQe82QI7HfUCFG8k92/xmF312xIfrk1F3NptV9yOS6ffUQiQ+3qi+Ds7prDbTcnO3gVOvnyRvzwYD/J9NOqCzktnSCSxPCVJwd3mC8Y406PocECAQGiFXlvu9K1alTg++LX/PJfmT1x7lulqSdptzrTl9G8/lIjiZwhm+2uF7mTTPAZfNx1J4/gCIj2uIjk3to=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:19.5049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 892e099d-0f6f-4533-76ef-08d7b166924c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
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

The number of logical gpu (lgpu) is defined to be the number of compute
unit (CU) for a device.  The lgpu allocation limit only applies to
compute workload for the moment (enforced via kfd queue creation.)  Any
cu_mask update is validated against the availability of the compute unit
as defined by the drmcg the kfd process belongs to.

Change-Id: I2930e76ef9ac6d36d0feb81f604c89a4208e6614
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  29 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   3 +
 .../amd/amdkfd/kfd_process_queue_manager.c    | 153 ++++++++++++++++++
 5 files changed, 195 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 47b0f2957d1f..a45c7b5d23b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -198,6 +198,10 @@ uint8_t amdgpu_amdkfd_get_xgmi_hops_count(struct kgd_dev *dst, struct kgd_dev *s
 		valid;							\
 	})
 
+int amdgpu_amdkfd_update_cu_mask_for_process(struct task_struct *task,
+		struct amdgpu_device *adev, unsigned long *lgpu_bitmap,
+		unsigned int nbits);
+
 /* GPUVM API */
 int amdgpu_amdkfd_gpuvm_create_process_vm(struct kgd_dev *kgd, unsigned int pasid,
 					void **vm, void **process_info,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3ebef1d62346..dc31b9af2c72 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1402,9 +1402,31 @@ amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
 static void amdgpu_drmcg_custom_init(struct drm_device *dev,
 	struct drmcg_props *props)
 {
+	struct amdgpu_device *adev = dev->dev_private;
+
+	props->lgpu_capacity = adev->gfx.cu_info.number;
+	bitmap_zero(props->lgpu_slots, MAX_DRMCG_LGPU_CAPACITY);
+	bitmap_fill(props->lgpu_slots, props->lgpu_capacity);
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
+	case DRMCG_TYPE_LGPU:
+		amdgpu_amdkfd_update_cu_mask_for_process(task, adev,
+                        ddr->lgpu_eff, dev->drmcg_props.lgpu_capacity);
+		break;
+	default:
+		break;
+	}
+}
+
 #else
 
 static void amdgpu_drmcg_custom_init(struct drm_device *dev,
@@ -1412,6 +1434,12 @@ static void amdgpu_drmcg_custom_init(struct drm_device *dev,
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
@@ -1448,6 +1476,7 @@ static struct drm_driver kms_driver = {
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
 
 	.drmcg_custom_init = amdgpu_drmcg_custom_init,
+	.drmcg_limit_updated = amdgpu_drmcg_limit_updated,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 275f79ab0900..f39555c0f1d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -449,6 +449,12 @@ static int kfd_ioctl_set_cu_mask(struct file *filp, struct kfd_process *p,
 		return -EFAULT;
 	}
 
+	if (!pqm_drmcg_lgpu_validate(p, args->queue_id, properties.cu_mask, cu_mask_size)) {
+		pr_debug("CU mask not permitted by DRM Cgroup");
+		kfree(properties.cu_mask);
+		return -EACCES;
+	}
+
 	mutex_lock(&p->mutex);
 
 	retval = pqm_set_cu_mask(&p->pqm, args->queue_id, &properties);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index c0b0defc8f7a..9053b1b7fb10 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -921,6 +921,9 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 		       u32 *ctl_stack_used_size,
 		       u32 *save_area_used_size);
 
+bool pqm_drmcg_lgpu_validate(struct kfd_process *p, int qid, u32 *cu_mask,
+		unsigned int cu_mask_size);
+
 int amdkfd_fence_wait_timeout(unsigned int *fence_addr,
 			      unsigned int fence_value,
 			      unsigned int timeout_ms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 8fa856e6a03f..ff71b208d320 100644
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
+		mask_size = adev->ddev->drmcg_props.lgpu_capacity;
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
+		bitmap_to_arr32(mask, ddr->lgpu_eff, mask_size);
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
 
@@ -508,6 +542,125 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+#ifdef CONFIG_CGROUP_DRM
+
+bool pqm_drmcg_lgpu_validate(struct kfd_process *p, int qid, u32 *cu_mask,
+		unsigned int cu_mask_size)
+{
+	DECLARE_BITMAP(curr_mask, MAX_DRMCG_LGPU_CAPACITY);
+	struct drmcg_device_resource *ddr;
+	struct process_queue_node *pqn;
+	struct amdgpu_device *adev;
+	struct drmcg *drmcg;
+	bool result;
+
+	if (cu_mask_size > MAX_DRMCG_LGPU_CAPACITY)
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
+	if (bitmap_subset(curr_mask, ddr->lgpu_eff,
+				MAX_DRMCG_LGPU_CAPACITY))
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
+bool pqm_drmcg_lgpu_validate(struct kfd_process *p, int qid, u32 *cu_mask,
+		unsigned int cu_mask_size)
+{
+	return true;
+}
+
+#endif /* CONFIG_CGROUP_DRM */
+
+int amdgpu_amdkfd_update_cu_mask_for_process(struct task_struct *task,
+		struct amdgpu_device *adev, unsigned long *lgpu_bm,
+		unsigned int lgpu_bm_size)
+{
+	struct kfd_dev *kdev = adev->kfd.dev;
+	struct process_queue_node *pqn;
+	struct kfd_process *kfdproc;
+	size_t size_in_bytes;
+	u32 *cu_mask;
+	int rc = 0;
+
+	if ((lgpu_bm_size % 32) != 0) {
+		pr_warn("lgpu_bm_size %d must be a multiple of 32",
+				lgpu_bm_size);
+		return -EINVAL;
+	}
+
+	kfdproc = kfd_get_process(task);
+
+	if (IS_ERR(kfdproc))
+		return -ESRCH;
+
+	size_in_bytes = sizeof(u32) * round_up(lgpu_bm_size, 32);
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
+						MAX_DRMCG_LGPU_CAPACITY);
+
+				if (pqn->q->properties.cu_mask_count >
+						lgpu_bm_size) {
+					rc = -EINVAL;
+					kfree(cu_mask);
+					break;
+				}
+
+				bitmap_from_arr32(curr_mask,
+						pqn->q->properties.cu_mask,
+						pqn->q->properties.cu_mask_count);
+
+				bitmap_and(curr_mask, curr_mask, lgpu_bm,
+						lgpu_bm_size);
+
+				bitmap_to_arr32(cu_mask, curr_mask,
+						lgpu_bm_size);
+
+				kfree(curr_mask);
+			} else
+				bitmap_to_arr32(cu_mask, lgpu_bm,
+						lgpu_bm_size);
+
+			pqn->q->properties.cu_mask = cu_mask;
+			pqn->q->properties.cu_mask_count = lgpu_bm_size;
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
