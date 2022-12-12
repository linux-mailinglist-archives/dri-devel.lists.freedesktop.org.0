Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5164A6EA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BD310E26A;
	Mon, 12 Dec 2022 18:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6D910E262;
 Mon, 12 Dec 2022 18:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnsXSs3Bnc/Dx046zn1eYanLgIfRtkt7PztpA5vhmEqXd8wUOGrH/7o54ABikP3XXdWWo/7dKxwZwyY1/tqhl0sOCqth62LBmvdOQt3mWzB3khLmYFjPxQrYX3QNrWM+vsntSeV6ala9UUN0Jh1PGuYSi/Pj7QCJ95oy1mUsNyIR2XzvixuDJFCfhoIyg7RBtRO9eL5eG0SdWFYiOzWFlYdfZ+/skc3fWCuKKqRFLpX0aLLa7cRS7XD2X1dvdkLeXSO0dcUN9G4+5CfxyGy2KSHZkhvh8RKntTkFFSSE+SJLd37fUAsVbxqY8IqPGHpacO/faVxX8wwVkN3KRpiR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THwYQK8M1CE0cNtnrcXk+e+ULQkOk5fC0QlDuhKHl3s=;
 b=INpNJBQmKRk4n0TesxljZtO7Tp0LeTsG2wnG6v27h/V3+SCano6p7lRGgKRMKSh2ECAGrhYh2DyW8ROA3h2/kZAavIhAx9SYvGT/CXrZnS/b4YhcIBz4xb80rfQLOpLzOwTR9DVjA2gt8a14edLs7R1/fa9PtIUheHTlBqxNQ8s9cqHFZs1SBw37SLPs9hpxwfB+98cZb57VsHK9sMvdi2uq3zk73802Yo2EbYlWLRbazwvi587PhVqBssMsvWJgVEMdj1mNbrdIXF/PZvE3Pp7XfmiWMqlWJem4MjzlDsl4vTQtCzNlIDWVyp9jURegkuwcGJzSXbz1WGkrLIgdkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THwYQK8M1CE0cNtnrcXk+e+ULQkOk5fC0QlDuhKHl3s=;
 b=WyMTWf3jEHmJdXI152VbmzdvbiHFaOQeogcc/SppUeS61a0a0yhZQBQczPC9Q+7WTfkVjXPCfMeDTlZ51Me59eiPz9CPKZV58lVVXrLqifVChyFtPjiybv6H7g14bXvBn9uW9u5LINuZGqXodUnEx9VdsgV0T9a51dPZty0MmS4=
Received: from BN9PR03CA0477.namprd03.prod.outlook.com (2603:10b6:408:139::32)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:24 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::5e) by BN9PR03CA0477.outlook.office365.com
 (2603:10b6:408:139::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:12 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:11 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/16] drm/amd/display: Always pass connector_state to stream
 validation
Date: Mon, 12 Dec 2022 13:21:29 -0500
Message-ID: <20221212182137.374625-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9061d8-2624-4e05-2a77-08dadc6dd116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUo95Ko/m+OYErJgB93wZeSrzWr0j2Tbvs9Yi35e74GQafAzBMofHdcnRnT7ooiHPY64cpr1+r2SMMwUSeiYL1m6fgzm6DkztNid0IshnWhj20EXqhjUCdXgJZL3qALItT7Ye4y4Hl+Cn8au25nnEVouTuw6fDphMkqWQQXj3wLT1gJrGFQc10eQFzJKoUTyQqswDUMQI6Ohf1QkgXSH1TmhX3OTUWLKVoOdKCSqe7FfyCGGZvBFScLYApsOMoH7+1aCoDAugkekGvF/OIqC63lFDWkZi/9bOht+A/opFu6GiiQN5vi/ntzkvYrrDVH9iMK5w9e8izNarGC1jhu+3p+wR6YzsnYxtLAFAWjXGMgHzXCIQXdRi/jgdY9Zff6sgg5zfh4R5HheZGmTvDzwWsJ0LvD3NeMshrWxyOnCYp091kkWKhHHgr63BltYcVAXr3X6DABj1b4DPh04zibeCZWiGwYTwuWa37pj5fZIkqtDxNAq9Vbts2j8U86HV47zI2AjSf6ApNNTfdYwhG/HCVwCzi0ztA1fgj4FZgOL4QU/QaFDZBJ6n0GqB5nG5ceyhkZbjw79dP8Dlu7jSoDqO56aE8u2fcvlxPlxt1Stjqrm1ZAdUpnEv78lKZQlc6a/YzEudas/HK4W8tc70URL2rkSLmf+gXMgsOBJTwCJg56csJH5uD4iBt6oHIbUCMdPWJehta8pa0NllwXdhj7m0+Ju5aqzkb9Wy0JPmjvbTVg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(81166007)(40480700001)(8936002)(478600001)(41300700001)(6666004)(82310400005)(356005)(82740400003)(86362001)(40460700003)(36860700001)(5660300002)(336012)(1076003)(44832011)(2616005)(316002)(70206006)(110136005)(4326008)(70586007)(8676002)(186003)(26005)(66574015)(54906003)(426003)(83380400001)(47076005)(7696005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:24.3314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9061d8-2624-4e05-2a77-08dadc6dd116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need the connector_state for colorspace and scaling information
and can get it from connector->state.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0f391a147354..74cb0e200d90 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5761,15 +5761,14 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 {
 	struct drm_display_mode *preferred_mode = NULL;
 	struct drm_connector *drm_connector;
-	const struct drm_connector_state *con_state =
-		dm_state ? &dm_state->base : NULL;
+	const struct drm_connector_state *con_state = &dm_state->base;
 	struct dc_stream_state *stream = NULL;
 	struct drm_display_mode mode;
 	struct drm_display_mode saved_mode;
 	struct drm_display_mode *freesync_mode = NULL;
 	bool native_mode_found = false;
 	bool recalculate_timing = false;
-	bool scale = dm_state ? (dm_state->scaling != RMX_OFF) : false;
+	bool scale = dm_state->scaling != RMX_OFF;
 	int mode_refresh;
 	int preferred_refresh = 0;
 	enum color_transfer_func tf = TRANSFER_FUNC_UNKNOWN;
@@ -6381,7 +6380,9 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 		goto fail;
 	}
 
-	stream = create_validate_stream_for_sink(aconnector, mode, NULL, NULL);
+	stream = create_validate_stream_for_sink(aconnector, mode,
+						 to_dm_connector_state(connector->state),
+						 NULL);
 	if (stream) {
 		dc_stream_release(stream);
 		result = MODE_OK;
-- 
2.38.1

