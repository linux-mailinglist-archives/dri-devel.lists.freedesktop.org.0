Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFDF3BCDAF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1355C6E3B2;
	Tue,  6 Jul 2021 11:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098DE6E3AE;
 Tue,  6 Jul 2021 11:21:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3EDA61DBB;
 Tue,  6 Jul 2021 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570467;
 bh=yQK+7EMPW+anCuBOtmGBLrgSUk/BCsTb+VKx6gKoMiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UjRvVEA9KyHjCXluSZ5kRVFszc+87RCSDcVZwE2kZXByfEkI9awGR22QlIkjWojJ5
 RKP49lOX8uYDz6lU3kHfLle8Njf5jcyqJybeh1DPk8rghO9CsGyk9fRu0nUpGapFA5
 tp7W4RARzK/T2KJY9R1FppT+z+2COgyPmwNiJbWp6N/Q3R2Qm796Q88svouMQkD8uk
 dIGqpbPEWko8YHSDAdw0lEEK+NHpJPcgim7/Fd9jSH75tm4as8u5GOXjIJcPBsqkMg
 4yMHOc9+MrP1EzXA+3UzMVEHBuyk9NH8B76ONU+AVlxP5TQjbH1vRxWmqeco5LahUJ
 q6AEY6OtHIogA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 119/160] drm/amd/display: Fix edp_bootup_bl_level
 initialization issue
Date: Tue,  6 Jul 2021 07:17:45 -0400
Message-Id: <20210706111827.2060499-119-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
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
Cc: Logush Oliver <ollogush@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Bindu Ramamurthy <bindu.r@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Logush Oliver <ollogush@amd.com>

[ Upstream commit eeb90e26ed05dd44553d557057bf35f08f853af8 ]

[why]
Updating the file to fix the missing line

Signed-off-by: Logush Oliver <ollogush@amd.com>
Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Bindu Ramamurthy <bindu.r@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 9f9fda3118d1..500bcd0ecf4d 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1944,7 +1944,7 @@ static enum bp_result get_integrated_info_v2_1(
 		info_v2_1->edp1_info.edp_pwr_down_bloff_to_vary_bloff;
 	info->edp1_info.edp_panel_bpc =
 		info_v2_1->edp1_info.edp_panel_bpc;
-	info->edp1_info.edp_bootup_bl_level =
+	info->edp1_info.edp_bootup_bl_level = info_v2_1->edp1_info.edp_bootup_bl_level;
 
 	info->edp2_info.edp_backlight_pwm_hz =
 	le16_to_cpu(info_v2_1->edp2_info.edp_backlight_pwm_hz);
-- 
2.30.2

