Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCCA7FD1F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9506B10E62C;
	Tue,  8 Apr 2025 10:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g2xlgDkG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E005810E62C;
 Tue,  8 Apr 2025 10:57:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F6E76115B;
 Tue,  8 Apr 2025 10:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DFDC4CEE5;
 Tue,  8 Apr 2025 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1744109813;
 bh=SulBvQ4epalG51tE7QUhvSfdtr/57Adw814kw0BYwis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g2xlgDkGfpWvOHx+3Z4Pkv5iKZ+QPbg+gU4PCCy8N9ckfwoco6RyjGJ2oENYeUGKl
 DrqQoIlrSmiJ6sT0t1Zw8xzn1dZHbZsU0+IHt3LLkqM3s5R5PuT3ZrCEtNs37rAnkd
 fhwrYnv6+k/HNwLrB1TTqR9eNcAebHzd6a5H7IHA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 062/227] drm/amd/display/dc/core/dc_resource: Staticify
 local functions
Date: Tue,  8 Apr 2025 12:47:20 +0200
Message-ID: <20250408104822.267936264@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408104820.353768086@linuxfoundation.org>
References: <20250408104820.353768086@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

5.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Lee Jones <lee.jones@linaro.org>

[ Upstream commit c88855f3a50903721c4e1dda16cb42b5f5432b5c ]

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1120:5: warning: no previous prototype for ‘shift_border_left_to_dst’ [-Wmissing-prototypes]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1131:6: warning: no previous prototype for ‘restore_border_left_from_dst’ [-Wmissing-prototypes]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Stable-dep-of: 374c9faac5a7 ("drm/amd/display: Fix null check for pipe_ctx->plane_state in resource_build_scaling_params")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index b619ebd452ad4..5dc6840cea248 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1108,7 +1108,7 @@ static void calculate_inits_and_adj_vp(struct pipe_ctx *pipe_ctx)
  * We also need to make sure pipe_ctx->plane_res.scl_data.h_active uses the
  * original h_border_left value in its calculation.
  */
-int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
+static int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
 {
 	int store_h_border_left = pipe_ctx->stream->timing.h_border_left;
 
@@ -1119,8 +1119,8 @@ int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
 	return store_h_border_left;
 }
 
-void restore_border_left_from_dst(struct pipe_ctx *pipe_ctx,
-                                  int store_h_border_left)
+static void restore_border_left_from_dst(struct pipe_ctx *pipe_ctx,
+					 int store_h_border_left)
 {
 	pipe_ctx->stream->dst.x -= store_h_border_left;
 	pipe_ctx->stream->timing.h_border_left = store_h_border_left;
-- 
2.39.5



