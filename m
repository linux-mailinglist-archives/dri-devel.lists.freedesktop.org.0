Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97139C828
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 14:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5DA6E063;
	Sat,  5 Jun 2021 12:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17639.qiye.163.com (mail-m17639.qiye.163.com
 [59.111.176.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F316E063
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 12:31:41 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id 3D8DF380100;
 Sat,  5 Jun 2021 20:31:39 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hersen Wu <hersenxs.wu@amd.com>, Solomon Chiu <solomon.chiu@amd.com>,
 "Li, Roman" <Roman.Li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Daniel Kolesa <daniel@octaforge.org>,
 Bernard Zhao <bernard@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: remove no need variable
Date: Sat,  5 Jun 2021 05:30:59 -0700
Message-Id: <20210605123137.8800-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQk0aGVZISBlKGEseSE0fHUxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxw6UTo4Dz8TCQkLIR8KD0NR
 TDQaFBVVSlVKTUlJQ0JNSUJCQ0lCVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJQkNPNwY+
X-HM-Tid: 0a79dc284e00d994kuws3d8df380100
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

remove no need variable, just return the DC_OK

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index f962b905e79e..7daadb6a5233 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -1266,8 +1266,6 @@ static enum dc_status dcn10_validate_global(struct dc *dc, struct dc_state *cont
 
 static enum dc_status dcn10_patch_unknown_plane_state(struct dc_plane_state *plane_state)
 {
-	enum dc_status result = DC_OK;
-
 	enum surface_pixel_format surf_pix_format = plane_state->format;
 	unsigned int bpp = resource_pixel_format_to_bpp(surf_pix_format);
 
@@ -1279,7 +1277,7 @@ static enum dc_status dcn10_patch_unknown_plane_state(struct dc_plane_state *pla
 		swizzle = DC_SW_64KB_S;
 
 	plane_state->tiling_info.gfx9.swizzle = swizzle;
-	return result;
+	return DC_OK;
 }
 
 struct stream_encoder *dcn10_find_first_free_match_stream_enc_for_link(
-- 
2.31.0

