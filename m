Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B52339C3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5E66E964;
	Thu, 30 Jul 2020 20:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106F86E961;
 Thu, 30 Jul 2020 20:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6O1LUBEyLMRdlYKL96fSeBcBwwHkRjFz7CiqiTEn97y2Qb7sKOpHiniGEFqwSdViNl5HxkK5/C3CFsuDEHQftecGs04OTck8k7/d3Qy64gfzem7WQtV1iKtC/py3J1FMB7CCvCGzIzTvZuHmZclaDNog2qfvYiMhFCzIB8si9xNe077PeZwYtNlX0MbLqFd7AZPXKrx9/XNzPUqGSuReky9yAXi+VAKvU6kyDfR0dhkH2C0rYjshSkOH9fDHgwyxN49yFfVg2i6TbqXvI9+F8A2i/xaMxSdgkU0U4quRTAVSrDF/zGcksn5XeVZT3FEGRTbfgEifZkvYMFNIgh8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZGWHxanRQbCIa8Xr11eHsHLmI/EsV7KHeb/qXNY5qc=;
 b=HmmgwJX0BM9Q/EinfNIeWNKz5rnIkNHaorEaB658GhP/8H1z0+Nesi/S+vIyTup3hRwEYezWTRz2DnblsJPPrTucCh+T0EXqMTd3hc3GOkmFN5wCc/UNSHrBtKA7WJKY80wKkhSJECebnLrpd0/Hi/8sn+ICm2k1Br5AhjBeWwwibmPB6eq++q7GlFvZL8jNbrWNiGZuzeKZcP+KWwGITSNfsIX4I/WXvNuBXH6W3CgD+n1WOTp9JJyCTsPS9G0iNkyioLpgLSNjl2zAunLQUzX8aVGIThr2FatTwlqeRnnixBw6wglle5KpMEnlZOZv5V6XsojCmKN0EbtvpqQAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZGWHxanRQbCIa8Xr11eHsHLmI/EsV7KHeb/qXNY5qc=;
 b=zHuyMIyzKUhCruvoR2J0mXdj4u3kpm8Sijm+juD2tlLHvITfStQiKUT3uWmE3vUsyLrNyZ8fGDefdf7da0jZDRD/RAfk5WnlfLEk6fR50z7W05P9RGxOxtpTpxfDpc/MB3CdAtygC7xCpgGxEiFXE5wi27E3YEVFgcc43Vszm58=
Received: from CO2PR04CA0132.namprd04.prod.outlook.com (2603:10b6:104:7::34)
 by BN6PR1201MB0116.namprd12.prod.outlook.com (2603:10b6:405:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 20:37:33 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::c0) by CO2PR04CA0132.outlook.office365.com
 (2603:10b6:104:7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 20:37:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:31 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:31 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:30 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/amd/display: Use validated tiling_flags and
 tmz_surface in commit_tail
Date: Thu, 30 Jul 2020 16:36:39 -0400
Message-ID: <20200730203642.17553-5-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7d34c66-204a-4b09-f12d-08d834c8629e
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0116:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0116BDADA5FB0B1693278E13EC710@BN6PR1201MB0116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbhyhPLIcTrklb7Dv3ggWOHRTb4+tH00Nj8IAmWWtyQFBFrh9GkCqCxEJQre2cD4UCLc66Lmv7HGRAIqZjjXw6AIYp2GPmdptf8LiPcgjLkNz4uaOjz1AwsA8rYTG0/aQhnwRvW0D062QiqdtoVTVEll3FF4zbntkz95cQZygAnvIdmfg2UN8/e36oLJsuGU7D99C6+nCasnA4sOE/NAGlybKF6PXftZu1JCvUB1CO+td99LQpHTjmPjvmWNEemen5fQRLWIcT8kDHbxTof0/haSDBfZpWR/wvEh52BMjwoqTWdkWedQJCfp2CvV7b12zKkB+y6Z2QROJ+MbBnkJ7YMERi4zGsc96iKCWYqS3ivBWFFshemmB4Svy7Gzdy04tJuYahwnAeeFvPhjovUnXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(15650500001)(47076004)(81166007)(426003)(82740400003)(82310400002)(316002)(8936002)(8676002)(2616005)(44832011)(336012)(1076003)(186003)(70586007)(83380400001)(26005)(356005)(54906003)(5660300002)(4326008)(36756003)(70206006)(478600001)(86362001)(110136005)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:32.4003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d34c66-204a-4b09-f12d-08d834c8629e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0116
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
So we're not racing with userspace or deadlocking DM.

[How]
These flags are now stored on dm_plane_state itself and acquried and
validated during commit_check, so just use those instead.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f78c09c9585e..0d5f45742bb5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7094,8 +7094,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	long r;
 	unsigned long flags;
 	struct amdgpu_bo *abo;
-	uint64_t tiling_flags;
-	bool tmz_surface = false;
 	uint32_t target_vblank, last_flip_vblank;
 	bool vrr_active = amdgpu_dm_vrr_active(acrtc_state);
 	bool pflip_present = false;
@@ -7179,20 +7177,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		if (unlikely(r <= 0))
 			DRM_ERROR("Waiting for fences timed out!");
 
-		/*
-		 * We cannot reserve buffers here, which means the normal flag
-		 * access functions don't work. Paper over this with READ_ONCE,
-		 * but maybe the flags are invariant enough that not even that
-		 * would be needed.
-		 */
-		tiling_flags = READ_ONCE(abo->tiling_flags);
-		tmz_surface = READ_ONCE(abo->flags) & AMDGPU_GEM_CREATE_ENCRYPTED;
-
 		fill_dc_plane_info_and_addr(
-			dm->adev, new_plane_state, tiling_flags,
+			dm->adev, new_plane_state,
+			dm_new_plane_state->tiling_flags,
 			&bundle->plane_infos[planes_count],
-			&bundle->flip_addrs[planes_count].address, tmz_surface,
-			false);
+			&bundle->flip_addrs[planes_count].address,
+			dm_new_plane_state->tmz_surface, false);
 
 		DRM_DEBUG_DRIVER("plane: id=%d dcc_en=%d\n",
 				 new_plane_state->plane->index,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
