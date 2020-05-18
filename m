Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610791D7BE7
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346E26E340;
	Mon, 18 May 2020 14:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2216E340
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:55:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j5so12273597wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sc8LZw1aFYMl/7VH0/CKYrILiudqiq2KGCatolX/Vlo=;
 b=xb+BHHLf1Tatfi2MNt/KTxXmOAgaTICpK/MatIHpslOb28JgiBQOS8/48GvZygyiOj
 gG4DOvymcf097FXDlRqK6LcZXodUXX202ht8WWJpqSJdUywvnzW9UwTh2L1SoER+d5KK
 qgIklbC6gwPC/eR3BYYS/F+cSbuMupDwpIbJlKBIPXhP9Apy+ZDZug4OQdT9y2e+alpN
 eyoR0GEuTULmbFUpZFsmvKYomsAxk7DRB1E2VMEVtq1HHKIJSNnIeWxaQr3W6J3QBILv
 jgnE4DBHlxfJNHfC/nZIeMCL3qAOnBpAVy9f2neAj3jFAvnfuzjCy4AbWAg72r/DdUG/
 k2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sc8LZw1aFYMl/7VH0/CKYrILiudqiq2KGCatolX/Vlo=;
 b=FnUbZMYYdEgcGEHQGYBX4i7sxhklWo5I6MqdKRPVJCV8NZXW1b/v5DDZXewLD9NlwI
 M8H+Eu5OyXNokiV3WK9e0fbJet7Xf+UpqAzvZcPaF5MgM9moh1Sqy5evg3+QLB6JjrvV
 rUvftNIKliqsUtTFpwHiMqm22BWfBxVK1rP9guNdsbWUCU3aqRnyYcigFs9664JpHRvK
 nOO52GpCG58RdkGAYxh6aSUV9ZS/3c8aZpk2ccxS/34kf60T+hxgMkNZremnbqxSj4Sr
 Rw5Obs8WQat9z0+C/kNlliNTVgXxQAC5AL6pGFgeUdUVaZxNosJE4CRkcSSVPDuEn9oc
 oLNg==
X-Gm-Message-State: AOAM532HtF/Jc0PIK7KeD22tC9weFI/wj6wkDUOh63mTAG3fMCeCWHBK
 YExhdOGYP8WJewWXkcve3WEslg==
X-Google-Smtp-Source: ABdhPJyQ+pvcK3hqQHdj+Yb7Twm2o3yI6kGnwEAvQE9nHPKDkHS5qu1gqYNSErT5DehDyzyl1UAQCA==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr20630988wrv.370.1589813700229; 
 Mon, 18 May 2020 07:55:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l19sm17377481wmj.14.2020.05.18.07.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:54:59 -0700 (PDT)
Date: Mon, 18 May 2020 15:54:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 02/16] backlight: refactor fb_notifier_callback()
Message-ID: <20200518145457.zonqhzkeybxdrq6b@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-3-sam@ravnborg.org>
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

On Sun, May 17, 2020 at 09:01:25PM +0200, Sam Ravnborg wrote:
> Increase readability of fb_notifier_callback() by removing
> a few indent levels.
> No functional change.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/backlight.c | 43 +++++++++++++++--------------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index cac3e35d7630..17f04cff50ab 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -58,28 +58,29 @@ static int fb_notifier_callback(struct notifier_block *self,
>  
>  	bd = container_of(self, struct backlight_device, fb_notif);
>  	mutex_lock(&bd->ops_lock);
> -	if (bd->ops)
> -		if (!bd->ops->check_fb ||
> -		    bd->ops->check_fb(bd, evdata->info)) {
> -			fb_blank = *(int *)evdata->data;
> -			if (fb_blank == FB_BLANK_UNBLANK &&
> -			    !bd->fb_bl_on[node]) {
> -				bd->fb_bl_on[node] = true;
> -				if (!bd->use_count++) {
> -					bd->props.state &= ~BL_CORE_FBBLANK;
> -					bd->props.fb_blank = FB_BLANK_UNBLANK;
> -					backlight_update_status(bd);
> -				}
> -			} else if (fb_blank != FB_BLANK_UNBLANK &&
> -				   bd->fb_bl_on[node]) {
> -				bd->fb_bl_on[node] = false;
> -				if (!(--bd->use_count)) {
> -					bd->props.state |= BL_CORE_FBBLANK;
> -					bd->props.fb_blank = fb_blank;
> -					backlight_update_status(bd);
> -				}
> -			}
> +
> +	if (!bd->ops)
> +		goto out;
> +	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
> +		goto out;
> +
> +	fb_blank = *(int *)evdata->data;
> +	if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
> +		bd->fb_bl_on[node] = true;
> +		if (!bd->use_count++) {
> +			bd->props.state &= ~BL_CORE_FBBLANK;
> +			bd->props.fb_blank = FB_BLANK_UNBLANK;
> +			backlight_update_status(bd);
> +		}
> +	} else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
> +		bd->fb_bl_on[node] = false;
> +		if (!(--bd->use_count)) {
> +			bd->props.state |= BL_CORE_FBBLANK;
> +			bd->props.fb_blank = fb_blank;
> +			backlight_update_status(bd);
>  		}
> +	}
> +out:
>  	mutex_unlock(&bd->ops_lock);
>  	return 0;
>  }
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
