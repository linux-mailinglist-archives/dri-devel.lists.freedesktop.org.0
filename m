Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C19AAA1AA
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D2910E557;
	Mon,  5 May 2025 22:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pbeXP0Lh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEA210E55A;
 Mon,  5 May 2025 22:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 31CF649E6A;
 Mon,  5 May 2025 22:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D6DC4CEE4;
 Mon,  5 May 2025 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485410;
 bh=LrDTYJPPikt2CZU7xFsXv7FLYT+5gZ9WRCubtv94W7g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pbeXP0LhqNa/Ths8V33RA7pBXelUCeQt3l89zE9hlmG06IWwdld17W5in1WojB1qe
 qV8meR6oLTgcoZxoi2bjyovc3oAcvHrJYQeqjI9h/K0lcWrpcgYBdQJWbaXtHU/Ldf
 5+yMSjTdyKs0GFHq8Dwl0BQSalwNf8cfOEH2axOCSvk7BFrgS5jPWPczbPXc/MMbSS
 /T0Y9zI4H5z7+Q2WEGDe7CJOeSYIfVYY1yNs23R8N9KFZQcRRRchOty7gCkEykZL4s
 dzS8wbsshZeuMHpTUO7OVAtGZ4TkzZzjQl9vnf1pQE/ezEm8aA+9Xd9Uqvpnm1ka+r
 h83oR+Wj10R/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leo Zeng <Leo.Zeng@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, alex.hung@amd.com, Aric.Cyr@amd.com, alvin.lee2@amd.com,
 siqueira@igalia.com, wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 304/486] Revert "drm/amd/display: Request HW
 cursor on DCN3.2 with SubVP"
Date: Mon,  5 May 2025 18:36:20 -0400
Message-Id: <20250505223922.2682012-304-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Leo Zeng <Leo.Zeng@amd.com>

[ Upstream commit 8ae6dfc0b61b170cf13832d4cfe2a0c744e621a7 ]

This reverts commit 13437c91606c9232c747475e202fe3827cd53264.

Reason to revert: idle power regression found in testing.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Leo Zeng <Leo.Zeng@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 56dda686e2992..6f490d8d7038c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -626,7 +626,6 @@ static bool dcn32_assign_subvp_pipe(struct dc *dc,
 		 * - Not TMZ surface
 		 */
 		if (pipe->plane_state && !pipe->top_pipe && !pipe->prev_odm_pipe && !dcn32_is_center_timing(pipe) &&
-				!pipe->stream->hw_cursor_req &&
 				!(pipe->stream->timing.pix_clk_100hz / 10000 > DCN3_2_MAX_SUBVP_PIXEL_RATE_MHZ) &&
 				(!dcn32_is_psr_capable(pipe) || (context->stream_count == 1 && dc->caps.dmub_caps.subvp_psr)) &&
 				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_NONE &&
-- 
2.39.5

