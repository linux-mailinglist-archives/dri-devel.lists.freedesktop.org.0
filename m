Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C8CB90EB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 16:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BAC10E82D;
	Fri, 12 Dec 2025 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYU34fpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12BA10E07B;
 Fri, 12 Dec 2025 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765552139; x=1797088139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HnGdM6nX9FdHQsZj25d0Xh7SqYJyE+86qlBS+1claN4=;
 b=NYU34fpwYiNo8ybBMXUBOuxKG/9nTZy6sWGkMgSmwE3APbgVvBEpCZfW
 g2T2fbi4pWFcl6oufq9cw46kHBIZvmpCF8Dq8n15BGI8jFpos4WgRbpFC
 mrdA3zYzSKpLGxxTQYKirHvU5o6WJqUzV/5NmCEKHTjlWZEVOGMOswXIB
 x9JTyloJtGmnyZj8FnmHVHeOK9Is2Y07vKQdTK3DqQWIF++fMiccxFWiy
 D17aq9aph5CnAzmjRFqjp/UKgr/zn5mObQFVHc92oyPCxcWqGo1DjClgR
 ahZPWCbsopnRC12uZYunBoEZZ896TwW2SCEKzpPECSqHFdUm99Y7QR0gQ w==;
X-CSE-ConnectionGUID: Wr2h7J0KRnmEuOGmjOiLUg==
X-CSE-MsgGUID: 1j+fj0LGQTansKfx5BI4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67715297"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67715297"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:08:59 -0800
X-CSE-ConnectionGUID: si564PKyQtyESubsp7L6kQ==
X-CSE-MsgGUID: Ol0cD7cTSu6ik9/e5j6QGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="196857950"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:08:55 -0800
Date: Fri, 12 Dec 2025 17:08:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chaitanya.kumar.borah@intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr,
 harry.wentland@amd.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, swati2.sharma@intel.com,
 alex.hung@amd.com, jani.nikula@intel.com, suraj.kandpal@intel.com
Subject: Re: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
Message-ID: <aTwwBMKUp5AYmFTN@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <20251203085211.3663374-15-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251203085211.3663374-15-uma.shankar@intel.com>
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

On Wed, Dec 03, 2025 at 02:22:10PM +0530, Uma Shankar wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Add helpers to program the 3D LUT registers and arm them.
> 
> LUT_3D_READY in LUT_3D_CLT is cleared off by the HW once
> the LUT buffer is loaded into it's internal working RAM.
> So by the time we try to load/commit new values, we expect
> it to be cleared off. If not, log an error and return
> without writing new values. Do it only when writing with MMIO.
> There is no way to read register within DSB execution.
> 
> v2:
> - Add information regarding LUT_3D_READY to commit message (Jani)
> - Log error instead of a drm_warn and return without committing changes
>   if 3DLUT HW is not ready to accept new values.
> - Refactor intel_color_crtc_has_3dlut()
>   Also remove Gen10 check (Suraj)
> v3:
> - Addressed review comments (Suraj)
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c    | 78 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |  4 +
>  .../drm/i915/display/intel_color_pipeline.c   | 29 +++++--
>  .../drm/i915/display/intel_color_pipeline.h   |  3 +-
>  .../drm/i915/display/intel_display_limits.h   |  1 +
>  .../drm/i915/display/intel_display_types.h    |  2 +-
>  drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
>  7 files changed, 112 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 08f3b5b47b8e..e7950655434b 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4062,6 +4062,52 @@ xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *pla
>  		xelpd_program_plane_post_csc_lut(dsb, plane_state);
>  }
>  
> +static u32 glk_3dlut_10(const struct drm_color_lut32 *color)
> +{
> +	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, drm_color_lut32_extract(color->red, 10)) |
> +		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, drm_color_lut32_extract(color->green, 10)) |
> +		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, drm_color_lut32_extract(color->blue, 10));
> +}
> +
> +static void glk_load_lut_3d(struct intel_dsb *dsb,
> +			    struct intel_crtc *crtc,
> +			    const struct drm_property_blob *blob)
> +{
> +	struct intel_display *display = to_intel_display(crtc->base.dev);
> +	const struct drm_color_lut32 *lut = blob->data;
> +	int i, lut_size = drm_color_lut32_size(blob);
> +	enum pipe pipe = crtc->pipe;
> +
> +	if (!dsb && intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY) {
> +		drm_err(display->drm, "[CRTC:%d:%s] 3D LUT not ready, not loading LUTs\n",
> +			crtc->base.base.id, crtc->base.name);
> +		return;

Just ran into this while perusing the code...

This check could be implemented exactly like intel_vrr_check_push_sent()
so that it works for both the DSB and non-DSB paths. The 'return' should
just get nuked IMO.

> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
> +				  const struct intel_plane_state *plane_state)
> +{
> +	struct intel_display *display = to_intel_display(plane_state);
> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
> +
> +	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
> +		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
                                              ^^^^^^^^^^^^

And this looks like a pretty major fail. Why is the 3D LUT stored in
the *plane* state when it's a pipe level thing?

-- 
Ville Syrjälä
Intel
