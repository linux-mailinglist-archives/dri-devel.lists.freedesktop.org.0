Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C7435402
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6797F6E33F;
	Wed, 20 Oct 2021 19:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2081.outbound.protection.outlook.com [40.107.95.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA0B6E33F;
 Wed, 20 Oct 2021 19:50:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfLLIb+v+nndiusgMTfZfiqL4Qit+CuNWG3yWFEYxdwfm2b/SXVLR1Lo6fk2TZFI49y4amp3ESij+FoqSgkCvPLinnoA0FNQhcFD/UvlPev3uPh36g0uXqT1fkJGbHh91dZsbU7Z9f4gYKaIhFVxpIA8j69/Q9oAP1Rny2XsU2pbzF0EvLFlh4TAtAcxgHcamRFfzJ7PmrZhdX6/BOa9krrhF9RqfsLIlqRQbj/RzOY01RMR//wloOflvdRNDENjIBR2/w2Cc9o6num9qC7u4voEf4Y+WR1S2rOsIr1sVc9Zdm6CR7M4T/u9Kbh/WyYsgAoF2K9BhfaqGa4RrhnRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnSax/d9XobcUqzl+54GaxHb3Ut1F6UCHpCd/r17VKA=;
 b=VQnYBn7o9sN74H8uMaZNP7EiuX+H66d+F/R5zRZP3VoRQ2rEmsRByiIvtdrvA+Elwukk0ZUc0MFis31OekS6HFw4dsjB59pVUYYDEPzyf/Qb5o5H4uaC2DbqTG96tcW4oYdHCaiLqJeoI4xXGkSqA0S+JI9PqyHMzDFNMASr/Cn7M2KkGQPcI1F0dehotEaHPzy3fFvVBrBn6+NCSJRWBvylB0RCGrOhL7aQechyXDuNWAH2QEv+6NpVuebEe0/aNvmJTdsNWFSdT060+DvYMcLqZhyrQzPhGqQYy4EyTZZUcsZ255DvvPjfsceDYREXKwG/8/QfiCn4EQZC6KPMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnSax/d9XobcUqzl+54GaxHb3Ut1F6UCHpCd/r17VKA=;
 b=beA8wUpG1yBbDjKnlFWJ8CVqXhUNilDpQjMehd6x71oc99bWDjiEgtL8lmK/naFLWUbB1SBDGydrSVEk6uZMOYEXTsfGXz3kx5AQpUBD+feQmsjec4x7AZf511zfeVY0Ef2anXXRrh8wYSsJawVxfeQdSUvezHO29Z3t1vlE54k=
Received: from MWHPR04CA0031.namprd04.prod.outlook.com (2603:10b6:300:ee::17)
 by CH0PR12MB5281.namprd12.prod.outlook.com (2603:10b6:610:d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 19:50:27 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ee:cafe::10) by MWHPR04CA0031.outlook.office365.com
 (2603:10b6:300:ee::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 19:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 19:50:27 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 14:50:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 12:50:24 -0700
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Wed, 20 Oct 2021 14:50:24 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>,
 <intel-gfx@lists.freedesktop.org>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 2/4] drm: Update MST First Link Slot Information Based on
 Encoding Format
Date: Wed, 20 Oct 2021 15:47:13 -0400
Message-ID: <20211020194715.1107972-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
References: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc3d3c9f-ba1d-4d40-8dd2-08d99402dd44
X-MS-TrafficTypeDiagnostic: CH0PR12MB5281:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5281D9238A5438857D63A547F9BE9@CH0PR12MB5281.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGtWSI/VgYQmvoXs9TiY6vcOvuakkkE+26bOZXjWjIh8NdSG0ANvIhXtN1PrEVyrigJh4r+W8W/FzmRWB2QbqwYBZQ5yumCucgeIReomY/K9/M6eIFlvzWubPnevbI2KGqWXF4eiAU1xqLORxaIeYzaZIFLOQoBMM9HL7fk5DWcXDbMEHxUmrk8QWjWBMNnctZaFuu3jrjGni4rmSBb52VRoYYbJ/Xhlp0BFi3hGq5h4YMJ1t6jaPRRB75xeXfCdFixswUbSkFK4AGVRwQkeImrY5723iOdB9sDCSox0Ajcc8x5dqaiGjn/csyWtkgketO4IfVWfumsBYdJfyhJFGVpuTfMEVuMosd1Jrv8QEqw2GafdLrjQnd8UioVVDStXLeH0zB5h0doJLpnZp0bHxiJRxR/gZA332WB4grhyO70fXlAAClA5jQy5xmswZExMwB1LQsoH0CF4OvbAMxHTBpdqo+XxrCDNSiLz0qE4PRU6U8cYTQvzhopyHAx8HHq83lCWK+mgvxuzZ3IDzldYESjJZjLUAoPMgToxIfd/SqMkPe9h/X4BCoDyx6vnvAMDwhe9HWeCcJn0a7JOB2J0T6gnwfgqh02Juuk8FMlNe7RNhJ36hKBXkfpqLeLK6DlU7jTsxgj7Ev4ZQW+b60JebVH91Evd41wevzV2TN7PuN59c+XDQ5YPyyB36D/JOfCVyan64jPoTffuQp3i4Y4vRxnTCqGxgSG+9HMY08rHww0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(8936002)(82310400003)(426003)(86362001)(4326008)(8676002)(81166007)(508600001)(356005)(2616005)(2906002)(5660300002)(36756003)(316002)(15650500001)(54906003)(1076003)(36860700001)(110136005)(70206006)(70586007)(6666004)(83380400001)(186003)(26005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 19:50:27.1199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3d3c9f-ba1d-4d40-8dd2-08d99402dd44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5281
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

v4:
*fixed typo and formatting

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c         | 38 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  4 +-
 include/drm/drm_dp_mst_helper.h               |  5 ++-
 6 files changed, 43 insertions(+), 12 deletions(-)

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
index 5ab3b3a46e89..82ee6791576c 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3353,6 +3353,10 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
 /**
  * drm_dp_update_payload_part1() - Execute payload update part 1
  * @mgr: manager to use.
+ * @start_slot: this is the cur slot
+ *
+ * NOTE: start_slot is a temporary workaround for non-atomic drivers,
+ * this will be removed when non-atomic mst helpers are moved out of the helper
  *
  * This iterates over all proposed virtual channels, and tries to
  * allocate space in the link for them. For 0->slots transitions,
@@ -3360,15 +3364,15 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
  * transitions, this writes the updated VCPIs and removes the
  * remote VC payloads.
  *
- * after calling this the driver should generate ACT and payload
+ *after calling this the driver should generate ACT and payload
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
@@ -4503,6 +4507,27 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
 
+/**
+ * drm_dp_mst_update_slots() - updates the slot info depending on the DP ecoding format
+ * @mst_state: mst_state to update
+ * @link_encoding_cap: the ecoding format on the link
+ */
+void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap)
+{
+	if (link_encoding_cap == DP_CAP_ANSI_128B132B) {
+		mst_state->total_avail_slots = 64;
+		mst_state->start_slot = 0;
+	} else {
+		mst_state->total_avail_slots = 63;
+		mst_state->start_slot = 1;
+	}
+
+	DRM_DEBUG_KMS("%s encoding format on mst_state 0x%p\n",
+			(link_encoding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b",
+			mst_state->mgr);
+}
+EXPORT_SYMBOL(drm_dp_mst_update_slots);
+
 /**
  * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
  * @mgr: manager for this port
@@ -5222,7 +5247,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 					 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_vcpi_allocation *vcpi;
-	int avail_slots = 63, payload_count = 0;
+	int avail_slots = mst_state->total_avail_slots, payload_count = 0;
 
 	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
 		/* Releasing VCPI is always OK-even if the port is gone */
@@ -5251,7 +5276,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 		}
 	}
 	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
-		       mgr, mst_state, avail_slots, 63 - avail_slots);
+		       mgr, mst_state, avail_slots, mst_state->total_avail_slots - avail_slots);
 
 	return 0;
 }
@@ -5528,6 +5553,9 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
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
index ddb9231d0309..78044ac5b59b 100644
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
 
+void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap);
 
 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port);
@@ -815,7 +818,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
 			   int pbn);
 
 
-int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr);
+int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot);
 
 
 int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr);
-- 
2.25.1

