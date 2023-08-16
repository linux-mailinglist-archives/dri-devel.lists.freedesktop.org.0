Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1577D72C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 02:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0910510E2A7;
	Wed, 16 Aug 2023 00:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFA310E2A7;
 Wed, 16 Aug 2023 00:46:10 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VptPHtZ_1692146765; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VptPHtZ_1692146765) by smtp.aliyun-inc.com;
 Wed, 16 Aug 2023 08:46:06 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com
Subject: [PATCH -next] drm/amd/display: Simplify bool conversion
Date: Wed, 16 Aug 2023 08:46:03 +0800
Message-Id: <20230816004603.2908-1-yang.lee@linux.alibaba.com>
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:94:102-107: WARNING: conversion to bool not needed here
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:102:72-77: WARNING: conversion to bool not needed here

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
index 32d3086c4cb7..5ce542b1f860 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
@@ -91,7 +91,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
 	pr_config.replay_supported = true;
 	pr_config.replay_power_opt_supported = 0;
 	pr_config.replay_enable_option |= pr_enable_option_static_screen;
-	pr_config.replay_timing_sync_supported = aconnector->max_vfreq >= 2 * aconnector->min_vfreq ? true : false;
+	pr_config.replay_timing_sync_supported = aconnector->max_vfreq >= 2 * aconnector->min_vfreq;
 
 	if (!pr_config.replay_timing_sync_supported)
 		pr_config.replay_enable_option &= ~pr_enable_option_general_ui;
@@ -99,7 +99,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
 	debug_flags = (union replay_debug_flags *)&pr_config.debug_flags;
 	debug_flags->u32All = 0;
 	debug_flags->bitfields.visual_confirm =
-		link->ctx->dc->debug.visual_confirm == VISUAL_CONFIRM_REPLAY ? true : false;
+		link->ctx->dc->debug.visual_confirm == VISUAL_CONFIRM_REPLAY;
 
 	link->replay_settings.replay_feature_enabled = true;
 
-- 
2.20.1.7.g153144c

