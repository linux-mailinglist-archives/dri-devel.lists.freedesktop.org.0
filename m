Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8812F32661F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 18:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5D16EDFA;
	Fri, 26 Feb 2021 17:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBD76EDFA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 17:09:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id u11so2282410wmq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 09:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oPmNNtgVI1eH+eqDytkra/zaGpGkiEOuBv8E+PK1q2E=;
 b=L7hDueq6FbCIPz8Y3pcSNYtyDe8eNaCraw1jcrjoeS23ebZwbWTe2IvnUl3GTrNLmq
 dp/21SOTMaADDXil2WuhCsxvlC5Bd8t6Q0CQjJBwgdkDx6CfVANpZLQhHs7HuFp/tUKp
 ugk+lZE1L3c+edikdt8ARj5u40FArM+iVyHpBjX8Uv1EsQ60LVXZpBDQQ8fdHQnKZfNz
 cTjpmuu4CpOZKv6UhEPfmTf1zEiyzlIUG2JkbTKRtqrdRvBv5kIBCgG2Genf1uTGFD+J
 sm4ouIPR9uM8KYMJ6DojeiG7g8mio0pX6cOcHUcdrBSc1xVMNbSKwqDTO5CEYpuya8rP
 U7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oPmNNtgVI1eH+eqDytkra/zaGpGkiEOuBv8E+PK1q2E=;
 b=gUtQwtUFeZufhh8e3ijAQFcI1dV6f0FKtk/lB8h3WA39lUqYAtxeaXGkHVdFLudgdX
 IxWpucQGf2pxuerNHRAc1ZHveE8DgYFbwEH003m4NBXRwmqyr0oPSdBLLdCc/oY/Kr2Y
 QpCclA50b6UQOovwf6RkzQrK0nZXcoGN8Lfil6GOZm+vTqa82JJHfZbPw6VXCr1hTtAZ
 K6LqEDxjCJbzGjDHLJj8CqQb6W1+58kqZVDNVZvxODd61dbTV2x+n9ZaLu1sOFLIIYBp
 jNDqoAC3DLNGHA2CU6vQkPgz/fbPquK4a9mVqaZ8GEE8WRc0Yq6Bv18uwKXT/AG6rNTh
 56vw==
X-Gm-Message-State: AOAM532kcWsBBQaV/MHl4y0m62RuYLaQ3D7mSBWgqNenv3pYn78X/jTM
 J2O+fnbREZlbABxNjVjgIpQYuQ==
X-Google-Smtp-Source: ABdhPJy+3JLr8vLHWKe27u3nSTX1ODTzNCh6BSKvpoFvfptBEwnzyGPmA8wyoRhYBiUAbOt8tHcXWw==
X-Received: by 2002:a1c:5584:: with SMTP id j126mr3925587wmb.153.1614359347431; 
 Fri, 26 Feb 2021 09:09:07 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id m9sm19290337wml.3.2021.02.26.09.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:09:06 -0800 (PST)
Date: Fri, 26 Feb 2021 17:09:04 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V2 1/2] backlight: qcom-wled: Fix FSC update issue for
 WLED5
Message-ID: <20210226170904.u5ysz6kg4tqbh3us@maple.lan>
References: <1614341544-5306-1-git-send-email-kgunda@codeaurora.org>
 <1614341544-5306-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614341544-5306-2-git-send-email-kgunda@codeaurora.org>
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

On Fri, Feb 26, 2021 at 05:42:23PM +0530, Kiran Gunda wrote:
> Currently, for WLED5, the FSC (Full scale current) setting is not
> updated properly due to driver toggling the wrong register after
> an FSC update.
> 
> On WLED5 we should only toggle the MOD_SYNC bit after a brightness
> update. For an FSC update we need to toggle the SYNC bits instead.
> 
> Fix it by adopting the common wled3_sync_toggle() for WLED5 and
> introducing new code to the brightness update path to compensate.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

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
