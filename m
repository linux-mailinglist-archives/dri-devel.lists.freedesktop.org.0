Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D991D7DBF
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F046E237;
	Mon, 18 May 2020 16:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E4F6E237
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:04:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so12556070wrt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YP8CIZVjkkHF2G0WX+WhQCb99+RXsj9eHVsB1xIYlDI=;
 b=iOGhTJKYxRyBmpnPYcOpuh0C1+CJnkg4S++Jh+yKaD7pVGeDnZYU9er35/bOk37Bqe
 kgZqGbDMSeGsQOzKfYNnDtoruFmL7pc6khugd9Zel6TlNeCOYuBfTdLCA68Y/ZIDHFmu
 RZ/iGj0XqPfgyNg59+qkCWZOL5Z8DC45MfpQ+g0kx2DqLHfMFZCm2xSF8rpNpO7ljpFb
 sknr2cUsEoCXXlS6FlBtUar6I6lhst8bUG2kYwbbKCXmEMfToo/EVMIBanLd9WgfVUdC
 U49r5NM+AX1WMt2t3EFt0BtOZbU5WxOWFWTXWgvYtK4T+kTAcfQ9ZLdiIc0/GWw0uifU
 2tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YP8CIZVjkkHF2G0WX+WhQCb99+RXsj9eHVsB1xIYlDI=;
 b=pepdiniHLEdtAMwWBPfDHcTuoEYYtdlbyfLw40xUDLeqQBEPCV+GdiUQ78Gzilvcsp
 /nnpbG1sIIZ91kgYF+nUTBC14exaFzosfbDb1Lz9hi6StbV6C9k2vtABOKxFLXMM3iGi
 oMr5MdAHikfPozU9JGt+td+l2KB1A4CVzGPZmUf9XRcqE94ksg+X922740aG0lh1N1DW
 C13rLxDb/jXRoYO2ltpeXOyZh40y2UaKK06bEHKkj6I6f4wIra/nI3C1rMuQTPl7tqen
 4W+zXh8UstwW71QmdQsTIugKazwEmqi61lugtvPSlZN9IncO5BVjZcIBff9Zdvr1Wdhh
 n2Cg==
X-Gm-Message-State: AOAM533WHyQNe5KSqNEJJvjBRWhBKskp/MDskZdiKN2kuHlqC+ZFmLz0
 92qJWpTIaE7vWxa+4UhrRLRfwA==
X-Google-Smtp-Source: ABdhPJzvNP6Gmw/v+NTHrtZ9cGIGmEaLhbGhqaJPSjy5MpKyEdqde80GInq/3Ai1iSjkpQfKhVnU7A==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr20016286wru.290.1589817887106; 
 Mon, 18 May 2020 09:04:47 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c17sm17357566wrn.59.2020.05.18.09.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:04:46 -0700 (PDT)
Date: Mon, 18 May 2020 17:04:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 07/16] backlight: document inline functions in
 backlight.h
Message-ID: <20200518160444.huxyjm2wxajnyfmx@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-8-sam@ravnborg.org>
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

On Sun, May 17, 2020 at 09:01:30PM +0200, Sam Ravnborg wrote:
> Add documentation for the inline functions in backlight.h
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index e2d72936bf05..98349a2984dc 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -283,6 +283,10 @@ struct backlight_device {
>  	int use_count;
>  };
>  
> +/**
> + * backlight_update_status - force an update of the backligt device status

Typo.

Other than that,

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> + * @bd: the backlight device
> + */
>  static inline int backlight_update_status(struct backlight_device *bd)
>  {
>  	int ret = -ENOENT;
> @@ -375,6 +379,18 @@ extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned
>  
>  #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
>  
> +/**
> + * bl_get_data - access devdata
> + * @bl_dev: pointer to backlight device
> + *
> + * When a backlight device is registered the driver has the possibility
> + * to supply a void * devdata. bl_get_data() return a pointer to the
> + * devdata.
> + *
> + * RETURNS:
> + *
> + * pointer to devdata stored while registering the backlight device.
> + */
>  static inline void * bl_get_data(struct backlight_device *bl_dev)
>  {
>  	return dev_get_drvdata(&bl_dev->dev);
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
