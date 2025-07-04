Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE5AF92CB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B9610EA1F;
	Fri,  4 Jul 2025 12:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpmIox5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F57510EA1B;
 Fri,  4 Jul 2025 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632621; x=1783168621;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3TDiQWtb4vP0uBKbmMldLzY4FWBIxLCwH+vjIWDoqQI=;
 b=MpmIox5LFzQymdwjkpHW51yT4eQLHe7IDq37JPyqqyPayWKmDpIAaU89
 JIO2a7h3/scuyjcyS+yGPufircveXH1ARUw9FXnfQ+9cNYR1ywpwvwGFW
 ngLYzm860pI12bajnUrefEU4G9Oay8mZGYknclcdQcV+9I9kaXyDw9kvE
 /yqXtKhy5G9QiMTz+OXwVxOEfuh5cTgXzJeOyUY74sVbyYbZEbleBS6mN
 mzFoMZMST8RnK8ylIwXv54UlCswgY6b2XkJd50S20Xyr62B3ot9x5XOFN
 wI+w8Kih4GeRVU577z1ckTsuxTUvsTVQTcMTCsu8vcAQYimBYhHBkl04h w==;
X-CSE-ConnectionGUID: fGH4+ZAnRLqoB0X1mALHHQ==
X-CSE-MsgGUID: JBRJS88KRrWcJCIrDrKrTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54086540"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="54086540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:37:00 -0700
X-CSE-ConnectionGUID: 82ewt+tiQzmplpINe4PECQ==
X-CSE-MsgGUID: ruRC1dk4QTWsp8vUiqN3gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="158666174"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:36:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com, Uma
 Shankar <uma.shankar@intel.com>
Subject: Re: [v5 08/24] drm/i915: Add intel_color_op
In-Reply-To: <20250702091936.3004854-9-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-9-uma.shankar@intel.com>
Date: Fri, 04 Jul 2025 15:36:52 +0300
Message-ID: <a1041449fc842bbda7760833b45bc96d15c641d6@intel.com>
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
> Add data structure to store intel specific details of colorop
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index ce45261c4a8f..4b5124a08cc9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1560,6 +1560,10 @@ struct intel_plane {
>  #define to_intel_framebuffer(fb) \
>  	container_of_const((fb), struct intel_framebuffer, base)
>  
> +#define intel_fb_obj(x) ((x) ? to_intel_bo((x)->obj[0]) : NULL)
> +#define to_intel_plane_colorop(x) container_of(x, struct intel_plane_colorop, base)
> +#define to_intel_colorop_state(x) container_of(x, struct intel_plane_colorop_state, uapi)

I think this makes further refactoring harder. Please make them proper
functions instead, not even static inlines.

See what I've done for intel_global_state stuff.

> +
>  struct intel_hdmi {
>  	i915_reg_t hdmi_reg;
>  	struct {
> @@ -1932,6 +1936,21 @@ struct intel_dp_mst_encoder {
>  	struct intel_connector *connector;
>  };
>  
> +struct intel_plane_colorop {
> +	struct drm_colorop base;
> +	enum intel_color_block id;
> +};
> +
> +struct intel_plane_colorop_state {
> +	struct drm_colorop_state uapi;
> +
> +	/* TODO: Add hw implementation */
> +	struct {
> +		bool active, enable;
> +		struct drm_property_blob *data;
> +	} hw;
> +};
> +
>  static inline struct intel_encoder *
>  intel_attached_encoder(struct intel_connector *connector)
>  {

-- 
Jani Nikula, Intel
