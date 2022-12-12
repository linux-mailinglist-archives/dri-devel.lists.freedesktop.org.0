Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CED64B206
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 10:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2623110E2EC;
	Tue, 13 Dec 2022 09:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD6E10E289;
 Mon, 12 Dec 2022 19:26:01 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id f24so435460vkl.9;
 Mon, 12 Dec 2022 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+IspbwnuJ8ErED8Om/cwo+w+s/c5DgTSdlOlBKX81g=;
 b=bcH85szMTuF+R9+qTKzsygNY0IVyHHWPk17xO0SUgXNcXD/XRK4cdx39nnnSpkZzqP
 zqPgbWeRCmSR0EYyYOjDAGmcftL9PL93yhIBoVJDn91hJKrCNp8SUv5LhsDDy/6NnT/K
 kmegf8JHQv2aojVBIfjc8V6Obog7RazuiB6mJorGM3fwyt85FWp4PfQN/fyenZYcR2j1
 e8ISWXvy1K3nhgK3lvt+hQfiFp3rrj0QgkHisf5dtwLNo5NcttRkHu3HHMiwI66MVBU5
 RCzjm5CDLSvBXtoM3eH9wjDDiG9G7VKN0jrRnY+T8nKcnyTfVEGy/kxRngIO4QKYOEPE
 tCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+IspbwnuJ8ErED8Om/cwo+w+s/c5DgTSdlOlBKX81g=;
 b=cog/FRVNyNzrEtUw93LcsdaLMKndL9rPxfoLCMY6qAnLComsmDDl2kiZzQtJsGhOPX
 l6g0gufwK0xQRZ03kDPEf7saxgI5VPnJ2ktqSKjcQ6DzdZvWEke8yQGV1EKoHVQBQa6m
 QwFrt5waZArzNndROFNPwN/W506Ls6wbxf2eOUbVa4nnBCzHwFxWiXKF+hgfiiHIWaVH
 uOvTmrboQ0MizQpyhikww7Sv95/ALQIoNCW/7vARS6KCZldGLuKZAvncXaqqBKBeFpKx
 cNgRkAeAjPiPd7c5bmkjMJJfEyxEbEmtIs49sJ/2mxA/NaRDsn5rUg66zKpKKL+pMfBI
 Lc2Q==
X-Gm-Message-State: ANoB5plmTOSvuhMqfcWmU6mfTCOFc+oYCbgGwwz2+1nyl2Cr1mlOQnBB
 axUpXUJdC43XGCp+mGoiEjRxyxQFnEO9U/LeOA0=
X-Google-Smtp-Source: AA0mqf6xPjsBnfureXx4g2aRO1Y5Gwq2qDk8nBiV8FT/a1vDUTO1pd9UvPLwAW/YokMlFuF+0oK6MxVZ8v7LcAEdaV8=
X-Received: by 2002:a1f:bfc7:0:b0:3bd:e0b8:e350 with SMTP id
 p190-20020a1fbfc7000000b003bde0b8e350mr6611968vkf.25.1670873160767; Mon, 12
 Dec 2022 11:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20221212061401.766122-1-tegongkang@gmail.com>
In-Reply-To: <20221212061401.766122-1-tegongkang@gmail.com>
From: Kang Minchul <tegongkang@gmail.com>
Date: Tue, 13 Dec 2022 04:25:49 +0900
Message-ID: <CA+uqrQBQ2R_5b3BWTa253=HabCxp3qord9h0GpXWHfhKcQa8zQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: Remove redundant dev_err()
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 13 Dec 2022 09:12:39 +0000
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2022=EB=85=84 12=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 3:14, =
Kang Minchul <tegongkang@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Function dev_err() is redundant because platform_get_irq()
> already prints an error.
>
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> ---
> Changes in v2:
>   - Removed unnecessary braces.
>
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index a31eeff2b297..6dbe0c45b695 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1770,10 +1770,8 @@ static int etnaviv_gpu_platform_probe(struct platf=
orm_device *pdev)
>
>         /* Get Interrupt: */
>         gpu->irq =3D platform_get_irq(pdev, 0);
> -       if (gpu->irq < 0) {
> -               dev_err(dev, "failed to get irq: %d\n", gpu->irq);
> +       if (gpu->irq < 0)
>                 return gpu->irq;
> -       }
>
>         err =3D devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
>                                dev_name(gpu->dev), gpu);
> --
> 2.34.1
>

I guess problem dealt with by this patch have already been resolved in the =
past.
I think I worked on the wrong branch.

Please ignore this patch.
Sorry for your inconvenience.

Regards,
Kang Minchul
