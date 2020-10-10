Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA92289FD0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E706EE9D;
	Sat, 10 Oct 2020 10:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D406EE84
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 02:00:20 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 33017482787;
 Sat, 10 Oct 2020 10:00:15 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Jun Lei <jun.lei@amd.com>,
 Martin Leung <martin.leung@amd.com>, Samson Tam <Samson.Tam@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Reza Amini <Reza.Amini@amd.com>, Robin Singh <robin.singh@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Wyatt Wood <wyatt.wood@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: remove no need return value
Date: Fri,  9 Oct 2020 18:59:55 -0700
Message-Id: <20201010020006.3942-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT0NOQxhLGBhNSUtJVkpNS0lJQk5JSk5NQ05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRA6Exw6ST8pGkMYGDoXFyEJ
 LDVPFAtVSlVKTUtJSUJOSUpNSk9LVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBTUpJTjcG
X-HM-Tid: 0a75103cb60493bakuws33017482787
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Functions (disable_all_writeback_pipes_for_stream &
dc_enable_stereo & dc_post_update_surfaces_to_stream)
always return true, there is no need to keep the return value.
This change is to make the code a bit more readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c   | 17 +++++------------
 drivers/gpu/drm/amd/display/dc/dc.h        |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h |  2 +-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 92eb1ca1634f..8dc598a632b5 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -761,7 +761,7 @@ static bool dc_construct(struct dc *dc,
 	return false;
 }
 
-static bool disable_all_writeback_pipes_for_stream(
+static void disable_all_writeback_pipes_for_stream(
 		const struct dc *dc,
 		struct dc_stream_state *stream,
 		struct dc_state *context)
@@ -770,8 +770,6 @@ static bool disable_all_writeback_pipes_for_stream(
 
 	for (i = 0; i < stream->num_wb_info; i++)
 		stream->writeback_info[i].wb_enabled = false;
-
-	return true;
 }
 
 void apply_ctx_interdependent_lock(struct dc *dc, struct dc_state *context, struct dc_stream_state *stream, bool lock)
@@ -1213,13 +1211,12 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
 	return true;
 }
 
-bool dc_enable_stereo(
+void dc_enable_stereo(
 	struct dc *dc,
 	struct dc_state *context,
 	struct dc_stream_state *streams[],
 	uint8_t stream_count)
 {
-	bool ret = true;
 	int i, j;
 	struct pipe_ctx *pipe;
 
@@ -1234,8 +1231,6 @@ bool dc_enable_stereo(
 				dc->hwss.setup_stereo(pipe, dc);
 		}
 	}
-
-	return ret;
 }
 
 /*
@@ -1448,18 +1443,18 @@ static bool is_flip_pending_in_pipes(struct dc *dc, struct dc_state *context)
 	return false;
 }
 
-bool dc_post_update_surfaces_to_stream(struct dc *dc)
+void dc_post_update_surfaces_to_stream(struct dc *dc)
 {
 	int i;
 	struct dc_state *context = dc->current_state;
 
 	if ((!dc->optimized_required) || dc->optimize_seamless_boot_streams > 0)
-		return true;
+		return;
 
 	post_surface_trace(dc);
 
 	if (is_flip_pending_in_pipes(dc, context))
-		return true;
+		return;
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].stream == NULL ||
@@ -1472,8 +1467,6 @@ bool dc_post_update_surfaces_to_stream(struct dc *dc)
 
 	dc->optimized_required = false;
 	dc->wm_optimized_required = false;
-
-	return true;
 }
 
 struct dc_state *dc_create_state(struct dc *dc)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index f50ef4255020..f79a3c318757 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -962,7 +962,7 @@ struct dc_flip_addrs {
 	bool triplebuffer_flips;
 };
 
-bool dc_post_update_surfaces_to_stream(
+void dc_post_update_surfaces_to_stream(
 		struct dc *dc);
 
 #include "dc_stream.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index d9888f316da6..0047ab33f88e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -391,7 +391,7 @@ enum dc_status dc_validate_stream(struct dc *dc, struct dc_stream_state *stream)
  * Enable stereo when commit_streams is not required,
  * for example, frame alternate.
  */
-bool dc_enable_stereo(
+void dc_enable_stereo(
 	struct dc *dc,
 	struct dc_state *context,
 	struct dc_stream_state *streams[],
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
