Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE382652F16
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE8510E443;
	Wed, 21 Dec 2022 10:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CFE10E443
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671616863; x=1703152863;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XhLkn6n9p/f7xIIPf1YnYDFtjYbxUaTiK8257ypo3Zw=;
 b=L9p9INZZR752zqYw9uX2K69qabMp0HwSvDgJacoEwCsdzaADviYSkMOz
 WSgggccBe+2xIQSlNc2YL+xfUM7saR4F9IbQ5VGKcwLKuowoiGJWL9oFx
 flM0clYnNw1L34Iy8nbg27QeNyUw+axCMEPVbj/FOsIi19h9u5agr1tXh
 zrwSstCvWu97IFB0U7qElgngZZ3BWYIaRIQ4Xl3WgaQDPsWWwFZ7sgpLC
 uRZilADYvTkINFyvb6Cq/LgXTfBHy39Y5WtScdCsYQTzJY03LzW0ww0/l
 phJgCm8fHZeLNjRoLdfbto9NDuZ/Q4kt1qgOg+A8FnH4tpVuE1/7jhaAv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="382061094"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="382061094"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:00:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="719892682"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="719892682"
Received: from jorgeblx-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.46.119])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:00:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Siddh Raman Pant <code@siddh.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 06/10] drm: Remove usage of deprecated DRM_DEBUG_DRIVER
In-Reply-To: <4d1acd84e914bafe491cfb42e7adab32d41ca0ab.1671566741.git.code@siddh.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1671566741.git.code@siddh.me>
 <4d1acd84e914bafe491cfb42e7adab32d41ca0ab.1671566741.git.code@siddh.me>
Date: Wed, 21 Dec 2022 12:00:48 +0200
Message-ID: <877cyl2i0f.fsf@intel.com>
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022, Siddh Raman Pant <code@siddh.me> wrote:
> drm_print.h says DRM_DEBUG_DRIVER is deprecated.
> Thus, use newer drm_dbg_driver().
>
> Also fix the deprecation comment in drm_print.h which
> mentions drm_dbg() instead of drm_dbg_driver().
>
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 10 +++++-----
>  include/drm/drm_print.h        |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 24af507bb687..6ad399f6ab03 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -69,11 +69,11 @@
>  #define MIPI_DBI_DEBUG_COMMAND(cmd, data, len) \
>  ({ \
>  	if (!len) \
> -		DRM_DEBUG_DRIVER("cmd=%02x\n", cmd); \
> +		drm_dbg_driver(NULL, "cmd=%02x\n", cmd); \
>  	else if (len <= 32) \
> -		DRM_DEBUG_DRIVER("cmd=%02x, par=%*ph\n", cmd, (int)len, data);\
> +		drm_dbg_driver(NULL, "cmd=%02x, par=%*ph\n", cmd, (int)len, data);\
>  	else \
> -		DRM_DEBUG_DRIVER("cmd=%02x, len=%zu\n", cmd, len); \
> +		drm_dbg_driver(NULL, "cmd=%02x, len=%zu\n", cmd, len); \
>  })
>  
>  static const u8 mipi_dbi_dcs_read_commands[] = {
> @@ -632,7 +632,7 @@ bool mipi_dbi_display_is_on(struct mipi_dbi *dbi)
>  	    DCS_POWER_MODE_DISPLAY_NORMAL_MODE | DCS_POWER_MODE_SLEEP_MODE))
>  		return false;
>  
> -	DRM_DEBUG_DRIVER("Display is ON\n");
> +	drm_dbg_driver(NULL, "Display is ON\n");
>  
>  	return true;
>  }
> @@ -1168,7 +1168,7 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
>  
>  	mutex_init(&dbi->cmdlock);
>  
> -	DRM_DEBUG_DRIVER("SPI speed: %uMHz\n", spi->max_speed_hz / 1000000);
> +	drm_dbg_driver(NULL, "SPI speed: %uMHz\n", spi->max_speed_hz / 1000000);
>  
>  	return 0;
>  }
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 53702d830291..10261faec8b6 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -614,7 +614,7 @@ void __drm_err(const char *format, ...);
>  #define DRM_DEBUG(fmt, ...)						\
>  	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
>  
> -/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
> +/* NOTE: this is deprecated in favor of drm_dbg_driver(NULL, ...). */

Way back the idea was to make the shorter drm_dbg() the driver debug,
and drm_dbg_core() the drm core debug, because the former vastly
outnumbers the the latter.

I don't know if that changed with the dyndbg stuff.


BR,
Jani.


>  #define DRM_DEBUG_DRIVER(fmt, ...)					\
>  	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)

-- 
Jani Nikula, Intel Open Source Graphics Center
