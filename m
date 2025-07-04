Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21DDAF92F0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89F010EA29;
	Fri,  4 Jul 2025 12:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqbTr7Lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CA110EA27;
 Fri,  4 Jul 2025 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632907; x=1783168907;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VMimZZzDm4ffprsVOEIy1VnLqTyJjDCp0LOYf/zSD7A=;
 b=UqbTr7LrHvlNQAi/X059mgG6m7/y9HH1WxxrGMUEpsyifDNVhC6ztsD5
 SxngOFVSv/0nPs+f5T+T+sWMviHkhRbWTowmqF6OXWcgrT/UyDRNRLh6B
 5ipMvUwKtptyo9Tevy1+zWi/Sv1iCFtKXnwL3+gLDCnKSDhUcq/H4yaJ1
 Ue1q/dHUi2GIAdmpWaNufIy3lx01vl8LrvjZ7QYew+3uwmUIEbZ3KAhmL
 91kstNoGijGVxWgzC2hTC/jekqG++yUmCkiFAc8fHFSSAoQ4CcdfkreXT
 8y4LxiBEyEyK5z6nB21V17hmEkbk0E06jIrcjGBtybNdcSUOwlA1GRjmT g==;
X-CSE-ConnectionGUID: Fs6h6ARUSiGSj/4KDQRW4g==
X-CSE-MsgGUID: r6JeJ1E1QVyh8q5DB5NDxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53099708"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="53099708"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:41:12 -0700
X-CSE-ConnectionGUID: rMz5hDw6SZ6OR4tgSjZY9A==
X-CSE-MsgGUID: oS7116FbRx2/9hms9o9kBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154999813"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:41:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com, Uma
 Shankar <uma.shankar@intel.com>
Subject: Re: [v5 11/24] drm/i915/color: Add and attach COLORPIPELINE plane
 property
In-Reply-To: <20250702091936.3004854-12-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-12-uma.shankar@intel.com>
Date: Fri, 04 Jul 2025 15:41:03 +0300
Message-ID: <a02f21ae52d9ebe4c4e2808c945d6990542c2900@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 02 Jul 2025, Uma Shankar <uma.shankar@intel.com> wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> Add supported color pipelines and attach it to plane.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 42 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h |  3 ++
>  2 files changed, 45 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 90ac6530d1a5..363c9590c5c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4050,6 +4050,48 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
>  	return 0;
>  }
>  
> +int intel_plane_color_init(struct drm_plane *plane)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct intel_display *display = to_intel_display(dev);
> +	struct drm_property *prop;
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	int len = 0;
> +	int ret;
> +
> +	/* Currently expose pipeline only for HDR planes*/
> +	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
> +		return 0;
> +
> +	/* Add "Bypass" (i.e. NULL) pipeline */
> +	pipelines[len].type = 0;
> +	pipelines[len].name = "Bypass";
> +	len++;
> +
> +	/* Add pipeline consisting of transfer functions */
> +	ret = intel_plane_tf_pipeline_init(plane, &pipelines[len]);
> +	if (ret)
> +		return ret;
> +	len++;
> +
> +	/* Create COLOR_PIPELINE property and attach */
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"COLOR_PIPELINE",
> +					pipelines, len);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	plane->color_pipeline_property = prop;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +
> +	/* TODO check if needed */
> +	if (plane->state)
> +		plane->state->color_pipeline = NULL;
> +
> +	return 0;
> +}
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)
>  {
>  	struct intel_display *display = to_intel_display(crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
> index ce9db761c6e2..c2561b86bb26 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -18,6 +18,8 @@ struct drm_plane;
>  struct drm_prop_enum_list;
>  enum intel_color_block;
>  
> +#define MAX_COLOR_PIPELINES 5

If it does not need to be in the header, it does not belong in the
header.

> +
>  void intel_color_init_hooks(struct intel_display *display);
>  int intel_color_init(struct intel_display *display);
>  void intel_color_crtc_init(struct intel_crtc *crtc);
> @@ -46,5 +48,6 @@ void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
>  struct intel_plane_colorop *intel_colorop_alloc(void);
>  struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
>  int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
> +int intel_plane_color_init(struct drm_plane *plane);

Maybe this all deserves a separate file, intel_plane_color.[ch] or something?

>  
>  #endif /* __INTEL_COLOR_H__ */

-- 
Jani Nikula, Intel
