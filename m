Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B0147DC45
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D2E10E1F1;
	Thu, 23 Dec 2021 00:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C3510E187;
 Thu, 23 Dec 2021 00:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeK+s1372GI7btBwyA8QxtAStan98XRFcEhci1phq+Ifgod9LMVpfzcneAkaVsPQGZGP7Jq2oEyEFFMgCOqczYUZFxf6HWbCNxT9mxgBgGYiRhByODb8OM5sU4WeEY3WKVBZPUbdJVtsiK28AJNnFZ4C5ytzQ4SOogAoCktvcaZyq3HkMSftD+DqKACiOLCwYnSd/7JNBgAiX+UroNHwivJM6PucGxaeVNxL284/DOMSq3CmD6QdyYNg0kryrSKQlegxiBD7ECAU/A2OjR5Fdk3lr9s1bQ0i9d32aiULUdYfmGx8KXqOUrb1k52wJSBoXjQIcHiYgIr6jKI3+vuKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgCn5kI6shg89Rm0S3e1u66+U7AG3jotlSQzLPEcHnE=;
 b=hQySPZ0K7GYZIr9LiCjos5w0MDUmUFrjI9KOLhgGVbltYSDEih//en+bb4sBBn3qXRM0UmB/V6Gga8be2c9DkXrXHmqHg06ZNXx+5n2nVq27086tXlMIbN3zs2KE3Zusu/lkZ8GJKN69iGToGW+I6zZQvPIPhN1ENQep1DJwEvXF9V01cvJHcx54alspxPcZD64fbYtBzGKmwBKeNx3tVTApJ6LZWE6xQPwqoCYYon+JnQDDGkdkFuYGashSWKO1emlIothjXlmnBJGMLWANNYh0z5thlZ2jWGI1GYqtGmkN2QoTQ8u5jXWU17pabe04FY7RvRb3PCHqDqqAYejkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgCn5kI6shg89Rm0S3e1u66+U7AG3jotlSQzLPEcHnE=;
 b=0WONvoXtOUHSH9yGKLrSthgZOh4Xqg6gJY4BlgMXc+gTEMUgT83F8xUiZAgPcCFnhzHiDpt0Do4xGQ4iRIiAbxppZKzSEs2Fl9jE+pnctR3tmrT/9dSGinTUjVGfPq+v0vwxDf38vjFPbSpPWD92bpBClXW1KrLxzPohE38KwiQ=
Received: from BN9PR03CA0523.namprd03.prod.outlook.com (2603:10b6:408:131::18)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 00:37:36 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::6e) by BN9PR03CA0523.outlook.office365.com
 (2603:10b6:408:131::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:36 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:35 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 19/24] drm/amdkfd: CRIU allow external mm for svm ranges
Date: Wed, 22 Dec 2021 19:37:06 -0500
Message-ID: <20211223003711.13064-20-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ca949fc-10a2-4415-789d-08d9c5ac6aa7
X-MS-TrafficTypeDiagnostic: CH2PR12MB4280:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4280CE06973636547F2B7473FE7E9@CH2PR12MB4280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTtOfjMxR/6UTr4KOrQg8UbHhT/BE4tgItTgMpT6vvLjdVByFkfs4hUPyR4VXRIpspRdRXGoNPh+4RsT1PlFZXkAwEqDHcjWx9o25jXD7VWLZt39OeRJDhZ8GPqi+A6PR9gJqekcvLs1B7n5IpVZtXRmCJDAy7YI7dGNFoUqbY5jilrIqLgpbL0BS6TWaFt/gl0ZQ84i7m5XLmAHu/ljR4yA8NTBLnVaKfmsWL3O2Dh1umXQDLUi9ypWyRtUeOl80ZBtNQavIdlTWDCvJGMeHDvOunQlFtQmDZJspETLg12kZZ0wPDgu/6gvSa9xR+Wa39pupTjo6at0lyPWfI2T8Xc46iBxsa2jd7rStZFWYS5H2S/5bnVYnZm5IL7psCQ/bR4l+CVj2am6xmKFR/lQgtHlUneoOx6HfRgceCLKyBZB7gmBBDvwUR7OiayVw9mBnIY3Dg/N16eDJv8Op5N8cBfWkIkD11d4D61pcvkPVsh/zwScc04DJRUJEcdYIXhtzUFtmsg+XNCtNUbzT5WIHT2uttcSLoV35KyTGXEc6M8qPwezAInwuUfQJGx/CylybqFnjSpzfRDhejD3UCGKM7k3asLz+mqdZ107qbY1xLaWDaW6b1047JRzrkbku+AJ5rw9j9qVDWlcq6Wc5GMApfOeV8HDkr2Vd+teFfVQGxClfVX3xPy764rWaqELeUZpfJklOnXsrZW2ZGHNO5miQd/ftVLUe4wr6mnszoRzeghptCR6/dvYTZuzHG5Bu1KUIlaBPUI+6z5OKJjp9hvvRQBZznmujoIGMdxq8YLbls4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(5660300002)(1076003)(2616005)(186003)(70206006)(54906003)(82310400004)(36756003)(83380400001)(81166007)(86362001)(70586007)(6666004)(36860700001)(356005)(426003)(336012)(40460700001)(44832011)(47076005)(7696005)(8676002)(4326008)(508600001)(2906002)(26005)(110136005)(8936002)(316002)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:36.3574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca949fc-10a2-4415-789d-08d9c5ac6aa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280
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

Both svm_range_get_attr and svm_range_set_attr helpers use mm struct
from current but for a Checkpoint or Restore operation, the current->mm
will fetch the mm for the CRIU master process. So modify these helpers to
accept the task mm for a target kfd process to support Checkpoint
Restore.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 88360f23eb61..7c92116153fe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3134,11 +3134,11 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 }
 
 static int
-svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
-		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
+		   uint64_t start, uint64_t size, uint32_t nattr,
+		   struct kfd_ioctl_svm_attribute *attrs)
 {
 	struct amdkfd_process_info *process_info = p->kgd_process_info;
-	struct mm_struct *mm = current->mm;
 	struct list_head update_list;
 	struct list_head insert_list;
 	struct list_head remove_list;
@@ -3242,8 +3242,9 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 }
 
 static int
-svm_range_get_attr(struct kfd_process *p, uint64_t start, uint64_t size,
-		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
+		   uint64_t start, uint64_t size, uint32_t nattr,
+		   struct kfd_ioctl_svm_attribute *attrs)
 {
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
@@ -3253,7 +3254,6 @@ svm_range_get_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	bool get_accessible = false;
 	bool get_flags = false;
 	uint64_t last = start + size - 1UL;
-	struct mm_struct *mm = current->mm;
 	uint8_t granularity = 0xff;
 	struct interval_tree_node *node;
 	struct svm_range_list *svms;
@@ -3422,6 +3422,7 @@ int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
 {
+	struct mm_struct *mm = current->mm;
 	int r;
 
 	start >>= PAGE_SHIFT;
@@ -3429,10 +3430,10 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 
 	switch (op) {
 	case KFD_IOCTL_SVM_OP_SET_ATTR:
-		r = svm_range_set_attr(p, start, size, nattrs, attrs);
+		r = svm_range_set_attr(p, mm, start, size, nattrs, attrs);
 		break;
 	case KFD_IOCTL_SVM_OP_GET_ATTR:
-		r = svm_range_get_attr(p, start, size, nattrs, attrs);
+		r = svm_range_get_attr(p, mm, start, size, nattrs, attrs);
 		break;
 	default:
 		r = EINVAL;
-- 
2.17.1

