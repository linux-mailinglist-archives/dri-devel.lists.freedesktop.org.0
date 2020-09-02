Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DC525A9FE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04446E457;
	Wed,  2 Sep 2020 11:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2ED6E457
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:06:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c15so4744749wrs.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=twCG0p2wcM15uhFFhccs3FoLycIAVHdvzhdgouUISjE=;
 b=QjMjMMIP3AuV0DYTBlqgh8WTTL3IZkCOfKHsC0TtSMXTGeb8yc0kHuGd38RaV8rxER
 h4+gZDDw2KRrPAKT2Hmj+jap/iA6w+D7oPcBISu4NFgNmyNGpiyazXDBZr/1rLvf2YvE
 rJyoLCW6hz7K+Q85sFE8z/v7/EhUeQZJS871djquj0y3/kXx2pd08SmQa82muEvGS6cY
 g9wH//D/v680S5Nw/Kma9VIneLohEmanmFAibUESRZuvVkFNC6QatOeAlct3S/WtlsBY
 qqCcu1z3aeT1Us/eDPaaoEIM89PmSe+i63/EZ9eubg4/UOUorAQzb91jwdfkj3bU88jT
 NCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=twCG0p2wcM15uhFFhccs3FoLycIAVHdvzhdgouUISjE=;
 b=NYq9rzummVe2bXv1HgvZIfmiBM6COfZEe0+kb3aTCpM2wiCZzJkUCUpan+tX6f91oP
 Ouz2+Qk+g7eHP/viElxC3wIaTGdsIXcKkTywfFvT5/DNYGBkfndSkgddRGOfcDA1Ox9E
 eOXMd3Et11zseZWiHmu6LyJAGQ1BIGBNJjacBrLcmU1DM4O1uml9qh+PdQcZM4v6tDyW
 k+DilTmbmfiYkX5YLClWvrzATN26NRK9nFfP0AP4h4MPGBNcZlNog89mOE8xi2J1uVEr
 F3tw2MfxfhrNB10F/XyY4FggaHnNgjgurZsXAfS1Off1g7qI+BdPXT6+NrIUB3TJju9d
 muqw==
X-Gm-Message-State: AOAM5330Cxhd5Txr7kuKoe2QLkXdys2KM+5s+Te/Y2gTm07Xm8XUQESl
 XUMV72se2hQWRicTs0+RjfAcOw==
X-Google-Smtp-Source: ABdhPJyDLhEkGLP0nkSt39qJ0i2C3tbY9x1xvi9Lc2JnHnngBcYOSgjATJ5lGcYb/GvxwYMF5p/PyQ==
X-Received: by 2002:adf:c108:: with SMTP id r8mr6834034wre.350.1599044790992; 
 Wed, 02 Sep 2020 04:06:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f6sm6876125wro.5.2020.09.02.04.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:06:30 -0700 (PDT)
Date: Wed, 2 Sep 2020 12:06:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 02/24] backlight: Add DECLARE_* macro for device
 registration
Message-ID: <20200902110628.5npko5kuuaec2ldd@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823104532.1024798-3-sam@ravnborg.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 12:45:10PM +0200, Sam Ravnborg wrote:
> Device registration almost always uses a struct backlight_properties
> variable to pass config info. Make it simpler and less error prone
> by the introduction of a number of macros.
> 
> There is one macro for each type of backlight {firmware, platform, raw}.
> All members in struct backlight_properties are initialized.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 63 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 190963ffb7fc..93a47a6cf681 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -272,6 +272,69 @@ struct backlight_properties {
>  	enum backlight_scale scale;
>  };
>  
> +/**
> + * BACKLIGHT_PROPS - init backlight_properties with default values
> + *
> + * This macro is used to initialize backlight_properties with default
> + * values. It is intended to be used when registering a backlight device
> + * and the properties needs to be adjusted at run-time, for example
> + * when the max_brightness is configurable.
> + *
> + * .. code-block:: c

sphinx markup in kernel-doc comments is pretty rare at the moment (and
presumably it does odd things to direct man page generation). Has it
been discussed and approved of by doc maintainers or is it just creeping
organically?


> + *
> + *	struct backlight_properties props = {
> + *		BACKLIGHT_PROPS(0, 255, BACKLIGHT_RAW)
> + *	};
> + *	...
> + *	props.max_brightness = new_max;
> + *	err = devm_backlight_device_register(,,,, props);
> + *
> + */
> +#define BACKLIGHT_PROPS(_brightness, _max_brightness, _type)	\
> +	.brightness = _brightness,				\
> +	.max_brightness = _max_brightness,			\
> +	.power = FB_BLANK_POWERDOWN,				\
> +	.type = _type,						\
> +	.fb_blank = 0,						\
> +	.state = 0,						\
> +	.scale = BACKLIGHT_SCALE_UNKNOWN,

Hmnnn... not sure I like seeing this buried.

BACKLIGHT_SCALE_UNKNOWN is not a sane default... it is pure legacy
so it would be good to force drivers to declare this explicitly
(since it would require new drivers to think about the correct value).

It then also becomes a good git grep target to help identify drivers
whose scale hasn't been reviewed and recorded yet...


Daniel.


> +
> +/**
> + * DECLARE_BACKLIGHT_INIT_RAW - backlight_properties to init a raw
> + *                              backlight device
> + *
> + * This macro is used to initialize backlight_properties that is used when
> + * registering a raw backlight device.
> + */
> +#define DECLARE_BACKLIGHT_INIT_RAW(name, _brightness, _max_brightness)		\
> +	const struct backlight_properties name = {				\
> +		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_RAW)	\
> +	}
> +
> +/**
> + * DECLARE_BACKLIGHT_INIT_PLATFORM - backlight_properties to init a platform
> + *                                   backlight device
> + *
> + * This macro is used to initialize backlight_properties that is used when
> + * registering a platform backlight device.
> + */
> +#define DECLARE_BACKLIGHT_INIT_PLATFORM(name, _brightness, _max_brightness)		\
> +	const struct backlight_properties name = {					\
> +		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_PLATFORM)	\
> +	}
> +
> +/**
> + * DECLARE_BACKLIGHT_INIT_FIRMWARE - backlight_properties to init a firmware
> + *                                   backlight device
> + *
> + * This macro is used to initialize backlight_properties that is used when
> + * registering a firmware backlight device.
> + */
> +#define DECLARE_BACKLIGHT_INIT_FIRMWARE(name, _brightness, _max_brightness)		\
> +	const struct backlight_properties name = {					\
> +		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_FIRMWARE)	\
> +	}
> +
>  /**
>   * struct backlight_device - backlight device data
>   *
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
