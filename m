Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A211EBAF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93666EDA0;
	Fri, 13 Dec 2019 20:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54C66ED33;
 Fri, 13 Dec 2019 20:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7rnDv8n5MfbwTjxmN0u/TIBQYkeBobnb6Ri7jc9fCczWBNXzB3s85VViZ15uEMtp0KrgR5EdQnZKnzun9SpV/Ypc4QZg1AcMpOOPFR7QyU7Vy0qOkbY491JEFN4elBEcf3HydcKYVwKsi/hIeqQIsDIPX9k8lf8Acxf9SF3JdM3qDI9tF/vMPGaKEhn8R+oj9lcJrUji/kp6kIeCqGrt7vzcGzUKCRlnR2t/pB0uzY59vxz9DMbRjACdH+xtyU7Eujwzd/O1IyhFSW5ScfnE2V1jYtszCpeHNlaAJ4dzXYZLZk7nJRzINw9Abb/j3S3KCfGvBufIH7VTu+++lM1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBOu4kVYM0aRUZ/yVFMJgBXNHHhE14oyHvw1cCT9afE=;
 b=FAFASXZj2tA8jZaWtc6Gh4MZYTRiHFEWYAQUfTS0nXvgmLvu/J7E++hhTdCWG8iefg5rtubZKaWoITbHKsX8LQwtOlzJuwro/b9Yi/bNRxHwArdFQ1hF27zYRWa2tT44dg7VnNMYsv2g0QIqeYvZMVEifhEc/QZW9Gsc5osaw3sJlx6JckBbAcSGVtosDhFzZcE7Pu3Gmkjtz5KhBqKs1I3sPYWceusjwM+lCwUucHFW9+MI2LkVq3ys1syPLFYSr8/shOgQgiA6r6gr/E6oxnDrTuVMYWVAQ4kJrrfg+WO6wq/dH+jACayStpryetqGlzhFIfzlY1mr4mbTkpkj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBOu4kVYM0aRUZ/yVFMJgBXNHHhE14oyHvw1cCT9afE=;
 b=predB6uIHo/MDr2wedaroVvsZrJYzrhjrn/NuaVuY0uElQo7U3jBVxhOTR56UO0BvRWlDsyDbgzt7UGMp1ClybDm4uCLpwKGzIYBfLDV2q2qIcVNRs+SrmOEivZA73zsJNQRDn42TkGfsXR+5xkJ/McSSilA0xCcGJCVws3D/tI=
Received: from SN1PR12CA0087.namprd12.prod.outlook.com (2603:10b6:802:21::22)
 by MN2PR12MB3198.namprd12.prod.outlook.com (2603:10b6:208:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.18; Fri, 13 Dec
 2019 20:09:06 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::209) by SN1PR12CA0087.outlook.office365.com
 (2603:10b6:802:21::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:06 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:06 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:02 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:02 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 10/18] drm/dp_mst: Manually overwrite PBN divider for
 calculating timeslots
Date: Fri, 13 Dec 2019 15:08:46 -0500
Message-ID: <20191213200854.31545-11-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(428003)(189003)(199004)(186003)(2906002)(5660300002)(426003)(478600001)(4326008)(356004)(2616005)(6666004)(8676002)(81156014)(8936002)(81166006)(26005)(316002)(36756003)(2876002)(336012)(1076003)(86362001)(70586007)(54906003)(70206006)(7696005)(6916009)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3198; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ccc6e57-9eae-4c10-3433-08d780084e82
X-MS-TrafficTypeDiagnostic: MN2PR12MB3198:
X-Microsoft-Antispam-PRVS: <MN2PR12MB31989B4515A2D564ADE06588E4540@MN2PR12MB3198.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZSe/kTTuSwAsFPVx+mlxqkc5ohV+PYL3qMY3woSniUteGi2LLzcr28ujPc/78wi+t9z1Zp1Oj4T/hz0BIUYKPIEzYzl0FSPUs8fGOPXkeqM8qFNZ4LhHVshwqO/wrFkoOtekN6mFVszak0qJvQX2Ni92prekMJS4sKnetBGRYwr5K1+r5Qd7Yl6GJOHHxdpUNEfsiub8oa4p4OLIpSVxFO+YiDIJA9LmLNhBuNwWLswC4852GG5inCc1hb4PsbBDaKeQtZloxSpX7edlu8bOz+SUy62WCBGXaLuuX1TOpLKVTemtaJ0Yr4ovtNmgi8DMZRUBBD5kIosEP7IONg7WrAhJ6jz26/pQ+F/W2OGe8aUBrbwnXdPu2ZmnK5j2hZXqy5Sb28WtCDb6zIqvHF+8uu0qMBonkrNJTu4Cn7Tas4jNSY3Qk3rHGg+YqStq6QAwDnaKBSl7zzGL6wR28jjQZL82KswRNPaeYiAChr+tJJIQAFnNerPIi/eXqZTUE15
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:06.1023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccc6e57-9eae-4c10-3433-08d780084e82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3198
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[why]
For DSC case we cannot use topology manager's PBN divider
variable. The default divider does not take FEC into account.
Therefore the driver has to calculate its own divider based
on the link rate and lane count its handling, as it is hw specific.

[how]
Pass pbn_div as an argument, which is used if its more than
zero, otherwise default topology manager's pbn_div will be used.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 drivers/gpu/drm/drm_dp_mst_topology.c             | 9 +++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c       | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c           | 3 ++-
 include/drm/drm_dp_mst_helper.h                   | 3 ++-
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9fc03fc1017d..753a79734817 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4972,7 +4972,8 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 	dm_new_connector_state->vcpi_slots = drm_dp_atomic_find_vcpi_slots(state,
 									   mst_mgr,
 									   mst_port,
-									   dm_new_connector_state->pbn);
+									   dm_new_connector_state->pbn,
+									   0);
 	if (dm_new_connector_state->vcpi_slots < 0) {
 		DRM_DEBUG_ATOMIC("failed finding vcpi slots: %d\n", (int)dm_new_connector_state->vcpi_slots);
 		return dm_new_connector_state->vcpi_slots;
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 74bed71f7315..bb0844dfb3d2 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4020,6 +4020,7 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
  * @mgr: MST topology manager for the port
  * @port: port to find vcpi slots for
  * @pbn: bandwidth required for the mode in PBN
+ * @pbn_div: divider for DSC mode that takes FEC into account
  *
  * Allocates VCPI slots to @port, replacing any previous VCPI allocations it
  * may have had. Any atomic drivers which support MST must call this function
@@ -4046,7 +4047,8 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
  */
 int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 				  struct drm_dp_mst_topology_mgr *mgr,
-				  struct drm_dp_mst_port *port, int pbn)
+				  struct drm_dp_mst_port *port, int pbn,
+				  int pbn_div)
 {
 	struct drm_dp_mst_topology_state *topology_state;
 	struct drm_dp_vcpi_allocation *pos, *vcpi = NULL;
@@ -4079,7 +4081,10 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 	if (!vcpi)
 		prev_slots = 0;
 
-	req_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
+	if (pbn_div <= 0)
+		pbn_div = mgr->pbn_div;
+
+	req_slots = DIV_ROUND_UP(pbn, pbn_div);
 
 	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] VCPI %d -> %d\n",
 			 port->connector->base.id, port->connector->name,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 92be17711287..a068f54a6793 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -65,7 +65,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 						       false);
 
 		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
-						      port, crtc_state->pbn);
+						      port, crtc_state->pbn, 0);
 		if (slots == -EDEADLK)
 			return slots;
 		if (slots >= 0)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1c9e23d5a6fd..edb78966c5b6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -787,7 +787,8 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 
 		slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr,
 						      mstc->port,
-						      asyh->dp.pbn);
+						      asyh->dp.pbn,
+						      0);
 		if (slots < 0)
 			return slots;
 
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 32e60b9d7098..0f813d6346aa 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -771,7 +771,8 @@ struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_a
 int __must_check
 drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 			      struct drm_dp_mst_topology_mgr *mgr,
-			      struct drm_dp_mst_port *port, int pbn);
+			      struct drm_dp_mst_port *port, int pbn,
+			      int pbn_div);
 int __must_check
 drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 				 struct drm_dp_mst_topology_mgr *mgr,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
