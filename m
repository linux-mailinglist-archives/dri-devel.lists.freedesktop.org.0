Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC48B88DD8D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE91C10FAC9;
	Wed, 27 Mar 2024 12:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g+WuzDUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D1C10FAC5;
 Wed, 27 Mar 2024 12:09:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 184E1614CD;
 Wed, 27 Mar 2024 12:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B29C433F1;
 Wed, 27 Mar 2024 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541369;
 bh=RdIr44bDfUa5feVZbpAJYp7urEmUqhUvgOoq7c8hxAU=;
 h=From:To:Cc:Subject:Date:From;
 b=g+WuzDUDQo77jCGOc1Ib7SgvR+VIj71vu01UbLElVFQJpQelG0gOLNfgALq35iHXz
 DgqJE82HY97BIOnYLgsWFrUiGhG6CiSm3uTrPIwf3XluKwAZ7MKMWzwZctEJ0Woor4
 dDnDZ61V6Z69Ud+XFMTO/xnRYFckN/u35N56VRPFDQ18rV0dY+Qku7SZonaIOx+WOs
 bkpU4DLU1wZ1fegiD6eU38HXCoGTkrRZYBSmwU55LO24p9LKEklNkHXWb6XkJ5H/vL
 txi4lNqPZTD1qNtzou1isG5cXU0fcPlPWqiVJyy/cR51tmzcqBeWwYQaWkxl+SgvoF
 eNMo77LXoZQGg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	george.shen@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Martin Leung <martin.leung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "Revert "drm/amd/display: Add left edge pixel for
 YCbCr422/420 + ODM pipe split"" failed to apply to 6.6-stable tree
Date: Wed, 27 Mar 2024 08:09:27 -0400
Message-ID: <20240327120927.2827064-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e9e1abb397e550aec86a6d9eb7c6f8ed4271d742 Mon Sep 17 00:00:00 2001
From: George Shen <george.shen@amd.com>
Date: Fri, 2 Feb 2024 17:45:32 -0500
Subject: [PATCH] Revert "drm/amd/display: Add left edge pixel for YCbCr422/420
 + ODM pipe split"

[Why/How]
A regression was identified with the change to add left edge pixel for
YCbCr422/420 + ODM combine cases.

This reverts commit 288c0254a0b0c9980dba9df7d5afadf27280b99c

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Martin Leung <martin.leung@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  4 --
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 37 -------------------
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  7 +---
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  2 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h |  4 --
 5 files changed, 1 insertion(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 1d0fd69cc7bd1..4d5194293dbd5 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3098,10 +3098,6 @@ static bool update_planes_and_stream_state(struct dc *dc,
 
 			if (otg_master && otg_master->stream->test_pattern.type != DP_TEST_PATTERN_VIDEO_MODE)
 				resource_build_test_pattern_params(&context->res_ctx, otg_master);
-
-			if (otg_master && (otg_master->stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR422 ||
-					otg_master->stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR420))
-				resource_build_subsampling_params(&context->res_ctx, otg_master);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 96ea283bd1690..1b7765bc5e5ef 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -822,16 +822,6 @@ static struct rect calculate_odm_slice_in_timing_active(struct pipe_ctx *pipe_ct
 			stream->timing.v_border_bottom +
 			stream->timing.v_border_top;
 
-	/* Recout for ODM slices after the first slice need one extra left edge pixel
-	 * for 3-tap chroma subsampling.
-	 */
-	if (odm_slice_idx > 0 &&
-			(pipe_ctx->stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR422 ||
-				pipe_ctx->stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR420)) {
-		odm_rec.x -= 1;
-		odm_rec.width += 1;
-	}
-
 	return odm_rec;
 }
 
@@ -1448,7 +1438,6 @@ void resource_build_test_pattern_params(struct resource_context *res_ctx,
 	enum controller_dp_test_pattern controller_test_pattern;
 	enum controller_dp_color_space controller_color_space;
 	enum dc_color_depth color_depth = otg_master->stream->timing.display_color_depth;
-	enum dc_pixel_encoding pixel_encoding = otg_master->stream->timing.pixel_encoding;
 	int h_active = otg_master->stream->timing.h_addressable +
 		otg_master->stream->timing.h_border_left +
 		otg_master->stream->timing.h_border_right;
@@ -1480,36 +1469,10 @@ void resource_build_test_pattern_params(struct resource_context *res_ctx,
 		else
 			params->width = last_odm_slice_width;
 
-		/* Extra left edge pixel is required for 3-tap chroma subsampling. */
-		if (i != 0 && (pixel_encoding == PIXEL_ENCODING_YCBCR422 ||
-				pixel_encoding == PIXEL_ENCODING_YCBCR420)) {
-			params->offset -= 1;
-			params->width += 1;
-		}
-
 		offset += odm_slice_width;
 	}
 }
 
-void resource_build_subsampling_params(struct resource_context *res_ctx,
-	struct pipe_ctx *otg_master)
-{
-	struct pipe_ctx *opp_heads[MAX_PIPES];
-	int odm_cnt = 1;
-	int i;
-
-	odm_cnt = resource_get_opp_heads_for_otg_master(otg_master, res_ctx, opp_heads);
-
-	/* For ODM slices after the first slice, extra left edge pixel is required
-	 * for 3-tap chroma subsampling.
-	 */
-	if (otg_master->stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR422 ||
-			otg_master->stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR420) {
-		for (i = 0; i < odm_cnt; i++)
-			opp_heads[i]->stream_res.left_edge_extra_pixel = (i == 0) ? false : true;
-	}
-}
-
 bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 {
 	const struct dc_plane_state *plane_state = pipe_ctx->plane_state;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index f15ba7335336a..c55d5155ecb9c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1573,8 +1573,7 @@ static void dcn20_detect_pipe_changes(struct dc_state *old_state,
 	 * makes this assumption at the moment with how hubp reset is matched to
 	 * same index mpcc reset.
 	 */
-	if (old_pipe->stream_res.opp != new_pipe->stream_res.opp ||
-			old_pipe->stream_res.left_edge_extra_pixel != new_pipe->stream_res.left_edge_extra_pixel)
+	if (old_pipe->stream_res.opp != new_pipe->stream_res.opp)
 		new_pipe->update_flags.bits.opp_changed = 1;
 	if (old_pipe->stream_res.tg != new_pipe->stream_res.tg)
 		new_pipe->update_flags.bits.tg_changed = 1;
@@ -1962,10 +1961,6 @@ static void dcn20_program_pipe(
 			pipe_ctx->stream_res.opp,
 			&pipe_ctx->stream->bit_depth_params,
 			&pipe_ctx->stream->clamping);
-
-		pipe_ctx->stream_res.opp->funcs->opp_program_left_edge_extra_pixel(
-			pipe_ctx->stream_res.opp,
-			pipe_ctx->stream_res.left_edge_extra_pixel);
 	}
 
 	/* Set ABM pipe after other pipe configurations done */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index ebb659c327e06..3a6bf77a68732 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -333,8 +333,6 @@ struct stream_resource {
 	uint8_t gsl_group;
 
 	struct test_pattern_params test_pattern_params;
-
-	bool left_edge_extra_pixel;
 };
 
 struct plane_resource {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index b14d52e52fa2f..77a60aa9f27bb 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -107,10 +107,6 @@ void resource_build_test_pattern_params(
 		struct resource_context *res_ctx,
 		struct pipe_ctx *pipe_ctx);
 
-void resource_build_subsampling_params(
-		struct resource_context *res_ctx,
-		struct pipe_ctx *pipe_ctx);
-
 bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx);
 
 enum dc_status resource_build_scaling_params_for_context(
-- 
2.43.0




