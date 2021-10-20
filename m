Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC8435407
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FFD6EA03;
	Wed, 20 Oct 2021 19:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715836E39B;
 Wed, 20 Oct 2021 19:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNsi1PzOv9x+hxYgI28/x5KO2DGAuBnBmO4WjSSxNadTu4Wgdeynw9O06mCJkXtGb19pkSNJ86DTgslEa3ah6G5IDzttm9cUUBAPh4thuqIB2N/y56iDQKxEpnw5qarzSJRsMUoYx2R2Ub2no8yw5odUMedpKTHkx+g6O/8CUpfjtOTBV8TfsNO0F9yikX7nT7IR+C3MTFT+PrpKIPAbEJijAhREZlPWNGYIREYgHOBZawwJ9BytxhdPWTFzM4805zpB+/Mouer+oY3F5uG//4vRMA7hdUgjMltQof05B44MggXF6xLN3cXDIkgd0UXwkyOf2SiyYjEgjuhwa1gkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edUDemQUd2j+t51QXeP1AzHxb1Qg2ZCugQ/1AXJXRAU=;
 b=NGofWmgyofVe1BNrq4IEcrvbOeHz9cgBQLEjdMQtv1sWVEdGcl0IHUTegqd60gNKAIvXfvRl7FVq4gLsPyCGDwH/qUCsXnHntTpZVUnXCeBy2HUez8nZF85cpWPeH68K2N+FaiAg87bRGCJqlpCne0D3jpWvGsOOyj8x45kR2jKL5XFwzEAcXiEsgzHxLmHGTAN7VGt4WOiZVTF4Rv1ffrBaq0xVqUFTuPd8ca1vUlyAuyNShLhPI+vfkRdFL/T0AgkmB+t/38nEzf49vwj0ykSmw6GJxNDr52jF1fFa88eEup8WUMPLiFRkKrAV6/KWJQeKmTkmgRGsu+pWkO+TEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edUDemQUd2j+t51QXeP1AzHxb1Qg2ZCugQ/1AXJXRAU=;
 b=erYatHjQECPHqeput8i5vZ5oRQTsb0FU3jcGd7schkTGvnogiYB0T+P7uWQJC4sH3T/aTjCO7mwrS7CIM2WR2+lXquVgo1RGYqNv8Gnu6dZiadvlTeC8BZSV1qUSzC6ZuopESzvH9KC0e/qfVaJpSQz27ynepwp/c9dcDKBXB3Q=
Received: from MWHPR04CA0048.namprd04.prod.outlook.com (2603:10b6:300:ee::34)
 by DM5PR12MB1626.namprd12.prod.outlook.com (2603:10b6:4:d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Wed, 20 Oct 2021 19:50:28 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ee:cafe::5e) by MWHPR04CA0048.outlook.office365.com
 (2603:10b6:300:ee::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Wed, 20 Oct 2021 19:50:28 +0000
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
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 19:50:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 14:50:26 -0500
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Wed, 20 Oct 2021 14:50:25 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>,
 <intel-gfx@lists.freedesktop.org>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 4/4] drm/amd/display: Add DP 2.0 MST DM Support
Date: Wed, 20 Oct 2021 15:47:15 -0400
Message-ID: <20211020194715.1107972-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
References: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79fc517f-0766-4a2a-1625-08d99402de1f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1626:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16266284EAEB3C9B1E285AB9F9BE9@DM5PR12MB1626.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gk98IMrdIhEKw1rTEjc7mf6tWrhFtwD1z+9nJhwU0xmaQyE7jR2EdfxLy8RvPcVQigFzZQ1LVLzdQSYy3OaUFi4fXVjDsiOGGaAQVg1RuCFY0VT6YVgA5gBHYHXa7nflDQVCujfbjAOZRPhy2LbJZPU015kch/uzgTlUatH5dguCNG8HihD1uCb20lrvxSIxZx+AaXlPpi03eoCb/IINp87NcXm7aN0+fr33XQOtXGla5I/21i+zq56GPwpf+KttmCMWJCy4pmiO1v6B9z7xlRlOUrU/v75d0AE2GNl3mrcCWJQPVcdE1doB9bQ0gVwR+4GdhedE6S+g9C8uxCAfo+gYDdizNZ5I2znvQgvaV8PkH6AFgqZL9PtF+5OWdyt5y2PsovaZGnPdNlZuWULpjYPhrV0anQDmrOab4wj7RnOcRyzZ+B61gxE9V4huS/34rI3atzS9KihiXmNAo8S8v4QhPDAlLWRS7hoeY5MQI4FUNKBOohDw1ngNQ0kJad7E1xadLmpp4qh1EhPogm5Ff4iZlisGomGvXY3Lo8/GvuN5Rg12UBGwt6Pn8yAS4EVIewkUnf7ppStZQuZB6cdo78x8c6D67+/Fhw1M1p2DM7XbIzAEGRHk5RVgaLghXtwBD1ZU6Yu5/UZpezh2+0swNhol3lJsvihxr35Nm3s73jjHBYUfTwp+W/UoY42Yxc/jcPBnTSjGdeOmuqGNxGXWsZFGV1H0yEk20RwWcSGeytI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(36860700001)(81166007)(6666004)(426003)(70206006)(54906003)(110136005)(508600001)(316002)(356005)(82310400003)(4326008)(5660300002)(8936002)(1076003)(70586007)(8676002)(186003)(2906002)(26005)(83380400001)(336012)(86362001)(36756003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 19:50:28.5601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fc517f-0766-4a2a-1625-08d99402de1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1626
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

[Why]
Add DP2 MST and debugfs support

[How]
Update the slot info based on the link encoding format

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  5 +++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e56f73e299ef..875425ee91d0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10741,6 +10741,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dsc_mst_fairness_vars vars[MAX_PIPES];
 #endif
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_topology_mgr *mgr;
 
 	trace_amdgpu_dm_atomic_check_begin(state);
 
@@ -10948,6 +10950,33 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		lock_and_validation_needed = true;
 	}
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	/* set the slot info for each mst_state based on the link encoding format */
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
+				drm_dp_mst_update_slots(mst_state, link_coding_cap);
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
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 9b3ad56607bb..1a68a674913c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -294,6 +294,9 @@ static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
 	case LINK_RATE_RBR2:
 	case LINK_RATE_HIGH2:
 	case LINK_RATE_HIGH3:
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	case LINK_RATE_UHBR10:
+#endif
 		break;
 	default:
 		valid_input = false;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 6169488e2011..53b5cc7b0679 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -219,6 +219,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	struct drm_dp_mst_topology_mgr *mst_mgr;
 	struct drm_dp_mst_port *mst_port;
 	bool ret;
+	u8 link_coding_cap;
 
 	aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
 	/* Accessing the connector state is required for vcpi_slots allocation
@@ -238,6 +239,8 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 
 	mst_port = aconnector->port;
 
+	link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
+
 	if (enable) {
 
 		ret = drm_dp_mst_allocate_vcpi(mst_mgr, mst_port,
@@ -251,7 +254,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	}
 
 	/* It's OK for this to fail */
-	drm_dp_update_payload_part1(mst_mgr, 1);
+	drm_dp_update_payload_part1(mst_mgr, (link_coding_cap == DP_CAP_ANSI_128B132B) ? 0:1);
 
 	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
 	 * AUX message. The sequence is slot 1-63 allocated sequence for each
-- 
2.25.1

