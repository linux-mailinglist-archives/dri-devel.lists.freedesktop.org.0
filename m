Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F461FCFA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 19:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2E810E8AB;
	Mon,  7 Nov 2022 18:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010F710E549;
 Mon,  7 Nov 2022 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lL1tEZY5rfBShjfX6pL9OQv5DSS6YhPKdPmOr0dqeM0=; b=gfzZC605hL0pZnTv/R8X8B+fLM
 RdcVEVZ7GMsHWTrsYoi3BtBkZwY9B4Kkza9mrjlFGhfZxGBJxLLmqKaXfjxStznD1fNviFTP8nJDk
 tyNx/Bi+wJ9JEuakyocIKrBhNlzAHiuAFqRtxT9TtGOUG8LcMK23KNQytyBU0CiSVTl3BIymWe/Sm
 gt4rzZ9o8TI1tc1p7R/H2yJOKmZRfRO4uYXQevf0Pztms+3wZM3MutI3YAtWPbbzNNo6/pmhxm8Tj
 HwHPmFesDVSsWZi+F0zzjZ+wye1BXzaKeCnJ4huLOtDFZTIVl0I/qCOhfv0185YqcCOsrqDH1pjfX
 YXhTrfuQ==;
Received: from [2a01:799:95a:cb00:cca0:57ac:c55d:a485] (port=64221)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1os6ar-0004ho-9w; Mon, 07 Nov 2022 19:11:33 +0100
Message-ID: <a9c0380a-f538-1a19-fd27-983eea42b1b2@tronnes.org>
Date: Mon, 7 Nov 2022 19:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 16/23] drm/probe-helper: Provide a TV get_modes helper
To: Maxime Ripard <maxime@cerno.tech>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-16-7072a478c6b3@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-16-7072a478c6b3@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 07.11.2022 15.16, skrev Maxime Ripard:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> Most of the TV connectors will need a similar get_modes implementation
> that will, depending on the drivers' capabilities, register the 480i and
> 576i modes.
> 
> That implementation will also need to set the preferred flag and order
> the modes based on the driver and users preferrence.
> 
> This is especially important to guarantee that a userspace stack such as
> Xorg can start and pick up the preferred mode while maintaining a
> working output.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v7:
> - Used Noralf's implementation
> 
> Changes in v6:
> - New patch
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 97 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_probe_helper.h     |  1 +
>  2 files changed, 98 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 2fc21df709bc..edb2e4c4530a 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1147,3 +1147,100 @@ int drm_connector_helper_get_modes(struct drm_connector *connector)
>  	return count;
>  }
>  EXPORT_SYMBOL(drm_connector_helper_get_modes);
> +
> +static bool tv_mode_supported(struct drm_connector *connector,
> +			      enum drm_connector_tv_mode mode)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *property = dev->mode_config.tv_mode_property;
> +
> +	unsigned int i;
> +
> +	for (i = 0; i < property->num_values; i++)
> +		if (property->values[i] == mode)
> +			return true;
> +
> +	return false;
> +}

This function is not used in the new implementation.

I hope you have tested this patch since I didn't even compile test my
implementation (probably should have said so...)

Noralf.

> +
> +/**
> + * drm_connector_helper_tv_get_modes - Fills the modes availables to a TV connector
> + * @connector: The connector
> + *
> + * Fills the available modes for a TV connector based on the supported
> + * TV modes, and the default mode expressed by the kernel command line.
> + *
> + * This can be used as the default TV connector helper .get_modes() hook
> + * if the driver does not need any special processing.
> + *
> + * Returns:
> + * The number of modes added to the connector.
> + */
> +int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *tv_mode_property =
> +		dev->mode_config.tv_mode_property;
> +	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
> +	unsigned int ntsc_modes = BIT(DRM_MODE_TV_MODE_NTSC) |
> +		BIT(DRM_MODE_TV_MODE_NTSC_443) |
> +		BIT(DRM_MODE_TV_MODE_NTSC_J) |
> +		BIT(DRM_MODE_TV_MODE_PAL_M);
> +	unsigned int pal_modes = BIT(DRM_MODE_TV_MODE_PAL) |
> +		BIT(DRM_MODE_TV_MODE_PAL_N) |
> +		BIT(DRM_MODE_TV_MODE_SECAM);
> +	unsigned int tv_modes[2] = { UINT_MAX, UINT_MAX };
> +	unsigned int i, supported_tv_modes = 0;
> +
> +	if (!tv_mode_property)
> +		return 0;
> +
> +	for (i = 0; i < tv_mode_property->num_values; i++)
> +		supported_tv_modes |= BIT(tv_mode_property->values[i]);
> +
> +	if ((supported_tv_modes & ntsc_modes) &&
> +	    (supported_tv_modes & pal_modes)) {
> +		uint64_t default_mode;
> +
> +		if (drm_object_property_get_default_value(&connector->base,
> +							  tv_mode_property,
> +							  &default_mode))
> +			return 0;
> +
> +		if (cmdline->tv_mode_specified)
> +			default_mode = cmdline->tv_mode;
> +
> +		if (BIT(default_mode) & ntsc_modes) {
> +			tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
> +			tv_modes[1] = DRM_MODE_TV_MODE_PAL;
> +		} else {
> +			tv_modes[0] = DRM_MODE_TV_MODE_PAL;
> +			tv_modes[1] = DRM_MODE_TV_MODE_NTSC;
> +		}
> +	} else if (supported_tv_modes & ntsc_modes) {
> +		tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
> +	} else if (supported_tv_modes & pal_modes) {
> +		tv_modes[0] = DRM_MODE_TV_MODE_PAL;
> +	} else {
> +		return 0;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
> +		struct drm_display_mode *mode;
> +
> +		if (tv_modes[i] == DRM_MODE_TV_MODE_NTSC)
> +			mode = drm_mode_analog_ntsc_480i(dev);
> +		else if (tv_modes[i] == DRM_MODE_TV_MODE_PAL)
> +			mode = drm_mode_analog_pal_576i(dev);
> +		else
> +			break;
> +		if (!mode)
> +			return i;
> +		if (!i)
> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> +		drm_mode_probed_add(connector, mode);
> +	}
> +
> +	return i;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index 5880daa14624..4977e0ab72db 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -35,5 +35,6 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
>  int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
>  					 const struct drm_display_mode *fixed_mode);
>  int drm_connector_helper_get_modes(struct drm_connector *connector);
> +int drm_connector_helper_tv_get_modes(struct drm_connector *connector);
>  
>  #endif
> 
