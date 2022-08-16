Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC35A00B3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6045BE473;
	Wed, 24 Aug 2022 17:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6285311AEAB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bIEYAdJMn8rJfxn0kVE7GP80ys7ubTpy0sCOub6aPs4=; b=CKoCDea0HqbcbzaDQ9f24zjk7P
 UVqHhjEHGavJ5cii86GWwrZaWQJmxUAXZcNINGer8F72h3kmbRppk573SxDxeGmm8TV4wH3IMpewp
 ezcCjp7FuaFz9mJFE167azuVlCfDV8Yx0UFB5dqTE2PEN6dFKUW1Zd/WyFlMvtMItCubDKeXR3e09
 mxjQoiLiWZP2APT790i1y4JN5UgBrAcHFFIEcvGrv/YS+B8/Ncbop9kpmytPJURC7PFricfiUNai9
 w24g9Hj45j8zDLWPn7FbaETtjeiLI1TuG/4mBDC/SWLs45mSYLT11bag9AwfFDIghKiPfE03HAoIy
 TcAvZP4w==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=56539)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oNt5f-0004wT-VP; Tue, 16 Aug 2022 11:42:27 +0200
Message-ID: <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
Date: Tue, 16 Aug 2022 11:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220816082612.grebxql5ynnfnvfd@houat>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 16.08.2022 10.26, skrev Maxime Ripard:
> Hi,
> 
> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Trønnes wrote:
>> Den 29.07.2022 18.34, skrev Maxime Ripard:
>>> The TV mode property has been around for a while now to select and get the
>>> current TV mode output on an analog TV connector.
>>>
>>> Despite that property name being generic, its content isn't and has been
>>> driver-specific which makes it hard to build any generic behaviour on top
>>> of it, both in kernel and user-space.
>>>
>>> Let's create a new bitmask tv norm property, that can contain any of the
>>> analog TV standards currently supported by kernel drivers. Each driver can
>>> then pass in a bitmask of the modes it supports.
>>>
>>> We'll then be able to phase out the older tv mode property.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>
>>
>> Please also update Documentation/gpu/kms-properties.csv
>>
>> Requirements for adding a new property is found in
>> Documentation/gpu/drm-kms.rst
> 
> I knew this was going to be raised at some point, so I'm glad it's that
> early :)
> 
> I really don't know what to do there. If we stick by our usual rules,
> then we can't have any of that work merged.
> 
> However, I think the status quo is not really satisfactory either.
> Indeed, we have a property, that doesn't follow those requirements
> either, with a driver-specific content, and that stands in the way of
> fixes and further improvements at both the core framework and driver
> levels.
> 
> So having that new property still seems like a net improvement at the
> driver, framework and uAPI levels, even if it's not entirely following
> the requirements we have in place.
> 
> Even more so since, realistically, those kind of interfaces will never
> get any new development on the user-space side of things, it's
> considered by everyone as legacy.
> 
> This also is something we need to support at some point if we want to
> completely deprecate the fbdev drivers and provide decent alternatives
> in KMS.
> 
> So yeah, strictly speaking, we would not qualify for our requirements
> there. I still think we have a strong case for an exception though.
> 

Which requirements would that be? The only one I can see is the
documentation and maybe an IGT test.

Noralf.

>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>> index c06d0639d552..d7ff6c644c2f 100644
>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>> @@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>>>  		state->tv.margins.bottom = val;
>>>  	} else if (property == config->tv_mode_property) {
>>>  		state->tv.mode = val;
>>> +	} else if (property == config->tv_norm_property) {
>>> +		state->tv.norm = val;
>>>  	} else if (property == config->tv_brightness_property) {
>>>  		state->tv.brightness = val;
>>>  	} else if (property == config->tv_contrast_property) {
>>> @@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>>>  		*val = state->tv.margins.bottom;
>>>  	} else if (property == config->tv_mode_property) {
>>>  		*val = state->tv.mode;
>>> +	} else if (property == config->tv_norm_property) {
>>> +		*val = state->tv.norm;
>>>  	} else if (property == config->tv_brightness_property) {
>>>  		*val = state->tv.brightness;
>>>  	} else if (property == config->tv_contrast_property) {
>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>> index e3142c8142b3..68a4e47f85a9 100644
>>> --- a/drivers/gpu/drm/drm_connector.c
>>> +++ b/drivers/gpu/drm/drm_connector.c
>>> @@ -1637,6 +1637,7 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
>>>  /**
>>>   * drm_mode_create_tv_properties - create TV specific connector properties
>>>   * @dev: DRM device
>>> + * @supported_tv_norms: Bitmask of TV norms supported (See DRM_MODE_TV_NORM_*)
>>>   * @num_modes: number of different TV formats (modes) supported
>>>   * @modes: array of pointers to strings containing name of each format
>>>   *
>>> @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
>>>   * 0 on success or a negative error code on failure.
>>>   */
>>>  int drm_mode_create_tv_properties(struct drm_device *dev,
>>> +				  unsigned int supported_tv_norms,
>>>  				  unsigned int num_modes,
>>>  				  const char * const modes[])
>>>  {
>>> +	static const struct drm_prop_enum_list tv_norm_values[] = {
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
>>> +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
>>> +	};
>>>  	struct drm_property *tv_selector;
>>>  	struct drm_property *tv_subconnector;
>>> +	struct drm_property *tv_norm;
>>>  	unsigned int i;
>>>  
>>>  	if (dev->mode_config.tv_select_subconnector_property)
>>> @@ -1686,6 +1716,13 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
>>>  	if (drm_mode_create_tv_margin_properties(dev))
>>>  		goto nomem;
>>>  
>>> +	tv_norm = drm_property_create_bitmask(dev, 0, "tv norm",
>>> +					   tv_norm_values, ARRAY_SIZE(tv_norm_values),
>>> +					   supported_tv_norms);
>>
>> I expected this to be an enum, why a bitmask? Userspace can set multiple
>> bits in a bitmask.
> 
> I went for a bitmask since it allowed to report the capabilities of a
> driver, but I just realised that you can do that with an enum too, like
> we do for color encodings.
> 
> I'll switch for an enum, thanks!
> Maxime
