Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378937B0219
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5564410E361;
	Wed, 27 Sep 2023 10:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A128C10E361
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 10:43:50 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso1376873266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695811429; x=1696416229; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozgRDTC+2UK6mD107LVNtKBM9DQ8506FxPydFp9FLHU=;
 b=FyORu4Dl3OZxPOlKNUq+Ys4ptNkNdWra+DhN+2YuRuxVhb1Bfi8q7+lfOkZEeQS6tR
 Hr3lnigPTjvuUeL3KpYMbeRvMF3+tcRXaWLD7UWl6uJwzgQi/tv6WxrXUMpU2Zi4VGgD
 xhNEO94qZTiI6K6hn5iD1Bw4wmIoCkDLHr5U7NH3E+2ulQaCHR8QwzL54ABhwiuT5NOK
 WgTDkLnrc8vhmAXkkopHLE8seoiHymFbLhZ7XCkCFN33Kzl0YZbDzOig74c1ef+NTQED
 xC5kgcR8c/ymUveSH9jy855T5nHM5kXDIDFkKJMvzOBfmb5/D8/wrToGaeqoUHNUkYHf
 QJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695811429; x=1696416229;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ozgRDTC+2UK6mD107LVNtKBM9DQ8506FxPydFp9FLHU=;
 b=LV+mYKGZB/8/ARvpCnEXtaqU2lxRKBOmwB06uvIhQgovK0PNVuBAfeYpw+ICjzQM6J
 of8hhaoVvttccl2OsJGDOxNyj5hcfl6mMOULoMw7sPoFcddoxNsCtdWwMlW2z4/VLQ+j
 1O2o0cULqpakbf5PHTKIMQISgrZkL9e9TT6fbLHNR5nrESQcYwN5iQtkP7kjPIBBUZ/c
 +QhQNW4y5fqZ0y2jOluXoPzqs7ehLW6cNidi2+TBpUeE1IRZoSVNVS1ZxHecfAVEBABU
 ERu4TC3zRGCNdz5CdVB7KFDltZ2Xk1PGOXmNp2jtRtHxRWj8Rjh0zWuYa6rMYcYTNY/u
 3cJA==
X-Gm-Message-State: AOJu0Yx8L7Y4LcNlL69mmwJxptmZtxxqYSqcFH2bOe6DBsBT63c/pPP9
 oamUtB83kVtkaK3vTsQn7QI=
X-Google-Smtp-Source: AGHT+IFrfTl0CPJDAs5rBjmyIwqBNlUP129i/O3iWILp8f0G9qcw0Tg7SqobzwuGvCR0qdEB+F9qWg==
X-Received: by 2002:a17:906:d41:b0:9ae:4843:66ee with SMTP id
 r1-20020a1709060d4100b009ae484366eemr1400373ejh.36.1695811428590; 
 Wed, 27 Sep 2023 03:43:48 -0700 (PDT)
Received: from localhost (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 lw3-20020a170906bcc300b009ade1a4f795sm9013116ejb.168.2023.09.27.03.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 03:43:48 -0700 (PDT)
Date: Wed, 27 Sep 2023 12:43:46 +0200
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/gma500: refactor deprecated strncpy
Message-ID: <fmvdws32xrjj3a3vqwcghnniojcglrpzs4mk5cw67vog6vlwta@zmoz6bv2i5iw>
Mail-Followup-To: Justin Stitt <justinstitt@google.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230919-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v2-1-9ebe6983b4cb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v2-1-9ebe6983b4cb@google.com>
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
Cc: linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 04:41:16AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> Since `chan->base.name` is expected to be NUL-terminated, a suitable
> replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer without also unnecessarily
> NUL-padding (since `chan` is kzalloc'd already).
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Applied to drm-misc-next.

Thanks
Patrik

> ---
> Changes in v2:
> - use sizeof() instead of I2C_NAME_SIZE (thanks Kees, Patrik)
> - Link to v1: https://lore.kernel.org/r/20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v1-1-0a53a076ce20@google.com
> ---
>  drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> index 06b5b2d70d48..939c53fd09e8 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> @@ -141,7 +141,7 @@ struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev)
>  
>  	chan->drm_dev = dev;
>  	chan->reg = dev_priv->lpc_gpio_base;
> -	strncpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
> +	strscpy(chan->base.name, "gma500 LPC",  sizeof(chan->base.name));
>  	chan->base.owner = THIS_MODULE;
>  	chan->base.algo_data = &chan->algo;
>  	chan->base.dev.parent = dev->dev;
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-a53c6d8bd62f
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
