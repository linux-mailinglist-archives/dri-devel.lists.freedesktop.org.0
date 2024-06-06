Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D18FE348
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48B310E8B2;
	Thu,  6 Jun 2024 09:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kBQQDRum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BD510E8B2;
 Thu,  6 Jun 2024 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1717667066; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=SSDpadhDayKYDhxfcnPmHvLUUqjwwCKH0DV0DmvwUWk=;
 b=kBQQDRumQfxUkfZDMuiHxyPpqeoN9BOoC7qRCW8wWrFT2ixAisVTg5pzclH8vPFvUTdwR8V0KRAo8rJ64yTkFoLydQX72bdA4yhu7slh7Ij5tn1fpL+1RZSHgrkl4F3AwoBuKyUTUHPIJW19LIkQ8ZUZArOhl+kbWRTgqF4eEDQ=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067110;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0W7xs-ya_1717667055; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W7xs-ya_1717667055) by smtp.aliyun-inc.com;
 Thu, 06 Jun 2024 17:44:24 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: clean up some inconsistent indenting
Date: Thu,  6 Jun 2024 17:44:14 +0800
Message-Id: <20240606094414.703-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
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

No functional modification involved.

drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:529 dcn32_auto_dpm_test_log() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9294
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index ff5fdc7b1198..7300e793d506 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -525,25 +525,23 @@ static void dcn32_auto_dpm_test_log(
 
 	mall_ss_size_bytes = context->bw_ctx.bw.dcn.mall_ss_size_bytes;
 
-    dispclk_khz_reg    = REG_READ(CLK1_CLK0_CURRENT_CNT); // DISPCLK
-    dppclk_khz_reg     = REG_READ(CLK1_CLK1_CURRENT_CNT); // DPPCLK
-    dprefclk_khz_reg   = REG_READ(CLK1_CLK2_CURRENT_CNT); // DPREFCLK
-    dcfclk_khz_reg     = REG_READ(CLK1_CLK3_CURRENT_CNT); // DCFCLK
-    dtbclk_khz_reg     = REG_READ(CLK1_CLK4_CURRENT_CNT); // DTBCLK
-    fclk_khz_reg       = REG_READ(CLK4_CLK0_CURRENT_CNT); // FCLK
-
-    // Overrides for these clocks in case there is no p_state change support
-    dramclk_khz_override = new_clocks->dramclk_khz;
-    fclk_khz_override = new_clocks->fclk_khz;
-
-    num_fclk_levels = clk_mgr->base.bw_params->clk_table.num_entries_per_clk.num_fclk_levels - 1;
-
-    if (!new_clocks->p_state_change_support) {
-	    dramclk_khz_override = clk_mgr->base.bw_params->max_memclk_mhz * 1000;
-    }
-    if (!new_clocks->fclk_p_state_change_support) {
-	    fclk_khz_override = clk_mgr->base.bw_params->clk_table.entries[num_fclk_levels].fclk_mhz * 1000;
-    }
+	dispclk_khz_reg    = REG_READ(CLK1_CLK0_CURRENT_CNT); // DISPCLK
+	dppclk_khz_reg     = REG_READ(CLK1_CLK1_CURRENT_CNT); // DPPCLK
+	dprefclk_khz_reg   = REG_READ(CLK1_CLK2_CURRENT_CNT); // DPREFCLK
+	dcfclk_khz_reg     = REG_READ(CLK1_CLK3_CURRENT_CNT); // DCFCLK
+	dtbclk_khz_reg     = REG_READ(CLK1_CLK4_CURRENT_CNT); // DTBCLK
+	fclk_khz_reg       = REG_READ(CLK4_CLK0_CURRENT_CNT); // FCLK
+
+	// Overrides for these clocks in case there is no p_state change support
+	dramclk_khz_override = new_clocks->dramclk_khz;
+	fclk_khz_override = new_clocks->fclk_khz;
+
+	num_fclk_levels = clk_mgr->base.bw_params->clk_table.num_entries_per_clk.num_fclk_levels - 1;
+
+	if (!new_clocks->p_state_change_support)
+		dramclk_khz_override = clk_mgr->base.bw_params->max_memclk_mhz * 1000;
+	if (!new_clocks->fclk_p_state_change_support)
+		fclk_khz_override = clk_mgr->base.bw_params->clk_table.entries[num_fclk_levels].fclk_mhz * 1000;
 
 	////////////////////////////////////////////////////////////////////////////
 	//	IMPORTANT: 	When adding more clocks to these logs, do NOT put a newline
-- 
2.20.1.7.g153144c

