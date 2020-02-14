Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED31D15E051
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B881C6FAAC;
	Fri, 14 Feb 2020 16:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8266FAA5;
 Fri, 14 Feb 2020 16:13:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02ADE246BA;
 Fri, 14 Feb 2020 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696802;
 bh=13YwOUhm/zgYS0OzSv2ocq+cj0TP0yaw0TFlpIWVLzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OsByKrmizJxq2ZZgoCfcGgNaI7FSDNaNoDOF/ogeiz1vdPEAMnLWgCS/CP84XWVe1
 Kklf0srB99X2Wp+EpBjgdVtbTBgJQUxuvdPec7s+xK2BGiqFC5fHjzs4u1mcBuRLKn
 7MlpOYqu9lEBb44QMroLNO7bi/zudcgH3pttbUWE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 074/252] drm/radeon: remove set but not used
 variable 'tv_pll_cntl1'
Date: Fri, 14 Feb 2020 11:08:49 -0500
Message-Id: <20200214161147.15842-74-sashal@kernel.org>
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

[ Upstream commit dc9b3dbd28744510b78490dc6312848a8f918749 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/radeon_legacy_tv.c: In function radeon_legacy_tv_mode_set:
drivers/gpu/drm/radeon/radeon_legacy_tv.c:538:24: warning: variable tv_pll_cntl1 set but not used [-Wunused-but-set-variable]

It is introduced by commit 4ce001abafaf ("drm/radeon/kms:
add initial radeon tv-out support."), but never used,
so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_legacy_tv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_legacy_tv.c b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
index 611cf934b2119..840a08a69b81f 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_tv.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
@@ -545,7 +545,7 @@ void radeon_legacy_tv_mode_set(struct drm_encoder *encoder,
 	uint32_t tv_master_cntl, tv_rgb_cntl, tv_dac_cntl;
 	uint32_t tv_modulator_cntl1, tv_modulator_cntl2;
 	uint32_t tv_vscaler_cntl1, tv_vscaler_cntl2;
-	uint32_t tv_pll_cntl, tv_pll_cntl1, tv_ftotal;
+	uint32_t tv_pll_cntl, tv_ftotal;
 	uint32_t tv_y_fall_cntl, tv_y_rise_cntl, tv_y_saw_tooth_cntl;
 	uint32_t m, n, p;
 	const uint16_t *hor_timing;
@@ -717,12 +717,6 @@ void radeon_legacy_tv_mode_set(struct drm_encoder *encoder,
 		(((n >> 9) & RADEON_TV_N0HI_MASK) << RADEON_TV_N0HI_SHIFT) |
 		((p & RADEON_TV_P_MASK) << RADEON_TV_P_SHIFT);
 
-	tv_pll_cntl1 = (((4 & RADEON_TVPCP_MASK) << RADEON_TVPCP_SHIFT) |
-			((4 & RADEON_TVPVG_MASK) << RADEON_TVPVG_SHIFT) |
-			((1 & RADEON_TVPDC_MASK) << RADEON_TVPDC_SHIFT) |
-			RADEON_TVCLK_SRC_SEL_TVPLL |
-			RADEON_TVPLL_TEST_DIS);
-
 	tv_dac->tv.tv_uv_adr = 0xc8;
 
 	if (tv_dac->tv_std == TV_STD_NTSC ||
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
