Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9129434D40
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 16:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1C16E30D;
	Wed, 20 Oct 2021 14:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0796E30D;
 Wed, 20 Oct 2021 14:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B58oRtpWGQB7Vx8MdMsSsmw+mJXnxj1hsJCc/dysNGbDMxVt6JzY6JTxBVLaOP4UEvGHUGANjHsADbEBh381Kr3j9FJ6cIudK+cjXMSF6bKMp3NDnxLv43jkF5iRkRyqRO3q4CPnDwD+oJK3YqEhtyNWQbAs8rx2iL8Lmm/B5ZeUeRE0cdPXu/phrpi1lN82U39X4Z7LLMblCiuTxNj3a2KzykZeE13YEH4iIK54gHaH4TsQ9e7YrL7ciq1FIkRv+40xOrhrcSl6PRNH+2juxzno6KBb0822VtcPlifoys4IS/mXiPIeuakYuDLOqmzCwVf0kss3HDfxKcCCeqlnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGXU/z/5aMXyEKADp6F74qA4jIR9rMnolP/CONvxxJs=;
 b=RhCoGzUoBCszeOCRwINXolytcPIQyfFcLPkzMl2Pa4kagI2RKl/RzmClzkpqWtcGuCFV7R1oDhISTBbn+Af3FfXiXA1gUsBFQRiE4mrsSKB8YT3+lo6Jle76ccWUf/31IT8P3QWli469cS+d2q4Z6Mj9OOLRh4wd9U37doQKY/2M16xtFY+PcPyLZ6BCU9YZgY45KCoxnZcTd47xXAqax3w8TbmM3gahWGZ20HPQ9kJhRGKul8p1yYIbQC1EvoPHMcvpkhclwWOu6b9sIsYu6lnieLx/pPsdY/HRO4VhmRKsnh6aaE8L6+S7OsvgmT6pkxGZO/fKzB9vzgLE2dDI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGXU/z/5aMXyEKADp6F74qA4jIR9rMnolP/CONvxxJs=;
 b=Mxt8hH5cpv4PlCU3PfkuKbd1iiRIs3RUH+wAm8AVRj8tD4g9n+5oMRpf7LU6rhjjedRzH+NcoVWCHxn4089w96fXG8uLTwO5VCR9TK8lC9fbvzEn4lAI27GUVZIm59kw+vC8N4iQ1EbsaUibAZWbaSfiwcFiSDXsyvCQzE4Mf6U=
Received: from DM6PR05CA0063.namprd05.prod.outlook.com (2603:10b6:5:335::32)
 by SA0PR12MB4560.namprd12.prod.outlook.com (2603:10b6:806:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 14:16:21 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::ed) by DM6PR05CA0063.outlook.office365.com
 (2603:10b6:5:335::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 14:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 14:16:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 09:16:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 07:16:20 -0700
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Wed, 20 Oct 2021 09:16:19 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>,
 <intel-gfx@lists.freedesktop.org>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 2/4] drm: Update MST First Link Slot Information Based on
 Encoding Format
Date: Wed, 20 Oct 2021 10:16:01 -0400
Message-ID: <20211020141603.19452-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
References: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8807fc63-886d-48e9-65f1-08d993d430da
X-MS-TrafficTypeDiagnostic: SA0PR12MB4560:
X-Microsoft-Antispam-PRVS: <SA0PR12MB45603A44DB9BF0A750C0B493F9BE9@SA0PR12MB4560.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3AXrBADyTQ8A9hl5xUXr98V2kKYL3Mfc+lgAVOs40QhinAhJ490rGT/UvGpp7pl6qDcCmMljyfXz1V11cK9a14iiY0S7fl7ofNtXnwmvbaQU2EKm1Xkoot/zKsOgTx4mKedKUGqwK0EQG4P9V6wfxU31hLcdo5WQCWTZa1zNh/g1p+cNVFv/7QGYJ8INQEemiMvcazAhYGWzv0onNi8wxnZ+G3q3/HAcA/9QXrEO8ud2zhP5qm6jfF3JaWBqRh1mDz8I2/MhqB+aDCjCXsomiaj/xaQDMh7+3XH+tUrDs4klpBT5PtYNgHvLt6hLmPFyRhmLU66t3I38ln+LXd68wK/FNsmJZFZqcut3h4dsBDS2OqOUu9wAEJvM9N/yTqns42DfKQ56p83kYt+uokC1FcG5j8BGXxooU5rrVqVENL1j01VwrMovCo29PFAGjZ+/CwoKJKG/uHo78J8r3Wje2kRy0yj1qweMu/KJHS/lnQAOCuHShwr+05aIhPFZxl2GrbZkfUlsXx0u+zk+iZeV3+M43agS7kRJ4NrAbD7OiCmA0mlBiqJkMI0wbpRhPGw+7j6YuiRkCyjZ41MJX8tPkV37yG3d1gnytw/wtfH2LH3eO/xdJ4GC7lRERBx58pT+GTjcK2475ByVjTzy+rUWctwuS/iE/8He05QxhU+RivDY7Bqj7eLNRN1SghpCRJtCZ8Q3lODEFTYkoWgnuk0EAtcSGn3YDt2y+oavvjE9Bmk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70206006)(70586007)(36860700001)(186003)(81166007)(36756003)(8936002)(426003)(336012)(2616005)(54906003)(110136005)(316002)(2906002)(86362001)(6666004)(26005)(15650500001)(5660300002)(4326008)(83380400001)(356005)(1076003)(47076005)(8676002)(508600001)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 14:16:21.0875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8807fc63-886d-48e9-65f1-08d993d430da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4560
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

8b/10b encoding format requires to reserve the first slot for
recording metadata. Real data transmission starts from the second slot,
with a total of available 63 slots available.

In 128b/132b encoding format, metadata is transmitted separately
in LLCP packet before MTP. Real data transmission starts from
the first slot, with a total of 64 slots available.

v2:
* Move total/start slots to mst_state, and copy it to mst_mgr in
atomic_check

v3:
* Only keep the slot info on the mst_state
* add a start_slot parameter to the payload function, to facilitate non
  atomic drivers (this is a temporary workaround and should be removed when
  we are moving out the non atomic driver helpers)

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c         | 34 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  4 +--
 include/drm/drm_dp_mst_helper.h               |  5 ++-
 6 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index ff0f91c93ba4..6169488e2011 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -251,7 +251,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	}
 
 	/* It's OK for this to fail */
-	drm_dp_update_payload_part1(mst_mgr);
+	drm_dp_update_payload_part1(mst_mgr, 1);
 
 	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
 	 * AUX message. The sequence is slot 1-63 allocated sequence for each
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 5ab3b3a46e89..d188a5269070 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3353,6 +3353,9 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
 /**
  * drm_dp_update_payload_part1() - Execute payload update part 1
  * @mgr: manager to use.
+ * @start_slot: this is the cur slot
+ *  NOTE: start_slot is a temporary workaround for non-atomic drivers,
+ *  this will be removed when non-atomic mst helpers are moved out of the helper
  *
  * This iterates over all proposed virtual channels, and tries to
  * allocate space in the link for them. For 0->slots transitions,
@@ -3363,12 +3366,12 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
  * after calling this the driver should generate ACT and payload
  * packets.
  */
-int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
+int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot)
 {
 	struct drm_dp_payload req_payload;
 	struct drm_dp_mst_port *port;
 	int i, j;
-	int cur_slots = 1;
+	int cur_slots = start_slot;
 	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
@@ -4503,6 +4506,26 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
 
+/**
+ * drm_dp_mst_update_slots() - updates the slot info depending on the DP ecoding format
+ * @mst_state: mst_state to update
+ * @link_ecoding_cap: the ecoding format on the link
+ */
+void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_ecoding_cap)
+{
+	if (link_ecoding_cap == DP_CAP_ANSI_128B132B) {
+		mst_state->total_avail_slots = 64;
+		mst_state->start_slot = 0;
+	} else {
+		mst_state->total_avail_slots = 63;
+		mst_state->start_slot = 1;
+	}
+
+	DRM_DEBUG_KMS("%s ecoding format on mst_state 0x%p\n",
+			(link_ecoding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b", mst_state->mgr);
+}
+EXPORT_SYMBOL(drm_dp_mst_update_slots);
+
 /**
  * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
  * @mgr: manager for this port
@@ -5222,7 +5245,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 					 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_vcpi_allocation *vcpi;
-	int avail_slots = 63, payload_count = 0;
+	int avail_slots = mst_state->total_avail_slots, payload_count = 0;
 
 	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
 		/* Releasing VCPI is always OK-even if the port is gone */
@@ -5251,7 +5274,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 		}
 	}
 	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
-		       mgr, mst_state, avail_slots, 63 - avail_slots);
+		       mgr, mst_state, avail_slots, mst_state->total_avail_slots - avail_slots);
 
 	return 0;
 }
@@ -5528,6 +5551,9 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	if (mst_state == NULL)
 		return -ENOMEM;
 
+	mst_state->total_avail_slots = 63;
+	mst_state->start_slot = 1;
+
 	mst_state->mgr = mgr;
 	INIT_LIST_HEAD(&mst_state->vcpis);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index b170e272bdee..d3a24189a12c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -368,7 +368,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 
 	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
 	if (ret) {
 		drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
 	}
@@ -516,7 +516,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp->active_mst_links++;
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
 
 	/*
 	 * Before Gen 12 this is not done as part of
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index f949767698fc..6c8c59c26dbf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1413,7 +1413,7 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
 	int ret;
 
 	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
-	ret = drm_dp_update_payload_part1(&mstm->mgr);
+	ret = drm_dp_update_payload_part1(&mstm->mgr, 1);
 
 	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index ec867fa880a4..751c2c075e09 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -423,7 +423,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int mode)
 		drm_dp_mst_allocate_vcpi(&radeon_connector->mst_port->mst_mgr,
 					 radeon_connector->port,
 					 mst_enc->pbn, slots);
-		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr);
+		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
 
 		radeon_dp_mst_set_be_cntl(primary, mst_enc,
 					  radeon_connector->mst_port->hpd.hpd, true);
@@ -452,7 +452,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int mode)
 			return;
 
 		drm_dp_mst_reset_vcpi_slots(&radeon_connector->mst_port->mst_mgr, mst_enc->port);
-		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr);
+		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
 
 		drm_dp_check_act_status(&radeon_connector->mst_port->mst_mgr);
 		/* and this can also fail */
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index ddb9231d0309..3207b49586fc 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
 	struct drm_private_state base;
 	struct list_head vcpis;
 	struct drm_dp_mst_topology_mgr *mgr;
+	u8 total_avail_slots;
+	u8 start_slot;
 };
 
 #define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_topology_mgr, base)
@@ -806,6 +808,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp
 
 void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
+void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_ecoding_cap);
 
 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port);
@@ -815,7 +818,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
 			   int pbn);
 
 
-int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr);
+int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot);
 
 
 int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr);
-- 
2.25.1

