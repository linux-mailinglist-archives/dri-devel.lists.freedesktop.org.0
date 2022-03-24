Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612024E66D3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 17:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5510E9C7;
	Thu, 24 Mar 2022 16:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67910E9C7;
 Thu, 24 Mar 2022 16:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648138611; x=1679674611;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f6WR2O5qDktaNgyK2HOh1Fxtnow/YmUy1jJ/FuCxNVQ=;
 b=WNqi9vmBFFNMp2hugcxWwdVNZzs6PlNv3t5NWuDzbZMUaV2ffKwjFvjq
 dspWoeWkxogt9/j7ob2KLEHr/JEKUmB5Ao9isRt8gMHk1ZmdgE6MScVXg
 4JFCnmLKmhR5/F+5eF1xOeTNj7/6iyNNib1qQJyElo1CgWI95ZdBYnw6g
 tFIGoa9yZXeVF4uiXwqOzDPntlptBGtM939O6brFb6ElJ3UjYI1FtflpO
 I6gz12npglbnZCjQMZYK92qZKI27K4DA2ORvKaR78l8YC6xsCoJtBRK++
 +xP5+vUzT4oc9ZUeuk3mA0fMt6NR+yeaHfhtX8/tnJG9GNbbqH46MRmbW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258129699"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="258129699"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 09:16:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="516223540"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 09:16:22 -0700
Date: Thu, 24 Mar 2022 18:16:18 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 17/19] drm/i915/dg2: Flat CCS Support
Message-ID: <YjyZUghP0TgL/0WZ@ideak-desk.fi.intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-18-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220201104132.3050-18-ramalingam.c@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 04:11:30PM +0530, Ramalingam C wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> DG2 onwards discrete gfx has support for new flat CCS mapping,
> which brings in display feature in to avoid Aux walk for compressed
> surface. This support build on top of Flat CCS support added in XEHPSDV.
> FLAT CCS surface base address should be 64k aligned,
> Compressed displayable surfaces must use tile4 format.
> 
> HAS: 1407880786
> B.Spec : 7655
> B.Spec : 53902
> 
> Cc: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  4 ++-
>  drivers/gpu/drm/i915/display/intel_fb.c       | 32 +++++++++++++------
>  .../drm/i915/display/skl_universal_plane.c    | 16 ++++++----
>  3 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 189767cef356..2828ae612179 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8588,7 +8588,9 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
>  
>  		/*
>  		 * The layout of the fast clear color value expected by HW
> -		 * (the DRM ABI requiring this value to be located in fb at offset 0 of plane#2):
> +		 * (the DRM ABI requiring this value to be located in fb at
> +		 * offset 0 of cc plane, plane #2 previous generations or
> +		 * plane #1 for flat ccs):
>  		 * - 4 x 4 bytes per-channel value
>  		 *   (in surface type specific float/int format provided by the fb user)
>  		 * - 8 bytes native color value used by the display
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 3df6ef5ffec5..e94923e9dbb1 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -107,6 +107,21 @@ static const struct drm_format_info gen12_ccs_cc_formats[] = {
>  	  .hsub = 1, .vsub = 1, .has_alpha = true },
>  };
>  
> +static const struct drm_format_info gen12_flat_ccs_cc_formats[] = {
> +	{ .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 2,
> +	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> +	  .hsub = 1, .vsub = 1, },
> +	{ .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 2,
> +	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> +	  .hsub = 1, .vsub = 1, },
> +	{ .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 2,
> +	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> +	  .hsub = 1, .vsub = 1, .has_alpha = true },
> +	{ .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 2,
> +	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> +	  .hsub = 1, .vsub = 1, .has_alpha = true },
> +};
> +
>  struct intel_modifier_desc {
>  	u64 modifier;
>  	struct {
> @@ -150,6 +165,8 @@ static const struct intel_modifier_desc intel_modifiers[] = {
>  		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC_CC,
>  
>  		.ccs.cc_planes = BIT(1),
> +
> +		FORMAT_OVERRIDE(gen12_flat_ccs_cc_formats),
>  	}, {
>  		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
>  		.display_ver = { 13, 13 },
> @@ -399,17 +416,13 @@ bool intel_fb_plane_supports_modifier(struct intel_plane *plane, u64 modifier)
>  static bool format_is_yuv_semiplanar(const struct intel_modifier_desc *md,
>  				     const struct drm_format_info *info)
>  {
> -	int yuv_planes;
> -
>  	if (!info->is_yuv)
>  		return false;
>  
> -	if (plane_caps_contain_any(md->plane_caps, INTEL_PLANE_CAP_CCS_MASK))
> -		yuv_planes = 4;
> +	if (hweight8(md->ccs.planar_aux_planes) == 2)
> +		return info->num_planes == 4;
>  	else
> -		yuv_planes = 2;
> -
> -	return info->num_planes == yuv_planes;
> +		return info->num_planes == 2;
>  }
>  
>  /**
> @@ -534,12 +547,13 @@ static unsigned int gen12_ccs_aux_stride(struct intel_framebuffer *fb, int ccs_p
>  
>  int skl_main_to_aux_plane(const struct drm_framebuffer *fb, int main_plane)
>  {
> +	const struct intel_modifier_desc *md = lookup_modifier(fb->modifier);
>  	struct drm_i915_private *i915 = to_i915(fb->dev);
>  
> -	if (intel_fb_is_ccs_modifier(fb->modifier))
> +	if (md->ccs.packed_aux_planes | md->ccs.planar_aux_planes)
>  		return main_to_ccs_plane(fb, main_plane);
>  	else if (DISPLAY_VER(i915) < 11 &&
> -		 intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
> +		 format_is_yuv_semiplanar(md, fb->format))
>  		return 1;
>  	else
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index b4dced1907c5..18e50583abaa 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1176,8 +1176,10 @@ skl_plane_update_arm(struct intel_plane *plane,
>  	intel_de_write_fw(dev_priv, PLANE_OFFSET(pipe, plane_id),
>  			  PLANE_OFFSET_Y(y) | PLANE_OFFSET_X(x));
>  
> -	intel_de_write_fw(dev_priv, PLANE_AUX_DIST(pipe, plane_id),
> -			  skl_plane_aux_dist(plane_state, color_plane));
> +	/* FLAT CCS doesn't need to program AUX_DIST */
> +	if (!HAS_FLAT_CCS(dev_priv))
> +		intel_de_write_fw(dev_priv, PLANE_AUX_DIST(pipe, plane_id),
> +				  skl_plane_aux_dist(plane_state, color_plane));
>  
>  	if (DISPLAY_VER(dev_priv) < 11)
>  		intel_de_write_fw(dev_priv, PLANE_AUX_OFFSET(pipe, plane_id),
> @@ -1557,9 +1559,10 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
>  
>  	/*
>  	 * CCS AUX surface doesn't have its own x/y offsets, we must make sure
> -	 * they match with the main surface x/y offsets.
> +	 * they match with the main surface x/y offsets. On DG2
> +	 * there's no aux plane on fb so skip this checking.
>  	 */
> -	if (intel_fb_is_ccs_modifier(fb->modifier)) {
> +	if (intel_fb_is_ccs_modifier(fb->modifier) && aux_plane) {
>  		while (!skl_check_main_ccs_coordinates(plane_state, x, y,
>  						       offset, aux_plane)) {
>  			if (offset == 0)
> @@ -1603,6 +1606,8 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
>  	const struct drm_framebuffer *fb = plane_state->hw.fb;
>  	unsigned int rotation = plane_state->hw.rotation;
>  	int uv_plane = 1;
> +	int ccs_plane = intel_fb_is_ccs_modifier(fb->modifier) ?
> +			skl_main_to_aux_plane(fb, uv_plane) : 0;
>  	int max_width = intel_plane_max_width(plane, fb, uv_plane, rotation);
>  	int max_height = intel_plane_max_height(plane, fb, uv_plane, rotation);
>  	int x = plane_state->uapi.src.x1 >> 17;
> @@ -1623,8 +1628,7 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
>  	offset = intel_plane_compute_aligned_offset(&x, &y,
>  						    plane_state, uv_plane);
>  
> -	if (intel_fb_is_ccs_modifier(fb->modifier)) {
> -		int ccs_plane = main_to_ccs_plane(fb, uv_plane);
> +	if (ccs_plane) {
>  		u32 aux_offset = plane_state->view.color_plane[ccs_plane].offset;
>  		u32 alignment = intel_surf_alignment(fb, uv_plane);
>  
> -- 
> 2.20.1
> 
