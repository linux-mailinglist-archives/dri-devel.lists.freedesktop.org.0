Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F224347DC36
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A6F10E1A4;
	Thu, 23 Dec 2021 00:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCBF10E164;
 Thu, 23 Dec 2021 00:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8U+0XGjByJzT9Uh1AYtblc8cheHVbm8nktTRyZ+3KMQgv70kAz7w2UBqCHq1BexvV0Q5EYw7S+f5irEF0CTg8c+51LIZiu9DMZqOdktNDAIbv07z4LjAv/77TpU9Ij5HqI8CUuzqPsB/pQc3dd/Si/3XtGOdNbKlDLnjysL9Riuixu32pOm90CoHTBhpwoBTCTUGZwXbZba3MPQ/wx5DKBvRxdV06CsZUZ9tlBls799NoltqRjQq+KVfpHbxBoPaY8YLEdGWmud04OkUFl/PKSskjdGxB1TNKpDdXMN/ceQX30nbZ8rw5MZxDQB7xWKYPnceyq5Az+bRnq17+pqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yopqvTXmNkPakmDXtrtNSZ4QjvPJ+pXUnYbhRlHv8ao=;
 b=EMOWPTcm7Za6zn//tsri10rKUGmhnoY2p30beysvdYpNw4xtEa83pSPbxKqBSMG17wpMZhr8fwMnp1ZM5OwweOdk/l/u9lioqizvuISC0Q+dyDaAbBxI/+UI1bTyNH11y1Rnmalvv+NJyE2XAkRGAaVmUpiUQVRbYkXOamNPtbZzPbNPiyn7/ZmHVd7v1dIhr0AJIxbzCwrs5TybkW11pgiJN38o70H/8x+MW7uLp37tmEVduteb9Sz6NFNQBgODu0LNkJv1ufxee5RCOOBgP9IafzP8WBtLvbArZvcw8dxZQ5hVMd1d7ccsYfaMRlqQ3zwZyWA8iPHUhWBtw2JHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yopqvTXmNkPakmDXtrtNSZ4QjvPJ+pXUnYbhRlHv8ao=;
 b=eca/CVZwTfQ9HiT1MEHEfqLL6TDFf9ah9Ps73Os0v8aISIv89ju7ZGrvj+Ap2SMHGu0mJ0mzv8I2QuTL8iQEf26zPgbt264xTcCG1l0cKM8lfNwWJSNwmhoe3uKHChYxVLezJFlNilSmBP47hmUS3gyt7amoxHixnJ3SbQtauHw=
Received: from BN0PR04CA0058.namprd04.prod.outlook.com (2603:10b6:408:e8::33)
 by DM8PR12MB5416.namprd12.prod.outlook.com (2603:10b6:8:28::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 00:37:34 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::f1) by BN0PR04CA0058.outlook.office365.com
 (2603:10b6:408:e8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:34 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:34 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 17/24] drm/amdkfd: CRIU export BOs as prime dmabuf objects
Date: Wed, 22 Dec 2021 19:37:04 -0500
Message-ID: <20211223003711.13064-18-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: fab236c1-2849-4fa9-baa5-08d9c5ac69ac
X-MS-TrafficTypeDiagnostic: DM8PR12MB5416:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB5416D78EBF4985A89FEF6A4CFE7E9@DM8PR12MB5416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eO7bHB1lzL37UTYlFoGMbtxZgLK9G96ysm/hEJxGCpOidzaOOggidmjd3nNU4sKhPQ6hVg8uh0eoNESbM6ia/c+E+rZmWTIqvKqllnQHPAOeQurIvdaWdZsy6QT0aEIBmuvON9BOjYSu+SpV/zk+DQ4N4Jm8qEV0KtnBB7Q1BqvFm2gn3vdQ2azhiA71aI+gvTRqAniR67Be4lo4YfRmvOfy/6EcKOa1foRK2SHOPUKREfoZq9i7Qc9Zq3bhtrgvgQDGtQtbf/T4/hqPoZB174hzh5cGJpykW+B5w9MNonamB4ENRtzR/+fPAcH/K0MSe0b6/anxeyfQUT0UChJ3vv0/HMBPL2zD9zSXFq0hKPlZKUZgaH+1XU7DMRxNTQ86jvanKemcShKNBqEQc5Vy/Pcu+vdRXp6q9HVgLf1rwoEvKDQugBsjx+j/v/lyk/7PXo78j276d/gV1T4e7unGgowWRtnAQ2ad29EmOnPb7ct/y4/GMBFexPymOeQ+GuMn+cMbCOrOgdIpF+jur3MfqkrHg2n4RfxG181VzWY8mbIgKkUvtT/qvxU/u+tyybfhgMNoUbO7ffVhT5Yd2u7TT5PU1i6UwZofcXR0HTTn1hd5pbHxza6mNffAhrZz3GUZA4LaMIHIkJapiBLcnMxF5pM6hf3yHzqJclKCuGmB9yAfrg3fdLuAUdM0vEie4D9YDwVTI+UFViKZFVIf6fbns6gYfvgUuZGteXY7JO05GoaNp8vFK1alLS8HxKLIwxE6Mj/0eqSr9CpP1AaDrNCXx8MPt9Hn0hEBd4ma01BDF6Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(426003)(5660300002)(81166007)(110136005)(70206006)(54906003)(26005)(36756003)(8936002)(336012)(186003)(356005)(47076005)(1076003)(6666004)(7696005)(2906002)(16526019)(83380400001)(316002)(82310400004)(36860700001)(44832011)(86362001)(4326008)(40460700001)(8676002)(508600001)(70586007)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:34.7141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab236c1-2849-4fa9-baa5-08d9c5ac69ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5416
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

KFD buffer objects do not associate a GEM handle with them so cannot
directly be used with libdrm to initiate a system dma (sDMA) operation
to speedup the checkpoint and restore operation so export them as dmabuf
objects and use with libdrm helper (amdgpu_bo_import) to further process
the sdma command submissions.

With sDMA, we see huge improvement in checkpoint and restore operations
compared to the generic pci based access via host data path.

Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 71 +++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 20652d488cde..178b0ccfb286 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -35,6 +35,7 @@
 #include <linux/mman.h>
 #include <linux/ptrace.h>
 #include <linux/dma-buf.h>
+#include <linux/fdtable.h>
 #include <asm/processor.h>
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
@@ -43,6 +44,7 @@
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
 #include "amdgpu_object.h"
+#include "amdgpu_dma_buf.h"
 
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
@@ -1932,6 +1934,33 @@ uint64_t get_process_num_bos(struct kfd_process *p)
 	return num_of_bos;
 }
 
+static int criu_get_prime_handle(struct drm_gem_object *gobj, int flags,
+				      u32 *shared_fd)
+{
+	struct dma_buf *dmabuf;
+	int ret;
+
+	dmabuf = amdgpu_gem_prime_export(gobj, flags);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		pr_err("dmabuf export failed for the BO\n");
+		return ret;
+	}
+
+	ret = dma_buf_fd(dmabuf, flags);
+	if (ret < 0) {
+		pr_err("dmabuf create fd failed, ret:%d\n", ret);
+		goto out_free_dmabuf;
+	}
+
+	*shared_fd = ret;
+	return 0;
+
+out_free_dmabuf:
+	dma_buf_put(dmabuf);
+	return ret;
+}
+
 static int criu_checkpoint_bos(struct kfd_process *p,
 			       uint32_t num_bos,
 			       uint8_t __user *user_bos,
@@ -1992,6 +2021,14 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 					goto exit;
 				}
 			}
+			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+				ret = criu_get_prime_handle(&dumper_bo->tbo.base,
+						bo_bucket->alloc_flags &
+						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0,
+						&bo_bucket->dmabuf_fd);
+				if (ret)
+					goto exit;
+			}
 			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
 				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
 					KFD_MMAP_GPU_ID(pdd->dev->id);
@@ -2031,6 +2068,10 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 	*priv_offset += num_bos * sizeof(*bo_privs);
 
 exit:
+	while (ret && bo_index--) {
+		if (bo_buckets[bo_index].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+			close_fd(bo_buckets[bo_index].dmabuf_fd);
+	}
 
 	kvfree(bo_buckets);
 	kvfree(bo_privs);
@@ -2131,16 +2172,28 @@ static int criu_checkpoint(struct file *filep,
 		ret = kfd_criu_checkpoint_queues(p, (uint8_t __user *)args->priv_data,
 						 &priv_offset);
 		if (ret)
-			goto exit_unlock;
+			goto close_bo_fds;
 
 		ret = kfd_criu_checkpoint_events(p, (uint8_t __user *)args->priv_data,
 						 &priv_offset);
 		if (ret)
-			goto exit_unlock;
+			goto close_bo_fds;
 
 		/* TODO: Dump SVM-Ranges */
 	}
 
+close_bo_fds:
+	if (ret) {
+		/* If IOCTL returns err, user assumes all FDs opened in criu_dump_bos are closed */
+		uint32_t i;
+		struct kfd_criu_bo_bucket *bo_buckets = (struct kfd_criu_bo_bucket *) args->bos;
+
+		for (i = 0; i < num_bos; i++) {
+			if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+				close_fd(bo_buckets[i].dmabuf_fd);
+		}
+	}
+
 exit_unlock:
 	mutex_unlock(&p->mutex);
 	if (ret)
@@ -2335,6 +2388,7 @@ static int criu_restore_bos(struct kfd_process *p,
 		struct kfd_criu_bo_priv_data *bo_priv;
 		struct kfd_dev *dev;
 		struct kfd_process_device *pdd;
+		struct kgd_mem *kgd_mem;
 		void *mem;
 		u64 offset;
 		int idr_handle;
@@ -2479,6 +2533,15 @@ static int criu_restore_bos(struct kfd_process *p,
 		}
 
 		pr_debug("map memory was successful for the BO\n");
+		/* create the dmabuf object and export the bo */
+		kgd_mem = (struct kgd_mem *)mem;
+		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+			ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base,
+						    DRM_RDWR,
+						    &bo_bucket->dmabuf_fd);
+			if (ret)
+				goto exit;
+		}
 	} /* done */
 
 	if (flush_tlbs) {
@@ -2506,6 +2569,10 @@ static int criu_restore_bos(struct kfd_process *p,
 		ret = -EFAULT;
 
 exit:
+	while (ret && i--) {
+		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+			close_fd(bo_buckets[i].dmabuf_fd);
+	}
 	kvfree(bo_buckets);
 	kvfree(bo_privs);
 	return ret;
-- 
2.17.1

