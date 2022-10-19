Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83064605107
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 22:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1E710E00A;
	Wed, 19 Oct 2022 20:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA6010E00A;
 Wed, 19 Oct 2022 20:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666210118; x=1697746118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w6nLBcsJEQTOmryILkIehlRCPUI0QAyrJP36MzD6J6E=;
 b=nXTJ+MmUrdeoG+8s7QvUOm7MLLe00s74hYnYz2VU/yuSumMIxf9U34uo
 /ruOq5JTbuQcSWtjDFFA2cpEMKX2bMEjG4U81x1iQ5G30DOx65oR95Bn1
 ZKfM/Xu39SAVuTwljFyNgBKItL07z7zr0X2PbBS/KWJ4ffo2WBgnRndwP
 cf/6kqwwKosheqJfmRBDrNivZziOcj7i3cXkfQsBGuHnWzM1zRvVBdIE+
 a+E1tFaG5otD3tysxsmMhcajS8By3Xo0kZc6egftvL7dQ/q6QVXip7VQb
 /h6BRJhGTN7jNcmBFfZuQdQbXKfyviUt33S0KVHvpK2+8BAmxjTMCvZz5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="289831384"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="289831384"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 13:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="804468669"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="804468669"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga005.jf.intel.com with SMTP; 19 Oct 2022 13:08:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 23:08:34 +0300
Date: Wed, 19 Oct 2022 23:08:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 13/15] drm/edid: move edid load declarations to internal
 header
Message-ID: <Y1BZQtGAvW41mO1f@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <bac72a569dfe1bb604f4b3089fefbb2c71af47b6.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bac72a569dfe1bb604f4b3089fefbb2c71af47b6.1665496046.git.jani.nikula@intel.com>
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

On Tue, Oct 11, 2022 at 04:49:47PM +0300, Jani Nikula wrote:
> The EDID loader is internal to drm, not for drivers.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_crtc_internal.h | 11 +++++++++++
>  drivers/gpu/drm/drm_edid_load.c     |  5 +++--
>  include/drm/drm_edid.h              |  7 -------
>  3 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index fb8a68d90940..501a10edd0e1 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -290,3 +290,14 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
>  int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
>  int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
>  int drm_edid_override_reset(struct drm_connector *connector);
> +
> +/* drm_edid_load.c */
> +#ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
> +const struct drm_edid *drm_edid_load_firmware(struct drm_connector *connector);
> +#else
> +static inline const struct drm_edid *
> +drm_edid_load_firmware(struct drm_connector *connector)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 248f0685c33e..882caaa6e663 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -11,12 +11,13 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_print.h>
>  
> +#include "drm_crtc_internal.h"
> +
>  static char edid_firmware[PATH_MAX];
>  module_param_string(edid_firmware, edid_firmware, sizeof(edid_firmware), 0644);
>  MODULE_PARM_DESC(edid_firmware, "Do not probe monitor, use specified EDID blob "
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 8138613f4e4e..372963600f1d 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -388,15 +388,8 @@ int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);
>  
>  #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
> -const struct drm_edid *drm_edid_load_firmware(struct drm_connector *connector);
>  int __drm_set_edid_firmware_path(const char *path);
>  int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
> -#else
> -static inline const struct drm_edid *
> -drm_edid_load_firmware(struct drm_connector *connector)
> -{
> -	return ERR_PTR(-ENOENT);
> -}
>  #endif
>  
>  bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
