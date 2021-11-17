Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1F45425A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5426E24D;
	Wed, 17 Nov 2021 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7854389A35
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 02:28:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bu18so3026707lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 18:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jl+AtN/+Mu/whgH79LA7r4Af2Mt1jJsmU9jNqLNR8Ec=;
 b=Dd+GTwzJyyfFaNufM7HI7IRxF+fJXM6/+7Z/W2JwVE3zmE8dPGflxCSimLkvljXnvr
 h2VSVVOY23M5ewWG7VMQJ4i1/XIEm6maaJ0mFJJPfpyVXznkpRk/gz/U8bB5IbAVr1qq
 9egxj2rieE4HN52GTEGwHJa11WmD8qoxJ3QK1Sig7SygOrGMoDjaGF6qW73xMRpo9OEt
 MwxErbSiwKctiuDkmj6+nUo7oIDqK6N5ZfmhgVTnKciRcw7X1NrO1Q3+WL+nnlKHUJsb
 hlP6BK9NlZsL/05+Ms3SRoJgrMgbq4vIXQVQWYnslXVoqtE8QE3yPww7cxZh18S6BQOQ
 ET3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jl+AtN/+Mu/whgH79LA7r4Af2Mt1jJsmU9jNqLNR8Ec=;
 b=bZTcvLesdlsCnDQoDEQ1fEfJYAL9tn7uMioJ1qzs7v9bu2ZIlbmUAGDhBaXThbod60
 2sRocTV8ZB8ovtFRyBywQ3d3S3aBOI9Rfvqz1+3NsvyUBRWbKaHff22YgFRZ7rIAo72C
 MghtLXjXd8eVI9w512uQpNjQLsiPaJFWlV+F58P9nKiyZKX/6sZEv83fxiL3tfKFKkE9
 hQFi20PXoQ0UUUjsuhwY8hfmArlD/ISEfBj5Kdf9hy3PnmCdqb7Js9HsX2Cs7QPNAZiB
 K4jyJrYhJOSr1/djhxOHn8DeXIxhnFpc+IYw1up+RrJfXtgXHXTZnKmarKHAz6OycGDI
 /1RA==
X-Gm-Message-State: AOAM532nrclx7umdCFOm/Xgn9Aj8Ymsmq6c1Ha3Teh46YqeAFQIEp859
 y4I2L2gtcC+ICxLekDFMFgCBL0ZapMdIngGxSkyhZw==
X-Google-Smtp-Source: ABdhPJw8HVPX1dGZl0rl/MHYsQZvuSM4h3tFpAsNpmwJbd8T00RckFLgCRAmq+WwuDgIU5IN9yO8csm2lf3OiHVnWhs=
X-Received: by 2002:a05:6512:1289:: with SMTP id
 u9mr11740314lfs.273.1637116132467; 
 Tue, 16 Nov 2021 18:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117010145.297253-1-joel@jms.id.au>
In-Reply-To: <20211117010145.297253-1-joel@jms.id.au>
From: Oskar Senft <osk@google.com>
Date: Tue, 16 Nov 2021 21:28:36 -0500
Message-ID: <CABoTLcS=8vpqystmz0yv=wwYvzZaSZrvYeiHH8hpA8=P9HDoBA@mail.gmail.com>
Subject: Re: [PATCH] drm/aspeed: Fix vga_pw sysfs output
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 17 Nov 2021 08:08:06 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrew Jeffery <andrew@aj.id.au>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 8:02 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Before the drm driver had support for this file there was a driver that
> exposed the contents of the vga password register to userspace. It would
> present the entire register instead of interpreting it.
>
> The drm implementation chose to mask of the lower bit, without explaining
> why. This breaks the existing userspace, which is looking for 0xa8 in
> the lower byte.
>
> Change our implementation to expose the entire register.
>
> Fixes: 696029eb36c0 ("drm/aspeed: Add sysfs for output settings")
> Reported-by: Oskar Senft <osk@google.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index b53fee6f1c17..65f172807a0d 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -291,7 +291,7 @@ vga_pw_show(struct device *dev, struct device_attribute *attr, char *buf)
>         if (rc)
>                 return rc;
>
> -       return sprintf(buf, "%u\n", reg & 1);
> +       return sprintf(buf, "%u\n", reg);
>  }
>  static DEVICE_ATTR_RO(vga_pw);
>
> --
> 2.33.0
>

Tested-by: Oskar Senft <osk@google.com>
