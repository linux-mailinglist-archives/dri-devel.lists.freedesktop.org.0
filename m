Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406215B80E5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 07:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C9010E86A;
	Wed, 14 Sep 2022 05:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0289610E870;
 Wed, 14 Sep 2022 05:28:27 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VPlhaq2_1663133301; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPlhaq2_1663133301) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 13:28:24 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 8/8] drm/amd/display: make optc32_phantom_crtc_post_enable,
 optc32_setup_manual_trigger and optc32_set_drr static
Date: Wed, 14 Sep 2022 13:27:42 +0800
Message-Id: <20220914052742.116297-8-jiapeng.chong@linux.alibaba.com>
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

These three functions are not used outside the function
dcn32_optc.c, so the modification is defined as static.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_optc.c:159:6: warning: no previous prototype for function 'optc32_phantom_crtc_post_enable'.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_optc.c:218:6: warning: no previous prototype for ‘optc32_set_drr’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_optc.c:193:6: warning: no previous prototype for ‘optc32_setup_manual_trigger’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2140
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
index 1fad7b48bd5b..ec3989d37086 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
@@ -156,7 +156,7 @@ static bool optc32_disable_crtc(struct timing_generator *optc)
 	return true;
 }
 
-void optc32_phantom_crtc_post_enable(struct timing_generator *optc)
+static void optc32_phantom_crtc_post_enable(struct timing_generator *optc)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
@@ -190,7 +190,7 @@ static void optc32_set_odm_bypass(struct timing_generator *optc,
 	optc1->opp_count = 1;
 }
 
-void optc32_setup_manual_trigger(struct timing_generator *optc)
+static void optc32_setup_manual_trigger(struct timing_generator *optc)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 	struct dc *dc = optc->ctx->dc;
@@ -215,7 +215,7 @@ void optc32_setup_manual_trigger(struct timing_generator *optc)
 	}
 }
 
-void optc32_set_drr(
+static void optc32_set_drr(
 	struct timing_generator *optc,
 	const struct drr_params *params)
 {
-- 
2.20.1.7.g153144c

