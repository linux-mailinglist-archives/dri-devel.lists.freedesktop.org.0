Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A32359B04C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 22:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B29210E4E5;
	Sat, 20 Aug 2022 20:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C110E5BB
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Aug 2022 20:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4hOW8ikp9BlC16NkIWVeHbEV6qbT3qh1PghkZPE+sv4=; b=EYQWVkjSwqrvFkoX1JvIf//bPD
 rEItT472ljcmmgsALoCO69D1USt7lV7NN2hoP+xsAD1Ah5OswP5WxP1JOXL4tm3urS5R5B87k+xg0
 zdzgMRBcKw0hntPg1U1qPeb34xYNx6wvUjZZLk8qIBk9b21bNrGuH8J5CwJIX6lUvd93VZia83lcZ
 aqbUvKktpq2As8oMbi9WVjKaNVhiosQO71HL0ngBhKzpdjmFKkH0kQ3Xnwp1HWDDW4M1WUCJvSmvx
 oRXT91l9CG7GKNY2Yu61jbnX4tRSwQ6qIgVKWglKp6ugPYKi3ldjZNkNQUJjrMhZti2PA1LT13BsH
 bgZyDBKw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62329)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oPUpx-0005wt-AI; Sat, 20 Aug 2022 22:12:53 +0200
Message-ID: <37a76651-a457-e50d-9a05-00ca9ed5d729@tronnes.org>
Date: Sat, 20 Aug 2022 22:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.07.2022 18.34, skrev Maxime Ripard:
> The TV mode property has been around for a while now to select and get the
> current TV mode output on an analog TV connector.
> 
> Despite that property name being generic, its content isn't and has been
> driver-specific which makes it hard to build any generic behaviour on top
> of it, both in kernel and user-space.
> 
> Let's create a new bitmask tv norm property, that can contain any of the
> analog TV standards currently supported by kernel drivers. Each driver can
> then pass in a bitmask of the modes it supports.
> 
> We'll then be able to phase out the older tv mode property.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c06d0639d552..d7ff6c644c2f 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->tv.margins.bottom = val;
>  	} else if (property == config->tv_mode_property) {
>  		state->tv.mode = val;
> +	} else if (property == config->tv_norm_property) {
> +		state->tv.norm = val;
>  	} else if (property == config->tv_brightness_property) {
>  		state->tv.brightness = val;
>  	} else if (property == config->tv_contrast_property) {
> @@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->tv.margins.bottom;
>  	} else if (property == config->tv_mode_property) {
>  		*val = state->tv.mode;
> +	} else if (property == config->tv_norm_property) {
> +		*val = state->tv.norm;
>  	} else if (property == config->tv_brightness_property) {
>  		*val = state->tv.brightness;
>  	} else if (property == config->tv_contrast_property) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index e3142c8142b3..68a4e47f85a9 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1637,6 +1637,7 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
>  /**
>   * drm_mode_create_tv_properties - create TV specific connector properties
>   * @dev: DRM device
> + * @supported_tv_norms: Bitmask of TV norms supported (See DRM_MODE_TV_NORM_*)
>   * @num_modes: number of different TV formats (modes) supported
>   * @modes: array of pointers to strings containing name of each format
>   *
> @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
>   * 0 on success or a negative error code on failure.
>   */
>  int drm_mode_create_tv_properties(struct drm_device *dev,
> +				  unsigned int supported_tv_norms,
>  				  unsigned int num_modes,
>  				  const char * const modes[])
>  {
> +	static const struct drm_prop_enum_list tv_norm_values[] = {
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
> +	};
>  	struct drm_property *tv_selector;
>  	struct drm_property *tv_subconnector;
> +	struct drm_property *tv_norm;
>  	unsigned int i;
>  
>  	if (dev->mode_config.tv_select_subconnector_property)
> @@ -1686,6 +1716,13 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
>  	if (drm_mode_create_tv_margin_properties(dev))
>  		goto nomem;
>  
> +	tv_norm = drm_property_create_bitmask(dev, 0, "tv norm",
> +					   tv_norm_values, ARRAY_SIZE(tv_norm_values),
> +					   supported_tv_norms);
> +	if (!tv_norm)
> +		goto nomem;
> +	dev->mode_config.tv_norm_property = tv_norm;
> +
>  	dev->mode_config.tv_mode_property =
>  		drm_property_create(dev, DRM_MODE_PROP_ENUM,
>  				    "mode", num_modes);
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 4a788c1c9058..457529e5d857 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -573,7 +573,9 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>  	struct vc4_vec *vec;
>  	int ret;
>  
> -	ret = drm_mode_create_tv_properties(drm, ARRAY_SIZE(tv_mode_names),
> +	ret = drm_mode_create_tv_properties(drm,
> +					    0,
> +					    ARRAY_SIZE(tv_mode_names),
>  					    tv_mode_names);
>  	if (ret)
>  		return ret;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1e9996b33cc8..78275e68ff66 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -143,6 +143,32 @@ enum subpixel_order {
>  
>  };
>  
> +#define DRM_MODE_TV_NORM_NTSC_443	(1 << 0)
> +#define DRM_MODE_TV_NORM_NTSC_J		(1 << 1)
> +#define DRM_MODE_TV_NORM_NTSC_M		(1 << 2)
> +#define DRM_MODE_TV_NORM_PAL_60		(1 << 3)
> +#define DRM_MODE_TV_NORM_PAL_B		(1 << 4)
> +#define DRM_MODE_TV_NORM_PAL_D		(1 << 5)
> +#define DRM_MODE_TV_NORM_PAL_G		(1 << 6)
> +#define DRM_MODE_TV_NORM_PAL_H		(1 << 7)
> +#define DRM_MODE_TV_NORM_PAL_I		(1 << 8)
> +#define DRM_MODE_TV_NORM_PAL_M		(1 << 9)
> +#define DRM_MODE_TV_NORM_PAL_N		(1 << 10)
> +#define DRM_MODE_TV_NORM_PAL_NC		(1 << 11)
> +#define DRM_MODE_TV_NORM_SECAM_60	(1 << 12)
> +#define DRM_MODE_TV_NORM_SECAM_B	(1 << 13)
> +#define DRM_MODE_TV_NORM_SECAM_D	(1 << 14)
> +#define DRM_MODE_TV_NORM_SECAM_G	(1 << 15)
> +#define DRM_MODE_TV_NORM_SECAM_K	(1 << 16)
> +#define DRM_MODE_TV_NORM_SECAM_K1	(1 << 17)
> +#define DRM_MODE_TV_NORM_SECAM_L	(1 << 18)
> +#define DRM_MODE_TV_NORM_HD480I		(1 << 19)
> +#define DRM_MODE_TV_NORM_HD480P		(1 << 20)
> +#define DRM_MODE_TV_NORM_HD576I		(1 << 21)
> +#define DRM_MODE_TV_NORM_HD576P		(1 << 22)
> +#define DRM_MODE_TV_NORM_HD720P		(1 << 23)
> +#define DRM_MODE_TV_NORM_HD1080I	(1 << 24)
> +

This is an area where DRM overlaps with v4l2, see:
- include/dt-bindings/display/sdtv-standards.h
- v4l2_norm_to_name()

Maybe we should follow suit, but if we do our own thing please mention
why in the commit message.

Noralf.

>  /**
>   * struct drm_scrambling: sink's scrambling support.
>   */
> @@ -687,6 +713,7 @@ struct drm_tv_connector_state {
>  	enum drm_mode_subconnector subconnector;
>  	struct drm_connector_tv_margins margins;
>  	unsigned int mode;
> +	unsigned int norm;
>  	unsigned int brightness;
>  	unsigned int contrast;
>  	unsigned int flicker_reduction;
> @@ -1779,6 +1806,7 @@ void drm_connector_attach_dp_subconnector_property(struct drm_connector *connect
>  
>  int drm_mode_create_tv_margin_properties(struct drm_device *dev);
>  int drm_mode_create_tv_properties(struct drm_device *dev,
> +				  unsigned int supported_tv_norms,
>  				  unsigned int num_modes,
>  				  const char * const modes[]);
>  void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6b5e01295348..d9e79def8b92 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -704,6 +704,12 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *dp_subconnector_property;
>  
> +	/**
> +	 * @tv_norm_property: Optional TV property to select the TV
> +	 * standard output on the connector.
> +	 */
> +	struct drm_property *tv_norm_property;
> +
>  	/**
>  	 * @tv_subconnector_property: Optional TV property to differentiate
>  	 * between different TV connector types.
> 
