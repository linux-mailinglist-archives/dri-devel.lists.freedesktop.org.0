Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475EE5ABEC7
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 13:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77E110E9BD;
	Sat,  3 Sep 2022 11:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEAD10E9BC;
 Sat,  3 Sep 2022 11:38:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id og21so8473479ejc.2;
 Sat, 03 Sep 2022 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7sifeJe/nina4b7artAm2vJ+uNBpT+HfU/uGDI89CFE=;
 b=le4kQPIIoorc+ayH0EI4N5WdSIMUVMn+EhHRydhRKVz9B8SwZbs16eIy6GzDQYDvSE
 6Iroo3xZjnN22eFyC+t1mRoOplfzIp1TqJrN9pgCKM5T5llonKG7rhgFx2nsbRP/FtmR
 Qn/KNIIE/B8sCjm3/vxXmWWsEzbiqYYzpW1kIfk/LiT5sO6dPh/+i3VAtzLEbN58FmAO
 QniPvNuNpk3UxrSI4YlamJuQuybLI4dC5M/hNBTHhO+9K/gX9nIDquWPMSVf1MviwEFQ
 elkOB2PMZZFAbzGAMO4hA2v79Hmke5ru1Tcp+q5jEzjo8b7Q8dH45Ufw51N68DsqKz+h
 zLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7sifeJe/nina4b7artAm2vJ+uNBpT+HfU/uGDI89CFE=;
 b=Gm45QwRPXMbB93zKgig3EjuJjtkhKuNrMAbC5tbsyvrNSF534AKrkH0BK4zKu4PIHQ
 Yhx53qQWxpjo96mw3um5ctai7wokXTy4uH8NK8zkzWysTm/qHBJ/DFbnScJL1YxRzeeU
 FpqLDhpZz2k0M9pNGKEeA7mCm+d5xLDt38xbYNcicdV2GJPkQlY5EchAnCiOQ5WFmKmh
 IiLkkhCYH4yl2UgPLxTQ3+1rkKJa9Awf+Kvp9TlXNpk2hRRaBUlCl0/rmAHwnKGQswp1
 l1hQFWt+vW5T8ZZzcV7v/AcVB/2LQTXxoyevzuCB2bxtGGRZmDyXG3M/r6oprR07K+XV
 qsvw==
X-Gm-Message-State: ACgBeo0JLKdAAtifBiKGTI+JBI/mcvYv/Sz12pPJlPJiRhTWXMMKMsXY
 LDOv7WKCAaqCM1KWfGM72uz5fYqXX+ZTtC5826g=
X-Google-Smtp-Source: AA6agR4Qu6tKjeOcGayd2pK+QCPz8usLy23B/6nNRXM27wjerhACc/7jS+jS/d5Feyx+7UNQFV8sxkcDtaRIBpCRFQY=
X-Received: by 2002:a17:907:2702:b0:741:5881:1054 with SMTP id
 w2-20020a170907270200b0074158811054mr22064675ejk.411.1662205128511; Sat, 03
 Sep 2022 04:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220903060558.55167-1-doug@schmorgal.com>
 <20220903060558.55167-2-doug@schmorgal.com>
In-Reply-To: <20220903060558.55167-2-doug@schmorgal.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 3 Sep 2022 13:38:37 +0200
Message-ID: <CAH9NwWf-RVQEcoe-nq6JavSqSh2v2dFLktEHHwXw4Rz4N-4r-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/etnaviv: add missing quirks for GC300
To: Doug Brown <doug@schmorgal.com>
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

>
> The GC300's features register doesn't specify that a 2D pipe is
> available, and like the GC600, its idle register reports zero bits where
> modules aren't present.
>
> Signed-off-by: Doug Brown <doug@schmorgal.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 37018bc55810..f667e7906d1f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -416,6 +416,12 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
>         if (gpu->identity.model == chipModel_GC700)
>                 gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
>
> +       /* These models/revisions don't have the 2D pipe bit */
> +       if ((gpu->identity.model == chipModel_GC500 &&
> +            gpu->identity.revision <= 2) ||
> +           gpu->identity.model == chipModel_GC300)
> +               gpu->identity.features |= chipFeatures_PIPE_2D;
> +
>         if ((gpu->identity.model == chipModel_GC500 &&
>              gpu->identity.revision < 2) ||
>             (gpu->identity.model == chipModel_GC300 &&
> @@ -449,8 +455,9 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
>                                 gpu_read(gpu, VIVS_HI_CHIP_MINOR_FEATURE_5);
>         }
>
> -       /* GC600 idle register reports zero bits where modules aren't present */
> -       if (gpu->identity.model == chipModel_GC600)
> +       /* GC600/300 idle register reports zero bits where modules aren't present */
> +       if (gpu->identity.model == chipModel_GC600 ||
> +           gpu->identity.model == chipModel_GC300)
>                 gpu->idle_mask = VIVS_HI_IDLE_STATE_TX |
>                                  VIVS_HI_IDLE_STATE_RA |
>                                  VIVS_HI_IDLE_STATE_SE |
> --
> 2.25.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
