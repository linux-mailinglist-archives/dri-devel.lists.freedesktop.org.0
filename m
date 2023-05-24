Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065F70EC4C
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 06:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C0010E575;
	Wed, 24 May 2023 04:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389D510E56C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 04:00:12 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VjMWCGq_1684900807; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VjMWCGq_1684900807) by smtp.aliyun-inc.com;
 Wed, 24 May 2023 12:00:08 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 07/13] drm/amd/display: remove unused definition
Date: Wed, 24 May 2023 11:59:46 +0800
Message-Id: <20230524035952.123590-7-yang.lee@linux.alibaba.com>
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn302/dcn302_resource.c:957:43: warning: unused variable 'res_create_maximus_funcs'
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn302/dcn302_resource.c:101:38: warning: unused variable 'debug_defaults_diags'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5296
Fixes: 00df97e1df57 ("drm/amd/display: Clean FPGA code in dc")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../amd/display/dc/dcn302/dcn302_resource.c   | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
index efd98d64588d..93f42132c900 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
@@ -98,24 +98,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 		.exit_idle_opt_for_cursor_updates = true
 };
 
-static const struct dc_debug_options debug_defaults_diags = {
-		.disable_dmcu = true,
-		.force_abm_enable = false,
-		.timing_trace = true,
-		.clock_trace = true,
-		.disable_dpp_power_gate = true,
-		.disable_hubp_power_gate = true,
-		.disable_clock_gate = true,
-		.disable_pplib_clock_request = true,
-		.disable_pplib_wm_range = true,
-		.disable_stutter = false,
-		.scl_reset_length10 = true,
-		.dwb_fi_phase = -1, // -1 = disable
-		.dmub_command_table = true,
-		.enable_tri_buf = true,
-		.use_max_lb = true
-};
-
 static const struct dc_panel_config panel_config_defaults = {
 		.psr = {
 			.disable_psr = false,
@@ -954,13 +936,6 @@ static const struct resource_create_funcs res_create_funcs = {
 		.create_hwseq = dcn302_hwseq_create,
 };
 
-static const struct resource_create_funcs res_create_maximus_funcs = {
-		.read_dce_straps = NULL,
-		.create_audio = NULL,
-		.create_stream_encoder = NULL,
-		.create_hwseq = dcn302_hwseq_create,
-};
-
 static bool is_soc_bounding_box_valid(struct dc *dc)
 {
 	uint32_t hw_internal_rev = dc->ctx->asic_id.hw_internal_rev;
-- 
2.20.1.7.g153144c

