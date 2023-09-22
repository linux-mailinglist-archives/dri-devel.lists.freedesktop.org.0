Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027E7AB560
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 18:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F8210E69D;
	Fri, 22 Sep 2023 16:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F02E10E076;
 Fri, 22 Sep 2023 16:02:14 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Ax1fCEug1l9gcrAA--.17251S3;
 Sat, 23 Sep 2023 00:02:13 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxjd5_ug1lw1oOAA--.31706S3; 
 Sat, 23 Sep 2023 00:02:09 +0800 (CST)
Message-ID: <4dcd3fe5-13f9-c729-c47b-969d562f7249@loongson.cn>
Date: Sat, 23 Sep 2023 00:02:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [2/8] drm/i915/display: Store compressed bpp in U6.4 format
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230913060606.1105349-3-mitulkumar.ajitkumar.golani@intel.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230913060606.1105349-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxjd5_ug1lw1oOAA--.31706S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJFyDKFWrWFW8JF1ftF4fZwc_yoW8Cr48uo
 W8JFW3WF42gr1Iy3s7Jr1fAay3ZrWv9r9xXr4UXr4DXF92qFs0g34xKw1akr4aqFWvvF1q
 gF95KrWIqanrGa48l-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUYg7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r1j6r4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
 AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
 42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
 IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
 KfnxnUUI43ZEXa7IU1yE_tUUUUU==
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/13 14:06, Mitul Golani wrote:
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> DSC parameter bits_per_pixel is stored in U6.4 format.
> The 4 bits represent the fractional part of the bpp.
> Currently we use compressed_bpp member of dsc structure to store
> only the integral part of the bits_per_pixel.
> To store the full bits_per_pixel along with the fractional part,
> compressed_bpp is changed to store bpp in U6.4 formats. Intergral
> part is retrieved by simply right shifting the member compressed_bpp by 4.
>
> v2:
> -Use to_bpp_int, to_bpp_frac_dec, to_bpp_x16 helpers while dealing
>   with compressed bpp. (Suraj)
> -Fix comment styling. (Suraj)
>
> v3:
> -Add separate file for 6.4 fixed point helper(Jani, Nikula)
> -Add comment for magic values(Suraj)
>
> v4:
> -Fix checkpatch caused due to renaming(Suraj)

In this statement, is the 'caused' and the 'due to' duplicated here.

Fix checkpatch warnings due to renaming(Suraj)

Or

Fix checkpatch warnings caused by renaming(Suraj)

Or

Fix checkpatch warnings created due to renaming(Suraj)

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/icl_dsi.c        | 11 +++---
>   drivers/gpu/drm/i915/display/intel_audio.c    |  3 +-
>   drivers/gpu/drm/i915/display/intel_bios.c     |  6 ++--
>   drivers/gpu/drm/i915/display/intel_cdclk.c    |  6 ++--
>   drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
>   .../drm/i915/display/intel_display_types.h    |  3 +-
>   drivers/gpu/drm/i915/display/intel_dp.c       | 33 ++++++++++-------
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   | 26 ++++++++------
>   .../i915/display/intel_fractional_helper.h    | 36 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vdsc.c     |  5 +--
>   10 files changed, 93 insertions(+), 38 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_fractional_helper.h
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index ad6488e9c2b2..0f7594b6aa1f 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -43,6 +43,7 @@
>   #include "intel_de.h"
>   #include "intel_dsi.h"
>   #include "intel_dsi_vbt.h"
> +#include "intel_fractional_helper.h"
>   #include "intel_panel.h"
>   #include "intel_vdsc.h"
>   #include "intel_vdsc_regs.h"
> @@ -330,7 +331,7 @@ static int afe_clk(struct intel_encoder *encoder,
>   	int bpp;
>   
>   	if (crtc_state->dsc.compression_enable)
> -		bpp = crtc_state->dsc.compressed_bpp;
> +		bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>   	else
>   		bpp = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>   
> @@ -860,7 +861,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
>   	 * compressed and non-compressed bpp.
>   	 */
>   	if (crtc_state->dsc.compression_enable) {
> -		mul = crtc_state->dsc.compressed_bpp;
> +		mul = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>   		div = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>   	}
>   
> @@ -884,7 +885,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
>   		int bpp, line_time_us, byte_clk_period_ns;
>   
>   		if (crtc_state->dsc.compression_enable)
> -			bpp = crtc_state->dsc.compressed_bpp;
> +			bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>   		else
>   			bpp = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>   
> @@ -1451,8 +1452,8 @@ static void gen11_dsi_get_timings(struct intel_encoder *encoder,
>   	struct drm_display_mode *adjusted_mode =
>   					&pipe_config->hw.adjusted_mode;
>   
> -	if (pipe_config->dsc.compressed_bpp) {
> -		int div = pipe_config->dsc.compressed_bpp;
> +	if (pipe_config->dsc.compressed_bpp_x16) {
> +		int div = intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16);
>   		int mul = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>   
>   		adjusted_mode->crtc_htotal =
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index 19605264a35c..4f1db1581316 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -35,6 +35,7 @@
>   #include "intel_crtc.h"
>   #include "intel_de.h"
>   #include "intel_display_types.h"
> +#include "intel_fractional_helper.h"
>   #include "intel_lpe_audio.h"
>   
>   /**
> @@ -528,7 +529,7 @@ static unsigned int calc_hblank_early_prog(struct intel_encoder *encoder,
>   	h_active = crtc_state->hw.adjusted_mode.crtc_hdisplay;
>   	h_total = crtc_state->hw.adjusted_mode.crtc_htotal;
>   	pixel_clk = crtc_state->hw.adjusted_mode.crtc_clock;
> -	vdsc_bpp = crtc_state->dsc.compressed_bpp;
> +	vdsc_bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>   	cdclk = i915->display.cdclk.hw.cdclk;
>   	/* fec= 0.972261, using rounding multiplier of 1000000 */
>   	fec_coeff = 972261;
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index f735b035436c..3e4a3c62fc8a 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -33,6 +33,7 @@
>   #include "i915_reg.h"
>   #include "intel_display.h"
>   #include "intel_display_types.h"
> +#include "intel_fractional_helper.h"
>   #include "intel_gmbus.h"
>   
>   #define _INTEL_BIOS_PRIVATE
> @@ -3384,8 +3385,9 @@ static void fill_dsc(struct intel_crtc_state *crtc_state,
>   
>   	crtc_state->pipe_bpp = bpc * 3;
>   
> -	crtc_state->dsc.compressed_bpp = min(crtc_state->pipe_bpp,
> -					     VBT_DSC_MAX_BPP(dsc->max_bpp));
> +	crtc_state->dsc.compressed_bpp_x16 =
> +		intel_fractional_bpp_to_x16(min(crtc_state->pipe_bpp,
> +						VBT_DSC_MAX_BPP(dsc->max_bpp)));
>   
>   	/*
>   	 * FIXME: This is ugly, and slice count should take DSC engine
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index ad5251ba6fe1..b9a07be81dfe 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -34,6 +34,7 @@
>   #include "intel_de.h"
>   #include "intel_dp.h"
>   #include "intel_display_types.h"
> +#include "intel_fractional_helper.h"
>   #include "intel_mchbar_regs.h"
>   #include "intel_pci_config.h"
>   #include "intel_pcode.h"
> @@ -2567,8 +2568,9 @@ static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
>   		 * => CDCLK >= compressed_bpp * Pixel clock  / 2 * Bigjoiner Interface bits
>   		 */
>   		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
> -		int min_cdclk_bj = (crtc_state->dsc.compressed_bpp * pixel_clock) /
> -				   (2 * bigjoiner_interface_bits);
> +		int min_cdclk_bj =
> +			(intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16) *
> +			 pixel_clock) / (2 * bigjoiner_interface_bits);
>   
>   		min_cdclk = max(min_cdclk, min_cdclk_bj);
>   	}
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 83e1bc858b9f..afcbdd4f105a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5365,7 +5365,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   
>   	PIPE_CONF_CHECK_I(dsc.compression_enable);
>   	PIPE_CONF_CHECK_I(dsc.dsc_split);
> -	PIPE_CONF_CHECK_I(dsc.compressed_bpp);
> +	PIPE_CONF_CHECK_I(dsc.compressed_bpp_x16);
>   
>   	PIPE_CONF_CHECK_BOOL(splitter.enable);
>   	PIPE_CONF_CHECK_I(splitter.link_count);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c21064794f32..69bcabec4a29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1353,7 +1353,8 @@ struct intel_crtc_state {
>   	struct {
>   		bool compression_enable;
>   		bool dsc_split;
> -		u16 compressed_bpp;
> +		/* Compressed Bpp in U6.4 format (first 4 bits for fractional part) */
> +		u16 compressed_bpp_x16;
>   		u8 slice_count;
>   		struct drm_dsc_config config;
>   	} dsc;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index aa5f602b56fb..cb647bb38b12 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -64,6 +64,7 @@
>   #include "intel_dp_mst.h"
>   #include "intel_dpio_phy.h"
>   #include "intel_dpll.h"
> +#include "intel_fractional_helper.h"
>   #include "intel_fifo_underrun.h"
>   #include "intel_hdcp.h"
>   #include "intel_hdmi.h"
> @@ -1863,7 +1864,8 @@ icl_dsc_compute_link_config(struct intel_dp *intel_dp,
>   					      valid_dsc_bpp[i],
>   					      timeslots);
>   		if (ret == 0) {
> -			pipe_config->dsc.compressed_bpp = valid_dsc_bpp[i];
> +			pipe_config->dsc.compressed_bpp_x16 =
> +				intel_fractional_bpp_to_x16(valid_dsc_bpp[i]);
>   			return 0;
>   		}
>   	}
> @@ -1901,7 +1903,8 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
>   					      compressed_bpp,
>   					      timeslots);
>   		if (ret == 0) {
> -			pipe_config->dsc.compressed_bpp = compressed_bpp;
> +			pipe_config->dsc.compressed_bpp_x16 =
> +				intel_fractional_bpp_to_x16(compressed_bpp);
>   			return 0;
>   		}
>   	}
> @@ -2085,7 +2088,8 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>   	/* Compressed BPP should be less than the Input DSC bpp */
>   	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
>   
> -	pipe_config->dsc.compressed_bpp = max(dsc_min_bpp, dsc_max_bpp);
> +	pipe_config->dsc.compressed_bpp_x16 =
> +		intel_fractional_bpp_to_x16(max(dsc_min_bpp, dsc_max_bpp));
>   
>   	pipe_config->pipe_bpp = pipe_bpp;
>   
> @@ -2171,18 +2175,19 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>   	ret = intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
>   	if (ret < 0) {
>   		drm_dbg_kms(&dev_priv->drm,
> -			    "Cannot compute valid DSC parameters for Input Bpp = %d "
> -			    "Compressed BPP = %d\n",
> +			    "Cannot compute valid DSC parameters for Input Bpp = %d Compressed BPP = %d.%d\n",
>   			    pipe_config->pipe_bpp,
> -			    pipe_config->dsc.compressed_bpp);
> +			    intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16),
> +			    intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16));
>   		return ret;
>   	}
>   
>   	pipe_config->dsc.compression_enable = true;
> -	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp = %d "
> -		    "Compressed Bpp = %d Slice Count = %d\n",
> +	drm_dbg_kms(&dev_priv->drm,
> +		    "DP DSC computed with Input Bpp = %d Compressed Bpp = %d.%d Slice Count = %d\n",
>   		    pipe_config->pipe_bpp,
> -		    pipe_config->dsc.compressed_bpp,
> +		    intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16),
> +		    intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16),
>   		    pipe_config->dsc.slice_count);
>   
>   	return 0;
> @@ -2261,15 +2266,17 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>   
>   	if (pipe_config->dsc.compression_enable) {
>   		drm_dbg_kms(&i915->drm,
> -			    "DP lane count %d clock %d Input bpp %d Compressed bpp %d\n",
> +			    "DP lane count %d clock %d Input bpp %d Compressed bpp %d.%d\n",
>   			    pipe_config->lane_count, pipe_config->port_clock,
>   			    pipe_config->pipe_bpp,
> -			    pipe_config->dsc.compressed_bpp);
> +			    intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16),
> +			    intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16));
>   
>   		drm_dbg_kms(&i915->drm,
>   			    "DP link rate required %i available %i\n",
>   			    intel_dp_link_required(adjusted_mode->crtc_clock,
> -						   pipe_config->dsc.compressed_bpp),
> +						   intel_fractional_bpp_from_x16
> +						   (pipe_config->dsc.compressed_bpp_x16)),
>   			    intel_dp_max_data_rate(pipe_config->port_clock,
>   						   pipe_config->lane_count));
>   	} else {
> @@ -2702,7 +2709,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>   		intel_dp_limited_color_range(pipe_config, conn_state);
>   
>   	if (pipe_config->dsc.compression_enable)
> -		link_bpp = pipe_config->dsc.compressed_bpp;
> +		link_bpp = pipe_config->dsc.compressed_bpp_x16;
>   	else
>   		link_bpp = intel_dp_output_bpp(pipe_config->output_format,
>   					       pipe_config->pipe_bpp);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 1c7f0b6afe47..7bf0b6e4ac0b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -41,6 +41,7 @@
>   #include "intel_dp_hdcp.h"
>   #include "intel_dp_mst.h"
>   #include "intel_dpio_phy.h"
> +#include "intel_fractional_helper.h"
>   #include "intel_hdcp.h"
>   #include "intel_hotplug.h"
>   #include "skl_scaler.h"
> @@ -140,7 +141,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>   		if (!dsc)
>   			crtc_state->pipe_bpp = bpp;
>   		else
> -			crtc_state->dsc.compressed_bpp = bpp;
> +			crtc_state->dsc.compressed_bpp_x16 = intel_fractional_bpp_to_x16(bpp);
>   		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc %d\n", slots, bpp, dsc);
>   	}
>   
> @@ -238,13 +239,14 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>   	if (slots < 0)
>   		return slots;
>   
> -	last_compressed_bpp = crtc_state->dsc.compressed_bpp;
> +	last_compressed_bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>   
> -	crtc_state->dsc.compressed_bpp = intel_dp_dsc_nearest_valid_bpp(i915,
> -									last_compressed_bpp,
> -									crtc_state->pipe_bpp);
> +	crtc_state->dsc.compressed_bpp_x16 =
> +		intel_fractional_bpp_to_x16(intel_dp_dsc_nearest_valid_bpp(i915,
> +									   last_compressed_bpp,
> +									   crtc_state->pipe_bpp));
>   
> -	if (crtc_state->dsc.compressed_bpp != last_compressed_bpp)
> +	if (crtc_state->dsc.compressed_bpp_x16 != intel_fractional_bpp_to_x16(last_compressed_bpp))
>   		need_timeslot_recalc = true;
>   
>   	/*
> @@ -252,15 +254,17 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>   	 * the actual compressed bpp we use.
>   	 */
>   	if (need_timeslot_recalc) {
> -		slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
> -							     crtc_state->dsc.compressed_bpp,
> -							     crtc_state->dsc.compressed_bpp,
> -							     limits, conn_state, 2 * 3, true);
> +		slots =
> +		intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
> +						     intel_fractional_bpp_from_x16
> +						     (crtc_state->dsc.compressed_bpp_x16),
> +		intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
> +		limits, conn_state, 2 * 3, true);
>   		if (slots < 0)
>   			return slots;
>   	}
>   
> -	intel_link_compute_m_n(crtc_state->dsc.compressed_bpp,
> +	intel_link_compute_m_n(intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
>   			       crtc_state->lane_count,
>   			       adjusted_mode->crtc_clock,
>   			       crtc_state->port_clock,
> diff --git a/drivers/gpu/drm/i915/display/intel_fractional_helper.h b/drivers/gpu/drm/i915/display/intel_fractional_helper.h
> new file mode 100644
> index 000000000000..0212a9041c8f
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_fractional_helper.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef __INTEL_FRACTIONAL_HELPERS_H__
> +#define __INTEL_FRACTIONAL_HELPERS_H__
> +
> + /*
> +  * Convert a U6.4 fixed-point bits-per-pixel (bpp) value to an integer bpp value.
> +  */
> +static inline int intel_fractional_bpp_from_x16(int bpp_x16)
> +{
> +	return bpp_x16 >> 4;
> +}
> +
> +/*
> + * Extract the fractional part of a U6.4 fixed-point bpp value based on the
> + * last 4 bits representing fractional bits, obtained by multiplying by 10000
> + * and then dividing by 16, as the bpp value is initially left-shifted by 4
> + * to allocate 4 bits for the fractional part.
> + */
> +static inline int intel_fractional_bpp_decimal(int bpp_x16)
> +{
> +	return (bpp_x16 & 0xf) * 625;
> +}
> +
> +/*
> + * Convert bits-per-pixel (bpp) to a U6.4 fixed-point representation.
> + */
> +static inline int intel_fractional_bpp_to_x16(int bpp)
> +{
> +	return bpp << 4;
> +}
> +
> +#endif /*  __INTEL_FRACTIONAL_HELPERS_H__ */
> +
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 5c00f7ccad7f..1bd9391a6f5a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -15,6 +15,7 @@
>   #include "intel_de.h"
>   #include "intel_display_types.h"
>   #include "intel_dsi.h"
> +#include "intel_fractional_helper.h"
>   #include "intel_qp_tables.h"
>   #include "intel_vdsc.h"
>   #include "intel_vdsc_regs.h"
> @@ -248,7 +249,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>   	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
>   	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>   	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
> -	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
> +	u16 compressed_bpp = intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16);
>   	int err;
>   	int ret;
>   
> @@ -874,7 +875,7 @@ static void intel_dsc_get_pps_config(struct intel_crtc_state *crtc_state)
>   	if (vdsc_cfg->native_420)
>   		vdsc_cfg->bits_per_pixel >>= 1;
>   
> -	crtc_state->dsc.compressed_bpp = vdsc_cfg->bits_per_pixel >> 4;
> +	crtc_state->dsc.compressed_bpp_x16 = vdsc_cfg->bits_per_pixel;
>   
>   	/* PPS 2 */
>   	pps_temp = intel_dsc_pps_read_and_verify(crtc_state, 2);

