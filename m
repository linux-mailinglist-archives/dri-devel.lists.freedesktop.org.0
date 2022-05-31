Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF46539549
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9FF1123A7;
	Tue, 31 May 2022 17:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A011123A4;
 Tue, 31 May 2022 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654017130; x=1685553130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ndM4AD6o1dJEEHK93ON05eFExAVWNddGpirvljqZr9k=;
 b=jIrBBZd2Dj6nM4IV39nHJEye4Hl9U77+swL5jC1ajycPPOlwPGh6+lIf
 bBIqcX0IK8+K/dph9MvGh1vX7HKVn3Qq/xLruGG0vrHVLhKMmtmr7doQL
 51eYcL0OV56zX/rsGy0/HcNftqKnTf4dKT69I9HXdVUUQo1IgAGcFJ59s
 qQqc0HpbH8F77nRfmgFaqrmebPR8o0MkOlg4oYnaIglsVBQAgn6i1I8j3
 5aJatRPJA6f8cm4gjVKxAPI5ssVRjK7pwx7RS+dEyg849YFm/vxHyMnRp
 /qNr7wrAeNpcUykZ2fOTOG7OcShmwY9sO9gg78fWc4trBHsERBIX06Bfa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="257391813"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="257391813"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 10:12:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="551883082"
Received: from mdnavare-mobl1.jf.intel.com ([10.165.21.211])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 10:12:09 -0700
Date: Tue, 31 May 2022 10:12:23 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [RFC V3 1/2] drm/vrr: Attach vrr_enabled property to the drm crtc
Message-ID: <20220531171223.GA257110@mdnavare-mobl1.jf.intel.com>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
 <20220517072636.3516381-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220517072636.3516381-2-bhanuprakash.modem@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 17, 2022 at 12:56:35PM +0530, Bhanuprakash Modem wrote:
> Modern display hardware is capable of supporting variable refresh rates.
> This patch introduces helpers to attach and set "vrr_enabled" property
> on the crtc to allow userspace to query VRR enabled status on that crtc.
> 
> Atomic drivers should attach this property to crtcs those are capable of
> driving variable refresh rates using
> drm_mode_crtc_attach_vrr_enabled_property().

We are not attaching the prop anymore, please remove this from the
commit message.

> 
> The value should be updated based on driver and hardware capability
> by using drm_mode_crtc_set_vrr_enabled_property().
> 
> V2: Use property flag as atomic
> V3: Drop helper to attach vrr_enabled prop, since it is already
> attached (Manasi)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  drivers/gpu/drm/drm_crtc.c        | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c |  2 +-
>  include/drm/drm_crtc.h            |  3 +++
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 26a77a735905..8bb8b4bf4199 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -239,6 +239,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
>   * 		Driver's default scaling filter
>   * 	Nearest Neighbor:
>   * 		Nearest Neighbor scaling filter
> + * VRR_ENABLED:
> + *	Atomic property for setting the VRR state of the CRTC.
> + *	To enable the VRR on CRTC, user-space must set this property to 1.

This prop was primarily a userspace Write only and driver read only
property which would be used only by the userspace to request VRR on
that CRTC,

Are we now modifying this to be used as a bidirectional property to also
indicate the status of VRR on that CRTC which will be updated by the
driver?

We need to add this accordingly and update the DRM documentation and
also get acks from other vendors since AMD and other folks mght be using
this as a write only prop.

Manasi

>   */
>  
>  __printf(6, 0)
> @@ -883,3 +886,26 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> +
> +/**
> + * drm_mode_crtc_set_vrr_enabled_property - sets the vrr enabled property for
> + * a crtc.
> + * @crtc: drm CRTC
> + * @vrr_enabled: True to enable the VRR on CRTC
> + *
> + * Should be used by atomic drivers to update the VRR enabled status on a CRTC
> + */
> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
> +					    bool vrr_enabled)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	if (!config->prop_vrr_enabled)
> +		return;
> +
> +	drm_object_property_set_value(&crtc->base,
> +				      config->prop_vrr_enabled,
> +				      vrr_enabled);
> +}
> +EXPORT_SYMBOL(drm_mode_crtc_set_vrr_enabled_property);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 37b4b9f0e468..b7cde73d5586 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -323,7 +323,7 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.prop_mode_id = prop;
>  
> -	prop = drm_property_create_bool(dev, 0,
> +	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
>  			"VRR_ENABLED");
>  	if (!prop)
>  		return -ENOMEM;
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index a70baea0636c..906787398f40 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1333,4 +1333,7 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  					    unsigned int supported_filters);
>  
> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
> +					    bool vrr_enabled);
> +
>  #endif /* __DRM_CRTC_H__ */
> -- 
> 2.35.1
> 
