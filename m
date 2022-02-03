Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3624A811B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E40610EB12;
	Thu,  3 Feb 2022 09:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D67010EAE8;
 Thu,  3 Feb 2022 09:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2pNorFJrGd00cZWjMdoMxQqUMsMv7WLnnb4dWTTFbuJSeXssyE8MwRThJS46ZAzN6K9brMXbqpXeo1mIHkP8h85D+HMk+yURwsA/nuPiR+DPZ+dzI77LELsMAkhPKn109AFOS1O0YYrz/dwr/pfnJZqePsCrnylTTCy1mKUavlEBk7mDGldXXAWSfkZ9Y97ki+8+RcY1Ch+qV06DE8XKuU34V36v14mJZmpFSmE5OiJ2nEyNhyy2Sf6vrRQtQilFUjZclKLbqnB5hBfSUxppKZVP+QvQfhfg4v2Xsth1iQEk5sCBcDW1udg7TdCARfHdf1DT04UXPe1+GFNhnTEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AYdtKhDp+k4paR5zvgqi9VsGppBRAUtVXvPR72DlKk=;
 b=KVmYxzykA43EhwGINWc1hnVRQ1qP38CKX1LuCS9CoJDm3GTu6NTpWczVbXQu1w+1hcuwypYsTfJf3VpE3ZD4qAAU6UrbPI17OT5y71Hlx056wrdqOcu/ka5yHNcrl56BPtZtlYD4D5fqtSpr0te/k7mLntuh6K432Cf3OwCZh7LKQL/QDaLwBi0gjxxGdFxDfky0SEzxs4DcP4iMEeuAfNCGFoF8+zWsbkInSgcPNiVlh5nF8wRdVvNu+Jh7rIaF57FyqLBsXXe5oSFf4k9br78/9yYGcbNFhTvvlvggMonodIaFr/InABzeVC4mo5tAadIjMsnco0ogG1Ca3OLLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AYdtKhDp+k4paR5zvgqi9VsGppBRAUtVXvPR72DlKk=;
 b=ALx2oklXtP9iLaeTIv4P/RKwZaD7nAdY+dGnTePhXIDNKSBc1REltJQZLp/OQqSHNTSjuemgxy9qlXt/NCbpRBkKDhnpr7+DZRMiAUwMswEXiBN3QRlTqEQUXlsdWnkl8mfyMEvnCFmBHdH2Fiz6IvCBmOa98jKu1XThYxuhkzg=
Received: from BN6PR11CA0060.namprd11.prod.outlook.com (2603:10b6:404:f7::22)
 by DM6PR12MB3899.namprd12.prod.outlook.com (2603:10b6:5:149::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 09:09:44 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::b5) by BN6PR11CA0060.outlook.office365.com
 (2603:10b6:404:f7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:44 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:43 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 20/24] drm/amdkfd: CRIU Discover svm ranges
Date: Thu, 3 Feb 2022 04:09:14 -0500
Message-ID: <20220203090918.11520-21-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf05215d-7bde-4b64-7d47-08d9e6f4eb91
X-MS-TrafficTypeDiagnostic: DM6PR12MB3899:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3899253DE5075F53C4ED8DDEFE289@DM6PR12MB3899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBNFtLiWXhs9MVOKGYXFqA/BjAPBkB2ZgQvPoTdms1zflp9MLKTEDxYJsKt0zwyikrNbcwU9McHo64YO50H2oWeT47P+AnlvfOtEHRXuK3KNbcGdOWQgJg/p9kn20+SyRw/GGWr8k0OxlCD3JnuC//vc6NeRVbPVU/5RzQsocC9IdsG8fjgOcggSdxwBVx1+xabUkOVfLDISvd0HKE8uXGyPb/sK8jdPbrQwOTEV6lCFnQ6ECz84YM809UgVSb9OMVpMkbWEIHMxzHVtd9l5QeC9l/lS0Fv7VH3VKbYJKSRSv5f5A2p4p54W+N68kuTzu5NzMiD2lrWf+7eWSKymt4v2gZsgw7B774K4rwDAaQ0QOftMWuzyvRw+iqdbBHIo+f32kgkt87Ma0mESYiYQ2/YURKQR02cqEChz8mj5b3nuZ7hrJavZD3z0DiqzCqBGO+DFTwoJLQR2pT6UvVIX+bIdFXgF5vnoYwquW+L/htEdx1jJ9W6VmcqtUxoz9qTolgbtjXRFVuVIz4w3PzdqZLw2LxkRy8CFe7iFEhCQryZvG8F/40HOVJ+eMv/SZWovTUdkS7pyJvcvYKszjIkAJUSf4js6eSHSNNEQq0qql8v2cwLjBDMFaFijIPRFZPhC9quoToVe2u8k/JXrzWihJ+oGUd1GOalXCs1DFI7g21eEtDEauQwJJlt73IOQQ7WS/KNMjjtGxLT5IshWEyB19w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(16526019)(26005)(8676002)(336012)(426003)(47076005)(86362001)(186003)(450100002)(2906002)(4326008)(44832011)(36860700001)(1076003)(2616005)(70206006)(70586007)(83380400001)(5660300002)(8936002)(36756003)(81166007)(54906003)(6916009)(82310400004)(356005)(7696005)(6666004)(40460700003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:44.7600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf05215d-7bde-4b64-7d47-08d9e6f4eb91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3899
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A KFD process may contain a number of virtual address ranges for shared
virtual memory management and each such range can have many SVM
attributes spanning across various nodes within the process boundary.
This change reports the total number of such SVM ranges and
their total private data size by extending the PROCESS_INFO op of the the
CRIU IOCTL to discover the svm ranges in the target process and a future
patches brings in the required support for checkpoint and restore for
SVM ranges.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 59 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 11 +++++
 4 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 3ec44f71307d..a755ea68a428 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2099,10 +2099,9 @@ static int criu_get_process_object_info(struct kfd_process *p,
 					uint32_t *num_objects,
 					uint64_t *objs_priv_size)
 {
-	int ret;
-	uint64_t priv_size;
+	uint64_t queues_priv_data_size, svm_priv_data_size, priv_size;
 	uint32_t num_queues, num_events, num_svm_ranges;
-	uint64_t queues_priv_data_size;
+	int ret;
 
 	*num_devices = p->n_pdds;
 	*num_bos = get_process_num_bos(p);
@@ -2112,7 +2111,10 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		return ret;
 
 	num_events = kfd_get_num_events(p);
-	num_svm_ranges = 0; /* TODO: Implement SVM-Ranges */
+
+	ret = svm_range_get_info(p, &num_svm_ranges, &svm_priv_data_size);
+	if (ret)
+		return ret;
 
 	*num_objects = num_queues + num_events + num_svm_ranges;
 
@@ -2122,7 +2124,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
 		priv_size += queues_priv_data_size;
 		priv_size += num_events * sizeof(struct kfd_criu_event_priv_data);
-		/* TODO: Add SVM ranges priv size */
+		priv_size += svm_priv_data_size;
 		*objs_priv_size = priv_size;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 903ad4a263f0..715dd0d4fac5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1082,7 +1082,10 @@ enum kfd_criu_object_type {
 
 struct kfd_criu_svm_range_priv_data {
 	uint32_t object_type;
-	uint32_t reserved;
+	uint64_t start_addr;
+	uint64_t size;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
 };
 
 struct kfd_criu_queue_priv_data {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index d34508f5e88b..64cd7712c098 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3481,6 +3481,65 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size)
+{
+	uint64_t total_size, accessibility_size, common_attr_size;
+	int nattr_common = 4, nattr_accessibility = 1;
+	int num_devices = p->n_pdds;
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	uint32_t count = 0;
+
+	*svm_priv_data_size = 0;
+
+	svms = &p->svms;
+	if (!svms)
+		return -EINVAL;
+
+	mutex_lock(&svms->lock);
+	list_for_each_entry(prange, &svms->list, list) {
+		pr_debug("prange: 0x%p start: 0x%lx\t npages: 0x%llx\t end: 0x%llx\n",
+			 prange, prange->start, prange->npages,
+			 prange->start + prange->npages - 1);
+		count++;
+	}
+	mutex_unlock(&svms->lock);
+
+	*num_svm_ranges = count;
+	/* Only the accessbility attributes need to be queried for all the gpus
+	 * individually, remaining ones are spanned across the entire process
+	 * regardless of the various gpu nodes. Of the remaining attributes,
+	 * KFD_IOCTL_SVM_ATTR_CLR_FLAGS need not be saved.
+	 *
+	 * KFD_IOCTL_SVM_ATTR_PREFERRED_LOC
+	 * KFD_IOCTL_SVM_ATTR_PREFETCH_LOC
+	 * KFD_IOCTL_SVM_ATTR_SET_FLAGS
+	 * KFD_IOCTL_SVM_ATTR_GRANULARITY
+	 *
+	 * ** ACCESSBILITY ATTRIBUTES **
+	 * (Considered as one, type is altered during query, value is gpuid)
+	 * KFD_IOCTL_SVM_ATTR_ACCESS
+	 * KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE
+	 * KFD_IOCTL_SVM_ATTR_NO_ACCESS
+	 */
+	if (*num_svm_ranges > 0) {
+		common_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			nattr_common;
+		accessibility_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			nattr_accessibility * num_devices;
+
+		total_size = sizeof(struct kfd_criu_svm_range_priv_data) +
+			common_attr_size + accessibility_size;
+
+		*svm_priv_data_size = *num_svm_ranges * total_size;
+	}
+
+	pr_debug("num_svm_ranges %u total_priv_size %llu\n", *num_svm_ranges,
+		 *svm_priv_data_size);
+	return 0;
+}
+
 int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 949b477e2f4c..f052b6022e76 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -183,6 +183,8 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 void svm_range_free_dma_mappings(struct svm_range *prange);
 void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm,
 			void *owner);
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -220,6 +222,15 @@ static inline int svm_range_schedule_evict_svm_bo(
 	return -EINVAL;
 }
 
+static inline int svm_range_get_info(struct kfd_process *p,
+				     uint32_t *num_svm_ranges,
+				     uint64_t *svm_priv_data_size)
+{
+	*num_svm_ranges = 0;
+	*svm_priv_data_size = 0;
+	return 0;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
-- 
2.17.1

