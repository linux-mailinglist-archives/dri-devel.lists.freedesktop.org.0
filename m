Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44BE70EC42
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 06:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D369710E56A;
	Wed, 24 May 2023 04:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EC310E567
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 04:00:09 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VjMa8F5_1684900803; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VjMa8F5_1684900803) by smtp.aliyun-inc.com;
 Wed, 24 May 2023 12:00:04 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 05/13] drm/amd/display: remove unused definition
Date: Wed, 24 May 2023 11:59:44 +0800
Message-Id: <20230524035952.123590-5-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230524035952.123590-1-yang.lee@linux.alibaba.com>
References: <20230524035952.123590-1-yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, Yang Li <yang.lee@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the following warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c:1360:43: warning: unused variable 'res_create_maximus_funcs'
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c:737:38: warning: unused variable 'debug_defaults_diags'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5296
Fixes: 00df97e1df57 ("drm/amd/display: Clean FPGA code in dc")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../drm/amd/display/dc/dcn32/dcn32_resource.c | 29 -------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 33abc8c9d4be..2e6b39fe2613 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -734,26 +734,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.fpo_vactive_max_blank_us = 1000,
 };
 
-static const struct dc_debug_options debug_defaults_diags = {
-	.disable_dmcu = true,
-	.force_abm_enable = false,
-	.timing_trace = true,
-	.clock_trace = true,
-	.disable_dpp_power_gate = true,
-	.disable_hubp_power_gate = true,
-	.disable_dsc_power_gate = true,
-	.disable_clock_gate = true,
-	.disable_pplib_clock_request = true,
-	.disable_pplib_wm_range = true,
-	.disable_stutter = false,
-	.scl_reset_length10 = true,
-	.dwb_fi_phase = -1, // -1 = disable
-	.dmub_command_table = true,
-	.enable_tri_buf = true,
-	.use_max_lb = true,
-	.force_disable_subvp = true
-};
-
 static struct dce_aux *dcn32_aux_engine_create(
 	struct dc_context *ctx,
 	uint32_t inst)
@@ -1357,15 +1337,6 @@ static const struct resource_create_funcs res_create_funcs = {
 	.create_hwseq = dcn32_hwseq_create,
 };
 
-static const struct resource_create_funcs res_create_maximus_funcs = {
-	.read_dce_straps = NULL,
-	.create_audio = NULL,
-	.create_stream_encoder = NULL,
-	.create_hpo_dp_stream_encoder = dcn32_hpo_dp_stream_encoder_create,
-	.create_hpo_dp_link_encoder = dcn32_hpo_dp_link_encoder_create,
-	.create_hwseq = dcn32_hwseq_create,
-};
-
 static void dcn32_resource_destruct(struct dcn32_resource_pool *pool)
 {
 	unsigned int i;
-- 
2.20.1.7.g153144c

