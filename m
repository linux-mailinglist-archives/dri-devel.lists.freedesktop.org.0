Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F9323B20
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 12:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592589F07;
	Wed, 24 Feb 2021 11:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D233D89F07
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 11:15:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id 7so1510767wrz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1Sa2i3Pn6JxJlmatuBNKl5Y5BjCnyJIbLhbxIWmo9lc=;
 b=zw/BWEU0xhJRMzGN2rcc+fgUFZsCzZoDNy6lsWAB9x7tAbPp8i0CRbRm+YVcISXG9/
 MWonpJ6Lf/XtDZsIX13obTjg2Uk0bCmlS8XbphLCPO54verJ0hAzuybYSQXno+ILB0We
 mM7WMClnWxAyBbqqvKsdhr89PBbGPVcQORbkfnVxqmera39IlDNWIQbe5BLajOPOrUyk
 MWW7RR+Q0BUMtqK/kOEGTtzZhyRqv4LSP8EdfvdABqevYVTR1bisEZoYvUM5U5Qgn9Iv
 rdi0vFChJ89xJW7xqj28o+kDArTNRk1q2NVKWlkVKLkoqNOuihqJ0xyaHM8wTsk9RzZm
 1Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Sa2i3Pn6JxJlmatuBNKl5Y5BjCnyJIbLhbxIWmo9lc=;
 b=ZQaJekYid2RPsG/+Vfkd72qOoKq5DVcxuvQeE/ovRRUjZQcIKPP+62bKSBz43cS8MJ
 zaM8+u8zrn1uKETw5wdvIsXsb5u9QtKey3xxQZEZi/nGEJXCTXcSvi05S72cpl+s5bcL
 ZGn3ZZZRp6Ih0GF61Saqc6qRaXjrsVkjEzEb0+e96a8jrZ+IDVxN4/sZZW9749SpvpUg
 bqQl9mzCXvH/MQQuL4Q/R6GdWRwTnUoQSalmZzD+rksQqcvDdgN6TSMJbTLfmEuUySV8
 72s8+FodVf4wvDXLZrTYblpIaJlD8it9+W9zIIgFEESTO+yRtFCEo8/dpEY2eib/Iwf4
 xv0w==
X-Gm-Message-State: AOAM531NbrVerkpAPUnfLbgigLDWm6Hvl/p7SkgnSiKHup0LeHho+D05
 ZnHw0ErEs3yVEU7an9DuQZXBAQ==
X-Google-Smtp-Source: ABdhPJy47KpFwjh6a9va/BqTgn6xTBovOwYIYWXdTXCSHwrc0OG6hfQ8/1Yjz2BCbty1uAxRn957OQ==
X-Received: by 2002:adf:cc88:: with SMTP id p8mr14587033wrj.169.1614165310424; 
 Wed, 24 Feb 2021 03:15:10 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o20sm2176733wmq.30.2021.02.24.03.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:15:09 -0800 (PST)
Date: Wed, 24 Feb 2021 11:15:05 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V1 1/2] backlight: qcom-wled: Fix FSC update issue for
 WLED5
Message-ID: <20210224111505.37t5aq25iszg23iv@maple.lan>
References: <1614138648-2963-1-git-send-email-kgunda@codeaurora.org>
 <1614138648-2963-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614138648-2963-2-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 09:20:47AM +0530, Kiran Gunda wrote:
> Currently, for WLED5, after FSC register update MOD_SYNC_BIT
> is toggled instead of SYNC_BIT. MOD_SYNC_BIT has to be toggled
> after the brightness update and SYNC_BIT has to be toggled after
> FSC update for WLED5. Fix it.

Code looks fine but the description is a difficult to read (which makes
mining the history difficult).

Basically the descriptions here are very hard to read without the
context in PATCH 0/2. Since PATCH 0/2 won't enter the version history
that means these descriptions need to integrate some of the text from
what is currently PATCH 0/2.

I would expect this to be more like. It is basically joining together
text from PATCH 0 and PATCH 1 (I also switched to plural form for SYNC
bits... the code in the driver has mask generation based on the number
of strings, is that right?):

~~~
Currently, for WLED5, the FSC (Full scale current) setting is not
updated properly due to driver toggling the wrong register after an FSC
update.

On WLED5 we should only toggle the MOD_SYNC bit after a brightness
update. For an FSC update we need to toggle the SYNC bits instead.

Fix it by adopting the common wled3_sync_toggle() for WLED5 and
introducing new code to the brightness update path to
compensate.
~~~


Daniel.



> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3bc7800..aef52b9 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -348,7 +348,7 @@ static int wled3_sync_toggle(struct wled *wled)
>  	return rc;
>  }
>  
> -static int wled5_sync_toggle(struct wled *wled)
> +static int wled5_mod_sync_toggle(struct wled *wled)
>  {
>  	int rc;
>  	u8 val;
> @@ -445,10 +445,23 @@ static int wled_update_status(struct backlight_device *bl)
>  			goto unlock_mutex;
>  		}
>  
> -		rc = wled->wled_sync_toggle(wled);
> -		if (rc < 0) {
> -			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
> -			goto unlock_mutex;
> +		if (wled->version < 5) {
> +			rc = wled->wled_sync_toggle(wled);
> +			if (rc < 0) {
> +				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
> +				goto unlock_mutex;
> +			}
> +		} else {
> +			/*
> +			 * For WLED5 toggling the MOD_SYNC_BIT updates the
> +			 * brightness
> +			 */
> +			rc = wled5_mod_sync_toggle(wled);
> +			if (rc < 0) {
> +				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
> +					rc);
> +				goto unlock_mutex;
> +			}
>  		}
>  	}
>  
> @@ -1459,7 +1472,7 @@ static int wled_configure(struct wled *wled)
>  		size = ARRAY_SIZE(wled5_opts);
>  		*cfg = wled5_config_defaults;
>  		wled->wled_set_brightness = wled5_set_brightness;
> -		wled->wled_sync_toggle = wled5_sync_toggle;
> +		wled->wled_sync_toggle = wled3_sync_toggle;
>  		wled->wled_cabc_config = wled5_cabc_config;
>  		wled->wled_ovp_delay = wled5_ovp_delay;
>  		wled->wled_auto_detection_required =
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
