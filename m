Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E443439D57A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 08:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FAC6E220;
	Mon,  7 Jun 2021 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EA26E220;
 Mon,  7 Jun 2021 06:57:43 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id f15so8341573vsq.12;
 Sun, 06 Jun 2021 23:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+b/qgU/xjmCf3iqp6d/+T4y8Bk4XAmWjEdEG1RU2s3Y=;
 b=PUB8GEOePhCKMrTIQjnRhUavBGDCOHNwPYOOYDJ3uTxHCiytrs2t7Lkdwb/+7EBAvU
 0YbLmoZURIVk5PInquK3LaBhErEqxF1y9xYJ/ZJtVsabRMvbb2L8VqgNWDXuVyKEUEc9
 4cdTeyrJXp4CTrEFZMF6wpMItN6PMRWTBOhkw8fepteFLLI+DkumAROqQeRupWxyhklv
 1ccmee0eonbcRpDB/1DH5Ttq6YOMKGPL8cuqN2nlQNn7mqPbxF4rl80FlYb3bOScrOOP
 +fnUoZczs6BYFEiXBO7uNDdwZaXykRhydiT/YGI10wY+MyTAp+Xr7SELHKtXtk5Seu+v
 Zf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+b/qgU/xjmCf3iqp6d/+T4y8Bk4XAmWjEdEG1RU2s3Y=;
 b=eB8/e0bLirpV28yLX4llDK+M3NFmmiAxwURBLEXaIsXivJemmjopCNvn32BNpnLmo5
 /QmTnGTgL3kqQENED0IfBkPnGbpKMP4B61gJr11nI4iyTfr4XOmJRyeZW8kpBSTaKyiP
 7UQ9GdkgjeyAgUtb3SR1ZPaCB0GwPUDi9FbzGfU28XROV78fSoGBdzHNz5RZoG2XQu81
 ry8f2d9eSOPou0ocpOdMg5CFOm3mdl6U7Fxa9X5noVQwByNOMAil3vUNnVhtpZqs7N4u
 PKC7lygT8naCy5GrgfBOYjHPK7LEc+4zXn3Tatmy7oS3jU/+FRKxeeU7bpPYUSu9NTe5
 rinw==
X-Gm-Message-State: AOAM5313zseOuv7Vrs64+8gtn8kY8mgcoLqpbDBm7vC0wUVGQVVY2/f3
 Hd24nskldlbPX21+YJd8vjcQZPFXlwcM+PfgjHM=
X-Google-Smtp-Source: ABdhPJy70YBG8kZHmxKIbBvCjRC0dhSUQf86Cc7B3nOnbl3qJRe/PcR+aPcxCSGHjS7txoOd86P45V3nzVWo0GeH/G8=
X-Received: by 2002:a67:ed81:: with SMTP id d1mr7789915vsp.29.1623049062495;
 Sun, 06 Jun 2021 23:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210605122415.8621-1-bernard@vivo.com>
In-Reply-To: <20210605122415.8621-1-bernard@vivo.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 7 Jun 2021 08:57:37 +0200
Message-ID: <CAH9NwWcTDV70Nb_e_rs9egsQqmAo91_HM+DoO_woC_ZqnHCVNw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: remove no need NULL check
To: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
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
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sa., 5. Juni 2021 um 14:24 Uhr schrieb Bernard Zhao <bernard@vivo.com>:
>
> NULL check before kvfree functions is not needed.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index d05c35994579..bd0d66ebf314 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -612,14 +612,10 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  err_submit_cmds:
>         if (ret && (out_fence_fd >= 0))
>                 put_unused_fd(out_fence_fd);
> -       if (stream)
> -               kvfree(stream);
> -       if (bos)
> -               kvfree(bos);
> -       if (relocs)
> -               kvfree(relocs);
> -       if (pmrs)
> -               kvfree(pmrs);
> +       kvfree(stream);
> +       kvfree(bos);
> +       kvfree(relocs);
> +       kvfree(pmrs);
>
>         return ret;
>  }
> --
> 2.31.0
>

Thanks for the patch, but there is an other one queued up in
etnaviv/next that fixes the same issue:
https://git.pengutronix.de/cgit/lst/linux/commit/?h=etnaviv/next&id=bdf622e0fade2cec72c948c708763378b656c01d

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
