Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F7174FBB7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A4E10E45B;
	Tue, 11 Jul 2023 23:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 78707 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jul 2023 23:09:02 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9332B10E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1689116938;
 bh=QF3UE42JL66pnZ2EnmCWXb2r2JIlvaXs+AQW+Z9Oaac=;
 h=Date:From:To:Cc:Subject:From;
 b=s//BeEFjDIkAsnFPJqg38YbNjzaesCIWdaPYn3VbI2qjwh5qiinz6iAFYgLBp1O/a
 QhymqIfzbcQqpWSklobbGG8kxJABhwlX9Lj4qA/gbpSrzb15EVhI2KuJQabH+MJcF1
 cSqASrhTw89E36cZzBqh2xgRBLybrlumHtkoLBBughy1hk8EKAbIxbWKvRx+NAi4Cz
 XKWd1CfVggI4y0Ev85Isx5Iq23SR4iSIZoUXYuwjCxuF1tQjBfxqnp2hXfgaBs7j5B
 WUgXWg1VAWfE7qf7cR7gY7aTfRqw2XG0acuOpKrM0fYYWeL1Uw9KOn+Urm7ucMA1rJ
 qGbioWgSRoorA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R0xQ13NQBz4wxx;
 Wed, 12 Jul 2023 09:08:57 +1000 (AEST)
Date: Wed, 12 Jul 2023 09:08:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20230712090856.776a48c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//x5NSV8mfo_RyzIL8=dMAvR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Dave Airlie <airlied@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_//x5NSV8mfo_RyzIL8=dMAvR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[This consolidates a while lot of warnings I have reported over the past
year ... these are now produced whe building Linus' tree]

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'native422_support' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dsc' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'visual_confirm' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'visual_confirm_rect_height' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'sanity_checks' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'max_disp_clk' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'surface_trace' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'timing_trace' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'clock_trace' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'validation_trace' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'bandwidth_calcs_trace' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'max_downscale_src_width' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_stutter' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'use_max_lb' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dcc' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_single_disp_pipe_split' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'voltage_align_fclk' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_min_fclk' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dfs_bypass' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dpp_power_gate' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_hubp_power_gate' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dsc_power_gate' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dsc_min_slice_height_override' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dsc_bpp_increment_div' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_pplib_wm_range' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'pplib_wm_report_mode' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'min_disp_clk_khz' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'min_dpp_clk_khz' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'min_dram_clk_khz' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'sr_exit_time_dpm0_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'sr_enter_plus_exit_time_dpm0_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'sr_exit_time_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'sr_enter_plus_exit_time_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'sr_exit_z8_time_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'sr_enter_plus_exit_z8_time_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'urgent_latency_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'underflow_assert_delay_us' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'percent_of_ideal_drambw' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dram_clock_change_latency_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'optimized_watermark' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'always_scale' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_pplib_clock_request' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_clock_gate' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_mem_low_power' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'pstate_enabled' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dmcu' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_abm_enable' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_stereo_support' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'vsr_support' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'performance_trace' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'az_endpoint_mute_only' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'always_use_regamma' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'recovery_enabled' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'avoid_vbios_exec_table' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'scl_reset_length10' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'hdmi20_disable' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'skip_detection_link_training' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'edid_read_retry_times' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_odm_combine' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'seamless_boot_odm_combine' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_odm_combine_4to1' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'minimum_z8_residency_time' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_z9_mpc' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_fclk_khz' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_tri_buf' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dmub_offload_enabled' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dmcub_emulation' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_idle_power_optimizations' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'mall_size_override' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'mall_additional_timer_percent' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'mall_error_as_fatal' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dmub_command_table' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'bw_val_profile' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_fec' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_48mhz_pwrdwn' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_min_dcfclk_mhz' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dwb_fi_phase' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_timing_sync' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'cm_in_bypass' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_clock_mode' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dram_clock_change_vactive_support' not described in 'dc_debug_=
options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'validate_dml_output' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_dmcub_surface_flip' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'usbc_combo_phy_reset_wa' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_dram_clock_change_one_display_vactive' not described in 'dc_deb=
ug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'legacy_dp2_lt' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'set_mst_en_for_sst' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_uhbr' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_dp2_lt_fallback_method' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'ignore_cable_id' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_mem_low_power' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'root_clock_optimization' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'hpo_optimization' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_vblank_alignment' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_dmub_aux_for_legacy_ddc' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_fams' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_fams_gaming' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'fec_enable_delay_in100us' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_driver_sequence_debug' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'crb_alloc_policy' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'crb_alloc_policy_min_disp_count' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_z10' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_z9_disable_interface' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'psr_skip_crtc_disable' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dpia_debug' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_fixed_vs_aux_timeout_wa' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_disable_subvp' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_subvp_mclk_switch' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'allow_sw_cursor_fallback' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_subvp_num_ways' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_mall_ss_num_ways' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'alloc_extra_way_for_cursor' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'subvp_extra_lines' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'force_usr_allow' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dtb_ref_clk_switch' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'extended_blank_optimization' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'aux_wake_wa' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'mst_start_top_delay' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'psr_power_use_phy_fsm' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dml_hostvm_override' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dml_disallow_alternate_prefetch_modes' not described in 'dc_debug_opti=
ons'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'use_legacy_soc_bb_mechanism' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'exit_idle_opt_for_cursor_updates' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_single_display_2to1_odm_policy' not described in 'dc_debug_opti=
ons'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_double_buffered_dsc_pg_support' not described in 'dc_debug_opti=
ons'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_dp_dig_pixel_rate_div_policy' not described in 'dc_debug_option=
s'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'lttpr_mode_override' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dsc_delay_factor_wa_x1000' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'min_prefetch_in_strobe_ns' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_unbounded_requesting' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'dig_fifo_off_in_blank' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'temp_mst_deallocation_sequence' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'override_dispclk_programming' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_fpo_optimizations' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'support_eDP1_5' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'fpo_vactive_margin_us' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_fpo_vactive' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_boot_optimizations' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'override_odm_optimization' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'minimize_dispclk_using_odm' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_subvp_high_refresh' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dp_plus_plus_wa' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'fpo_vactive_min_active_margin_us' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'fpo_vactive_max_blank_us' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'enable_legacy_fast_update' not described in 'dc_debug_options'
drivers/gpu/drm/amd/display/dc/dc.h:905: warning: Function parameter or mem=
ber 'disable_dc_mode_overwrite' not described in 'dc_debug_options'

--=20
Cheers,
Stephen Rothwell

--Sig_//x5NSV8mfo_RyzIL8=dMAvR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSt4QgACgkQAVBC80lX
0Gzvrgf/aaxDmuLJy+eYUr9Zgq4bd227xQ95LKC0UTRiX8JFpCejyRVJbw/MgMxX
k9SIX7PeOydWfuMCBxSo2ZwjnE2719x+lNtzNBxXcLvFDBV/T3zubDABAReVVvNB
wshS51Fs+woIxmqPFijNZ2heCDIfygR5XPlXfDOmkhhjuYKshptW2P/jyXPV9wZJ
iNIBOuOFzp8JhhBBXYh2BoPiVrgxBfy2lnrd0GbwJW2GLBkYv8sst0W4xZxMJU3c
R5Y9wQ7iW87qe2QVgDQ4mapzffoMS2DRxlqS8sBg96lkRyXrn6Lk6syJJq+HwbSb
1wht6cMkovG2CqV7wMEWLGNTSgc9eA==
=TiCV
-----END PGP SIGNATURE-----

--Sig_//x5NSV8mfo_RyzIL8=dMAvR--
