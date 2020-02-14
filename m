Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8E15DC1B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3406F9B0;
	Fri, 14 Feb 2020 15:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE166F9B2;
 Fri, 14 Feb 2020 15:52:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80D622465D;
 Fri, 14 Feb 2020 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695537;
 bh=PJ1dNamkW+D4Whf16A1tYExOik0G4kukgCtYd/HrtIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uSuMg5Ru4/X4CVexQijuIbYZCOjgWT6ihpBPvTNEOhAGwTe+1ME0VuVxSCZkYR2qz
 a2TB0pdWsfeVXDF+gUJyZ3HPx7kUUECX4mnPrOs24P3aFearn10/cjx50hKKReR0mw
 +gUleRDlNRqDFMSFi5B/5y4tKkTXZzB5YHICSwak=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 156/542] drm/amd/display: remove set but not used
 variable 'old_plane_crtc'
Date: Fri, 14 Feb 2020 10:42:28 -0500
Message-Id: <20200214154854.6746-156-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit d3b65841b31c0192f997e0f9bc64dccbfaa97bcc ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: In function dm_determine_update_type_for_commit:
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6516:36: warning: variable old_plane_crtc set but not used [-Wunused-but-set-variable]

It is introduced by commit a87fa9938749 ("drm/amd/display:
Build stream update and plane updates in dm"), but never used,
so remove it.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 803e59d974111..ce57bfde2302b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7265,7 +7265,7 @@ dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
 	int i, j, num_plane, ret = 0;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	struct dm_plane_state *new_dm_plane_state, *old_dm_plane_state;
-	struct drm_crtc *new_plane_crtc, *old_plane_crtc;
+	struct drm_crtc *new_plane_crtc;
 	struct drm_plane *plane;
 
 	struct drm_crtc *crtc;
@@ -7311,7 +7311,6 @@ dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
 			uint64_t tiling_flags;
 
 			new_plane_crtc = new_plane_state->crtc;
-			old_plane_crtc = old_plane_state->crtc;
 			new_dm_plane_state = to_dm_plane_state(new_plane_state);
 			old_dm_plane_state = to_dm_plane_state(old_plane_state);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
