Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E67605105
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 22:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F26210E096;
	Wed, 19 Oct 2022 20:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FED310E18B;
 Wed, 19 Oct 2022 20:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666210080; x=1697746080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PsXDB7rNysBCeQ3MBniVtSj6EkQTclRI+FqQI+rsPmc=;
 b=Kvq81eluImTgS4L6OHm1nYuXSFpahvNm/NfrTtYBgJUWZG3GmfClR40i
 5vJPn7/sAg2Dnkn58p7sIW/apLHhsGmGzEVBJubl43ke6O/x6pHhDSJO6
 /3s6lzWH8qQq5DZrYqmgALABSvhUhIihrolYOsXa0hKGGX0zPCfTrPezF
 evGmwS6z7ucG626FAxGQIVElYkCedMyYcDy0osqHECzx1JbyA6oOihx29
 bF/4GnAiNwpmC8d3TLa4htPhC3s/bLYVi15BYCYuJNxXndWe21r+9y6Qf
 vE3wwGltifMnhAKpsiKffwYBURtANetOs7SewLTksKgUlB/r/cxlHLJSe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286236376"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286236376"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 13:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="754742235"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="754742235"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga004.jf.intel.com with SMTP; 19 Oct 2022 13:07:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 23:07:56 +0300
Date: Wed, 19 Oct 2022 23:07:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 11/15] drm/edid/firmware: rename drm_load_edid_firmware()
 to drm_edid_load_firmware()
Message-ID: <Y1BZHM2OMcoijjlH@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <91b8b40b2ef4da1d7d1c30adad6eaed611551a3b.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91b8b40b2ef4da1d7d1c30adad6eaed611551a3b.1665496046.git.jani.nikula@intel.com>
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

On Tue, Oct 11, 2022 at 04:49:45PM +0300, Jani Nikula wrote:
> Follow the usual naming convention by file name.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c      | 10 +++++-----
>  drivers/gpu/drm/drm_edid_load.c |  2 +-
>  include/drm/drm_edid.h          |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0f2898badd51..2c66a901474d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2211,7 +2211,7 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
>  		override = drm_edid_duplicate(connector->edid_override->edid);
>  
>  	if (!override)
> -		override = drm_load_edid_firmware(connector);
> +		override = drm_edid_load_firmware(connector);
>  
>  	/* FIXME: Get alloc size from deeper down the stack */
>  	if (!IS_ERR_OR_NULL(override) && alloc_size)
> @@ -2443,7 +2443,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>   * adapter and use drm_get_edid() instead of abusing this function.
>   *
>   * The EDID may be overridden using debugfs override_edid or firmware EDID
> - * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
> + * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
>   * order. Having either of them bypasses actual EDID reads.
>   *
>   * Return: Pointer to valid EDID or NULL if we couldn't find any.
> @@ -2621,7 +2621,7 @@ EXPORT_SYMBOL(drm_get_edid);
>   * this function.
>   *
>   * The EDID may be overridden using debugfs override_edid or firmware EDID
> - * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
> + * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
>   * order. Having either of them bypasses actual EDID reads.
>   *
>   * The returned pointer must be freed using drm_edid_free().
> @@ -2659,7 +2659,7 @@ EXPORT_SYMBOL(drm_edid_read_custom);
>   * Read EDID using the given I2C adapter.
>   *
>   * The EDID may be overridden using debugfs override_edid or firmware EDID
> - * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
> + * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
>   * order. Having either of them bypasses actual EDID reads.
>   *
>   * Prefer initializing connector->ddc with drm_connector_init_with_ddc() and
> @@ -2695,7 +2695,7 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
>   * Read EDID using the connector's I2C adapter.
>   *
>   * The EDID may be overridden using debugfs override_edid or firmware EDID
> - * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
> + * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
>   * order. Having either of them bypasses actual EDID reads.
>   *
>   * The returned pointer must be freed using drm_edid_free().
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 13cdbfb991eb..bc6b96abd1b3 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -262,7 +262,7 @@ static void *edid_load(struct drm_connector *connector, const char *name)
>  	return edid;
>  }
>  
> -struct edid *drm_load_edid_firmware(struct drm_connector *connector)
> +struct edid *drm_edid_load_firmware(struct drm_connector *connector)
>  {
>  	char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
>  	struct edid *edid;
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index a2e25e7e6ee5..dc7467d25cd8 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -388,12 +388,12 @@ int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);
>  
>  #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
> -struct edid *drm_load_edid_firmware(struct drm_connector *connector);
> +struct edid *drm_edid_load_firmware(struct drm_connector *connector);
>  int __drm_set_edid_firmware_path(const char *path);
>  int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
>  #else
>  static inline struct edid *
> -drm_load_edid_firmware(struct drm_connector *connector)
> +drm_edid_load_firmware(struct drm_connector *connector)
>  {
>  	return ERR_PTR(-ENOENT);
>  }
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
