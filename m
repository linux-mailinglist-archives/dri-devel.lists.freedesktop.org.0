Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9A5B80DF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 07:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2944210E869;
	Wed, 14 Sep 2022 05:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217F910E86C;
 Wed, 14 Sep 2022 05:28:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VPlhali_1663133292; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPlhali_1663133292) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 13:28:14 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 6/8] drm/amd/display: make some functions static
Date: Wed, 14 Sep 2022 13:27:40 +0800
Message-Id: <20220914052742.116297-6-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220914052742.116297-1-jiapeng.chong@linux.alibaba.com>
References: <20220914052742.116297-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions are not used outside the file dcn32_hubbub.c, so the
modification is defined as static.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:912:6: warning: no previous prototype for ‘hubbub32_force_wm_propagate_to_pipes’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:823:6: warning: no previous prototype for ‘hubbub32_wm_read_state’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:772:6: warning: no previous prototype for ‘hubbub32_init_watermarks’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:712:6: warning: no previous prototype for ‘hubbub32_force_usr_retraining_allow’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2141
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
index 99eb239bbc7b..d4963959426c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
@@ -709,7 +709,7 @@ static bool hubbub32_program_usr_watermarks(
 	return wm_pending;
 }
 
-void hubbub32_force_usr_retraining_allow(struct hubbub *hubbub, bool allow)
+static void hubbub32_force_usr_retraining_allow(struct hubbub *hubbub, bool allow)
 {
 	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
 
@@ -769,7 +769,7 @@ static bool hubbub32_program_watermarks(
 }
 
 /* Copy values from WM set A to all other sets */
-void hubbub32_init_watermarks(struct hubbub *hubbub)
+static void hubbub32_init_watermarks(struct hubbub *hubbub)
 {
 	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
 	uint32_t reg;
@@ -820,7 +820,7 @@ void hubbub32_init_watermarks(struct hubbub *hubbub)
 	REG_WRITE(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, reg);
 }
 
-void hubbub32_wm_read_state(struct hubbub *hubbub,
+static void hubbub32_wm_read_state(struct hubbub *hubbub,
 		struct dcn_hubbub_wm *wm)
 {
 	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
@@ -909,7 +909,7 @@ void hubbub32_wm_read_state(struct hubbub *hubbub,
 			DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, &s->fclk_pstate_change);
 }
 
-void hubbub32_force_wm_propagate_to_pipes(struct hubbub *hubbub)
+static void hubbub32_force_wm_propagate_to_pipes(struct hubbub *hubbub)
 {
 	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
 	uint32_t refclk_mhz = hubbub->ctx->dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000;
-- 
2.20.1.7.g153144c

