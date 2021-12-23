Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B047DC16
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A210E140;
	Thu, 23 Dec 2021 00:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB9F10E140;
 Thu, 23 Dec 2021 00:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8E9mKojGQEbZovHMc1klgah5sM2gTzF2idfKoeZbyXKwzpTg9g/S4YdD2g2sJM7W28FeuWuvwEvHxQpgORgeiqYuSISIIiJrmTQOCTKfLWj2+jhbog+892uygpGPGJLP31bMM2PxNQRaoywIOq+zJgPsnED9ivrfSKlDSQYbgcmIOj8joP+3cvtzalsMq/UfCi4Jq6/wiG/R4uw/CJGOpHvPeQra/hLzRS52OaAsBNDo+Rvt5wCqSa0Zc6vib4wA+8MVf7bPWbFGVgkuuRpVNo0SLIbP8OeMgMYpRu0RqwMt3kUuhSUCIFiWtzanMjjCu+rqgG5RZ5MB/CqT0Dj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zYVNg3SbHh/7gdm9rc/mEZ3fPDkc+g0Jjnp38LUSMw=;
 b=FGbGrDpBMeyxkWuYxWpfpqrQFCcwlDyetYQBFDnKjYs12KwjKKdL197uQ5epIYFCWdq1IxIkx0/2WFlZiolcJitrEnUXLTaRzdOjhTsbK0KCkmb39oE9Cx2IEcbxqVMLxVx0EyYO0gUwqzanTw0WulfaOEyYCp13KuX0YJd5yw26VRskZy16ApYgj4GRUCMfTMKKezCZBAIyjNTcKXEM4rtCsnpXOVmEWFtVFd6KdaOwYRYmDzsnB8ndVGm/bW7pdqELusVzV7VK8peJbv6CWu42k3p97YftDoIwpaFRBGZlnWZLnK61aPMO86+blin36c/9sVJj4IgRX4WTrISXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zYVNg3SbHh/7gdm9rc/mEZ3fPDkc+g0Jjnp38LUSMw=;
 b=I2BjYkpvtN+r+RIkW1ptswt2qq17qgB+lMrKPFpsJk5nUxRFrPDAJE7mDj1eu/cNS0RbJNKuXU2paM68X9DaHG2/UOVsChTqu04RsTXC2d2TC+RuRVueEE/XqoA+9xOuSSpaTXiXumdQrvisuFrFuSiw6s+wXhKmwwX6In8nxuU=
Received: from BN6PR2001CA0044.namprd20.prod.outlook.com
 (2603:10b6:405:16::30) by BL0PR12MB5540.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 00:37:27 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::8d) by BN6PR2001CA0044.outlook.office365.com
 (2603:10b6:405:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:26 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:26 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 03/24] drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
Date: Wed, 22 Dec 2021 19:36:50 -0500
Message-ID: <20211223003711.13064-4-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: e2027546-3dee-47f3-1062-08d9c5ac650d
X-MS-TrafficTypeDiagnostic: BL0PR12MB5540:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB5540FB97227FE79E03478FFFFE7E9@BL0PR12MB5540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIpgU9PJrVY7uWLKYT2Ld19ZRig7wFrvnTF0s55SofntexC2hPib9NKheIbIL7lbR5j1K9caEaKGqa6Y8RJcHNnssvEaxDp7q3v1bPo9mGTmFlUf1c8vqadJqBCqTWPmvFG5+tz9Nn9IKLSCPXfB9qewDZtNTVavhygYEzZVUTfJv/Arn71nOEGG9HBGzQfzI+DRnGBgIHdtmxvavxLYErDO3qhVC01l1PuDo5p6Sb8pMTHICaaghaM9PgNWCyoBYLNmJrzxgfUobNM8Fc6e5z824urqBABRnT3sSD6wud/XhkTHh4uKOapjQxQRzcmThAycEEGJDP3V2ktYUH47dnIqFR1Ub82+D5ZFM8kBd2RnvF2o+Jx5u8QXwRjbXRde3c1lnGEgfmXpjXTOXDN99+jbR7tkb/Sg4sGa87ycKkIZzYJn5LNJvaoIyBwarDHSu+kJR+tr83/BxedR2eadfgNG+3fFgpedLgFv6IFvBvj8K7rn3fb6PogKn1VpwUmCqnIRQgWBhfvxKOdBQzw4IQUX4ogqauBtlDEO8CMxlpTSVePLwLwi38M+ylYeCshbEREllce2Ivy3NBhMYYnhmaUUmA/ITC/zPfTYDddyQg4FQCBlOXOdbZivgQBOdHQ/YR49q1JT+Hn0kg1WUCTLnRhucswKDnYiXZhYO3ampqNHVI6HnrVhIxpR+QRfSAVqzhNMvVEUEUZNT9MX5qNJnui2HHACNaDHY9e/L+QyU8SGT1r1z50dWFfv26roTZiRC9pIWCOpZULUXhyjmtdy27smYL2UziYJb0hpq4QRM0sblZ8M+kicj5bZGIcbKxOSHcbZpg37y4q6g4bjH+OV61tmK1/KuVe6ZwFSkYMQ0iI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(44832011)(186003)(1076003)(81166007)(36860700001)(16526019)(426003)(26005)(40460700001)(336012)(70206006)(2616005)(70586007)(508600001)(5660300002)(356005)(83380400001)(2906002)(7696005)(316002)(47076005)(8936002)(86362001)(110136005)(36756003)(30864003)(4326008)(82310400004)(8676002)(54906003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:26.9568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2027546-3dee-47f3-1062-08d9c5ac650d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5540
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

Checkpoint-Restore in userspace (CRIU) is a powerful tool that can
snapshot a running process and later restore it on same or a remote
machine but expects the processes that have a device file (e.g. GPU)
associated with them, provide necessary driver support to assist CRIU
and its extensible plugin interface. Thus, In order to support the
Checkpoint-Restore of any ROCm process, the AMD Radeon Open Compute
Kernel driver, needs to provide a set of new APIs that provide
necessary VRAM metadata and its contents to a userspace component
(CRIU plugin) that can store it in form of image files.

This introduces some new ioctls which will be used to checkpoint-Restore
any KFD bound user process. KFD doesn't allow any arbitrary ioctl call
unless it is called by the group leader process. Since these ioctls are
expected to be called from a KFD criu plugin which has elevated ptrace
attached privileges and CAP_CHECKPOINT_RESTORE capabilities attached with
the file descriptors so modify KFD to allow such calls.

(API redesigned by David Yat Sin)
Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 94 +++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    | 65 +++++++++++++++-
 include/uapi/linux/kfd_ioctl.h           | 79 +++++++++++++++++++-
 3 files changed, 235 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 4bfc0c8ab764..1b863bd84c96 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -33,6 +33,7 @@
 #include <linux/time.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
+#include <linux/ptrace.h>
 #include <linux/dma-buf.h>
 #include <asm/processor.h>
 #include "kfd_priv.h"
@@ -1856,6 +1857,75 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 }
 #endif
 
+static int criu_checkpoint(struct file *filep,
+			   struct kfd_process *p,
+			   struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_restore(struct file *filep,
+			struct kfd_process *p,
+			struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_unpause(struct file *filep,
+			struct kfd_process *p,
+			struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_resume(struct file *filep,
+			struct kfd_process *p,
+			struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_process_info(struct file *filep,
+				struct kfd_process *p,
+				struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_criu_args *args = data;
+	int ret;
+
+	dev_dbg(kfd_device, "CRIU operation: %d\n", args->op);
+	switch (args->op) {
+	case KFD_CRIU_OP_PROCESS_INFO:
+		ret = criu_process_info(filep, p, args);
+		break;
+	case KFD_CRIU_OP_CHECKPOINT:
+		ret = criu_checkpoint(filep, p, args);
+		break;
+	case KFD_CRIU_OP_UNPAUSE:
+		ret = criu_unpause(filep, p, args);
+		break;
+	case KFD_CRIU_OP_RESTORE:
+		ret = criu_restore(filep, p, args);
+		break;
+	case KFD_CRIU_OP_RESUME:
+		ret = criu_resume(filep, p, args);
+		break;
+	default:
+		dev_dbg(kfd_device, "Unsupported CRIU operation:%d\n", args->op);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret)
+		dev_dbg(kfd_device, "CRIU operation:%d err:%d\n", args->op, ret);
+
+	return ret;
+}
+
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
 			    .cmd_drv = 0, .name = #ioctl}
@@ -1959,6 +2029,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
 			kfd_ioctl_set_xnack_mode, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_OP,
+			kfd_ioctl_criu, KFD_IOC_FLAG_CHECKPOINT_RESTORE),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
@@ -1973,6 +2046,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	char *kdata = NULL;
 	unsigned int usize, asize;
 	int retcode = -EINVAL;
+	bool ptrace_attached = false;
 
 	if (nr >= AMDKFD_CORE_IOCTL_COUNT)
 		goto err_i1;
@@ -1998,7 +2072,15 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	 * processes need to create their own KFD device context.
 	 */
 	process = filep->private_data;
-	if (process->lead_thread != current->group_leader) {
+
+	rcu_read_lock();
+	if ((ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE) &&
+	    ptrace_parent(process->lead_thread) == current)
+		ptrace_attached = true;
+	rcu_read_unlock();
+
+	if (process->lead_thread != current->group_leader
+	    && !ptrace_attached) {
 		dev_dbg(kfd_device, "Using KFD FD in wrong process\n");
 		retcode = -EBADF;
 		goto err_i1;
@@ -2013,6 +2095,16 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		goto err_i1;
 	}
 
+	/*
+	 * Versions of docker shipped in Ubuntu 18.xx and 20.xx do not support
+	 * CAP_CHECKPOINT_RESTORE, so we also allow access if CAP_SYS_ADMIN as CAP_SYS_ADMIN is a
+	 * more priviledged access.
+	 */
+	if (unlikely(ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE)) {
+		if (!capable(CAP_CHECKPOINT_RESTORE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
+	}
+
 	if (cmd & (IOC_IN | IOC_OUT)) {
 		if (asize <= sizeof(stack_kdata)) {
 			kdata = stack_kdata;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 1d3f012bcd2a..e68f692362bb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -121,7 +121,26 @@
  */
 #define KFD_QUEUE_DOORBELL_MIRROR_OFFSET 512
 
-
+/**
+ * enum kfd_ioctl_flags - KFD ioctl flags
+ * Various flags that can be set in &amdkfd_ioctl_desc.flags to control how
+ * userspace can use a given ioctl.
+ */
+enum kfd_ioctl_flags {
+	/*
+	 * @KFD_IOC_FLAG_CHECKPOINT_RESTORE:
+	 * Certain KFD ioctls such as AMDKFD_IOC_CRIU_OP can potentially
+	 * perform privileged operations and load arbitrary data into MQDs and
+	 * eventually HQD registers when the queue is mapped by HWS. In order to
+	 * prevent this we should perform additional security checks.
+	 *
+	 * This is equivalent to callers with the CHECKPOINT_RESTORE capability.
+	 *
+	 * Note: Since earlier versions of docker do not support CHECKPOINT_RESTORE,
+	 * we also allow ioctls with SYS_ADMIN capability.
+	 */
+	KFD_IOC_FLAG_CHECKPOINT_RESTORE = BIT(0),
+};
 /*
  * Kernel module parameter to specify maximum number of supported queues per
  * device
@@ -1004,6 +1023,50 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 				  uint64_t tba_addr,
 				  uint64_t tma_addr);
 
+/* CRIU */
+/*
+ * Need to increment KFD_CRIU_PRIV_VERSION each time a change is made to any of the CRIU private
+ * structures:
+ * kfd_criu_process_priv_data
+ * kfd_criu_device_priv_data
+ * kfd_criu_bo_priv_data
+ * kfd_criu_queue_priv_data
+ * kfd_criu_event_priv_data
+ * kfd_criu_svm_range_priv_data
+ */
+
+#define KFD_CRIU_PRIV_VERSION 1
+
+struct kfd_criu_process_priv_data {
+	uint32_t version;
+};
+
+struct kfd_criu_device_priv_data {
+	/* For future use */
+	uint64_t reserved;
+};
+
+struct kfd_criu_bo_priv_data {
+	uint64_t reserved;
+};
+
+struct kfd_criu_svm_range_priv_data {
+	uint32_t object_type;
+	uint64_t reserved;
+};
+
+struct kfd_criu_queue_priv_data {
+	uint32_t object_type;
+	uint64_t reserved;
+};
+
+struct kfd_criu_event_priv_data {
+	uint32_t object_type;
+	uint64_t reserved;
+};
+
+/* CRIU - End */
+
 /* Queue Context Management */
 int init_queue(struct queue **q, const struct queue_properties *properties);
 void uninit_queue(struct queue *q);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index af96af174dc4..b5c297be081b 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -468,6 +468,80 @@ struct kfd_ioctl_smi_events_args {
 	__u32 anon_fd;	/* from KFD */
 };
 
+/**************************************************************************************************
+ * CRIU IOCTLs (Checkpoint Restore In Userspace)
+ *
+ * When checkpointing a process, the userspace application will perform:
+ * 1. PROCESS_INFO op to determine current process information
+ * 2. CHECKPOINT op to checkpoint process contents (BOs, queues, events, svm-ranges)
+ * 3. UNPAUSE op to un-evict all the queues
+ *
+ * When restoring a process, the CRIU userspace application will perform:
+ *
+ * 1. RESTORE op to restore process contents
+ * 2. RESUME op to start the process
+ *
+ * Note: Queues are forced into an evicted state after a successful PROCESS_INFO. If user
+ * application need to perform an UNPAUSE operation to complete or abort a checkpoint.
+ */
+
+enum kfd_criu_op {
+	KFD_CRIU_OP_PROCESS_INFO,
+	KFD_CRIU_OP_CHECKPOINT,
+	KFD_CRIU_OP_UNPAUSE,
+	KFD_CRIU_OP_RESTORE,
+	KFD_CRIU_OP_RESUME,
+};
+
+/**
+ * kfd_ioctl_criu_args - Arguments perform CRIU operation
+ * @devices:		[in/out] User pointer to memory location for devices information
+ * @bos:		[in/out] User pointer to memory location for BOs information
+ * @priv_data:		[in/out] User pointer to memory location for private data
+ * @priv_data_size:	[in/out] Size of priv_data in bytes
+ * @num_devices:	[in/out] Number of GPUs used by process
+ * @num_bos		[in/out] Number of BOs used by process
+ * @num_objects:	[in/out] Number of objects used by process. Objects are opaque to
+ *				 user application
+ * @pid:		[in/out] PID of the process being checkpointed/restored
+ * @op			[in] Type of operation (kfd_criu_op)
+ *
+ * Takes and releases process lock.
+ * Return: 0 on success, -errno on failure
+ */
+struct kfd_ioctl_criu_args {
+	__u64 devices;		/* Used during ops: CHECKPOINT, RESTORE */
+	__u64 bos;		/* Used during ops: CHECKPOINT, RESTORE */
+	__u64 priv_data;	/* Used during ops: CHECKPOINT, RESTORE */
+	__u64 priv_data_size;	/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 num_devices;	/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 num_bos;		/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 num_objects;	/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 pid;		/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 op;
+};
+
+struct kfd_criu_device_bucket {
+	__u32 user_gpu_id;
+	__u32 actual_gpu_id;
+	__u32 drm_fd;
+	__u32 pad;
+};
+
+struct kfd_criu_bo_bucket {
+	__u64 addr;
+	__u64 size;
+	__u64 offset;
+	__u64 restored_offset;    /* During restore, updated offset for BO */
+	__u32 gpu_id;
+	__u32 alloc_flags;
+	__u32 dmabuf_fd;
+	__u32 pad;
+};
+
+/* CRIU IOCTLs - END */
+/**************************************************************************************************/
+
 /* Register offset inside the remapped mmio page
  */
 enum kfd_mmio_remap {
@@ -742,7 +816,10 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_SET_XNACK_MODE		\
 		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
 
+#define AMDKFD_IOC_CRIU_OP			\
+		AMDKFD_IOWR(0x22, struct kfd_ioctl_criu_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x22
+#define AMDKFD_COMMAND_END		0x23
 
 #endif
-- 
2.17.1

