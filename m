Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B73630962
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8E910E724;
	Sat, 19 Nov 2022 02:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE55110E724;
 Sat, 19 Nov 2022 02:13:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3AB68624B7;
 Sat, 19 Nov 2022 02:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F5DC433C1;
 Sat, 19 Nov 2022 02:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668823990;
 bh=gGLteT8K6TxzFC9zMhFubn3DVHcCYF7LsJcYHZfDbXY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=flxLWY5Jfv+TWw+PnVJh9QPyeDXkYxnNFbvi25vsFdnp8mcIdps81yJ3jiaYrPWMc
 7t2sk7Jtk5sVXNbHcu4VgQWk/wOicBA7VWtVNAYDbdBeyp31ZrgvBICvjDxGhQikRu
 qVGxpd6n12RuFf5gZLDmvDNKXl5J+huMlrroc7MoUf/UMU+7uKSKmwwqDeDPRekhWl
 6qfoJnV3jJI+mBusRQffJANZaPKpGRhtv/xh/VS+H9iIN/Gma3U+z+wVJpp3kBcVDE
 9KKr7fpyYdOv4BNSC4xZI5rSXcHiF4ISlylJUGjaiT8QJYYA2E1bDiZshcZyA3v2hX
 8rHRNwwbSQVgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 37/44] Revert "drm/amdgpu: Revert "drm/amdgpu:
 getting fan speed pwm for vega10 properly""
Date: Fri, 18 Nov 2022 21:11:17 -0500
Message-Id: <20221119021124.1773699-37-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stalkerg@gmail.com,
 Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Asher Song <Asher.Song@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Asher Song <Asher.Song@amd.com>

[ Upstream commit 30b8e7b8ee3be003e0df85c857c5cd0e0bd58b82 ]

This reverts commit 4545ae2ed3f2f7c3f615a53399c9c8460ee5bca7.

The origin patch "drm/amdgpu: getting fan speed pwm for vega10 properly" works fine.
Test failure is caused by test case self.

Signed-off-by: Asher Song <Asher.Song@amd.com>
Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/pm/powerplay/hwmgr/vega10_thermal.c   | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c
index dad3e3741a4e..190af79f3236 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c
@@ -67,22 +67,21 @@ int vega10_fan_ctrl_get_fan_speed_info(struct pp_hwmgr *hwmgr,
 int vega10_fan_ctrl_get_fan_speed_pwm(struct pp_hwmgr *hwmgr,
 		uint32_t *speed)
 {
-	uint32_t current_rpm;
-	uint32_t percent = 0;
-
-	if (hwmgr->thermal_controller.fanInfo.bNoFan)
-		return 0;
+	struct amdgpu_device *adev = hwmgr->adev;
+	uint32_t duty100, duty;
+	uint64_t tmp64;
 
-	if (vega10_get_current_rpm(hwmgr, &current_rpm))
-		return -1;
+	duty100 = REG_GET_FIELD(RREG32_SOC15(THM, 0, mmCG_FDO_CTRL1),
+				CG_FDO_CTRL1, FMAX_DUTY100);
+	duty = REG_GET_FIELD(RREG32_SOC15(THM, 0, mmCG_THERMAL_STATUS),
+				CG_THERMAL_STATUS, FDO_PWM_DUTY);
 
-	if (hwmgr->thermal_controller.
-			advanceFanControlParameters.usMaxFanRPM != 0)
-		percent = current_rpm * 255 /
-			hwmgr->thermal_controller.
-			advanceFanControlParameters.usMaxFanRPM;
+	if (!duty100)
+		return -EINVAL;
 
-	*speed = MIN(percent, 255);
+	tmp64 = (uint64_t)duty * 255;
+	do_div(tmp64, duty100);
+	*speed = MIN((uint32_t)tmp64, 255);
 
 	return 0;
 }
-- 
2.35.1

