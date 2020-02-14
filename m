Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E815E2CB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0760E6FB45;
	Fri, 14 Feb 2020 16:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368B36FB45;
 Fri, 14 Feb 2020 16:25:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34EE9247B5;
 Fri, 14 Feb 2020 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697509;
 bh=rWKJNV9Sbr1m7wRyPB2Ede1g5VawtcrzSvOZgyNhgN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RvNLADaAM6kmitXq6tjt5//ERnZtpWDTySs7wl2v9i6Kfq2Y4tJgwL8KY+fHjJngF
 W2MBrf/6N1IUoqdVN+hhPbRJmRsvxj93iXsehlLfTc9bBW1LOUFcu5smPlrPGgKEaA
 1cG7Rl9oqyQts13Vua9coYTfHtj/NoEemfgX0yQA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 035/100] drm/radeon: remove set but not used
 variable 'tv_pll_cntl1'
Date: Fri, 14 Feb 2020 11:23:19 -0500
Message-Id: <20200214162425.21071-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162425.21071-1-sashal@kernel.org>
References: <20200214162425.21071-1-sashal@kernel.org>
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
index 49750d07ab7d4..3133f5dfc239a 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_tv.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
@@ -544,7 +544,7 @@ void radeon_legacy_tv_mode_set(struct drm_encoder *encoder,
 	uint32_t tv_master_cntl, tv_rgb_cntl, tv_dac_cntl;
 	uint32_t tv_modulator_cntl1, tv_modulator_cntl2;
 	uint32_t tv_vscaler_cntl1, tv_vscaler_cntl2;
-	uint32_t tv_pll_cntl, tv_pll_cntl1, tv_ftotal;
+	uint32_t tv_pll_cntl, tv_ftotal;
 	uint32_t tv_y_fall_cntl, tv_y_rise_cntl, tv_y_saw_tooth_cntl;
 	uint32_t m, n, p;
 	const uint16_t *hor_timing;
@@ -716,12 +716,6 @@ void radeon_legacy_tv_mode_set(struct drm_encoder *encoder,
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
