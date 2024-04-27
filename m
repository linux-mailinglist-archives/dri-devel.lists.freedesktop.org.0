Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5B8B4714
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 18:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564410F663;
	Sat, 27 Apr 2024 16:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LpLlRHKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D584310F663;
 Sat, 27 Apr 2024 16:10:29 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1eb24e3a2d9so12385275ad.1; 
 Sat, 27 Apr 2024 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714234229; x=1714839029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YHybI1/oL7muM0NESEnEUQ4xaUnulN9DvoD5EfEUJ34=;
 b=LpLlRHKEZMUHpAl10j3dYI0oAyvn/b4Q0gH9OXi71wQsR1DWvSsteuRUCSF5eN5sbw
 bNUXrQSYoWcW78q570POpF34vM2qpmQWXAG55dcCyceEqA7foBBpWctgF0sATicCeTr5
 UQVSFSP7vvCcyXRvnAP2tRYnidKlgJNqsV1BH3xNswVH2rxY3npOH/hgvjGtMec3gjeT
 ju6WV/b5aI9gd3eNksMVOoS9cBtTPgF3UKxW1vwB40MOrO8vly2e+zOMJKDK09pip1ml
 p5eBkn7BDgKPje/Ssf4cXzFPr/dN8oj8KoTGD8XIVh98iXJufLZQN9ZwZB/UpKq6UVyn
 1K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714234229; x=1714839029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YHybI1/oL7muM0NESEnEUQ4xaUnulN9DvoD5EfEUJ34=;
 b=GwLEytd7uoPdYJgEnIo429qq1CVrGhFV1sKQtM60njsqLShvSl8Kio3sow0uUMwGvh
 JOpqJzLZPJYVpVYuDyfUNEfVqwrY+Ww3x8jyw67TbquRCLLQ0RLpRRXpMOc27HuCnP8/
 DJtqmItA/6uIeVRx6SSl0qeWT9CKlW5uTY4149bGCo5/FxL1Fh1GXas7v/b0+f0fuTiX
 0aOvWxFNP/49SZvZQhkIZU4+1qLyP0P2Wol91ccJzTlS87hazYbsR0ODMBqMJNg3LDil
 aB/pVuq95tYW84xPIerfX1U8U+LbdKjVCraQ0mrN8Uy7WTllJvteGqbMp8Q5UZY7mxSW
 Rvag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPtf7ftzu7F9kGHlUzF4/L8RYzxLuP/vPf17Dx5poTfzTiBrhx1qCmV38v56YLotu8PweZ249E3xBlXXgPm2f7EtrID+qYsBHxeXMcLwz2Bhcg23lXzZQBcGIgOC8EIJam6NgLh4qyvOnIGfgkxg==
X-Gm-Message-State: AOJu0YxvF0vf5GYyGd6HTnge6goZYVk1SxG+wmR+H4gVTn5kVHXwS/WM
 h4LXl/3gmvJIEkDhepCLi8GgOXR29PGpAanvAsL2A1+kK4FaYFD8x2LDIxVvu08=
X-Google-Smtp-Source: AGHT+IHQBsr3ozO7sip3FANjQ4XUW8L/MATiyfI6VrWKzJYJnpYP72r0alsyGSU0vBacFm7rBtDjYQ==
X-Received: by 2002:a17:902:db09:b0:1dc:7bc:d025 with SMTP id
 m9-20020a170902db0900b001dc07bcd025mr8902468plx.4.1714234229020; 
 Sat, 27 Apr 2024 09:10:29 -0700 (PDT)
Received: from marceloX.. ([177.144.142.185]) by smtp.gmail.com with ESMTPSA id
 a8-20020a170902ecc800b001e944fc9248sm13069479plh.194.2024.04.27.09.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 09:10:28 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: fix documentation warnings for mpc.h
Date: Sat, 27 Apr 2024 13:05:07 -0300
Message-ID: <20240427160509.15736-1-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.42.0
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

Fix most of the display documentation compile warnings by
documenting struct mpc_funcs functions in dc/inc/hw/mpc.h file.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 372 +++++++++++++++++++-
 1 file changed, 369 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 34a398f23..388b96c32 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -1,4 +1,5 @@
-/* Copyright 2012-15 Advanced Micro Devices, Inc.
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -282,6 +283,21 @@ struct mpcc_state {
  * struct mpc_funcs - funcs
  */
 struct mpc_funcs {
+  /**
+   * @read_mpcc_state:
+   *
+   * Read register content from given MPCC physical instance. 
+   *
+   * Parameters:
+   *
+   * - [in/out] mpc - MPC context
+   * - [in] mpcc_instance - MPC context instance
+   * - [in] mpcc_state - MPC context state
+   *
+   * Return:
+   *
+   * void
+   */
 	void (*read_mpcc_state)(
 			struct mpc *mpc,
 			int mpcc_inst,
@@ -346,12 +362,22 @@ struct mpc_funcs {
 	 * Parameters:
 	 *
 	 * - [in/out] mpc - MPC context.
-	 *
+	 * 
 	 * Return:
 	 *
 	 * void
 	 */
 	void (*mpc_init)(struct mpc *mpc);
+
+  /**
+   * @mpc_init_single_inst:
+   *
+   * Initialize given MPCC physical instance.
+   *
+   * Parameters:
+   * - [in/out] mpc - MPC context.
+   * - [in] mpcc_id - The MPCC physical instance to be initialized. 
+   */
 	void (*mpc_init_single_inst)(
 			struct mpc *mpc,
 			unsigned int mpcc_id);
@@ -449,62 +475,282 @@ struct mpc_funcs {
 			struct mpc_tree *tree,
 			struct mpcc *mpcc);
 
+  /**
+   * @get_mpcc_for_dpp_from_secondary:
+   *
+   * Find, if it exists, a MPCC from a given 'secondary' MPC tree that 
+   * is associated with specified plane.
+   *
+   * Parameters:
+   * - [in/out] tree - MPC tree structure to search for plane.
+   * - [in] dpp_id - DPP to be searched.
+   *
+   * Return:
+   *
+   * struct mpcc* - pointer to plane or NULL if no plane found.
+  */
 	struct mpcc* (*get_mpcc_for_dpp_from_secondary)(
 			struct mpc_tree *tree,
 			int dpp_id);
 
+  /**
+   * @get_mpcc_for_dpp:
+   *
+   * Find, if it exists, a MPCC from a given MPC tree that 
+   * is associated with specified plane.
+   *
+   * Parameters:
+   * - [in/out] tree - MPC tree structure to search for plane.
+   * - [in] dpp_id - DPP to be searched.
+   *
+   * Return:
+   * 
+   * struct mpcc* - pointer to plane or NULL if no plane found.
+  */
 	struct mpcc* (*get_mpcc_for_dpp)(
 			struct mpc_tree *tree,
 			int dpp_id);
 
+  /**
+   * @wait_for_idle:
+   *
+   * Wait for a MPCC in MPC context to enter idle state.
+   *
+   * Parameters:
+   * - [in/out] mpc - MPC Context.
+   * - [in] id - MPCC to wait for idle state.
+   *
+   * Return:
+   *
+   * void
+  */
 	void (*wait_for_idle)(struct mpc *mpc, int id);
 
+  /**
+   * @assert_mpcc_idle_before_connect:
+   *
+   * Assert if MPCC in MPC context is in idle state.
+   *
+   * Parameters:
+   * - [in/out] mpc - MPC context.
+   * - [in] id - MPCC to assert idle state.
+   *
+   * Return:
+   *
+   * void
+  */
 	void (*assert_mpcc_idle_before_connect)(struct mpc *mpc, int mpcc_id);
 
+  /**
+   * @init_mpcc_list_from_hw:
+   *
+   * Iterate through the MPCC array from a given MPC context struct 
+   * and configure each MPCC according to its registers' values.
+   *
+   * Parameters:
+   * - [in/out] mpc - MPC context to initialize MPCC array.
+   * - [in/out] tree - MPC tree structure containing MPCC contexts to initialize. 
+   *
+   * Return:
+   *
+   * void
+  */
 	void (*init_mpcc_list_from_hw)(
 		struct mpc *mpc,
 		struct mpc_tree *tree);
 
+  /**
+  * @set_denorm:
+  *
+  * Set corresponding OPP DENORM_CONTROL register value to specific denorm_mode
+  * based on given color depth.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] opp_id - Corresponding OPP to update register.
+  * - [in] output_depth - Arbitrary color depth to set denorm_mode.
+  *
+  * Return:
+  *
+  * void
+  */
 	void (*set_denorm)(struct mpc *mpc,
 			int opp_id,
 			enum dc_color_depth output_depth);
 
+  /**
+  * @set_denorm_clamp:
+  *
+  * Set denorm clamp values on corresponding OPP DENORM CONTROL register.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] opp_id - Corresponding OPP to update register.
+  * - [in] denorm_clamp - Arbitrary denorm clamp to be set.
+  *
+  * Return:
+  * 
+  * void
+  */
 	void (*set_denorm_clamp)(
 			struct mpc *mpc,
 			int opp_id,
 			struct mpc_denorm_clamp denorm_clamp);
 
+  /**
+  * @set_output_csc:
+  *
+  * Set the Output Color Space Conversion matrix
+  * with given values and mode.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] opp_id - Corresponding OPP to update register.
+  * - [in] regval - Values to set in CSC matrix.
+  * - [in] ocsc_mode - Mode to set CSC.
+  *
+  * Return:
+  * 
+  * void
+  */
 	void (*set_output_csc)(struct mpc *mpc,
 			int opp_id,
 			const uint16_t *regval,
 			enum mpc_output_csc_mode ocsc_mode);
 
+  /**
+  * @set_ocsc_default:
+  *
+  * Set the Output Color Space Conversion matrix
+  * to default values according to color space.
+  * 
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] opp_id - Corresponding OPP to update register.
+  * - [in] color_space - OCSC color space.
+  * - [in] ocsc_mode - Mode to set CSC.
+  *
+  * Return: 
+  * 
+  * void
+  *
+  */
 	void (*set_ocsc_default)(struct mpc *mpc,
 			int opp_id,
 			enum dc_color_space color_space,
 			enum mpc_output_csc_mode ocsc_mode);
 
+  /**
+  * @set_output_gamma:
+  *
+  * Set Output Gamma with given curve parameters.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] mpcc_id - Corresponding MPC to update registers.
+  * - [in] params - Parameters.
+  *
+  * Return:
+  *
+  * void
+  *
+  */
 	void (*set_output_gamma)(
 			struct mpc *mpc,
 			int mpcc_id,
 			const struct pwl_params *params);
+  /**
+  * @power_on_mpc_mem_pwr:
+  *
+  * Power on/off memory LUT for given MPCC.
+  * Powering on enables LUT to be updated.
+  * Powering off allows entering low power mode.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] mpcc_id - MPCC to power on.
+  * - [in] power_on 
+  *
+  * Return:
+  *
+  * void
+  */
 	void (*power_on_mpc_mem_pwr)(
 			struct mpc *mpc,
 			int mpcc_id,
 			bool power_on);
+  /**
+  * @set_dwb_mux:
+  *
+  * Set corresponding Display Writeback mux
+  * MPC register field to given MPCC id.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] dwb_id - DWB to be set.
+  * - [in] mpcc_id - MPCC id to be stored in DWB mux register.
+  *
+  * Return:
+  *
+  * void
+  */
 	void (*set_dwb_mux)(
 			struct mpc *mpc,
 			int dwb_id,
 			int mpcc_id);
 
+  /**
+  * @disable_dwb_mux:
+  *
+  * Reset corresponding Display Writeback mux
+  * MPC register field.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] dwb_id - DWB to be set.
+  *
+  * Return:
+  *
+  * void
+  */
 	void (*disable_dwb_mux)(
 		struct mpc *mpc,
 		int dwb_id);
-
+  
+  /**
+  * @is_dwb_idle:
+  *
+  * Check DWB status on MPC_DWB0_MUX_STATUS register field.
+  * Return if it is null.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] dwb_id - DWB to be checked.
+  *
+  * Return:
+  *
+  * bool - wheter DWB is idle or not
+  */
 	bool (*is_dwb_idle)(
 		struct mpc *mpc,
 		int dwb_id);
 
+  /**
+  * @set_out_rate_control:
+  *
+  * Set display output rate control.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context.
+  * - [in] opp_id - OPP to be set.
+  * - [in] enable
+  * - [in] rate_2x_mode
+  * - [in] flow_control
+  *
+  * Return:
+  *
+  * void
+  */
 	void (*set_out_rate_control)(
 		struct mpc *mpc,
 		int opp_id,
@@ -512,37 +758,157 @@ struct mpc_funcs {
 		bool rate_2x_mode,
 		struct mpc_dwb_flow_control *flow_control);
 
+  /**
+  * @set_gamut_remap:
+  *
+  * Set post-blending CTM for given MPCC.
+  *
+  * Parameters:
+  * - [in] mpc - MPC context.
+  * - [in] mpcc_id - MPCC to set gamut map.
+  * - [in] adjust
+  *
+  * Return:
+  * 
+  * void
+  */
 	void (*set_gamut_remap)(
 			struct mpc *mpc,
 			int mpcc_id,
 			const struct mpc_grph_gamut_adjustment *adjust);
 
+  /**
+  * @program_1dlut:
+  *
+  * Set 1 dimensional Lookup Table.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context
+  * - [in] params - curve parameters for the LUT configuration
+  * - [in] rmu_idx
+  *
+  * bool - wheter LUT was set (set with given parameters) or not (params is NULL and LUT is disabled).
+  */
 	bool (*program_1dlut)(
 			struct mpc *mpc,
 			const struct pwl_params *params,
 			uint32_t rmu_idx);
 
+  /**
+  * @program_shaper:
+  *
+  * Set shaper.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context
+  * - [in] params - curve parameters to be set
+  * - [in] rmu_idx
+  *
+  * Return:
+  *
+  * bool - wheter shaper was set (set with given parameters) or not (params is NULL and LUT is disabled).
+  */
 	bool (*program_shaper)(
 			struct mpc *mpc,
 			const struct pwl_params *params,
 			uint32_t rmu_idx);
 
+  /**
+  * @acquire_rmu:
+  *
+  * Set given MPCC to be multiplexed to given RMU unit.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context
+  * - [in] mpcc_id - MPCC
+  * - [in] rmu_idx - Given RMU unit to set MPCC to be multiplexed to.
+  *
+  * Return:
+  *
+  * unit32_t - rmu_idx if operation was successful, -1 else.
+  */
 	uint32_t (*acquire_rmu)(struct mpc *mpc, int mpcc_id, int rmu_idx);
 
+  /**
+  * @program_3dlut:
+  *
+  * Set 3 dimensional Lookup Table.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context
+  * - [in] params - tetrahedral parameters for the LUT configuration
+  * - [in] rmu_idx
+  *
+  * bool - wheter LUT was set (set with given parameters) or not (params is NULL and LUT is disabled).
+  */
 	bool (*program_3dlut)(
 			struct mpc *mpc,
 			const struct tetrahedral_params *params,
 			int rmu_idx);
 
+  /**
+  * @release_rmu:
+  *
+  * For a given MPCC, release the RMU unit it muliplexes to.
+  *
+  * Parameters:
+  * - [in/out] mpc - MPC context
+  * - [in] mpcc_id - MPCC
+  *
+  * Return:
+  *
+  * int - a valid rmu_idx representing released RMU unit or -1 if there was no RMU unit to release.
+  */
 	int (*release_rmu)(struct mpc *mpc, int mpcc_id);
 
+  /**
+  * @get_mpc_out_mux:
+  *
+  * Return MPC out mux.
+  *
+  * Parameters:
+  * - [in] mpc - MPC context.
+  * - [in] opp_id - OPP
+  *
+  * Return:
+  *
+  * unsigned int - Out Mux
+  */
 	unsigned int (*get_mpc_out_mux)(
 			struct mpc *mpc,
 			int opp_id);
 
+  /**
+   * @set_bg_color:
+   *
+   * Find corresponding bottommost MPCC and
+   * set its bg color.
+   *
+   * Parameters:
+   * - [in/out] mpc - MPC context.
+   * - [in] bg_color - background color to be set.
+   * - [in] mpcc_id
+   *
+   * Return:
+   *
+   * void
+  */
 	void (*set_bg_color)(struct mpc *mpc,
 			struct tg_color *bg_color,
 			int mpcc_id);
+
+  /**
+  * @set_mpc_mem_lp_mode:
+  *
+  * Set mpc_mem_lp_mode
+  *
+  * Parameters:
+  * - [in/out] mpc
+  *
+  * Return:
+  *
+  * void
+  */
 	void (*set_mpc_mem_lp_mode)(struct mpc *mpc);
 };
 
-- 
2.42.0

