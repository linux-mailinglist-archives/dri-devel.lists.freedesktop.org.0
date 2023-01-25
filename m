Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E440967BB49
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E85A10E81E;
	Wed, 25 Jan 2023 19:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBE310E3A1;
 Wed, 25 Jan 2023 19:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfbPGtYEZUBFCeUN4tu6gi0F2mXKyl4DMQVmV1XYFyNvYRm35ahuTKoSzUbhJoN6kTWe73OA8AFMbIuNR1AsjcnPH3Mr2Y5Dh60VV5JUv5OghXBGIMw+1mOQ4VlnNnKa8RLP5+5EkbLbRSXtdS8hevi9CL7ZNfIdA+XGSE5GVjBG7MUYZGbsq8aKN7MXi6pmR6gvhq/rltJ/s6knNyreptMv0aeTvK/A3uJq+CqCEOkSH+scKK1O7Xhpb9yynOmmHaabj/TsF4CExerivH62G4f59TZa8TmULdSX28DVsBRmIhbxj5hLDJG9gaMvh8z89WIFYLEARlL76kogq5KEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jc7knyf5J96mDWZ2gAE1rxfhSa1SfST50i6R9imot3Y=;
 b=Mk4J61gwdTGKzClNU1THBt/Ds9C3bPQwnbHkBav3hgGp6yskELWfX5EhzMzOPZ1JMLm0PcYanGh+cszHs56+eMKdhot7wbe6tO9NUuTmSDpN58O/NRFaAZYFjdwiC73iZo5l0WB3IMcMHm3B+0+HXW6j3cuzhqQVBsyugBPJfvzDR+0ZgFoy+regCajPDatczCozWncy4n6X46O10Vauv9fSajxDugOxfHqXgJ16dj3otxF4oWnoGQ4gw96hmYlWBCep2kPk+WboE34Dli4n8srJpweBf5s2kEi+tsfImlKpV6d+T5HhyxvPp++bSHOKxyxHCp7iVCsFSFhYkX6KoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jc7knyf5J96mDWZ2gAE1rxfhSa1SfST50i6R9imot3Y=;
 b=L8zM2Q3pRwOgEH+NsERPW84KmUgYyYrDAewU09Ft74XcujdiReBhXXPPYwaRbFOeNRWg/HIjg9LuvL7tCtnR2J3tnUtRKzw3aw7L3YSU4b4KNEFc/65V6cbeitkcu0zUkfoLeuTCkqKMzx8f4glUqnyas+SqOeC7keCHYpCzpKQ=
Received: from BN8PR15CA0022.namprd15.prod.outlook.com (2603:10b6:408:c0::35)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 19:54:22 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::83) by BN8PR15CA0022.outlook.office365.com
 (2603:10b6:408:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:22 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:19 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/32] drm/amdgpu: prepare map process for multi-process debug
 devices
Date: Wed, 25 Jan 2023 14:53:42 -0500
Message-ID: <20230125195401.4183544-14-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: ca10333b-3ebc-4ccb-fbf3-08daff0df443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFiL9mcZ7IqI3oKIu4iEj6Bbj+wzxcQg3jrSvggU33CnJuMh6NGJ4vsyNnfwCF74Lmc9xkYkVBBAteGySykBD99+dD6x9kjVvbteEJcujWCTmOe2hkQ7WcqkCfMQ5TIFBP9k9zhu4f7O+2EYWyawi8zkF6D3Zygi6Wo8H0XqQTR+1Ftug6IJY9EzMXsVEQ6iJST+C1i1WSPbAXccqksc9ntv2ctah2FaaZhqm0RgmQi6v4M4HTQEOiWGCtwAgQckHGhOAiabtyayy7Yo/8/FI7JCKnmP+KZrPNtbUmCxwbjhOu9SysCwvkhSnT1L31zNHVCrQgydQRC2h9M9J1P8lgsZQTTCr3E93XB2oDlWXrhTCQ2BNB5MX3JZUIXx6QXok9B7WNxdzYYiETUi4Kmd9TLqiM0a3Icb9w5o4/ZoysQjFWajokJfEGql15NrzJatxN4oKIOCcj3RESOzUAKkK9fvezdqXwUK68z/bE8Q69gLnWqNF86LtqEjDDrlI5p94swqTttaTGea7luzD5sv53zk394XpUHj2vExJ7f5zBceuxsGxEVZV3OuRekpXnzAVODkfGFx5eNYIrROvIgsjJhMAfCaXP+Y/7b4pzPlYDHP4KLOWEE4q1IF+U4Ti/2Kspk3Iha4dPAfg+/F3x9NJV004PfxgD2jnopoCDjbwmAnOWpsSzjpfmcqG1HfnvFQ17JgVRDQc6FCdhfbQlfjstx3DnCCLQwCDubahpV6pQY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(46966006)(40470700004)(36840700001)(5660300002)(8936002)(478600001)(2906002)(70206006)(4326008)(70586007)(450100002)(8676002)(41300700001)(1076003)(6666004)(7696005)(186003)(16526019)(26005)(2616005)(336012)(426003)(83380400001)(82310400005)(47076005)(82740400003)(316002)(54906003)(44832011)(110136005)(81166007)(356005)(36756003)(86362001)(40460700003)(40480700001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:22.3631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca10333b-3ebc-4ccb-fbf3-08daff0df443
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike single process debug devices, multi-process debug devices allow
debug mode setting per-VMID (non-device-global).

Because the HWS manages PASID-VMID mapping, the new MAP_PROCESS API allows
the KFD to forward the required SPI debug register write requests.

To request a new debug mode setting change, the KFD must be able to
preempt all queues then remap all queues with these new setting
requests for MAP_PROCESS to take effect.

Note that by default, trap enablement in non-debug mode must be disabled
for performance reasons for multi-process debug devices due to setup
overhead in FW.

v2: remove asic family code name comment in per vmid support check

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  7 +++
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 50 +++++++++++++++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 ++
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 15 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  9 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 ++
 6 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 8aa7a3ad4e97..53c5a3e55bd2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -32,5 +32,12 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
 			uint32_t *runtime_info_size);
+
+static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
+{
+	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
+}
+
 void debug_event_write_work_handler(struct work_struct *work);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 0cd3a5e9ff25..2517716d7cbc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2554,6 +2554,56 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
 	return r;
 }
 
+int debug_lock_and_unmap(struct device_queue_manager *dqm)
+{
+	int r;
+
+	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
+		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
+		return -EINVAL;
+	}
+
+	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
+		return 0;
+
+	dqm_lock(dqm);
+
+	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, 0, false);
+	if (r)
+		dqm_unlock(dqm);
+
+	return r;
+}
+
+int debug_map_and_unlock(struct device_queue_manager *dqm)
+{
+	int r;
+
+	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
+		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
+		return -EINVAL;
+	}
+
+	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
+		return 0;
+
+	r = map_queues_cpsch(dqm);
+
+	dqm_unlock(dqm);
+
+	return r;
+}
+
+int debug_refresh_runlist(struct device_queue_manager *dqm)
+{
+	int r = debug_lock_and_unmap(dqm);
+
+	if (r)
+		return r;
+
+	return debug_map_and_unlock(dqm);
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static void seq_reg_dump(struct seq_file *m,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 0cb1504d24cf..bef3be84c5cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -286,6 +286,9 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
 int release_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
+int debug_lock_and_unmap(struct device_queue_manager *dqm);
+int debug_map_and_unlock(struct device_queue_manager *dqm);
+int debug_refresh_runlist(struct device_queue_manager *dqm);
 
 static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 363cf8e005cc..f19c506da23d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -88,6 +88,10 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
 {
 	struct pm4_mes_map_process_aldebaran *packet;
 	uint64_t vm_page_table_base_addr = qpd->page_table_base;
+	struct kfd_dev *kfd = pm->dqm->dev;
+	struct kfd_process_device *pdd =
+			container_of(qpd, struct kfd_process_device, qpd);
+	int i;
 
 	packet = (struct pm4_mes_map_process_aldebaran *)buffer;
 	memset(buffer, 0, sizeof(struct pm4_mes_map_process_aldebaran));
@@ -102,6 +106,17 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
 	packet->bitfields14.num_oac = qpd->num_oac;
 	packet->bitfields14.sdma_enable = 1;
 	packet->bitfields14.num_queues = (qpd->is_debug) ? 0 : qpd->queue_count;
+	/* TRAP_EN is set on boot so keep it set in non-debug mode. */
+	packet->spi_gdbg_per_vmid_cntl = pdd->spi_dbg_override |
+						pdd->spi_dbg_launch_mode;
+
+	if (pdd->process->debug_trap_enabled) {
+		for (i = 0; i < kfd->device_info.num_of_watch_points; i++)
+			packet->tcp_watch_cntl[i] = pdd->watch_points[i];
+
+		packet->bitfields2.single_memops =
+				!!(pdd->process->dbg_flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP);
+	}
 
 	packet->sh_mem_config = qpd->sh_mem_config;
 	packet->sh_mem_bases = qpd->sh_mem_bases;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d557a7ae756c..8f1e2f9023db 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -782,6 +782,12 @@ struct kfd_process_device {
 	uint64_t faults;
 	uint64_t page_in;
 	uint64_t page_out;
+
+	/* Tracks debug per-vmid request settings */
+	uint32_t spi_dbg_override;
+	uint32_t spi_dbg_launch_mode;
+	uint32_t watch_points[4];
+
 	/*
 	 * If this process has been checkpointed before, then the user
 	 * application will use the original gpu_id on the
@@ -918,6 +924,9 @@ struct kfd_process {
 
 	bool xnack_enabled;
 
+	/* Tracks debug per-vmid request for debug flags */
+	bool dbg_flags;
+
 	/* Work area for debugger event writer worker. */
 	struct work_struct debug_event_workarea;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index e935158ab311..94c6545a58b4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1556,6 +1556,11 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	}
 
 	p->pdds[p->n_pdds++] = pdd;
+	if (kfd_dbg_is_per_vmid_supported(pdd->dev))
+		pdd->spi_dbg_override = pdd->dev->kfd2kgd->disable_debug_trap(
+							pdd->dev->adev,
+							false,
+							0);
 
 	/* Init idr used for memory handle translation */
 	idr_init(&pdd->alloc_idr);
-- 
2.25.1

