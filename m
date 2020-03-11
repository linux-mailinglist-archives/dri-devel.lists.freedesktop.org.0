Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF323181579
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 11:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607856E96A;
	Wed, 11 Mar 2020 10:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA9F6E96A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:05:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id n2so1380028wmc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=93G/zDTaOyD8EFBjnQ5HIhSQ1W1zWJdEX89fmqSHRBM=;
 b=sphWW9cMhYeeZnLJ1WOkhyAMUglQ2PHyu4A4P4MLn5LhUtR9grWcvpv742AfsJD6Ae
 MTvz64bk2UZqLRIhYNkgXi2vDO0gtjl1Y1K0iLPsu9RZOBO+0NApphHzRa/dwzCffgyz
 JCPqgrdJC6G4t08cCPiiopuMy77kI75CX90AUD5PQDA+3LrRgoiWJLUkVupU0XhQnhM0
 uwQesF7rKRXr4TUN92Sp0L6xrs0pD8XnAGmGuAvA7PWJWJQ7eb/vVnHglk5SmVwwDU8w
 P5YMd7cfmZvPApO7oHcFhiAb6mDKRbVk5KH+MR1INXVq1NdWTwh8eg3ym3UH9qsNgraI
 a9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=93G/zDTaOyD8EFBjnQ5HIhSQ1W1zWJdEX89fmqSHRBM=;
 b=IFBYfMVHWq22XKxGpMNU8KrUMHjXVIYethrrhghlf0ocHh0sn812oleL9/XOFb8LZv
 42NEWphREIDexpBArnBria7+uZua3xDgwSv05mD0SmF0UYz4Se35hKyGS2RZshanR9VL
 UD15fFvvzdDJhs42b0gmVp74CPsNlfEEzGjpSrDEYPnxleEVo/723ieMEclVO2lG1xUH
 mtL6K48kus9WIRgoKM4CT7XJzM4eHZmRp9BJU4msuKd25/0EF8zfICay7xbd1AcawiWd
 GpvFvLeNgqfhFiLBy357F+nHBGFZIBmDuhLQbdiCjXZvPJEFY51Gc8KXnwOyqGCdYkXr
 Eg7Q==
X-Gm-Message-State: ANhLgQ3ViUlc4qdh3G83+/teJyJBnuEYSbGQK1+JhvCQDWeF63JaH9+L
 wvVlh3e7pXt+BKW4V8Bz2mXRTw==
X-Google-Smtp-Source: ADFU+vux58htGjgI+MQUNkO9EePfRE4OlardHqAxVYVpyO/Mn5vugUubYA/2NPUQF5VUi6osmAu/aQ==
X-Received: by 2002:a1c:1f14:: with SMTP id f20mr3005879wmf.61.1583921154070; 
 Wed, 11 Mar 2020 03:05:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i21sm8239881wmb.23.2020.03.11.03.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 03:05:53 -0700 (PDT)
Date: Wed, 11 Mar 2020 10:05:51 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v8 11/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200311100551.umvfqelrqzcfo7sa@holly.lan>
References: <cover.1583889178.git.gurus@codeaurora.org>
 <a9f914f92ee637c68e1d336e5b4894a565eb3cdc.1583889178.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9f914f92ee637c68e1d336e5b4894a565eb3cdc.1583889178.git.gurus@codeaurora.org>
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

On Tue, Mar 10, 2020 at 06:41:20PM -0700, Guru Das Srinagesh wrote:
> Since the PWM framework is switching struct pwm_state.period's datatype
> to u64, prepare for this transition by using div_u64 to handle a 64-bit
> dividend instead of a straight division operation.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-pwm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

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
