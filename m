Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FFC562FDC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 11:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E624113153;
	Fri,  1 Jul 2022 09:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Fri, 01 Jul 2022 09:24:26 UTC
Received: from out199-11.us.a.mail.aliyun.com (out199-11.us.a.mail.aliyun.com
 [47.90.199.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A777C113150;
 Fri,  1 Jul 2022 09:24:26 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VI0Cs3W_1656667156; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VI0Cs3W_1656667156) by smtp.aliyun-inc.com;
 Fri, 01 Jul 2022 17:19:16 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: harry.wentland@amd.com
Subject: [PATCH -next] drm/amd/display: clean up some inconsistent indenting
Date: Fri,  1 Jul 2022 17:19:14 +0800
Message-Id: <20220701091914.66476-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the follow smatch warning:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3151 commit_planes_for_stream() warn: inconsistent indenting

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 146fd4b864b2..d31da9c0256a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3148,15 +3148,15 @@ static void commit_planes_for_stream(struct dc *dc,
 		else
 			dc->hwss.pipe_control_lock(dc, top_pipe_to_program, false);
 
-	if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
-		if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
-			top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
+		if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
+			if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
+				top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
 					top_pipe_to_program->stream_res.tg,
 					CRTC_STATE_VACTIVE);
-			top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
+				top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
 					top_pipe_to_program->stream_res.tg,
 					CRTC_STATE_VBLANK);
-			top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
+				top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
 					top_pipe_to_program->stream_res.tg,
 					CRTC_STATE_VACTIVE);
 
-- 
2.20.1.7.g153144c

