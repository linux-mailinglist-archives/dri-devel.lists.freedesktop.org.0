Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A454E9DAF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B10510E73E;
	Mon, 28 Mar 2022 17:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746E10E73E;
 Mon, 28 Mar 2022 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648489219; x=1680025219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JzdvQOIKZp39my3a+BQ07ypJcjKnqZKwOV9LaLtJems=;
 b=V5fD+8M7AHD3DX4p+9hSSC24B7G6ja+9ifwkRukV3qP2csb7+Xps5Vb+
 xzn0mhgiet2Z8bC2NmvIv1F5RF1bGpYCJgR+88sJ3+W83HWuMu9TR+ZZz
 H7ZWKkqWTCA9J4HfGfhAVZH7Nlq6AYuq6zKnTbDQ0GHu42sM9PQ8CR46B
 3CccHskTr2f83iB3VPbU1tPRoA/veesjCFNAkw0zwhlVkUoBJd3wgLRDz
 B4nwDATM+Q94UzoxNy6w6dOQcO8/Y56TcYYF1oxZt5xx9i1KaRfu/J0CE
 PUY5K2nR3hNT/EZ/cSpHs6jS4gbtKObh1oPW+35pnf8NmxbY1p7g2OMNk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246554526"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="246554526"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="553991634"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga007.fm.intel.com with SMTP; 28 Mar 2022 10:40:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:40:15 +0300
Date: Mon, 28 Mar 2022 20:40:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 10/12] drm/edid: constify struct edid passed around in
 callbacks and closure
Message-ID: <YkHy/10HdEPG9459@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <8229be49b5a7686856c17428aa9291b4c4cf1bd5.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8229be49b5a7686856c17428aa9291b4c4cf1bd5.1648477901.git.jani.nikula@intel.com>
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

On Mon, Mar 28, 2022 at 05:34:31PM +0300, Jani Nikula wrote:
> Finalize detailed timing parsing constness by making struct edid also
> const in callbacks and closure.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 48 +++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index dae394688e5b..625fa6a4a93a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -97,7 +97,7 @@ static int oui(u8 first, u8 second, u8 third)
>  
>  struct detailed_mode_closure {
>  	struct drm_connector *connector;
> -	struct edid *edid;
> +	const struct edid *edid;
>  	bool preferred;
>  	u32 quirks;
>  	int modes;
> @@ -2424,7 +2424,7 @@ is_rb(const struct detailed_timing *descriptor, void *data)
>  
>  /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
>  static bool
> -drm_monitor_supports_rb(struct edid *edid)
> +drm_monitor_supports_rb(const struct edid *edid)
>  {
>  	if (edid->revision >= 4) {
>  		bool ret = false;
> @@ -2452,7 +2452,7 @@ find_gtf2(const struct detailed_timing *descriptor, void *data)
>  
>  /* Secondary GTF curve kicks in above some break frequency */
>  static int
> -drm_gtf2_hbreak(struct edid *edid)
> +drm_gtf2_hbreak(const struct edid *edid)
>  {
>  	const struct detailed_timing *descriptor = NULL;
>  
> @@ -2464,7 +2464,7 @@ drm_gtf2_hbreak(struct edid *edid)
>  }
>  
>  static int
> -drm_gtf2_2c(struct edid *edid)
> +drm_gtf2_2c(const struct edid *edid)
>  {
>  	const struct detailed_timing *descriptor = NULL;
>  
> @@ -2476,7 +2476,7 @@ drm_gtf2_2c(struct edid *edid)
>  }
>  
>  static int
> -drm_gtf2_m(struct edid *edid)
> +drm_gtf2_m(const struct edid *edid)
>  {
>  	const struct detailed_timing *descriptor = NULL;
>  
> @@ -2488,7 +2488,7 @@ drm_gtf2_m(struct edid *edid)
>  }
>  
>  static int
> -drm_gtf2_k(struct edid *edid)
> +drm_gtf2_k(const struct edid *edid)
>  {
>  	const struct detailed_timing *descriptor = NULL;
>  
> @@ -2500,7 +2500,7 @@ drm_gtf2_k(struct edid *edid)
>  }
>  
>  static int
> -drm_gtf2_2j(struct edid *edid)
> +drm_gtf2_2j(const struct edid *edid)
>  {
>  	const struct detailed_timing *descriptor = NULL;
>  
> @@ -2515,7 +2515,7 @@ drm_gtf2_2j(struct edid *edid)
>   * standard_timing_level - get std. timing level(CVT/GTF/DMT)
>   * @edid: EDID block to scan
>   */
> -static int standard_timing_level(struct edid *edid)
> +static int standard_timing_level(const struct edid *edid)
>  {
>  	if (edid->revision >= 2) {
>  		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
> @@ -2558,7 +2558,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
>   * and convert them into a real mode using CVT/GTF/DMT.
>   */
>  static struct drm_display_mode *
> -drm_mode_std(struct drm_connector *connector, struct edid *edid,
> +drm_mode_std(struct drm_connector *connector, const struct edid *edid,
>  	     const struct std_timing *t)
>  {
>  	struct drm_device *dev = connector->dev;
> @@ -2720,7 +2720,7 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
>   * return a new struct drm_display_mode.
>   */
>  static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
> -						  struct edid *edid,
> +						  const struct edid *edid,
>  						  const struct detailed_timing *timing,
>  						  u32 quirks)
>  {
> @@ -2820,7 +2820,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
>  
>  static bool
>  mode_in_hsync_range(const struct drm_display_mode *mode,
> -		    struct edid *edid, const u8 *t)
> +		    const struct edid *edid, const u8 *t)
>  {
>  	int hsync, hmin, hmax;
>  
> @@ -2837,7 +2837,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
>  
>  static bool
>  mode_in_vsync_range(const struct drm_display_mode *mode,
> -		    struct edid *edid, const u8 *t)
> +		    const struct edid *edid, const u8 *t)
>  {
>  	int vsync, vmin, vmax;
>  
> @@ -2853,7 +2853,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
>  }
>  
>  static u32
> -range_pixel_clock(struct edid *edid, const u8 *t)
> +range_pixel_clock(const struct edid *edid, const u8 *t)
>  {
>  	/* unspecified */
>  	if (t[9] == 0 || t[9] == 255)
> @@ -2868,7 +2868,7 @@ range_pixel_clock(struct edid *edid, const u8 *t)
>  }
>  
>  static bool
> -mode_in_range(const struct drm_display_mode *mode, struct edid *edid,
> +mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
>  	      const struct detailed_timing *timing)
>  {
>  	u32 max_clock;
> @@ -2914,7 +2914,7 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
>  }
>  
>  static int
> -drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
> +drm_dmt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
>  			const struct detailed_timing *timing)
>  {
>  	int i, modes = 0;
> @@ -2949,7 +2949,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
>  }
>  
>  static int
> -drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
> +drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid,
>  			const struct detailed_timing *timing)
>  {
>  	int i, modes = 0;
> @@ -2978,7 +2978,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
>  }
>  
>  static int
> -drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
> +drm_cvt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
>  			const struct detailed_timing *timing)
>  {
>  	int i, modes = 0;
> @@ -3046,7 +3046,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>  }
>  
>  static int
> -add_inferred_modes(struct drm_connector *connector, struct edid *edid)
> +add_inferred_modes(struct drm_connector *connector, const struct edid *edid)
>  {
>  	struct detailed_mode_closure closure = {
>  		.connector = connector,
> @@ -3108,7 +3108,7 @@ do_established_modes(const struct detailed_timing *timing, void *c)
>   * (defined above).  Tease them out and add them to the global modes list.
>   */
>  static int
> -add_established_modes(struct drm_connector *connector, struct edid *edid)
> +add_established_modes(struct drm_connector *connector, const struct edid *edid)
>  {
>  	struct drm_device *dev = connector->dev;
>  	unsigned long est_bits = edid->established_timings.t1 |
> @@ -3145,7 +3145,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
>  	struct detailed_mode_closure *closure = c;
>  	const struct detailed_non_pixel *data = &timing->data.other_data;
>  	struct drm_connector *connector = closure->connector;
> -	struct edid *edid = closure->edid;
> +	const struct edid *edid = closure->edid;
>  	int i;
>  
>  	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
> @@ -3172,7 +3172,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
>   * GTF or CVT. Grab them from @edid and add them to the list.
>   */
>  static int
> -add_standard_modes(struct drm_connector *connector, struct edid *edid)
> +add_standard_modes(struct drm_connector *connector, const struct edid *edid)
>  {
>  	int i, modes = 0;
>  	struct detailed_mode_closure closure = {
> @@ -3264,7 +3264,7 @@ do_cvt_mode(const struct detailed_timing *timing, void *c)
>  }
>  
>  static int
> -add_cvt_modes(struct drm_connector *connector, struct edid *edid)
> +add_cvt_modes(struct drm_connector *connector, const struct edid *edid)
>  {
>  	struct detailed_mode_closure closure = {
>  		.connector = connector,
> @@ -3318,7 +3318,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
>   * @quirks: quirks to apply
>   */
>  static int
> -add_detailed_modes(struct drm_connector *connector, struct edid *edid,
> +add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
>  		   u32 quirks)
>  {
>  	struct detailed_mode_closure closure = {
> @@ -4525,7 +4525,7 @@ monitor_name(const struct detailed_timing *timing, void *data)
>  	*res = timing->data.other_data.data.str.str;
>  }
>  
> -static int get_monitor_name(struct edid *edid, char name[13])
> +static int get_monitor_name(const struct edid *edid, char name[13])
>  {
>  	const char *edid_name = NULL;
>  	int mnl;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
