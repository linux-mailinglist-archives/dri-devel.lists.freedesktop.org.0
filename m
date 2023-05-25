Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B64711239
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F09310E6EE;
	Thu, 25 May 2023 17:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877E510E49C;
 Thu, 25 May 2023 17:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgPuAhFeUCuqjqlVSakfri1bonE3m8v7aLywNF4aFhZRAmU+9aiZCtsyS9KLcKS43IlhW0ZOz8vXQ+NuKZf/8BulPqw0bC5l8sLVNusqMra7B+9OS6EtvIp70/rNHWvZsSdEmolYIBPKagwlQNpEHD8/C89gdAzo04nPIajWhbXrZNEA3YYQbBigjDFseSEF7ysGxY/dHb9isrE3uY1sUgeKESvNnLxwfS97xEP+TPtf/AzKOlGL2s+ok4LBzwJka5OAYe2PbOWW7zSKKT9q65LSd3dYLa6+Vpim3DwWCuSSreTAuihJDqi0Wzh4Kw0LfmCFz3upzx0AwqtdebfDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0C2u0Euk95LaqzQnFuz+SaFeHRm/mXj2zediAiytJY=;
 b=YfKIhkwtwaX9wotXttRL5iFF2sVjrM8WXvvrquoyG0E/ZEhTRlrf3Aj1mJQoDpnG2A7Sai32WERPTbR8T1kdpOZVy4ttIC/2mJrnrPIG1jvcraeIr6Wagwv5Uza2GUeSwVOTL8/6jD4PJmqR/MFF/3n6Cjaz8J84j6SZScrWngHrr/KwS3m4wLOENBW/5sSbJuLncnCuhJTKqSshtErZYfmeWn3XEznTHtxzs5LRozEZtYNbmobDusu9DLyqD6aIFy0qVhJJjSTh4uJ5YsHmG0IR3HVF7BIaV6HRUBOd2NcG6gfPLvBXnKi11usCkUG+FtoThMNH5Jy1yrqfT5eFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0C2u0Euk95LaqzQnFuz+SaFeHRm/mXj2zediAiytJY=;
 b=3uYBbkYC+Q+eANMk7bYXpXzslHvYSU45tWQe1EndeyBKhI6Hw8cx46J836DmljNwC9z2Sp3zC5K/8LpbppoFM+g79r0uV747LWym25xhhTmDYlWPZx2T4Ap36jwqTvUH7EI5S7OnXh3TFq+eRqpDHpaXZJV6uPhW4XQItMzSbcM=
Received: from MW4PR03CA0130.namprd03.prod.outlook.com (2603:10b6:303:8c::15)
 by BL1PR12MB5191.namprd12.prod.outlook.com (2603:10b6:208:318::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:04 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::49) by MW4PR03CA0130.outlook.office365.com
 (2603:10b6:303:8c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 17:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:04 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:00 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 16/33] drm/amdkfd: add per process hw trap enable and disable
 functions
Date: Thu, 25 May 2023 13:27:28 -0400
Message-ID: <20230525172745.702700-16-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|BL1PR12MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: e15d81b3-033e-47ce-4880-08db5d4565a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SDoVGT8pB6NIFDVvs8w5y48NjGTKnu60Rr2gMlBiVCPCP0QDXt661IhqZpBVK7aXTjcqU7azFcSot1KREOlGIYgzebTm0dQ/9yJ6r17246/3DijiwaHwZ66AT46w2HOPDbJwwXst6B2/yoapB3+8Fvox2lCabcifE0SVh8S5dUHmYFI+sVRjLJRGaavZ4jZnG77ZdWb3D0VR5JYcaiaMX0HzKQ8Hj3uzkBjBGcFoCMouBJV30OPPkE3tisQ82nsHSX1uBQV38yJ2e78NEviwIYlpdKjYcw/iHNlv50kwdv1Pv/WTkwk3gR3o/8WKMx4aQxjIrD68hPNqLWtgehUO/bi3YQPpnKgbY0Dq35QsYj+K4gKlRX9wQl/xVh6XAAIQrsUIVo8All/VX7rTU0Ooh3N5J5JwgKEIlHg2oCbboWQo6JZHOiHuXRuNNRk+NXzxcaJPr3tqsJU+6BorqsPRs0bMaCwQshYzJnSwMY+x0kkrgH/jQzDpZbbFZlS8mcKPW4tQwDxOd+ZPp8VTjcYTcPehuA0HxDZEi6LKSd5Hyk1iIA6e5onhbsyTsO2eaEtRkcRY2SzNsEEEwt94fFFVtCO4YoYTe8ZiahD+n/Mbso9T2Fs5hJn/iOFJp1cZA+NgZmn8g7Eq1OHq7wmhqgZfAfCoboek8RNnSXNEO88AkuhwsXg38tNqVQ5Gm6evn2HO48QyCNCbJC+27kQRaBCXYHu0oyIoUKtgR4sBH9K6cZbS05KW4LhqMMSgudH0fH42650NGumwS6DrwrcJf8Jtg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(46966006)(36840700001)(40470700004)(110136005)(81166007)(82740400003)(70586007)(70206006)(82310400005)(478600001)(86362001)(450100002)(4326008)(6636002)(36860700001)(6666004)(7696005)(336012)(47076005)(426003)(83380400001)(356005)(316002)(41300700001)(2616005)(36756003)(16526019)(186003)(44832011)(30864003)(2906002)(26005)(1076003)(40480700001)(5660300002)(40460700003)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:04.1108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e15d81b3-033e-47ce-4880-08db5d4565a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5191
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

To enable HW debug mode per process, all devices must be debug enabled
successfully.  If a failure occures, rewind the enablement of debug mode
on the enabled devices.

A power management scenario that needs to be considered is HW
debug mode setting during GFXOFF.  During GFXOFF, these registers
will be unreachable so we have to transiently disable GFXOFF when
setting.  Also, some devices don't support the RLC save restore
function for these debug registers so we have to disable GFXOFF
completely during a debug session.

Cooperative launch also has debugging restriction based on HW/FW bugs.
If such bugs exists, the debugger cannot attach to a process that uses GWS
resources nor can GWS resources be requested if a process is being
debugged.

Multi-process debug devices can only enable trap temporaries based
on certain runtime scenerios, which will be explained when the
runtime enable functions are implemented in a follow up patch.

v2: spot fix with new kfd_node references

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 148 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  29 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  10 ++
 4 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 7082d5d0f0e9..9d0c247f80fe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1488,6 +1488,11 @@ static int kfd_ioctl_alloc_queue_gws(struct file *filep,
 		goto out_unlock;
 	}
 
+	if (!kfd_dbg_has_gws_support(dev) && p->debug_trap_enabled) {
+		retval = -EBUSY;
+		goto out_unlock;
+	}
+
 	retval = pqm_set_gws(&p->pqm, args->queue_id, args->num_gws ? dev->gws : NULL);
 	mutex_unlock(&p->mutex);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 898cc1fe3d13..73b07b5f17f1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -21,13 +21,78 @@
  */
 
 #include "kfd_debug.h"
+#include "kfd_device_queue_manager.h"
 #include <linux/file.h>
 
+static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
+{
+	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
+	uint32_t flags = pdd->process->dbg_flags;
+
+	if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
+		return 0;
+
+	return amdgpu_mes_set_shader_debugger(pdd->dev->adev, pdd->proc_ctx_gpu_addr, spi_dbg_cntl,
+						pdd->watch_points, flags);
+}
+
+/* kfd_dbg_trap_deactivate:
+ *	target: target process
+ *	unwind: If this is unwinding a failed kfd_dbg_trap_enable()
+ *	unwind_count:
+ *		If unwind == true, how far down the pdd list we need
+ *				to unwind
+ *		else: ignored
+ */
+static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
+{
+	int i;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		/* If this is an unwind, and we have unwound the required
+		 * enable calls on the pdd list, we need to stop now
+		 * otherwise we may mess up another debugger session.
+		 */
+		if (unwind && i == unwind_count)
+			break;
+
+		/* GFX off is already disabled by debug activate if not RLC restore supported. */
+		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
+			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+		pdd->spi_dbg_override =
+				pdd->dev->kfd2kgd->disable_debug_trap(
+				pdd->dev->adev,
+				target->runtime_info.ttmp_setup,
+				pdd->dev->vm_info.last_vmid_kfd);
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!kfd_dbg_is_per_vmid_supported(pdd->dev) &&
+				release_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd))
+			pr_err("Failed to release debug vmid on [%i]\n", pdd->dev->id);
+
+		if (!pdd->dev->kfd->shared_resources.enable_mes)
+			debug_refresh_runlist(pdd->dev->dqm);
+		else
+			kfd_dbg_set_mes_debug_mode(pdd);
+	}
+}
+
 int kfd_dbg_trap_disable(struct kfd_process *target)
 {
 	if (!target->debug_trap_enabled)
 		return 0;
 
+	/*
+	 * Defer deactivation to runtime if runtime not enabled otherwise reset
+	 * attached running target runtime state to enable for re-attach.
+	 */
+	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
+		kfd_dbg_trap_deactivate(target, false, 0);
+	else if (target->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_DISABLED)
+		target->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_ENABLED;
+
 	fput(target->dbg_ev_file);
 	target->dbg_ev_file = NULL;
 
@@ -42,16 +107,89 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
 	return 0;
 }
 
+static int kfd_dbg_trap_activate(struct kfd_process *target)
+{
+	int i, r = 0;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		if (!kfd_dbg_is_per_vmid_supported(pdd->dev)) {
+			r = reserve_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd);
+
+			if (r) {
+				target->runtime_info.runtime_state = (r == -EBUSY) ?
+							DEBUG_RUNTIME_STATE_ENABLED_BUSY :
+							DEBUG_RUNTIME_STATE_ENABLED_ERROR;
+
+				goto unwind_err;
+			}
+		}
+
+		/* Disable GFX OFF to prevent garbage read/writes to debug registers.
+		 * If RLC restore of debug registers is not supported and runtime enable
+		 * hasn't done so already on ttmp setup request, restore the trap config registers.
+		 *
+		 * If RLC restore of debug registers is not supported, keep gfx off disabled for
+		 * the debug session.
+		 */
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+		if (!(kfd_dbg_is_rlc_restore_supported(pdd->dev) ||
+						target->runtime_info.ttmp_setup))
+			pdd->dev->kfd2kgd->enable_debug_trap(pdd->dev->adev, true,
+								pdd->dev->vm_info.last_vmid_kfd);
+
+		pdd->spi_dbg_override = pdd->dev->kfd2kgd->enable_debug_trap(
+					pdd->dev->adev,
+					false,
+					pdd->dev->vm_info.last_vmid_kfd);
+
+		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
+			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!pdd->dev->kfd->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r) {
+			target->runtime_info.runtime_state =
+					DEBUG_RUNTIME_STATE_ENABLED_ERROR;
+			goto unwind_err;
+		}
+	}
+
+	return 0;
+
+unwind_err:
+	/* Enabling debug failed, we need to disable on
+	 * all GPUs so the enable is all or nothing.
+	 */
+	kfd_dbg_trap_deactivate(target, true, i);
+	return r;
+}
+
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info, uint32_t *runtime_size)
 {
 	struct file *f;
 	uint32_t copy_size;
-	int r = 0;
+	int i, r = 0;
 
 	if (target->debug_trap_enabled)
 		return -EALREADY;
 
+	/* Enable pre-checks */
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		if (!KFD_IS_SOC15(pdd->dev))
+			return -ENODEV;
+
+		if (!kfd_dbg_has_gws_support(pdd->dev) && pdd->qpd.num_gws)
+			return -EBUSY;
+	}
+
 	copy_size = min((size_t)(*runtime_size), sizeof(target->runtime_info));
 
 	f = fget(fd);
@@ -62,6 +200,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 
 	target->dbg_ev_file = f;
 
+	/* defer activation to runtime if not runtime enabled */
+	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
+		kfd_dbg_trap_activate(target);
+
 	/* We already hold the process reference but hold another one for the
 	 * debug session.
 	 */
@@ -71,8 +213,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 	if (target->debugger_process)
 		atomic_inc(&target->debugger_process->debugged_process_count);
 
-	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size))
+	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size)) {
+		kfd_dbg_trap_deactivate(target, false, 0);
 		r = -EFAULT;
+	}
 
 	*runtime_size = sizeof(target->runtime_info);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index db6d72e7930f..17481f824647 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -34,4 +34,33 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
 	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
 }
 
+/*
+ * If GFX off is enabled, chips that do not support RLC restore for the debug
+ * registers will disable GFX off temporarily for the entire debug session.
+ * See disable_on_trap_action_entry and enable_on_trap_action_exit for details.
+ */
+static inline bool kfd_dbg_is_rlc_restore_supported(struct kfd_node *dev)
+{
+	return !(KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 10) ||
+		 KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 1));
+}
+
+static inline bool kfd_dbg_has_gws_support(struct kfd_node *dev)
+{
+	if ((KFD_GC_VERSION(dev) == IP_VERSION(9, 0, 1)
+			&& dev->kfd->mec2_fw_version < 0x81b6) ||
+		(KFD_GC_VERSION(dev) >= IP_VERSION(9, 1, 0)
+			&& KFD_GC_VERSION(dev) <= IP_VERSION(9, 2, 2)
+			&& dev->kfd->mec2_fw_version < 0x1b6) ||
+		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0)
+			&& dev->kfd->mec2_fw_version < 0x1b6) ||
+		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 1)
+			&& dev->kfd->mec2_fw_version < 0x30) ||
+		(KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0) &&
+			KFD_GC_VERSION(dev) < IP_VERSION(12, 0, 0)))
+		return false;
+
+	/* Assume debugging and cooperative launch supported otherwise. */
+	return true;
+}
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0281f79fcd7d..a3846bb87510 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1165,9 +1165,19 @@ static void kfd_process_free_notifier(struct mmu_notifier *mn)
 
 static void kfd_process_notifier_release_internal(struct kfd_process *p)
 {
+	int i;
+
 	cancel_delayed_work_sync(&p->eviction_work);
 	cancel_delayed_work_sync(&p->restore_work);
 
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		/* re-enable GFX OFF since runtime enable with ttmp setup disabled it. */
+		if (!kfd_dbg_is_rlc_restore_supported(pdd->dev) && p->runtime_info.ttmp_setup)
+			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+	}
+
 	/* Indicate to other users that MM is no longer valid */
 	p->mm = NULL;
 	kfd_dbg_trap_disable(p);
-- 
2.25.1

