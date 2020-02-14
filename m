Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E740015E057
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97F6FAAF;
	Fri, 14 Feb 2020 16:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB6B6FAAC;
 Fri, 14 Feb 2020 16:13:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1C90246B6;
 Fri, 14 Feb 2020 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696801;
 bh=JQ+c0elFoDe9QCZbxdthM0dwj6AkdzVVD2lsG+XLaOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J9BsUx69QXGK5ASlKxNEzufnabTEJe2zmDcJxDtkgTqR1M0Kf3sMP6Q5sJVLtxDIx
 lj+YK9yJwpvc6B0TYFr+SnPBSkrZot8xabd1+r95MuwjaceoEKMsYsWavTUDLUTMK1
 JhQ1znbYtil68ARlzS1UasFrvftAER9i0nDJjzss=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 073/252] drm/radeon: remove set but not used
 variable 'blocks'
Date: Fri, 14 Feb 2020 11:08:48 -0500
Message-Id: <20200214161147.15842-73-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit 77441f77949807fda4a0aec0bdf3e86ae863fd56 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/radeon_combios.c: In function radeon_combios_get_power_modes:
drivers/gpu/drm/radeon/radeon_combios.c:2638:10: warning: variable blocks set but not used [-Wunused-but-set-variable]

It is introduced by commit 56278a8edace ("drm/radeon/kms:
pull power mode info from bios tables (v3)"), but never used,
so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_combios.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 60a61d33f6076..88afdc6bb93bd 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -2635,7 +2635,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 {
 	struct drm_device *dev = rdev->ddev;
 	u16 offset, misc, misc2 = 0;
-	u8 rev, blocks, tmp;
+	u8 rev, tmp;
 	int state_index = 0;
 	struct radeon_i2c_bus_rec i2c_bus;
 
@@ -2728,7 +2728,6 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 		offset = combios_get_table_offset(dev, COMBIOS_POWERPLAY_INFO_TABLE);
 		if (offset) {
 			rev = RBIOS8(offset);
-			blocks = RBIOS8(offset + 0x2);
 			/* power mode 0 tends to be the only valid one */
 			rdev->pm.power_state[state_index].num_clock_modes = 1;
 			rdev->pm.power_state[state_index].clock_info[0].mclk = RBIOS32(offset + 0x5 + 0x2);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
