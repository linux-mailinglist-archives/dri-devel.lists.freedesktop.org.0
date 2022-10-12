Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613BB5FC55A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A84710E47E;
	Wed, 12 Oct 2022 12:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1B310E471;
 Wed, 12 Oct 2022 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665577952; x=1697113952;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gnqSth5Eb1BHxVdsEv9QSiPI0CZfxFrVuukr4s3S/yg=;
 b=Z7W8LyGIETGjMUe0/5YfQ5YvfNOwV6BsviZMkwcH9yf6ddD6pfVVPQUA
 4aacWIrAMqLJQlnGeU07jonchQ+YPSHgFijwu1wrk6OF7UJ7kHc4xI9Yl
 HqBsYgrGYO3X1IJsWgRBEwW87/7YSOLfWqi2e12nTKKRqISGBgan+xWuG
 xBteq/ZIkmpokWxGff/Z4rN9mTZTqlZlg8zVLCaCiNXHp3XKH4YzzKPA7
 3anSarcMJB+SssBVPzlNxw2rme+UvZzriV7EYgi/oAzgVGjVi+jYXFDB7
 nR8h7xk0fEsuq2Lx2ohfKMO+NLCVRU0JnLmwpefyuuh1b79hfjxeb+E7Q Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="304767037"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="304767037"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 05:32:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="871893444"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="871893444"
Received: from jhpuonti-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.226])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 05:32:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: split build lists one per line and sort
In-Reply-To: <20221011140830.3257655-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221011140830.3257655-1-jani.nikula@intel.com>
Date: Wed, 12 Oct 2022 15:32:32 +0300
Message-ID: <87k055w7bz.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Oct 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> While it takes more vertical space, sorted build lists with one object
> per line are arguably easier to manage, especially when there are
> conflicting changes.
>
> Split anything with more than one object file.
>
> v2: also split drm_cache.o and put it after drm_bridge.o (Andi)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Cc: drm-misc maintainers, don't really want to push this without an
approval from you guys.

BR,
Jani.

> ---
>  drivers/gpu/drm/Makefile         | 107 ++++++++++++++++++++++---------
>  drivers/gpu/drm/display/Makefile |  14 ++--
>  2 files changed, 85 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 25d0ba310509..6ad98d3ceff7 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -3,32 +3,71 @@
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
> +	drm_auth.o \
> +	drm_blend.o \
> +	drm_bridge.o \
> +	drm_cache.o \
> +	drm_client.o \
> +	drm_client_modeset.o \
> +	drm_color_mgmt.o \
> +	drm_connector.o \
> +	drm_crtc.o \
> +	drm_displayid.o \
> +	drm_drv.o \
> +	drm_dumb_buffers.o \
> +	drm_edid.o \
> +	drm_encoder.o \
> +	drm_file.o \
> +	drm_fourcc.o \
> +	drm_framebuffer.o \
> +	drm_gem.o \
> +	drm_ioctl.o \
> +	drm_lease.o \
> +	drm_managed.o \
> +	drm_mm.o \
> +	drm_mode_config.o \
> +	drm_mode_object.o \
> +	drm_modes.o \
> +	drm_modeset_lock.o \
> +	drm_plane.o \
> +	drm_prime.o \
> +	drm_print.o \
> +	drm_property.o \
> +	drm_syncobj.o \
> +	drm_sysfs.o \
> +	drm_trace_points.o \
> +	drm_vblank.o \
> +	drm_vblank_work.o \
> +	drm_vma_manager.o \
> +	drm_writeback.o
> +drm-$(CONFIG_DRM_LEGACY) += \
> +	drm_agpsupport.o \
> +	drm_bufs.o \
> +	drm_context.o \
> +	drm_dma.o \
> +	drm_hashtab.o \
> +	drm_irq.o \
> +	drm_legacy_misc.o \
> +	drm_lock.o \
> +	drm_memory.o \
> +	drm_scatter.o \
> +	drm_vm.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
>  drm-$(CONFIG_COMPAT) += drm_ioc32.o
>  drm-$(CONFIG_DRM_PANEL) += drm_panel.o
>  drm-$(CONFIG_OF) += drm_of.o
>  drm-$(CONFIG_PCI) += drm_pci.o
> -drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
> +drm-$(CONFIG_DEBUG_FS) += \
> +	drm_debugfs.o \
> +	drm_debugfs_crc.o
>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
> -drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
> +drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
> +	drm_privacy_screen.o \
> +	drm_privacy_screen_x86.o
>  obj-$(CONFIG_DRM)	+= drm.o
>  
>  obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
> @@ -57,16 +96,24 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
>  # Modesetting helpers
>  #
>  
> -drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
> -		drm_encoder_slave.o drm_flip_work.o \
> -		drm_probe_helper.o \
> -		drm_plane_helper.o drm_atomic_helper.o \
> -		drm_kms_helper_common.o \
> -		drm_simple_kms_helper.o drm_modeset_helper.o \
> -		drm_gem_atomic_helper.o \
> -		drm_gem_framebuffer_helper.o \
> -		drm_atomic_state_helper.o drm_damage_helper.o \
> -		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
> +drm_kms_helper-y := \
> +	drm_atomic_helper.o \
> +	drm_atomic_state_helper.o \
> +	drm_bridge_connector.o \
> +	drm_crtc_helper.o \
> +	drm_damage_helper.o \
> +	drm_encoder_slave.o \
> +	drm_flip_work.o \
> +	drm_format_helper.o \
> +	drm_gem_atomic_helper.o \
> +	drm_gem_framebuffer_helper.o \
> +	drm_kms_helper_common.o \
> +	drm_modeset_helper.o \
> +	drm_plane_helper.o \
> +	drm_probe_helper.o \
> +	drm_rect.o \
> +	drm_self_refresh_helper.o \
> +	drm_simple_kms_helper.o
>  drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>  drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>  obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 52cdda1180d9..17ac4a1006a8 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -3,13 +3,15 @@
>  obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>  
>  drm_display_helper-y := drm_display_helper_mod.o
> -drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += drm_dp_dual_mode_helper.o \
> -						      drm_dp_helper.o \
> -						      drm_dp_mst_topology.o \
> -						      drm_dsc_helper.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
> +	drm_dp_dual_mode_helper.o \
> +	drm_dp_helper.o \
> +	drm_dp_mst_topology.o \
> +	drm_dsc_helper.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
> -drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += drm_hdmi_helper.o \
> -							drm_scdc_helper.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
> +	drm_hdmi_helper.o \
> +	drm_scdc_helper.o
>  drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
>  drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o

-- 
Jani Nikula, Intel Open Source Graphics Center
