Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C345D47DC43
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DA310E1DA;
	Thu, 23 Dec 2021 00:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C179610E16D;
 Thu, 23 Dec 2021 00:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICU775Frz/ioy4gUbHp+Fn0pb1aYCYqVUveK0yMlgy1qqrzRceoorDD7sHz8y4pecFxXdb2MR5QE31kKg1a7uo0Yhj31silhNocjlaUGAVIGPqzXZkCLTUGh9gq1yvwlDAulUUVSda+ZgwNyLG77KkrdNktnDzoCLG+NuU/ClBuxcI1sc9tw/YXJseM9/xilqMaFFdDPuVQXkx2G/7M9xalNeNd9gLPxd9TkizRGQ92LK1VetB7ijWnohd1epf3aU6Pebf9SPFn0jnpMMXFEOitypLE4A1+YCWaKNqqtQKXLdjgtFjpqZ28iOgoSFef2D+vd4IQndCvOyln3Ajrb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Peha7Izv53LjnnrN0VSorn+Eez114VDHugH81dYTsk4=;
 b=PmGgHuvoGhmBT/wQnjalM/R7aqnhD3XJIa2vWBIsuL+OcXvcbZgArSyjh0SUIoj5SN52z4cjzW/aKU/LFsVp3AmHajLAAtAwqoO8w2OfqKVDEeJDfN7LdOJjhCj6u6o5ByeZYtbHIaIZGkBME6aoD2hj1JjnqGgm8eS9qu2v70xO/jTbTCIFDG8z7o4AKo2nP8t/YAP/eKcCiO8/dERwWH15gr0wPGGP3S7Emv4JYc7Hgli5YUujwvff6y4YcMjBNZqQ4xGoJWWvhvp5M4KI2eCQvpM5CKFA58yoHH/BCq9jc/QO0yGBVpoy3LVdx4iK+7E3BvtWWD3Ze0Ke93KzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Peha7Izv53LjnnrN0VSorn+Eez114VDHugH81dYTsk4=;
 b=4kjvbvxHeFnhcYwVX2jHXNTOW29FbZ2CkXND/DAdIYDsotPXSO8laTINUOt1na9NGT8IK+YYlI5vBqiAuUn7N68sYqN0F/PoB433hweZqzvvST7Z1izHAoLS/anUSGlUAuGhXfzXoIsAslSlbs5ycqeP2QKTxkZvMWyINsE2/O8=
Received: from BN9PR03CA0535.namprd03.prod.outlook.com (2603:10b6:408:131::30)
 by MWHPR1201MB0080.namprd12.prod.outlook.com (2603:10b6:301:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Thu, 23 Dec
 2021 00:37:37 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::cd) by BN9PR03CA0535.outlook.office365.com
 (2603:10b6:408:131::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:37 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:36 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 22/24] drm/amdkfd: CRIU Save Shared Virtual Memory ranges
Date: Wed, 22 Dec 2021 19:37:09 -0500
Message-ID: <20211223003711.13064-23-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 921ddc22-cd15-4e30-6ea9-08d9c5ac6b61
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0080:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00807CE6C9F3A708AC362B53FE7E9@MWHPR1201MB0080.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o04oImNv6njr+476xCD4go1kNFSqKi+arI3O6m2a3S4aUQU1eIsGfu2nIJ3m+ZJBR4sUz5uPjslV4UCEFEdUE3bdL5SWfKh8HQAX2YLmEfOQ8D9A1SPBUIT7pX3mKuuGN8jGgqOl+D4oeiZT6h6VnFJQ/cKpGG0nHSC0VRSD2GEVN0NNbw+VUECwqyZtgV/2apmonUo9qpkO2v9IbzzmL2utzps74hM49w4Dq8X8cMj0OMP9RnKipdo/AHZg5QbEgTng25cdHJWdT93a+ichQCaTnSU/9jsLGDx9X6lmyei+VZaRPMVO5RnSJ63PSyS2B5F9YImiBjYLBxgfXH5W3AAT+VsLpiETVlmAOh5GB3EaCHTljb2ud730W/VxtrZkZDFzILPRFsbQ55Qn72YBHuufGu6HCarbmOFgFupY8z23BHVgocm4frb9p7X1IlAy8NuBRA1/Ib9hoRIntGvf1z9qyj6Va7kOQj2LcM0wIl67HtRlp4xuOCqRR9ODYwjkL77CG414ahQsZpq3DRYnvui1rLeSe+g1hrC/gR9NAtsLXs+ddQHgVTSfbOrR59OC2ixvJfoJ1+UXwmN9+bhYZqwc5+d44VqT3CFbxS2dBHI9OE4MR2Pk4ToY1x+HVq7ovBtKAeFOWMWkd4op4SubIQ36wHWYty7Mikqc3+sQdeNhDvygdFFLDGd++J17nqCdq+JkiLCu/vX+iI5fGD1aVOB7HY1OwlsB0nqi3SuWYSy7nQYxJ/b7GbOzt/w/FKzVpoV0R7yanHO5/aNDKXKfCTa+Sa9l5fNKGsHtsReDXig=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(2906002)(36860700001)(186003)(110136005)(54906003)(508600001)(36756003)(83380400001)(8936002)(82310400004)(16526019)(6666004)(5660300002)(44832011)(81166007)(47076005)(356005)(26005)(4326008)(40460700001)(316002)(7696005)(70586007)(1076003)(86362001)(8676002)(426003)(336012)(2616005)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:37.5761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921ddc22-cd15-4e30-6ea9-08d9c5ac6b61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0080
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
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During checkpoint stage, save the shared virtual memory ranges and
attributes for the target process. A process may contain a number of svm
ranges and each range might contain a number of arrtibutes. While not
all attributes may be applicable for a given prange but during
checkpoint we store all possible values for the max possible attribute
types.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 95 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 10 +++
 3 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1c25d5e9067c..916b8d000317 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2186,7 +2186,9 @@ static int criu_checkpoint(struct file *filep,
 		if (ret)
 			goto close_bo_fds;
 
-		/* TODO: Dump SVM-Ranges */
+		ret = kfd_criu_checkpoint_svm(p, (uint8_t __user *)args->priv_data, &priv_offset);
+		if (ret)
+			goto close_bo_fds;
 	}
 
 close_bo_fds:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 49e05fb5c898..6d59f1bedcf2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3478,6 +3478,101 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 	return 0;
 }
 
+int kfd_criu_checkpoint_svm(struct kfd_process *p,
+			    uint8_t __user *user_priv_data,
+			    uint64_t *priv_data_offset)
+{
+	struct kfd_criu_svm_range_priv_data *svm_priv = NULL;
+	struct kfd_ioctl_svm_attribute *query_attr = NULL;
+	uint64_t svm_priv_data_size, query_attr_size = 0;
+	int index, nattr_common = 4, ret = 0;
+	struct svm_range_list *svms;
+	int num_devices = p->n_pdds;
+	struct svm_range *prange;
+	struct mm_struct *mm;
+
+	svms = &p->svms;
+	if (!svms)
+		return -EINVAL;
+
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_err("failed to get mm for the target process\n");
+		return -ESRCH;
+	}
+
+	query_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+				(nattr_common + num_devices);
+
+	query_attr = kzalloc(query_attr_size, GFP_KERNEL);
+	if (!query_attr) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	query_attr[0].type = KFD_IOCTL_SVM_ATTR_PREFERRED_LOC;
+	query_attr[1].type = KFD_IOCTL_SVM_ATTR_PREFETCH_LOC;
+	query_attr[2].type = KFD_IOCTL_SVM_ATTR_SET_FLAGS;
+	query_attr[3].type = KFD_IOCTL_SVM_ATTR_GRANULARITY;
+
+	for (index = 0; index < num_devices; index++) {
+		struct kfd_process_device *pdd = p->pdds[index];
+
+		query_attr[index + nattr_common].type =
+			KFD_IOCTL_SVM_ATTR_ACCESS;
+		query_attr[index + nattr_common].value = pdd->user_gpu_id;
+	}
+
+	svm_priv_data_size = sizeof(*svm_priv) + query_attr_size;
+
+	svm_priv = kzalloc(svm_priv_data_size, GFP_KERNEL);
+	if (!svm_priv) {
+		ret = -ENOMEM;
+		goto exit_query;
+	}
+
+	index = 0;
+	list_for_each_entry(prange, &svms->list, list) {
+
+		svm_priv->object_type = KFD_CRIU_OBJECT_TYPE_SVM_RANGE;
+		svm_priv->start_addr = prange->start;
+		svm_priv->size = prange->npages;
+		memcpy(&svm_priv->attrs, query_attr, query_attr_size);
+		pr_debug("CRIU: prange: 0x%p start: 0x%lx\t npages: 0x%llx end: 0x%llx\t size: 0x%llx\n",
+			 prange, prange->start, prange->npages,
+			 prange->start + prange->npages - 1,
+			 prange->npages * PAGE_SIZE);
+
+		ret = svm_range_get_attr(p, mm, svm_priv->start_addr,
+					 svm_priv->size,
+					 (nattr_common + num_devices),
+					 svm_priv->attrs);
+		if (ret) {
+			pr_err("CRIU: failed to obtain range attributes\n");
+			goto exit_priv;
+		}
+
+		ret = copy_to_user(user_priv_data + *priv_data_offset,
+				   svm_priv, svm_priv_data_size);
+		if (ret) {
+			pr_err("Failed to copy svm priv to user\n");
+			goto exit_priv;
+		}
+
+		*priv_data_offset += svm_priv_data_size;
+
+	}
+
+
+exit_priv:
+	kfree(svm_priv);
+exit_query:
+	kfree(query_attr);
+exit:
+	mmput(mm);
+	return ret;
+}
+
 int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index c8c1251920d4..b00576db5baa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -188,6 +188,9 @@ void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm,
 			void *owner);
 int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 		       uint64_t *svm_priv_data_size);
+int kfd_criu_checkpoint_svm(struct kfd_process *p,
+			    uint8_t __user *user_priv_data,
+			    uint64_t *priv_offset);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -234,6 +237,13 @@ static inline int svm_range_get_info(struct kfd_process *p,
 	return 0;
 }
 
+static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
+					  uint8_t __user *user_priv_data,
+					  uint64_t *priv_offset)
+{
+	return 0;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
-- 
2.17.1

