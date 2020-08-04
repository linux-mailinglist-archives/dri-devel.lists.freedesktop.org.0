Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC623BE4F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 18:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6448A6E488;
	Tue,  4 Aug 2020 16:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06B6E48E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:43:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r4so35065836wrx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uw/uWNrGxAVlmP7iT2huZjdiTQmL9drTIUgRvx/hWA0=;
 b=PTEjYl66hGWbOd0qQWNCgfpJO26UJASQ+xO9qaylc+UIKL927uuaMxfB0XEoSHEJSD
 9SHlezrlbFjYBlRh1KDHcAs8fIsJcVC9letMtwyVC+qtIZYT1yvj7aHx+8uNo6E3OsAN
 O23MWmzWB11XGm1IVmBzW+bPTw8JaNORZKjZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uw/uWNrGxAVlmP7iT2huZjdiTQmL9drTIUgRvx/hWA0=;
 b=I7p5N5Uz12ruP7Zcxum+nYPirv3Q23kQE4KxfqX1Rj+sRwKMxrH08zwssqd/415cQd
 KFBbRBoqFbdIsu2KET682nSVW/VFc1s5DsCxttxaudoP/dbPCgOy21fNYXgb4VBRgy3v
 j0sNlRsazq43Hpco3/XlOkEGhWjMnJ4uWJMk8/wMNRUD4YAyBr8MAy0g7hhluvulFREF
 jJ9e1YYKIt15KhP53J/OW6+oqkPJeHO1fNIlFvt4dTj4Q+F8GKxjc48SZhgntSOCLopJ
 ryqzU0t9tEkBYiK0WUetHPhjQ301OzZpaP5uaK9BOlcZtjLTlABV7K4VvdBUeeQFG15o
 0XKw==
X-Gm-Message-State: AOAM533GYajTVLyF0Bz5rg94O8NnqgzXo5O5xrdvGWsf/3E3nTtnBne9
 YOfpp4+ihJ7rcoT9JTnFiD8jQA==
X-Google-Smtp-Source: ABdhPJy316ft8ta1qcdMb7MnYdxroTvG2dFkZoJXs9wtVMookGpQOGOtakwe0sEfCAY2uv+u9EwuKw==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr19739280wrv.120.1596559413443; 
 Tue, 04 Aug 2020 09:43:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i14sm37318295wrc.19.2020.08.04.09.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 09:43:32 -0700 (PDT)
Date: Tue, 4 Aug 2020 18:43:30 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH v1 03/22] backlight: Add get/set operations for
 brightness/power properties
Message-ID: <20200804164330.GL6419@phenom.ffwll.local>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802110636.1018743-4-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 02, 2020 at 01:06:17PM +0200, Sam Ravnborg wrote:
> Add get and set operations to incapsualte access to backlight properties.
> 
> One easy win is that the get/set operatiosn can be used when backlight
> is not included in the configuration, resulting in simpler code with
> less ifdef's and thus more readable code.
> 
> The set/get methods hides some of the confusing power states, limiting
> the power state to either ON or OFF for the drivers.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 72 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index d683c053ec09..882ceea45ace 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -474,6 +474,78 @@ static inline int backlight_get_brightness(const struct backlight_device *bd)
>  		return bd->props.brightness;
>  }
>  
> +/**
> + * backlight_get_actual_brightness - Returns the actual brightness
> + *
> + * On failure a negative error code is returned.
> + */
> +static inline int backlight_get_actual_brightness(struct backlight_device *bd)
> +{
> +	if (bd && bd->ops && bd->ops->get_brightness)
> +		return bd->ops->get_brightness(bd);
> +	else
> +		return -EINVAL;
> +}
> +
> +/**
> + * backlight_get_max_brightness - Returns maximum brightness
> + *
> + * This helper operation is preferred over direct access to
> + * &backlight_properties.max_brightness
> + *
> + * Returns 0 if backlight_device is NULL
> + */
> +
> +static inline int backlight_get_max_brightness(const struct backlight_device *bd)
> +{
> +	if (bd)
> +		return bd->props.max_brightness;
> +	else
> +		return 0;
> +}
> +
> +/**
> + * backlight_set_brightness - Set the brightness to the specified value
> + *
> + * This helper operation is preferred over direct assignment to
> + * &backlight_properties.brightness.
> + *
> + * If backlight_device is NULL then silently exit.
> + */
> +static inline void backlight_set_brightness(struct backlight_device *bd, int brightness)
> +{
> +	if (bd)
> +		bd->props.brightness = brightness;

Looking at the drivers I think including a call to backlight_update_status
would simplify a lot of code.

> +}
> +
> +/**
> + * backlight_set_power_on - Set power state to ON.
> + *
> + * This helper operation is preferred over direct assignment to
> + * backlight_properties.power.
> + *
> + * If backlight_device is NULL then silently exit.
> + */
> +static inline void backlight_set_power_on(struct backlight_device *bd)
> +{
> +	if (bd)
> +		bd->props.power = FB_BLANK_UNBLANK;
> +}
> +
> +/**
> + * backlight_set_power_off - Set power state to OFF.
> + *
> + * This helper operation is preferred over direct assignment to
> + * backlight_properties.power.
> + *
> + * If backlight_device is NULL then silently exit.
> + */
> +static inline void backlight_set_power_off(struct backlight_device *bd)

I'm not clear why we need these two above? I thought the long-term plan is
only use backlight_enable/disable and then remove the tri-state power
handling once everyone is converted over?

Or maybe I'm just confused about the goal here ...
-Daniel

> +{
> +	if (bd)
> +		bd->props.power = FB_BLANK_POWERDOWN;
> +}
> +
>  struct backlight_device *
>  backlight_device_register(const char *name, struct device *dev, void *devdata,
>  			  const struct backlight_ops *ops,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
