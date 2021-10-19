Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2544B433E32
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FB66E1B7;
	Tue, 19 Oct 2021 18:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3716F6E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:12:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0AW1bF926f/kRicdvDl90X3OmHAmB6i8lOyHHT2punzRdSe2njp99YT3QH9Nf7nTXH8gD8+qrWEibueMeaIf26vOdFXzfHROjZ2E7p+CoCsorUwbpz2l/lHGPSKcNVVqvt/jnAMt6eaW4aPRdZZJlsIxKReFgHHZCOP3k2YENeY3XiaUZONUsZFuTxdTKoMqIUFjxFLP8BBH5YIlZxaqL+MdkaoEvBzyKuPnUth39mvlF008miwNne/icUUhwQXMNDjj4Sff76Obl32SSXNAaAg2z3K8e3zARVMTneS0JQRY5tnURtHsIJ6KIOns3SUoBY7IfZT7B68swDFocCAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edUDemQUd2j+t51QXeP1AzHxb1Qg2ZCugQ/1AXJXRAU=;
 b=acNhxbtC6c5iwPcHqbg+Q6ChQ9Wrkj5JZn7cX/eMNO0u2Vo9TjL44yjV1fuaX+SWuF7+uasf4LAukGigTGudLfT5X4PdgdMrr4cnAYhwSVO8kFeitLnusGv9/6zrB2xovC12BJr9K/gpxGp3V//7IbLLzRI3BwHZYRDmRnShApB92yn0LkEvn1cI7L+EwwEApwoZhYNg8fvVtIwthfeL7oCkPiu7jz5vlum553ZFcruJpY4aQymgPRA9dByL17u9U9TCgfN1YUu89+5TZH/H5ZngSsS5ocJ8W5iCQP3NKSQ1TuahktStyrp+zcx5jdqq6FgBX8ybh2ZVYjNze13JIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edUDemQUd2j+t51QXeP1AzHxb1Qg2ZCugQ/1AXJXRAU=;
 b=TNPuq2DRI+9oITjF15jYIEE5maR+FChZ4SSfLPcYIpXxy20F3eFkIaEDXk/uabzsTMq9O3durRq0zV12wGY6kHLL5kv9Ep5pK3Qpj9antntTfw0aqmlt0UqfG9lAElOK6SSTXjE4DpCWF7zvXjrkStVDHaKW9EWEeVaL0fuajvs=
Received: from MWHPR18CA0032.namprd18.prod.outlook.com (2603:10b6:320:31::18)
 by DM5PR12MB2487.namprd12.prod.outlook.com (2603:10b6:4:af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 18:12:36 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::72) by MWHPR18CA0032.outlook.office365.com
 (2603:10b6:320:31::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 18:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 18:12:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 13:12:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 13:12:32 -0500
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Tue, 19 Oct 2021 13:12:32 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 4/4] drm/amd/display: Add DP 2.0 MST DM Support
Date: Tue, 19 Oct 2021 14:12:23 -0400
Message-ID: <20211019181223.263270-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019181223.263270-1-Bhawanpreet.Lakha@amd.com>
References: <20211019181223.263270-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2a73afb-0650-462b-4a13-08d9932c0711
X-MS-TrafficTypeDiagnostic: DM5PR12MB2487:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2487F8B621C7287626DD700EF9BD9@DM5PR12MB2487.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2fUG8Q/LaBJqlXo8bY/bcwiZRbvNrNEHG7J/9yXdr7nFxDaiP6JiDqurXAayVWhc72n1KUscymh8zMYIvHfM0ZWspxgadlgAFNr3ztwL/ccTRZGJjNescUovqgKR7v/rIDzkEOP6ngiL80Dys76304ZpyBlwAypKzp7nPG++uk/zSAIp5wDCaZrKdKozBks/MWm9lzaUDeTeBp0o64qoLcVNI2M2exwEkOGiYl55pXBV9oaNmA8J+nO2bRGZOuUAjvyJ2hPLe1l0Wx26epnArC3Kr+VXtbvnJsbo7LKml3TxkxuwD5C5gcFRvClX8DF36dCoydvuHBpD7A21uTNTT3DLhKrPaYlDpDWs2LijVScCFCVtYyj9AyArSn5IM7/EsjLWiqB9hYwn3tAWHx1MvEZIyGG3CwWhtS9XAEFCvbmYj30G/hJSBnuEz2g0FnvLvzWJDyWG32mQG2H4ldtwFXVfzZOgdwxNbBYREwo5ZUnb1GFK1cDY21caKAF10oCfsOXbgiibaJr2EghPrXcK28fqKj/cjBm60AtYlcLtfNKKW5+OPcNd9tSRdPYwLNJGsiiyj11HFUUN0/7f1SRXaWYChKBaR21/nhNzMmeoKSu/qfT9WAGQQcGKRNM6iHMjFtNDPE+/Yl6E3IHov0wdAHDoi0u9/4WCdPf7/dWvskI9DtgN2A9t0oaSGcudW6NV8DfCJiz/1ganLeDlXaratzodi5DI/CbMIA2QUqOD51A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(186003)(316002)(336012)(2906002)(508600001)(82310400003)(54906003)(110136005)(36756003)(47076005)(426003)(2616005)(70586007)(70206006)(4326008)(8936002)(356005)(6666004)(26005)(1076003)(83380400001)(81166007)(86362001)(36860700001)(8676002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 18:12:35.4434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a73afb-0650-462b-4a13-08d9932c0711
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2487
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

