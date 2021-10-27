Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701243D6CD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 00:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FC86E48F;
	Wed, 27 Oct 2021 22:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C1E6E44C;
 Wed, 27 Oct 2021 22:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzTNcuYZdvTn/rF0FM9PoVTXzECk5te0GnIJaYX5GAyoRcj8+tWRn5dwiMA1b+4e6cKSorXo4gOpz6zyHZIvSRee4UR3PI+LL3xm+XmYHx9K6oJAVf+tajYU6yTNmhBJ0LLASNjb2os2xzB2n7solimrm36JIN/cWV3sXKrq2zn5KJoeHjiPHP4jihcfMp0evu+paSm+WQb0/m2HJT0ZChi2HLc4+fspNEg3bj+j3pOHXct+qr81FHTObugi+fc1EM1QacZxybypgsl6rulGrXWv0X3A2+5U9ajn2MrwKuEcBgmJmSybobArkpcQ/1F06WQyc6EgEmrkaR4ugq8V/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8g91vHOX44bOaHZDnx/oNB4P8+xQd7SeU9lhRd/6JY=;
 b=PkJ6vr1PY9rH5Mi97t8aWvEQvDfzX9rBjrjZ70g/vSX5dFlc69MXpEFyQyHHmRCIWvhr+1g5rmhDydqHReV0iB+qHshHOb/oyJUPlSgHrBhEhWBN68sIkTl1GQ3GGZhx09o2nQvF2hsbHfTt/cjTCtbz0YIU3LvZ0ofHjgrGYrTUs84eq33jnpeIHdMrm7+5i2kn13VOqjjrxm9nPSSUQumfYlA/kqUcw04cFbAEHUGdURdIPKVzzXsCpeC+S+tKjt736rmH4CNkEqv1zX6CLy5V7x8LTMPzc47sD9iZmWPa++3b1sBouG42bHsrm6L1fKwEA/Hjc3KMdNCNoBQzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8g91vHOX44bOaHZDnx/oNB4P8+xQd7SeU9lhRd/6JY=;
 b=v8iKaqcKl5Sy1uKBWBiWEfUhyU57986l5CkLlye34LOWdYgL4QAx5QbUkwC7+XRXmAbBqX7GalyU9FQ2baGF5XnDmVMiRC6ehLqNceVnUY+Eu9erZw5PhUukM9dmMqCRmvXxolO7mPkhfOIbARFH5YJqhz7lgSLoeXDImX08g98=
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by DM6PR12MB4959.namprd12.prod.outlook.com (2603:10b6:5:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 22:39:33 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::86) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Wed, 27 Oct 2021 22:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 22:39:33 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 27 Oct
 2021 17:39:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Lyude Paul <lyude@redhat.com>,
 Dave Airlie <airlied@gmail.com>
Subject: [PATCH] drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is
 not set
Date: Wed, 27 Oct 2021 18:39:14 -0400
Message-ID: <20211027223914.1776061-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10debed3-9b67-4ef7-4f58-08d9999aa59a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4959:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4959C2A3B2F7BE1F97FA3E2BF7859@DM6PR12MB4959.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDllAc+sQULe2EnPUFcUZxBUzV+hGyINxLUjFboO9YNrw1DlItZPceLqmwmE7Bd28+dpvjEYBxc7ppBOVbauub3h4i6RcCLpLzEpi26NmiqmR6uns+9KZ/TfW43VDjC+pMGqXLlmTnVfg3ZG2Kua3dRHoDswrUThiiCwvSnYEQFZlP/TIwqbdpuuzXooeQ9q3zQrwGRIFFlTNojNxvI9f3Q0MXYKETT4cF2jUkGl+eDbqSXfL7C4iJcnPA6QuQBSd8QwyeVvOVYDmqqMO6iItTvuH6R0D9bzGk94lYSYhEqF/euWYcUtM/KPzvcgUWUew3SRbyuPQiNe13/pkW1hRUJvx4UKP/WHE8ZX6AB27Das2EtonN0/fWF2VtqmNL5lh1WA0vHeWlETQ2MANFO4UIxP7i/r3AFIl+nsp7aBYcGuTDtbxnWKWIcdxpEA8I2o937NTzhzGsgVRxIyflPAqFz1Es+6eL1DdaOyLShSfkOXzFdgBX4BZCnAvcd6UGxGU2Yxha2U+pZWwdSFXsW31t53EPwYCfFNtwSsGZHS6bBhd6vVGx1CnL+wO9hUw5xEtW9POEDcumGy2zkD3wcxx0mk64kZTm754MTG8RaoA4IxonV4hgslezL4h9zog/E/uHzz/oyu5xADy4ITw9R7biZT46xmeM3kkZtXi2Tjkdx+qusdfnzLDEqAcZcjCyJuJmTIGrJSDd5iujgkCvkt0KHulUh/9kXNh/GI5fIIBcU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70586007)(70206006)(54906003)(36860700001)(336012)(110136005)(186003)(83380400001)(2616005)(47076005)(8936002)(26005)(16526019)(1076003)(36756003)(6666004)(2906002)(81166007)(426003)(356005)(508600001)(86362001)(5660300002)(82310400003)(4326008)(316002)(7696005)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 22:39:33.1003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10debed3-9b67-4ef7-4f58-08d9999aa59a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
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

Need to guard some things with CONFIG_DRM_AMD_DC_DCN.

Fixes: 41724ea273cdda ("drm/amd/display: Add DP 2.0 MST DM Support")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>
---

Lyude, can you apply this to topic/amdgpu-dp2.0-mst? or Dave, if it's
already pulled can you apply this to drm-next?

Thanks!

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a02ca525610c..3f36dbb2c663 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10723,9 +10723,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	struct dm_crtc_state *dm_old_crtc_state;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dsc_mst_fairness_vars vars[MAX_PIPES];
-#endif
 	struct drm_dp_mst_topology_state *mst_state;
 	struct drm_dp_mst_topology_mgr *mgr;
+#endif
 
 	trace_amdgpu_dm_atomic_check_begin(state);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 719cbec4c45e..c200e07d2fb2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -219,7 +219,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	struct drm_dp_mst_topology_mgr *mst_mgr;
 	struct drm_dp_mst_port *mst_port;
 	bool ret;
-	u8 link_encoding_cap;
+	u8 link_encoding_cap = DP_8b_10b_ENCODING;
 
 	aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
 	/* Accessing the connector state is required for vcpi_slots allocation
@@ -239,7 +239,9 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 
 	mst_port = aconnector->port;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	link_encoding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
+#endif
 
 	if (enable) {
 
-- 
2.31.1

