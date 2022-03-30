Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243DA4EBC6E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3C10F700;
	Wed, 30 Mar 2022 08:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BC310F700
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648628027; x=1680164027;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=C5HI1IoSlfTKJjSeHwGSgujb2Wr0A2YmFyFNiUAsuEc=;
 b=ljnTiOcuP01u6bllGyAizv1+hnRYrgKFg55WseqztOpdT8Qq+ZHnIQqI
 7tCFuRs9rldpPm9DlT0IUInUEE5YZ29N3O7nY1YOF4tJ25V40MOJWeGPk
 Igyq+xdcQ8/wCrOP8yG72Zy/I9zTCM/ofl0bSy1or7DHAN/ikuV9bZpd+
 eLp+owl6K9vkaOrfrIrrHjsUwvxjUlhHl/Lz5woJkLElPu8m3jbYk042v
 9OwydT5dqtLLecJLUog9LP7i1xlIs10fcoLAM0/TEABSSco6TW2C5f1ci
 qU0JavN9mdlmZlqbBiIy5+JRr/7mycl67mLrFHFF5LMbFDkb7+C1cM/XG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="284387202"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="284387202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 01:13:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="565404905"
Received: from nhanus-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 01:13:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Subject: Re: [PATCH 1/8] drm: Put related statements next to each other in
 Makefile
In-Reply-To: <20220322192743.14414-2-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-2-tzimmermann@suse.de>
Date: Wed, 30 Mar 2022 11:13:33 +0300
Message-ID: <87ilrvdfiq.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Mar 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Give the Makefile a bit more structure by putting rules for core,
> helpers, drivers, etc next to each other.

If you're up for it, I think it would be time to split these one per
line, in alphabetical order, to make the diffs nicer:

drm-y := \
	drm_aperture.o \
	drm_auth.o \
	...

Sure it takes up a lot of vertical screen estate, but IMO makes life
easier in the long run.

Definitely can be a follow-up, I don't really want to make the series
harder to land than it already is.


BR,
Jani.


>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/Makefile | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index c2ef5f9fce54..e5929437e13c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -18,7 +18,6 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
>  		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>  		drm_client_modeset.o drm_atomic_uapi.o \
>  		drm_managed.o drm_vblank_work.o
> -
>  drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
>  			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
>  			    drm_memory.o drm_scatter.o drm_vm.o
> @@ -30,8 +29,16 @@ drm-$(CONFIG_PCI) += drm_pci.o
>  drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
>  drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
> +obj-$(CONFIG_DRM)	+= drm.o
>  
>  obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
> +obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> +
> +#
> +# Memory-management helpers
> +#
> +
> +obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>  
>  drm_cma_helper-y := drm_gem_cma_helper.o
>  drm_cma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_cma_helper.o
> @@ -40,14 +47,16 @@ obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
>  drm_shmem_helper-y := drm_gem_shmem_helper.o
>  obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
>  
> -obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> -
>  drm_vram_helper-y := drm_gem_vram_helper.o
>  obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>  
>  drm_ttm_helper-y := drm_gem_ttm_helper.o
>  obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
>  
> +#
> +# Modesetting helpers
> +#
> +
>  drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
>  		drm_dsc.o drm_encoder_slave.o drm_flip_work.o drm_hdcp.o \
>  		drm_probe_helper.o \
> @@ -60,14 +69,16 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
>  		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
>  drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>  drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
> -
>  obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
> +
> +#
> +# Drivers and the rest
> +#
> +
>  obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
>  
> -obj-$(CONFIG_DRM)	+= drm.o
>  obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
>  obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
> -obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>  obj-y			+= arm/
>  obj-y			+= dp/
>  obj-$(CONFIG_DRM_TTM)	+= ttm/

-- 
Jani Nikula, Intel Open Source Graphics Center
