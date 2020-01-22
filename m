Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF158145D7E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DC66F8E6;
	Wed, 22 Jan 2020 21:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB646F8E2;
 Wed, 22 Jan 2020 21:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2qfzYs1aYeQlndO9sg3rxzC4T6+e7tw4rz5G+2AkkJthHEJhEAQOkWXf1TOxgxUAmBs7fP16uYzy4KuSHYgXu5jMPSB3meWM4paK6coM7By3NKy2XF7H2PmzexFi2w7IjK7ER+gYvpeabeXUZAZgQNn9AKDjE9bwKKw+BCINgSreUTFSBn8nAujvR3YeJID75t4hv6I/MOvIkCAbX0TGJFUqqtiA2L+EXcjNXCz5FQPjsWXwQE12FYbbjhvYweU/8mbvrJybgUMRfYBisc/vm4bq+ogPHWYxa+3Z6sGtFP7drjsSyDZo8CObeQ7XTi9T3SBCgIAmbczAUdUHTHLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSvyH2C1EilFcLPnmoZUu4UycUzAmgK848VudD+wgbA=;
 b=ifhGb/zgbU9E0INeEAF2uTHu2VMhG3wnKsNKE3ccAAWlW6gug9JfXpfImvozQYWbQymVG+w6DC5qMBO3Wgn7tcX4oZ/grbSqg1sbUElOLVLb+Q3OxWAo+KtgYvYUVHM2WPbA6OFrYa8j8dN0vWGZfmYmAIKbOFkhzyIpZeIDNgqv4WytHh9SYkpvcARw6+dKp7L0B6+KUQn+rOki2Y0ruBFhnGqlAsvCkygTk6dXfgTYlEF/hbNSap0FaIaw3+StENSNtZ2EYppfxXXjm0jd++KmbkLVnB2lT9yt9QJo0/U+kPS67u4To2XliFY2bMQc/ZXSTCObv4swnb0BOuHTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSvyH2C1EilFcLPnmoZUu4UycUzAmgK848VudD+wgbA=;
 b=xvj7I9cFJOw9TNNZVU9qVUyVHlhtVxRdAkfEL7EPuaHne09n5ca4Da8q7nSXLZtWoL7WlrATOY3WYehtgRYqSDdOZEFGJOPgRw4+C9A/edN/wHCVb4jQJkiqUiOrR0IT8aR9tFbD0OC5vBVUQZcuUbJfTe9i80PhDGs3EBuo2jc=
Received: from DM3PR12CA0093.namprd12.prod.outlook.com (2603:10b6:0:55::13) by
 BYAPR12MB3288.namprd12.prod.outlook.com (2603:10b6:a03:130::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20; Wed, 22 Jan
 2020 21:06:04 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by DM3PR12CA0093.outlook.office365.com
 (2603:10b6:0:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.19 via Frontend
 Transport; Wed, 22 Jan 2020 21:06:04 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 21:06:03 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Jan
 2020 15:05:59 -0600
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Jan 2020 15:05:59 -0600
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <Alexander.Deucher@amd.com>
Subject: [PATCH 5/6] drm/amd/display: call psp set/get interfaces
Date: Wed, 22 Jan 2020 16:05:47 -0500
Message-ID: <20200122210548.2647-6-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
References: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(428003)(189003)(199004)(26005)(6636002)(6666004)(186003)(356004)(8936002)(36756003)(336012)(426003)(5660300002)(478600001)(2616005)(1076003)(70206006)(110136005)(70586007)(450100002)(7696005)(86362001)(81166006)(2906002)(4326008)(81156014)(8676002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3288; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b74a4bf1-02d1-495e-0dc1-08d79f7ee3ed
X-MS-TrafficTypeDiagnostic: BYAPR12MB3288:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3288ADB869C5BB662165961EF90C0@BYAPR12MB3288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 029097202E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Um9EU0B82UnhuakbmDPmxmHscTpOlfB1B5P+UdkU7kDqRxYpoNb0fRwp9VhZF9p0qQhSKV+R9ZiIkznAWHVCCaSm25g0cu9231SH8paneJAviARERl+OnYco7BSZtIPK3GyRL/DdA6o/umOK5sFcPPqq/9lF2R2kHY/zUp+QkAb3Vi5NVvIu9g+tG9omky1Bm5R2tMjWIyc0oj8WuolV5c9QCgJfkeu657S5Yzed6+TDblUJLbIFrm15+rxGS0B+rexohXENe2mERNZLFteHZqHQhxuW6guBRLPdiWdjU8dnOl/WgcHdHPGlt28cDi+PQo2tfeIkW8jsB85g8S/LDH/D3vze1L7XQYilwb1zDO1rTDB/WK5+NLtHXKBJa6vhFAo3vacmoj3mJA9KFn2Xna77EIygMAlXpIWwWYlM2PZW0GY6BxaQ6v7zdy8pf8p
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 21:06:03.3272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b74a4bf1-02d1-495e-0dc1-08d79f7ee3ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3288
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call the cmd ids for set/get srm according to the sysfs call

v2: Use define for the magic number

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index e6a89cd7ed57..1768a33b1dc3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -30,6 +30,11 @@
 #include <drm/drm_hdcp.h>
 #include "hdcp_psp.h"
 
+/*
+ * If the SRM version being loaded is less than or equal to the
+ * currently loaded SRM, psp will return 0xFFFF as the version
+ */
+#define PSP_SRM_VERSION_MAX 0xFFFF
 
 static bool
 lp_write_i2c(void *handle, uint32_t address, const uint8_t *data, uint32_t size)
@@ -71,11 +76,54 @@ lp_read_dpcd(void *handle, uint32_t address, uint8_t *data, uint32_t size)
 
 static uint8_t *psp_get_srm(struct psp_context *psp, uint32_t *srm_version, uint32_t *srm_size)
 {
-	return NULL;
+
+	struct ta_hdcp_shared_memory *hdcp_cmd;
+
+	if (!psp->hdcp_context.hdcp_initialized) {
+		DRM_WARN("Failed to get hdcp srm. HDCP TA is not initialized.");
+		return NULL;
+	}
+
+	hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
+	memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
+
+	hdcp_cmd->cmd_id = TA_HDCP_COMMAND__HDCP_GET_SRM;
+	psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
+
+	if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
+		return NULL;
+
+	*srm_version = hdcp_cmd->out_msg.hdcp_get_srm.srm_version;
+	*srm_size = hdcp_cmd->out_msg.hdcp_get_srm.srm_buf_size;
+
+
+	return hdcp_cmd->out_msg.hdcp_get_srm.srm_buf;
 }
 
 static int psp_set_srm(struct psp_context *psp, uint8_t *srm, uint32_t srm_size, uint32_t *srm_version)
 {
+
+	struct ta_hdcp_shared_memory *hdcp_cmd;
+
+	if (!psp->hdcp_context.hdcp_initialized) {
+		DRM_WARN("Failed to get hdcp srm. HDCP TA is not initialized.");
+		return -EINVAL;
+	}
+
+	hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
+	memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
+
+	memcpy(hdcp_cmd->in_msg.hdcp_set_srm.srm_buf, srm, srm_size);
+	hdcp_cmd->in_msg.hdcp_set_srm.srm_buf_size = srm_size;
+	hdcp_cmd->cmd_id = TA_HDCP_COMMAND__HDCP_SET_SRM;
+
+	psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
+
+	if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS || hdcp_cmd->out_msg.hdcp_set_srm.valid_signature != 1 ||
+	    hdcp_cmd->out_msg.hdcp_set_srm.srm_version == PSP_SRM_VERSION_MAX)
+		return -EINVAL;
+
+	*srm_version = hdcp_cmd->out_msg.hdcp_set_srm.srm_version;
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
