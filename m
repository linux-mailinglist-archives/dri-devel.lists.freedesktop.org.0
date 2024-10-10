Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5ED9993E9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 22:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C0610E9D5;
	Thu, 10 Oct 2024 20:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ZlfqnJDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA16710E9DB;
 Thu, 10 Oct 2024 20:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=apBr0YVBrYSBLoAiu9geWWGw2/zqj9BmdsgyRZdVTi0=; b=ZlfqnJDzOB8U/xKh
 pjmGW2IHVwcoGbqAniaSgbCxzgWId7e6yPl9PkUjf3koHKgGHCrZG0lFeLhnsq8N0bJQSdHn4r6H6
 38b4LTpSccS+kXIxHTxx7jON/Furbm3MxKnDUegCI8aCE7VZqv1o1x6S2LqRyAyJrzq1sSY++YZvM
 BUQsvy+b6VvzHjBcLM+GnDniVyGzb4qh4/asCg1Eyrob0MYcd6ca7lJSzmbmq+JVn6dtDBaFT2wyT
 E7W8xkD+zf3eulYux5QiC8XFPvRyxalsg0ZdYqWgdQ7XgBQGgce2SrAiXZQ/KXLmeY953ljqHgTbI
 sJYax3wpDVPrVYCe2A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1sz08a-00AMmW-16;
 Thu, 10 Oct 2024 20:51:56 +0000
From: linux@treblig.org
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amd/display: Remove last parts of timing_trace
Date: Thu, 10 Oct 2024 21:51:54 +0100
Message-ID: <20241010205154.278023-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Commit c2c2ce1e9623 ("drm/amd/display: Optimize passive update planes.")
removed the last caller of context_timing_trace.
Remove it.

With that gone, no one is now looking at the 'timing_trace' flag, remove
it and all the places that set it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 42 -------------------
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 -
 .../dc/resource/dcn10/dcn10_resource.c        |  2 -
 .../dc/resource/dcn20/dcn20_resource.c        |  1 -
 .../dc/resource/dcn201/dcn201_resource.c      |  1 -
 .../dc/resource/dcn21/dcn21_resource.c        |  1 -
 .../dc/resource/dcn30/dcn30_resource.c        |  1 -
 .../dc/resource/dcn301/dcn301_resource.c      |  1 -
 .../dc/resource/dcn302/dcn302_resource.c      |  1 -
 .../dc/resource/dcn303/dcn303_resource.c      |  1 -
 .../dc/resource/dcn31/dcn31_resource.c        |  1 -
 .../dc/resource/dcn314/dcn314_resource.c      |  1 -
 .../dc/resource/dcn315/dcn315_resource.c      |  1 -
 .../dc/resource/dcn316/dcn316_resource.c      |  1 -
 .../dc/resource/dcn32/dcn32_resource.c        |  1 -
 .../dc/resource/dcn321/dcn321_resource.c      |  1 -
 .../dc/resource/dcn35/dcn35_resource.c        |  1 -
 .../dc/resource/dcn351/dcn351_resource.c      |  1 -
 .../dc/resource/dcn401/dcn401_resource.c      |  1 -
 .../amd/display/include/logger_interface.h    |  4 --
 20 files changed, 65 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 801cdbc8117d..0bb25c537243 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -46,11 +46,6 @@
 			DC_LOG_IF_TRACE(__VA_ARGS__); \
 } while (0)
 
-#define TIMING_TRACE(...) do {\
-	if (dc->debug.timing_trace) \
-		DC_LOG_SYNC(__VA_ARGS__); \
-} while (0)
-
 #define CLOCK_TRACE(...) do {\
 	if (dc->debug.clock_trace) \
 		DC_LOG_BANDWIDTH_CALCS(__VA_ARGS__); \
@@ -306,43 +301,6 @@ void post_surface_trace(struct dc *dc)
 
 }
 
-void context_timing_trace(
-		struct dc *dc,
-		struct resource_context *res_ctx)
-{
-	int i;
-	int h_pos[MAX_PIPES] = {0}, v_pos[MAX_PIPES] = {0};
-	struct crtc_position position;
-	unsigned int underlay_idx = dc->res_pool->underlay_pipe_index;
-	DC_LOGGER_INIT(dc->ctx->logger);
-
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe_ctx = &res_ctx->pipe_ctx[i];
-		/* get_position() returns CRTC vertical/horizontal counter
-		 * hence not applicable for underlay pipe
-		 */
-		if (pipe_ctx->stream == NULL || pipe_ctx->pipe_idx == underlay_idx)
-			continue;
-
-		pipe_ctx->stream_res.tg->funcs->get_position(pipe_ctx->stream_res.tg, &position);
-		h_pos[i] = position.horizontal_count;
-		v_pos[i] = position.vertical_count;
-	}
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe_ctx = &res_ctx->pipe_ctx[i];
-
-		if (pipe_ctx->stream == NULL || pipe_ctx->pipe_idx == underlay_idx)
-			continue;
-
-		TIMING_TRACE("OTG_%d   H_tot:%d  V_tot:%d   H_pos:%d  V_pos:%d\n",
-				pipe_ctx->stream_res.tg->inst,
-				pipe_ctx->stream->timing.h_total,
-				pipe_ctx->stream->timing.v_total,
-				h_pos[i], v_pos[i]);
-	}
-}
-
 void context_clock_trace(
 		struct dc *dc,
 		struct dc_state *context)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 3992ad73165b..eb00ee73a8f2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -862,7 +862,6 @@ struct dc_debug_options {
 	bool sanity_checks;
 	bool max_disp_clk;
 	bool surface_trace;
-	bool timing_trace;
 	bool clock_trace;
 	bool validation_trace;
 	bool bandwidth_calcs_trace;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
index 563c5eec83ff..0098b3e72e85 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
@@ -533,7 +533,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 		.sanity_checks = true,
 		.disable_dmcu = false,
 		.force_abm_enable = false,
-		.timing_trace = false,
 		.clock_trace = true,
 
 		/* raven smu dones't allow 0 disp clk,
@@ -563,7 +562,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 static const struct dc_debug_options debug_defaults_diags = {
 		.disable_dmcu = false,
 		.force_abm_enable = false,
-		.timing_trace = true,
 		.clock_trace = true,
 		.disable_stutter = true,
 		.disable_pplib_clock_request = true,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index eea2b3b307cd..46c38fd9288d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -706,7 +706,6 @@ static const struct resource_caps res_cap_nv14 = {
 static const struct dc_debug_options debug_defaults_drv = {
 		.disable_dmcu = false,
 		.force_abm_enable = false,
-		.timing_trace = false,
 		.clock_trace = true,
 		.disable_pplib_clock_request = true,
 		.pipe_split_policy = MPC_SPLIT_AVOID_MULT_DISP,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
index fc54483b9104..5b87dfea62e4 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
@@ -600,7 +600,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 		.disable_dmcu = true,
 		.force_abm_enable = false,
-		.timing_trace = false,
 		.clock_trace = true,
 		.disable_pplib_clock_request = true,
 		.pipe_split_policy = MPC_SPLIT_DYNAMIC,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
index 347e6aaea582..135671d12c45 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
@@ -610,7 +610,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 		.disable_dmcu = false,
 		.force_abm_enable = false,
-		.timing_trace = false,
 		.clock_trace = true,
 		.disable_pplib_clock_request = true,
 		.min_disp_clk_khz = 100000,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
index 5040a4c6ed18..28c4ad289e54 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
@@ -711,7 +711,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true, //No DMCU on DCN30
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = true,
 	.pipe_split_policy = MPC_SPLIT_DYNAMIC,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
index 7d04739c3ba1..b82a0559531a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
@@ -682,7 +682,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_dpp_power_gate = false,
 	.disable_hubp_power_gate = false,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
index 5791b5cc2875..f272665aa6a8 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
@@ -81,7 +81,6 @@
 static const struct dc_debug_options debug_defaults_drv = {
 		.disable_dmcu = true,
 		.force_abm_enable = false,
-		.timing_trace = false,
 		.clock_trace = true,
 		.disable_pplib_clock_request = true,
 		.pipe_split_policy = MPC_SPLIT_DYNAMIC,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
index 63f0f882c861..ee9bc725a30e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
@@ -82,7 +82,6 @@
 static const struct dc_debug_options debug_defaults_drv = {
 		.disable_dmcu = true,
 		.force_abm_enable = false,
-		.timing_trace = false,
 		.clock_trace = true,
 		.disable_pplib_clock_request = true,
 		.pipe_split_policy = MPC_SPLIT_AVOID,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index ac8cb20e2e3b..95213c7160c6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -858,7 +858,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_DYNAMIC,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index 169924d0a839..44c52fcfc87d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -876,7 +876,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.replay_skip_crtc_disabled = true,
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_dpp_power_gate = false,
 	.disable_hubp_power_gate = false,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 3f4b9dba4112..432af4fabdb2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -858,7 +858,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.disable_z10 = true, /*hw not support it*/
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_DYNAMIC,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 5fd52c5fcee4..295065b1f206 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -853,7 +853,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.disable_z10 = true, /*hw not support it*/
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_DYNAMIC,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index a124ad9bd108..01cc6b76cd0e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -689,7 +689,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_AVOID, // Due to CRB, no need to MPC split anymore
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 827a94f84f10..9da8e4579f91 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -686,7 +686,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_AVOID,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 893a9d9ee870..5a275883c144 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -712,7 +712,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_AVOID,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 70abd32ce2ad..51070b09a831 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -692,7 +692,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_AVOID,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 9d56fbdcd06a..cfc1b77f5460 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -685,7 +685,6 @@ static const struct dc_plane_cap plane_cap = {
 static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dmcu = true,
 	.force_abm_enable = false,
-	.timing_trace = false,
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_AVOID,
diff --git a/drivers/gpu/drm/amd/display/include/logger_interface.h b/drivers/gpu/drm/amd/display/include/logger_interface.h
index 02c23b04d34b..058f882d5bdd 100644
--- a/drivers/gpu/drm/amd/display/include/logger_interface.h
+++ b/drivers/gpu/drm/amd/display/include/logger_interface.h
@@ -52,10 +52,6 @@ void update_surface_trace(
 
 void post_surface_trace(struct dc *dc);
 
-void context_timing_trace(
-		struct dc *dc,
-		struct resource_context *res_ctx);
-
 void context_clock_trace(
 		struct dc *dc,
 		struct dc_state *context);
-- 
2.47.0

