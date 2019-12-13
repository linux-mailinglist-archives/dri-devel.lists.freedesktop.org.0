Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE911EBCC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75B6EDB4;
	Fri, 13 Dec 2019 20:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6D96EDB3;
 Fri, 13 Dec 2019 20:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWhRgGTngMXroqBU3hRYR4dVx7MeUbmBYHmWfcwV6I/YURuI4FEihMzW54SANkQ664YC7wWM2NBpYkJh4n6tsiIHjeqQWYZ4MxPln6OesXbTRdMvcTD5dpI/NIWLgOeWlyaVmD9SQ+gsnyYgVLUbprqze56SWVGL5nr8coVPT3oGXPav5FlPvJjdyxim+dpXtWH3QEoqJRqNCkXoGIpEnm04SLImmZY2mC7REyZIf9secjvf67ltyq/34wlab6ClwBs4LKSqweacYUY/cMfh23dDSljsByOmsfGapirNBA6epAkdeJXS08YF6FpQCMCHLA9+ZlChaBT1O/XPGdszgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bAGsSniVhFgIW3uf4W2luVTmKF9bUZ/zY5deUTc8DM=;
 b=Knh3cuRKowEDGEYgYIQwGz5fi0eydaoXvAh8gHy3V4gOvy+cyBH/3/S0ues2qHz1uM1ix7zg6G5YILI8hvQuwpGSbSoeSaGekKZBJ2PFnu3HDMaZBJrSHv55mdThWSUZ/DNjuOHdXrzGOajaKXcWmewqaPG+9BAsLScgpC73JAZzDPbuE2mfCfy/ZEcG0RWg/IWbg0xd04y+Xy+9DinUzbjKc8D4gWl3njlVFPW5VSq787kzsw3+KwT+Sb2cx0o0w2K3hGa4VeTRrdS+GJEWv9f1t4BR+tj7mI7w8WpEcrLJlcJK/9KUM7u4OWxEbqFlVLCOM3gyXjOxgovZTTubLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bAGsSniVhFgIW3uf4W2luVTmKF9bUZ/zY5deUTc8DM=;
 b=1C3FPV9PM6z2L+CfBDo5FbbexVCAJl5v7t12LMgzTqMWZqyKghnAJqeSucy+ObRm5azFws4DY3HlZXNZ6So/uoBjPiJvVujrOl0VKY+OofkNh6j8M8I6Bh8zBBt7+cJNl10/kSlwLxGSbqfL+MmFCsI8C9m7l+hJX5FC7utwGac=
Received: from SN1PR12CA0100.namprd12.prod.outlook.com (2603:10b6:802:21::35)
 by DM5PR12MB1129.namprd12.prod.outlook.com (2603:10b6:3:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Fri, 13 Dec 2019 20:09:05 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0100.outlook.office365.com
 (2603:10b6:802:21::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:05 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:05 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:01 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:01 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 08/18] drm/amd/display: Validate DSC caps on MST endpoints
Date: Fri, 13 Dec 2019 15:08:44 -0500
Message-ID: <20191213200854.31545-9-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(428003)(199004)(189003)(1076003)(8676002)(5660300002)(36756003)(8936002)(70206006)(81156014)(6916009)(6666004)(81166006)(2906002)(70586007)(4326008)(478600001)(450100002)(86362001)(15650500001)(356004)(26005)(2616005)(316002)(2876002)(7696005)(54906003)(186003)(336012)(426003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1129; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa28cef2-40bb-48d6-7de8-08d780084e1e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1129:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1129A3B0E0045EA66BAF3DC7E4540@DM5PR12MB1129.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 78FE9sNWwHlT9JmMmfEfUIg6K2acR1F1mCarOOk0TWdKK4PvEIr75UYsizAdw2TvkXCViq3xR/dZEy7FgzX0+tZMlV3/3tmSdZHRgpL00GPZZZFT51mzIJnuehzxW2jHwzoL58mahJ3HLcqPih8i45RQ5jSYL7wu3RypF5XE3TziU9p3LYtrbV+VjJhXWqYQEyCPEiVSAL5keXpTfoy2evdUd7tvmkGep++23sEzO5G74yoySBGYQSXCUsMc9p7mOko3PiDaiNebg6D14A/pW1J7xLv/pTUvw1ZI18lTCi8js0A356I1iepeEgxs7kJIpMm19MjIz9D1iqAgh2mJ4/OFaGDtcG3UTDsyovck03C1To84eccIkIhMJXibEf/RYgmhrcLDAykFA+mdVk/iGqG85A7/JGVLfRWQJQeOkck62XqXwGVz7HG+IVTm3oM0dfTOQa1mvCmz9l0j3JXBfzUGtNPecUYLoLSUzLHMoz5yF0UQZoH1RAItrVSVNTRd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:05.4499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa28cef2-40bb-48d6-7de8-08d780084e1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1129
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Francis <David.Francis@amd.com>

During MST mode enumeration, if a new dc_sink is created,
populate it with dsc caps as appropriate.

Use drm_dp_mst_dsc_aux_for_port to get the raw caps,
then parse them onto dc_sink with dc_dsc_parse_dsc_dpcd.

Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 27 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ae36d99d0fb2..b544498d435e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -323,6 +323,7 @@ struct amdgpu_dm_connector {
 	struct drm_dp_mst_port *port;
 	struct amdgpu_dm_connector *mst_port;
 	struct amdgpu_encoder *mst_encoder;
+	struct drm_dp_aux *dsc_aux;
 
 	/* TODO see if we can merge with ddc_bus or make a dm_connector */
 	struct amdgpu_i2c_adapter *i2c;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 81367c869134..7557edee7db0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -25,6 +25,7 @@
 
 #include <linux/version.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_dp_mst_helper.h>
 #include "dm_services.h"
 #include "amdgpu.h"
 #include "amdgpu_dm.h"
@@ -180,6 +181,26 @@ static const struct drm_connector_funcs dm_dp_mst_connector_funcs = {
 	.early_unregister = amdgpu_dm_mst_connector_early_unregister,
 };
 
+static bool validate_dsc_caps_on_connector(struct amdgpu_dm_connector *aconnector)
+{
+	struct dc_sink *dc_sink = aconnector->dc_sink;
+	struct drm_dp_mst_port *port = aconnector->port;
+	u8 dsc_caps[16] = { 0 };
+
+	aconnector->dsc_aux = drm_dp_mst_dsc_aux_for_port(port);
+
+	if (!aconnector->dsc_aux)
+		return false;
+
+	if (drm_dp_dpcd_read(aconnector->dsc_aux, DP_DSC_SUPPORT, dsc_caps, 16) < 0)
+		return false;
+
+	if (!dc_dsc_parse_dsc_dpcd(dsc_caps, NULL, &dc_sink->sink_dsc_caps.dsc_dec_caps))
+		return false;
+
+	return true;
+}
+
 static int dm_dp_mst_get_modes(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
@@ -222,10 +243,14 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		/* dc_link_add_remote_sink returns a new reference */
 		aconnector->dc_sink = dc_sink;
 
-		if (aconnector->dc_sink)
+		if (aconnector->dc_sink) {
 			amdgpu_dm_update_freesync_caps(
 					connector, aconnector->edid);
 
+			if (!validate_dsc_caps_on_connector(aconnector))
+				memset(&aconnector->dc_sink->sink_dsc_caps,
+				       0, sizeof(aconnector->dc_sink->sink_dsc_caps));
+		}
 	}
 
 	drm_connector_update_edid_property(
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
