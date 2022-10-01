Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E15F19D3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 06:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59E010EE30;
	Sat,  1 Oct 2022 04:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B001C10EE30;
 Sat,  1 Oct 2022 04:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=yzRhoSXitZkteWBbefnaFUu5z/aCl4xs+54yx9AB+xM=; b=k8Xff1HVD0rv8ur41fg0tb3gfc
 0j68WNXNxpDQBkeh6B8xJl+W04rbEwAV1/BlY2mAabVb04xDerD2Fzz8Seez2nn+IsHYfLQiH5RrI
 O9FpnBCAFSheFcMBbaHJPuXcUw40moMQ+B3MnhEhu0zzsNQ0C068s8DFv1qlWoDsbWZAQ7ziixKp/
 xvQphbJ2rT7CJLiVRmJKg9fCA0xdrijkQa5cU/PyqvZvGG2N6S6tZzFkFkF1CWVQA2AZALzRz0S5F
 AZ0fnCDXq1bgckjR+CLtC76Qk3vLoQms1nSYbQYgM1cE7ijEW1/k8RK5PqDbDeoR4YbBCgsfnpmIR
 PihMVxjA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oeUCW-00EpNJ-Lu; Sat, 01 Oct 2022 04:34:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: amd: clean up dcn32_fpu.c kernel-doc
Date: Fri, 30 Sep 2022 21:33:54 -0700
Message-Id: <20221001043354.22608-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel test robot <lkp@intel.com>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rectify multiple kernel-doc warnings in dcn32_fpu.c.
E.g.:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:247: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Finds dummy_latency_index when MCLK switching using firmware based
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:484: warning: Function parameter or member 'phantom_stream' not described in 'dcn32_set_phantom_stream_timing'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:601: warning: Function parameter or member 'dc' not described in 'dcn32_assign_subvp_pipe'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:601: warning: Function parameter or member 'context' not described in 'dcn32_assign_subvp_pipe'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:601: warning: Function parameter or member 'index' not described in 'dcn32_assign_subvp_pipe'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2140: warning: Function parameter or member 'dc' not described in 'dcn32_update_bw_bounding_box_fpu'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2140: warning: Function parameter or member 'bw_params' not described in 'dcn32_update_bw_bounding_box_fpu'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2140: warning: expecting prototype for dcn32_update_bw_bounding_box(). Prototype was for dcn32_update_bw_bounding_box_fpu() instead

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: George Shen <george.shen@amd.com>
Cc: Alvin Lee <alvin.lee2@amd.com>
Cc: Nevenko Stupar <Nevenko.Stupar@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c |  116 ++++------
 1 file changed, 49 insertions(+), 67 deletions(-)

--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -243,7 +243,7 @@ void dcn32_build_wm_range_table_fpu(stru
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_uclk = 0xFFFF;
 }
 
-/**
+/*
  * Finds dummy_latency_index when MCLK switching using firmware based
  * vblank stretch is enabled. This function will iterate through the
  * table of dummy pstate latencies until the lowest value that allows
@@ -290,15 +290,14 @@ int dcn32_find_dummy_latency_index_for_f
 /**
  * dcn32_helper_populate_phantom_dlg_params - Get DLG params for phantom pipes
  * and populate pipe_ctx with those params.
- *
- * This function must be called AFTER the phantom pipes are added to context
- * and run through DML (so that the DLG params for the phantom pipes can be
- * populated), and BEFORE we program the timing for the phantom pipes.
- *
  * @dc: [in] current dc state
  * @context: [in] new dc state
  * @pipes: [in] DML pipe params array
  * @pipe_cnt: [in] DML pipe count
+ *
+ * This function must be called AFTER the phantom pipes are added to context
+ * and run through DML (so that the DLG params for the phantom pipes can be
+ * populated), and BEFORE we program the timing for the phantom pipes.
  */
 void dcn32_helper_populate_phantom_dlg_params(struct dc *dc,
 					      struct dc_state *context,
@@ -331,8 +330,9 @@ void dcn32_helper_populate_phantom_dlg_p
 }
 
 /**
- * *******************************************************************************************
- * dcn32_predict_pipe_split: Predict if pipe split will occur for a given DML pipe
+ * dcn32_predict_pipe_split - Predict if pipe split will occur for a given DML pipe
+ * @context: [in] New DC state to be programmed
+ * @pipe_e2e: [in] DML pipe end to end context
  *
  * This function takes in a DML pipe (pipe_e2e) and predicts if pipe split is required (both
  * ODM and MPC). For pipe split, ODM combine is determined by the ODM mode, and MPC combine is
@@ -343,12 +343,7 @@ void dcn32_helper_populate_phantom_dlg_p
  * - MPC combine is only chosen if there is no ODM combine requirements / policy in place, and
  *   MPC is required
  *
- * @param [in]: context: New DC state to be programmed
- * @param [in]: pipe_e2e: DML pipe end to end context
- *
- * @return: Number of splits expected (1 for 2:1 split, 3 for 4:1 split, 0 for no splits).
- *
- * *******************************************************************************************
+ * Return: Number of splits expected (1 for 2:1 split, 3 for 4:1 split, 0 for no splits).
  */
 uint8_t dcn32_predict_pipe_split(struct dc_state *context,
 				  display_e2e_pipe_params_st *pipe_e2e)
@@ -504,7 +499,14 @@ void insert_entry_into_table_sorted(stru
 }
 
 /**
- * dcn32_set_phantom_stream_timing: Set timing params for the phantom stream
+ * dcn32_set_phantom_stream_timing - Set timing params for the phantom stream
+ * @dc: current dc state
+ * @context: new dc state
+ * @ref_pipe: Main pipe for the phantom stream
+ * @phantom_stream: target phantom stream state
+ * @pipes: DML pipe params
+ * @pipe_cnt: number of DML pipes
+ * @dc_pipe_idx: DC pipe index for the main pipe (i.e. ref_pipe)
  *
  * Set timing params of the phantom stream based on calculated output from DML.
  * This function first gets the DML pipe index using the DC pipe index, then
@@ -517,13 +519,6 @@ void insert_entry_into_table_sorted(stru
  * that separately.
  *
  * - Set phantom backporch = vstartup of main pipe
- *
- * @dc: current dc state
- * @context: new dc state
- * @ref_pipe: Main pipe for the phantom stream
- * @pipes: DML pipe params
- * @pipe_cnt: number of DML pipes
- * @dc_pipe_idx: DC pipe index for the main pipe (i.e. ref_pipe)
  */
 void dcn32_set_phantom_stream_timing(struct dc *dc,
 				     struct dc_state *context,
@@ -592,16 +587,14 @@ void dcn32_set_phantom_stream_timing(str
 }
 
 /**
- * dcn32_get_num_free_pipes: Calculate number of free pipes
+ * dcn32_get_num_free_pipes - Calculate number of free pipes
+ * @dc: current dc state
+ * @context: new dc state
  *
  * This function assumes that a "used" pipe is a pipe that has
  * both a stream and a plane assigned to it.
  *
- * @dc: current dc state
- * @context: new dc state
- *
- * Return:
- * Number of free pipes available in the context
+ * Return: Number of free pipes available in the context
  */
 static unsigned int dcn32_get_num_free_pipes(struct dc *dc, struct dc_state *context)
 {
@@ -625,7 +618,10 @@ static unsigned int dcn32_get_num_free_p
 }
 
 /**
- * dcn32_assign_subvp_pipe: Function to decide which pipe will use Sub-VP.
+ * dcn32_assign_subvp_pipe - Function to decide which pipe will use Sub-VP.
+ * @dc: current dc state
+ * @context: new dc state
+ * @index: [out] dc pipe index for the pipe chosen to have phantom pipes assigned
  *
  * We enter this function if we are Sub-VP capable (i.e. enough pipes available)
  * and regular P-State switching (i.e. VACTIVE/VBLANK) is not supported, or if
@@ -639,12 +635,7 @@ static unsigned int dcn32_get_num_free_p
  * for determining which should be the SubVP pipe (need a way to determine if a pipe / plane doesn't
  * support MCLK switching naturally [i.e. ACTIVE or VBLANK]).
  *
- * @param dc: current dc state
- * @param context: new dc state
- * @param index: [out] dc pipe index for the pipe chosen to have phantom pipes assigned
- *
- * Return:
- * True if a valid pipe assignment was found for Sub-VP. Otherwise false.
+ * Return: True if a valid pipe assignment was found for Sub-VP. Otherwise false.
  */
 static bool dcn32_assign_subvp_pipe(struct dc *dc,
 				    struct dc_state *context,
@@ -711,7 +702,9 @@ static bool dcn32_assign_subvp_pipe(stru
 }
 
 /**
- * dcn32_enough_pipes_for_subvp: Function to check if there are "enough" pipes for SubVP.
+ * dcn32_enough_pipes_for_subvp - Function to check if there are "enough" pipes for SubVP.
+ * @dc: current dc state
+ * @context: new dc state
  *
  * This function returns true if there are enough free pipes
  * to create the required phantom pipes for any given stream
@@ -723,9 +716,6 @@ static bool dcn32_assign_subvp_pipe(stru
  * pipe which can be used as the phantom pipe for the non pipe
  * split pipe.
  *
- * @dc: current dc state
- * @context: new dc state
- *
  * Return:
  * True if there are enough free pipes to assign phantom pipes to at least one
  * stream that does not already have phantom pipes assigned. Otherwise false.
@@ -764,7 +754,9 @@ static bool dcn32_enough_pipes_for_subvp
 }
 
 /**
- * subvp_subvp_schedulable: Determine if SubVP + SubVP config is schedulable
+ * subvp_subvp_schedulable - Determine if SubVP + SubVP config is schedulable
+ * @dc: current dc state
+ * @context: new dc state
  *
  * High level algorithm:
  * 1. Find longest microschedule length (in us) between the two SubVP pipes
@@ -772,11 +764,7 @@ static bool dcn32_enough_pipes_for_subvp
  * pipes still allows for the maximum microschedule to fit in the active
  * region for both pipes.
  *
- * @dc: current dc state
- * @context: new dc state
- *
- * Return:
- * bool - True if the SubVP + SubVP config is schedulable, false otherwise
+ * Return: True if the SubVP + SubVP config is schedulable, false otherwise
  */
 static bool subvp_subvp_schedulable(struct dc *dc, struct dc_state *context)
 {
@@ -836,7 +824,10 @@ static bool subvp_subvp_schedulable(stru
 }
 
 /**
- * subvp_drr_schedulable: Determine if SubVP + DRR config is schedulable
+ * subvp_drr_schedulable - Determine if SubVP + DRR config is schedulable
+ * @dc: current dc state
+ * @context: new dc state
+ * @drr_pipe: DRR pipe_ctx for the SubVP + DRR config
  *
  * High level algorithm:
  * 1. Get timing for SubVP pipe, phantom pipe, and DRR pipe
@@ -845,12 +836,7 @@ static bool subvp_subvp_schedulable(stru
  * 3.If (SubVP Active - Prefetch > Stretched DRR frame + max(MALL region, Stretched DRR frame))
  * then report the configuration as supported
  *
- * @dc: current dc state
- * @context: new dc state
- * @drr_pipe: DRR pipe_ctx for the SubVP + DRR config
- *
- * Return:
- * bool - True if the SubVP + DRR config is schedulable, false otherwise
+ * Return: True if the SubVP + DRR config is schedulable, false otherwise
  */
 static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struct pipe_ctx *drr_pipe)
 {
@@ -914,7 +900,9 @@ static bool subvp_drr_schedulable(struct
 
 
 /**
- * subvp_vblank_schedulable: Determine if SubVP + VBLANK config is schedulable
+ * subvp_vblank_schedulable - Determine if SubVP + VBLANK config is schedulable
+ * @dc: current dc state
+ * @context: new dc state
  *
  * High level algorithm:
  * 1. Get timing for SubVP pipe, phantom pipe, and VBLANK pipe
@@ -922,11 +910,7 @@ static bool subvp_drr_schedulable(struct
  * then report the configuration as supported
  * 3. If the VBLANK display is DRR, then take the DRR static schedulability path
  *
- * @dc: current dc state
- * @context: new dc state
- *
- * Return:
- * bool - True if the SubVP + VBLANK/DRR config is schedulable, false otherwise
+ * Return: True if the SubVP + VBLANK/DRR config is schedulable, false otherwise
  */
 static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
 {
@@ -1003,20 +987,18 @@ static bool subvp_vblank_schedulable(str
 }
 
 /**
- * subvp_validate_static_schedulability: Check which SubVP case is calculated and handle
- * static analysis based on the case.
+ * subvp_validate_static_schedulability - Check which SubVP case is calculated
+ * and handle static analysis based on the case.
+ * @dc: current dc state
+ * @context: new dc state
+ * @vlevel: Voltage level calculated by DML
  *
  * Three cases:
  * 1. SubVP + SubVP
  * 2. SubVP + VBLANK (DRR checked internally)
  * 3. SubVP + VACTIVE (currently unsupported)
  *
- * @dc: current dc state
- * @context: new dc state
- * @vlevel: Voltage level calculated by DML
- *
- * Return:
- * bool - True if statically schedulable, false otherwise
+ * Return: True if statically schedulable, false otherwise
  */
 static bool subvp_validate_static_schedulability(struct dc *dc,
 				struct dc_state *context,
@@ -2275,7 +2257,7 @@ static int build_synthetic_soc_states(st
 	return 0;
 }
 
-/**
+/*
  * dcn32_update_bw_bounding_box
  *
  * This would override some dcn3_2 ip_or_soc initial parameters hardcoded from
