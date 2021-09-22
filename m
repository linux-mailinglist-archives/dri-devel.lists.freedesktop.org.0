Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A18F4142C0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 09:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139866EAC2;
	Wed, 22 Sep 2021 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302E6EAC2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 07:34:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d6so3860186wrc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 00:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ia4rl1E960Y9OxPRW1u1XQZaGVgTW+fVkEu7wRUVsc8=;
 b=vbwKhiAhXnkVhBQ5uacbJBGzL52Xsf2Z8xnzYCoFeomOC7XnCXOHEipjbL61Xf+PHP
 EI7Swacths0dsvn7eDcc9OWz+IUIPx9KCqqMNyDTUWlvsW0SZFVCdnubcmJ4mp21uiXG
 1jtv9KUQyZ9CPlG1LwbEhi8OpP/1xT9LO+9GHrzYcLRxHolnYtU9A1jiWVv8vJQuQ+KK
 NenzVRMGKxroeB5rIJmGflm7DfZ6MkRzVk3UFFAv4hjgDFPKSU81uyHmnrcAJqP1A4kp
 S6XFHXIjqguI5fuEQzm97lhi5HJfOujru0e26QLOMaLgVYbp2+7BetGO9a4OD9dWSHTR
 jEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ia4rl1E960Y9OxPRW1u1XQZaGVgTW+fVkEu7wRUVsc8=;
 b=wx/Tsj4H1q9l0Lu+mF0Rz7mNsmZqfOxW3XVPzPjx9RmXuXzU23J0Bpx/t+PCsP5PHO
 5r62UN5OXZSCq+uF6srXCUzwkc1QDVSuVYDnxN+aZzuoFzHThM3gxM6o6kvhhP64mVGn
 Lk6XfFmwqsKX4mjVYjXw4Ikuoyr7CVJQEoedYU7yi6VCpe+O8Ixa9teYsPcrouqrRqqF
 Qll2pAXC1MQw7Lg5sDUSSt6girhtZkhl5iJwdH645JQsQMg1AHioF0ySGuF0E3RR/86R
 AlttI/BX5/BlvBSMM+5t9erPGpdyZXtBIdieM3T51NSSOv7Wr9g+kek5elcoBvHODpon
 NFog==
X-Gm-Message-State: AOAM531Le63nDN7mbd/0fTgW/8Va8ymos4adh0Qn5MqM0nsMCxP2+xZ7
 cDtTvyXm9Q7aUy80zdkir0wTVw==
X-Google-Smtp-Source: ABdhPJzl0zTieAnuV9v47WlPCCV7JCVLsZk2eL7iGtWbkEmCreXcrvH8CbII+7YdcNbz/Dv01II60g==
X-Received: by 2002:adf:f50b:: with SMTP id q11mr17467887wro.306.1632296072458; 
 Wed, 22 Sep 2021 00:34:32 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id q7sm1311198wru.56.2021.09.22.00.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 00:34:32 -0700 (PDT)
Date: Wed, 22 Sep 2021 08:34:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, stable@vger.kernel.org,
 Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [RESEND][PATCH v2] video: backlight: Drop maximum brightness
 override for brightness zero
Message-ID: <YUrchlbucoa+znSl@google.com>
References: <20210921173506.19675-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210921173506.19675-1-marex@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Sep 2021, Marek Vasut wrote:

> The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
> in backlight.c") says that gpio-backlight uses brightness as power state.
> This has been fixed since in ec665b756e6f7 ("backlight: gpio-backlight:
> Correct initial power state handling") and other backlight drivers do not
> require this workaround. Drop the workaround.
> 
> This fixes the case where e.g. pwm-backlight can perfectly well be set to
> brightness 0 on boot in DT, which without this patch leads to the display
> brightness to be max instead of off.
> 
> Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: <stable@vger.kernel.org> # 5.4+
> Cc: <stable@vger.kernel.org> # 4.19.x: ec665b756e6f7: backlight: gpio-backlight: Correct initial power state handling
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Thierry Reding <treding@nvidia.com>
> ---
> V2: Add AB/RB, CC stable
> ---
>  drivers/video/backlight/backlight.c | 6 ------
>  1 file changed, 6 deletions(-)

Applied with some changes to the sign-off block, thanks.

> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 537fe1b376ad7..fc990e576340b 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -688,12 +688,6 @@ static struct backlight_device *of_find_backlight(struct device *dev)
>  			of_node_put(np);
>  			if (!bd)
>  				return ERR_PTR(-EPROBE_DEFER);
> -			/*
> -			 * Note: gpio_backlight uses brightness as
> -			 * power state during probe
> -			 */
> -			if (!bd->props.brightness)
> -				bd->props.brightness = bd->props.max_brightness;
>  		}
>  	}
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
