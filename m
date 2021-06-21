Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2733AE9B5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D5C89ECB;
	Mon, 21 Jun 2021 13:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7D389ECB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:06:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so8627346wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=F8qwXMvmBFqtLVWzQIYD5vryUHzEmvLf5X6idDb8i9o=;
 b=Plc6LjFUCW7ggK1p0u/KKsnEOKk/Q2Y1RKFIAC9327ThTUAv3sIP5K9ap90+w5zmfs
 ckOqfpcANzrocCxpftV4sxGzFajesEqlVzxp3eBta9XAbhGI/v8SI9/fQ7dpwsPPI7nm
 fnrrScCev88r9pt9fY7vdOGOiU48+5VDeLOrmcQ+pufFeobC8w+o+tHr9tsw9tgJ6Mjc
 6xkt2+IDWFbEvu6hpF4I7o0poX58KqMI1UUfr73srg/vKfO2LcoJY5i/YWODmdEF4yH9
 rkxGrWoR84agu/ZVv9PJZ9HSzPBGfOwng+H8SMIoJ3iMJZW7J216l8lnqUT8Jtjcq9uE
 VZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F8qwXMvmBFqtLVWzQIYD5vryUHzEmvLf5X6idDb8i9o=;
 b=JVr8+CrvmKobwDMrhIioi+5bNH90t723Y/mMGAS9LucKG+TgDsImdDRepYX4kQo5H5
 1gPYy7QvI3f2iXYRX3Ks/Ao6LVE0R27vhWwcgTB6sfdVVpJ+gNdS+sztEDIGFE5Om9L1
 wdjb45OZX1njx0cerewbWL2OA6sr3F8C38FjaI2e9Em6R3BIwK1GkkZpb3ORzoBh3FGS
 BEE8odFVIShSfBNz7w2VB2fxfvgr+WD6FFy2kVROhzM36Fae41f3xMinqebSb/1HtGK1
 kL5pey6WnHPkLEIDCPSvWAzt+2LDo++RQ2kO0KnBuGic0YOrbR3JiKTYJtssufc0fdmX
 6/zw==
X-Gm-Message-State: AOAM531mj7UCM3PPlunmoW3EPQXyQ/lLGqUQNP4KKFOOmnalEp1ZBenD
 OdP8DoSIEpFgDqKEiO7kJKSAwQ==
X-Google-Smtp-Source: ABdhPJy+22bs4GQKLxRVvp2K6RtCwV53ZcHe8XOE1aLpJnnwR6TqxT3py0MEQ1lFdSpFYBa4W50O5Q==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr19210951wmm.6.1624280772076; 
 Mon, 21 Jun 2021 06:06:12 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id l15sm7275561wrt.47.2021.06.21.06.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:06:11 -0700 (PDT)
Date: Mon, 21 Jun 2021 14:06:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 1/2] backlight: lm3630a: fix return code of
 .update_status() callback
Message-ID: <20210621130610.qttglxlstnoigcxw@maple.lan>
References: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
 <20210621122148.116863-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621122148.116863-2-u.kleine-koenig@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 02:21:47PM +0200, Uwe Kleine-König wrote:
> According to <linux/backlight.h> .update_status() is supposed to
> return 0 on success and a negative error code otherwise. Adapt
> lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status() to
> actually do it.
> 
> While touching that also add the error code to the failure message.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/lm3630a_bl.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index e88a2b0e5904..7140b0d98082 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -190,7 +190,7 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0) {
>  		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
>  				 bl->props.max_brightness);
> -		return bl->props.brightness;
> +		return 0;
>  	}
>  
>  	/* disable sleep */
> @@ -210,8 +210,8 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  	return 0;
>  
>  out_i2c_err:
> -	dev_err(pchip->dev, "i2c failed to access\n");
> -	return bl->props.brightness;
> +	dev_err(pchip->dev, "i2c failed to access (%pe)\n", ERR_PTR(ret));
> +	return ret;
>  }
>  
>  static int lm3630a_bank_a_get_brightness(struct backlight_device *bl)
> @@ -267,7 +267,7 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
>  	if ((pwm_ctrl & LM3630A_PWM_BANK_B) != 0) {
>  		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
>  				 bl->props.max_brightness);
> -		return bl->props.brightness;
> +		return 0;
>  	}
>  
>  	/* disable sleep */
> @@ -287,8 +287,8 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
>  	return 0;
>  
>  out_i2c_err:
> -	dev_err(pchip->dev, "i2c failed to access REG_CTRL\n");
> -	return bl->props.brightness;
> +	dev_err(pchip->dev, "i2c failed to access (%pe)\n", ERR_PTR(ret));
> +	return ret;
>  }
>  
>  static int lm3630a_bank_b_get_brightness(struct backlight_device *bl)
> -- 
> 2.30.2
> 
