Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D7BA8D60
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 12:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA9610E3EB;
	Mon, 29 Sep 2025 10:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1kiQBvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7784610E3DD;
 Mon, 29 Sep 2025 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759140741; x=1790676741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mSdTuwd0801iZvKn6XnfaZfeshk/zXjzvK7tOu5PaM0=;
 b=M1kiQBvx82B75iWFZTUZkg1PeKbzuU2DcOtMBO86Ir3YSfKrOTF3QJDg
 zRS/JmyIlxapO0w+hPQsvefFzrtjfND56QjGD2lhTLiWG41j7AZ3Tjv3P
 jZd8VNUUepSVkD9uFDvZH5dz+IIlyIQGRHG2WlUDX5oDtqa1qeHNBpdbe
 TW1o0BvC8Mrc2arP6oN9gKtTFs1TeFg/qMTXe2iLaAdAU2xaj/YdbmtTt
 cFuHoBUm8d6Th4NEiDs7TDWqvd8cML4Gt8HMYziM6YdITXafu2Q1ZjzVa
 pYdyi7s49ZsGJ8SIOYMrWNMKWsSnpiSHOCY42Ke30b5xvFJDMM37FQ8cV A==;
X-CSE-ConnectionGUID: 4v8Nc16bTay8KCJXW9colw==
X-CSE-MsgGUID: g5lCwLoSTyeiBQ9H1W6NvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="78801935"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="78801935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:12:21 -0700
X-CSE-ConnectionGUID: YV1H4yc3QWmW0AFJENuQyw==
X-CSE-MsgGUID: xA8gx526RXe6YMNJuwSdcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="183381976"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:12:18 -0700
Date: Mon, 29 Sep 2025 13:12:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <aNpbf4HJDrtbsuex@intel.com>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929063644.533890-1-imre.deak@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> Add helpers to query the DP DSC sink device's per-slice throughput as
> well as a DSC branch device's overall throughput and line-width
> capabilities.
> 
> v2 (Ville):
> - Rename pixel_clock to peak_pixel_rate, document what the value means
>   in case of MST tiled displays.
> - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
>   drm_dp_dsc_sink_max_slice_throughput().
> v3:
> - Fix the DSC branch device minimum valid line width value from 2560
>   to 5120 pixels.
> - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
>   name to peak_pixel_rate in header file.
> - Add handling for throughput mode 0 granular delta, defined by DP
>   Standard v2.1a.
> 
> Cc: dri-devel@lists.freedesktop.org
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
>  include/drm/display/drm_dp.h            |   3 +
>  include/drm/display/drm_dp_helper.h     |   5 +
>  3 files changed, 164 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1c74fe9459ad9..6084ca7fbe263 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2844,6 +2844,162 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>  }
>  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
>  
> +/*
> + * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
> + * Appendix L.1 Derivation of Slice Count Requirements.
> + */
> +static int dsc_sink_min_slice_throughput(int peak_pixel_rate)
> +{
> +	if (peak_pixel_rate >= 4800000)
> +		return 600000;
> +	else if (peak_pixel_rate >= 2700000)
> +		return 400000;
> +	else
> +		return 340000;
> +}
> +
> +/**
> + * drm_dp_dsc_sink_max_slice_throughput() - Get a DSC sink's maximum pixel throughput per slice
> + * @dsc_dpcd: DSC sink's capabilities from DPCD
> + * @peak_pixel_rate: Cumulative peak pixel rate in kHz
> + * @is_rgb_yuv444: The mode is either RGB or YUV444
> + *
> + * Return the DSC sink device's maximum pixel throughput per slice, based on
> + * the device's @dsc_dpcd capabilities, the @peak_pixel_rate of the transferred
> + * stream(s) and whether the output format @is_rgb_yuv444 or yuv422/yuv420.
> + *
> + * Note that @peak_pixel_rate is the total pixel rate transferred to the same
> + * DSC/display sink. For instance to calculate a tile's slice count of an MST
> + * multi-tiled display sink (not considering here the required
> + * rounding/alignment of slice count)::
> + *
> + *   @peak_pixel_rate = tile_pixel_rate * tile_count
> + *   total_slice_count = @peak_pixel_rate / drm_dp_dsc_sink_max_slice_throughput(@peak_pixel_rate)
> + *   tile_slice_count = total_slice_count / tile_count
> + *
> + * Returns:
> + * The maximum pixel throughput per slice supported by the DSC sink device
> + * in kPixels/sec.
> + */
> +int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> +					 int peak_pixel_rate, bool is_rgb_yuv444)
> +{
> +	int throughput;
> +	int delta = 0;
> +	int base;
> +
> +	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
> +
> +	if (is_rgb_yuv444) {
> +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
> +			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
> +
> +		delta = ((dsc_dpcd[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT]) &
> +			 DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK) >>
> +			DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT;	/* in units of 2 MPixels/sec */
> +		delta *= 2000;

That thing really is very poorly documented. The DSC spec has a
note about possibly needing extra throughput at the right edges
of slices due to some alignment reasons. Maybe this is for that?
Dunno.

And the fact that there is a delta just for the 4:4:4 throughput
is also rather weird.

> +	} else {
> +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
> +			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
> +	}
> +
> +	switch (throughput) {
> +	case 0:
> +		return dsc_sink_min_slice_throughput(peak_pixel_rate);
> +	case 1:
> +		base = 340000;
> +		break;
> +	case 2 ... 14:
> +		base = 400000 + 50000 * (throughput - 2);
> +		break;
> +	case 15:
> +		base = 170000;
> +		break;
> +	default:
> +		WARN(1, "Missing case %d\n", throughput);
> +		base = 340000;
> +		break;

nit: that looks like an impossible situation. Could either nuke
the default case, or if the compiler/static checks are dumb
then get rid of the 2...14 case instead.

Anyways, for the series
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +	}
> +
> +	return base + delta;
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_throughput);
> +
> +static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
> +{
> +	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
> +}
> +
> +/**
> + * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
> + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> + * @is_rgb_yuv444: The mode is either RGB or YUV444
> + *
> + * Return the branch device's maximum overall DSC pixel throughput, based on
> + * the device's DPCD DSC branch capabilities, and whether the output
> + * format @is_rgb_yuv444 or yuv422/yuv420.
> + *
> + * Returns:
> + * - 0:   The maximum overall throughput capability is not indicated by
> + *        the device separately and it must be determined from the per-slice
> + *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
> + *        and the maximum slice count supported by the device.
> + * - > 0: The maximum overall DSC pixel throughput supported by the branch
> + *        device in kPixels/sec.
> + */
> +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> +					     bool is_rgb_yuv444)
> +{
> +	int throughput;
> +
> +	if (is_rgb_yuv444)
> +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
> +	else
> +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
> +
> +	switch (throughput) {
> +	case 0:
> +		return 0;
> +	case 1:
> +		return 680000;
> +	default:
> +		return 600000 + 50000 * throughput;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
> +
> +/**
> + * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
> + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> + *
> + * Return the branch device's maximum overall DSC line width, based on
> + * the device's @dsc_branch_dpcd capabilities.
> + *
> + * Returns:
> + * - 0:        The maximum line width is not indicated by the device
> + *             separately and it must be determined from the maximum
> + *             slice count and slice-width supported by the device.
> + * - %-EINVAL: The device indicates an invalid maximum line width
> + *             (< 5120 pixels).
> + * - >= 5120:  The maximum line width in pixels.
> + */
> +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
> +{
> +	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
> +
> +	switch (line_width) {
> +	case 0:
> +		return 0;
> +	case 1 ... 15:
> +		return -EINVAL;
> +	default:
> +		return line_width * 320;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
> +
>  static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
>  				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
>  				  u8 *buf, int buf_size)
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index cf318e3ddb5c5..e4eebabab9759 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -258,6 +258,8 @@
>  # define DP_DSC_RC_BUF_BLK_SIZE_4           0x1
>  # define DP_DSC_RC_BUF_BLK_SIZE_16          0x2
>  # define DP_DSC_RC_BUF_BLK_SIZE_64          0x3
> +# define DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT 3 /* DP 2.1a, in units of 2 MPixels/sec */
> +# define DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK  (0x1f << DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT)
>  
>  #define DP_DSC_RC_BUF_SIZE                  0x063
>  
> @@ -1686,6 +1688,7 @@ enum drm_dp_phy {
>  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
>  #define DP_RECEIVER_CAP_SIZE		0xf
>  #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
> +#define DP_DSC_BRANCH_CAP_SIZE		3
>  #define EDP_PSR_RECEIVER_CAP_SIZE	2
>  #define EDP_DISPLAY_CTL_CAP_SIZE	5
>  #define DP_LTTPR_COMMON_CAP_SIZE	8
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index e438c44409952..df2f24b950e4c 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
>  u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
>  int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
>  					 u8 dsc_bpc[3]);
> +int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> +					 int peak_pixel_rate, bool is_rgb_yuv444);
> +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> +					     bool is_rgb_yuv444);
> +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
>  
>  static inline bool
>  drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> -- 
> 2.49.1

-- 
Ville Syrjälä
Intel
