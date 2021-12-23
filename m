Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CEB47DC1D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0255210E17D;
	Thu, 23 Dec 2021 00:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E05F10E159;
 Thu, 23 Dec 2021 00:37:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlPLUWF7ufXvjBwtTTEvrA4JVieZkDVHljBbPCJYaSZyqWWQaSt+AXvs8y+p5mQpXzHR59A3hT6N+3xYZuIDepIEywW4DsyF9MP3cIvMsZZEoPdBgtQa1+A1r+3sx7IO8TmWOaFnGiOkv+HiWHdhpnaGXeOST/55SSXGJDTIosmTeGeK1MQls4Zd+e5MUuR6J/fDJ8+n+6SxpPScSilf76HO6l9LmLALIgCjOnPYVtJzPHeP292JgHIaYDp19gmXUeDBtcfOzTAEluCy7O+0uoLJgxZopfEm/ox7kaqCiRBsD3DX5gWygP3iuWjcIgpvUVfb0RA4hMhoaJgeSzG+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml1NL4+B0mQ8HHF7+sNkSRCia3pdZ1ciqNW6TfBk9mE=;
 b=dlqZWbs4Tt6rFk+rF5OsV/OdLFbgQGqq9312YlgzC1ISQ8j9BZNBjRdh6OX9F5tQcWU35pDZsk8P3RW8L/mxvCprKBmTC1quohy0YfmeO+XlYVBZquzLI2WdO3bB+rdAHzfuUIR1EDqrAAEPvuXvmL6XuRek7nph3HkIn95hOoa3jvnL3k9ZbD1cTihDx3Q52yEEJeQAVKCjC0J2wvyvzfy33+FKYoBIQ9fBa3VwO59Wovl6NHNe2fvV9UnoP3RLChC7GTqnSaR3dDf2kjxh+AS51XUVhihk19MHhxd405bIEX5OxT1izbogupXqSlPaWuJyOJOWzONyOLnWgMB/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml1NL4+B0mQ8HHF7+sNkSRCia3pdZ1ciqNW6TfBk9mE=;
 b=5uZhS3/92rLhfNLacJy6oPktsuYf3pAR8L4TpN9KSuSi1EKY0l5+i8uNn1+I3GHzFGAcKj8ov59DJt10OHEt3/beJYkR5BoojmpJg1xOAIKqRHuv20aY7pFtajYc/uS47rv/YdVTLqSuwnSYwAdMHhoISv70h/mO260ZPKCjuM8=
Received: from BN0PR04CA0035.namprd04.prod.outlook.com (2603:10b6:408:e8::10)
 by BY5PR12MB3732.namprd12.prod.outlook.com (2603:10b6:a03:196::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 00:37:28 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::6e) by BN0PR04CA0035.outlook.office365.com
 (2603:10b6:408:e8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:28 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:27 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 05/24] drm/amdkfd: CRIU Implement KFD checkpoint ioctl
Date: Wed, 22 Dec 2021 19:36:52 -0500
Message-ID: <20211223003711.13064-6-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee484897-71c2-4da1-7f3b-08d9c5ac65e9
X-MS-TrafficTypeDiagnostic: BY5PR12MB3732:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB373212EB199272918F6DDC52FE7E9@BY5PR12MB3732.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vwo4K4o2B808ADInCqzc5ah2KqIzhsE3IVmaiunRZli2xGKn4CagAsVj0KKH/r0ZI7verrAEh0kRBLpHLayceJDyYQC6C+pApXzrx0xbo4Tlfq+da2bxTv2DBXp7LByIIwwELWOz5uixXWH8+6WK24dN2mFWFMTGwg6rmrhtVULvTcVc+y6QuCjvIbrHHTDPXNMlOhxtix85XyGm1GuqFzZ46GyqX9k6IaHHR8tkarPNwS7Bp8QjXLccTyn4f0QRpaccbEnZcsejqmvHAodI90C+ced4N0QiEIn16gQZ3iQXAkw1jOWqjXhnHJKrKichKaz2B70s/djWzIW3Y5K8zVXE5LQvn8JWV8AZrMKnoqCKeXquAJjcLrzY+Drba7LNwjJ1YFaa8at6+nV0rcL+/wGyquM/OWuZqsROOV5SM28Fr/ku9f7IcmLeUHlb15vkJGCE0pt0NgPxILpYvFiIaGUH9U1yO1GxjwqxegMk0qxfyxTSVx9EpLCdQmGRLfoRQKLkQY4vIk1y6H7pdOFP95pJn3x3HF7vypkhUj3Gucb5Hpf73rQy8+fcKM8VvyE59jjtJUAdNauujEwlS/H+F9viy7MsX/eTcx4qwLuhcTYXEMuRyM5HSsJiqpRvGeGSJt1MxKs+gG7rGOn87PB5JppF3J2pJD5+TkDv8n/9zHpKN87wHhrUG+zZvx1tSwKtIbVbdeGlYmAt4Bk6oCNSpvUGDSBZTZVQPjf8IBhcekDqtiYEx9/hCzY3bXlDOhn6csnHRezbBv8/+IOfBTBXGb8nv1jqdKq+INp8TIzSVQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(5660300002)(83380400001)(47076005)(356005)(8676002)(70206006)(36756003)(6666004)(70586007)(8936002)(81166007)(36860700001)(426003)(40460700001)(2906002)(16526019)(186003)(508600001)(26005)(2616005)(336012)(110136005)(82310400004)(54906003)(4326008)(316002)(44832011)(7696005)(1076003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:28.4015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee484897-71c2-4da1-7f3b-08d9c5ac65e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3732
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support to discover the  buffer objects that belong to a
process being checkpointed. The data corresponding to these buffer
objects is returned to user space plugin running under criu master
context which then stores this info to recreate these buffer objects
during a restore operation.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  |  20 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 172 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +-
 4 files changed, 195 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 56c5c4464829..4fd36bd9dcfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1173,6 +1173,26 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
 }
 
+/**
+ * amdgpu_ttm_tt_get_userptr - Return the userptr GTT ttm_tt for the current
+ * task
+ *
+ * @tbo: The ttm_buffer_object that contains the userptr
+ * @user_addr:  The returned value
+ */
+int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
+			      uint64_t *user_addr)
+{
+	struct amdgpu_ttm_tt *gtt;
+
+	if (!tbo->ttm)
+		return -EINVAL;
+
+	gtt = (void *)tbo->ttm;
+	*user_addr = gtt->userptr;
+	return 0;
+}
+
 /**
  * amdgpu_ttm_tt_set_userptr - Initialize userptr GTT ttm_tt for the current
  * task
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 7346ecff4438..6e6d67ec43f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -177,6 +177,8 @@ static inline bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 #endif
 
 void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct page **pages);
+int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
+			      uint64_t *user_addr);
 int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
 			      uint64_t addr, uint32_t flags);
 bool amdgpu_ttm_tt_has_userptr(struct ttm_tt *ttm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 53d7a20e3c06..cdbb92972338 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -42,6 +42,7 @@
 #include "kfd_svm.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
+#include "amdgpu_object.h"
 
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
@@ -1857,6 +1858,29 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 }
 #endif
 
+static int criu_checkpoint_process(struct kfd_process *p,
+			     uint8_t __user *user_priv_data,
+			     uint64_t *priv_offset)
+{
+	struct kfd_criu_process_priv_data process_priv;
+	int ret;
+
+	memset(&process_priv, 0, sizeof(process_priv));
+
+	process_priv.version = KFD_CRIU_PRIV_VERSION;
+
+	ret = copy_to_user(user_priv_data + *priv_offset,
+				&process_priv, sizeof(process_priv));
+
+	if (ret) {
+		pr_err("Failed to copy process information to user\n");
+		ret = -EFAULT;
+	}
+
+	*priv_offset += sizeof(process_priv);
+	return ret;
+}
+
 uint64_t get_process_num_bos(struct kfd_process *p)
 {
 	uint64_t num_of_bos = 0, i;
@@ -1877,6 +1901,111 @@ uint64_t get_process_num_bos(struct kfd_process *p)
 	return num_of_bos;
 }
 
+static int criu_checkpoint_bos(struct kfd_process *p,
+			       uint32_t num_bos,
+			       uint8_t __user *user_bos,
+			       uint8_t __user *user_priv_data,
+			       uint64_t *priv_offset)
+{
+	struct kfd_criu_bo_bucket *bo_buckets;
+	struct kfd_criu_bo_priv_data *bo_privs;
+	int ret = 0, pdd_index, bo_index = 0, id;
+	void *mem;
+
+	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	bo_privs = kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
+	if (!bo_privs) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	for (pdd_index = 0; pdd_index < p->n_pdds; pdd_index++) {
+		struct kfd_process_device *pdd = p->pdds[pdd_index];
+		struct amdgpu_bo *dumper_bo;
+		struct kgd_mem *kgd_mem;
+
+		idr_for_each_entry(&pdd->alloc_idr, mem, id) {
+			struct kfd_criu_bo_bucket *bo_bucket;
+			struct kfd_criu_bo_priv_data *bo_priv;
+
+			if (!mem) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+
+			kgd_mem = (struct kgd_mem *)mem;
+			dumper_bo = kgd_mem->bo;
+
+			if ((uint64_t)kgd_mem->va <= pdd->gpuvm_base)
+				continue;
+
+			bo_bucket = &bo_buckets[bo_index];
+			bo_priv = &bo_privs[bo_index];
+
+			bo_bucket->addr = (uint64_t)kgd_mem->va;
+			bo_bucket->size = amdgpu_bo_size(dumper_bo);
+			bo_bucket->gpu_id = pdd->dev->id;
+			bo_bucket->alloc_flags = (uint32_t)kgd_mem->alloc_flags;
+			bo_priv->idr_handle = id;
+
+			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
+				ret = amdgpu_ttm_tt_get_userptr(&dumper_bo->tbo,
+								&bo_priv->user_addr);
+				if (ret) {
+					pr_err("Failed to obtain user address for user-pointer bo\n");
+					goto exit;
+				}
+			}
+			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
+				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
+					KFD_MMAP_GPU_ID(pdd->dev->id);
+			else if (bo_bucket->alloc_flags &
+				KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP)
+				bo_bucket->offset = KFD_MMAP_TYPE_MMIO |
+					KFD_MMAP_GPU_ID(pdd->dev->id);
+			else
+				bo_bucket->offset = amdgpu_bo_mmap_offset(dumper_bo);
+
+			pr_debug("bo_size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
+					"gpu_id = 0x%x alloc_flags = 0x%x idr_handle = 0x%x",
+					bo_bucket->size,
+					bo_bucket->addr,
+					bo_bucket->offset,
+					bo_bucket->gpu_id,
+					bo_bucket->alloc_flags,
+					bo_priv->idr_handle);
+			bo_index++;
+		}
+	}
+
+	ret = copy_to_user(user_bos, bo_buckets, num_bos * sizeof(*bo_buckets));
+	if (ret) {
+		pr_err("Failed to copy BO information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	ret = copy_to_user(user_priv_data + *priv_offset, bo_privs, num_bos * sizeof(*bo_privs));
+	if (ret) {
+		pr_err("Failed to copy BO priv information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	*priv_offset += num_bos * sizeof(*bo_privs);
+
+exit:
+
+	kvfree(bo_buckets);
+	kvfree(bo_privs);
+	return ret;
+}
+
 static void criu_get_process_object_info(struct kfd_process *p,
 					 uint32_t *num_bos,
 					 uint64_t *objs_priv_size)
@@ -1896,7 +2025,48 @@ static int criu_checkpoint(struct file *filep,
 			   struct kfd_process *p,
 			   struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	int ret;
+	uint32_t num_bos;
+	uint64_t priv_size, priv_offset = 0;
+
+	if (!args->bos || !args->priv_data)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+
+	if (!kfd_has_process_device_data(p)) {
+		pr_err("No pdd for given process\n");
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	criu_get_process_object_info(p, &num_bos, &priv_size);
+
+	if (num_bos != args->num_bos ||
+	    priv_size != args->priv_data_size) {
+
+		ret = -EINVAL;
+		goto exit_unlock;
+	}
+
+	/* each function will store private data inside priv_data and adjust priv_offset */
+	ret = criu_checkpoint_process(p, (uint8_t __user *)args->priv_data, &priv_offset);
+	if (ret)
+		goto exit_unlock;
+
+	ret = criu_checkpoint_bos(p, num_bos, (uint8_t __user *)args->bos,
+			    (uint8_t __user *)args->priv_data, &priv_offset);
+	if (ret)
+		goto exit_unlock;
+
+exit_unlock:
+	mutex_unlock(&p->mutex);
+	if (ret)
+		pr_err("Failed to dump CRIU ret:%d\n", ret);
+	else
+		pr_debug("CRIU dump ret:%d\n", ret);
+
+	return ret;
 }
 
 static int criu_restore(struct file *filep,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 4d9bc7af03af..e611366fbc34 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1049,7 +1049,8 @@ struct kfd_criu_device_priv_data {
 };
 
 struct kfd_criu_bo_priv_data {
-	uint64_t reserved;
+	uint64_t user_addr;
+	uint32_t idr_handle;
 };
 
 struct kfd_criu_svm_range_priv_data {
-- 
2.17.1

