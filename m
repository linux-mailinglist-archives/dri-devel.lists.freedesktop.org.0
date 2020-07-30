Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7A2339B5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431DA6E0B7;
	Thu, 30 Jul 2020 20:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39666E972;
 Thu, 30 Jul 2020 20:37:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evtH8DCW33p75CWOAdy579GkWhoM5Ry1QY5N+FHOWCZE48KQYU96buXawP+jnoBXixPFn6JpIAX9e3lVbC3ZPAU61w6QTZFU5xtnIXstKFL6e+aNTXoZxPKeb8mBSwVwxNkF2SRVofyOx9P+SUo/zSiUq8reh9npmtC0koLAOZSjiOvoPgwpesQVAA2CkKvBQxBeh265JB8JzlFofpNxw6AYXid+WAo67ZNmbNLH3TTVYD+EZtD7uqRQFP5B9bVt7/TUa6k1bxDVz6ruhYEKy1ERJsRGHAKIZVTGtUD6q9G0sahDZLfSZG8CE8dKy7h0mWb/dhvBqIru2Fh0wOsRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MCKObOLz0diVw0g+cva6UXaKmZDqZ4SKh4d2yOahAo=;
 b=TotisRDSbvdJvto3+5Azmg271t1co9PDb/5U4OCgp2jZlOKojnKT1vYuAB37JQLy6hfYWETMrAFO1fQxMuoSLBpqhHCaJaMU+0omrwmK2Y22rLuQP21wueOKB/1RTzC7RhPCzFkyG0RkJYak48ZWiTACvOEj9DXeKtGNl8ExwN3nd+pSxiJJNnsS/mQEzmEckRuCjbDuxV0y3CmQ2kAxTgNNo6aoSZjzKaqoGF5UmcGmnIIJpUXT+BYcawX4K3vo+E4OKYZiiLsda1F066l+bLMG8HkzRUuBnT+QLywINESiCG9KT7FGmDtU3n/tYxL4Mb62LXOsbYpzYw9P/Cnj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MCKObOLz0diVw0g+cva6UXaKmZDqZ4SKh4d2yOahAo=;
 b=Fw0vdVPJnqIy0Nd3IUoOSYZHH6TxU5oTcUygw8pOlqqZrMrgzGJde69b38TOk7ltrDdc2Yr59oD/bL+ur7Y4otOpHQj3KQqYwJ7M7onocBX1n8qdLEOgzETdx3iceSJYMA74v+I2Im3nLKqeglK0FBCijn4/WKqIzHNCaLGy4aE=
Received: from MWHPR19CA0094.namprd19.prod.outlook.com (2603:10b6:320:1f::32)
 by BY5PR12MB3953.namprd12.prod.outlook.com (2603:10b6:a03:194::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 20:37:30 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:1f:cafe::17) by MWHPR19CA0094.outlook.office365.com
 (2603:10b6:320:1f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 20:37:29 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:28 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:28 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/amd/display: Store tiling_flags and tmz_surface on
 dm_plane_state
Date: Thu, 30 Jul 2020 16:36:36 -0400
Message-ID: <20200730203642.17553-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8259ca65-9314-45bc-7084-08d834c86113
X-MS-TrafficTypeDiagnostic: BY5PR12MB3953:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3953995E1F2B2A12F7A055B5EC710@BY5PR12MB3953.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpSriFQ4a1KFuNw1iUr5OWvMtxR7wIcbxIXJiUiyDU+4EcKwX3jQcfSLzK3H4KGEhX7eLZxY8miAL/9G24ML9PiU60FIiRi6gOznt11zdsF8q2vi37iyRUfcpBS330yLsOp0Hx1E9Tc8QS1l3sTaIzZe6EfgsoSEMy3zCSRWMR6DOegDdDu/O6D/UUPIapFzT5hnTsplL+1hoHL4Qa/wv3imzKM+wruqV+WZ5sxryDJXg7cXGr4BOtpMYX5zRv8oRXlkOfY0C3qAoBb8RrbKbdgzbXpD7m72ZMbzkWaSmrglxfamOF0c1kn2GwAAvDrp9E9ezFPY/2wDx2AfGj0BVOM7KZOUNF/efdjsVmfdHUDG3zL/dySidVd93FpxRdkUjtIUsl/mxO4MzR0TkVWEhQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(81166007)(70206006)(83380400001)(5660300002)(70586007)(82740400003)(26005)(356005)(82310400002)(316002)(86362001)(1076003)(186003)(6666004)(47076004)(450100002)(4326008)(426003)(478600001)(2616005)(8676002)(110136005)(54906003)(2906002)(336012)(8936002)(44832011)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:29.8073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8259ca65-9314-45bc-7084-08d834c86113
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3953
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Store these in advance so we can reuse them later in commit_tail without
having to reserve the fbo again.

These will also be used for checking for tiling changes when deciding
to reset the plane or not.

[How]
This change should mostly be a refactor. Only commit check is affected
for now and I'll drop the get_fb_info calls in prepare_planes and
commit_tail after.

This runs a prepass loop once we think that all planes have been added
to the context and replaces the get_fb_info calls with accessing the
dm_plane_state instead.

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 60 +++++++++++--------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 2 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8d64f5fde7e2..7cc5ab90ce13 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3700,8 +3700,17 @@ static int fill_dc_scaling_info(const struct drm_plane_state *state,
 static int get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
 		       uint64_t *tiling_flags, bool *tmz_surface)
 {
-	struct amdgpu_bo *rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
-	int r = amdgpu_bo_reserve(rbo, false);
+	struct amdgpu_bo *rbo;
+	int r;
+
+	if (!amdgpu_fb) {
+		*tiling_flags = 0;
+		*tmz_surface = false;
+		return 0;
+	}
+
+	rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
+	r = amdgpu_bo_reserve(rbo, false);
 
 	if (unlikely(r)) {
 		/* Don't show error message when returning -ERESTARTSYS */
@@ -4124,13 +4133,10 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 				    struct drm_crtc_state *crtc_state)
 {
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
-	const struct amdgpu_framebuffer *amdgpu_fb =
-		to_amdgpu_framebuffer(plane_state->fb);
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	struct dc_scaling_info scaling_info;
 	struct dc_plane_info plane_info;
-	uint64_t tiling_flags;
 	int ret;
-	bool tmz_surface = false;
 	bool force_disable_dcc = false;
 
 	ret = fill_dc_scaling_info(plane_state, &scaling_info);
@@ -4142,15 +4148,12 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 	dc_plane_state->clip_rect = scaling_info.clip_rect;
 	dc_plane_state->scaling_quality = scaling_info.scaling_quality;
 
-	ret = get_fb_info(amdgpu_fb, &tiling_flags, &tmz_surface);
-	if (ret)
-		return ret;
-
 	force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
-	ret = fill_dc_plane_info_and_addr(adev, plane_state, tiling_flags,
+	ret = fill_dc_plane_info_and_addr(adev, plane_state,
+					  dm_plane_state->tiling_flags,
 					  &plane_info,
 					  &dc_plane_state->address,
-					  tmz_surface,
+					  dm_plane_state->tmz_surface,
 					  force_disable_dcc);
 	if (ret)
 		return ret;
@@ -5753,6 +5756,10 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		dc_plane_state_retain(dm_plane_state->dc_state);
 	}
 
+	/* Framebuffer hasn't been updated yet, so retain old flags. */
+	dm_plane_state->tiling_flags = old_dm_plane_state->tiling_flags;
+	dm_plane_state->tmz_surface = old_dm_plane_state->tmz_surface;
+
 	return &dm_plane_state->base;
 }
 
@@ -8557,13 +8564,9 @@ dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
 			continue;
 
 		for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, j) {
-			const struct amdgpu_framebuffer *amdgpu_fb =
-				to_amdgpu_framebuffer(new_plane_state->fb);
 			struct dc_plane_info *plane_info = &bundle->plane_infos[num_plane];
 			struct dc_flip_addrs *flip_addr = &bundle->flip_addrs[num_plane];
 			struct dc_scaling_info *scaling_info = &bundle->scaling_infos[num_plane];
-			uint64_t tiling_flags;
-			bool tmz_surface = false;
 
 			new_plane_crtc = new_plane_state->crtc;
 			new_dm_plane_state = to_dm_plane_state(new_plane_state);
@@ -8610,16 +8613,12 @@ dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
 
 			bundle->surface_updates[num_plane].scaling_info = scaling_info;
 
-			if (amdgpu_fb) {
-				ret = get_fb_info(amdgpu_fb, &tiling_flags, &tmz_surface);
-				if (ret)
-					goto cleanup;
-
+			if (new_plane_state->fb) {
 				ret = fill_dc_plane_info_and_addr(
-					dm->adev, new_plane_state, tiling_flags,
-					plane_info,
-					&flip_addr->address, tmz_surface,
-					false);
+					dm->adev, new_plane_state,
+					new_dm_plane_state->tiling_flags,
+					plane_info, &flip_addr->address,
+					new_dm_plane_state->tmz_surface, false);
 				if (ret)
 					goto cleanup;
 
@@ -8833,6 +8832,17 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		}
 	}
 
+	/* Prepass for updating tiling flags on new planes. */
+	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		struct dm_plane_state *new_dm_plane_state = to_dm_plane_state(new_plane_state);
+		struct amdgpu_framebuffer *new_afb = to_amdgpu_framebuffer(new_plane_state->fb);
+
+		ret = get_fb_info(new_afb, &new_dm_plane_state->tiling_flags,
+				  &new_dm_plane_state->tmz_surface);
+		if (ret)
+			goto fail;
+	}
+
 	/* Remove exiting planes if they are modified */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
 		ret = dm_update_plane_state(dc, state, plane,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 5b6f879a108c..ad025f5cfd3e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -409,6 +409,8 @@ struct dc_plane_state;
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
+	uint64_t tiling_flags;
+	bool tmz_surface;
 };
 
 struct dm_crtc_state {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
