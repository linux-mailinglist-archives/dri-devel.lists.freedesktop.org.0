Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4101EA199
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 12:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8026E21F;
	Mon,  1 Jun 2020 10:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758A36E21F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:10:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x14so10938751wrp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 03:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xOWcQDrTbG4JIa76/bX40XQNxFbdz4UYKFnkkU++44c=;
 b=EV5iSEKMfaiBukOaUADQEitrdEygtVzIxhZ1SoJdR6S0wloxfuvRdfOUe/+06kSquw
 V2Zj1CLZecO7PFDY5dUUC7MJEv+xtCq5LUnJM3boydmwwIwshro9AkYKHYn5w2AVMF+q
 kxaxN5L9zipPHNuIDO5rl5gnpmtvgvcs+uKynScmV3Fhr99O+ZVebn1FZsx1kyPlO5Nb
 0XNBwrBMjfm14JW+1KZtHPO390lkTXzi/YKByWZYEcrGPiSI9Ss0HfXmHruRz1i8z+uN
 4GGePJ8xaDcvklthCsMu+UulUOI9+L6rAfbF85jOT54C0JpqA9+1YGoN8qr5Bvxx2oT5
 x1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xOWcQDrTbG4JIa76/bX40XQNxFbdz4UYKFnkkU++44c=;
 b=XoxeZPornVtQaOY5cKYEHbo9NRVLC1R22w3frmBY3Xfqr70mspMDZxppAW7AcyMwWl
 9KG6AWwKn9ulURVObtWw25o3QsRbn/Timv+xX7wF8ultjL233Ce4mH59hV9DiUkldla2
 KENCNzGp12gOGIeq8o9poXuzPeXrGCyAGcpyZhpCDNetFulvmUKRpp3EHoTON7s918J1
 Ph2r45J4Jkgp+yJjKy8w0OmvMZiDJXDWNFhOhRn+iI8HK2ICvTMPBrXcrWrGCW0ne26T
 zEi2JtCYnUGX9F61i9jiwmg69tAFczKK6YdeYXhcyK/4614QSV7yqRm5XdOWVz5vo84z
 nIDA==
X-Gm-Message-State: AOAM532sGP3w4yovcAIKeyu3v4jhtpTeWX+ZZ7BFh1J1hg8fT+I/ZESw
 X+967Jx0Xvhub27ogrsT4a+6pQ==
X-Google-Smtp-Source: ABdhPJwgroSD1V5v8edCJRgUHwWE1MYVveR0VLHadkIrqi7NtKZE8H2vdx587WWhBa6aIcJM2RGUwg==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr22791117wrw.179.1591006222922; 
 Mon, 01 Jun 2020 03:10:22 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id m129sm11106569wmf.2.2020.06.01.03.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 03:10:21 -0700 (PDT)
Date: Mon, 1 Jun 2020 11:10:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 04/13] backlight: improve backlight_properties
 documentation
Message-ID: <20200601101018.w4h6hpt5wackndyb@holly.lan>
References: <20200601065207.492614-1-sam@ravnborg.org>
 <20200601065207.492614-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601065207.492614-5-sam@ravnborg.org>
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
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 01, 2020 at 08:51:58AM +0200, Sam Ravnborg wrote:
> Improve the documentation for backlight_properties and
> adapt it to kernel-doc style.
> 
> v2:
>   - Added into for each field (Daniel)
>   - Re-written some parts to explain what to do, rather
>     than what not to do.
>     Partly based on suggestions from the review (Daniel)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 96 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 85 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index b6c1ab6c922a..69a20da03035 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -117,28 +117,102 @@ struct backlight_ops {
>  	int (*check_fb)(struct backlight_device *bd, struct fb_info *info);
>  };
>  
> -/* This structure defines all the properties of a backlight */
> +/**
> + * struct backlight_properties - backlight properties
> + *
> + * This structure defines all the properties of a backlight.
> + */
>  struct backlight_properties {
> -	/* Current User requested brightness (0 - max_brightness) */
> +	/**
> +	 * @brightness: The current brightness requested by the user.
> +	 *
> +	 * The backlight core makes sure the range is (0 to max_brightness)
> +	 * when the brightness is set via the sysfs attribute:
> +	 * /sys/class/backlight/<backlight>/brightness.
> +	 *
> +	 * This value can be set in the backlight_properties passed
> +	 * to devm_backlight_device_register() to set a default brightness
> +	 * value.
> +	 */
>  	int brightness;
> -	/* Maximal value for brightness (read-only) */
> +
> +	/**
> +	 * @max_brightness: The maximum brightness value.
> +	 *
> +	 * This value must be set in the backlight_properties passed to
> +	 * devm_backlight_device_register() and shall not be modified by the
> +	 * driver after registration.
> +	 */
>  	int max_brightness;
> -	/* Current FB Power mode (0: full on, 1..3: power saving
> -	   modes; 4: full off), see FB_BLANK_XXX */
> +
> +	/**
> +	 * @power: The current power mode.
> +	 *
> +	 * User space can configure the power mode using the sysfs
> +	 * attribute: /sys/class/backlight/<backlight>/bl_power
> +	 * When the power property is updated update_status() is called.
> +	 *
> +	 * The possible values are: (0: full on, 1 to 3: power saving
> +	 * modes; 4: full off), see FB_BLANK_XXX.
> +	 *
> +	 * When the backlight device is enabled @power is set
> +	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
> +	 * @power is set to FB_BLANK_POWERDOWN.
> +	 */
>  	int power;
> -	/* FB Blanking active? (values as for power) */
> -	/* Due to be removed, please use (state & BL_CORE_FBBLANK) */
> +
> +	/**
> +	 * @fb_blank: The power state from the FBIOBLANK ioclt.
> +	 *
> +	 * When the FBIOBLANK ioctl is called fb_blank is set to the
> +	 * blank parameter and the update_status() operation is called.
> +	 *
> +	 * When the backlight device is enabled @fb_blank is set
> +	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
> +	 * @fb_blank is set to FB_BLANK_POWERDOWN.
> +	 *
> +	 * Backlight drivers should avoid using this property. It has been
> +	 * replaced by state & BL_CORE_FBLANK (although most drivers should
> +	 * use backlight_is_blank() as the preferred means to get the blank
> +	 * state).
> +	 *
> +	 * fb_blank is deprecated and will be removed.
> +	 */
>  	int fb_blank;
> -	/* Backlight type */
> +
> +	/**
> +	 * @type: The type of backlight supported.
> +	 *
> +	 * The backlight type allows userspace to make appropriate
> +	 * policy desicions based on the backlight type.
> +	 *
> +	 * This value must be set in the backlight_properties
> +	 * passed to devm_backlight_device_register().
> +	 */
>  	enum backlight_type type;
> -	/* Flags used to signal drivers of state changes */
> +
> +	/**
> +	 * @state: The state of the backlight core.
> +	 *
> +	 * The state is a bitmask. BL_CORE_FBBLANK is set when the display
> +	 * is expected to be blank. BL_CORE_SUSPENDED is set when the
> +	 * driver is suspended.
> +	 *
> +	 * backlight drivers are excpected to use backlight_is_blank()
> +	 * in their update_status() operation rather than reading the
> +	 * state property.
> +	 *
> +	 * The state is maintained by the core and drivers may not modify it.
> +	 */
>  	unsigned int state;
> -	/* Type of the brightness scale (linear, non-linear, ...) */
> -	enum backlight_scale scale;
>  
>  #define BL_CORE_SUSPENDED	(1 << 0)	/* backlight is suspended */
>  #define BL_CORE_FBBLANK		(1 << 1)	/* backlight is under an fb blank event */
>  
> +	/**
> +	 * @scale: The type of the brightness scale.
> +	 */
> +	enum backlight_scale scale;
>  };
>  
>  struct backlight_device {
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
