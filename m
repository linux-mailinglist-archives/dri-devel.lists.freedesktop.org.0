Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3086DD18
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F17E10EBF2;
	Fri,  1 Mar 2024 08:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EA010EBF2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 08:29:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 72B56CE0917;
 Fri,  1 Mar 2024 08:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468B9C433C7;
 Fri,  1 Mar 2024 08:29:19 +0000 (UTC)
Message-ID: <5a8366aa-34b9-4f80-9b14-d92e99873349@xs4all.nl>
Date: Fri, 1 Mar 2024 09:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Content-Language: en-US, nl
To: Sebastian Wick <sebastian.wick@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <20240229194726.GB166694@toolbox>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/02/2024 20:47, Sebastian Wick wrote:
> On Thu, Feb 22, 2024 at 07:14:07PM +0100, Maxime Ripard wrote:
>> The i915 driver has a property to force the RGB range of an HDMI output.
>> The vc4 driver then implemented the same property with the same
>> semantics. KWin has support for it, and a PR for mutter is also there to
>> support it.
>>
>> Both drivers implementing the same property with the same semantics,
>> plus the userspace having support for it, is proof enough that it's
>> pretty much a de-facto standard now and we can provide helpers for it.
>>
>> Let's plumb it into the newly created HDMI connector.
>>
>> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> ---
>>  Documentation/gpu/kms-properties.csv      |  1 -
>>  drivers/gpu/drm/drm_atomic.c              |  2 +
>>  drivers/gpu/drm/drm_atomic_state_helper.c |  4 +-
>>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>  drivers/gpu/drm/drm_connector.c           | 89 +++++++++++++++++++++++++++++++
>>  include/drm/drm_connector.h               | 36 +++++++++++++
>>  6 files changed, 134 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
>> index 0f9590834829..caef14c532d4 100644
>> --- a/Documentation/gpu/kms-properties.csv
>> +++ b/Documentation/gpu/kms-properties.csv
>> @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
>>  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
>>  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
>>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
>> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."
>>  ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
>>  ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
>>  ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 26f9e525c0a0..3e57d98d8418 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -1145,6 +1145,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>>  
>>  	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>>  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
>> +		drm_printf(p, "\tbroadcast_rgb=%s\n",
>> +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
>>  		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
>>  		drm_printf(p, "\toutput_format=%s\n",
>>  			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>> index 9f517599f117..0e8fb653965a 100644
>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>> @@ -589,6 +589,7 @@ void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
>>  
>>  	new_state->max_bpc = max_bpc;
>>  	new_state->max_requested_bpc = max_bpc;
>> +	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
>>  }
>>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
>>  
>> @@ -913,7 +914,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>>  	if (ret)
>>  		return ret;
>>  
>> -	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
>> +	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
>> +	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
>>  	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
>>  		struct drm_crtc *crtc = new_state->crtc;
>>  		struct drm_crtc_state *crtc_state;
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 29d4940188d4..2b415b4ed506 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>>  		state->max_requested_bpc = val;
>>  	} else if (property == connector->privacy_screen_sw_state_property) {
>>  		state->privacy_screen_sw_state = val;
>> +	} else if (property == connector->broadcast_rgb_property) {
>> +		state->hdmi.broadcast_rgb = val;
>>  	} else if (connector->funcs->atomic_set_property) {
>>  		return connector->funcs->atomic_set_property(connector,
>>  				state, property, val);
>> @@ -859,6 +861,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>>  		*val = state->max_requested_bpc;
>>  	} else if (property == connector->privacy_screen_sw_state_property) {
>>  		*val = state->privacy_screen_sw_state;
>> +	} else if (property == connector->broadcast_rgb_property) {
>> +		*val = state->hdmi.broadcast_rgb;
>>  	} else if (connector->funcs->atomic_get_property) {
>>  		return connector->funcs->atomic_get_property(connector,
>>  				state, property, val);
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 591d2d500f61..6ffe59d01698 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1212,6 +1212,29 @@ static const u32 dp_colorspaces =
>>  	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
>>  	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
>>  
>> +static const struct drm_prop_enum_list broadcast_rgb_names[] = {
>> +	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
>> +	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
>> +	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
>> +};
>> +
>> +/*
>> + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI connector RGB broadcast selection
>> + * @broadcast_rgb: Broadcast RGB selection to compute name of
>> + *
>> + * Returns: the name of the Broadcast RGB selection, or NULL if the type
>> + * is not valid.
>> + */
>> +const char *
>> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb)
>> +{
>> +	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
>> +		return NULL;
>> +
>> +	return broadcast_rgb_names[broadcast_rgb].name;
>> +}
>> +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
>> +
>>  static const char * const output_format_str[] = {
>>  	[HDMI_COLORSPACE_RGB]		= "RGB",
>>  	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
>> @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>>  /**
>>   * DOC: HDMI connector properties
>>   *
>> + * Broadcast RGB (HDMI specific)
>> + *      Indicates the Quantization Range (Full vs Limited) used. The color
>> + *      processing pipeline will be adjusted to match the value of the
>> + *      property, and the Infoframes will be generated and sent accordingly.
>> + *
>> + *      This property is only relevant if the HDMI output format is RGB. If
>> + *      it's one of the YCbCr variant, it will be ignored and the output will
>> + *      use a limited quantization range.
> 
> Uh, maybe just say that the quantization range is selected automatically
> in case a YCbCr output format is in use. I'm not sure every YCbCr
> variant requires limited and even if it does, new formats could change
> this.

For HDMI every YCbCr output format is limited range by default. It is
highly unlikely that future YCbCr formats would ever use full range by
default.

So I am fine with the current text since it is actually correct and it
explicitly states which quantization range will be used.

Regards,

	Hans

> 
> With this changed, this patch is
> 
> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> 
>> + *
>> + *      The CRTC attached to the connector must be configured by user-space to
>> + *      always produce full-range pixels.
>> + *
>> + *      The value of this property can be one of the following:
>> + *
>> + *      Automatic:
>> + *              The quantization range is selected automatically based on the
>> + *              mode according to the HDMI specifications (HDMI 1.4b - Section
>> + *              6.6 - Video Quantization Ranges).
>> + *
>> + *      Full:
>> + *              Full quantization range is forced.
>> + *
>> + *      Limited 16:235:
>> + *              Limited quantization range is forced. Unlike the name suggests,
>> + *              this works for any number of bits-per-component.
>> + *
>> + *      Property values other than Automatic can result in colors being off (if
>> + *      limited is selected but the display expects full), or a black screen
>> + *      (if full is selected but the display expects limited).
>> + *
>> + *      Drivers can set up this property by calling
>> + *      drm_connector_attach_broadcast_rgb_property().
>> + *
>>   * content type (HDMI specific):
>>   *	Indicates content type setting to be used in HDMI infoframes to indicate
>>   *	content type for the external device, so that it adjusts its display
>> @@ -2570,6 +2626,39 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>>  }
>>  EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
>>  
>> +/**
>> + * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" property
>> + * @connector: connector to attach the property on.
>> + *
>> + * This is used to add support for forcing the RGB range on a connector
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector)
>> +{
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_property *prop;
>> +
>> +	prop = connector->broadcast_rgb_property;
>> +	if (!prop) {
>> +		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
>> +						"Broadcast RGB",
>> +						broadcast_rgb_names,
>> +						ARRAY_SIZE(broadcast_rgb_names));
>> +		if (!prop)
>> +			return -EINVAL;
>> +
>> +		connector->broadcast_rgb_property = prop;
>> +	}
>> +
>> +	drm_object_attach_property(&connector->base, prop,
>> +				   DRM_HDMI_BROADCAST_RGB_AUTO);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_broadcast_rgb_property);
>> +
>>  /**
>>   * drm_connector_attach_colorspace_property - attach "Colorspace" property
>>   * @connector: connector to attach the property on.
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 8cda902934cd..bb6b6a36ade3 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -369,6 +369,29 @@ enum drm_panel_orientation {
>>  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>>  };
>>  
>> +/**
>> + * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for an HDMI @drm_connector
>> + */
>> +enum drm_hdmi_broadcast_rgb {
>> +	/**
>> +	 * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
>> +	 * automatically based on the mode.
>> +	 */
>> +	DRM_HDMI_BROADCAST_RGB_AUTO,
>> +
>> +	/**
>> +	 * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
>> +	 */
>> +	DRM_HDMI_BROADCAST_RGB_FULL,
>> +
>> +	/**
>> +	 * @DRM_HDMI_BROADCAST_RGB_LIMITED: Limited range RGB is forced.
>> +	 */
>> +	DRM_HDMI_BROADCAST_RGB_LIMITED,
>> +};
>> +
>> +const char *
>> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
>>  const char *
>>  drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
>>  
>> @@ -1041,6 +1064,12 @@ struct drm_connector_state {
>>  	 * @drm_atomic_helper_connector_hdmi_check().
>>  	 */
>>  	struct {
>> +		/**
>> +		 * @broadcast_rgb: Connector property to pass the
>> +		 * Broadcast RGB selection value.
>> +		 */
>> +		enum drm_hdmi_broadcast_rgb broadcast_rgb;
>> +
>>  		/**
>>  		 * @output_bpc: Bits per color channel to output.
>>  		 */
>> @@ -1753,6 +1782,12 @@ struct drm_connector {
>>  	 */
>>  	struct drm_property *privacy_screen_hw_state_property;
>>  
>> +	/**
>> +	 * @broadcast_rgb_property: Connector property to set the
>> +	 * Broadcast RGB selection to output with.
>> +	 */
>> +	struct drm_property *broadcast_rgb_property;
>> +
>>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
>> @@ -2092,6 +2127,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
>>  					       u32 scaling_mode_mask);
>>  int drm_connector_attach_vrr_capable_property(
>>  		struct drm_connector *connector);
>> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
>>  int drm_connector_attach_colorspace_property(struct drm_connector *connector);
>>  int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
>>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
>>
>> -- 
>> 2.43.2
>>
> 

