Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2FE61E243
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 14:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422E10E169;
	Sun,  6 Nov 2022 13:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4C510E169;
 Sun,  6 Nov 2022 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CMkrGiKjQARt2b1aRk4pazVxkvnsAA/PLEWp9b0wo3Q=; b=i+cfGJ0TFEvF+5jVH1Ze8k0jA/
 4Rh0pBnFagvOQsjCV12kcMbzhXDsajlVPKjNnzCVbEWB81OqyI2NbZn7c3liqKm2VVJKhAj8YrfR4
 vfkkJJG2AXL2qAHN07JVuPCQ6JsIGOUU2NIB4gsX+0Fs1PMsHI0VhuPC3+Po+X3W7RA8YPE3k4hVt
 eEWLB8VD+Kb0qs5U2cK3Ja8uXbcOJ7b4EnSzPravJlBEmDecT+4+7lwPdVOuIHb1yYSF+bJofr0ue
 LTVL1bdl+w6yMpZJ1iEthOBGDABurSxlTji+0Mm6/Tm8JeMGt7XOMa6X+snscDmL7PPJORkoh5gkC
 g//My1qA==;
Received: from [2a01:799:95a:cb00:a93e:4a2b:2c13:303] (port=57982)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1orfMI-00019n-JX; Sun, 06 Nov 2022 14:06:42 +0100
Message-ID: <887bb962-ef79-0e89-4100-62729d148911@tronnes.org>
Date: Sun, 6 Nov 2022 14:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 11/23] drm/connector: Add pixel clock to cmdline mode
To: maxime@cerno.tech, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-11-e7792734108f@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-11-e7792734108f@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 26.10.2022 17.33, skrev maxime@cerno.tech:
> We'll need to get the pixel clock to generate proper display modes for
> all the current named modes. Let's add it to struct drm_cmdline_mode and
> fill it when parsing the named mode.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

I would just squash this with the previous patch, either way:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

>  drivers/gpu/drm/drm_modes.c | 9 ++++++---
>  include/drm/drm_connector.h | 7 +++++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index acee23e1a8b7..c826f9583a1d 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -2226,22 +2226,24 @@ static int drm_mode_parse_cmdline_options(const char *str,
>  
>  struct drm_named_mode {
>  	const char *name;
> +	unsigned int pixel_clock_khz;
>  	unsigned int xres;
>  	unsigned int yres;
>  	unsigned int flags;
>  };
>  
> -#define NAMED_MODE(_name, _x, _y, _flags)		\
> +#define NAMED_MODE(_name, _pclk, _x, _y, _flags)	\
>  	{						\
>  		.name = _name,				\
> +		.pixel_clock_khz = _pclk,		\
>  		.xres = _x,				\
>  		.yres = _y,				\
>  		.flags = _flags,			\
>  	}
>  
>  static const struct drm_named_mode drm_named_modes[] = {
> -	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),
> -	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),
> +	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE),
> +	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE),
>  };
>  
>  static int drm_mode_parse_cmdline_named_mode(const char *name,
> @@ -2282,6 +2284,7 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
>  			continue;
>  
>  		strcpy(cmdline_mode->name, mode->name);
> +		cmdline_mode->pixel_clock = mode->pixel_clock_khz;
>  		cmdline_mode->xres = mode->xres;
>  		cmdline_mode->yres = mode->yres;
>  		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 96b2e4e12334..5c5e67de2296 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1273,6 +1273,13 @@ struct drm_cmdline_mode {
>  	 */
>  	bool bpp_specified;
>  
> +	/**
> +	 * @pixel_clock:
> +	 *
> +	 * Pixel Clock in kHz. Optional.
> +	 */
> +	unsigned int pixel_clock;
> +
>  	/**
>  	 * @xres:
>  	 *
> 
