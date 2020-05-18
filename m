Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598111D7E1B
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FCB6E429;
	Mon, 18 May 2020 16:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046506E429
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:15:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so12642367wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VQ/xp5imBa0WnTxVqHaPG+hFt8e/22ggwecyd51PGzk=;
 b=ntTaFpyaRFwMvp2sCdxGkNQRkx4vXuDOTI5vUtEobMg0TBnfVxxSzENQcBKd3Hri8f
 MGADmh9T0nBJBB6DCv0kNZYh2W+10KCZ1iBXx2LzxJ3GXyn5FjeYledM4XBTbcf/L07m
 CQGFIIzo/valrC3uTp+A5Vr7r6EEgvfh3FiTnKZQiQ0xZPSSJ7cjjsmh+cYJIeQK/Jgr
 85fjMxQ1euTVg/v6c+1jIboeaW4u0woUyK4KJYtjhx3csR1iqRlYT3AXifrqVfEw7Jkm
 /NKDR+ozs20y6IHhKMa6mekiyovSAnSMHcKwGGQIhc196W7OREd6F/DeKTzbiaFDgOFk
 gSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VQ/xp5imBa0WnTxVqHaPG+hFt8e/22ggwecyd51PGzk=;
 b=JIAW2gnaNQb0Zdl3ivnw145icI8bGEg4l5j/kRO7DJLR6tp7/jfr984VtARbWTDagw
 YYYsmKc85UeEJVkjTzERHtCAVrTgGaFQlBcbiJjlXz8ILq1ovyts+ETSglrT6sPEnXnD
 /5KczFkYcrCDTUQlcp0U7AFvYWTNrX7olosxUvtIR7AEl6UH6AAfVWZiD7Jn3kP9CwPQ
 vol9qKhdwvxJMA2taaQW/ZSjiLWGyeaoNLNYQZ/XmU1yXoC8JXnHv1QYSEdPDq4U702W
 LID+DMu1kq+5JRBaxYcD/gXaEZJ0z7E3OKSF7tumOzfmgcl6BODg00eAOJ5M3fkwXYQL
 u34Q==
X-Gm-Message-State: AOAM532s+xOIvWRf7QgD2Zq3s9GqZN3mgl3nUpK6I87A+HcUPN307iZb
 k5TR5i3vb6dk+1Atc9NfQW6S8g==
X-Google-Smtp-Source: ABdhPJyXF33QcqwBX/Z0K2IAeP5LAhZ5B7an0UsUUQYIPregQZ5Ia2200Q2cxnXjyHP6OiHKjD5iRg==
X-Received: by 2002:a5d:67cb:: with SMTP id n11mr10552921wrw.275.1589818526667; 
 Mon, 18 May 2020 09:15:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g24sm17916112wrb.35.2020.05.18.09.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:15:26 -0700 (PDT)
Date: Mon, 18 May 2020 17:15:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 08/16] backlight: document enums in backlight.h
Message-ID: <20200518161524.tbgrgle6hbsdpm4c@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-9-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-9-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 17, 2020 at 09:01:31PM +0200, Sam Ravnborg wrote:
> Add kernel-doc documentation for the backlight enums
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Other than the usual comment about the form in the kernel-doc howto:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>



> ---
>  include/linux/backlight.h | 84 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 98349a2984dc..b779c29142fd 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -14,26 +14,110 @@
>  #include <linux/mutex.h>
>  #include <linux/notifier.h>
>  
> +/**
> + * enum backlight_update_reason - what method was used to update backlight
> + *
> + * A driver indicates the method (reason) used for updating the backlight
> + * when calling backlight_force_update().
> + */
>  enum backlight_update_reason {
> +	/**
> +	 * @BACKLIGHT_UPDATE_HOTKEY:
> +	 *
> +	 * The backlight was updated using a hot-key.
> +	 */
>  	BACKLIGHT_UPDATE_HOTKEY,
> +
> +	/**
> +	 * @BACKLIGHT_UPDATE_SYSFS:
> +	 *
> +	 * The backlight was updated using sysfs.
> +	 */
>  	BACKLIGHT_UPDATE_SYSFS,
>  };
>  
> +/**
> + * enum backlight_type - the type of backlight control
> + *
> + * The type of interface used to control the backlight.
> + */
>  enum backlight_type {
> +	/**
> +	 * @BACKLIGHT_RAW:
> +	 *
> +	 * The backlight is controlled using hardware registers directly.
> +	 */
>  	BACKLIGHT_RAW = 1,
> +
> +	/**
> +	 * @BACKLIGHT_PLATFORM:
> +	 *
> +	 * The backlight is controller using a platform-specific interface.
> +	 */
>  	BACKLIGHT_PLATFORM,
> +
> +	/**
> +	 * @BACKLIGHT_FIRMWARE:
> +	 *
> +	 * The backlight is controlled using a standard firmware interface.
> +	 */
>  	BACKLIGHT_FIRMWARE,
> +
> +	/**
> +	 * @BACKLIGHT_TYPE_MAX: Number of entries.
> +	 */
>  	BACKLIGHT_TYPE_MAX,
>  };
>  
> +/**
> + * enum backlight_notification - the type of notification
> + *
> + * The notifications that is used for notification sent to the receiver
> + * that registered notifications using backlight_register_notifier().
> + */
>  enum backlight_notification {
> +	/**
> +	 * @BACKLIGHT_REGISTERED:
> +	 *
> +	 * The backlight device is registered.
> +	 */
>  	BACKLIGHT_REGISTERED,
> +
> +	/**
> +	 * @BACKLIGHT_UNREGISTERED:
> +	 *
> +	 * The backlight revice is unregistered.
> +	 */
>  	BACKLIGHT_UNREGISTERED,
>  };
>  
> +/** enum backlight_scale - the type of scale used for brightness values
> + *
> + * The type of scale used for brightness values.
> + */
>  enum backlight_scale {
> +	/**
> +	 * @BACKLIGHT_SCALE_UNKNOWN:
> +	 *
> +	 * The scale is unknown.
> +	 */
>  	BACKLIGHT_SCALE_UNKNOWN = 0,
> +
> +	/**
> +	 * @BACKLIGHT_SCALE_LINEAR:
> +	 *
> +	 * The scale is linear, so the brigness increase is the same
> +	 * when increasing with the same steps (more or less).
> +	 */
>  	BACKLIGHT_SCALE_LINEAR,
> +
> +	/**
> +	 * @BACKLIGHT_SCALE_NON_LINEAR:
> +	 *
> +	 * The scale is not linear. This is often used when the brightness
> +	 * values tries to adjust to the relative perception of the eye
> +	 * demanding a non-linear scale.
> +	 */
>  	BACKLIGHT_SCALE_NON_LINEAR,
>  };
>  
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
