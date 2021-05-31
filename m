Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C1039581A
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 11:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E486E8C2;
	Mon, 31 May 2021 09:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4810A6E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 09:30:26 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ftqdy65Zrz1BGsJ;
 Mon, 31 May 2021 17:25:42 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 17:30:18 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 17:30:18 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Remove the redundant initialization of local
 variable
Date: Mon, 31 May 2021 17:30:06 +0800
Message-ID: <1622453406-50092-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Local variable 'i' and 'j' will be initialized in the for loop, so
remove the redundant initialization.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 4713f09bcbf1..e4f2a2d3a819 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -304,7 +304,7 @@ bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 		struct dc_stream_state *stream,
 		struct dc_crtc_timing_adjust *adjust)
 {
-	int i = 0;
+	int i;
 	bool ret = false;
 
 	stream->adjust.v_total_max = adjust->v_total_max;
@@ -332,7 +332,7 @@ bool dc_stream_get_crtc_position(struct dc *dc,
 {
 	/* TODO: Support multiple streams */
 	const struct dc_stream_state *stream = streams[0];
-	int i = 0;
+	int i;
 	bool ret = false;
 	struct crtc_position position;
 
@@ -539,7 +539,7 @@ void dc_stream_set_dyn_expansion(struct dc *dc, struct dc_stream_state *stream,
 		enum dc_dynamic_expansion option)
 {
 	/* OPP FMT dyn expansion updates*/
-	int i = 0;
+	int i;
 	struct pipe_ctx *pipe_ctx;
 
 	for (i = 0; i < MAX_PIPES; i++) {
@@ -597,7 +597,7 @@ void dc_stream_set_dither_option(struct dc_stream_state *stream,
 
 bool dc_stream_set_gamut_remap(struct dc *dc, const struct dc_stream_state *stream)
 {
-	int i = 0;
+	int i;
 	bool ret = false;
 	struct pipe_ctx *pipes;
 
@@ -614,7 +614,7 @@ bool dc_stream_set_gamut_remap(struct dc *dc, const struct dc_stream_state *stre
 
 bool dc_stream_program_csc_matrix(struct dc *dc, struct dc_stream_state *stream)
 {
-	int i = 0;
+	int i;
 	bool ret = false;
 	struct pipe_ctx *pipes;
 
@@ -640,8 +640,7 @@ void dc_stream_set_static_screen_params(struct dc *dc,
 		int num_streams,
 		const struct dc_static_screen_params *params)
 {
-	int i = 0;
-	int j = 0;
+	int i, j;
 	struct pipe_ctx *pipes_affected[MAX_PIPES];
 	int num_pipes_affected = 0;
 
@@ -896,7 +895,7 @@ static void disable_all_writeback_pipes_for_stream(
 static void apply_ctx_interdependent_lock(struct dc *dc, struct dc_state *context,
 					  struct dc_stream_state *stream, bool lock)
 {
-	int i = 0;
+	int i;
 
 	/* Checks if interdependent update function pointer is NULL or not, takes care of DCE110 case */
 	if (dc->hwss.interdependent_update_lock)
@@ -1156,7 +1155,7 @@ static void enable_timing_multisync(
 		struct dc *dc,
 		struct dc_state *ctx)
 {
-	int i = 0, multisync_count = 0;
+	int i, multisync_count = 0;
 	int pipe_count = dc->res_pool->pipe_count;
 	struct pipe_ctx *multisync_pipes[MAX_PIPES] = { NULL };
 
-- 
2.7.4

