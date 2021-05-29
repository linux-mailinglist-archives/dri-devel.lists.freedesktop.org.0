Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A08394E33
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 23:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E194B6E7E2;
	Sat, 29 May 2021 21:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3626E7E2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 21:10:32 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r11so8830409edt.13
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 14:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZzwSf+W0KnbVqvf+e4ERYkxn36JMw2xmcdRq2kgEKFI=;
 b=aM0QE7fQgiJFV+ir7iO0w+mf0HCxxh09wuwiawqfD0699liU8r3pgTDY0t/4GjLJDM
 IL8RttHKj70lJh7e1wE5YDTKlL3hs31rrcIArKwIO59zD7Geefpu9fDbavwenKKWccw8
 m2N2c3yB1jz0AgmjFP5UdsnDv3LWZhL1ElreoDpqwuomxgvy7/0ZzhmZvXywq4SnWipI
 zF/JnMTn391hwNNPLxn1cTAmgUqfCSla1TZuT+8TfMKYnXdps3lMnrgdZHNFbtP7mTl1
 NHlH8waB5gzntpSGFe4mZGDwM717KzjpYxjUW52do2/5GatJOk8r9IfMJe64bXaW4R9P
 AWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZzwSf+W0KnbVqvf+e4ERYkxn36JMw2xmcdRq2kgEKFI=;
 b=M1uxPXDGKuTs1QaR6ciAXp2n6hjRU+GjnbF2/fQTq4mOHBfLOF7zTl0Z/EDwUTinsw
 xv6XO6hNbU6NXo8U0Mu8JSxANdgbvQgrGAUMc83xOAU0FOD2LhvB/QN2Mz5WeH/H4wxS
 fv29HlLPWPLvJvhPif46WG6MmmAupG+4U7z5xqVHEsZudI8QjU9R1rOpgHYBquFxHYJM
 zSuyqc1knacuJVA3zFhYW6lhnm6oqFLDyRzzRtbtBecxDmSyCDn1LF3LWRnWPlS3OOc2
 0DMhWMzG9rmyf2luS8HqsQsgHcG9+ugfwdD4Cl7u6kySTFZ71zN1bgMq0TlVXFv5MqCx
 aBOQ==
X-Gm-Message-State: AOAM5318QwfkVJD+thHiZgsW+uK3UWolPYL9E1GAzhVLzhDG5w6fp3gO
 KtBlUVezL9aWQu8masv2vxsh/Uz8IzOOECjCny4=
X-Google-Smtp-Source: ABdhPJwo/8MQ7+z5l/NShGtxVB8lNZWhY3ZzIDcHCoz66TecY+IZ2kGEpTvKP3FN3zbFoY9wbEsBEnx6nsxuklLiNOA=
X-Received: by 2002:a05:6402:3495:: with SMTP id
 v21mr11168336edc.185.1622322631545; 
 Sat, 29 May 2021 14:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002759.468964-1-linus.walleij@linaro.org>
In-Reply-To: <20210529002759.468964-1-linus.walleij@linaro.org>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Sat, 29 May 2021 23:10:20 +0200
Message-ID: <CABkfQAHcuee=1beNsP-EKHS7jjO02NcMkF2gNt0Lapppn1_s=A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt8912b: Drop unused includes
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Adren Grassein <adrien.grassein@gmail.com>

Le sam. 29 mai 2021 =C3=A0 02:30, Linus Walleij <linus.walleij@linaro.org> =
a =C3=A9crit :
>
> The Lontium bridge is including legacy header files for GPIO
> but not using them. Delete the includes.
>
> Cc: Adrien Grassein <adrien.grassein@gmail.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 443f1b47e031..4ff091ecd8b4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -7,8 +7,6 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> -#include <linux/gpio.h>
> -#include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>
>  #include <drm/drm_probe_helper.h>
> --
> 2.31.1
>
