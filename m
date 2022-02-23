Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BB84C1D3A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 21:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5220410EE52;
	Wed, 23 Feb 2022 20:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E27510EE47;
 Wed, 23 Feb 2022 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gK8V320lanSSuBm3UZhK1BCHebDlk+zQ750RjHs3rU=; b=c4YqH86e5uUrW4AR7xSfDL2DYp
 ACQywurZHzkn/wgvSt2wN0MB3glA/DHCANkQqmSF/wg6EySLH8Czgl9sK5BCqxVgwBDK5ZRRDiEdn
 QEmu0JC7He1D9lx5X/tfvQWdhUX+MHd/xGA+K4J6JvqZJYxr2yp63pmrSAlrjacwC+9L51by7gHUa
 8f0GSIMPD6GCDDo086FIxYIwxCVDOskXU9eZoViXufP2hRy3563RymXu83gWOwo1t/5kGHtMIh351
 c/HXF2fK9QzetzziaZui77i5U34AhtkbjfsvgUbBKs2t6TldO6VPsKnnXhmp/N9oARJYVRYUvYCHo
 CnMbG/QQ==;
Received: from [102.222.140.247] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nMyMy-0007qo-Dw; Wed, 23 Feb 2022 21:36:16 +0100
Date: Wed, 23 Feb 2022 19:35:52 -0100
From: Melissa Wen <mwen@igalia.com>
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Subject: Re: [PATCH] drm/amd/display: move FPU-related code from dcn20 to dml
 folder
Message-ID: <20220223203552.e44elur7xnt5xxxt@mail.igalia.com>
References: <20220221113137.2471768-1-mwen@igalia.com>
 <36a7257f-7419-6121-8ab8-6f4eba3b1a58@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cwwzzjaipkcuaexy"
Content-Disposition: inline
In-Reply-To: <36a7257f-7419-6121-8ab8-6f4eba3b1a58@amd.com>
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
Cc: sunpeng.li@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, amd-gfx@lists.freedesktop.org,
 Jasdeep Dhillon <jdhillon@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cwwzzjaipkcuaexy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/23, Rodrigo Siqueira Jordao wrote:
>=20
>=20
> On 2022-02-21 06:31, Melissa Wen wrote:
> > Move parts of dcn20 code that uses FPU to dml folder. It aims to isolate
> > FPU operations as described by series:
> >=20
> > drm/amd/display: Introduce FPU directory inside DC
> > https://patchwork.freedesktop.org/series/93042/
> >=20
> > This patch moves the following functions from dcn20_resource to
> > dml/dcn20_fpu and calls of public functions in dcn20_resource are
> > wrapped by DC_FP_START/END():
> >=20
> > - void dcn20_populate_dml_writeback_from_context
> > - static bool is_dtbclk_required()
> > - static enum dcn_zstate_support_state()
> > - void dcn20_calculate_dlg_params()
> > - static void swizzle_to_dml_params()
> > - int dcn20_populate_dml_pipes_from_context()
> > - void dcn20_calculate_wm()
> > - void dcn20_cap_soc_clocks()
> > - void dcn20_update_bounding_box()
> > - void dcn20_patch_bounding_box()
> > - bool dcn20_validate_bandwidth_fp()
> >=20
> > This movement also affects dcn30/31, as dcn20_calculate_dlg_params() is
> > used by dcn30 and dcn31. For this reason, I included dcn20_fpu headers
> > in dcn20_resource headers to make dcn20_calculate_dlg_params() visible
> > to dcn30/31.
> >=20
> > Three new functions are created to isolate well-delimited FPU
> > operations:
> >=20
> > - void dcn20_fpu_set_wb_arb_params(): set cli_watermark,
> >    pstate_watermark and time_per_pixel from wb_arb_params (struct
> > mcif_arb_params), since those uses FPU operations on double types:
> > WritebackUrgentWatermark, WritebackDRAMClockChangeWatermark, '16.0'.
> > - void dcn20_fpu_set_wm_ranges(): set min_fill_clk_mhz and
> >    max_fill_clk_mhz involves FPU calcs on dram_speed_mts (double type);
> > - void dcn20_fpu_adjust_dppclk(): adjust operation on RequiredDPPCLK
> >    that is a double.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dcn20/Makefile |   25 -
> >   .../drm/amd/display/dc/dcn20/dcn20_resource.c | 1370 +---------------
> >   .../drm/amd/display/dc/dcn20/dcn20_resource.h |   30 +-
> >   .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 1385 +++++++++++++++++
> >   .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |   42 +-
> >   5 files changed, 1451 insertions(+), 1401 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile b/drivers/gp=
u/drm/amd/display/dc/dcn20/Makefile
> > index 5fcaf78334ff..abaed2121feb 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> > @@ -9,31 +9,6 @@ DCN20 =3D dcn20_resource.o dcn20_init.o dcn20_hwseq.o =
dcn20_dpp.o dcn20_dpp_cm.o d
> >   DCN20 +=3D dcn20_dsc.o
> > -ifdef CONFIG_X86
> > -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse
> > -endif
> > -
> > -ifdef CONFIG_PPC64
> > -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -malt=
ivec
> > -endif
> > -
> > -ifdef CONFIG_CC_IS_GCC
> > -ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> > -IS_OLD_GCC =3D 1
> > -endif
> > -endif
> > -
> > -ifdef CONFIG_X86
> > -ifdef IS_OLD_GCC
> > -# Stack alignment mismatch, proceed with caution.
> > -# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-b=
oundary=3D3
> > -# (8B stack alignment).
> > -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -mpreferred-stack-=
boundary=3D4
> > -else
> > -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -msse2
> > -endif
> > -endif
> > -
> >   AMD_DAL_DCN20 =3D $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))
> >   AMD_DISPLAY_FILES +=3D $(AMD_DAL_DCN20)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/dr=
ivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > index dfe2e1c25a26..63c50bee0144 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > @@ -63,7 +63,6 @@
> >   #include "dcn20_dccg.h"
> >   #include "dcn20_vmid.h"
> >   #include "dc_link_ddc.h"
> > -#include "dc_link_dp.h"
> >   #include "dce/dce_panel_cntl.h"
> >   #include "navi10_ip_offset.h"
> > @@ -93,367 +92,6 @@
> >   #define DC_LOGGER_INIT(logger)
> > -struct _vcs_dpi_ip_params_st dcn2_0_ip =3D {
> > -	.odm_capable =3D 1,
> > -	.gpuvm_enable =3D 0,
> > -	.hostvm_enable =3D 0,
> > -	.gpuvm_max_page_table_levels =3D 4,
> > -	.hostvm_max_page_table_levels =3D 4,
> > -	.hostvm_cached_page_table_levels =3D 0,
> > -	.pte_group_size_bytes =3D 2048,
> > -	.num_dsc =3D 6,
> > -	.rob_buffer_size_kbytes =3D 168,
> > -	.det_buffer_size_kbytes =3D 164,
> > -	.dpte_buffer_size_in_pte_reqs_luma =3D 84,
> > -	.pde_proc_buffer_size_64k_reqs =3D 48,
> > -	.dpp_output_buffer_pixels =3D 2560,
> > -	.opp_output_buffer_lines =3D 1,
> > -	.pixel_chunk_size_kbytes =3D 8,
> > -	.pte_chunk_size_kbytes =3D 2,
> > -	.meta_chunk_size_kbytes =3D 2,
> > -	.writeback_chunk_size_kbytes =3D 2,
> > -	.line_buffer_size_bits =3D 789504,
> > -	.is_line_buffer_bpp_fixed =3D 0,
> > -	.line_buffer_fixed_bpp =3D 0,
> > -	.dcc_supported =3D true,
> > -	.max_line_buffer_lines =3D 12,
> > -	.writeback_luma_buffer_size_kbytes =3D 12,
> > -	.writeback_chroma_buffer_size_kbytes =3D 8,
> > -	.writeback_chroma_line_buffer_width_pixels =3D 4,
> > -	.writeback_max_hscl_ratio =3D 1,
> > -	.writeback_max_vscl_ratio =3D 1,
> > -	.writeback_min_hscl_ratio =3D 1,
> > -	.writeback_min_vscl_ratio =3D 1,
> > -	.writeback_max_hscl_taps =3D 12,
> > -	.writeback_max_vscl_taps =3D 12,
> > -	.writeback_line_buffer_luma_buffer_size =3D 0,
> > -	.writeback_line_buffer_chroma_buffer_size =3D 14643,
> > -	.cursor_buffer_size =3D 8,
> > -	.cursor_chunk_size =3D 2,
> > -	.max_num_otg =3D 6,
> > -	.max_num_dpp =3D 6,
> > -	.max_num_wb =3D 1,
> > -	.max_dchub_pscl_bw_pix_per_clk =3D 4,
> > -	.max_pscl_lb_bw_pix_per_clk =3D 2,
> > -	.max_lb_vscl_bw_pix_per_clk =3D 4,
> > -	.max_vscl_hscl_bw_pix_per_clk =3D 4,
> > -	.max_hscl_ratio =3D 8,
> > -	.max_vscl_ratio =3D 8,
> > -	.hscl_mults =3D 4,
> > -	.vscl_mults =3D 4,
> > -	.max_hscl_taps =3D 8,
> > -	.max_vscl_taps =3D 8,
> > -	.dispclk_ramp_margin_percent =3D 1,
> > -	.underscan_factor =3D 1.10,
> > -	.min_vblank_lines =3D 32, //
> > -	.dppclk_delay_subtotal =3D 77, //
> > -	.dppclk_delay_scl_lb_only =3D 16,
> > -	.dppclk_delay_scl =3D 50,
> > -	.dppclk_delay_cnvc_formatter =3D 8,
> > -	.dppclk_delay_cnvc_cursor =3D 6,
> > -	.dispclk_delay_subtotal =3D 87, //
> > -	.dcfclk_cstate_latency =3D 10, // SRExitTime
> > -	.max_inter_dcn_tile_repeaters =3D 8,
> > -	.xfc_supported =3D true,
> > -	.xfc_fill_bw_overhead_percent =3D 10.0,
> > -	.xfc_fill_constant_bytes =3D 0,
> > -	.number_of_cursors =3D 1,
> > -};
> > -
> > -static struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip =3D {
> > -	.odm_capable =3D 1,
> > -	.gpuvm_enable =3D 0,
> > -	.hostvm_enable =3D 0,
> > -	.gpuvm_max_page_table_levels =3D 4,
> > -	.hostvm_max_page_table_levels =3D 4,
> > -	.hostvm_cached_page_table_levels =3D 0,
> > -	.num_dsc =3D 5,
> > -	.rob_buffer_size_kbytes =3D 168,
> > -	.det_buffer_size_kbytes =3D 164,
> > -	.dpte_buffer_size_in_pte_reqs_luma =3D 84,
> > -	.dpte_buffer_size_in_pte_reqs_chroma =3D 42,//todo
> > -	.dpp_output_buffer_pixels =3D 2560,
> > -	.opp_output_buffer_lines =3D 1,
> > -	.pixel_chunk_size_kbytes =3D 8,
> > -	.pte_enable =3D 1,
> > -	.max_page_table_levels =3D 4,
> > -	.pte_chunk_size_kbytes =3D 2,
> > -	.meta_chunk_size_kbytes =3D 2,
> > -	.writeback_chunk_size_kbytes =3D 2,
> > -	.line_buffer_size_bits =3D 789504,
> > -	.is_line_buffer_bpp_fixed =3D 0,
> > -	.line_buffer_fixed_bpp =3D 0,
> > -	.dcc_supported =3D true,
> > -	.max_line_buffer_lines =3D 12,
> > -	.writeback_luma_buffer_size_kbytes =3D 12,
> > -	.writeback_chroma_buffer_size_kbytes =3D 8,
> > -	.writeback_chroma_line_buffer_width_pixels =3D 4,
> > -	.writeback_max_hscl_ratio =3D 1,
> > -	.writeback_max_vscl_ratio =3D 1,
> > -	.writeback_min_hscl_ratio =3D 1,
> > -	.writeback_min_vscl_ratio =3D 1,
> > -	.writeback_max_hscl_taps =3D 12,
> > -	.writeback_max_vscl_taps =3D 12,
> > -	.writeback_line_buffer_luma_buffer_size =3D 0,
> > -	.writeback_line_buffer_chroma_buffer_size =3D 14643,
> > -	.cursor_buffer_size =3D 8,
> > -	.cursor_chunk_size =3D 2,
> > -	.max_num_otg =3D 5,
> > -	.max_num_dpp =3D 5,
> > -	.max_num_wb =3D 1,
> > -	.max_dchub_pscl_bw_pix_per_clk =3D 4,
> > -	.max_pscl_lb_bw_pix_per_clk =3D 2,
> > -	.max_lb_vscl_bw_pix_per_clk =3D 4,
> > -	.max_vscl_hscl_bw_pix_per_clk =3D 4,
> > -	.max_hscl_ratio =3D 8,
> > -	.max_vscl_ratio =3D 8,
> > -	.hscl_mults =3D 4,
> > -	.vscl_mults =3D 4,
> > -	.max_hscl_taps =3D 8,
> > -	.max_vscl_taps =3D 8,
> > -	.dispclk_ramp_margin_percent =3D 1,
> > -	.underscan_factor =3D 1.10,
> > -	.min_vblank_lines =3D 32, //
> > -	.dppclk_delay_subtotal =3D 77, //
> > -	.dppclk_delay_scl_lb_only =3D 16,
> > -	.dppclk_delay_scl =3D 50,
> > -	.dppclk_delay_cnvc_formatter =3D 8,
> > -	.dppclk_delay_cnvc_cursor =3D 6,
> > -	.dispclk_delay_subtotal =3D 87, //
> > -	.dcfclk_cstate_latency =3D 10, // SRExitTime
> > -	.max_inter_dcn_tile_repeaters =3D 8,
> > -	.xfc_supported =3D true,
> > -	.xfc_fill_bw_overhead_percent =3D 10.0,
> > -	.xfc_fill_constant_bytes =3D 0,
> > -	.ptoi_supported =3D 0,
> > -	.number_of_cursors =3D 1,
> > -};
> > -
> > -static struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc =3D {
> > -	/* Defaults that get patched on driver load from firmware. */
> > -	.clock_limits =3D {
> > -			{
> > -				.state =3D 0,
> > -				.dcfclk_mhz =3D 560.0,
> > -				.fabricclk_mhz =3D 560.0,
> > -				.dispclk_mhz =3D 513.0,
> > -				.dppclk_mhz =3D 513.0,
> > -				.phyclk_mhz =3D 540.0,
> > -				.socclk_mhz =3D 560.0,
> > -				.dscclk_mhz =3D 171.0,
> > -				.dram_speed_mts =3D 8960.0,
> > -			},
> > -			{
> > -				.state =3D 1,
> > -				.dcfclk_mhz =3D 694.0,
> > -				.fabricclk_mhz =3D 694.0,
> > -				.dispclk_mhz =3D 642.0,
> > -				.dppclk_mhz =3D 642.0,
> > -				.phyclk_mhz =3D 600.0,
> > -				.socclk_mhz =3D 694.0,
> > -				.dscclk_mhz =3D 214.0,
> > -				.dram_speed_mts =3D 11104.0,
> > -			},
> > -			{
> > -				.state =3D 2,
> > -				.dcfclk_mhz =3D 875.0,
> > -				.fabricclk_mhz =3D 875.0,
> > -				.dispclk_mhz =3D 734.0,
> > -				.dppclk_mhz =3D 734.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 875.0,
> > -				.dscclk_mhz =3D 245.0,
> > -				.dram_speed_mts =3D 14000.0,
> > -			},
> > -			{
> > -				.state =3D 3,
> > -				.dcfclk_mhz =3D 1000.0,
> > -				.fabricclk_mhz =3D 1000.0,
> > -				.dispclk_mhz =3D 1100.0,
> > -				.dppclk_mhz =3D 1100.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 1000.0,
> > -				.dscclk_mhz =3D 367.0,
> > -				.dram_speed_mts =3D 16000.0,
> > -			},
> > -			{
> > -				.state =3D 4,
> > -				.dcfclk_mhz =3D 1200.0,
> > -				.fabricclk_mhz =3D 1200.0,
> > -				.dispclk_mhz =3D 1284.0,
> > -				.dppclk_mhz =3D 1284.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 1200.0,
> > -				.dscclk_mhz =3D 428.0,
> > -				.dram_speed_mts =3D 16000.0,
> > -			},
> > -			/*Extra state, no dispclk ramping*/
> > -			{
> > -				.state =3D 5,
> > -				.dcfclk_mhz =3D 1200.0,
> > -				.fabricclk_mhz =3D 1200.0,
> > -				.dispclk_mhz =3D 1284.0,
> > -				.dppclk_mhz =3D 1284.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 1200.0,
> > -				.dscclk_mhz =3D 428.0,
> > -				.dram_speed_mts =3D 16000.0,
> > -			},
> > -		},
> > -	.num_states =3D 5,
> > -	.sr_exit_time_us =3D 8.6,
> > -	.sr_enter_plus_exit_time_us =3D 10.9,
> > -	.urgent_latency_us =3D 4.0,
> > -	.urgent_latency_pixel_data_only_us =3D 4.0,
> > -	.urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
> > -	.urgent_latency_vm_data_only_us =3D 4.0,
> > -	.urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
> > -	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096,
> > -	.urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
> > -	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
> > -	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
> > -	.pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
> > -	.max_avg_sdp_bw_use_normal_percent =3D 40.0,
> > -	.max_avg_dram_bw_use_normal_percent =3D 40.0,
> > -	.writeback_latency_us =3D 12.0,
> > -	.ideal_dram_bw_after_urgent_percent =3D 40.0,
> > -	.max_request_size_bytes =3D 256,
> > -	.dram_channel_width_bytes =3D 2,
> > -	.fabric_datapath_to_dcn_data_return_bytes =3D 64,
> > -	.dcn_downspread_percent =3D 0.5,
> > -	.downspread_percent =3D 0.38,
> > -	.dram_page_open_time_ns =3D 50.0,
> > -	.dram_rw_turnaround_time_ns =3D 17.5,
> > -	.dram_return_buffer_per_channel_bytes =3D 8192,
> > -	.round_trip_ping_latency_dcfclk_cycles =3D 131,
> > -	.urgent_out_of_order_return_per_channel_bytes =3D 256,
> > -	.channel_interleave_bytes =3D 256,
> > -	.num_banks =3D 8,
> > -	.num_chans =3D 16,
> > -	.vmm_page_size_bytes =3D 4096,
> > -	.dram_clock_change_latency_us =3D 404.0,
> > -	.dummy_pstate_latency_us =3D 5.0,
> > -	.writeback_dram_clock_change_latency_us =3D 23.0,
> > -	.return_bus_width_bytes =3D 64,
> > -	.dispclk_dppclk_vco_speed_mhz =3D 3850,
> > -	.xfc_bus_transport_time_us =3D 20,
> > -	.xfc_xbuf_latency_tolerance_us =3D 4,
> > -	.use_urgent_burst_bw =3D 0
> > -};
> > -
> > -static struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc =3D {
> > -	.clock_limits =3D {
> > -			{
> > -				.state =3D 0,
> > -				.dcfclk_mhz =3D 560.0,
> > -				.fabricclk_mhz =3D 560.0,
> > -				.dispclk_mhz =3D 513.0,
> > -				.dppclk_mhz =3D 513.0,
> > -				.phyclk_mhz =3D 540.0,
> > -				.socclk_mhz =3D 560.0,
> > -				.dscclk_mhz =3D 171.0,
> > -				.dram_speed_mts =3D 8960.0,
> > -			},
> > -			{
> > -				.state =3D 1,
> > -				.dcfclk_mhz =3D 694.0,
> > -				.fabricclk_mhz =3D 694.0,
> > -				.dispclk_mhz =3D 642.0,
> > -				.dppclk_mhz =3D 642.0,
> > -				.phyclk_mhz =3D 600.0,
> > -				.socclk_mhz =3D 694.0,
> > -				.dscclk_mhz =3D 214.0,
> > -				.dram_speed_mts =3D 11104.0,
> > -			},
> > -			{
> > -				.state =3D 2,
> > -				.dcfclk_mhz =3D 875.0,
> > -				.fabricclk_mhz =3D 875.0,
> > -				.dispclk_mhz =3D 734.0,
> > -				.dppclk_mhz =3D 734.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 875.0,
> > -				.dscclk_mhz =3D 245.0,
> > -				.dram_speed_mts =3D 14000.0,
> > -			},
> > -			{
> > -				.state =3D 3,
> > -				.dcfclk_mhz =3D 1000.0,
> > -				.fabricclk_mhz =3D 1000.0,
> > -				.dispclk_mhz =3D 1100.0,
> > -				.dppclk_mhz =3D 1100.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 1000.0,
> > -				.dscclk_mhz =3D 367.0,
> > -				.dram_speed_mts =3D 16000.0,
> > -			},
> > -			{
> > -				.state =3D 4,
> > -				.dcfclk_mhz =3D 1200.0,
> > -				.fabricclk_mhz =3D 1200.0,
> > -				.dispclk_mhz =3D 1284.0,
> > -				.dppclk_mhz =3D 1284.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 1200.0,
> > -				.dscclk_mhz =3D 428.0,
> > -				.dram_speed_mts =3D 16000.0,
> > -			},
> > -			/*Extra state, no dispclk ramping*/
> > -			{
> > -				.state =3D 5,
> > -				.dcfclk_mhz =3D 1200.0,
> > -				.fabricclk_mhz =3D 1200.0,
> > -				.dispclk_mhz =3D 1284.0,
> > -				.dppclk_mhz =3D 1284.0,
> > -				.phyclk_mhz =3D 810.0,
> > -				.socclk_mhz =3D 1200.0,
> > -				.dscclk_mhz =3D 428.0,
> > -				.dram_speed_mts =3D 16000.0,
> > -			},
> > -		},
> > -	.num_states =3D 5,
> > -	.sr_exit_time_us =3D 11.6,
> > -	.sr_enter_plus_exit_time_us =3D 13.9,
> > -	.urgent_latency_us =3D 4.0,
> > -	.urgent_latency_pixel_data_only_us =3D 4.0,
> > -	.urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
> > -	.urgent_latency_vm_data_only_us =3D 4.0,
> > -	.urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
> > -	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096,
> > -	.urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
> > -	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
> > -	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
> > -	.pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
> > -	.max_avg_sdp_bw_use_normal_percent =3D 40.0,
> > -	.max_avg_dram_bw_use_normal_percent =3D 40.0,
> > -	.writeback_latency_us =3D 12.0,
> > -	.ideal_dram_bw_after_urgent_percent =3D 40.0,
> > -	.max_request_size_bytes =3D 256,
> > -	.dram_channel_width_bytes =3D 2,
> > -	.fabric_datapath_to_dcn_data_return_bytes =3D 64,
> > -	.dcn_downspread_percent =3D 0.5,
> > -	.downspread_percent =3D 0.38,
> > -	.dram_page_open_time_ns =3D 50.0,
> > -	.dram_rw_turnaround_time_ns =3D 17.5,
> > -	.dram_return_buffer_per_channel_bytes =3D 8192,
> > -	.round_trip_ping_latency_dcfclk_cycles =3D 131,
> > -	.urgent_out_of_order_return_per_channel_bytes =3D 256,
> > -	.channel_interleave_bytes =3D 256,
> > -	.num_banks =3D 8,
> > -	.num_chans =3D 8,
> > -	.vmm_page_size_bytes =3D 4096,
> > -	.dram_clock_change_latency_us =3D 404.0,
> > -	.dummy_pstate_latency_us =3D 5.0,
> > -	.writeback_dram_clock_change_latency_us =3D 23.0,
> > -	.return_bus_width_bytes =3D 64,
> > -	.dispclk_dppclk_vco_speed_mhz =3D 3850,
> > -	.xfc_bus_transport_time_us =3D 20,
> > -	.xfc_xbuf_latency_tolerance_us =3D 4,
> > -	.use_urgent_burst_bw =3D 0
> > -};
> > -
> > -static struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { 0 };
> > -
> >   #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
> >   	#define mmDP0_DP_DPHY_INTERNAL_CTRL		0x210f
> >   	#define mmDP0_DP_DPHY_INTERNAL_CTRL_BASE_IDX	2
> > @@ -1810,69 +1448,6 @@ enum dc_status dcn20_remove_stream_from_ctx(stru=
ct dc *dc, struct dc_state *new_
> >   	return result;
> >   }
> > -
> > -static void swizzle_to_dml_params(
> > -		enum swizzle_mode_values swizzle,
> > -		unsigned int *sw_mode)
> > -{
> > -	switch (swizzle) {
> > -	case DC_SW_LINEAR:
> > -		*sw_mode =3D dm_sw_linear;
> > -		break;
> > -	case DC_SW_4KB_S:
> > -		*sw_mode =3D dm_sw_4kb_s;
> > -		break;
> > -	case DC_SW_4KB_S_X:
> > -		*sw_mode =3D dm_sw_4kb_s_x;
> > -		break;
> > -	case DC_SW_4KB_D:
> > -		*sw_mode =3D dm_sw_4kb_d;
> > -		break;
> > -	case DC_SW_4KB_D_X:
> > -		*sw_mode =3D dm_sw_4kb_d_x;
> > -		break;
> > -	case DC_SW_64KB_S:
> > -		*sw_mode =3D dm_sw_64kb_s;
> > -		break;
> > -	case DC_SW_64KB_S_X:
> > -		*sw_mode =3D dm_sw_64kb_s_x;
> > -		break;
> > -	case DC_SW_64KB_S_T:
> > -		*sw_mode =3D dm_sw_64kb_s_t;
> > -		break;
> > -	case DC_SW_64KB_D:
> > -		*sw_mode =3D dm_sw_64kb_d;
> > -		break;
> > -	case DC_SW_64KB_D_X:
> > -		*sw_mode =3D dm_sw_64kb_d_x;
> > -		break;
> > -	case DC_SW_64KB_D_T:
> > -		*sw_mode =3D dm_sw_64kb_d_t;
> > -		break;
> > -	case DC_SW_64KB_R_X:
> > -		*sw_mode =3D dm_sw_64kb_r_x;
> > -		break;
> > -	case DC_SW_VAR_S:
> > -		*sw_mode =3D dm_sw_var_s;
> > -		break;
> > -	case DC_SW_VAR_S_X:
> > -		*sw_mode =3D dm_sw_var_s_x;
> > -		break;
> > -	case DC_SW_VAR_D:
> > -		*sw_mode =3D dm_sw_var_d;
> > -		break;
> > -	case DC_SW_VAR_D_X:
> > -		*sw_mode =3D dm_sw_var_d_x;
> > -		break;
> > -	case DC_SW_VAR_R_X:
> > -		*sw_mode =3D dm_sw_var_r_x;
> > -		break;
> > -	default:
> > -		ASSERT(0); /* Not supported */
> > -		break;
> > -	}
> > -}
> > -
> >   bool dcn20_split_stream_for_odm(
> >   		const struct dc *dc,
> >   		struct resource_context *res_ctx,
> > @@ -1988,394 +1563,6 @@ void dcn20_split_stream_for_mpc(
> >   	ASSERT(primary_pipe->plane_state);
> >   }
> > -int dcn20_populate_dml_pipes_from_context(
> > -		struct dc *dc,
> > -		struct dc_state *context,
> > -		display_e2e_pipe_params_st *pipes,
> > -		bool fast_validate)
> > -{
> > -	int pipe_cnt, i;
> > -	bool synchronized_vblank =3D true;
> > -	struct resource_context *res_ctx =3D &context->res_ctx;
> > -
> > -	for (i =3D 0, pipe_cnt =3D -1; i < dc->res_pool->pipe_count; i++) {
> > -		if (!res_ctx->pipe_ctx[i].stream)
> > -			continue;
> > -
> > -		if (pipe_cnt < 0) {
> > -			pipe_cnt =3D i;
> > -			continue;
> > -		}
> > -
> > -		if (res_ctx->pipe_ctx[pipe_cnt].stream =3D=3D res_ctx->pipe_ctx[i].s=
tream)
> > -			continue;
> > -
> > -		if (dc->debug.disable_timing_sync ||
> > -			(!resource_are_streams_timing_synchronizable(
> > -				res_ctx->pipe_ctx[pipe_cnt].stream,
> > -				res_ctx->pipe_ctx[i].stream) &&
> > -			!resource_are_vblanks_synchronizable(
> > -				res_ctx->pipe_ctx[pipe_cnt].stream,
> > -				res_ctx->pipe_ctx[i].stream))) {
> > -			synchronized_vblank =3D false;
> > -			break;
> > -		}
> > -	}
> > -
> > -	for (i =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pipe_count; i++) {
> > -		struct dc_crtc_timing *timing =3D &res_ctx->pipe_ctx[i].stream->timi=
ng;
> > -		unsigned int v_total;
> > -		unsigned int front_porch;
> > -		int output_bpc;
> > -		struct audio_check aud_check =3D {0};
> > -
> > -		if (!res_ctx->pipe_ctx[i].stream)
> > -			continue;
> > -
> > -		v_total =3D timing->v_total;
> > -		front_porch =3D timing->v_front_porch;
> > -
> > -		/* todo:
> > -		pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D 0;
> > -		pipes[pipe_cnt].pipe.src.dcc =3D 0;
> > -		pipes[pipe_cnt].pipe.src.vm =3D 0;*/
> > -
> > -		pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_clocks.dch=
ub_ref_clock_inKhz / 1000.0;
> > -
> > -		pipes[pipe_cnt].dout.dsc_enable =3D res_ctx->pipe_ctx[i].stream->tim=
ing.flags.DSC;
> > -		/* todo: rotation?*/
> > -		pipes[pipe_cnt].dout.dsc_slices =3D res_ctx->pipe_ctx[i].stream->tim=
ing.dsc_cfg.num_slices_h;
> > -		if (res_ctx->pipe_ctx[i].stream->use_dynamic_meta) {
> > -			pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D true;
> > -			/* 1/2 vblank */
> > -			pipes[pipe_cnt].pipe.src.dynamic_metadata_lines_before_active =3D
> > -				(v_total - timing->v_addressable
> > -					- timing->v_border_top - timing->v_border_bottom) / 2;
> > -			/* 36 bytes dp, 32 hdmi */
> > -			pipes[pipe_cnt].pipe.src.dynamic_metadata_xmit_bytes =3D
> > -				dc_is_dp_signal(res_ctx->pipe_ctx[i].stream->signal) ? 36 : 32;
> > -		}
> > -		pipes[pipe_cnt].pipe.src.dcc =3D false;
> > -		pipes[pipe_cnt].pipe.src.dcc_rate =3D 1;
> > -		pipes[pipe_cnt].pipe.dest.synchronized_vblank_all_planes =3D synchro=
nized_vblank;
> > -		pipes[pipe_cnt].pipe.dest.hblank_start =3D timing->h_total - timing-=
>h_front_porch;
> > -		pipes[pipe_cnt].pipe.dest.hblank_end =3D pipes[pipe_cnt].pipe.dest.h=
blank_start
> > -				- timing->h_addressable
> > -				- timing->h_border_left
> > -				- timing->h_border_right;
> > -		pipes[pipe_cnt].pipe.dest.vblank_start =3D v_total - front_porch;
> > -		pipes[pipe_cnt].pipe.dest.vblank_end =3D pipes[pipe_cnt].pipe.dest.v=
blank_start
> > -				- timing->v_addressable
> > -				- timing->v_border_top
> > -				- timing->v_border_bottom;
> > -		pipes[pipe_cnt].pipe.dest.htotal =3D timing->h_total;
> > -		pipes[pipe_cnt].pipe.dest.vtotal =3D v_total;
> > -		pipes[pipe_cnt].pipe.dest.hactive =3D
> > -			timing->h_addressable + timing->h_border_left + timing->h_border_ri=
ght;
> > -		pipes[pipe_cnt].pipe.dest.vactive =3D
> > -			timing->v_addressable + timing->v_border_top + timing->v_border_bot=
tom;
> > -		pipes[pipe_cnt].pipe.dest.interlaced =3D timing->flags.INTERLACE;
> > -		pipes[pipe_cnt].pipe.dest.pixel_rate_mhz =3D timing->pix_clk_100hz/1=
0000.0;
> > -		if (timing->timing_3d_format =3D=3D TIMING_3D_FORMAT_HW_FRAME_PACKIN=
G)
> > -			pipes[pipe_cnt].pipe.dest.pixel_rate_mhz *=3D 2;
> > -		pipes[pipe_cnt].pipe.dest.otg_inst =3D res_ctx->pipe_ctx[i].stream_r=
es.tg->inst;
> > -		pipes[pipe_cnt].dout.dp_lanes =3D 4;
> > -		pipes[pipe_cnt].dout.is_virtual =3D 0;
> > -		pipes[pipe_cnt].pipe.dest.vtotal_min =3D res_ctx->pipe_ctx[i].stream=
->adjust.v_total_min;
> > -		pipes[pipe_cnt].pipe.dest.vtotal_max =3D res_ctx->pipe_ctx[i].stream=
->adjust.v_total_max;
> > -		switch (get_num_odm_splits(&res_ctx->pipe_ctx[i])) {
> > -		case 1:
> > -			pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_combine_mode_2to1;
> > -			break;
> > -		case 3:
> > -			pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_combine_mode_4to1;
> > -			break;
> > -		default:
> > -			pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_combine_mode_disab=
led;
> > -		}
> > -		pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].pipe_id=
x;
> > -		if (res_ctx->pipe_ctx[i].top_pipe && res_ctx->pipe_ctx[i].top_pipe->=
plane_state
> > -				=3D=3D res_ctx->pipe_ctx[i].plane_state) {
> > -			struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i].top_pipe;
> > -			int split_idx =3D 0;
> > -
> > -			while (first_pipe->top_pipe && first_pipe->top_pipe->plane_state
> > -					=3D=3D res_ctx->pipe_ctx[i].plane_state) {
> > -				first_pipe =3D first_pipe->top_pipe;
> > -				split_idx++;
> > -			}
> > -			/* Treat 4to1 mpc combine as an mpo of 2 2-to-1 combines */
> > -			if (split_idx =3D=3D 0)
> > -				pipes[pipe_cnt].pipe.src.hsplit_grp =3D first_pipe->pipe_idx;
> > -			else if (split_idx =3D=3D 1)
> > -				pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].pipe_=
idx;
> > -			else if (split_idx =3D=3D 2)
> > -				pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].top_p=
ipe->pipe_idx;
> > -		} else if (res_ctx->pipe_ctx[i].prev_odm_pipe) {
> > -			struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i].prev_odm_pipe;
> > -
> > -			while (first_pipe->prev_odm_pipe)
> > -				first_pipe =3D first_pipe->prev_odm_pipe;
> > -			pipes[pipe_cnt].pipe.src.hsplit_grp =3D first_pipe->pipe_idx;
> > -		}
> > -
> > -		switch (res_ctx->pipe_ctx[i].stream->signal) {
> > -		case SIGNAL_TYPE_DISPLAY_PORT_MST:
> > -		case SIGNAL_TYPE_DISPLAY_PORT:
> > -			pipes[pipe_cnt].dout.output_type =3D dm_dp;
> > -			break;
> > -		case SIGNAL_TYPE_EDP:
> > -			pipes[pipe_cnt].dout.output_type =3D dm_edp;
> > -			break;
> > -		case SIGNAL_TYPE_HDMI_TYPE_A:
> > -		case SIGNAL_TYPE_DVI_SINGLE_LINK:
> > -		case SIGNAL_TYPE_DVI_DUAL_LINK:
> > -			pipes[pipe_cnt].dout.output_type =3D dm_hdmi;
> > -			break;
> > -		default:
> > -			/* In case there is no signal, set dp with 4 lanes to allow max con=
fig */
> > -			pipes[pipe_cnt].dout.is_virtual =3D 1;
> > -			pipes[pipe_cnt].dout.output_type =3D dm_dp;
> > -			pipes[pipe_cnt].dout.dp_lanes =3D 4;
> > -		}
> > -
> > -		switch (res_ctx->pipe_ctx[i].stream->timing.display_color_depth) {
> > -		case COLOR_DEPTH_666:
> > -			output_bpc =3D 6;
> > -			break;
> > -		case COLOR_DEPTH_888:
> > -			output_bpc =3D 8;
> > -			break;
> > -		case COLOR_DEPTH_101010:
> > -			output_bpc =3D 10;
> > -			break;
> > -		case COLOR_DEPTH_121212:
> > -			output_bpc =3D 12;
> > -			break;
> > -		case COLOR_DEPTH_141414:
> > -			output_bpc =3D 14;
> > -			break;
> > -		case COLOR_DEPTH_161616:
> > -			output_bpc =3D 16;
> > -			break;
> > -		case COLOR_DEPTH_999:
> > -			output_bpc =3D 9;
> > -			break;
> > -		case COLOR_DEPTH_111111:
> > -			output_bpc =3D 11;
> > -			break;
> > -		default:
> > -			output_bpc =3D 8;
> > -			break;
> > -		}
> > -
> > -		switch (res_ctx->pipe_ctx[i].stream->timing.pixel_encoding) {
> > -		case PIXEL_ENCODING_RGB:
> > -		case PIXEL_ENCODING_YCBCR444:
> > -			pipes[pipe_cnt].dout.output_format =3D dm_444;
> > -			pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
> > -			break;
> > -		case PIXEL_ENCODING_YCBCR420:
> > -			pipes[pipe_cnt].dout.output_format =3D dm_420;
> > -			pipes[pipe_cnt].dout.output_bpp =3D (output_bpc * 3.0) / 2;
> > -			break;
> > -		case PIXEL_ENCODING_YCBCR422:
> > -			if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC &&
> > -			    !res_ctx->pipe_ctx[i].stream->timing.dsc_cfg.ycbcr422_simple)
> > -				pipes[pipe_cnt].dout.output_format =3D dm_n422;
> > -			else
> > -				pipes[pipe_cnt].dout.output_format =3D dm_s422;
> > -			pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 2;
> > -			break;
> > -		default:
> > -			pipes[pipe_cnt].dout.output_format =3D dm_444;
> > -			pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
> > -		}
> > -
> > -		if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC)
> > -			pipes[pipe_cnt].dout.output_bpp =3D res_ctx->pipe_ctx[i].stream->ti=
ming.dsc_cfg.bits_per_pixel / 16.0;
> > -
> > -		/* todo: default max for now, until there is logic reflecting this i=
n dc*/
> > -		pipes[pipe_cnt].dout.dsc_input_bpc =3D 12;
> > -		/*fill up the audio sample rate (unit in kHz)*/
> > -		get_audio_check(&res_ctx->pipe_ctx[i].stream->audio_info, &aud_check=
);
> > -		pipes[pipe_cnt].dout.max_audio_sample_rate =3D aud_check.max_audiosa=
mple_rate / 1000;
> > -		/*
> > -		 * For graphic plane, cursor number is 1, nv12 is 0
> > -		 * bw calculations due to cursor on/off
> > -		 */
> > -		if (res_ctx->pipe_ctx[i].plane_state &&
> > -				res_ctx->pipe_ctx[i].plane_state->address.type =3D=3D PLN_ADDR_TYP=
E_VIDEO_PROGRESSIVE)
> > -			pipes[pipe_cnt].pipe.src.num_cursors =3D 0;
> > -		else
> > -			pipes[pipe_cnt].pipe.src.num_cursors =3D dc->dml.ip.number_of_curso=
rs;
> > -
> > -		pipes[pipe_cnt].pipe.src.cur0_src_width =3D 256;
> > -		pipes[pipe_cnt].pipe.src.cur0_bpp =3D dm_cur_32bit;
> > -
> > -		if (!res_ctx->pipe_ctx[i].plane_state) {
> > -			pipes[pipe_cnt].pipe.src.is_hsplit =3D pipes[pipe_cnt].pipe.dest.od=
m_combine !=3D dm_odm_combine_mode_disabled;
> > -			pipes[pipe_cnt].pipe.src.source_scan =3D dm_horz;
> > -			pipes[pipe_cnt].pipe.src.sw_mode =3D dm_sw_4kb_s;
> > -			pipes[pipe_cnt].pipe.src.macro_tile_size =3D dm_64k_tile;
> > -			pipes[pipe_cnt].pipe.src.viewport_width =3D timing->h_addressable;
> > -			if (pipes[pipe_cnt].pipe.src.viewport_width > 1920)
> > -				pipes[pipe_cnt].pipe.src.viewport_width =3D 1920;
> > -			pipes[pipe_cnt].pipe.src.viewport_height =3D timing->v_addressable;
> > -			if (pipes[pipe_cnt].pipe.src.viewport_height > 1080)
> > -				pipes[pipe_cnt].pipe.src.viewport_height =3D 1080;
> > -			pipes[pipe_cnt].pipe.src.surface_height_y =3D pipes[pipe_cnt].pipe.=
src.viewport_height;
> > -			pipes[pipe_cnt].pipe.src.surface_width_y =3D pipes[pipe_cnt].pipe.s=
rc.viewport_width;
> > -			pipes[pipe_cnt].pipe.src.surface_height_c =3D pipes[pipe_cnt].pipe.=
src.viewport_height;
> > -			pipes[pipe_cnt].pipe.src.surface_width_c =3D pipes[pipe_cnt].pipe.s=
rc.viewport_width;
> > -			pipes[pipe_cnt].pipe.src.data_pitch =3D ((pipes[pipe_cnt].pipe.src.=
viewport_width + 255) / 256) * 256;
> > -			pipes[pipe_cnt].pipe.src.source_format =3D dm_444_32;
> > -			pipes[pipe_cnt].pipe.dest.recout_width =3D pipes[pipe_cnt].pipe.src=
=2Eviewport_width; /*vp_width/hratio*/
> > -			pipes[pipe_cnt].pipe.dest.recout_height =3D pipes[pipe_cnt].pipe.sr=
c.viewport_height; /*vp_height/vratio*/
> > -			pipes[pipe_cnt].pipe.dest.full_recout_width =3D pipes[pipe_cnt].pip=
e.dest.recout_width;  /*when is_hsplit !=3D 1*/
> > -			pipes[pipe_cnt].pipe.dest.full_recout_height =3D pipes[pipe_cnt].pi=
pe.dest.recout_height; /*when is_hsplit !=3D 1*/
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =3D 1.0;
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =3D 1.0;
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =3D 0; /*Lb only =
or Full scl*/
> > -			pipes[pipe_cnt].pipe.scale_taps.htaps =3D 1;
> > -			pipes[pipe_cnt].pipe.scale_taps.vtaps =3D 1;
> > -			pipes[pipe_cnt].pipe.dest.vtotal_min =3D v_total;
> > -			pipes[pipe_cnt].pipe.dest.vtotal_max =3D v_total;
> > -
> > -			if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mod=
e_2to1) {
> > -				pipes[pipe_cnt].pipe.src.viewport_width /=3D 2;
> > -				pipes[pipe_cnt].pipe.dest.recout_width /=3D 2;
> > -			} else if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_comb=
ine_mode_4to1) {
> > -				pipes[pipe_cnt].pipe.src.viewport_width /=3D 4;
> > -				pipes[pipe_cnt].pipe.dest.recout_width /=3D 4;
> > -			}
> > -		} else {
> > -			struct dc_plane_state *pln =3D res_ctx->pipe_ctx[i].plane_state;
> > -			struct scaler_data *scl =3D &res_ctx->pipe_ctx[i].plane_res.scl_dat=
a;
> > -
> > -			pipes[pipe_cnt].pipe.src.immediate_flip =3D pln->flip_immediate;
> > -			pipes[pipe_cnt].pipe.src.is_hsplit =3D (res_ctx->pipe_ctx[i].bottom=
_pipe && res_ctx->pipe_ctx[i].bottom_pipe->plane_state =3D=3D pln)
> > -					|| (res_ctx->pipe_ctx[i].top_pipe && res_ctx->pipe_ctx[i].top_pip=
e->plane_state =3D=3D pln)
> > -					|| pipes[pipe_cnt].pipe.dest.odm_combine !=3D dm_odm_combine_mode=
_disabled;
> > -
> > -			/* stereo is not split */
> > -			if (pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_SIDE_BY_SIDE ||
> > -			    pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_TOP_AND_BOTTOM) {
> > -				pipes[pipe_cnt].pipe.src.is_hsplit =3D false;
> > -				pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].pipe_=
idx;
> > -			}
> > -
> > -			pipes[pipe_cnt].pipe.src.source_scan =3D pln->rotation =3D=3D ROTAT=
ION_ANGLE_90
> > -					|| pln->rotation =3D=3D ROTATION_ANGLE_270 ? dm_vert : dm_horz;
> > -			pipes[pipe_cnt].pipe.src.viewport_y_y =3D scl->viewport.y;
> > -			pipes[pipe_cnt].pipe.src.viewport_y_c =3D scl->viewport_c.y;
> > -			pipes[pipe_cnt].pipe.src.viewport_width =3D scl->viewport.width;
> > -			pipes[pipe_cnt].pipe.src.viewport_width_c =3D scl->viewport_c.width;
> > -			pipes[pipe_cnt].pipe.src.viewport_height =3D scl->viewport.height;
> > -			pipes[pipe_cnt].pipe.src.viewport_height_c =3D scl->viewport_c.heig=
ht;
> > -			pipes[pipe_cnt].pipe.src.viewport_width_max =3D pln->src_rect.width;
> > -			pipes[pipe_cnt].pipe.src.viewport_height_max =3D pln->src_rect.heig=
ht;
> > -			pipes[pipe_cnt].pipe.src.surface_width_y =3D pln->plane_size.surfac=
e_size.width;
> > -			pipes[pipe_cnt].pipe.src.surface_height_y =3D pln->plane_size.surfa=
ce_size.height;
> > -			pipes[pipe_cnt].pipe.src.surface_width_c =3D pln->plane_size.chroma=
_size.width;
> > -			pipes[pipe_cnt].pipe.src.surface_height_c =3D pln->plane_size.chrom=
a_size.height;
> > -			if (pln->format =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA
> > -					|| pln->format >=3D SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
> > -				pipes[pipe_cnt].pipe.src.data_pitch =3D pln->plane_size.surface_pi=
tch;
> > -				pipes[pipe_cnt].pipe.src.data_pitch_c =3D pln->plane_size.chroma_p=
itch;
> > -				pipes[pipe_cnt].pipe.src.meta_pitch =3D pln->dcc.meta_pitch;
> > -				pipes[pipe_cnt].pipe.src.meta_pitch_c =3D pln->dcc.meta_pitch_c;
> > -			} else {
> > -				pipes[pipe_cnt].pipe.src.data_pitch =3D pln->plane_size.surface_pi=
tch;
> > -				pipes[pipe_cnt].pipe.src.meta_pitch =3D pln->dcc.meta_pitch;
> > -			}
> > -			pipes[pipe_cnt].pipe.src.dcc =3D pln->dcc.enable;
> > -			pipes[pipe_cnt].pipe.dest.recout_width =3D scl->recout.width;
> > -			pipes[pipe_cnt].pipe.dest.recout_height =3D scl->recout.height;
> > -			pipes[pipe_cnt].pipe.dest.full_recout_height =3D scl->recout.height;
> > -			pipes[pipe_cnt].pipe.dest.full_recout_width =3D scl->recout.width;
> > -			if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mod=
e_2to1)
> > -				pipes[pipe_cnt].pipe.dest.full_recout_width *=3D 2;
> > -			else if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combin=
e_mode_4to1)
> > -				pipes[pipe_cnt].pipe.dest.full_recout_width *=3D 4;
> > -			else {
> > -				struct pipe_ctx *split_pipe =3D res_ctx->pipe_ctx[i].bottom_pipe;
> > -
> > -				while (split_pipe && split_pipe->plane_state =3D=3D pln) {
> > -					pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe->plan=
e_res.scl_data.recout.width;
> > -					split_pipe =3D split_pipe->bottom_pipe;
> > -				}
> > -				split_pipe =3D res_ctx->pipe_ctx[i].top_pipe;
> > -				while (split_pipe && split_pipe->plane_state =3D=3D pln) {
> > -					pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe->plan=
e_res.scl_data.recout.width;
> > -					split_pipe =3D split_pipe->top_pipe;
> > -				}
> > -			}
> > -
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =3D (double) scl-=
>ratios.horz.value / (1ULL<<32);
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio_c =3D (double) sc=
l->ratios.horz_c.value / (1ULL<<32);
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =3D (double) scl-=
>ratios.vert.value / (1ULL<<32);
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio_c =3D (double) sc=
l->ratios.vert_c.value / (1ULL<<32);
> > -			pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =3D
> > -					scl->ratios.vert.value !=3D dc_fixpt_one.value
> > -					|| scl->ratios.horz.value !=3D dc_fixpt_one.value
> > -					|| scl->ratios.vert_c.value !=3D dc_fixpt_one.value
> > -					|| scl->ratios.horz_c.value !=3D dc_fixpt_one.value /*Lb only or =
Full scl*/
> > -					|| dc->debug.always_scale; /*support always scale*/
> > -			pipes[pipe_cnt].pipe.scale_taps.htaps =3D scl->taps.h_taps;
> > -			pipes[pipe_cnt].pipe.scale_taps.htaps_c =3D scl->taps.h_taps_c;
> > -			pipes[pipe_cnt].pipe.scale_taps.vtaps =3D scl->taps.v_taps;
> > -			pipes[pipe_cnt].pipe.scale_taps.vtaps_c =3D scl->taps.v_taps_c;
> > -
> > -			pipes[pipe_cnt].pipe.src.macro_tile_size =3D
> > -					swizzle_mode_to_macro_tile_size(pln->tiling_info.gfx9.swizzle);
> > -			swizzle_to_dml_params(pln->tiling_info.gfx9.swizzle,
> > -					&pipes[pipe_cnt].pipe.src.sw_mode);
> > -
> > -			switch (pln->format) {
> > -			case SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr:
> > -			case SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb:
> > -				pipes[pipe_cnt].pipe.src.source_format =3D dm_420_8;
> > -				break;
> > -			case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCbCr:
> > -			case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb:
> > -				pipes[pipe_cnt].pipe.src.source_format =3D dm_420_10;
> > -				break;
> > -			case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
> > -			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
> > -			case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
> > -			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
> > -				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_64;
> > -				break;
> > -			case SURFACE_PIXEL_FORMAT_GRPH_ARGB1555:
> > -			case SURFACE_PIXEL_FORMAT_GRPH_RGB565:
> > -				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_16;
> > -				break;
> > -			case SURFACE_PIXEL_FORMAT_GRPH_PALETA_256_COLORS:
> > -				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_8;
> > -				break;
> > -			case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
> > -				pipes[pipe_cnt].pipe.src.source_format =3D dm_rgbe_alpha;
> > -				break;
> > -			default:
> > -				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_32;
> > -				break;
> > -			}
> > -		}
> > -
> > -		pipe_cnt++;
> > -	}
> > -
> > -	/* populate writeback information */
> > -	DC_FP_START();
> > -	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx,=
 pipes);
> > -	DC_FP_END();
> > -
> > -	return pipe_cnt;
> > -}
> > -
> >   unsigned int dcn20_calc_max_scaled_time(
> >   		unsigned int time_per_pixel,
> >   		enum mmhubbub_wbif_mode mode,
> > @@ -2413,7 +1600,7 @@ void dcn20_set_mcif_arb_params(
> >   {
> >   	enum mmhubbub_wbif_mode wbif_mode;
> >   	struct mcif_arb_params *wb_arb_params;
> > -	int i, j, k, dwb_pipe;
> > +	int i, j, dwb_pipe;
> >   	/* Writeback MCIF_WB arbitration parameters */
> >   	dwb_pipe =3D 0;
> > @@ -2437,11 +1624,10 @@ void dcn20_set_mcif_arb_params(
> >   			} else
> >   				wbif_mode =3D PACKED_444;
> > -			for (k =3D 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_ar=
b_params->cli_watermark[0]); k++) {
> > -				wb_arb_params->cli_watermark[k] =3D get_wm_writeback_urgent(&conte=
xt->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -				wb_arb_params->pstate_watermark[k] =3D get_wm_writeback_dram_clock=
_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -			}
> > -			wb_arb_params->time_per_pixel =3D 16.0 * 1000 / (context->res_ctx.p=
ipe_ctx[i].stream->phy_pix_clk / 1000); /* 4 bit fraction, ms */
> > +			DC_FP_START();
> > +			dcn20_fpu_set_wb_arb_params(wb_arb_params, context, pipes, pipe_cnt=
, i);
> > +			DC_FP_END();
> > +
> >   			wb_arb_params->slice_lines =3D 32;
> >   			wb_arb_params->arbitration_slice =3D 2;
> >   			wb_arb_params->max_scaled_time =3D dcn20_calc_max_scaled_time(wb_a=
rb_params->time_per_pixel,
> > @@ -2808,8 +1994,11 @@ int dcn20_validate_apply_pipe_split_flags(
> >   		}
> >   		/* Adjust dppclk when split is forced, do not bother with dispclk */
> > -		if (split[i] !=3D 0 && v->NoOfDPP[vlevel][max_mpc_comb][pipe_idx] =
=3D=3D 1)
> > -			v->RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] /=3D 2;
> > +		if (split[i] !=3D 0 && v->NoOfDPP[vlevel][max_mpc_comb][pipe_idx] =
=3D=3D 1) {
> > +			DC_FP_START();
> > +			dcn20_fpu_adjust_dppclk(v, vlevel, max_mpc_comb, pipe_idx, false);
> > +			DC_FP_END();
> > +		}
> >   		pipe_idx++;
> >   	}
> > @@ -2835,7 +2024,9 @@ bool dcn20_fast_validate_bw(
> >   	dcn20_merge_pipes_for_validate(dc, context);
> > +	DC_FP_START();
> >   	pipe_cnt =3D dc->res_pool->funcs->populate_dml_pipes(dc, context, pi=
pes, fast_validate);
> > +	DC_FP_END();
> >   	*pipe_cnt_out =3D pipe_cnt;
> > @@ -2892,7 +2083,9 @@ bool dcn20_fast_validate_bw(
> >   				hsplit_pipe =3D dcn20_find_secondary_pipe(dc, &context->res_ctx, =
dc->res_pool, pipe);
> >   				ASSERT(hsplit_pipe);
> >   				if (!hsplit_pipe) {
> > -					context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context->bw_ctx.dm=
l.vba.maxMpcComb][pipe_idx] *=3D 2;
> > +					DC_FP_START();
> > +					dcn20_fpu_adjust_dppclk(&context->bw_ctx.dml.vba, vlevel, context=
->bw_ctx.dml.vba.maxMpcComb, pipe_idx, true);
> > +					DC_FP_END();
> >   					continue;
> >   				}
> >   				if (context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_idx]) {
> > @@ -2934,369 +2127,6 @@ bool dcn20_fast_validate_bw(
> >   	return out;
> >   }
> > -static void dcn20_calculate_wm(
> > -		struct dc *dc, struct dc_state *context,
> > -		display_e2e_pipe_params_st *pipes,
> > -		int *out_pipe_cnt,
> > -		int *pipe_split_from,
> > -		int vlevel,
> > -		bool fast_validate)
> > -{
> > -	int pipe_cnt, i, pipe_idx;
> > -
> > -	for (i =3D 0, pipe_idx =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pipe_=
count; i++) {
> > -		if (!context->res_ctx.pipe_ctx[i].stream)
> > -			continue;
> > -
> > -		pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_clocks.dch=
ub_ref_clock_inKhz / 1000.0;
> > -		pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->bw_ctx.dml.vba.Req=
uiredDISPCLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
> > -
> > -		if (pipe_split_from[i] < 0) {
> > -			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
> > -					context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context->bw_ctx.dm=
l.vba.maxMpcComb][pipe_idx];
> > -			if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_idx] =3D=3D pipe=
_idx)
> > -				pipes[pipe_cnt].pipe.dest.odm_combine =3D
> > -						context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_idx];
> > -			else
> > -				pipes[pipe_cnt].pipe.dest.odm_combine =3D 0;
> > -			pipe_idx++;
> > -		} else {
> > -			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
> > -					context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context->bw_ctx.dm=
l.vba.maxMpcComb][pipe_split_from[i]];
> > -			if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_split_from[i]] =
=3D=3D pipe_split_from[i])
> > -				pipes[pipe_cnt].pipe.dest.odm_combine =3D
> > -						context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_split_from[i]];
> > -			else
> > -				pipes[pipe_cnt].pipe.dest.odm_combine =3D 0;
> > -		}
> > -
> > -		if (dc->config.forced_clocks) {
> > -			pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[0].dispclk_mhz;
> > -			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D context->bw_ctx.dml.soc.clo=
ck_limits[0].dppclk_mhz;
> > -		}
> > -		if (dc->debug.min_disp_clk_khz > pipes[pipe_cnt].clks_cfg.dispclk_mh=
z * 1000)
> > -			pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D dc->debug.min_disp_clk_khz=
 / 1000.0;
> > -		if (dc->debug.min_dpp_clk_khz > pipes[pipe_cnt].clks_cfg.dppclk_mhz =
* 1000)
> > -			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D dc->debug.min_dpp_clk_khz /=
 1000.0;
> > -
> > -		pipe_cnt++;
> > -	}
> > -
> > -	if (pipe_cnt !=3D pipe_idx) {
> > -		if (dc->res_pool->funcs->populate_dml_pipes)
> > -			pipe_cnt =3D dc->res_pool->funcs->populate_dml_pipes(dc,
> > -				context, pipes, fast_validate);
> > -		else
> > -			pipe_cnt =3D dcn20_populate_dml_pipes_from_context(dc,
> > -				context, pipes, fast_validate);
> > -	}
> > -
> > -	*out_pipe_cnt =3D pipe_cnt;
> > -
> > -	pipes[0].clks_cfg.voltage =3D vlevel;
> > -	pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].dcfclk_mhz;
> > -	pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].socclk_mhz;
> > -
> > -	/* only pipe 0 is read for voltage and dcf/soc clocks */
> > -	if (vlevel < 1) {
> > -		pipes[0].clks_cfg.voltage =3D 1;
> > -		pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[1].dcfclk_mhz;
> > -		pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[1].socclk_mhz;
> > -	}
> > -	context->bw_ctx.bw.dcn.watermarks.b.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.b.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns =3D get_urgent_=
latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -
> > -	if (vlevel < 2) {
> > -		pipes[0].clks_cfg.voltage =3D 2;
> > -		pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].dcfclk_mhz;
> > -		pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].socclk_mhz;
> > -	}
> > -	context->bw_ctx.bw.dcn.watermarks.c.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.c.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -
> > -	if (vlevel < 3) {
> > -		pipes[0].clks_cfg.voltage =3D 3;
> > -		pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].dcfclk_mhz;
> > -		pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].socclk_mhz;
> > -	}
> > -	context->bw_ctx.bw.dcn.watermarks.d.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.d.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -
> > -	pipes[0].clks_cfg.voltage =3D vlevel;
> > -	pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].dcfclk_mhz;
> > -	pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].socclk_mhz;
> > -	context->bw_ctx.bw.dcn.watermarks.a.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.a.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -	context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > -}
> > -
> > -static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
> > -{
> > -	int i;
> > -	for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
> > -		if (!context->res_ctx.pipe_ctx[i].stream)
> > -			continue;
> > -		if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
> > -			return true;
> > -	}
> > -	return false;
> > -}
> > -
> > -static enum dcn_zstate_support_state  decide_zstate_support(struct dc =
*dc, struct dc_state *context)
> > -{
> > -	int plane_count;
> > -	int i;
> > -
> > -	plane_count =3D 0;
> > -	for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
> > -		if (context->res_ctx.pipe_ctx[i].plane_state)
> > -			plane_count++;
> > -	}
> > -
> > -	/*
> > -	 * Zstate is allowed in following scenarios:
> > -	 * 	1. Single eDP with PSR enabled
> > -	 * 	2. 0 planes (No memory requests)
> > -	 * 	3. Single eDP without PSR but > 5ms stutter period
> > -	 */
> > -	if (plane_count =3D=3D 0)
> > -		return DCN_ZSTATE_SUPPORT_ALLOW;
> > -	else if (context->stream_count =3D=3D 1 &&  context->streams[0]->sign=
al =3D=3D SIGNAL_TYPE_EDP) {
> > -		struct dc_link *link =3D context->streams[0]->sink->link;
> > -
> > -		/* zstate only supported on PWRSEQ0 */
> > -		if (link->link_index !=3D 0)
> > -			return DCN_ZSTATE_SUPPORT_DISALLOW;
> > -
> > -		if (context->bw_ctx.dml.vba.StutterPeriod > 5000.0)
> > -			return DCN_ZSTATE_SUPPORT_ALLOW;
> > -		else if (link->psr_settings.psr_version =3D=3D DC_PSR_VERSION_1 && !=
dc->debug.disable_psr)
> > -			return DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY;
> > -		else
> > -			return DCN_ZSTATE_SUPPORT_DISALLOW;
> > -	} else
> > -		return DCN_ZSTATE_SUPPORT_DISALLOW;
> > -}
> > -
> > -void dcn20_calculate_dlg_params(
> > -		struct dc *dc, struct dc_state *context,
> > -		display_e2e_pipe_params_st *pipes,
> > -		int pipe_cnt,
> > -		int vlevel)
> > -{
> > -	int i, pipe_idx;
> > -
> > -	/* Writeback MCIF_WB arbitration parameters */
> > -	dc->res_pool->funcs->set_mcif_arb_params(dc, context, pipes, pipe_cnt=
);
> > -
> > -	context->bw_ctx.bw.dcn.clk.dispclk_khz =3D context->bw_ctx.dml.vba.DI=
SPCLK * 1000;
> > -	context->bw_ctx.bw.dcn.clk.dcfclk_khz =3D context->bw_ctx.dml.vba.DCF=
CLK * 1000;
> > -	context->bw_ctx.bw.dcn.clk.socclk_khz =3D context->bw_ctx.dml.vba.SOC=
CLK * 1000;
> > -	context->bw_ctx.bw.dcn.clk.dramclk_khz =3D context->bw_ctx.dml.vba.DR=
AMSpeed * 1000 / 16;
> > -
> > -	if (dc->debug.min_dram_clk_khz > context->bw_ctx.bw.dcn.clk.dramclk_k=
hz)
> > -		context->bw_ctx.bw.dcn.clk.dramclk_khz =3D dc->debug.min_dram_clk_kh=
z;
> > -
> > -	context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz =3D context->bw_ctx.=
dml.vba.DCFCLKDeepSleep * 1000;
> > -	context->bw_ctx.bw.dcn.clk.fclk_khz =3D context->bw_ctx.dml.vba.Fabri=
cClock * 1000;
> > -	context->bw_ctx.bw.dcn.clk.p_state_change_support =3D
> > -		context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_c=
tx.dml.vba.maxMpcComb]
> > -							!=3D dm_dram_clock_change_unsupported;
> > -	context->bw_ctx.bw.dcn.clk.dppclk_khz =3D 0;
> > -
> > -	context->bw_ctx.bw.dcn.clk.zstate_support =3D decide_zstate_support(d=
c, context);
> > -
> > -	context->bw_ctx.bw.dcn.clk.dtbclk_en =3D is_dtbclk_required(dc, conte=
xt);
> > -
> > -	if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk_k=
hz)
> > -		context->bw_ctx.bw.dcn.clk.dispclk_khz =3D dc->debug.min_disp_clk_kh=
z;
> > -
> > -	for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
> > -		if (!context->res_ctx.pipe_ctx[i].stream)
> > -			continue;
> > -		pipes[pipe_idx].pipe.dest.vstartup_start =3D get_vstartup(&context->=
bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > -		pipes[pipe_idx].pipe.dest.vupdate_offset =3D get_vupdate_offset(&con=
text->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > -		pipes[pipe_idx].pipe.dest.vupdate_width =3D get_vupdate_width(&conte=
xt->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > -		pipes[pipe_idx].pipe.dest.vready_offset =3D get_vready_offset(&conte=
xt->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > -		context->res_ctx.pipe_ctx[i].det_buffer_size_kb =3D context->bw_ctx.=
dml.ip.det_buffer_size_kbytes;
> > -		context->res_ctx.pipe_ctx[i].unbounded_req =3D pipes[pipe_idx].pipe.=
src.unbounded_req_mode;
> > -
> > -		if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipes[pipe_idx].clks_cfg=
=2Edppclk_mhz * 1000)
> > -			context->bw_ctx.bw.dcn.clk.dppclk_khz =3D pipes[pipe_idx].clks_cfg.=
dppclk_mhz * 1000;
> > -		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =3D
> > -						pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
> > -		context->res_ctx.pipe_ctx[i].pipe_dlg_param =3D pipes[pipe_idx].pipe=
=2Edest;
> > -		pipe_idx++;
> > -	}
> > -	/*save a original dppclock copy*/
> > -	context->bw_ctx.bw.dcn.clk.bw_dppclk_khz =3D context->bw_ctx.bw.dcn.c=
lk.dppclk_khz;
> > -	context->bw_ctx.bw.dcn.clk.bw_dispclk_khz =3D context->bw_ctx.bw.dcn.=
clk.dispclk_khz;
> > -	context->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz =3D context->bw_c=
tx.dml.soc.clock_limits[vlevel].dppclk_mhz * 1000;
> > -	context->bw_ctx.bw.dcn.clk.max_supported_dispclk_khz =3D context->bw_=
ctx.dml.soc.clock_limits[vlevel].dispclk_mhz * 1000;
> > -
> > -	context->bw_ctx.bw.dcn.compbuf_size_kb =3D context->bw_ctx.dml.ip.con=
fig_return_buffer_size_in_kbytes
> > -						- context->bw_ctx.dml.ip.det_buffer_size_kbytes * pipe_idx;
> > -
> > -	for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
> > -		bool cstate_en =3D context->bw_ctx.dml.vba.PrefetchMode[vlevel][cont=
ext->bw_ctx.dml.vba.maxMpcComb] !=3D 2;
> > -
> > -		if (!context->res_ctx.pipe_ctx[i].stream)
> > -			continue;
> > -
> > -		if (dc->ctx->dce_version =3D=3D DCN_VERSION_2_01)
> > -			cstate_en =3D false;
> > -
> > -		context->bw_ctx.dml.funcs.rq_dlg_get_dlg_reg(&context->bw_ctx.dml,
> > -				&context->res_ctx.pipe_ctx[i].dlg_regs,
> > -				&context->res_ctx.pipe_ctx[i].ttu_regs,
> > -				pipes,
> > -				pipe_cnt,
> > -				pipe_idx,
> > -				cstate_en,
> > -				context->bw_ctx.bw.dcn.clk.p_state_change_support,
> > -				false, false, true);
> > -
> > -		context->bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&context->bw_ctx.dml,
> > -				&context->res_ctx.pipe_ctx[i].rq_regs,
> > -				&pipes[pipe_idx].pipe);
> > -		pipe_idx++;
> > -	}
> > -}
> > -
> > -static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc=
_state *context,
> > -		bool fast_validate)
> > -{
> > -	bool out =3D false;
> > -
> > -	BW_VAL_TRACE_SETUP();
> > -
> > -	int vlevel =3D 0;
> > -	int pipe_split_from[MAX_PIPES];
> > -	int pipe_cnt =3D 0;
> > -	display_e2e_pipe_params_st *pipes =3D kzalloc(dc->res_pool->pipe_coun=
t * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
> > -	DC_LOGGER_INIT(dc->ctx->logger);
> > -
> > -	BW_VAL_TRACE_COUNT();
> > -
> > -	out =3D dcn20_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_sp=
lit_from, &vlevel, fast_validate);
> > -
> > -	if (pipe_cnt =3D=3D 0)
> > -		goto validate_out;
> > -
> > -	if (!out)
> > -		goto validate_fail;
> > -
> > -	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
> > -
> > -	if (fast_validate) {
> > -		BW_VAL_TRACE_SKIP(fast);
> > -		goto validate_out;
> > -	}
> > -
> > -	dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vl=
evel, fast_validate);
> > -	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
> > -
> > -	BW_VAL_TRACE_END_WATERMARKS();
> > -
> > -	goto validate_out;
> > -
> > -validate_fail:
> > -	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
> > -		dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[cont=
ext->bw_ctx.dml.vba.soc.num_states]));
> > -
> > -	BW_VAL_TRACE_SKIP(fail);
> > -	out =3D false;
> > -
> > -validate_out:
> > -	kfree(pipes);
> > -
> > -	BW_VAL_TRACE_FINISH();
> > -
> > -	return out;
> > -}
> > -
> > -/*
> > - * This must be noinline to ensure anything that deals with FP registe=
rs
> > - * is contained within this call; previously our compiling with hard-f=
loat
> > - * would result in fp instructions being emitted outside of the bounda=
ries
> > - * of the DC_FP_START/END macros, which makes sense as the compiler ha=
s no
> > - * idea about what is wrapped and what is not
> > - *
> > - * This is largely just a workaround to avoid breakage introduced with=
 5.6,
> > - * ideally all fp-using code should be moved into its own file, only t=
hat
> > - * should be compiled with hard-float, and all code exported from there
> > - * should be strictly wrapped with DC_FP_START/END
> > - */
> > -static noinline bool dcn20_validate_bandwidth_fp(struct dc *dc,
> > -		struct dc_state *context, bool fast_validate)
> > -{
> > -	bool voltage_supported =3D false;
> > -	bool full_pstate_supported =3D false;
> > -	bool dummy_pstate_supported =3D false;
> > -	double p_state_latency_us;
> > -
> > -	p_state_latency_us =3D context->bw_ctx.dml.soc.dram_clock_change_late=
ncy_us;
> > -	context->bw_ctx.dml.soc.disable_dram_clock_change_vactive_support =3D
> > -		dc->debug.disable_dram_clock_change_vactive_support;
> > -	context->bw_ctx.dml.soc.allow_dram_clock_one_display_vactive =3D
> > -		dc->debug.enable_dram_clock_change_one_display_vactive;
> > -
> > -	/*Unsafe due to current pipe merge and split logic*/
> > -	ASSERT(context !=3D dc->current_state);
> > -
> > -	if (fast_validate) {
> > -		return dcn20_validate_bandwidth_internal(dc, context, true);
> > -	}
> > -
> > -	// Best case, we support full UCLK switch latency
> > -	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, =
false);
> > -	full_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change_s=
upport;
> > -
> > -	if (context->bw_ctx.dml.soc.dummy_pstate_latency_us =3D=3D 0 ||
> > -		(voltage_supported && full_pstate_supported)) {
> > -		context->bw_ctx.bw.dcn.clk.p_state_change_support =3D full_pstate_su=
pported;
> > -		goto restore_dml_state;
> > -	}
> > -
> > -	// Fallback: Try to only support G6 temperature read latency
> > -	context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D context->bw_=
ctx.dml.soc.dummy_pstate_latency_us;
> > -
> > -	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, =
false);
> > -	dummy_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change_=
support;
> > -
> > -	if (voltage_supported && (dummy_pstate_supported || !(context->stream=
_count))) {
> > -		context->bw_ctx.bw.dcn.clk.p_state_change_support =3D false;
> > -		goto restore_dml_state;
> > -	}
> > -
> > -	// ERROR: fallback is supposed to always work.
> > -	ASSERT(false);
> > -
> > -restore_dml_state:
> > -	context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D p_state_late=
ncy_us;
> > -	return voltage_supported;
> > -}
> > -
> >   bool dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context,
> >   		bool fast_validate)
> >   {
> > @@ -3464,170 +2294,6 @@ static void dcn20_pp_smu_destroy(struct pp_smu_=
funcs **pp_smu)
> >   	}
> >   }
> > -void dcn20_cap_soc_clocks(
> > -		struct _vcs_dpi_soc_bounding_box_st *bb,
> > -		struct pp_smu_nv_clock_table max_clocks)
> > -{
> > -	int i;
> > -
> > -	// First pass - cap all clocks higher than the reported max
> > -	for (i =3D 0; i < bb->num_states; i++) {
> > -		if ((bb->clock_limits[i].dcfclk_mhz > (max_clocks.dcfClockInKhz / 10=
00))
> > -				&& max_clocks.dcfClockInKhz !=3D 0)
> > -			bb->clock_limits[i].dcfclk_mhz =3D (max_clocks.dcfClockInKhz / 1000=
);
> > -
> > -		if ((bb->clock_limits[i].dram_speed_mts > (max_clocks.uClockInKhz / =
1000) * 16)
> > -						&& max_clocks.uClockInKhz !=3D 0)
> > -			bb->clock_limits[i].dram_speed_mts =3D (max_clocks.uClockInKhz / 10=
00) * 16;
> > -
> > -		if ((bb->clock_limits[i].fabricclk_mhz > (max_clocks.fabricClockInKh=
z / 1000))
> > -						&& max_clocks.fabricClockInKhz !=3D 0)
> > -			bb->clock_limits[i].fabricclk_mhz =3D (max_clocks.fabricClockInKhz =
/ 1000);
> > -
> > -		if ((bb->clock_limits[i].dispclk_mhz > (max_clocks.displayClockInKhz=
 / 1000))
> > -						&& max_clocks.displayClockInKhz !=3D 0)
> > -			bb->clock_limits[i].dispclk_mhz =3D (max_clocks.displayClockInKhz /=
 1000);
> > -
> > -		if ((bb->clock_limits[i].dppclk_mhz > (max_clocks.dppClockInKhz / 10=
00))
> > -						&& max_clocks.dppClockInKhz !=3D 0)
> > -			bb->clock_limits[i].dppclk_mhz =3D (max_clocks.dppClockInKhz / 1000=
);
> > -
> > -		if ((bb->clock_limits[i].phyclk_mhz > (max_clocks.phyClockInKhz / 10=
00))
> > -						&& max_clocks.phyClockInKhz !=3D 0)
> > -			bb->clock_limits[i].phyclk_mhz =3D (max_clocks.phyClockInKhz / 1000=
);
> > -
> > -		if ((bb->clock_limits[i].socclk_mhz > (max_clocks.socClockInKhz / 10=
00))
> > -						&& max_clocks.socClockInKhz !=3D 0)
> > -			bb->clock_limits[i].socclk_mhz =3D (max_clocks.socClockInKhz / 1000=
);
> > -
> > -		if ((bb->clock_limits[i].dscclk_mhz > (max_clocks.dscClockInKhz / 10=
00))
> > -						&& max_clocks.dscClockInKhz !=3D 0)
> > -			bb->clock_limits[i].dscclk_mhz =3D (max_clocks.dscClockInKhz / 1000=
);
> > -	}
> > -
> > -	// Second pass - remove all duplicate clock states
> > -	for (i =3D bb->num_states - 1; i > 1; i--) {
> > -		bool duplicate =3D true;
> > -
> > -		if (bb->clock_limits[i-1].dcfclk_mhz !=3D bb->clock_limits[i].dcfclk=
_mhz)
> > -			duplicate =3D false;
> > -		if (bb->clock_limits[i-1].dispclk_mhz !=3D bb->clock_limits[i].dispc=
lk_mhz)
> > -			duplicate =3D false;
> > -		if (bb->clock_limits[i-1].dppclk_mhz !=3D bb->clock_limits[i].dppclk=
_mhz)
> > -			duplicate =3D false;
> > -		if (bb->clock_limits[i-1].dram_speed_mts !=3D bb->clock_limits[i].dr=
am_speed_mts)
> > -			duplicate =3D false;
> > -		if (bb->clock_limits[i-1].dscclk_mhz !=3D bb->clock_limits[i].dscclk=
_mhz)
> > -			duplicate =3D false;
> > -		if (bb->clock_limits[i-1].fabricclk_mhz !=3D bb->clock_limits[i].fab=
ricclk_mhz)
> > -			duplicate =3D false;
> > -		if (bb->clock_limits[i-1].phyclk_mhz !=3D bb->clock_limits[i].phyclk=
_mhz)
> > -			duplicate =3D false;
> > -		if (bb->clock_limits[i-1].socclk_mhz !=3D bb->clock_limits[i].socclk=
_mhz)
> > -			duplicate =3D false;
> > -
> > -		if (duplicate)
> > -			bb->num_states--;
> > -	}
> > -}
> > -
> > -void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_boun=
ding_box_st *bb,
> > -		struct pp_smu_nv_clock_table *max_clocks, unsigned int *uclk_states,=
 unsigned int num_states)
> > -{
> > -	struct _vcs_dpi_voltage_scaling_st calculated_states[DC__VOLTAGE_STAT=
ES];
> > -	int i;
> > -	int num_calculated_states =3D 0;
> > -	int min_dcfclk =3D 0;
> > -
> > -	if (num_states =3D=3D 0)
> > -		return;
> > -
> > -	memset(calculated_states, 0, sizeof(calculated_states));
> > -
> > -	if (dc->bb_overrides.min_dcfclk_mhz > 0)
> > -		min_dcfclk =3D dc->bb_overrides.min_dcfclk_mhz;
> > -	else {
> > -		if (ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev))
> > -			min_dcfclk =3D 310;
> > -		else
> > -			// Accounting for SOC/DCF relationship, we can go as high as
> > -			// 506Mhz in Vmin.
> > -			min_dcfclk =3D 506;
> > -	}
> > -
> > -	for (i =3D 0; i < num_states; i++) {
> > -		int min_fclk_required_by_uclk;
> > -		calculated_states[i].state =3D i;
> > -		calculated_states[i].dram_speed_mts =3D uclk_states[i] * 16 / 1000;
> > -
> > -		// FCLK:UCLK ratio is 1.08
> > -		min_fclk_required_by_uclk =3D div_u64(((unsigned long long)uclk_stat=
es[i]) * 1080,
> > -			1000000);
> > -
> > -		calculated_states[i].fabricclk_mhz =3D (min_fclk_required_by_uclk < =
min_dcfclk) ?
> > -				min_dcfclk : min_fclk_required_by_uclk;
> > -
> > -		calculated_states[i].socclk_mhz =3D (calculated_states[i].fabricclk_=
mhz > max_clocks->socClockInKhz / 1000) ?
> > -				max_clocks->socClockInKhz / 1000 : calculated_states[i].fabricclk_=
mhz;
> > -
> > -		calculated_states[i].dcfclk_mhz =3D (calculated_states[i].fabricclk_=
mhz > max_clocks->dcfClockInKhz / 1000) ?
> > -				max_clocks->dcfClockInKhz / 1000 : calculated_states[i].fabricclk_=
mhz;
> > -
> > -		calculated_states[i].dispclk_mhz =3D max_clocks->displayClockInKhz /=
 1000;
> > -		calculated_states[i].dppclk_mhz =3D max_clocks->displayClockInKhz / =
1000;
> > -		calculated_states[i].dscclk_mhz =3D max_clocks->displayClockInKhz / =
(1000 * 3);
> > -
> > -		calculated_states[i].phyclk_mhz =3D max_clocks->phyClockInKhz / 1000;
> > -
> > -		num_calculated_states++;
> > -	}
> > -
> > -	calculated_states[num_calculated_states - 1].socclk_mhz =3D max_clock=
s->socClockInKhz / 1000;
> > -	calculated_states[num_calculated_states - 1].fabricclk_mhz =3D max_cl=
ocks->socClockInKhz / 1000;
> > -	calculated_states[num_calculated_states - 1].dcfclk_mhz =3D max_clock=
s->dcfClockInKhz / 1000;
> > -
> > -	memcpy(bb->clock_limits, calculated_states, sizeof(bb->clock_limits));
> > -	bb->num_states =3D num_calculated_states;
> > -
> > -	// Duplicate the last state, DML always an extra state identical to m=
ax state to work
> > -	memcpy(&bb->clock_limits[num_calculated_states], &bb->clock_limits[nu=
m_calculated_states - 1], sizeof(struct _vcs_dpi_voltage_scaling_st));
> > -	bb->clock_limits[num_calculated_states].state =3D bb->num_states;
> > -}
> > -
> > -void dcn20_patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bound=
ing_box_st *bb)
> > -{
> > -	if ((int)(bb->sr_exit_time_us * 1000) !=3D dc->bb_overrides.sr_exit_t=
ime_ns
> > -			&& dc->bb_overrides.sr_exit_time_ns) {
> > -		bb->sr_exit_time_us =3D dc->bb_overrides.sr_exit_time_ns / 1000.0;
> > -	}
> > -
> > -	if ((int)(bb->sr_enter_plus_exit_time_us * 1000)
> > -				!=3D dc->bb_overrides.sr_enter_plus_exit_time_ns
> > -			&& dc->bb_overrides.sr_enter_plus_exit_time_ns) {
> > -		bb->sr_enter_plus_exit_time_us =3D
> > -				dc->bb_overrides.sr_enter_plus_exit_time_ns / 1000.0;
> > -	}
> > -
> > -	if ((int)(bb->urgent_latency_us * 1000) !=3D dc->bb_overrides.urgent_=
latency_ns
> > -			&& dc->bb_overrides.urgent_latency_ns) {
> > -		bb->urgent_latency_us =3D dc->bb_overrides.urgent_latency_ns / 1000.=
0;
> > -	}
> > -
> > -	if ((int)(bb->dram_clock_change_latency_us * 1000)
> > -				!=3D dc->bb_overrides.dram_clock_change_latency_ns
> > -			&& dc->bb_overrides.dram_clock_change_latency_ns) {
> > -		bb->dram_clock_change_latency_us =3D
> > -				dc->bb_overrides.dram_clock_change_latency_ns / 1000.0;
> > -	}
> > -
> > -	if ((int)(bb->dummy_pstate_latency_us * 1000)
> > -				!=3D dc->bb_overrides.dummy_clock_change_latency_ns
> > -			&& dc->bb_overrides.dummy_clock_change_latency_ns) {
> > -		bb->dummy_pstate_latency_us =3D
> > -				dc->bb_overrides.dummy_clock_change_latency_ns / 1000.0;
> > -	}
> > -}
> > -
> >   static struct _vcs_dpi_soc_bounding_box_st *get_asic_rev_soc_bb(
> >   	uint32_t hw_internal_rev)
> >   {
> > @@ -3910,9 +2576,9 @@ static bool dcn20_resource_construct(
> >   				ranges.reader_wm_sets[i].wm_inst =3D i;
> >   				ranges.reader_wm_sets[i].min_drain_clk_mhz =3D PP_SMU_WM_SET_RANG=
E_CLK_UNCONSTRAINED_MIN;
> >   				ranges.reader_wm_sets[i].max_drain_clk_mhz =3D PP_SMU_WM_SET_RANG=
E_CLK_UNCONSTRAINED_MAX;
> > -				ranges.reader_wm_sets[i].min_fill_clk_mhz =3D (i > 0) ? (loaded_bb=
->clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
> > -				ranges.reader_wm_sets[i].max_fill_clk_mhz =3D loaded_bb->clock_lim=
its[i].dram_speed_mts / 16;
> > -
> > +				DC_FP_START();
> > +				dcn20_fpu_set_wm_ranges(i, &ranges, loaded_bb);
> > +				DC_FP_END();
> >   				ranges.num_reader_wm_sets =3D i + 1;
> >   			}
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/dr=
ivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> > index 6ec8ff45f0f7..961923c56ea0 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> > @@ -27,6 +27,7 @@
> >   #define __DC_RESOURCE_DCN20_H__
> >   #include "core_types.h"
> > +#include "dml/dcn20/dcn20_fpu.h"
> >   #define TO_DCN20_RES_POOL(pool)\
> >   	container_of(pool, struct dcn20_resource_pool, base)
> > @@ -35,6 +36,12 @@ struct dc;
> >   struct resource_pool;
> >   struct _vcs_dpi_display_pipe_params_st;
> > +extern struct _vcs_dpi_ip_params_st dcn2_0_ip;
> > +extern struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip;
> > +extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc;
> > +extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc;
> > +extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc;
> > +
> >   struct dcn20_resource_pool {
> >   	struct resource_pool base;
> >   };
> > @@ -49,11 +56,6 @@ unsigned int dcn20_calc_max_scaled_time(
> >   		unsigned int time_per_pixel,
> >   		enum mmhubbub_wbif_mode mode,
> >   		unsigned int urgent_watermark);
> > -int dcn20_populate_dml_pipes_from_context(
> > -		struct dc *dc,
> > -		struct dc_state *context,
> > -		display_e2e_pipe_params_st *pipes,
> > -		bool fast_validate);
> >   struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
> >   		struct dc_state *state,
> >   		const struct resource_pool *pool,
> > @@ -79,7 +81,6 @@ struct dpp *dcn20_dpp_create(
> >   struct input_pixel_processor *dcn20_ipp_create(
> >   	struct dc_context *ctx, uint32_t inst);
> > -
> >   struct output_pixel_processor *dcn20_opp_create(
> >   	struct dc_context *ctx, uint32_t inst);
> > @@ -96,11 +97,6 @@ struct display_stream_compressor *dcn20_dsc_create(
> >   	struct dc_context *ctx, uint32_t inst);
> >   void dcn20_dsc_destroy(struct display_stream_compressor **dsc);
> > -void dcn20_cap_soc_clocks(
> > -		struct _vcs_dpi_soc_bounding_box_st *bb,
> > -		struct pp_smu_nv_clock_table max_clocks);
> > -void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_boun=
ding_box_st *bb,
> > -		struct pp_smu_nv_clock_table *max_clocks, unsigned int *uclk_states,=
 unsigned int num_states);
> >   struct hubp *dcn20_hubp_create(
> >   	struct dc_context *ctx,
> >   	uint32_t inst);
> > @@ -158,11 +154,6 @@ bool dcn20_fast_validate_bw(
> >   		int *pipe_split_from,
> >   		int *vlevel_out,
> >   		bool fast_validate);
> > -void dcn20_calculate_dlg_params(
> > -		struct dc *dc, struct dc_state *context,
> > -		display_e2e_pipe_params_st *pipes,
> > -		int pipe_cnt,
> > -		int vlevel);
> >   enum dc_status dcn20_build_mapped_resource(const struct dc *dc, struc=
t dc_state *context, struct dc_stream_state *stream);
> >   enum dc_status dcn20_add_stream_to_ctx(struct dc *dc, struct dc_state=
 *new_ctx, struct dc_stream_state *dc_stream);
> > @@ -170,12 +161,5 @@ enum dc_status dcn20_add_dsc_to_stream_resource(st=
ruct dc *dc, struct dc_state *
> >   enum dc_status dcn20_remove_stream_from_ctx(struct dc *dc, struct dc_=
state *new_ctx, struct dc_stream_state *dc_stream);
> >   enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state =
*plane_state);
> > -void dcn20_patch_bounding_box(
> > -		struct dc *dc,
> > -		struct _vcs_dpi_soc_bounding_box_st *bb);
> > -void dcn20_cap_soc_clocks(
> > -		struct _vcs_dpi_soc_bounding_box_st *bb,
> > -		struct pp_smu_nv_clock_table max_clocks);
> > -
> >   #endif /* __DC_RESOURCE_DCN20_H__ */
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/dri=
vers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> > index d590dc917363..b7adc9b6a543 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> > @@ -25,6 +25,9 @@
> >    */
> >   #include "resource.h"
> > +#include "clk_mgr.h"
> > +#include "dc_link_dp.h"
> > +#include "dcn20/dcn20_resource.h"
> >   #include "dcn20_fpu.h"
> > @@ -61,6 +64,370 @@
> >    * warning.
> >    */
> > +struct _vcs_dpi_ip_params_st dcn2_0_ip =3D {
> > +	.odm_capable =3D 1,
> > +	.gpuvm_enable =3D 0,
> > +	.hostvm_enable =3D 0,
> > +	.gpuvm_max_page_table_levels =3D 4,
> > +	.hostvm_max_page_table_levels =3D 4,
> > +	.hostvm_cached_page_table_levels =3D 0,
> > +	.pte_group_size_bytes =3D 2048,
> > +	.num_dsc =3D 6,
> > +	.rob_buffer_size_kbytes =3D 168,
> > +	.det_buffer_size_kbytes =3D 164,
> > +	.dpte_buffer_size_in_pte_reqs_luma =3D 84,
> > +	.pde_proc_buffer_size_64k_reqs =3D 48,
> > +	.dpp_output_buffer_pixels =3D 2560,
> > +	.opp_output_buffer_lines =3D 1,
> > +	.pixel_chunk_size_kbytes =3D 8,
> > +	.pte_chunk_size_kbytes =3D 2,
> > +	.meta_chunk_size_kbytes =3D 2,
> > +	.writeback_chunk_size_kbytes =3D 2,
> > +	.line_buffer_size_bits =3D 789504,
> > +	.is_line_buffer_bpp_fixed =3D 0,
> > +	.line_buffer_fixed_bpp =3D 0,
> > +	.dcc_supported =3D true,
> > +	.max_line_buffer_lines =3D 12,
> > +	.writeback_luma_buffer_size_kbytes =3D 12,
> > +	.writeback_chroma_buffer_size_kbytes =3D 8,
> > +	.writeback_chroma_line_buffer_width_pixels =3D 4,
> > +	.writeback_max_hscl_ratio =3D 1,
> > +	.writeback_max_vscl_ratio =3D 1,
> > +	.writeback_min_hscl_ratio =3D 1,
> > +	.writeback_min_vscl_ratio =3D 1,
> > +	.writeback_max_hscl_taps =3D 12,
> > +	.writeback_max_vscl_taps =3D 12,
> > +	.writeback_line_buffer_luma_buffer_size =3D 0,
> > +	.writeback_line_buffer_chroma_buffer_size =3D 14643,
> > +	.cursor_buffer_size =3D 8,
> > +	.cursor_chunk_size =3D 2,
> > +	.max_num_otg =3D 6,
> > +	.max_num_dpp =3D 6,
> > +	.max_num_wb =3D 1,
> > +	.max_dchub_pscl_bw_pix_per_clk =3D 4,
> > +	.max_pscl_lb_bw_pix_per_clk =3D 2,
> > +	.max_lb_vscl_bw_pix_per_clk =3D 4,
> > +	.max_vscl_hscl_bw_pix_per_clk =3D 4,
> > +	.max_hscl_ratio =3D 8,
> > +	.max_vscl_ratio =3D 8,
> > +	.hscl_mults =3D 4,
> > +	.vscl_mults =3D 4,
> > +	.max_hscl_taps =3D 8,
> > +	.max_vscl_taps =3D 8,
> > +	.dispclk_ramp_margin_percent =3D 1,
> > +	.underscan_factor =3D 1.10,
> > +	.min_vblank_lines =3D 32, //
> > +	.dppclk_delay_subtotal =3D 77, //
> > +	.dppclk_delay_scl_lb_only =3D 16,
> > +	.dppclk_delay_scl =3D 50,
> > +	.dppclk_delay_cnvc_formatter =3D 8,
> > +	.dppclk_delay_cnvc_cursor =3D 6,
> > +	.dispclk_delay_subtotal =3D 87, //
> > +	.dcfclk_cstate_latency =3D 10, // SRExitTime
> > +	.max_inter_dcn_tile_repeaters =3D 8,
> > +	.xfc_supported =3D true,
> > +	.xfc_fill_bw_overhead_percent =3D 10.0,
> > +	.xfc_fill_constant_bytes =3D 0,
> > +	.number_of_cursors =3D 1,
> > +};
> > +
> > +struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip =3D {
> > +	.odm_capable =3D 1,
> > +	.gpuvm_enable =3D 0,
> > +	.hostvm_enable =3D 0,
> > +	.gpuvm_max_page_table_levels =3D 4,
> > +	.hostvm_max_page_table_levels =3D 4,
> > +	.hostvm_cached_page_table_levels =3D 0,
> > +	.num_dsc =3D 5,
> > +	.rob_buffer_size_kbytes =3D 168,
> > +	.det_buffer_size_kbytes =3D 164,
> > +	.dpte_buffer_size_in_pte_reqs_luma =3D 84,
> > +	.dpte_buffer_size_in_pte_reqs_chroma =3D 42,//todo
> > +	.dpp_output_buffer_pixels =3D 2560,
> > +	.opp_output_buffer_lines =3D 1,
> > +	.pixel_chunk_size_kbytes =3D 8,
> > +	.pte_enable =3D 1,
> > +	.max_page_table_levels =3D 4,
> > +	.pte_chunk_size_kbytes =3D 2,
> > +	.meta_chunk_size_kbytes =3D 2,
> > +	.writeback_chunk_size_kbytes =3D 2,
> > +	.line_buffer_size_bits =3D 789504,
> > +	.is_line_buffer_bpp_fixed =3D 0,
> > +	.line_buffer_fixed_bpp =3D 0,
> > +	.dcc_supported =3D true,
> > +	.max_line_buffer_lines =3D 12,
> > +	.writeback_luma_buffer_size_kbytes =3D 12,
> > +	.writeback_chroma_buffer_size_kbytes =3D 8,
> > +	.writeback_chroma_line_buffer_width_pixels =3D 4,
> > +	.writeback_max_hscl_ratio =3D 1,
> > +	.writeback_max_vscl_ratio =3D 1,
> > +	.writeback_min_hscl_ratio =3D 1,
> > +	.writeback_min_vscl_ratio =3D 1,
> > +	.writeback_max_hscl_taps =3D 12,
> > +	.writeback_max_vscl_taps =3D 12,
> > +	.writeback_line_buffer_luma_buffer_size =3D 0,
> > +	.writeback_line_buffer_chroma_buffer_size =3D 14643,
> > +	.cursor_buffer_size =3D 8,
> > +	.cursor_chunk_size =3D 2,
> > +	.max_num_otg =3D 5,
> > +	.max_num_dpp =3D 5,
> > +	.max_num_wb =3D 1,
> > +	.max_dchub_pscl_bw_pix_per_clk =3D 4,
> > +	.max_pscl_lb_bw_pix_per_clk =3D 2,
> > +	.max_lb_vscl_bw_pix_per_clk =3D 4,
> > +	.max_vscl_hscl_bw_pix_per_clk =3D 4,
> > +	.max_hscl_ratio =3D 8,
> > +	.max_vscl_ratio =3D 8,
> > +	.hscl_mults =3D 4,
> > +	.vscl_mults =3D 4,
> > +	.max_hscl_taps =3D 8,
> > +	.max_vscl_taps =3D 8,
> > +	.dispclk_ramp_margin_percent =3D 1,
> > +	.underscan_factor =3D 1.10,
> > +	.min_vblank_lines =3D 32, //
> > +	.dppclk_delay_subtotal =3D 77, //
> > +	.dppclk_delay_scl_lb_only =3D 16,
> > +	.dppclk_delay_scl =3D 50,
> > +	.dppclk_delay_cnvc_formatter =3D 8,
> > +	.dppclk_delay_cnvc_cursor =3D 6,
> > +	.dispclk_delay_subtotal =3D 87, //
> > +	.dcfclk_cstate_latency =3D 10, // SRExitTime
> > +	.max_inter_dcn_tile_repeaters =3D 8,
> > +	.xfc_supported =3D true,
> > +	.xfc_fill_bw_overhead_percent =3D 10.0,
> > +	.xfc_fill_constant_bytes =3D 0,
> > +	.ptoi_supported =3D 0,
> > +	.number_of_cursors =3D 1,
> > +};
> > +
> > +
> > +struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc =3D {
> > +	/* Defaults that get patched on driver load from firmware. */
> > +	.clock_limits =3D {
> > +			{
> > +				.state =3D 0,
> > +				.dcfclk_mhz =3D 560.0,
> > +				.fabricclk_mhz =3D 560.0,
> > +				.dispclk_mhz =3D 513.0,
> > +				.dppclk_mhz =3D 513.0,
> > +				.phyclk_mhz =3D 540.0,
> > +				.socclk_mhz =3D 560.0,
> > +				.dscclk_mhz =3D 171.0,
> > +				.dram_speed_mts =3D 8960.0,
> > +			},
> > +			{
> > +				.state =3D 1,
> > +				.dcfclk_mhz =3D 694.0,
> > +				.fabricclk_mhz =3D 694.0,
> > +				.dispclk_mhz =3D 642.0,
> > +				.dppclk_mhz =3D 642.0,
> > +				.phyclk_mhz =3D 600.0,
> > +				.socclk_mhz =3D 694.0,
> > +				.dscclk_mhz =3D 214.0,
> > +				.dram_speed_mts =3D 11104.0,
> > +			},
> > +			{
> > +				.state =3D 2,
> > +				.dcfclk_mhz =3D 875.0,
> > +				.fabricclk_mhz =3D 875.0,
> > +				.dispclk_mhz =3D 734.0,
> > +				.dppclk_mhz =3D 734.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 875.0,
> > +				.dscclk_mhz =3D 245.0,
> > +				.dram_speed_mts =3D 14000.0,
> > +			},
> > +			{
> > +				.state =3D 3,
> > +				.dcfclk_mhz =3D 1000.0,
> > +				.fabricclk_mhz =3D 1000.0,
> > +				.dispclk_mhz =3D 1100.0,
> > +				.dppclk_mhz =3D 1100.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 1000.0,
> > +				.dscclk_mhz =3D 367.0,
> > +				.dram_speed_mts =3D 16000.0,
> > +			},
> > +			{
> > +				.state =3D 4,
> > +				.dcfclk_mhz =3D 1200.0,
> > +				.fabricclk_mhz =3D 1200.0,
> > +				.dispclk_mhz =3D 1284.0,
> > +				.dppclk_mhz =3D 1284.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 1200.0,
> > +				.dscclk_mhz =3D 428.0,
> > +				.dram_speed_mts =3D 16000.0,
> > +			},
> > +			/*Extra state, no dispclk ramping*/
> > +			{
> > +				.state =3D 5,
> > +				.dcfclk_mhz =3D 1200.0,
> > +				.fabricclk_mhz =3D 1200.0,
> > +				.dispclk_mhz =3D 1284.0,
> > +				.dppclk_mhz =3D 1284.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 1200.0,
> > +				.dscclk_mhz =3D 428.0,
> > +				.dram_speed_mts =3D 16000.0,
> > +			},
> > +		},
> > +	.num_states =3D 5,
> > +	.sr_exit_time_us =3D 8.6,
> > +	.sr_enter_plus_exit_time_us =3D 10.9,
> > +	.urgent_latency_us =3D 4.0,
> > +	.urgent_latency_pixel_data_only_us =3D 4.0,
> > +	.urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
> > +	.urgent_latency_vm_data_only_us =3D 4.0,
> > +	.urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
> > +	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096,
> > +	.urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
> > +	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
> > +	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
> > +	.pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
> > +	.max_avg_sdp_bw_use_normal_percent =3D 40.0,
> > +	.max_avg_dram_bw_use_normal_percent =3D 40.0,
> > +	.writeback_latency_us =3D 12.0,
> > +	.ideal_dram_bw_after_urgent_percent =3D 40.0,
> > +	.max_request_size_bytes =3D 256,
> > +	.dram_channel_width_bytes =3D 2,
> > +	.fabric_datapath_to_dcn_data_return_bytes =3D 64,
> > +	.dcn_downspread_percent =3D 0.5,
> > +	.downspread_percent =3D 0.38,
> > +	.dram_page_open_time_ns =3D 50.0,
> > +	.dram_rw_turnaround_time_ns =3D 17.5,
> > +	.dram_return_buffer_per_channel_bytes =3D 8192,
> > +	.round_trip_ping_latency_dcfclk_cycles =3D 131,
> > +	.urgent_out_of_order_return_per_channel_bytes =3D 256,
> > +	.channel_interleave_bytes =3D 256,
> > +	.num_banks =3D 8,
> > +	.num_chans =3D 16,
> > +	.vmm_page_size_bytes =3D 4096,
> > +	.dram_clock_change_latency_us =3D 404.0,
> > +	.dummy_pstate_latency_us =3D 5.0,
> > +	.writeback_dram_clock_change_latency_us =3D 23.0,
> > +	.return_bus_width_bytes =3D 64,
> > +	.dispclk_dppclk_vco_speed_mhz =3D 3850,
> > +	.xfc_bus_transport_time_us =3D 20,
> > +	.xfc_xbuf_latency_tolerance_us =3D 4,
> > +	.use_urgent_burst_bw =3D 0
> > +};
> > +
> > +struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc =3D {
> > +	.clock_limits =3D {
> > +			{
> > +				.state =3D 0,
> > +				.dcfclk_mhz =3D 560.0,
> > +				.fabricclk_mhz =3D 560.0,
> > +				.dispclk_mhz =3D 513.0,
> > +				.dppclk_mhz =3D 513.0,
> > +				.phyclk_mhz =3D 540.0,
> > +				.socclk_mhz =3D 560.0,
> > +				.dscclk_mhz =3D 171.0,
> > +				.dram_speed_mts =3D 8960.0,
> > +			},
> > +			{
> > +				.state =3D 1,
> > +				.dcfclk_mhz =3D 694.0,
> > +				.fabricclk_mhz =3D 694.0,
> > +				.dispclk_mhz =3D 642.0,
> > +				.dppclk_mhz =3D 642.0,
> > +				.phyclk_mhz =3D 600.0,
> > +				.socclk_mhz =3D 694.0,
> > +				.dscclk_mhz =3D 214.0,
> > +				.dram_speed_mts =3D 11104.0,
> > +			},
> > +			{
> > +				.state =3D 2,
> > +				.dcfclk_mhz =3D 875.0,
> > +				.fabricclk_mhz =3D 875.0,
> > +				.dispclk_mhz =3D 734.0,
> > +				.dppclk_mhz =3D 734.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 875.0,
> > +				.dscclk_mhz =3D 245.0,
> > +				.dram_speed_mts =3D 14000.0,
> > +			},
> > +			{
> > +				.state =3D 3,
> > +				.dcfclk_mhz =3D 1000.0,
> > +				.fabricclk_mhz =3D 1000.0,
> > +				.dispclk_mhz =3D 1100.0,
> > +				.dppclk_mhz =3D 1100.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 1000.0,
> > +				.dscclk_mhz =3D 367.0,
> > +				.dram_speed_mts =3D 16000.0,
> > +			},
> > +			{
> > +				.state =3D 4,
> > +				.dcfclk_mhz =3D 1200.0,
> > +				.fabricclk_mhz =3D 1200.0,
> > +				.dispclk_mhz =3D 1284.0,
> > +				.dppclk_mhz =3D 1284.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 1200.0,
> > +				.dscclk_mhz =3D 428.0,
> > +				.dram_speed_mts =3D 16000.0,
> > +			},
> > +			/*Extra state, no dispclk ramping*/
> > +			{
> > +				.state =3D 5,
> > +				.dcfclk_mhz =3D 1200.0,
> > +				.fabricclk_mhz =3D 1200.0,
> > +				.dispclk_mhz =3D 1284.0,
> > +				.dppclk_mhz =3D 1284.0,
> > +				.phyclk_mhz =3D 810.0,
> > +				.socclk_mhz =3D 1200.0,
> > +				.dscclk_mhz =3D 428.0,
> > +				.dram_speed_mts =3D 16000.0,
> > +			},
> > +		},
> > +	.num_states =3D 5,
> > +	.sr_exit_time_us =3D 11.6,
> > +	.sr_enter_plus_exit_time_us =3D 13.9,
> > +	.urgent_latency_us =3D 4.0,
> > +	.urgent_latency_pixel_data_only_us =3D 4.0,
> > +	.urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
> > +	.urgent_latency_vm_data_only_us =3D 4.0,
> > +	.urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
> > +	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096,
> > +	.urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
> > +	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
> > +	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
> > +	.pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
> > +	.max_avg_sdp_bw_use_normal_percent =3D 40.0,
> > +	.max_avg_dram_bw_use_normal_percent =3D 40.0,
> > +	.writeback_latency_us =3D 12.0,
> > +	.ideal_dram_bw_after_urgent_percent =3D 40.0,
> > +	.max_request_size_bytes =3D 256,
> > +	.dram_channel_width_bytes =3D 2,
> > +	.fabric_datapath_to_dcn_data_return_bytes =3D 64,
> > +	.dcn_downspread_percent =3D 0.5,
> > +	.downspread_percent =3D 0.38,
> > +	.dram_page_open_time_ns =3D 50.0,
> > +	.dram_rw_turnaround_time_ns =3D 17.5,
> > +	.dram_return_buffer_per_channel_bytes =3D 8192,
> > +	.round_trip_ping_latency_dcfclk_cycles =3D 131,
> > +	.urgent_out_of_order_return_per_channel_bytes =3D 256,
> > +	.channel_interleave_bytes =3D 256,
> > +	.num_banks =3D 8,
> > +	.num_chans =3D 8,
> > +	.vmm_page_size_bytes =3D 4096,
> > +	.dram_clock_change_latency_us =3D 404.0,
> > +	.dummy_pstate_latency_us =3D 5.0,
> > +	.writeback_dram_clock_change_latency_us =3D 23.0,
> > +	.return_bus_width_bytes =3D 64,
> > +	.dispclk_dppclk_vco_speed_mhz =3D 3850,
> > +	.xfc_bus_transport_time_us =3D 20,
> > +	.xfc_xbuf_latency_tolerance_us =3D 4,
> > +	.use_urgent_burst_bw =3D 0
> > +};
> > +
> > +struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { 0 };
> > +
> > +#define DC_LOGGER_INIT(logger)
> > +
> >   void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> >   					       struct resource_context *res_ctx,
> >   					       display_e2e_pipe_params_st *pipes)
> > @@ -100,3 +467,1021 @@ void dcn20_populate_dml_writeback_from_context(s=
truct dc *dc,
> >   		pipe_cnt++;
> >   	}
> >   }
> > +
> > +void dcn20_fpu_set_wb_arb_params(struct mcif_arb_params *wb_arb_params,
> > +				 struct dc_state *context,
> > +				 display_e2e_pipe_params_st *pipes,
> > +				 int pipe_cnt, int i)
> > +{
> > +	int k;
> > +
> > +	dc_assert_fp_enabled();
> > +
> > +	for (k =3D 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_=
params->cli_watermark[0]); k++) {
> > +		wb_arb_params->cli_watermark[k] =3D get_wm_writeback_urgent(&context=
->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +		wb_arb_params->pstate_watermark[k] =3D get_wm_writeback_dram_clock_c=
hange(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	}
> > +	wb_arb_params->time_per_pixel =3D 16.0 * 1000 / (context->res_ctx.pip=
e_ctx[i].stream->phy_pix_clk / 1000); /* 4 bit fraction, ms */
> > +}
> > +
> > +static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
> > +		if (!context->res_ctx.pipe_ctx[i].stream)
> > +			continue;
> > +		if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
> > +			return true;
> > +	}
> > +	return false;
> > +}
> > +
> > +static enum dcn_zstate_support_state decide_zstate_support(struct dc *=
dc,struct dc_state *context)
> > +{
> > +	int plane_count;
> > +	int i;
> > +
> > +	plane_count =3D 0;
> > +	for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
> > +		if (context->res_ctx.pipe_ctx[i].plane_state)
> > +			plane_count++;
> > +	}
> > +
> > +	/*
> > +	 * Zstate is allowed in following scenarios:
> > +	 * 	1. Single eDP with PSR enabled
> > +	 * 	2. 0 planes (No memory requests)
> > +	 * 	3. Single eDP without PSR but > 5ms stutter period
> > +	 */
> > +	if (plane_count =3D=3D 0)
> > +		return DCN_ZSTATE_SUPPORT_ALLOW;
> > +	else if (context->stream_count =3D=3D 1 &&  context->streams[0]->sign=
al =3D=3D SIGNAL_TYPE_EDP) {
> > +		struct dc_link *link =3D context->streams[0]->sink->link;
> > +
> > +		/* zstate only supported on PWRSEQ0 */
> > +		if (link->link_index !=3D 0)
> > +			return DCN_ZSTATE_SUPPORT_DISALLOW;
> > +
> > +		if (context->bw_ctx.dml.vba.StutterPeriod > 5000.0)
> > +			return DCN_ZSTATE_SUPPORT_ALLOW;
> > +		else if (link->psr_settings.psr_version =3D=3D DC_PSR_VERSION_1 && !=
dc->debug.disable_psr)
> > +			return DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY;
> > +		else
> > +			return DCN_ZSTATE_SUPPORT_DISALLOW;
> > +	} else
> > +		return DCN_ZSTATE_SUPPORT_DISALLOW;
> > +}
> > +
> > +void dcn20_calculate_dlg_params(struct dc *dc,
> > +				struct dc_state *context,
> > +				display_e2e_pipe_params_st *pipes,
> > +				int pipe_cnt,
> > +				int vlevel)
> > +{
> > +	int i, pipe_idx;
> > +
> > +	dc_assert_fp_enabled();
> > +
> > +	/* Writeback MCIF_WB arbitration parameters */
> > +	dc->res_pool->funcs->set_mcif_arb_params(dc, context, pipes, pipe_cnt=
);
> > +
> > +	context->bw_ctx.bw.dcn.clk.dispclk_khz =3D context->bw_ctx.dml.vba.DI=
SPCLK * 1000;
> > +	context->bw_ctx.bw.dcn.clk.dcfclk_khz =3D context->bw_ctx.dml.vba.DCF=
CLK * 1000;
> > +	context->bw_ctx.bw.dcn.clk.socclk_khz =3D context->bw_ctx.dml.vba.SOC=
CLK * 1000;
> > +	context->bw_ctx.bw.dcn.clk.dramclk_khz =3D context->bw_ctx.dml.vba.DR=
AMSpeed * 1000 / 16;
> > +
> > +	if (dc->debug.min_dram_clk_khz > context->bw_ctx.bw.dcn.clk.dramclk_k=
hz)
> > +		context->bw_ctx.bw.dcn.clk.dramclk_khz =3D dc->debug.min_dram_clk_kh=
z;
> > +
> > +	context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz =3D context->bw_ctx.=
dml.vba.DCFCLKDeepSleep * 1000;
> > +	context->bw_ctx.bw.dcn.clk.fclk_khz =3D context->bw_ctx.dml.vba.Fabri=
cClock * 1000;
> > +	context->bw_ctx.bw.dcn.clk.p_state_change_support =3D
> > +		context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_c=
tx.dml.vba.maxMpcComb]
> > +							!=3D dm_dram_clock_change_unsupported;
> > +	context->bw_ctx.bw.dcn.clk.dppclk_khz =3D 0;
> > +
> > +	context->bw_ctx.bw.dcn.clk.zstate_support =3D decide_zstate_support(d=
c, context);
> > +
> > +	context->bw_ctx.bw.dcn.clk.dtbclk_en =3D is_dtbclk_required(dc, conte=
xt);
> > +
> > +	if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk_k=
hz)
> > +		context->bw_ctx.bw.dcn.clk.dispclk_khz =3D dc->debug.min_disp_clk_kh=
z;
> > +
> > +	for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
> > +		if (!context->res_ctx.pipe_ctx[i].stream)
> > +			continue;
> > +		pipes[pipe_idx].pipe.dest.vstartup_start =3D get_vstartup(&context->=
bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > +		pipes[pipe_idx].pipe.dest.vupdate_offset =3D get_vupdate_offset(&con=
text->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > +		pipes[pipe_idx].pipe.dest.vupdate_width =3D get_vupdate_width(&conte=
xt->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > +		pipes[pipe_idx].pipe.dest.vready_offset =3D get_vready_offset(&conte=
xt->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> > +		context->res_ctx.pipe_ctx[i].det_buffer_size_kb =3D context->bw_ctx.=
dml.ip.det_buffer_size_kbytes;
> > +		context->res_ctx.pipe_ctx[i].unbounded_req =3D pipes[pipe_idx].pipe.=
src.unbounded_req_mode;
> > +
> > +		if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipes[pipe_idx].clks_cfg=
=2Edppclk_mhz * 1000)
> > +			context->bw_ctx.bw.dcn.clk.dppclk_khz =3D pipes[pipe_idx].clks_cfg.=
dppclk_mhz * 1000;
> > +		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =3D
> > +						pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
> > +		context->res_ctx.pipe_ctx[i].pipe_dlg_param =3D pipes[pipe_idx].pipe=
=2Edest;
> > +		pipe_idx++;
> > +	}
> > +	/*save a original dppclock copy*/
> > +	context->bw_ctx.bw.dcn.clk.bw_dppclk_khz =3D context->bw_ctx.bw.dcn.c=
lk.dppclk_khz;
> > +	context->bw_ctx.bw.dcn.clk.bw_dispclk_khz =3D context->bw_ctx.bw.dcn.=
clk.dispclk_khz;
> > +	context->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz =3D context->bw_c=
tx.dml.soc.clock_limits[vlevel].dppclk_mhz * 1000;
> > +	context->bw_ctx.bw.dcn.clk.max_supported_dispclk_khz =3D context->bw_=
ctx.dml.soc.clock_limits[vlevel].dispclk_mhz * 1000;
> > +
> > +	context->bw_ctx.bw.dcn.compbuf_size_kb =3D context->bw_ctx.dml.ip.con=
fig_return_buffer_size_in_kbytes
> > +						- context->bw_ctx.dml.ip.det_buffer_size_kbytes * pipe_idx;
> > +
> > +	for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
> > +		bool cstate_en =3D context->bw_ctx.dml.vba.PrefetchMode[vlevel][cont=
ext->bw_ctx.dml.vba.maxMpcComb] !=3D 2;
> > +
> > +		if (!context->res_ctx.pipe_ctx[i].stream)
> > +			continue;
> > +
> > +		if (dc->ctx->dce_version =3D=3D DCN_VERSION_2_01)
> > +			cstate_en =3D false;
> > +
> > +		context->bw_ctx.dml.funcs.rq_dlg_get_dlg_reg(&context->bw_ctx.dml,
> > +				&context->res_ctx.pipe_ctx[i].dlg_regs,
> > +				&context->res_ctx.pipe_ctx[i].ttu_regs,
> > +				pipes,
> > +				pipe_cnt,
> > +				pipe_idx,
> > +				cstate_en,
> > +				context->bw_ctx.bw.dcn.clk.p_state_change_support,
> > +				false, false, true);
> > +
> > +		context->bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&context->bw_ctx.dml,
> > +				&context->res_ctx.pipe_ctx[i].rq_regs,
> > +				&pipes[pipe_idx].pipe);
> > +		pipe_idx++;
> > +	}
> > +}
> > +
> > +static void swizzle_to_dml_params(enum swizzle_mode_values swizzle,
> > +				  unsigned int *sw_mode)
> > +{
> > +	switch (swizzle) {
> > +	case DC_SW_LINEAR:
> > +		*sw_mode =3D dm_sw_linear;
> > +		break;
> > +	case DC_SW_4KB_S:
> > +		*sw_mode =3D dm_sw_4kb_s;
> > +		break;
> > +	case DC_SW_4KB_S_X:
> > +		*sw_mode =3D dm_sw_4kb_s_x;
> > +		break;
> > +	case DC_SW_4KB_D:
> > +		*sw_mode =3D dm_sw_4kb_d;
> > +		break;
> > +	case DC_SW_4KB_D_X:
> > +		*sw_mode =3D dm_sw_4kb_d_x;
> > +		break;
> > +	case DC_SW_64KB_S:
> > +		*sw_mode =3D dm_sw_64kb_s;
> > +		break;
> > +	case DC_SW_64KB_S_X:
> > +		*sw_mode =3D dm_sw_64kb_s_x;
> > +		break;
> > +	case DC_SW_64KB_S_T:
> > +		*sw_mode =3D dm_sw_64kb_s_t;
> > +		break;
> > +	case DC_SW_64KB_D:
> > +		*sw_mode =3D dm_sw_64kb_d;
> > +		break;
> > +	case DC_SW_64KB_D_X:
> > +		*sw_mode =3D dm_sw_64kb_d_x;
> > +		break;
> > +	case DC_SW_64KB_D_T:
> > +		*sw_mode =3D dm_sw_64kb_d_t;
> > +		break;
> > +	case DC_SW_64KB_R_X:
> > +		*sw_mode =3D dm_sw_64kb_r_x;
> > +		break;
> > +	case DC_SW_VAR_S:
> > +		*sw_mode =3D dm_sw_var_s;
> > +		break;
> > +	case DC_SW_VAR_S_X:
> > +		*sw_mode =3D dm_sw_var_s_x;
> > +		break;
> > +	case DC_SW_VAR_D:
> > +		*sw_mode =3D dm_sw_var_d;
> > +		break;
> > +	case DC_SW_VAR_D_X:
> > +		*sw_mode =3D dm_sw_var_d_x;
> > +		break;
> > +	case DC_SW_VAR_R_X:
> > +		*sw_mode =3D dm_sw_var_r_x;
> > +		break;
> > +	default:
> > +		ASSERT(0); /* Not supported */
> > +		break;
> > +	}
> > +}
> > +
> > +int dcn20_populate_dml_pipes_from_context(struct dc *dc,
> > +					  struct dc_state *context,
> > +					  display_e2e_pipe_params_st *pipes,
> > +					  bool fast_validate)
> > +{
> > +	int pipe_cnt, i;
> > +	bool synchronized_vblank =3D true;
> > +	struct resource_context *res_ctx =3D &context->res_ctx;
> > +
> > +	dc_assert_fp_enabled();
> > +
> > +	for (i =3D 0, pipe_cnt =3D -1; i < dc->res_pool->pipe_count; i++) {
> > +		if (!res_ctx->pipe_ctx[i].stream)
> > +			continue;
> > +
> > +		if (pipe_cnt < 0) {
> > +			pipe_cnt =3D i;
> > +			continue;
> > +		}
> > +
> > +		if (res_ctx->pipe_ctx[pipe_cnt].stream =3D=3D res_ctx->pipe_ctx[i].s=
tream)
> > +			continue;
> > +
> > +		if (dc->debug.disable_timing_sync ||
> > +			(!resource_are_streams_timing_synchronizable(
> > +				res_ctx->pipe_ctx[pipe_cnt].stream,
> > +				res_ctx->pipe_ctx[i].stream) &&
> > +			!resource_are_vblanks_synchronizable(
> > +				res_ctx->pipe_ctx[pipe_cnt].stream,
> > +				res_ctx->pipe_ctx[i].stream))) {
> > +			synchronized_vblank =3D false;
> > +			break;
> > +		}
> > +	}
> > +
> > +	for (i =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pipe_count; i++) {
> > +		struct dc_crtc_timing *timing =3D &res_ctx->pipe_ctx[i].stream->timi=
ng;
> > +		unsigned int v_total;
> > +		unsigned int front_porch;
> > +		int output_bpc;
> > +		struct audio_check aud_check =3D {0};
> > +
> > +		if (!res_ctx->pipe_ctx[i].stream)
> > +			continue;
> > +
> > +		v_total =3D timing->v_total;
> > +		front_porch =3D timing->v_front_porch;
> > +
> > +		/* todo:
> > +		pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D 0;
> > +		pipes[pipe_cnt].pipe.src.dcc =3D 0;
> > +		pipes[pipe_cnt].pipe.src.vm =3D 0;*/
> > +
> > +		pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_clocks.dch=
ub_ref_clock_inKhz / 1000.0;
> > +
> > +		pipes[pipe_cnt].dout.dsc_enable =3D res_ctx->pipe_ctx[i].stream->tim=
ing.flags.DSC;
> > +		/* todo: rotation?*/
> > +		pipes[pipe_cnt].dout.dsc_slices =3D res_ctx->pipe_ctx[i].stream->tim=
ing.dsc_cfg.num_slices_h;
> > +		if (res_ctx->pipe_ctx[i].stream->use_dynamic_meta) {
> > +			pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D true;
> > +			/* 1/2 vblank */
> > +			pipes[pipe_cnt].pipe.src.dynamic_metadata_lines_before_active =3D
> > +				(v_total - timing->v_addressable
> > +					- timing->v_border_top - timing->v_border_bottom) / 2;
> > +			/* 36 bytes dp, 32 hdmi */
> > +			pipes[pipe_cnt].pipe.src.dynamic_metadata_xmit_bytes =3D
> > +				dc_is_dp_signal(res_ctx->pipe_ctx[i].stream->signal) ? 36 : 32;
> > +		}
> > +		pipes[pipe_cnt].pipe.src.dcc =3D false;
> > +		pipes[pipe_cnt].pipe.src.dcc_rate =3D 1;
> > +		pipes[pipe_cnt].pipe.dest.synchronized_vblank_all_planes =3D synchro=
nized_vblank;
> > +		pipes[pipe_cnt].pipe.dest.hblank_start =3D timing->h_total - timing-=
>h_front_porch;
> > +		pipes[pipe_cnt].pipe.dest.hblank_end =3D pipes[pipe_cnt].pipe.dest.h=
blank_start
> > +				- timing->h_addressable
> > +				- timing->h_border_left
> > +				- timing->h_border_right;
> > +		pipes[pipe_cnt].pipe.dest.vblank_start =3D v_total - front_porch;
> > +		pipes[pipe_cnt].pipe.dest.vblank_end =3D pipes[pipe_cnt].pipe.dest.v=
blank_start
> > +				- timing->v_addressable
> > +				- timing->v_border_top
> > +				- timing->v_border_bottom;
> > +		pipes[pipe_cnt].pipe.dest.htotal =3D timing->h_total;
> > +		pipes[pipe_cnt].pipe.dest.vtotal =3D v_total;
> > +		pipes[pipe_cnt].pipe.dest.hactive =3D
> > +			timing->h_addressable + timing->h_border_left + timing->h_border_ri=
ght;
> > +		pipes[pipe_cnt].pipe.dest.vactive =3D
> > +			timing->v_addressable + timing->v_border_top + timing->v_border_bot=
tom;
> > +		pipes[pipe_cnt].pipe.dest.interlaced =3D timing->flags.INTERLACE;
> > +		pipes[pipe_cnt].pipe.dest.pixel_rate_mhz =3D timing->pix_clk_100hz/1=
0000.0;
> > +		if (timing->timing_3d_format =3D=3D TIMING_3D_FORMAT_HW_FRAME_PACKIN=
G)
> > +			pipes[pipe_cnt].pipe.dest.pixel_rate_mhz *=3D 2;
> > +		pipes[pipe_cnt].pipe.dest.otg_inst =3D res_ctx->pipe_ctx[i].stream_r=
es.tg->inst;
> > +		pipes[pipe_cnt].dout.dp_lanes =3D 4;
> > +		pipes[pipe_cnt].dout.is_virtual =3D 0;
> > +		pipes[pipe_cnt].pipe.dest.vtotal_min =3D res_ctx->pipe_ctx[i].stream=
->adjust.v_total_min;
> > +		pipes[pipe_cnt].pipe.dest.vtotal_max =3D res_ctx->pipe_ctx[i].stream=
->adjust.v_total_max;
> > +		switch (get_num_odm_splits(&res_ctx->pipe_ctx[i])) {
> > +		case 1:
> > +			pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_combine_mode_2to1;
> > +			break;
> > +		case 3:
> > +			pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_combine_mode_4to1;
> > +			break;
> > +		default:
> > +			pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_combine_mode_disab=
led;
> > +		}
> > +		pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].pipe_id=
x;
> > +		if (res_ctx->pipe_ctx[i].top_pipe && res_ctx->pipe_ctx[i].top_pipe->=
plane_state
> > +				=3D=3D res_ctx->pipe_ctx[i].plane_state) {
> > +			struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i].top_pipe;
> > +			int split_idx =3D 0;
> > +
> > +			while (first_pipe->top_pipe && first_pipe->top_pipe->plane_state
> > +					=3D=3D res_ctx->pipe_ctx[i].plane_state) {
> > +				first_pipe =3D first_pipe->top_pipe;
> > +				split_idx++;
> > +			}
> > +			/* Treat 4to1 mpc combine as an mpo of 2 2-to-1 combines */
> > +			if (split_idx =3D=3D 0)
> > +				pipes[pipe_cnt].pipe.src.hsplit_grp =3D first_pipe->pipe_idx;
> > +			else if (split_idx =3D=3D 1)
> > +				pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].pipe_=
idx;
> > +			else if (split_idx =3D=3D 2)
> > +				pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].top_p=
ipe->pipe_idx;
> > +		} else if (res_ctx->pipe_ctx[i].prev_odm_pipe) {
> > +			struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i].prev_odm_pipe;
> > +
> > +			while (first_pipe->prev_odm_pipe)
> > +				first_pipe =3D first_pipe->prev_odm_pipe;
> > +			pipes[pipe_cnt].pipe.src.hsplit_grp =3D first_pipe->pipe_idx;
> > +		}
> > +
> > +		switch (res_ctx->pipe_ctx[i].stream->signal) {
> > +		case SIGNAL_TYPE_DISPLAY_PORT_MST:
> > +		case SIGNAL_TYPE_DISPLAY_PORT:
> > +			pipes[pipe_cnt].dout.output_type =3D dm_dp;
> > +			break;
> > +		case SIGNAL_TYPE_EDP:
> > +			pipes[pipe_cnt].dout.output_type =3D dm_edp;
> > +			break;
> > +		case SIGNAL_TYPE_HDMI_TYPE_A:
> > +		case SIGNAL_TYPE_DVI_SINGLE_LINK:
> > +		case SIGNAL_TYPE_DVI_DUAL_LINK:
> > +			pipes[pipe_cnt].dout.output_type =3D dm_hdmi;
> > +			break;
> > +		default:
> > +			/* In case there is no signal, set dp with 4 lanes to allow max con=
fig */
> > +			pipes[pipe_cnt].dout.is_virtual =3D 1;
> > +			pipes[pipe_cnt].dout.output_type =3D dm_dp;
> > +			pipes[pipe_cnt].dout.dp_lanes =3D 4;
> > +		}
> > +
> > +		switch (res_ctx->pipe_ctx[i].stream->timing.display_color_depth) {
> > +		case COLOR_DEPTH_666:
> > +			output_bpc =3D 6;
> > +			break;
> > +		case COLOR_DEPTH_888:
> > +			output_bpc =3D 8;
> > +			break;
> > +		case COLOR_DEPTH_101010:
> > +			output_bpc =3D 10;
> > +			break;
> > +		case COLOR_DEPTH_121212:
> > +			output_bpc =3D 12;
> > +			break;
> > +		case COLOR_DEPTH_141414:
> > +			output_bpc =3D 14;
> > +			break;
> > +		case COLOR_DEPTH_161616:
> > +			output_bpc =3D 16;
> > +			break;
> > +		case COLOR_DEPTH_999:
> > +			output_bpc =3D 9;
> > +			break;
> > +		case COLOR_DEPTH_111111:
> > +			output_bpc =3D 11;
> > +			break;
> > +		default:
> > +			output_bpc =3D 8;
> > +			break;
> > +		}
> > +
> > +		switch (res_ctx->pipe_ctx[i].stream->timing.pixel_encoding) {
> > +		case PIXEL_ENCODING_RGB:
> > +		case PIXEL_ENCODING_YCBCR444:
> > +			pipes[pipe_cnt].dout.output_format =3D dm_444;
> > +			pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
> > +			break;
> > +		case PIXEL_ENCODING_YCBCR420:
> > +			pipes[pipe_cnt].dout.output_format =3D dm_420;
> > +			pipes[pipe_cnt].dout.output_bpp =3D (output_bpc * 3.0) / 2;
> > +			break;
> > +		case PIXEL_ENCODING_YCBCR422:
> > +			if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC &&
> > +			    !res_ctx->pipe_ctx[i].stream->timing.dsc_cfg.ycbcr422_simple)
> > +				pipes[pipe_cnt].dout.output_format =3D dm_n422;
> > +			else
> > +				pipes[pipe_cnt].dout.output_format =3D dm_s422;
> > +			pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 2;
> > +			break;
> > +		default:
> > +			pipes[pipe_cnt].dout.output_format =3D dm_444;
> > +			pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
> > +		}
> > +
> > +		if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC)
> > +			pipes[pipe_cnt].dout.output_bpp =3D res_ctx->pipe_ctx[i].stream->ti=
ming.dsc_cfg.bits_per_pixel / 16.0;
> > +
> > +		/* todo: default max for now, until there is logic reflecting this i=
n dc*/
> > +		pipes[pipe_cnt].dout.dsc_input_bpc =3D 12;
> > +		/*fill up the audio sample rate (unit in kHz)*/
> > +		get_audio_check(&res_ctx->pipe_ctx[i].stream->audio_info, &aud_check=
);
> > +		pipes[pipe_cnt].dout.max_audio_sample_rate =3D aud_check.max_audiosa=
mple_rate / 1000;
> > +		/*
> > +		 * For graphic plane, cursor number is 1, nv12 is 0
> > +		 * bw calculations due to cursor on/off
> > +		 */
> > +		if (res_ctx->pipe_ctx[i].plane_state &&
> > +				res_ctx->pipe_ctx[i].plane_state->address.type =3D=3D PLN_ADDR_TYP=
E_VIDEO_PROGRESSIVE)
> > +			pipes[pipe_cnt].pipe.src.num_cursors =3D 0;
> > +		else
> > +			pipes[pipe_cnt].pipe.src.num_cursors =3D dc->dml.ip.number_of_curso=
rs;
> > +
> > +		pipes[pipe_cnt].pipe.src.cur0_src_width =3D 256;
> > +		pipes[pipe_cnt].pipe.src.cur0_bpp =3D dm_cur_32bit;
> > +
> > +		if (!res_ctx->pipe_ctx[i].plane_state) {
> > +			pipes[pipe_cnt].pipe.src.is_hsplit =3D pipes[pipe_cnt].pipe.dest.od=
m_combine !=3D dm_odm_combine_mode_disabled;
> > +			pipes[pipe_cnt].pipe.src.source_scan =3D dm_horz;
> > +			pipes[pipe_cnt].pipe.src.sw_mode =3D dm_sw_4kb_s;
> > +			pipes[pipe_cnt].pipe.src.macro_tile_size =3D dm_64k_tile;
> > +			pipes[pipe_cnt].pipe.src.viewport_width =3D timing->h_addressable;
> > +			if (pipes[pipe_cnt].pipe.src.viewport_width > 1920)
> > +				pipes[pipe_cnt].pipe.src.viewport_width =3D 1920;
> > +			pipes[pipe_cnt].pipe.src.viewport_height =3D timing->v_addressable;
> > +			if (pipes[pipe_cnt].pipe.src.viewport_height > 1080)
> > +				pipes[pipe_cnt].pipe.src.viewport_height =3D 1080;
> > +			pipes[pipe_cnt].pipe.src.surface_height_y =3D pipes[pipe_cnt].pipe.=
src.viewport_height;
> > +			pipes[pipe_cnt].pipe.src.surface_width_y =3D pipes[pipe_cnt].pipe.s=
rc.viewport_width;
> > +			pipes[pipe_cnt].pipe.src.surface_height_c =3D pipes[pipe_cnt].pipe.=
src.viewport_height;
> > +			pipes[pipe_cnt].pipe.src.surface_width_c =3D pipes[pipe_cnt].pipe.s=
rc.viewport_width;
> > +			pipes[pipe_cnt].pipe.src.data_pitch =3D ((pipes[pipe_cnt].pipe.src.=
viewport_width + 255) / 256) * 256;
> > +			pipes[pipe_cnt].pipe.src.source_format =3D dm_444_32;
> > +			pipes[pipe_cnt].pipe.dest.recout_width =3D pipes[pipe_cnt].pipe.src=
=2Eviewport_width; /*vp_width/hratio*/
> > +			pipes[pipe_cnt].pipe.dest.recout_height =3D pipes[pipe_cnt].pipe.sr=
c.viewport_height; /*vp_height/vratio*/
> > +			pipes[pipe_cnt].pipe.dest.full_recout_width =3D pipes[pipe_cnt].pip=
e.dest.recout_width;  /*when is_hsplit !=3D 1*/
> > +			pipes[pipe_cnt].pipe.dest.full_recout_height =3D pipes[pipe_cnt].pi=
pe.dest.recout_height; /*when is_hsplit !=3D 1*/
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =3D 1.0;
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =3D 1.0;
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =3D 0; /*Lb only =
or Full scl*/
> > +			pipes[pipe_cnt].pipe.scale_taps.htaps =3D 1;
> > +			pipes[pipe_cnt].pipe.scale_taps.vtaps =3D 1;
> > +			pipes[pipe_cnt].pipe.dest.vtotal_min =3D v_total;
> > +			pipes[pipe_cnt].pipe.dest.vtotal_max =3D v_total;
> > +
> > +			if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mod=
e_2to1) {
> > +				pipes[pipe_cnt].pipe.src.viewport_width /=3D 2;
> > +				pipes[pipe_cnt].pipe.dest.recout_width /=3D 2;
> > +			} else if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_comb=
ine_mode_4to1) {
> > +				pipes[pipe_cnt].pipe.src.viewport_width /=3D 4;
> > +				pipes[pipe_cnt].pipe.dest.recout_width /=3D 4;
> > +			}
> > +		} else {
> > +			struct dc_plane_state *pln =3D res_ctx->pipe_ctx[i].plane_state;
> > +			struct scaler_data *scl =3D &res_ctx->pipe_ctx[i].plane_res.scl_dat=
a;
> > +
> > +			pipes[pipe_cnt].pipe.src.immediate_flip =3D pln->flip_immediate;
> > +			pipes[pipe_cnt].pipe.src.is_hsplit =3D (res_ctx->pipe_ctx[i].bottom=
_pipe && res_ctx->pipe_ctx[i].bottom_pipe->plane_state =3D=3D pln)
> > +					|| (res_ctx->pipe_ctx[i].top_pipe && res_ctx->pipe_ctx[i].top_pip=
e->plane_state =3D=3D pln)
> > +					|| pipes[pipe_cnt].pipe.dest.odm_combine !=3D dm_odm_combine_mode=
_disabled;
> > +
> > +			/* stereo is not split */
> > +			if (pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_SIDE_BY_SIDE ||
> > +			    pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_TOP_AND_BOTTOM) {
> > +				pipes[pipe_cnt].pipe.src.is_hsplit =3D false;
> > +				pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i].pipe_=
idx;
> > +			}
> > +
> > +			pipes[pipe_cnt].pipe.src.source_scan =3D pln->rotation =3D=3D ROTAT=
ION_ANGLE_90
> > +					|| pln->rotation =3D=3D ROTATION_ANGLE_270 ? dm_vert : dm_horz;
> > +			pipes[pipe_cnt].pipe.src.viewport_y_y =3D scl->viewport.y;
> > +			pipes[pipe_cnt].pipe.src.viewport_y_c =3D scl->viewport_c.y;
> > +			pipes[pipe_cnt].pipe.src.viewport_width =3D scl->viewport.width;
> > +			pipes[pipe_cnt].pipe.src.viewport_width_c =3D scl->viewport_c.width;
> > +			pipes[pipe_cnt].pipe.src.viewport_height =3D scl->viewport.height;
> > +			pipes[pipe_cnt].pipe.src.viewport_height_c =3D scl->viewport_c.heig=
ht;
> > +			pipes[pipe_cnt].pipe.src.viewport_width_max =3D pln->src_rect.width;
> > +			pipes[pipe_cnt].pipe.src.viewport_height_max =3D pln->src_rect.heig=
ht;
> > +			pipes[pipe_cnt].pipe.src.surface_width_y =3D pln->plane_size.surfac=
e_size.width;
> > +			pipes[pipe_cnt].pipe.src.surface_height_y =3D pln->plane_size.surfa=
ce_size.height;
> > +			pipes[pipe_cnt].pipe.src.surface_width_c =3D pln->plane_size.chroma=
_size.width;
> > +			pipes[pipe_cnt].pipe.src.surface_height_c =3D pln->plane_size.chrom=
a_size.height;
> > +			if (pln->format =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA
> > +					|| pln->format >=3D SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
> > +				pipes[pipe_cnt].pipe.src.data_pitch =3D pln->plane_size.surface_pi=
tch;
> > +				pipes[pipe_cnt].pipe.src.data_pitch_c =3D pln->plane_size.chroma_p=
itch;
> > +				pipes[pipe_cnt].pipe.src.meta_pitch =3D pln->dcc.meta_pitch;
> > +				pipes[pipe_cnt].pipe.src.meta_pitch_c =3D pln->dcc.meta_pitch_c;
> > +			} else {
> > +				pipes[pipe_cnt].pipe.src.data_pitch =3D pln->plane_size.surface_pi=
tch;
> > +				pipes[pipe_cnt].pipe.src.meta_pitch =3D pln->dcc.meta_pitch;
> > +			}
> > +			pipes[pipe_cnt].pipe.src.dcc =3D pln->dcc.enable;
> > +			pipes[pipe_cnt].pipe.dest.recout_width =3D scl->recout.width;
> > +			pipes[pipe_cnt].pipe.dest.recout_height =3D scl->recout.height;
> > +			pipes[pipe_cnt].pipe.dest.full_recout_height =3D scl->recout.height;
> > +			pipes[pipe_cnt].pipe.dest.full_recout_width =3D scl->recout.width;
> > +			if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mod=
e_2to1)
> > +				pipes[pipe_cnt].pipe.dest.full_recout_width *=3D 2;
> > +			else if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combin=
e_mode_4to1)
> > +				pipes[pipe_cnt].pipe.dest.full_recout_width *=3D 4;
> > +			else {
> > +				struct pipe_ctx *split_pipe =3D res_ctx->pipe_ctx[i].bottom_pipe;
> > +
> > +				while (split_pipe && split_pipe->plane_state =3D=3D pln) {
> > +					pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe->plan=
e_res.scl_data.recout.width;
> > +					split_pipe =3D split_pipe->bottom_pipe;
> > +				}
> > +				split_pipe =3D res_ctx->pipe_ctx[i].top_pipe;
> > +				while (split_pipe && split_pipe->plane_state =3D=3D pln) {
> > +					pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe->plan=
e_res.scl_data.recout.width;
> > +					split_pipe =3D split_pipe->top_pipe;
> > +				}
> > +			}
> > +
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =3D (double) scl-=
>ratios.horz.value / (1ULL<<32);
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio_c =3D (double) sc=
l->ratios.horz_c.value / (1ULL<<32);
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =3D (double) scl-=
>ratios.vert.value / (1ULL<<32);
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio_c =3D (double) sc=
l->ratios.vert_c.value / (1ULL<<32);
> > +			pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =3D
> > +					scl->ratios.vert.value !=3D dc_fixpt_one.value
> > +					|| scl->ratios.horz.value !=3D dc_fixpt_one.value
> > +					|| scl->ratios.vert_c.value !=3D dc_fixpt_one.value
> > +					|| scl->ratios.horz_c.value !=3D dc_fixpt_one.value /*Lb only or =
Full scl*/
> > +					|| dc->debug.always_scale; /*support always scale*/
> > +			pipes[pipe_cnt].pipe.scale_taps.htaps =3D scl->taps.h_taps;
> > +			pipes[pipe_cnt].pipe.scale_taps.htaps_c =3D scl->taps.h_taps_c;
> > +			pipes[pipe_cnt].pipe.scale_taps.vtaps =3D scl->taps.v_taps;
> > +			pipes[pipe_cnt].pipe.scale_taps.vtaps_c =3D scl->taps.v_taps_c;
> > +
> > +			pipes[pipe_cnt].pipe.src.macro_tile_size =3D
> > +					swizzle_mode_to_macro_tile_size(pln->tiling_info.gfx9.swizzle);
> > +			swizzle_to_dml_params(pln->tiling_info.gfx9.swizzle,
> > +					&pipes[pipe_cnt].pipe.src.sw_mode);
> > +
> > +			switch (pln->format) {
> > +			case SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr:
> > +			case SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb:
> > +				pipes[pipe_cnt].pipe.src.source_format =3D dm_420_8;
> > +				break;
> > +			case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCbCr:
> > +			case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb:
> > +				pipes[pipe_cnt].pipe.src.source_format =3D dm_420_10;
> > +				break;
> > +			case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
> > +			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
> > +			case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
> > +			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
> > +				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_64;
> > +				break;
> > +			case SURFACE_PIXEL_FORMAT_GRPH_ARGB1555:
> > +			case SURFACE_PIXEL_FORMAT_GRPH_RGB565:
> > +				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_16;
> > +				break;
> > +			case SURFACE_PIXEL_FORMAT_GRPH_PALETA_256_COLORS:
> > +				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_8;
> > +				break;
> > +			case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
> > +				pipes[pipe_cnt].pipe.src.source_format =3D dm_rgbe_alpha;
> > +				break;
> > +			default:
> > +				pipes[pipe_cnt].pipe.src.source_format =3D dm_444_32;
> > +				break;
> > +			}
> > +		}
> > +
> > +		pipe_cnt++;
> > +	}
> > +
> > +	/* populate writeback information */
> > +	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx,=
 pipes);
> > +
> > +	return pipe_cnt;
> > +}
> > +
> > +void dcn20_calculate_wm(struct dc *dc, struct dc_state *context,
> > +			display_e2e_pipe_params_st *pipes,
> > +			int *out_pipe_cnt,
> > +			int *pipe_split_from,
> > +			int vlevel,
> > +			bool fast_validate)
> > +{
> > +	int pipe_cnt, i, pipe_idx;
> > +
> > +	dc_assert_fp_enabled();
> > +
> > +	for (i =3D 0, pipe_idx =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pipe_=
count; i++) {
> > +		if (!context->res_ctx.pipe_ctx[i].stream)
> > +			continue;
> > +
> > +		pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_clocks.dch=
ub_ref_clock_inKhz / 1000.0;
> > +		pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->bw_ctx.dml.vba.Req=
uiredDISPCLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
> > +
> > +		if (pipe_split_from[i] < 0) {
> > +			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
> > +					context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context->bw_ctx.dm=
l.vba.maxMpcComb][pipe_idx];
> > +			if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_idx] =3D=3D pipe=
_idx)
> > +				pipes[pipe_cnt].pipe.dest.odm_combine =3D
> > +						context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_idx];
> > +			else
> > +				pipes[pipe_cnt].pipe.dest.odm_combine =3D 0;
> > +			pipe_idx++;
> > +		} else {
> > +			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
> > +					context->bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context->bw_ctx.dm=
l.vba.maxMpcComb][pipe_split_from[i]];
> > +			if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_split_from[i]] =
=3D=3D pipe_split_from[i])
> > +				pipes[pipe_cnt].pipe.dest.odm_combine =3D
> > +						context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_split_from[i]];
> > +			else
> > +				pipes[pipe_cnt].pipe.dest.odm_combine =3D 0;
> > +		}
> > +
> > +		if (dc->config.forced_clocks) {
> > +			pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[0].dispclk_mhz;
> > +			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D context->bw_ctx.dml.soc.clo=
ck_limits[0].dppclk_mhz;
> > +		}
> > +		if (dc->debug.min_disp_clk_khz > pipes[pipe_cnt].clks_cfg.dispclk_mh=
z * 1000)
> > +			pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D dc->debug.min_disp_clk_khz=
 / 1000.0;
> > +		if (dc->debug.min_dpp_clk_khz > pipes[pipe_cnt].clks_cfg.dppclk_mhz =
* 1000)
> > +			pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D dc->debug.min_dpp_clk_khz /=
 1000.0;
> > +
> > +		pipe_cnt++;
> > +	}
> > +
> > +	if (pipe_cnt !=3D pipe_idx) {
> > +		if (dc->res_pool->funcs->populate_dml_pipes)
> > +			pipe_cnt =3D dc->res_pool->funcs->populate_dml_pipes(dc,
> > +				context, pipes, fast_validate);
> > +		else
> > +			pipe_cnt =3D dcn20_populate_dml_pipes_from_context(dc,
> > +				context, pipes, fast_validate);
> > +	}
> > +
> > +	*out_pipe_cnt =3D pipe_cnt;
> > +
> > +	pipes[0].clks_cfg.voltage =3D vlevel;
> > +	pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].dcfclk_mhz;
> > +	pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].socclk_mhz;
> > +
> > +	/* only pipe 0 is read for voltage and dcf/soc clocks */
> > +	if (vlevel < 1) {
> > +		pipes[0].clks_cfg.voltage =3D 1;
> > +		pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[1].dcfclk_mhz;
> > +		pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[1].socclk_mhz;
> > +	}
> > +	context->bw_ctx.bw.dcn.watermarks.b.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.b.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns =3D get_urgent_=
latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +
> > +	if (vlevel < 2) {
> > +		pipes[0].clks_cfg.voltage =3D 2;
> > +		pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].dcfclk_mhz;
> > +		pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].socclk_mhz;
> > +	}
> > +	context->bw_ctx.bw.dcn.watermarks.c.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.c.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +
> > +	if (vlevel < 3) {
> > +		pipes[0].clks_cfg.voltage =3D 3;
> > +		pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].dcfclk_mhz;
> > +		pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limit=
s[2].socclk_mhz;
> > +	}
> > +	context->bw_ctx.bw.dcn.watermarks.d.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.d.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +
> > +	pipes[0].clks_cfg.voltage =3D vlevel;
> > +	pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].dcfclk_mhz;
> > +	pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limits=
[vlevel].socclk_mhz;
> > +	context->bw_ctx.bw.dcn.watermarks.a.urgent_ns =3D get_wm_urgent(&cont=
ext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_enter_plus_e=
xit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_exit_ns =3D =
get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.a.pte_meta_urgent_ns =3D get_wm_mem=
ory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_nom =3D get_fraction_=
of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +	context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip =3D get_fraction=
_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
> > +}
> > +
> > +void dcn20_update_bounding_box(struct dc *dc,
> > +			       struct _vcs_dpi_soc_bounding_box_st *bb,
> > +			       struct pp_smu_nv_clock_table *max_clocks,
> > +			       unsigned int *uclk_states,
> > +			       unsigned int num_states)
> > +{
> > +	struct _vcs_dpi_voltage_scaling_st calculated_states[DC__VOLTAGE_STAT=
ES];
> > +	int i;
> > +	int num_calculated_states =3D 0;
> > +	int min_dcfclk =3D 0;
> > +
> > +	dc_assert_fp_enabled();
> > +
> > +	if (num_states =3D=3D 0)
> > +		return;
> > +
> > +	memset(calculated_states, 0, sizeof(calculated_states));
> > +
> > +	if (dc->bb_overrides.min_dcfclk_mhz > 0)
> > +		min_dcfclk =3D dc->bb_overrides.min_dcfclk_mhz;
> > +	else {
> > +		if (ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev))
> > +			min_dcfclk =3D 310;
> > +		else
> > +			// Accounting for SOC/DCF relationship, we can go as high as
> > +			// 506Mhz in Vmin.
> > +			min_dcfclk =3D 506;
> > +	}
> > +
> > +	for (i =3D 0; i < num_states; i++) {
> > +		int min_fclk_required_by_uclk;
> > +		calculated_states[i].state =3D i;
> > +		calculated_states[i].dram_speed_mts =3D uclk_states[i] * 16 / 1000;
> > +
> > +		// FCLK:UCLK ratio is 1.08
> > +		min_fclk_required_by_uclk =3D div_u64(((unsigned long long)uclk_stat=
es[i]) * 1080,
> > +			1000000);
> > +
> > +		calculated_states[i].fabricclk_mhz =3D (min_fclk_required_by_uclk < =
min_dcfclk) ?
> > +				min_dcfclk : min_fclk_required_by_uclk;
> > +
> > +		calculated_states[i].socclk_mhz =3D (calculated_states[i].fabricclk_=
mhz > max_clocks->socClockInKhz / 1000) ?
> > +				max_clocks->socClockInKhz / 1000 : calculated_states[i].fabricclk_=
mhz;
> > +
> > +		calculated_states[i].dcfclk_mhz =3D (calculated_states[i].fabricclk_=
mhz > max_clocks->dcfClockInKhz / 1000) ?
> > +				max_clocks->dcfClockInKhz / 1000 : calculated_states[i].fabricclk_=
mhz;
> > +
> > +		calculated_states[i].dispclk_mhz =3D max_clocks->displayClockInKhz /=
 1000;
> > +		calculated_states[i].dppclk_mhz =3D max_clocks->displayClockInKhz / =
1000;
> > +		calculated_states[i].dscclk_mhz =3D max_clocks->displayClockInKhz / =
(1000 * 3);
> > +
> > +		calculated_states[i].phyclk_mhz =3D max_clocks->phyClockInKhz / 1000;
> > +
> > +		num_calculated_states++;
> > +	}
> > +
> > +	calculated_states[num_calculated_states - 1].socclk_mhz =3D max_clock=
s->socClockInKhz / 1000;
> > +	calculated_states[num_calculated_states - 1].fabricclk_mhz =3D max_cl=
ocks->socClockInKhz / 1000;
> > +	calculated_states[num_calculated_states - 1].dcfclk_mhz =3D max_clock=
s->dcfClockInKhz / 1000;
> > +
> > +	memcpy(bb->clock_limits, calculated_states, sizeof(bb->clock_limits));
> > +	bb->num_states =3D num_calculated_states;
> > +
> > +	// Duplicate the last state, DML always an extra state identical to m=
ax state to work
> > +	memcpy(&bb->clock_limits[num_calculated_states], &bb->clock_limits[nu=
m_calculated_states - 1], sizeof(struct _vcs_dpi_voltage_scaling_st));
> > +	bb->clock_limits[num_calculated_states].state =3D bb->num_states;
> > +}
> > +
> > +void dcn20_cap_soc_clocks(struct _vcs_dpi_soc_bounding_box_st *bb,
> > +			  struct pp_smu_nv_clock_table max_clocks)
> > +{
> > +	int i;
> > +
> > +	dc_assert_fp_enabled();
> > +
> > +	// First pass - cap all clocks higher than the reported max
> > +	for (i =3D 0; i < bb->num_states; i++) {
> > +		if ((bb->clock_limits[i].dcfclk_mhz > (max_clocks.dcfClockInKhz / 10=
00))
> > +				&& max_clocks.dcfClockInKhz !=3D 0)
> > +			bb->clock_limits[i].dcfclk_mhz =3D (max_clocks.dcfClockInKhz / 1000=
);
> > +
> > +		if ((bb->clock_limits[i].dram_speed_mts > (max_clocks.uClockInKhz / =
1000) * 16)
> > +						&& max_clocks.uClockInKhz !=3D 0)
> > +			bb->clock_limits[i].dram_speed_mts =3D (max_clocks.uClockInKhz / 10=
00) * 16;
> > +
> > +		if ((bb->clock_limits[i].fabricclk_mhz > (max_clocks.fabricClockInKh=
z / 1000))
> > +						&& max_clocks.fabricClockInKhz !=3D 0)
> > +			bb->clock_limits[i].fabricclk_mhz =3D (max_clocks.fabricClockInKhz =
/ 1000);
> > +
> > +		if ((bb->clock_limits[i].dispclk_mhz > (max_clocks.displayClockInKhz=
 / 1000))
> > +						&& max_clocks.displayClockInKhz !=3D 0)
> > +			bb->clock_limits[i].dispclk_mhz =3D (max_clocks.displayClockInKhz /=
 1000);
> > +
> > +		if ((bb->clock_limits[i].dppclk_mhz > (max_clocks.dppClockInKhz / 10=
00))
> > +						&& max_clocks.dppClockInKhz !=3D 0)
> > +			bb->clock_limits[i].dppclk_mhz =3D (max_clocks.dppClockInKhz / 1000=
);
> > +
> > +		if ((bb->clock_limits[i].phyclk_mhz > (max_clocks.phyClockInKhz / 10=
00))
> > +						&& max_clocks.phyClockInKhz !=3D 0)
> > +			bb->clock_limits[i].phyclk_mhz =3D (max_clocks.phyClockInKhz / 1000=
);
> > +
> > +		if ((bb->clock_limits[i].socclk_mhz > (max_clocks.socClockInKhz / 10=
00))
> > +						&& max_clocks.socClockInKhz !=3D 0)
> > +			bb->clock_limits[i].socclk_mhz =3D (max_clocks.socClockInKhz / 1000=
);
> > +
> > +		if ((bb->clock_limits[i].dscclk_mhz > (max_clocks.dscClockInKhz / 10=
00))
> > +						&& max_clocks.dscClockInKhz !=3D 0)
> > +			bb->clock_limits[i].dscclk_mhz =3D (max_clocks.dscClockInKhz / 1000=
);
> > +	}
> > +
> > +	// Second pass - remove all duplicate clock states
> > +	for (i =3D bb->num_states - 1; i > 1; i--) {
> > +		bool duplicate =3D true;
> > +
> > +		if (bb->clock_limits[i-1].dcfclk_mhz !=3D bb->clock_limits[i].dcfclk=
_mhz)
> > +			duplicate =3D false;
> > +		if (bb->clock_limits[i-1].dispclk_mhz !=3D bb->clock_limits[i].dispc=
lk_mhz)
> > +			duplicate =3D false;
> > +		if (bb->clock_limits[i-1].dppclk_mhz !=3D bb->clock_limits[i].dppclk=
_mhz)
> > +			duplicate =3D false;
> > +		if (bb->clock_limits[i-1].dram_speed_mts !=3D bb->clock_limits[i].dr=
am_speed_mts)
> > +			duplicate =3D false;
> > +		if (bb->clock_limits[i-1].dscclk_mhz !=3D bb->clock_limits[i].dscclk=
_mhz)
> > +			duplicate =3D false;
> > +		if (bb->clock_limits[i-1].fabricclk_mhz !=3D bb->clock_limits[i].fab=
ricclk_mhz)
> > +			duplicate =3D false;
> > +		if (bb->clock_limits[i-1].phyclk_mhz !=3D bb->clock_limits[i].phyclk=
_mhz)
> > +			duplicate =3D false;
> > +		if (bb->clock_limits[i-1].socclk_mhz !=3D bb->clock_limits[i].socclk=
_mhz)
> > +			duplicate =3D false;
> > +
> > +		if (duplicate)
> > +			bb->num_states--;
> > +	}
> > +}
> > +
> > +void dcn20_patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bound=
ing_box_st *bb)
> > +{
> > +	dc_assert_fp_enabled();
> > +
> > +	if ((int)(bb->sr_exit_time_us * 1000) !=3D dc->bb_overrides.sr_exit_t=
ime_ns
> > +			&& dc->bb_overrides.sr_exit_time_ns) {
> > +		bb->sr_exit_time_us =3D dc->bb_overrides.sr_exit_time_ns / 1000.0;
> > +	}
> > +
> > +	if ((int)(bb->sr_enter_plus_exit_time_us * 1000)
> > +				!=3D dc->bb_overrides.sr_enter_plus_exit_time_ns
> > +			&& dc->bb_overrides.sr_enter_plus_exit_time_ns) {
> > +		bb->sr_enter_plus_exit_time_us =3D
> > +				dc->bb_overrides.sr_enter_plus_exit_time_ns / 1000.0;
> > +	}
> > +
> > +	if ((int)(bb->urgent_latency_us * 1000) !=3D dc->bb_overrides.urgent_=
latency_ns
> > +			&& dc->bb_overrides.urgent_latency_ns) {
> > +		bb->urgent_latency_us =3D dc->bb_overrides.urgent_latency_ns / 1000.=
0;
> > +	}
> > +
> > +	if ((int)(bb->dram_clock_change_latency_us * 1000)
> > +				!=3D dc->bb_overrides.dram_clock_change_latency_ns
> > +			&& dc->bb_overrides.dram_clock_change_latency_ns) {
> > +		bb->dram_clock_change_latency_us =3D
> > +				dc->bb_overrides.dram_clock_change_latency_ns / 1000.0;
> > +	}
> > +
> > +	if ((int)(bb->dummy_pstate_latency_us * 1000)
> > +				!=3D dc->bb_overrides.dummy_clock_change_latency_ns
> > +			&& dc->bb_overrides.dummy_clock_change_latency_ns) {
> > +		bb->dummy_pstate_latency_us =3D
> > +				dc->bb_overrides.dummy_clock_change_latency_ns / 1000.0;
> > +	}
> > +}
> > +
> > +static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc=
_state *context,
> > +		bool fast_validate)
> > +{
> > +	bool out =3D false;
> > +
> > +	BW_VAL_TRACE_SETUP();
> > +
> > +	int vlevel =3D 0;
> > +	int pipe_split_from[MAX_PIPES];
> > +	int pipe_cnt =3D 0;
> > +	display_e2e_pipe_params_st *pipes =3D kzalloc(dc->res_pool->pipe_coun=
t * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
> > +	DC_LOGGER_INIT(dc->ctx->logger);
> > +
> > +	BW_VAL_TRACE_COUNT();
> > +
> > +	out =3D dcn20_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_sp=
lit_from, &vlevel, fast_validate);
> > +
> > +	if (pipe_cnt =3D=3D 0)
> > +		goto validate_out;
> > +
> > +	if (!out)
> > +		goto validate_fail;
> > +
> > +	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
> > +
> > +	if (fast_validate) {
> > +		BW_VAL_TRACE_SKIP(fast);
> > +		goto validate_out;
> > +	}
> > +
> > +	dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vl=
evel, fast_validate);
> > +	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
> > +
> > +	BW_VAL_TRACE_END_WATERMARKS();
> > +
> > +	goto validate_out;
> > +
> > +validate_fail:
> > +	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
> > +		dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[cont=
ext->bw_ctx.dml.vba.soc.num_states]));
> > +
> > +	BW_VAL_TRACE_SKIP(fail);
> > +	out =3D false;
> > +
> > +validate_out:
> > +	kfree(pipes);
> > +
> > +	BW_VAL_TRACE_FINISH();
> > +
> > +	return out;
> > +}
> > +
> > +bool dcn20_validate_bandwidth_fp(struct dc *dc,
> > +				 struct dc_state *context,
> > +				 bool fast_validate)
> > +{
> > +	bool voltage_supported =3D false;
> > +	bool full_pstate_supported =3D false;
> > +	bool dummy_pstate_supported =3D false;
> > +	double p_state_latency_us;
> > +
> > +	dc_assert_fp_enabled();
> > +
> > +	p_state_latency_us =3D context->bw_ctx.dml.soc.dram_clock_change_late=
ncy_us;
> > +	context->bw_ctx.dml.soc.disable_dram_clock_change_vactive_support =3D
> > +		dc->debug.disable_dram_clock_change_vactive_support;
> > +	context->bw_ctx.dml.soc.allow_dram_clock_one_display_vactive =3D
> > +		dc->debug.enable_dram_clock_change_one_display_vactive;
> > +
> > +	/*Unsafe due to current pipe merge and split logic*/
> > +	ASSERT(context !=3D dc->current_state);
> > +
> > +	if (fast_validate) {
> > +		return dcn20_validate_bandwidth_internal(dc, context, true);
> > +	}
> > +
> > +	// Best case, we support full UCLK switch latency
> > +	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, =
false);
> > +	full_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change_s=
upport;
> > +
> > +	if (context->bw_ctx.dml.soc.dummy_pstate_latency_us =3D=3D 0 ||
> > +		(voltage_supported && full_pstate_supported)) {
> > +		context->bw_ctx.bw.dcn.clk.p_state_change_support =3D full_pstate_su=
pported;
> > +		goto restore_dml_state;
> > +	}
> > +
> > +	// Fallback: Try to only support G6 temperature read latency
> > +	context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D context->bw_=
ctx.dml.soc.dummy_pstate_latency_us;
> > +
> > +	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, =
false);
> > +	dummy_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change_=
support;
> > +
> > +	if (voltage_supported && (dummy_pstate_supported || !(context->stream=
_count))) {
> > +		context->bw_ctx.bw.dcn.clk.p_state_change_support =3D false;
> > +		goto restore_dml_state;
> > +	}
> > +
> > +	// ERROR: fallback is supposed to always work.
> > +	ASSERT(false);
> > +
> > +restore_dml_state:
> > +	context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D p_state_late=
ncy_us;
> > +	return voltage_supported;
> > +}
> > +
> > +void dcn20_fpu_set_wm_ranges(int i,
> > +			     struct pp_smu_wm_range_sets *ranges,
> > +			     struct _vcs_dpi_soc_bounding_box_st *loaded_bb)
> > +{
> > +	dc_assert_fp_enabled();
> > +
> > +	ranges->reader_wm_sets[i].min_fill_clk_mhz =3D (i > 0) ? (loaded_bb->=
clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
> > +	ranges->reader_wm_sets[i].max_fill_clk_mhz =3D loaded_bb->clock_limit=
s[i].dram_speed_mts / 16;
> > +}
> > +
> > +void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
> > +			     int vlevel,
> > +			     int max_mpc_comb,
> > +			     int pipe_idx,
> > +			     bool is_validating_bw)
> > +{
> > +	dc_assert_fp_enabled();
> > +
> > +	if (is_validating_bw)
> > +		v->RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] *=3D 2;
> > +	else
> > +		v->RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] /=3D 2;
> > +}
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/dri=
vers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
> > index 36f26126d574..6b1f4126bc88 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
> > @@ -23,6 +23,7 @@
> >    * Authors: AMD
> >    *
> >    */
> > +#include "core_types.h"
> >   #ifndef __DCN20_FPU_H__
> >   #define __DCN20_FPU_H__
> > @@ -30,5 +31,44 @@
> >   void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> >   					       struct resource_context *res_ctx,
> >   					       display_e2e_pipe_params_st *pipes);
> > -
> > +void dcn20_fpu_set_wb_arb_params(struct mcif_arb_params *wb_arb_params,
> > +				 struct dc_state *context,
> > +				 display_e2e_pipe_params_st *pipes,
> > +				 int pipe_cnt, int i);
> > +void dcn20_calculate_dlg_params(struct dc *dc,
> > +				struct dc_state *context,
> > +				display_e2e_pipe_params_st *pipes,
> > +				int pipe_cnt,
> > +				int vlevel);
> > +int dcn20_populate_dml_pipes_from_context(struct dc *dc,
> > +					  struct dc_state *context,
> > +					  display_e2e_pipe_params_st *pipes,
> > +					  bool fast_validate);
> > +void dcn20_calculate_wm(struct dc *dc,
> > +			struct dc_state *context,
> > +			display_e2e_pipe_params_st *pipes,
> > +			int *out_pipe_cnt,
> > +			int *pipe_split_from,
> > +			int vlevel,
> > +			bool fast_validate);
> > +void dcn20_cap_soc_clocks(struct _vcs_dpi_soc_bounding_box_st *bb,
> > +			  struct pp_smu_nv_clock_table max_clocks);
> > +void dcn20_update_bounding_box(struct dc *dc,
> > +			       struct _vcs_dpi_soc_bounding_box_st *bb,
> > +			       struct pp_smu_nv_clock_table *max_clocks,
> > +			       unsigned int *uclk_states,
> > +			       unsigned int num_states);
> > +void dcn20_patch_bounding_box(struct dc *dc,
> > +			      struct _vcs_dpi_soc_bounding_box_st *bb);
> > +bool dcn20_validate_bandwidth_fp(struct dc *dc,
> > +				 struct dc_state *context,
> > +				 bool fast_validate);
> > +void dcn20_fpu_set_wm_ranges(int i,
> > +			     struct pp_smu_wm_range_sets *ranges,
> > +			     struct _vcs_dpi_soc_bounding_box_st *loaded_bb);
> > +void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
> > +			     int vlevel,
> > +			     int max_mpc_comb,
> > +			     int pipe_idx,
> > +			     bool is_validating_bw);
> >   #endif /* __DCN20_FPU_H__ */
>=20
> Hi Melissa,
>=20
> First of all, thanks a lot for helping with this FPU isolation effort. Th=
is
> patch lgtm, and I also tested it in a device based on DCN20, and apparent=
ly,
> everything is ok.
>=20
> Since this is a large patch that can impact multiple ASICs, it gives us a
> little time to run some IGT and manual tests to ensure that we do not
> introduce any regression. Meanwhile, how about making another patch to
> isolate DCN21 and maybe another one for DCN10?

Hi Siqueira,

Thanks for the feedback.
Ok, I see. So, in the meanwhile, I'll work on a patchset to dcn21 and
dcn10.

Best Regards,

Melissa

>=20
> Jas, Lilian,
>=20
> Could you also take some minutes to review this patch?
>=20
> Jas,
>=20
> Could you backport it in order to run it in our CI? I checked the
> compilation with DCN and without it, and it worked for me.
>=20
> Best Regards
> Siqueira
>=20
>=20
>=20
>=20
>=20

--cwwzzjaipkcuaexy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmIWmqIACgkQwqF3j0dL
ehyMABAAuK9n6Y/M2q68bG+SNljf6f7/QtmosnF0LTAE2wFIBKKjHyz5ccPyMG08
W+eYNTGguHgRMQ0uz3nkA9yq3vsAnB2vwfZ/AJhbj2lTXL+V78KbBUYdHOVJpBSS
mTjMb691ZRX1Btoq0MKx6aawu/vDC2fgVJ1M4D8/ctNk6GGGmdMZ//mkLav+0r0O
C7eN+tD+EG4JulrdDBtBYuhVElhzAw8VTTPkP7QjBNvEKlOApCruRaESkcyENyL+
MQ+CrSFmP5JlxwFh1nfZ33dJtI/yYB45OsT81ciL9AHBX38xQUi9ho8n+095Fh2N
VQNBEQwgXWvSaXDFHl15k35afj1xeqNQ7AOc8uA5SjTxd/c0CXFor3SJaLPcTKWJ
HNXAjLWCLgO1zlVKfq8eXG+EVv+D5TdzO70h682U+MyTNRKzKPhLNw3tc0vv36+E
ISUPI/jqJ25cPbe2bpjVF7ikiIgKdqoJc3/UE9ZyPJtRNIOfC2iX+1F2kxZGrJZC
lo+wC+mAhx8Rqk5XjB+JuL7zs8tI+ZLpqBRLmHjpY0RCAARqDDafWPIiZ0rfn5LB
QAclAxpqRCW+y3VOEJkS+nSDlxS0A6HDWv7JIqEIHDhPsK26+lO+FbTQHAmVjCED
FAGlE6PCLsF6GmG/RM6ZCkHm8yiqsjM47ycfByCPhLPmucua9Ik=
=orb3
-----END PGP SIGNATURE-----

--cwwzzjaipkcuaexy--
