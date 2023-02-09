Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CED690667
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB6810E98A;
	Thu,  9 Feb 2023 11:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949DA10E98A;
 Thu,  9 Feb 2023 11:16:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D5F0B82109;
 Thu,  9 Feb 2023 11:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D7CC433A1;
 Thu,  9 Feb 2023 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941410;
 bh=VloG9acZa/PwwsJWfuSKaf8CoTxyQm2FyMJ/VwbdQes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbbZuzuG89+6OEDWDFFn7gt+vGLSCLT0eQifN2/5VyfZymLrUrvGesxAgviPMLdtE
 ThuALioPyLaGkKgyeiCbjI9zvOvOQOUk4jFLMjAWsjFtI8p6G8EjG8l3Xi6zi0uhO7
 GmwmXwu1ezVBpz1rdiIglqK0e0PocDDAA8Rb6SiOIhaXH/aFyi/XEleDjDuLkqaDMG
 EgB1Yh1FHg3qaCgb4y0GoUpFr7JM1is8rAHK/tDpHNUgNIBXnxA8/boJlKdX/eyIUq
 +OahqmlCkT4kED0xgwlN8fU6hu1Ah/cy19g/1HHsPr28ynrZxamWcF/S2zEZHqTGyP
 ce69ZvqlmAcdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 29/38] drm/amd/display: Add missing brackets in
 calculation
Date: Thu,  9 Feb 2023 06:14:48 -0500
Message-Id: <20230209111459.1891941-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Miess <Daniel.Miess@amd.com>,
 Charlene.Liu@amd.com, Alex Hung <alex.hung@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, nathan@kernel.org, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com,
 Pavle.Kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Miess <Daniel.Miess@amd.com>

[ Upstream commit ea062fd28f922cb118bfb33229f405b81aff7781 ]

[Why]
Brackets missing in the calculation for MIN_DST_Y_NEXT_START

[How]
Add missing brackets for this calculation

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Daniel Miess <Daniel.Miess@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 0d12fd079cd61..3afd3c80e6da8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -3184,7 +3184,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		} else {
 			v->MIN_DST_Y_NEXT_START[k] = v->VTotal[k] - v->VFrontPorch[k] + v->VTotal[k] - v->VActive[k] - v->VStartup[k];
 		}
-		v->MIN_DST_Y_NEXT_START[k] += dml_floor(4.0 * v->TSetup[k] / (double)v->HTotal[k] / v->PixelClock[k], 1.0) / 4.0;
+		v->MIN_DST_Y_NEXT_START[k] += dml_floor(4.0 * v->TSetup[k] / ((double)v->HTotal[k] / v->PixelClock[k]), 1.0) / 4.0;
 		if (((v->VUpdateOffsetPix[k] + v->VUpdateWidthPix[k] + v->VReadyOffsetPix[k]) / v->HTotal[k])
 				<= (isInterlaceTiming ?
 						dml_floor((v->VTotal[k] - v->VActive[k] - v->VFrontPorch[k] - v->VStartup[k]) / 2.0, 1.0) :
-- 
2.39.0

