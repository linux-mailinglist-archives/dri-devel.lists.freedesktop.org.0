Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E77218004A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 15:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124F86E329;
	Tue, 10 Mar 2020 14:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918D6E311
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 14:34:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t11so16190415wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zXUts9AKiN/fKeCTOGQ7/e/tECu60a66Sq1qE2nSsj8=;
 b=ucqglDNfh+/t7dmNc1CoK4kO9k+WxOIJzAhBXn+Oh0STOsQnfHC/GDv6spYpC2ti0F
 WkhQA8v8uiST7Z2FuAl1vsyWSGLCSJLSeMFgLDT5TelHP3z9E5sty8LyyHNRfUDslRso
 p498ot405gbFzIQB8Gt7/kHjgUTRjDSPxJyPA9DIw7zogenq96fCCzMxkx/7v30uhgLQ
 MaUkhBksj+EQPUUo9C1nbNcAeQ7zVyr7DbaeRMuje32RNsSbERV6RjurO2HhIIVSVp5P
 1C58TiVwLcXXFWBZ6cIpe4SUvRGwDpB5RiViuB8j7/8j8KHchz/Q4771WMHVRqM0rp1w
 ddbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zXUts9AKiN/fKeCTOGQ7/e/tECu60a66Sq1qE2nSsj8=;
 b=uKY2qvb0kbORs9ZrqxG12SMeIe/NsMScVsOYpBniVns7Drzpqb4AVS9L6q9c0ooMq8
 VWEPTcVXn4oVL+a1mkyDqJxTBH0nSFBaQKyB/yXqOChUtdfuacpdtzF0sbYesnn3P2xM
 g08kZsrJYX44OSNAteUv+Gk/Crp8FBpy6fW3Nu2vTMHzoUAm0N0oQXJiYqwFg0vFm2dg
 x/L4iXEMxIERqG2KqJk6Dh0Eti7UMPNFyyEb9eapk35hHPz9dNk2TWn5P6prvp9vbBu5
 cqh2wwLi28bO1sofODJ0LuDnkHSrvdb1cWxAJn4kCIqcJ//nAWj5M7q9W9nx2amLzBWq
 1SBA==
X-Gm-Message-State: ANhLgQ3LQ8Wg0RUtmvgmIg9QWYoLsKCpzNkapSnwc8wRcmHrdaR6lBYj
 xk2gSSLjFEVRZuvSbKGmSq6eQg==
X-Google-Smtp-Source: ADFU+vvCn/r+CWrqGkHsSeFBVcE/wnMDHgQjwBF6p03Kfe11Rwc7vjt86tUuLleXNkWdlmNEvJ52Jg==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr29388013wrn.29.1583850875652; 
 Tue, 10 Mar 2020 07:34:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o3sm4610328wme.36.2020.03.10.07.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 07:34:34 -0700 (PDT)
Date: Tue, 10 Mar 2020 14:34:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v7 12/13] backlight: pwm_bl: Use 64-bit division macros
 for period and duty cycle
Message-ID: <20200310143432.cfjlqac5x6oinshj@holly.lan>
References: <cover.1583782035.git.gurus@codeaurora.org>
 <bf6d8f6190d266f8992bd5451b12c9f3962fd18e.1583782035.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf6d8f6190d266f8992bd5451b12c9f3962fd18e.1583782035.git.gurus@codeaurora.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 12:35:15PM -0700, Guru Das Srinagesh wrote:
> Because period and duty cycle are defined in the PWM framework structs
> as ints with units of nanoseconds, the maximum time duration that can be
> set is limited to ~2.147 seconds. Redefining them as u64 values will
> enable larger time durations to be set.
> 
> As a first step, prepare drivers to handle the switch to u64 period and
> duty_cycle by replacing division operations involving pwm period and duty cycle
> with their 64-bit equivalents as appropriate. The actual switch to u64 period
> and duty_cycle follows as a separate patch.
> 
> Where the dividend is 64-bit but the divisor is 32-bit, use *_ULL
> macros:
> - DIV_ROUND_UP_ULL
> - DIV_ROUND_CLOSEST_ULL
> - div_u64
> 
> Where the divisor is 64-bit (dividend may be 32-bit or 64-bit), use
> DIV64_* macros:
> - DIV64_U64_ROUND_CLOSEST
> - div64_u64

This patch looks like it is a tiny change to get the pwm_backlight to
perform 64-bit division. Most of the above text is completely irrelevant
to the change contained in this patch. No need to justify the change in
the PWM structures here since that can go in the patch that changes
those structures.  Just describe what this patch does, perhaps something
like the following:

    The PWM API will shortly switch the state.period and
    state.duty_cycle fields to 64-bit values. Make pwm_bl
    ready for this transition by adopting 64-bit division
    macros.

Also please copy the backlight maintainers into the covering letter. It
is useful to place patches like this into context.


Daniel.

 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-pwm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  drivers/video/backlight/pwm_bl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index efb4efc..3e5dbcf 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -625,7 +625,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>  		pb->scale = data->max_brightness;
>  	}
>  
> -	pb->lth_brightness = data->lth_brightness * (state.period / pb->scale);
> +	pb->lth_brightness = data->lth_brightness * (div_u64(state.period,
> +				pb->scale));
>  
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = data->max_brightness;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
