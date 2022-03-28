Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ECB4E9D9F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB20810E740;
	Mon, 28 Mar 2022 17:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6518210E73E;
 Mon, 28 Mar 2022 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648488917; x=1680024917;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YCBFJfSnaue8DrzyrLRtMIk+FFlAWteiycMYwcAhbWE=;
 b=YoTwRjefijOJg7wLfNmQuNS7QU00Eqarr/rt++VXpUOvRRSGR3/ucy6N
 HPngZ3oUe6kaoRqOHGkOCLPBZIJcSd9dXch+fYEmxefhj69jRRqVVerWS
 Y9R/N5uIPmF9uqRJOdnGIsw0QXGsrLMyA6TJRh8LEi2fVgXiNSoXUmWuz
 DezUD7FB8Dg4t/cpNxGkvGxmSKBoVYHBP8uPc7w+N9fmTlzMjBVvoIl1n
 d9M5BTPo3Y4zAWGrY2XzbdYIP/jKExbOpaNguy4zbN7zwqeLNGBuWu+5g
 0NTnrxuN/gG/+i5KU40rneErYCm3R1XZ7kR/QdNmfAiI7CCSQ9EP3iK8l Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="319762603"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="319762603"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="639043581"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by FMSMGA003.fm.intel.com with SMTP; 28 Mar 2022 10:35:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:35:13 +0300
Date: Mon, 28 Mar 2022 20:35:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 07/12] drm/edid: constify struct detailed_timing in
 lower level parsing
Message-ID: <YkHx0UiAzu0mAqTA@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <0b7fafcc7784db0003e454544916c273a9eb1250.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b7fafcc7784db0003e454544916c273a9eb1250.1648477901.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 05:34:28PM +0300, Jani Nikula wrote:
> Start constifying the struct detailed_timing pointers being passed
> around from bottom up.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 40 +++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 27a0e9bf260c..6d1461991ba4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2560,7 +2560,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
>   */
>  static struct drm_display_mode *
>  drm_mode_std(struct drm_connector *connector, struct edid *edid,
> -	     struct std_timing *t)
> +	     const struct std_timing *t)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *m, *mode = NULL;
> @@ -2678,7 +2678,7 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
>   */
>  static void
>  drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
> -			    struct detailed_pixel_timing *pt)
> +			    const struct detailed_pixel_timing *pt)
>  {
>  	int i;
>  	static const struct {
> @@ -2722,11 +2722,11 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
>   */
>  static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
>  						  struct edid *edid,
> -						  struct detailed_timing *timing,
> +						  const struct detailed_timing *timing,
>  						  u32 quirks)
>  {
>  	struct drm_display_mode *mode;
> -	struct detailed_pixel_timing *pt = &timing->data.pixel_data;
> +	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
>  	unsigned hactive = (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactive_lo;
>  	unsigned vactive = (pt->vactive_vblank_hi & 0xf0) << 4 | pt->vactive_lo;
>  	unsigned hblank = (pt->hactive_hblank_hi & 0xf) << 8 | pt->hblank_lo;
> @@ -2821,7 +2821,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
>  
>  static bool
>  mode_in_hsync_range(const struct drm_display_mode *mode,
> -		    struct edid *edid, u8 *t)
> +		    struct edid *edid, const u8 *t)
>  {
>  	int hsync, hmin, hmax;
>  
> @@ -2838,7 +2838,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
>  
>  static bool
>  mode_in_vsync_range(const struct drm_display_mode *mode,
> -		    struct edid *edid, u8 *t)
> +		    struct edid *edid, const u8 *t)
>  {
>  	int vsync, vmin, vmax;
>  
> @@ -2854,7 +2854,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
>  }
>  
>  static u32
> -range_pixel_clock(struct edid *edid, u8 *t)
> +range_pixel_clock(struct edid *edid, const u8 *t)
>  {
>  	/* unspecified */
>  	if (t[9] == 0 || t[9] == 255)
> @@ -2870,10 +2870,10 @@ range_pixel_clock(struct edid *edid, u8 *t)
>  
>  static bool
>  mode_in_range(const struct drm_display_mode *mode, struct edid *edid,
> -	      struct detailed_timing *timing)
> +	      const struct detailed_timing *timing)
>  {
>  	u32 max_clock;
> -	u8 *t = (u8 *)timing;
> +	const u8 *t = (const u8 *)timing;
>  
>  	if (!mode_in_hsync_range(mode, edid, t))
>  		return false;
> @@ -2916,7 +2916,7 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
>  
>  static int
>  drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
> -			struct detailed_timing *timing)
> +			const struct detailed_timing *timing)
>  {
>  	int i, modes = 0;
>  	struct drm_display_mode *newmode;
> @@ -2951,7 +2951,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
>  
>  static int
>  drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
> -			struct detailed_timing *timing)
> +			const struct detailed_timing *timing)
>  {
>  	int i, modes = 0;
>  	struct drm_display_mode *newmode;
> @@ -2980,7 +2980,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
>  
>  static int
>  drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
> -			struct detailed_timing *timing)
> +			const struct detailed_timing *timing)
>  {
>  	int i, modes = 0;
>  	struct drm_display_mode *newmode;
> @@ -3012,8 +3012,8 @@ static void
>  do_inferred_modes(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure = c;
> -	struct detailed_non_pixel *data = &timing->data.other_data;
> -	struct detailed_data_monitor_range *range = &data->data.range;
> +	const struct detailed_non_pixel *data = &timing->data.other_data;
> +	const struct detailed_data_monitor_range *range = &data->data.range;
>  
>  	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
>  		return;
> @@ -3062,11 +3062,11 @@ add_inferred_modes(struct drm_connector *connector, struct edid *edid)
>  }
>  
>  static int
> -drm_est3_modes(struct drm_connector *connector, struct detailed_timing *timing)
> +drm_est3_modes(struct drm_connector *connector, const struct detailed_timing *timing)
>  {
>  	int i, j, m, modes = 0;
>  	struct drm_display_mode *mode;
> -	u8 *est = ((u8 *)timing) + 6;
> +	const u8 *est = ((const u8 *)timing) + 6;
>  
>  	for (i = 0; i < 6; i++) {
>  		for (j = 7; j >= 0; j--) {
> @@ -3145,7 +3145,7 @@ static void
>  do_standard_modes(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure = c;
> -	struct detailed_non_pixel *data = &timing->data.other_data;
> +	const struct detailed_non_pixel *data = &timing->data.other_data;
>  	struct drm_connector *connector = closure->connector;
>  	struct edid *edid = closure->edid;
>  	int i;
> @@ -3154,7 +3154,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
>  		return;
>  
>  	for (i = 0; i < 6; i++) {
> -		struct std_timing *std = &data->data.timings[i];
> +		const struct std_timing *std = &data->data.timings[i];
>  		struct drm_display_mode *newmode;
>  
>  		newmode = drm_mode_std(connector, edid, std);
> @@ -3203,12 +3203,12 @@ add_standard_modes(struct drm_connector *connector, struct edid *edid)
>  }
>  
>  static int drm_cvt_modes(struct drm_connector *connector,
> -			 struct detailed_timing *timing)
> +			 const struct detailed_timing *timing)
>  {
>  	int i, j, modes = 0;
>  	struct drm_display_mode *newmode;
>  	struct drm_device *dev = connector->dev;
> -	struct cvt_timing *cvt;
> +	const struct cvt_timing *cvt;
>  	const int rates[] = { 60, 85, 75, 60, 50 };
>  	const u8 empty[3] = { 0, 0, 0 };
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
