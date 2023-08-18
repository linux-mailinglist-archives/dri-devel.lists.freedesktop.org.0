Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6EF780C5E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B94610E508;
	Fri, 18 Aug 2023 13:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7EB10E04E;
 Fri, 18 Aug 2023 13:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG6WrxiL1qsfpZk3pDgxqs9p6E9uI4Eq9q5yfviR5HkhuCSHSQtcRl8AXdHWa/oN2X5voT+bb5hUqQCyE//x7GwvLmyO9bnoZ0QNGcemHKZ/O+RuPUAt137YDky0V5xDYEmlIZeLBCTggTYwEmncEQ8lWb9hPPywL1X/EUwoJSOd/ZYTXYC0+Y1bjrVKMkXbi8+4p5lSzU+yzJCKqr+rWhpclV8h7yEp7UYEmeMGhjom5odmo3sUE8lY7vHvb2kyRTQhtDE82OgLcLk2FQY5tfCzzXCelRkfuehsLJQwsQf2/ZNNtY5S9kB/jMelpO689CG4qumBywrx3p6cNk+0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XOGnyRXNa8Q8NJPt5UFR0D+rnOMmTdetyoG36AI6zU=;
 b=oXlbjDX2fOUnKS8zfkk6zfU3VyHOZ49DkDWqIksIDdcGTpT8Y3J/JQH10SHFnFPmgpUYIzKt8T+WCgDaEfC021BlQmloQL1WSNnzDMgzUsUqIdEyppD086KVUefem9rPtUcTVpoquuIX4iByxI84Q0gHn7eKzqHr2KzPbbeCyE09rv2/qFmeSRfN97fViNhGznJzyace3OJ7ZSuMKXotnl1wR15WShZNUR78QiLiradM5YWvEll0+45Vcgk+sPvRbOZTaGgNImZHRM+eeQ2F1mDuOkuabkGdYJXi8Mgf6j0knf6ESmEpDJi3go0BO6tm7xRfv4WaLrgYZNEDpMlVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XOGnyRXNa8Q8NJPt5UFR0D+rnOMmTdetyoG36AI6zU=;
 b=gEuRPPXMsScatUiZora2QzWKuJdsauJaP6iJ/5s9iEGLqny1uHI2b9F2O9Qub1JWddTERMehnxG8p59j8nY+ZoC5MUFRfJJeyjC2ltN7FE7FFfPYEdUqUY6OTEY5IRF0bApE8jAdhtjfqkVcdkRYAR5nfhdz4X7rM0/LvVnkaUA=
Received: from BYAPR06CA0004.namprd06.prod.outlook.com (2603:10b6:a03:d4::17)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 13:18:10 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::a1) by BYAPR06CA0004.outlook.office365.com
 (2603:10b6:a03:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.17 via Frontend
 Transport; Fri, 18 Aug 2023 13:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 18 Aug 2023 13:18:09 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 08:18:07 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix mode scaling (RMX_.*)
Date: Fri, 18 Aug 2023 09:17:39 -0400
Message-ID: <20230818131742.88763-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|DM4PR12MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 82efc2c8-b647-49cf-b8c1-08db9fed9163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sSUgEpkrPvhwGszI2xlC0xX2+4+J2xGoLV2FtyHzRk5SpdY/mzK1RKgeZQh6OI58BLcomd+oqXWVPZuDttMelC01bwlPdN2bitS/qvBVsmrGRIi9BJR2DgZxo9rJgmbFBOLJi+CXjTT+f3UjtDawFVaUTldcgXKdZWtHcJiObgawxRra+317xOgjWtZrXpQzfdzFwraTr0oYBdA8L/Jov4WjuZpF73i7UpgKbrnsnZrL27Y014MtjsqTvLKxIGIborjuJo8Uu0uD84TZMZYO0et1pDercq/OXrP9FBUz5tTvQV4yslYP1jeUaRuD/0Wg1y1r/TA83ib2yy+GrF9F5dhlyBChF+NO14zww33PA2cLb6HS2+20yr8CuOYkY30FhQCrT/69kzay8+9uB3CQWkRV63xCNnWku6q2SSWXI/M62TuzEGVeletHs59byR4UekoC0qXScONL965o+/1lcAQaVCQH6WFZyKOSy631jnKDcqGLPGdlDpn3qm75hTI8ltddlGj256UW2uVLj1TcTsijA+JMX3ZX/dDosJ5Fp6KBb6PZVx4lvpycslzPLJXMtMVEsP5vtuB83EIaxTK5I7Mk2EVGjnYi/pOI63z+4rnHfPq9IzNSFQOig1uQCLJ68+ZxAM8CMFlpY27YhLJKLjGjAfvD//3atJ3F04kS2NsINIRNfcfvsnGPMuaN+EE4Co5gAxsQuDU5dOQ7J00fg23CPWReYPxo8oJk3PGy5sLKA0pijw9NBUf5FSprdMvdm81p90Hy6wHlIYUqBHyZEhLaz75UsPl27M60g97OLImX4vwkmb1fKLIUuo1OvU9A
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(478600001)(5660300002)(2616005)(16526019)(44832011)(70206006)(70586007)(6916009)(6666004)(26005)(54906003)(316002)(1076003)(4326008)(8676002)(8936002)(41300700001)(40460700003)(47076005)(336012)(36860700001)(2906002)(426003)(83380400001)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:18:09.6948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82efc2c8-b647-49cf-b8c1-08db9fed9163
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen
 Wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As made mention of in commit 4a2df0d1f28e ("drm/amd/display: Fixed
non-native modes not lighting up"), we shouldn't call
drm_mode_set_crtcinfo() once the crtc timings have been decided. Since,
it can cause settings to be unintentionally overwritten. So, since
dm_state is never NULL now, we can use old_stream to determine if we
should call drm_mode_set_crtcinfo() because we only need to set the crtc
timing parameters for entirely new streams.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Fixes: 712237a4a1b4 ("drm/amd/display: Always set crtcinfo from create_stream_for_sink")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3b27b7742854..e9aff5014e39 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6035,7 +6035,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else
+	else if (!old_stream)
 		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
-- 
2.41.0

