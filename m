Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7BD669DE7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B0310EA45;
	Fri, 13 Jan 2023 16:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5300610EA41;
 Fri, 13 Jan 2023 16:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaXxPH2PACECs1mDrSmQVOlXcKQv2RyxrR2YN+tqSh13IlgrRRyQPbmg5UtIvLxvZPtPH36wVD8kix7yhJ/AakdzOxtkkfjUJFuaJ2/ibdYsq4hn7X0jTpedTKKQM6LnTKwsl2x5AmYtNtM6d0HtIcuQwTi7qP3ZQhn+SxorOvLSYF0w9gCnkuye3G6/53G+oiy1RAt8yKc0VtPGErTx9d4Pb3XuSVWGVt614VfStMEJKkI/29+OYDoT2gtFRj7vKMSepz6Ix6IpZm6B/mtJ6trLcN1jnldhjIMjPCQv6PxpBocjApvGjAhX8PDhd7TmR8o/vYb9gqmKELa9IQDKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UbE7PYOQjI8gsCXEp48tAoVUErD6R8wWQhilTvZIFw=;
 b=a8qQPmAVKx01FQQ60XI2Q7yimWjWbU603nBDCdAjc0qK7S7zQ8S3KHlNxR6oqbDJpOCHUgjlpWEDHp4B3bN17OR8eMNyaesP7iyBAgZwkzieDYbQuuH2EGFsiSNfWJxNAa2W3cD+BYw8/6fTLMPEESLz4+4f56R6vBjCrzukSX86BuP/nzm6xBlXeMO1pxW5DzK+CqphOVTQP1m9YY15UX3Hv3Sz6mxVnW52DIgBJWQJ5qQAGXZ4R280Cg9t3r63fLtOLIGT+TNZrNQKVQdqw7jRZotCB8Gt3qB99lKH4PU74JfUlw7Rrbs53A7AWGQTzK0sd/pbMjkKA1oaf4j1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UbE7PYOQjI8gsCXEp48tAoVUErD6R8wWQhilTvZIFw=;
 b=2yMG1J01IF2xBledSxTTz9M4W5Ni0+2DhsXki+IzkD6b0ozfBlZuZRdzMIBA+w9woy17RmxGaUK9/SZu4LQzc4OXF9YERg1Tu4uuBwQ1Q4oB+u0t0SP5sfl6OG8ju7a89yLjR/q+uooyrGCCeTII5CCyabCxboBsVfSkq2o3pqw=
Received: from DM6PR08CA0040.namprd08.prod.outlook.com (2603:10b6:5:1e0::14)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:26:41 +0000
Received: from DS1PEPF0000E630.namprd02.prod.outlook.com
 (2603:10b6:5:1e0:cafe::8e) by DM6PR08CA0040.outlook.office365.com
 (2603:10b6:5:1e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E630.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:52 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:52 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 03/21] drm/connector: Drop COLORIMETRY_NO_DATA
Date: Fri, 13 Jan 2023 11:24:10 -0500
Message-ID: <20230113162428.33874-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E630:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: b01a918a-593a-42f7-4d4b-08daf582f3aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWTyN63ZrsPaWlbod61gWaftELZyvrPrNWfTl4yoF0FJU5YI6WFARulM4kdufj8mn9AOJv/hhqIzXGYObE9pAi4g+jIMdesHt8uAdqtt3tyiVFMJIHMOAmuJc2a/UtoCNKpi3ErGWEVWY2Dt3062m6DIYcKfht60n/e3wLgt9sT46qNTcUFXlaXijh8W2ql9DUV3IwyG+pslh1FP4cU13t5mblabgNiAEHzucVknqIEcQDilgZ3mssXbOfEkcUd3wnFYqYpf6L85nuTrES3Xqd8cbUFyzIr1NLQVgntuUaToH7NwCjAiexmubgmeTyaCeYrg1ylUUnjnQttecMSyfa2V+33kEW3A0JuU4Lgqi3ezh0eemvsyGjr0OV1lZ1XPjdL9tnFdVRS58spBmh3lJH9XT9jEjIQGUIBgsJDOSYi5iT+Ff+YvAfDrhcXYC840TXBDf6I7MRhm3+GzbEL+R6ly74wiQv1YRND28Odcor1bakBQZiPzBHBX+/Jc45LfIMUL1ymjZkNla2Qs8St+Ep6xTwmwb5WPrK6PFnjTTB0NUHAS1Su4A6wWzo/R/2zo6ihiQJazugox8xLyR/8wL9zi4uQpR7lrYKPS/ecXOT/Qs3xJU5/ArIOMIfAGBnW4gLiwPdh+Ih/DbaiFYaA7G+I8v4YH+G0lzqiSapisFxP1yG0OibV2oJARqD91tzs+gkV8dT+RlSoOrAJ7Rso+qx0vfO1zLOq86IHUnV+fT6M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(8936002)(26005)(40480700001)(478600001)(186003)(1076003)(336012)(2616005)(70586007)(8676002)(6666004)(7696005)(41300700001)(110136005)(316002)(54906003)(4326008)(36860700001)(86362001)(83380400001)(82740400003)(40460700003)(47076005)(81166007)(356005)(426003)(66899015)(70206006)(82310400005)(36756003)(5660300002)(44832011)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:40.8299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b01a918a-593a-42f7-4d4b-08daf582f3aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E630.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211
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

The value is the same as DEFAULT. The HDMI_COLORIMETRY_NO_DATA
makes sense for the infopacket but it's meaningless for the
connector colorspace. or, in otherwise, just means to go with
driver default.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 2 +-
 include/drm/drm_connector.h               | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index faf5e9efa7d3..c1e6851b2606 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -103,7 +103,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
 #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
 
 static const u32 hdmi_colorimetry_val[] = {
-	[DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
+	[DRM_MODE_COLORIMETRY_DEFAULT] = HDMI_COLORIMETRY_NO_DATA,
 	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = HDMI_COLORIMETRY_SMPTE_170M_YCC,
 	[DRM_MODE_COLORIMETRY_BT709_YCC] = HDMI_COLORIMETRY_BT709_YCC,
 	[DRM_MODE_COLORIMETRY_XVYCC_601] = HDMI_COLORIMETRY_XVYCC_601,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4d830fc55a3d..62c814241828 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -375,7 +375,6 @@ enum drm_privacy_screen_status {
 /* For Default case, driver will set the colorspace */
 #define DRM_MODE_COLORIMETRY_DEFAULT			0
 /* CEA 861 Normal Colorimetry options */
-#define DRM_MODE_COLORIMETRY_NO_DATA			0
 #define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
 #define DRM_MODE_COLORIMETRY_BT709_YCC			2
 /* CEA 861 Extended Colorimetry Options */
-- 
2.39.0

