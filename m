Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6E71124F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE08910E702;
	Thu, 25 May 2023 17:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AAB10E6F1;
 Thu, 25 May 2023 17:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npTAxqW8c3jmlf3OB1U21nu4AMp41qDBXPeYqGgFJyIwQGIShbEmvILoAL1fd4Pe7TnmapF/vb6O8YnMwX4HXxq84iqDN0dSDJC4XQSyekZh5Ert8d/M4xBTOsgTyWVdBbEMWbQFiQA+65C36Dlo3OBNcgoruaSFacozyLLkrHhsSGDSl4zatz3jPDyO/oLmu6kR8O7RhM4D+t2ImLZOIWnScu1rOGff3eG5XsZmJquluXdhz6v6T1Yh9iZsU0jbxva/D8ssASWWRwMdGiSSN+u8zKInt/2c0tTjC0vIrmzMTzQRiEQlueTEgqOcXtxlmhGQ6Og8ArcudI1NyS+w1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYwezkkvYHNz5T2rFFyi46qde4DNgg/26ZhuOvP99LY=;
 b=dXqs7J66r1l7GQU3OdXwUfXAe5s4w1/XEij14UW5c03TzM8dj142znmhhlP17uthaCfSBDV/1TR2DeMVTYLQ2OryevVBdSK41Jqdqorrqfx6d1rqqLxl4RQSHFE1HHFpCT05nEP1yUUNtGth0dc/GSo4L6ifje05df09vibKDywSktLl0tgs3cstekcJgxsFnia37LphG+DHt9hvA69o1OamaYJzvULdcNkVud8qPw0LqYno5zU9UyR62K4fQsBRqakq2ZDZTp5Fy7cqhSI8fUieHD3KlWut6V4kwytEqXOTQLCzyyJ4Pl8cqJ6BkWRNMTwI7UeAefkvF4/H7iQoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYwezkkvYHNz5T2rFFyi46qde4DNgg/26ZhuOvP99LY=;
 b=LNO4mvRDivTwKQPeWWaAZCCk3QOTuwFl1fr0sTeMRoAqSS/2SU19ytZKgnJrKO9y5GEx/n8fYqc+ngs+De2FAfpKscDL1v5HydLGV6qKDO87MBviLVJoztUgqg+sGXRJ3eVuRZdOel7cxBa7ZzwrhLAj/r6Kk87YBxrytr2wGeY=
Received: from MW4PR03CA0144.namprd03.prod.outlook.com (2603:10b6:303:8c::29)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 17:28:10 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::5d) by MW4PR03CA0144.outlook.office365.com
 (2603:10b6:303:8c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:09 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:08 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 32/33] drm/amdkfd: add debug device snapshot operation
Date: Thu, 25 May 2023 13:27:44 -0400
Message-ID: <20230525172745.702700-32-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 9272ab1a-b237-4c82-01dd-08db5d4568b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQm6U2W/hHgqoQmlnDcSm/uwcXE0qfSULXpn1YRvVaLm91QyOh2v3lZS2wVBivqr5h6DhniMlbFol4rPX7Cg42YAcGo/vGrtV0C9ANxy/PhznLkc33sy1/gyzagNIjCkOwJaVSprlgvrMnEcHys/Bg6vHuUwPbmYwEfTYUNDiZ2X2rTvPFY2zO+iAbYI0jsnmO7HU7uR/EH6OzSkzqpOqRKCgx5ETOKX6yN9AQ+aF5B5icjMNthW1Vg57O57o/NMxQYDBb+wg6UHpX7l1T7psb1dsX3MU59FO0HAI8teOPfPQQXpz993ZlYsdlSIzDDM6tij6WfXJ9daOWyJwxJELChDfG4jBBRboO5WeXmB2w3kmtQxVYLMGuZaLFxZ1M1M+yZA462VMHowYkq3lM+0O5iP1DGOtL2+ALpgh/arWu0Jt8TRzDhD0Y/9EI7ekPJwTrn7g3eMaPjlud8hDfsE6wQXBFok3Qf7HrpM0qSonzFCtZxtfvWZpPEMp/lsfdmp+jVFeULYkqvjQXkOVjh45vyBBLjAoNwkIXnCfI2ivf1faeb7H6bPSr0NBlCDiwrRl+ZfwnlRmcOq69sJL3UXFHrEf5cctNmdRydXsZ2MBWGEE+hRnOyldDbsHYKmG8LI7Wso0Dotm6zntV8nPEty5BxnjolpDBPDo0BTWTRtAZpryMHgsC2Ju3pd7LU9I873i7HrQ3mQahLc8jXWIpuE6XH0sLGOOCkaGIz8Bz2FJaXms1XtC6SXXlU8M5lLn9/9aq/rnfXQ/mQ6N5JTs1RCVw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(336012)(82310400005)(110136005)(4326008)(6636002)(70206006)(478600001)(86362001)(70586007)(6666004)(41300700001)(316002)(7696005)(450100002)(5660300002)(8936002)(8676002)(44832011)(40460700003)(26005)(1076003)(81166007)(356005)(82740400003)(40480700001)(186003)(16526019)(2906002)(36756003)(83380400001)(36860700001)(426003)(2616005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:09.2667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9272ab1a-b237-4c82-01dd-08db5d4568b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to queue snapshot, return an array of device information using
an entry_size check and return.
Unlike queue snapshots, the debugger needs to pass to correct number of
devices that exist.  If it fails to do so, the KFD will return the
number of actual devices so that the debugger can make a subsequent
successful call.

v2: add num_xcc to device snapshot and fixup new kfd_node reference

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 73 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  5 ++
 3 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index b24a73fd53af..f522325b409b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3060,8 +3060,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				&args->queue_snapshot.entry_size);
 		break;
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
-		pr_warn("Debug op %i not supported yet\n", args->op);
-		r = -EACCES;
+		r = kfd_dbg_trap_device_snapshot(target,
+				args->device_snapshot.exception_mask,
+				(void __user *)args->device_snapshot.snapshot_buf_ptr,
+				&args->device_snapshot.num_devices,
+				&args->device_snapshot.entry_size);
 		break;
 	default:
 		pr_err("Invalid option: %i\n", args->op);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 24e2b285448a..125274445f43 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -22,6 +22,7 @@
 
 #include "kfd_debug.h"
 #include "kfd_device_queue_manager.h"
+#include "kfd_topology.h"
 #include <linux/file.h>
 #include <uapi/linux/kfd_ioctl.h>
 
@@ -1010,6 +1011,78 @@ int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
 	return r;
 }
 
+int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
+		uint64_t exception_clear_mask,
+		void __user *user_info,
+		uint32_t *number_of_device_infos,
+		uint32_t *entry_size)
+{
+	struct kfd_dbg_device_info_entry device_info;
+	uint32_t tmp_entry_size = *entry_size, tmp_num_devices;
+	int i, r = 0;
+
+	if (!(target && user_info && number_of_device_infos && entry_size))
+		return -EINVAL;
+
+	tmp_num_devices = min_t(size_t, *number_of_device_infos, target->n_pdds);
+	*number_of_device_infos = target->n_pdds;
+	*entry_size = min_t(size_t, *entry_size, sizeof(device_info));
+
+	if (!tmp_num_devices)
+		return 0;
+
+	memset(&device_info, 0, sizeof(device_info));
+
+	mutex_lock(&target->event_mutex);
+
+	/* Run over all pdd of the process */
+	for (i = 0; i < tmp_num_devices; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+		struct kfd_topology_device *topo_dev = kfd_topology_device_by_id(pdd->dev->id);
+
+		device_info.gpu_id = pdd->dev->id;
+		device_info.exception_status = pdd->exception_status;
+		device_info.lds_base = pdd->lds_base;
+		device_info.lds_limit = pdd->lds_limit;
+		device_info.scratch_base = pdd->scratch_base;
+		device_info.scratch_limit = pdd->scratch_limit;
+		device_info.gpuvm_base = pdd->gpuvm_base;
+		device_info.gpuvm_limit = pdd->gpuvm_limit;
+		device_info.location_id = topo_dev->node_props.location_id;
+		device_info.vendor_id = topo_dev->node_props.vendor_id;
+		device_info.device_id = topo_dev->node_props.device_id;
+		device_info.revision_id = pdd->dev->adev->pdev->revision;
+		device_info.subsystem_vendor_id = pdd->dev->adev->pdev->subsystem_vendor;
+		device_info.subsystem_device_id = pdd->dev->adev->pdev->subsystem_device;
+		device_info.fw_version = pdd->dev->kfd->mec_fw_version;
+		device_info.gfx_target_version =
+			topo_dev->node_props.gfx_target_version;
+		device_info.simd_count = topo_dev->node_props.simd_count;
+		device_info.max_waves_per_simd =
+			topo_dev->node_props.max_waves_per_simd;
+		device_info.array_count = topo_dev->node_props.array_count;
+		device_info.simd_arrays_per_engine =
+			topo_dev->node_props.simd_arrays_per_engine;
+		device_info.num_xcc = NUM_XCC(pdd->dev->xcc_mask);
+		device_info.capability = topo_dev->node_props.capability;
+		device_info.debug_prop = topo_dev->node_props.debug_prop;
+
+		if (exception_clear_mask)
+			pdd->exception_status &= ~exception_clear_mask;
+
+		if (copy_to_user(user_info, &device_info, *entry_size)) {
+			r = -EFAULT;
+			break;
+		}
+
+		user_info += tmp_entry_size;
+	}
+
+	mutex_unlock(&target->event_mutex);
+
+	return r;
+}
+
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 234e2ccafa87..a289e59ceb79 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -81,6 +81,11 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
 }
 
 void debug_event_write_work_handler(struct work_struct *work);
+int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
+		uint64_t exception_clear_mask,
+		void __user *user_info,
+		uint32_t *number_of_device_infos,
+		uint32_t *entry_size);
 
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask);
-- 
2.25.1

