Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27D6605D5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5338C10E89E;
	Fri,  6 Jan 2023 17:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C9410E89E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:43:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id ay40so1570623wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91SF8VEv5OWfr7BVQVJeS0qUaBJRLWmE1paTtWSlkNk=;
 b=F5S5LtEkn6UpgyK4ZdRqG7PREzFRkWFR9ntEYFZEYkYrWO19F3t1G1UkA1mfzFV3+1
 ZNHtbDmVCdb8JLPvY4KgNQkYtM/vKK/FiseLqJnecrhGdyYNUkr9hR6elGwZUv/rOVDr
 uZGA75rjYhoa7IAsBRIa4gB/l5/iceCceQUNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91SF8VEv5OWfr7BVQVJeS0qUaBJRLWmE1paTtWSlkNk=;
 b=Dpy5hX0N89+1haWUzzbZP0b4NlB/G7lhqHN8MiokxNvta6U/0xHylrA6i5CQkQbTUL
 j5wvkJbenu9Cd3wH3dauU+23Qvvivd8rNC2IZfsbxpIrvmCCMsks5bUnk/Q89sqlLZCM
 W98TvrrAO0qamAsCSM6MqwQio1VMIAlv3e13JgLCp9jLFECXdK6MOAetZryQctD+yFn5
 vnKbkYcGghEtXsfstQlU6hL9Z51OwEgrW00oXbytCsbAfY6LzE8QEHVooQlzNIpwXYMj
 gUO9t1qKOmdq/DB0lCKapyAewxaojJn3wyXnT+iPG/Or5r/fJGuSqC9MbXSG15vcrMCM
 ftug==
X-Gm-Message-State: AFqh2kqFwvReX/tB93syImklW5gwmjozI0yLstD7NLE7xS7GjataND6/
 zDAIMsCHKPbMfCAsg585Jl6N0w==
X-Google-Smtp-Source: AMrXdXtSD1W10kYYcsrjXwJcPhNZEFjWcjAy7xGKIyGWPq4m1U5ZvRhIKWL3HO3EVrZrvCXXngfYEA==
X-Received: by 2002:a05:600c:1d03:b0:3d3:4aa6:4fe6 with SMTP id
 l3-20020a05600c1d0300b003d34aa64fe6mr38928152wms.3.1673027019752; 
 Fri, 06 Jan 2023 09:43:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm7543346wmo.24.2023.01.06.09.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:43:38 -0800 (PST)
Date: Fri, 6 Jan 2023 18:43:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 1/4] backlight: aat2870: Use backlight helper
Message-ID: <Y7hdyPAKBYv+gAzf@phenom.ffwll.local>
Mail-Followup-To: Stephen Kitt <steve@sk2.org>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
References: <20230106164856.1453819-2-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-2-steve@sk2.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:48:52PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Lee/Daniel, will you pick these up, or should I smash them all into
drm-misc-next for 6.3?

Stephen, I see to be missing 3/4 here, but maybe it'll show up.
-Daniel

> ---
>  drivers/video/backlight/aat2870_bl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
> index a7af9adafad6..1cbb303e9c88 100644
> --- a/drivers/video/backlight/aat2870_bl.c
> +++ b/drivers/video/backlight/aat2870_bl.c
> @@ -59,7 +59,7 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
>  	struct aat2870_bl_driver_data *aat2870_bl = bl_get_data(bd);
>  	struct aat2870_data *aat2870 =
>  			dev_get_drvdata(aat2870_bl->pdev->dev.parent);
> -	int brightness = bd->props.brightness;
> +	int brightness = backlight_get_brightness(bd);
>  	int ret;
>  
>  	if ((brightness < 0) || (bd->props.max_brightness < brightness)) {
> @@ -70,11 +70,6 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
>  	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
>  		 bd->props.brightness, bd->props.power, bd->props.state);
>  
> -	if ((bd->props.power != FB_BLANK_UNBLANK) ||
> -			(bd->props.state & BL_CORE_FBBLANK) ||
> -			(bd->props.state & BL_CORE_SUSPENDED))
> -		brightness = 0;
> -
>  	ret = aat2870->write(aat2870, AAT2870_BLM,
>  			     (u8)aat2870_brightness(aat2870_bl, brightness));
>  	if (ret < 0)
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
