Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35EA42AF69
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 23:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648B189D67;
	Tue, 12 Oct 2021 21:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9C89D67
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 21:58:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHHKeG+5OvdFOp1G1gjX8heWewy/aFBg7ebIPCoSe3sicI30uirbxWp8wxrR5qpT+6C87pARIBFNzr4s5wDVenuxnPDGuqTAja1xjafWgigXqfLSD0S0QvoaIkF5ZxMDbsYfk4u9jeiXL39InpRI73kucBdc1UhCGQCPEwH75p75GqAkf2rbjzYKTRR14ZwBTFraUNEITHPOR5Cr2M/LjTVysTH0SDxiu/6fSB5prTrhHvC+mjHbbtMXOM35sK1aPQy2tfKO9j09iszMRKg5zJnGlWsoQ4dAUOZ42WlWE8brFwl6+rHBPNGu7TMJNN+easNMXELcbQzJLZt2DeI5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JAS4R+6VYlJulms1aUyxtnG7iTJAOQBbWiywMvL/tg=;
 b=WRKRogTxKBsmBE7C6hOPDBiL3Au/te/tXftwDz1OyYomX9ZG99U5F5NbmbsYjP5rEmhWl6dfiHhA2NFarbEnmK3y4VItbxin/DT+5nHSFQ5a99C3cj0tgo80RIDMhMDuS2CJ5aabglupROjbZIveE5WUUJ+jfyYtgnXdYE7dz8gjJbBplnIBl3xyiMh3H7Dq4X67A9yzfECXflWEffQ1TQTu6lc9tPcdBBdCEsCPXyD6GU8HUNmFrdZWC1Tqb+ukLL3hvgn4UILYMyS3rPyKwHlOegdQkBMw8705ac4d9vSazUL448rWvwiLEtlDBYicHcSJmhLezMNCGo0mp9Tosw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JAS4R+6VYlJulms1aUyxtnG7iTJAOQBbWiywMvL/tg=;
 b=Asr/GdIUZxk5hZ6sODYIcRU9cmn4r6sabQl+2xdMVGx3a09IXNj7gvrmEcuKrGahgdAY2mSdQ+ZnC0OKhqn5vUavFeE2PiFXtZiTjFQNhq3bzHsP6D4axo7JQBn9PLUauZRSfdtbtXRIjIeGmptGgpOLZa9pZXwcnGAneT/Qu9s=
Received: from MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::33)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 21:58:55 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::84) by MW4P220CA0028.outlook.office365.com
 (2603:10b6:303:115::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 21:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 21:58:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 16:58:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 14:58:52 -0700
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 12 Oct 2021 16:58:51 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH] drm: Update MST First Link Slot Information Based on Encoding
 Format
Date: Tue, 12 Oct 2021 17:58:48 -0400
Message-ID: <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d56323-6472-459b-f15d-08d98dcb7bd1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44706A14166D683D22972507F9B69@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t6H/Intu9kD5/lZIqrzSD7mGDXZxRZsoWB4NkBusH6lO9s50Ue519jK8tCTGIks2a8QQrwGNdftkYb8zIaM9mdTL9URu19bCkIKe4HHvvhRnnXJXxFdMjnoAAA2kPLTduWBhBv76Ggc397rXkBh4+bNeEoZwMBuZNCPK6qtCujprZ4BpsT9Tow5Di0ZqfKtS1vxKgvifxWZVeptOvCpZNWSNO/F995JNSOUz6xHALfbA6BnDKrsuOOdJZ59dTh3gVPX/lC1sjxp0+4irU7iNhNK5L2BFZP+V8I3UyHrDlMnpejDbbZtVWx7GM+XYrE/Czl4MbNax44If1O5ul/AoSjWSRG9qLnadQpsucPe34TK6HCibxPfM5bmpQifELgYE6/Y8fUGDtoeNLMerWOsFad0mviJNWtjjnskfJF2ipwuRM+zDibuBGS8DlTcOk1iZMeFNhxAN3OfMG/44+8DCBUWNlm19MhXdEAIGEwL2mm6LLS5G/HA8S51ECE8ALnC71ckGjP8JAhyTFGRythfSirwAK6lAk5dTDHdfRV1qhcO9ZUa01Wa6pYDxYJlPCUu5npMTOqZTn+jTIda+ZZ/vk4U9tHN/xMC+FfFXNgBHhfHw2liZ7pFCaS2UwsSZ0epSo/N2M8tKlHsWZ/deCTrLaYTC8CotxVquseBjoU8tU0vUlefgbMwUncNH2i0lWmdIlPL/X3LposcNTZHfBuzV9npicgoMlDWfohNuAkD4MQM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36860700001)(8936002)(1076003)(6666004)(8676002)(47076005)(316002)(4326008)(81166007)(336012)(508600001)(82310400003)(54906003)(356005)(110136005)(2906002)(2616005)(426003)(5660300002)(186003)(36756003)(83380400001)(86362001)(70586007)(70206006)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 21:58:54.3442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d56323-6472-459b-f15d-08d98dcb7bd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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
* Remove get_mst_link_encoding_cap
* Move total/start slots to mst_state, and copy it to mst_mgr in
atomic_check

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
 drivers/gpu/drm/drm_dp_mst_topology.c         | 35 +++++++++++++++----
 include/drm/drm_dp_mst_helper.h               | 13 +++++++
 3 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5020f2d36fe1..4ad50eb0091a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dsc_mst_fairness_vars vars[MAX_PIPES];
 #endif
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_topology_mgr *mgr;
 
 	trace_amdgpu_dm_atomic_check_begin(state);
 
@@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		lock_and_validation_needed = true;
 	}
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
+		struct amdgpu_dm_connector *aconnector;
+		struct drm_connector *connector;
+		struct drm_connector_list_iter iter;
+		u8 link_coding_cap;
+
+		if (!mgr->mst_state )
+			continue;
+
+		drm_connector_list_iter_begin(dev, &iter);
+		drm_for_each_connector_iter(connector, &iter) {
+			int id = connector->index;
+
+			if (id == mst_state->mgr->conn_base_id) {
+				aconnector = to_amdgpu_dm_connector(connector);
+				link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
+				drm_dp_mst_update_coding_cap(mst_state, link_coding_cap);
+
+				break;
+			}
+		}
+		drm_connector_list_iter_end(&iter);
+
+	}
+#endif
 	/**
 	 * Streams and planes are reset when there are changes that affect
 	 * bandwidth. Anything that affects bandwidth needs to go through
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ad0795afc21c..fb5c47c4cb2e 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 	struct drm_dp_payload req_payload;
 	struct drm_dp_mst_port *port;
 	int i, j;
-	int cur_slots = 1;
+	int cur_slots = mgr->start_slot;
 	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
@@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
 	num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
 
 	/* max. time slots - one slot for MTP header */
-	if (num_slots > 63)
+	if (num_slots > mgr->total_avail_slots)
 		return -ENOSPC;
 	return num_slots;
 }
@@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 	int ret;
 
 	/* max. time slots - one slot for MTP header */
-	if (slots > 63)
+	if (slots > mgr->total_avail_slots)
 		return -ENOSPC;
 
 	vcpi->pbn = pbn;
@@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
 
+void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t link_coding_cap)
+{
+	if (link_coding_cap == DP_CAP_ANSI_128B132B) {
+		mst_state->total_avail_slots = 64;
+		mst_state->start_slot = 0;
+	}
+
+	DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
+			(link_coding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b", mst_state->mgr);
+}
+EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
+
 /**
  * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
  * @mgr: manager for this port
@@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
 	if (ret) {
-		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
-			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
+		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=%d ret=%d\n",
+			    DIV_ROUND_UP(pbn, mgr->pbn_div), mgr->total_avail_slots, ret);
 		drm_dp_mst_topology_put_port(port);
 		goto out;
 	}
@@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 					 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_vcpi_allocation *vcpi;
-	int avail_slots = 63, payload_count = 0;
+	int avail_slots = mgr->total_avail_slots, payload_count = 0;
 
 	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
 		/* Releasing VCPI is always OK-even if the port is gone */
@@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 		}
 	}
 	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
-		       mgr, mst_state, avail_slots, 63 - avail_slots);
+		       mgr, mst_state, avail_slots, mgr->total_avail_slots - avail_slots);
 
 	return 0;
 }
@@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 			break;
 
 		mutex_lock(&mgr->lock);
+
+		mgr->start_slot = mst_state->start_slot;
+		mgr->total_avail_slots = mst_state->total_avail_slots;
+
 		ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr->mst_primary,
 							    mst_state);
 		mutex_unlock(&mgr->lock);
@@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	if (!mgr->proposed_vcpis)
 		return -ENOMEM;
 	set_bit(0, &mgr->payload_mask);
+	mgr->total_avail_slots = 63;
+	mgr->start_slot = 1;
 
 	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
 	if (mst_state == NULL)
 		return -ENOMEM;
 
+	mst_state->total_avail_slots = 63;
+	mst_state->start_slot = 1;
+
 	mst_state->mgr = mgr;
 	INIT_LIST_HEAD(&mst_state->vcpis);
 
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index ddb9231d0309..f8152dfb34ed 100644
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
@@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	int pbn_div;
 
+	/**
+	 * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
+	 */
+	u8 total_avail_slots;
+
+	/**
+	 * @start_slot: 1 for 8b/10b, 0 for 128/132b
+	 */
+	u8 start_slot;
+
 	/**
 	 * @funcs: Atomic helper callbacks
 	 */
@@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp
 
 void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
+void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t link_coding_cap);
 
 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port);
-- 
2.25.1

