Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624F11EBA4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885016ED65;
	Fri, 13 Dec 2019 20:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035BC6ED64;
 Fri, 13 Dec 2019 20:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKi98zW9H23CqTijSAVeTQAwZ+QnbpPtVUK3kikpCuyz8F6B9glagFvB3Dak4KE8xbsr7cw5hb+A9xZyAz2z7j32TBgxHrbgTGbE/7uWFMKLtEU4V1SxsR7o0BdMY6GKB++v0RaY0OAv9eenURQXHru+KPbUKnfFCnr9fgC/zbJKgX0WFb7wlhyCZ52a9r9jSfMurnGrLFHM3O+utCjLn8WgMkOPg6EGfAFFTXwQ4swSxG5Edx6RmVUurNoW4FsVCk5TZRh+pxMpom4KNAvNz9KDBmO+zYd8Qt/3EIVXzJ6FP2Wpb8z8Wbhf0Sh55wvNqm/l36aGIHf1N/Nyaqjy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaDxAZYDiPurw7EgRl+RMDhTJWPv4s80a4VZEkuEoEA=;
 b=lz24Y0S59yJv2YRQDbOmb7UwLQwIVLpHw58QkjmEjjFeOl2qJBRAykUBX08t10VzdsPDLObe3BpBNy8kx89vZVAu43/RJpkWgBQDRQTsvyAGahxMu+kzicStPDatvHPHT9dW4JsNzaz7leTY3xg/Q6bltxT0v4IlrbHf/YxbqSnrDeVCWdJURKAYyAMTQ1Ra5j6MtkkXrH8gX4Bkot+yqKb4maFgOa5rC3EU01bwdQ5QfJibvp2eoGZ7ngsfufZ4NBjSMbJ0UvEXNcPDu0eUYPjc+QIGVyntooLg1NTmLA/OF4ZfvtJSzmN++ns/7w3WVwK66XwHyatgagBdfWYQfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaDxAZYDiPurw7EgRl+RMDhTJWPv4s80a4VZEkuEoEA=;
 b=R1tL+rfKb2qWxN1jX+jvhQXLhM8iPMfxOo1xG1t5o4NwaCz9T2AvS1MFRfd8M36llPrUYKcNXA+C3uiflPCLgUgB31OeZybjXVCMf6SqV1KxuVMI87iFPK4GH1GuK1+xdpKeETxqps1czItQRSzrQF/4B2r710riU9qCnXkiih4=
Received: from SN1PR12CA0093.namprd12.prod.outlook.com (2603:10b6:802:21::28)
 by CY4PR12MB1543.namprd12.prod.outlook.com (2603:10b6:910:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Fri, 13 Dec
 2019 20:09:08 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0093.outlook.office365.com
 (2603:10b6:802:21::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:08 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:08 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:04 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:04 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 14/18] drm/amd/display: Add PBN per slot calculation for DSC
Date: Fri, 13 Dec 2019 15:08:50 -0500
Message-ID: <20191213200854.31545-15-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(428003)(199004)(189003)(316002)(336012)(26005)(70206006)(81166006)(6916009)(86362001)(356004)(6666004)(81156014)(7696005)(186003)(36756003)(54906003)(2906002)(2616005)(1076003)(478600001)(2876002)(70586007)(426003)(8936002)(5660300002)(8676002)(4326008)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1543; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b6324e8-418d-4e1e-86ad-08d780084fbd
X-MS-TrafficTypeDiagnostic: CY4PR12MB1543:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1543E6795805E334F3594181E4540@CY4PR12MB1543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rlC05IF6f1FjjqQ09tHFEpKoQjxe3RAjczM8qy4exLKwEf+DaAFQrV2DjnMMGgpz+p7YfFEWXPs3PbWC4nr1ZXlazh7FILftisYT8rUhr1p7Myfv2awhLspPj3ICtwBWXLDF3yImQEn020SuS1xo7FERkWCXghh7JTC7qN5H/pnJosbOnxvrYZTn1lJiLfrFiEMm83X2y7Z8MR6fCaZZatF31kS9c2FT2ZYQZCX11mPDBMRW4YWgN01gXp/YGbOXaccNL7Vct/yXMzbKDQKHzYIx1lN1LBE5pNjJu91PWEmnD0NtzAYZi3etiICKGCxLtlPPXU24EPDk8bSC7x8fJClBYVRliJ4WB6ddEUczi7IcmgC5YafepkuESRxGNHaA3BTR4McIiO1tWu38pldmk7I9GYbs9nYHd+BMiJ81/3zJ9IAK7Qa044Xj6DY9xhPe9AyY1mm5zv9fVfB7Dz75rcxeqLDdqm803YhZoC9lSFhE9ZGVYngeH8/kGlSVbny
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:08.0748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6324e8-418d-4e1e-86ad-08d780084fbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1543
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[why]
Need to calculate VCPI slots differently for DSC
to take in account current link rate, link count
and FEC.
[how]
Add helper to get pbn_div from dc_link

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 8 ++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 7557edee7db0..c376c8ccd391 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -491,3 +491,11 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 		aconnector->connector_id);
 }
 
+int dm_mst_get_pbn_divider(struct dc_link *link)
+{
+	if (!link)
+		return 0;
+
+	return dc_link_bandwidth_kbps(link,
+			dc_link_get_link_cap(link)) / (8 * 1000 * 54);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
index 2da851b40042..a553ea046185 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
@@ -29,6 +29,8 @@
 struct amdgpu_display_manager;
 struct amdgpu_dm_connector;
 
+int dm_mst_get_pbn_divider(struct dc_link *link);
+
 void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 				       struct amdgpu_dm_connector *aconnector);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
