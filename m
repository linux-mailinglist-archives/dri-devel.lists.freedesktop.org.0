Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242764958E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 19:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDF210E152;
	Sun, 11 Dec 2022 18:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43AA10E150;
 Sun, 11 Dec 2022 18:18:09 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id o12so9720349pjo.4;
 Sun, 11 Dec 2022 10:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DJWMq3v8mXb4JS75SBa9sdQFtIcG130S3cGcKyzpabI=;
 b=VrMaPTLDjlE25NNedRFoqUUwGARQLKkm+rJeysHbF8/tjNrsjBQ3IS/2LecONLWMrI
 lq+TOAiwLBAtBg9INXbqkJraEscsJo3PWOWkCZauLxTnE1YW2358/b644Ywey0gGF3Dw
 y9tD+Ulpv2HZ53H+GcS6Mpb2XbDrHtDmxLL2GyXypVZwKK+gUaxRTw1s2rcu6MwKmjx9
 iN5X/OWqn+MKJO1+IF11e+038nLkraFMVCF0Z3FShD1SfOQsSWegSYz1DkI8qNqsHzIL
 4ozX3z4IzeKQ4uSDLd89qauTHGTKyC8sH8gMMxNLXvgiIgJCOhA8UQnG+ABeF/RDwcJP
 Nzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJWMq3v8mXb4JS75SBa9sdQFtIcG130S3cGcKyzpabI=;
 b=lvqG0WLNQ4k200sA5VZrrgd2n+wXW4e3TxAM+dxAJRnThmg6GUKqISoKcmnhRCRPvS
 mUhjd9Z5SInn/Fl/hf5j0K2ir99GtFlu2GP0Zd6nVhHilXw9psex4wABtOKBYkVgFvIT
 zRCq+j682sFs5OEwlO7l8VRNQFxP1OvtHldubaPz2GaIncEqk4Ao0TjbrEoOFS78KVXX
 WGufOPxZl7aENBj+gajjdjQm5VDtRXl2Xeg8TlYAlViOIIau04PVoH6bf8Sx7KGcNj2a
 4Zl7pjWGCaeLo49PeTMWMcqBsSyckmTlLi6rjX9PF/Mda2VbF7+5KObglNu8zk6owgIy
 npow==
X-Gm-Message-State: ANoB5pkkzNZNCb641aUkzVseVdQ8rQmR5TF6YqMnqwFDv/1fTQpFijlu
 2GZ9xCsI8obAJPU9MA0o30tQfUlERLe10ZLkERU=
X-Google-Smtp-Source: AA0mqf5wv7vY/AxMCwT/Lp5m5UhGnZT0Gi692A3tOO3LkGtPolhU92xN9ymqE92AsHfyjusIWhgFD7dImHo81Qs0QI0=
X-Received: by 2002:a17:902:b40b:b0:188:75bb:36d4 with SMTP id
 x11-20020a170902b40b00b0018875bb36d4mr80760729plr.55.1670782689179; Sun, 11
 Dec 2022 10:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20221211140905.752805-1-tegongkang@gmail.com>
In-Reply-To: <20221211140905.752805-1-tegongkang@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Dec 2022 15:17:51 -0300
Message-ID: <CAOMZO5BoiKYJKhgQNW+=n-7KpEr_L8oj1zS2OcJR-B-NA0XqzA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Remove redundant dev_err()
To: Kang Minchul <tegongkang@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 11, 2022 at 3:02 PM Kang Minchul <tegongkang@gmail.com> wrote:
>
> Function dev_err() is redundant because platform_get_irq()
> already prints an error.
>
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index a31eeff2b297..097fa9034ee8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1771,7 +1771,6 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>         /* Get Interrupt: */
>         gpu->irq = platform_get_irq(pdev, 0);
>         if (gpu->irq < 0) {
> -               dev_err(dev, "failed to get irq: %d\n", gpu->irq);
>                 return gpu->irq;
>         }

If the dev_err() line is removed, then the { and } should be removed as well.
