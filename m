Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74839434D43
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 16:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE38B6E44F;
	Wed, 20 Oct 2021 14:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E946E9A9;
 Wed, 20 Oct 2021 14:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uys2CjMd8G3vuG6SS1MLxaENsSWtIG7tLATzfGWPCZHhlB5ACpngpCxKH7ev6qA1D/mKwFsbjEaYm4XhrjYQ09nhQbl/rzo6Rk2KCrpxVZqoxd24BCA4Em2VZZvcQwPmvTqo3zDRf0IxUENLUERdyu4UXGSSh40/NfUkv0TY2kzcSaGhCpJYhFxeOWSx67nHUJ98tJbyiwssle4FNPcyNeZvwasUBSiwRYB89mu1a4uLf/MG0zrkXmZPh94FdzhQQr9cGP3m8dwBasIvzfcOoKlsVz85QoK+5W6Zk2GTf2F7ZySWy2onxEntj6SobOwJGIO4BeYZL9zIdhnBbQftIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edUDemQUd2j+t51QXeP1AzHxb1Qg2ZCugQ/1AXJXRAU=;
 b=d7jhiC0Xdl6sZhhY9isCv6jlQLBCqGphAhrLZPAwi0DprcDTCjljZKgh1kKS/Ed+ki7MrPvSYw3wrTXTEyKIY56yqzyWt9sVP834f6rJtKDO0NUCO1RjPKedavX1jLH72nCMwIG4C/3eezmtvgfdkUIQi+7IjI+AyfiHo05cbBVSD39nFXv+g9gavD+ekCTy5WZRVpwbdFytK1goUu0H0aCROGY2k5EanZ4im5TKtft1z/gb3BhHcZRI9lXWuDs1S35CQiLCTINsb4tj+DND/D9s9VSfchg01BqM4z9ZOHF7k+o/+fzBkOS9Vq0lNsTF0Q/lS5ckTxFvm5aLimjOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edUDemQUd2j+t51QXeP1AzHxb1Qg2ZCugQ/1AXJXRAU=;
 b=yAX4lNsZvNPjj2FPUNFeRGrdb4TqTQL5PmoALRqqlX6nOx4/ckZS1wZh2XxbHRzyV1Vs3nAjCDdOLqzG3TFvvxfT3X5dgukS20OszgpPj7w+3UCY+DdS82YpkRwauvoj2XcSLiydWoxEFsGHA88D7AhS63Ep/dMmt8miZxgukvE=
Received: from DM6PR05CA0046.namprd05.prod.outlook.com (2603:10b6:5:335::15)
 by MN2PR12MB3806.namprd12.prod.outlook.com (2603:10b6:208:169::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 14:16:23 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::13) by DM6PR05CA0046.outlook.office365.com
 (2603:10b6:5:335::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Wed, 20 Oct 2021 14:16:23 +0000
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
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 14:16:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 09:16:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 07:16:21 -0700
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Wed, 20 Oct 2021 09:16:21 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>,
 <intel-gfx@lists.freedesktop.org>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 4/4] drm/amd/display: Add DP 2.0 MST DM Support
Date: Wed, 20 Oct 2021 10:16:03 -0400
Message-ID: <20211020141603.19452-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
References: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e5c0a4-c6e0-4cee-2f7a-08d993d43235
X-MS-TrafficTypeDiagnostic: MN2PR12MB3806:
X-Microsoft-Antispam-PRVS: <MN2PR12MB380615C25B0E7D6985B4C778F9BE9@MN2PR12MB3806.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmnIU3owhlyrRkqEOlY2DzJKkEpgjLzaJ0Pu5OGYUNhRRE/kyPWt8WnShkNsf2w4tr3L/xNUHUOb2A/aHGa/fJaGMseSIYsKQS19G8X60coLqX5tv/TKBnaw0QsJrl3WzZJkaI/FGBXbcufrNAURgOOQoje+SAGBcD6cwDmT9G7ek9PAN5LAxhLP7R3w32iBO30Yxin2IgLSpDxhWmv76s/JghMfrsrWzghCXt/FECiay9lsT50tLxrIky39YwuAA7FCKkisdaCnosJmrbJlM2UrDI8rHmTdi9BG5X1ow5CAIhu8NStCyl3AOuZpMlwsbZmFpFNc98H8AkWZNY0Lm0lw4vOjQeK0XK0KULWfkdKoSLmOvvH9k/NRdaw89J8PXsikLf12xwDOZsE/d6uoZ3zj4R13z+XitT2VAamBL9QFlsPJ52W2iNkQE/jvNMaLMUIvB2uhyQrwFJKnsND6E/9RDoUMUVgOXVT1lbNwRx3dDDZnVKppR6V0eS6xp97kvpC0QwB+TxVU3VQ7mjj7lIibFVbuwQhAkNm6vtwtXYViusg392iomyfV1YHXN4DcbVv2h2ZytE9xs4crrkzrR3MWbZ13sDWuw6qfViRFHmq7TCyfP3F1SQHbUAMtm6YNKXHXsoIbSlwy09RwiZ8J27+/TSBw0hoEynok3VjgqKwECqjGXr+ShkIKDSNK7jt9aqtFZ47XfK6x5oUQQqsSSPq9xHtGQVrXpxvDRJfYAqE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(81166007)(36860700001)(70586007)(4326008)(5660300002)(54906003)(110136005)(316002)(186003)(2616005)(47076005)(36756003)(82310400003)(70206006)(426003)(86362001)(6666004)(336012)(8936002)(26005)(83380400001)(1076003)(508600001)(8676002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 14:16:23.3602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e5c0a4-c6e0-4cee-2f7a-08d993d43235
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3806
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

