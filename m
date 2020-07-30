Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8781C2339C8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBF76E966;
	Thu, 30 Jul 2020 20:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD896E039;
 Thu, 30 Jul 2020 20:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNQD4hcFM12L7XRbDftAdtd3Rnt1Ys9w/LJha3j0Yk5dVNya8wglIFwesbPoEKs/R5GmqKMUSMv9wILtt5e365C3A9A7Swtjx1g3vEX68YVk6j2uIhPG3W7Ag3jyUJb15VzX5s+xt1NgTdfea3rw1mVYEcP7SKZ3m5DesgIqZY8lIFEWzLK/Zoxx6cgs29W23Xg8Bbz1sktgiKFbzJo5DnmhD10xb21si6uqvQEKZZQG6AVMCA4IQ52uHR68meS2UXnYgyEjWC6fjO4KvdslhUDaxpkMnhrNZPeBvm5teaL1wBinBgewCwTKlgbvx5dqZ+FxgiA8phJpYVhWZkZhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM7D/lI3LBOCvNhXAYvSxYT6hQQbhBZLgCNMNrZp1vs=;
 b=kRKCDBCC2mXQtmvUvS0/wJbmDn2NkmV4VhOpsLhqrZS1K7N+37sAxqZjkFMMrtO91cOaSSRIOs1wfgv9FaRFxTU0sNYOxqj0mvcxG5UY4FmSFRdSnBUE4U89ld/hg25UyYeDt7Wad6e+a+bms2CrSprvesosxHJOprtjBES0GbAbu9QvUZtA7Nxp1VPdrdAZs1xoUXilBwgvPJf8/yaQoINcU1DJFaJivyTNow6BfvCOU3L4cHHtryD17H1pO15ciDWPFUqEcKCRyeeb2tPYv5wkN6FU6k0UEAJmNejuSxZgncv1GlnRtYpefVTsz0fiX2hCDI17Rz5qr/9Znzd1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM7D/lI3LBOCvNhXAYvSxYT6hQQbhBZLgCNMNrZp1vs=;
 b=D8b/RfdO6lrSBfptFx+b2oz1f8zasqUqHlCuQXzg0LDs3odBRxdeveeFczfR5o+RWSG6J5BLvveXPBHRs66mQfCOiwif0rztsmt20HJfNR4C/DoDk1E3zc3AV71XZYUrR6g7IaRsSXaR5F5p4TG0LqOi5+kaL2sP1y4NzkHzLd0=
Received: from CO2PR04CA0130.namprd04.prod.outlook.com (2603:10b6:104:7::32)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 30 Jul
 2020 20:37:34 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::ae) by CO2PR04CA0130.outlook.office365.com
 (2603:10b6:104:7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 20:37:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:33 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:32 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:32 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/amd/display: Drop dm_determine_update_type_for_commit
Date: Thu, 30 Jul 2020 16:36:41 -0400
Message-ID: <20200730203642.17553-7-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdf2ddf3-33bf-440a-697c-08d834c863a3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4341:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4341B9A9F229AAF12CDD9EACEC710@MN2PR12MB4341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZG/ysHOpLkWJIEHBr/z9/03Q9vjzqkplPP6PB7jA+vhH+frYxMtrHeJecmMnrc5s4Ug3x/561kU8s7PIq/YFoimpaaNPHrtlKjcgrPqUJMUX32YIpqI7XgSuT2speSS63sId6cJoHnkEsh/s83N9xQcxAAv3rSkfxu19jRCoOCgyRliM9PnuM3BeIX/YBJODqEn9AssNzv3ghvGdMWn2OT+h936IACEjRikc5+KrvzxjDVSifUQCmLabZ2wkk2HJ7p/OsQW8kdmfXrw+0GklQnsKJdebRJCY1X94NibFytyi3xvTcDGbFxdBtN43X9n8pv8vBfZ3wEqXk+0Mn9sFptrEm87JGwRhReq/+P8Z9jYVDnmBPfOQuEiMndVp1++MoKnaWYv3URif7YkknEwSVQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(1076003)(186003)(44832011)(316002)(70586007)(81166007)(70206006)(356005)(47076004)(36756003)(82740400003)(5660300002)(8676002)(86362001)(336012)(4326008)(6666004)(54906003)(426003)(26005)(110136005)(83380400001)(450100002)(2906002)(2616005)(82310400002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:34.1063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf2ddf3-33bf-440a-697c-08d834c863a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
This was added in the past to solve the issue of not knowing when
to stall for medium and full updates in DM.

Since DC is ultimately decides what requires bandwidth changes we
wanted to make use of it directly to determine this.

The problem is that we can't actually pass any of the stream or surface
updates into DC global validation, so we don't actually check if the new
configuration is valid - we just validate the old existing config
instead and stall for outstanding commits to finish.

There's also the problem of grabbing the DRM private object for
pageflips which can lead to page faults in the case where commits
execute out of order and free a DRM private object state that was
still required for commit tail.

[How]
Now that we reset the plane in DM with the same conditions DC checks
we can have planes go through DC validation and we know when we need
to check and stall based on whether the stream or planes changed.

We mark lock_and_validation_needed whenever we've done this, so just
go back to using that instead of dm_determine_update_type_for_commit.

Since we'll skip resetting the plane for a pageflip we will no longer
grab the DRM private object for pageflips as well, avoiding the
page fault issued caused by pageflipping under load with commits
executing out of order.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 199 ++----------------
 1 file changed, 17 insertions(+), 182 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2cbb29199e61..59829ec81694 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8542,161 +8542,6 @@ static int dm_update_plane_state(struct dc *dc,
 	return ret;
 }
 
-static int
-dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
-				    struct drm_atomic_state *state,
-				    enum surface_update_type *out_type)
-{
-	struct dc *dc = dm->dc;
-	struct dm_atomic_state *dm_state = NULL, *old_dm_state = NULL;
-	int i, j, num_plane, ret = 0;
-	struct drm_plane_state *old_plane_state, *new_plane_state;
-	struct dm_plane_state *new_dm_plane_state, *old_dm_plane_state;
-	struct drm_crtc *new_plane_crtc;
-	struct drm_plane *plane;
-
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *new_crtc_state, *old_crtc_state;
-	struct dm_crtc_state *new_dm_crtc_state, *old_dm_crtc_state;
-	struct dc_stream_status *status = NULL;
-	enum surface_update_type update_type = UPDATE_TYPE_FAST;
-	struct surface_info_bundle {
-		struct dc_surface_update surface_updates[MAX_SURFACES];
-		struct dc_plane_info plane_infos[MAX_SURFACES];
-		struct dc_scaling_info scaling_infos[MAX_SURFACES];
-		struct dc_flip_addrs flip_addrs[MAX_SURFACES];
-		struct dc_stream_update stream_update;
-	} *bundle;
-
-	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
-
-	if (!bundle) {
-		DRM_ERROR("Failed to allocate update bundle\n");
-		/* Set type to FULL to avoid crashing in DC*/
-		update_type = UPDATE_TYPE_FULL;
-		goto cleanup;
-	}
-
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
-
-		memset(bundle, 0, sizeof(struct surface_info_bundle));
-
-		new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
-		old_dm_crtc_state = to_dm_crtc_state(old_crtc_state);
-		num_plane = 0;
-
-		if (new_dm_crtc_state->stream != old_dm_crtc_state->stream) {
-			update_type = UPDATE_TYPE_FULL;
-			goto cleanup;
-		}
-
-		if (!new_dm_crtc_state->stream)
-			continue;
-
-		for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, j) {
-			struct dc_plane_info *plane_info = &bundle->plane_infos[num_plane];
-			struct dc_flip_addrs *flip_addr = &bundle->flip_addrs[num_plane];
-			struct dc_scaling_info *scaling_info = &bundle->scaling_infos[num_plane];
-
-			new_plane_crtc = new_plane_state->crtc;
-			new_dm_plane_state = to_dm_plane_state(new_plane_state);
-			old_dm_plane_state = to_dm_plane_state(old_plane_state);
-
-			if (plane->type == DRM_PLANE_TYPE_CURSOR)
-				continue;
-
-			if (new_dm_plane_state->dc_state != old_dm_plane_state->dc_state) {
-				update_type = UPDATE_TYPE_FULL;
-				goto cleanup;
-			}
-
-			if (crtc != new_plane_crtc)
-				continue;
-
-			bundle->surface_updates[num_plane].surface =
-					new_dm_plane_state->dc_state;
-
-			if (new_crtc_state->mode_changed) {
-				bundle->stream_update.dst = new_dm_crtc_state->stream->dst;
-				bundle->stream_update.src = new_dm_crtc_state->stream->src;
-			}
-
-			if (new_crtc_state->color_mgmt_changed) {
-				bundle->surface_updates[num_plane].gamma =
-						new_dm_plane_state->dc_state->gamma_correction;
-				bundle->surface_updates[num_plane].in_transfer_func =
-						new_dm_plane_state->dc_state->in_transfer_func;
-				bundle->surface_updates[num_plane].gamut_remap_matrix =
-						&new_dm_plane_state->dc_state->gamut_remap_matrix;
-				bundle->stream_update.gamut_remap =
-						&new_dm_crtc_state->stream->gamut_remap_matrix;
-				bundle->stream_update.output_csc_transform =
-						&new_dm_crtc_state->stream->csc_color_matrix;
-				bundle->stream_update.out_transfer_func =
-						new_dm_crtc_state->stream->out_transfer_func;
-			}
-
-			ret = fill_dc_scaling_info(new_plane_state,
-						   scaling_info);
-			if (ret)
-				goto cleanup;
-
-			bundle->surface_updates[num_plane].scaling_info = scaling_info;
-
-			if (new_plane_state->fb) {
-				ret = fill_dc_plane_info_and_addr(
-					dm->adev, new_plane_state,
-					new_dm_plane_state->tiling_flags,
-					plane_info, &flip_addr->address,
-					new_dm_plane_state->tmz_surface, false);
-				if (ret)
-					goto cleanup;
-
-				bundle->surface_updates[num_plane].plane_info = plane_info;
-				bundle->surface_updates[num_plane].flip_addr = flip_addr;
-			}
-
-			num_plane++;
-		}
-
-		if (num_plane == 0)
-			continue;
-
-		ret = dm_atomic_get_state(state, &dm_state);
-		if (ret)
-			goto cleanup;
-
-		old_dm_state = dm_atomic_get_old_state(state);
-		if (!old_dm_state) {
-			ret = -EINVAL;
-			goto cleanup;
-		}
-
-		status = dc_stream_get_status_from_state(old_dm_state->context,
-							 new_dm_crtc_state->stream);
-		bundle->stream_update.stream = new_dm_crtc_state->stream;
-		/*
-		 * TODO: DC modifies the surface during this call so we need
-		 * to lock here - find a way to do this without locking.
-		 */
-		mutex_lock(&dm->dc_lock);
-		update_type = dc_check_update_surfaces_for_stream(
-				dc,	bundle->surface_updates, num_plane,
-				&bundle->stream_update, status);
-		mutex_unlock(&dm->dc_lock);
-
-		if (update_type > UPDATE_TYPE_MED) {
-			update_type = UPDATE_TYPE_FULL;
-			goto cleanup;
-		}
-	}
-
-cleanup:
-	kfree(bundle);
-
-	*out_type = update_type;
-	return ret;
-}
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm_crtc *crtc)
 {
@@ -8737,8 +8582,7 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm
  * acquired. For full updates case which removes/adds/updates streams on one
  * CRTC while flipping on another CRTC, acquiring global lock will guarantee
  * that any such full update commit will wait for completion of any outstanding
- * flip using DRMs synchronization events. See
- * dm_determine_update_type_for_commit()
+ * flip using DRMs synchronization events.
  *
  * Note that DM adds the affected connectors for all CRTCs in state, when that
  * might not seem necessary. This is because DC stream creation requires the
@@ -8759,15 +8603,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
-	enum surface_update_type update_type = UPDATE_TYPE_FAST;
-	enum surface_update_type overall_update_type = UPDATE_TYPE_FAST;
 	enum dc_status status;
 	int ret, i;
-
-	/*
-	 * This bool will be set for true for any modeset/reset
-	 * or plane update which implies non fast surface update.
-	 */
 	bool lock_and_validation_needed = false;
 
 	ret = drm_atomic_helper_check_modeset(dev, state);
@@ -8961,27 +8798,23 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		if (!is_scaling_state_different(dm_new_con_state, dm_old_con_state))
 			continue;
 
-		overall_update_type = UPDATE_TYPE_FULL;
 		lock_and_validation_needed = true;
 	}
 
-	ret = dm_determine_update_type_for_commit(&adev->dm, state, &update_type);
-	if (ret)
-		goto fail;
-
-	if (overall_update_type < update_type)
-		overall_update_type = update_type;
-
-	/*
-	 * lock_and_validation_needed was an old way to determine if we need to set
-	 * the global lock. Leaving it in to check if we broke any corner cases
-	 * lock_and_validation_needed true = UPDATE_TYPE_FULL or UPDATE_TYPE_MED
-	 * lock_and_validation_needed false = UPDATE_TYPE_FAST
+	/**
+	 * Streams and planes are reset when there are changes that affect
+	 * bandwidth. Anything that affects bandwidth needs to go through
+	 * DC global validation to ensure that the configuration can be applied
+	 * to hardware.
+	 *
+	 * We have to currently stall out here in atomic_check for outstanding
+	 * commits to finish in this case because our IRQ handlers reference
+	 * DRM state directly - we can end up disabling interrupts too early
+	 * if we don't.
+	 *
+	 * TODO: Remove this stall and drop DM state private objects.
 	 */
-	if (lock_and_validation_needed && overall_update_type <= UPDATE_TYPE_FAST)
-		WARN(1, "Global lock should be Set, overall_update_type should be UPDATE_TYPE_MED or UPDATE_TYPE_FULL");
-
-	if (overall_update_type > UPDATE_TYPE_FAST) {
+	if (lock_and_validation_needed) {
 		ret = dm_atomic_get_state(state, &dm_state);
 		if (ret)
 			goto fail;
@@ -9063,7 +8896,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		struct dm_crtc_state *dm_new_crtc_state =
 			to_dm_crtc_state(new_crtc_state);
 
-		dm_new_crtc_state->update_type = (int)overall_update_type;
+		dm_new_crtc_state->update_type = lock_and_validation_needed ?
+							 UPDATE_TYPE_FULL :
+							 UPDATE_TYPE_FAST;
 	}
 
 	/* Must be success */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
