Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637EE27A813
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C1B6E2B4;
	Mon, 28 Sep 2020 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4F16E084;
 Mon, 28 Sep 2020 02:34:48 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7583D40C5226D708D607;
 Mon, 28 Sep 2020 10:34:44 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 28 Sep 2020
 10:34:42 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Anthony.Koo@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: make two symbols static
Date: Mon, 28 Sep 2020 10:35:43 +0800
Message-ID: <20200928023543.70093-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This addresses the following sparse warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2740:6:
warning: symbol 'dce110_set_cursor_position' was not declared. Should it
be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2785:6:
warning: symbol 'dce110_set_cursor_attribute' was not declared. Should
it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 1002ce9979dc..31a8d3452e83 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -2737,7 +2737,7 @@ static void program_output_csc(struct dc *dc,
 	}
 }
 
-void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
+static void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_cursor_position pos_cpy = pipe_ctx->stream->cursor_position;
 	struct input_pixel_processor *ipp = pipe_ctx->plane_res.ipp;
@@ -2782,7 +2782,7 @@ void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
 		mi->funcs->set_cursor_position(mi, &pos_cpy, &param);
 }
 
-void dce110_set_cursor_attribute(struct pipe_ctx *pipe_ctx)
+static void dce110_set_cursor_attribute(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_cursor_attributes *attributes = &pipe_ctx->stream->cursor_attributes;
 
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
