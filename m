Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FA0342079
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 16:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505D36EA34;
	Fri, 19 Mar 2021 15:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58A56EA34
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 15:04:27 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u4so12376560ljo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7UBFkI1CX111uLLNeagBjcZUDj7ZLwK/yKKbbrE7F4=;
 b=C0YjKyPTMBZyq22wQR2Ycbof9lyp6kIEFLRu6UYQ26FWP6VkAJ6/JQBmjBKV7EWBLz
 BjhEpOYdLpOCiKvWbuMlY5LnupwEyWz7qN62FzhoAFcnZvZlPW2H6oei1qkdrS261jTe
 cTHosaAiMVD2DTGxgfntMAwuKVRCxXruO/HV1d3UJlwRw1dhtmODI/VZVebt44eoVHKr
 EHdA9BGmXBh+Yh7DNRBNpPT+mBcVTSDrrHSbnYeawGFpfI+hVGmjURrSUyP+AJJB3FNJ
 ma1mfG8gPcVpjYL8ar0A97sJPbL0hYyASgAySErAa+xcVCGPXg8f0HQpRuThvNgC3aWm
 RSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7UBFkI1CX111uLLNeagBjcZUDj7ZLwK/yKKbbrE7F4=;
 b=PXytfcXTL5r/3NizAe8aSAT/t0tW0QVmiPTGcvoEHGBmw3LG1L3oVxF+h6HEAPI2s2
 G8wrYTrbs+UBcGtpCPpHzP6WdSHdv6jxS7Gc2vxc3zvJ3Resyf6IfQb1vbPhbpiOaVws
 Llo9SH56mIWY8dUQ1he8nnt/t/Ualster/sHc7Lv3XejohUWY4aztVtcf+VcliT+oyXs
 NUbCnKX7dOL1wzY36aPj0UfWnoKTYCLYgd5B789lUyowbOHFsx9CZJyAKS+5wpoBaoMV
 RBFJe0bGUbhLW0e0mV5czeKZMpaMOjoBPkLZl+swufyIrjlsj9nDXwQGBxcpIk1DwElS
 TOog==
X-Gm-Message-State: AOAM530h6SietP6ze7N7IX0MsYQnMSTlv1ugA/knjU/tIYcSunM8QE5I
 TYZiDJO3HcUT2uJpItUyGrvmoslFYSuv0iZdIQE=
X-Google-Smtp-Source: ABdhPJwiVOIxhG/0M7C/3BZhB7apooldQHeENwszsMQq5DkPOjXNNJoqtYweesGkTbY0Y1sukcc+mai7Ig7xojmKim8=
X-Received: by 2002:a2e:b5cd:: with SMTP id g13mr1222346ljn.372.1616166265911; 
 Fri, 19 Mar 2021 08:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <1615969652-80225-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1615969652-80225-1-git-send-email-yang.lee@linux.alibaba.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 19 Mar 2021 16:04:14 +0100
Message-ID: <CAMeQTsbRo4_KfS5vpAjSUiOeL6Qn-yMfYPsWTEpmZTmgV7bfOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: use NULL instead of using plain integer as
 pointer
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 9:27 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> This fixes the following sparse warnings:
> drivers/gpu/drm/gma500/psb_drv.c:303:56: warning: Using plain integer as
> NULL pointer
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 0bcab06..c2aab62 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -303,7 +303,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>
>         ret = -ENOMEM;
>
> -       dev_priv->mmu = psb_mmu_driver_init(dev, 1, 0, 0);
> +       dev_priv->mmu = psb_mmu_driver_init(dev, 1, 0, NULL);
>         if (!dev_priv->mmu)
>                 goto out_err;
>
> --
> 1.8.3.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
