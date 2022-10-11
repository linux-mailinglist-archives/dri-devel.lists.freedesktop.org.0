Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5390C5FB067
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 12:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5910E2F3;
	Tue, 11 Oct 2022 10:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107D710E090;
 Tue, 11 Oct 2022 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665483939; x=1697019939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8MjcMDNPFXWYvGZJPc+0BvHSgk1zBlXPrTWEqomf8Wk=;
 b=VKnHNHIGRWp8MQuV3QGpA170srEvYdPxbbOEE0J0N3YN0oRhJYXsSnnw
 4qbsGl8LZALWYzdQkan+WLxPIeHrSZic/K3zIfXOpUWbpu2wRZQ82kGra
 DQO42ly4PK76stMsWQsWhXQkPcLkj/ybHxJe8uR4+Q3SFHugJsawSkGvM
 c9nUEDTa1/UNv1/j98QT5jA3cCIx7QbHlTCCkcJyAemVOpssV4QrQooS8
 RF+OTyFBDxhHWF3bZvxdRVgLMHkZZg6FbguwTughCPukOdaki5U6eItmW
 BOxwu5gclclFbBkVrJCljcQHrPPXT3z/BMlwZet7MaTsh0NKIeXuXhdaj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="366458903"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="366458903"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 03:25:37 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="871459109"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="871459109"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.106])
 by fmsmga006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 03:25:36 -0700
Date: Tue, 11 Oct 2022 12:25:33 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC] drm: split build lists one per line and sort
Message-ID: <Y0VEnTB950XYrhBI@ashyti-mobl2.lan>
References: <20221011100137.2838947-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011100137.2838947-1-jani.nikula@intel.com>
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

Hi Jani,

> While it takes more vertical space, sorted build lists with one object
> per line are arguably easier to manage, especially when there are
> conflicting changes.
> 
> Split anything with more than one object file.

looks much better! Just an error below.

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Makefile         | 106 ++++++++++++++++++++++---------
>  drivers/gpu/drm/display/Makefile |  14 ++--
>  2 files changed, 84 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 25d0ba310509..c4e6ef321566 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -3,32 +3,70 @@
>  # Makefile for the drm device driver.  This driver provides support for the
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>  
> -drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
> -		drm_file.o drm_gem.o drm_ioctl.o \
> -		drm_drv.o \
> -		drm_sysfs.o drm_mm.o \
> -		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o drm_displayid.o \
> -		drm_trace_points.o drm_prime.o \
> -		drm_vma_manager.o \
> -		drm_modeset_lock.o drm_atomic.o drm_bridge.o \
> -		drm_framebuffer.o drm_connector.o drm_blend.o \
> -		drm_encoder.o drm_mode_object.o drm_property.o \
> -		drm_plane.o drm_color_mgmt.o drm_print.o \
> -		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
> -		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> -		drm_client_modeset.o drm_atomic_uapi.o \
> -		drm_managed.o drm_vblank_work.o
> -drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
> -			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
> -			    drm_memory.o drm_scatter.o drm_vm.o
> +drm-y := \
> +	drm_aperture.o \
> +	drm_atomic.o \
> +	drm_atomic_uapi.o \
> +	drm_auth.o drm_cache.o \

You forgot to split here and drm_cache.o goes after drm_bridge.o

Other than this there are no errors, I checked them all.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> +	drm_blend.o \
> +	drm_bridge.o \
> +	drm_client.o \
> +	drm_client_modeset.o \
> +	drm_color_mgmt.o \
> +	drm_connector.o \
> +	drm_crtc.o \

[...]
