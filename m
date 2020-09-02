Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9CB25AA4A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C646E4A2;
	Wed,  2 Sep 2020 11:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279AC6E4A2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:30:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a9so4151152wmm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j09RJWiCRpBEwLUPbRB6rHSJMiEfEblSnxzgrdzGMKU=;
 b=yC83MHJJq/M1upE5wDy3tfP3E3zVOK6J+5QZMFbXn81w6/Kz6HdbGFQxWaZOJRwCln
 7aosHV9icwgyCEZC94i036m0yyAlTmykxAgurFf5OlRuNTnqH8VLARO3QVZWQ4wXdxaO
 3vxbG9WmRy/FTpj11dZmqOZ6cLIV1QxFucGR0g6PXYW/l0Yr4NcaZ08KQrvfhfnZ58Y7
 SDTUgu8HBnM2eKZdOn8O6vWTOl4csh3tShXwhtyGXd4Kwxbyy6a7uT58o42VbDNfgr12
 Lg5Kp8lH/8XdqnzJ+TbzMnq6YjmLOAByRtQ92Uu0UeVBFlKhY/9AsFN1Uw34ap8csxE+
 KhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j09RJWiCRpBEwLUPbRB6rHSJMiEfEblSnxzgrdzGMKU=;
 b=j4QvO/b5sTsbhAIUt6CABF950BlRGL5hN1apF2nlvPMnYCNz1dx84zj1Jc3T5fpKWA
 NwLDSegu0CD78D6D0j8Cf1kzlNXAbMpAEKmwB3a1jwbXStCtxCulLf2VQl9BXz9E41dj
 Y9iZyGxaCsVL5jA1i2Ww68/87SM3sfg1s4HpgQ5Z/DknBFtnEeLgQHCtdOxoDmWIJMVA
 TFepAa++Tkqt/1MNVPhqfcBid81KO5oA0J5aiCIR+B7rsiiggcVy7v8CSPiposRE9xLd
 6kMlczaV1jLGzwM30XnSKGBiIqtnCD//6CU06x6UurWD8iblJaPYqIeKTKJSUu3ORKUU
 hDnQ==
X-Gm-Message-State: AOAM532GIpi/salerBEJLmcB8bUoDlkvvSi7hzqJFmds3Km2f3cyUl/C
 5ZMtAQWwg7C8Ld5lZtMRYJF4Hg==
X-Google-Smtp-Source: ABdhPJx2JSb18TPAGQv4g/PObUXlyZKvmzXWHU/9YR9+bZ1bbYHxRYJ3kzFc3wx3ZMClP0Raw88NwQ==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr240529wml.10.1599046207790;
 Wed, 02 Sep 2020 04:30:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i26sm1613346wmb.17.2020.09.02.04.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:30:07 -0700 (PDT)
Date: Wed, 2 Sep 2020 12:30:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 03/24] backlight: Add get/set operations for
 brightness properties
Message-ID: <20200902113005.qmcnbmwut37fulqw@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823104532.1024798-4-sam@ravnborg.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 12:45:11PM +0200, Sam Ravnborg wrote:
> Add get and set operations to incapsualte access to backlight brightness.
> 
> One easy win is that the get/set operations can be used when backlight
> is not included in the configuration, resulting in simpler code with
> less ifdef's and thus more readable code.
> 
> The backlight_enable_brightness() update the brightness and enable
> the backlight.
> 
> The backlight_update_brightness() force the brightness update and
> typical usage is to set brightness after registering a backlight device.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  include/linux/backlight.h | 74 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 93a47a6cf681..e390444bed13 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -492,6 +492,80 @@ static inline int backlight_get_brightness(const struct backlight_device *bd)
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
> +}
> +
> +/**
> + * backlight_update_brightness - Update the brightness to the specified value
> + *
> + * Update brightness and force an update.
> + *
> + * If backlight_device is NULL then silently exit.
> + */
> +static inline void backlight_update_brightness(struct backlight_device *bd, int brightness)
> +{
> +	if (bd) {
> +		bd->props.brightness = brightness;
> +		backlight_update_status(bd);
> +	}
> +}
> +
> +/**
> + * backlight_enable_brightness - Enable backligt using specified brightness
> + *
> + * Enable brightness using the specified brightness.
> + *
> + * If backlight_device is NULL then silently exit.
> + */
> +static inline void backlight_enable_brightness(struct backlight_device *bd, int brightness)
> +{
> +	if (bd) {
> +		bd->props.brightness = brightness;
> +		backlight_enable(bd);
> +	}
> +}
> +
>  struct backlight_device *
>  backlight_device_register(const char *name, struct device *dev, void *devdata,
>  			  const struct backlight_ops *ops,
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
