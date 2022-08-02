Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAB587DBD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 15:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82CC12BD56;
	Tue,  2 Aug 2022 13:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EE410E2B5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659448744; x=1690984744;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JXaQKy9UvN4RoNFqHuqgOiDf4e31ilcdvl1X5DNMf8k=;
 b=YSRpB96wqszYgM1dE+VP9ZTvWvHX0qFnQ3n3qYKgyDkt8q97JyWak5OA
 MciUlKoSnPTtO6WI6eqGFngZQOK3UiT5CDvBk4ok7qmRlBV6zTzezRQbE
 zQTrPfWFoNHpQldro3+MNCJuTFNRlm3Fw7HfuWMTWGM48+/jt//23cvdq
 z+/6kLzq0HjI8cnc1xhWjyGuH79Mrl+cILvnapdfPUPHixhppGU40pO/q
 Q2EMn2Z01hiQcjnUDZVsnGTmzU6AFLrfSsZEcaH9SiesICyWCq3VIUiq9
 pJ81UHE9uukHfMmDRZQBJpCHqVMAEOOCAA/rJOu0X1Izk5pyVL1TiCTBn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="276323364"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="276323364"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 06:59:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="661633082"
Received: from llaviniu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 06:58:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet
 <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma
 Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?utf-8?Q?Tr=C3=B8n?=
 =?utf-8?Q?nes?=
 <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
Date: Tue, 02 Aug 2022 16:58:53 +0300
Message-ID: <8735eeg31e.fsf@intel.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Jul 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-lines
> modes in the drivers.
>
> Since those modes are fairly standards, and that we'll need to use them in
> more places in the future, let's move the meson definition into the
> framework.

I think you should always expose interfaces, not data. Data is not an
interface, and I think this sets a bad example that will be cargo
culted.


BR,
Jani.

>
> The meson one was chosen because vc4's isn't accurate and doesn't amount to
> 525 and 625 lines.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 304004fb80aa..a4c1bd688338 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -48,6 +48,24 @@
>  
>  #include "drm_crtc_internal.h"
>  
> +const struct drm_display_mode drm_mode_480i = {
> +	DRM_MODE("720x480i", DRM_MODE_TYPE_DRIVER, 13500,
> +		 720, 739, 801, 858, 0,
> +		 480, 488, 494, 525, 0,
> +		 DRM_MODE_FLAG_INTERLACE),
> +	.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> +};
> +EXPORT_SYMBOL_GPL(drm_mode_480i);
> +
> +const struct drm_display_mode drm_mode_576i = {
> +	DRM_MODE("720x576i", DRM_MODE_TYPE_DRIVER, 13500,
> +		 720, 732, 795, 864, 0,
> +		 576, 580, 586, 625, 0,
> +		 DRM_MODE_FLAG_INTERLACE),
> +	.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> +};
> +EXPORT_SYMBOL_GPL(drm_mode_576i);
> +
>  /**
>   * drm_mode_debug_printmodeline - print a mode to dmesg
>   * @mode: mode to print
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 8110a6e39320..98ec3e563155 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -45,21 +45,11 @@ struct meson_encoder_cvbs {
>  struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT] = {
>  	{ /* PAL */
>  		.enci = &meson_cvbs_enci_pal,
> -		.mode = {
> -			DRM_MODE("720x576i", DRM_MODE_TYPE_DRIVER, 13500,
> -				 720, 732, 795, 864, 0, 576, 580, 586, 625, 0,
> -				 DRM_MODE_FLAG_INTERLACE),
> -			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> -		},
> +		.mode = &drm_mode_576i,
>  	},
>  	{ /* NTSC */
>  		.enci = &meson_cvbs_enci_ntsc,
> -		.mode = {
> -			DRM_MODE("720x480i", DRM_MODE_TYPE_DRIVER, 13500,
> -				720, 739, 801, 858, 0, 480, 488, 494, 525, 0,
> -				DRM_MODE_FLAG_INTERLACE),
> -			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> -		},
> +		.mode = &drm_mode_480i,
>  	},
>  };
>  
> @@ -71,7 +61,7 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
>  	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
>  		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
>  
> -		if (drm_mode_match(req_mode, &meson_mode->mode,
> +		if (drm_mode_match(req_mode, meson_mode->mode,
>  				   DRM_MODE_MATCH_TIMINGS |
>  				   DRM_MODE_MATCH_CLOCK |
>  				   DRM_MODE_MATCH_FLAGS |
> @@ -104,7 +94,7 @@ static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
>  	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
>  		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
>  
> -		mode = drm_mode_duplicate(priv->drm, &meson_mode->mode);
> +		mode = drm_mode_duplicate(priv->drm, meson_mode->mode);
>  		if (!mode) {
>  			dev_err(priv->dev, "Failed to create a new display mode\n");
>  			return 0;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> index 61d9d183ce7f..26cefb202924 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> @@ -16,7 +16,7 @@
>  
>  struct meson_cvbs_mode {
>  	struct meson_cvbs_enci_mode *enci;
> -	struct drm_display_mode mode;
> +	const struct drm_display_mode *mode;
>  };
>  
>  #define MESON_CVBS_MODES_COUNT	2
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index a80ae9639e96..b4a440e2688c 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -394,6 +394,9 @@ struct drm_display_mode {
>  
>  };
>  
> +extern const struct drm_display_mode drm_mode_480i;
> +extern const struct drm_display_mode drm_mode_576i;
> +
>  /**
>   * DRM_MODE_FMT - printf string for &struct drm_display_mode
>   */

-- 
Jani Nikula, Intel Open Source Graphics Center
