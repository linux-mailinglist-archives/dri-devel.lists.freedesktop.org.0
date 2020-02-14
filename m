Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9715DE6D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A57A6FA3C;
	Fri, 14 Feb 2020 16:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC316FA2F;
 Fri, 14 Feb 2020 16:04:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07A9C2467E;
 Fri, 14 Feb 2020 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696274;
 bh=QjtRAkFz86K8t0Yr71VMUq3M6m0erGyhUVbvNt9bh+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DM750cuxjnahUk7gYeGMfPrtkvk12QVqdSaXURT8M+UhT8Gz3HE5d6G0HadYbjQ9M
 2S7JFwUmz94dS+av5RE/wcj2R1bOTAu+MbkrZH4+vUCLmrdUzMat8Yw/T8GBsTpmdP
 3enLdxYoSKAZojJtfmQ9eAbgbsoFUNMmQwAQg0xE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 124/459] drm/amd/powerplay: remove set but not
 used variable 'vbios_version', 'data'
Date: Fri, 14 Feb 2020 10:56:14 -0500
Message-Id: <20200214160149.11681-124-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit cb7709223b39287a020e92ff880d11d377dc53a1 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c: In function smu7_check_mc_firmware:
drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c:4215:11: warning: variable vbios_version set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c: In function smu7_get_performance_level:
drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c:5054:21: warning: variable data set but not used [-Wunused-but-set-variable]

'vbios_version' is introduced by commit 599a7e9fe1b6 ("drm/amd/powerplay:
implement smu7 hwmgr to manager asics with smu ip version 7."),
but never used, so remove it.

'data' is introduced by commit f688b614b643 ("drm/amd/pp:
Implement get_performance_level for legacy dgpu"), but never used,
so remove it.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index 203ce4b1028f8..042800f63ef32 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -4232,7 +4232,6 @@ static int smu7_check_mc_firmware(struct pp_hwmgr *hwmgr)
 {
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
-	uint32_t vbios_version;
 	uint32_t tmp;
 
 	/* Read MC indirect register offset 0x9F bits [3:0] to see
@@ -4241,7 +4240,6 @@ static int smu7_check_mc_firmware(struct pp_hwmgr *hwmgr)
 	 */
 
 	smu7_get_mc_microcode_version(hwmgr);
-	vbios_version = hwmgr->microcode_version_info.MC & 0xf;
 
 	data->need_long_memory_training = false;
 
@@ -5071,13 +5069,11 @@ static int smu7_get_performance_level(struct pp_hwmgr *hwmgr, const struct pp_hw
 				PHM_PerformanceLevel *level)
 {
 	const struct smu7_power_state *ps;
-	struct smu7_hwmgr *data;
 	uint32_t i;
 
 	if (level == NULL || hwmgr == NULL || state == NULL)
 		return -EINVAL;
 
-	data = hwmgr->backend;
 	ps = cast_const_phw_smu7_power_state(state);
 
 	i = index > ps->performance_level_count - 1 ?
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
