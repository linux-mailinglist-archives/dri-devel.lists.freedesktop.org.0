Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63556914E2E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AAC10E42B;
	Mon, 24 Jun 2024 13:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dfI5OQLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AE610E442;
 Mon, 24 Jun 2024 13:16:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2c7da220252so3439611a91.1; 
 Mon, 24 Jun 2024 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235014; x=1719839814; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sfbufNzdBbDxzBjkJGReG4CqSlZw8qWyj5Wd5bsu10w=;
 b=dfI5OQLQ3XhrUdQafPo0OhuRxhUcFfLfl0SGR6XzS2vA7bid3hr+r3NxeEPzQcjrcD
 Ff6P2YwlVQvk1EWxXQZtqL76Y8xvo07948jsELthXPFhZtLR9zpKkJJix1vW03md3MZZ
 yI7T7Sfhzwj2j0JKSX3+5FbtYDofFsFUrY6O45TuUJ8FHPZCzlD8kiyhlDCnAsZjip/G
 C4L1Cr9CMJlzq2r8P8ZdBpgu1nl3Jd5rSqnQxltzCbGlQT5Pw0tqs0y1ZqYGmxcWfnbM
 rfD8pLtF9pLyswWMCIoSzh3Os3JS76sVNXY7wn2dCCo0TkDxCO3dR6gNdPxDg87Cfhve
 MpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235014; x=1719839814;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sfbufNzdBbDxzBjkJGReG4CqSlZw8qWyj5Wd5bsu10w=;
 b=Kz8urHXAvNiVwbO7nJQXNzk+LplAjg5/+D0KR+EP2yUbn24RD9hQCFwlRwrjF8h2QK
 QZqq54aX6V4te6ME6p2vaKYu56oVoNmzSsxqsLdmjfvoNebxtaCIpZRGqTfFIfOsOyC3
 e0VJHu4zp8jz/SOeoHDjrPkcE8QExBRHjxlymYFeZMvAYNZLdfffxInGNPiE/LE7FHt0
 y7On5AjuQRqHZmsnb4X7jMZrizi4h4m6OqqUGPHoa56jmqB+/cPIeTlXfIj3TTknRPCN
 5I83iMgVq4NT0H+RU1Q/k6OZRx2MyPB/nw0+emqRL15rIdhcf9N3OACwq87M5cFi4KhM
 sjVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpqkvsw3NPebinU2/7TsDR/FmXD8pc7fxfC2cwNfBG4+EOw1wbXbtImqTP0I25Jcxdk/lSTe99PfGM89+dVyG6oDA42D07rxDJ9kk0758I
X-Gm-Message-State: AOJu0YycH9t3CWt5b2saPaZ8lR46IH5vctzODVDrE1HRCKu8AbEsGOao
 U7KZSTyjF64HXLeCP1tvkzVeEJMxjblgqyHhm3jNXQkMQd9q/e0FLGjvD5zrDbOPJ6rUAW4g5GF
 fcrGt15f+f3WRDzMIsgGQgAdtn6yIxDVd
X-Google-Smtp-Source: AGHT+IHDCOodzO9SVlg0J+WDXeWe38j1dzh8Cd2p8eo7PnR3i4YNltS7z92yq7TX5uV8TbTpDWfVTVz4vyMO5CCX3DA=
X-Received: by 2002:a17:90a:4bce:b0:2c8:7573:d0ba with SMTP id
 98e67ed59e1d1-2c87573d6c7mr2777796a91.17.1719235014378; Mon, 24 Jun 2024
 06:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240621171106.411596-1-l.stach@pengutronix.de>
In-Reply-To: <20240621171106.411596-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 24 Jun 2024 15:16:42 +0200
Message-ID: <CAH9NwWfOJ0Bv0z1Yj9peXU_kVhsypTMnS0+6heaWsH=3CX55Bg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: fix DMA direction handling for cached RW
 buffers
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> The dma sync operation needs to be done with DMA_BIDIRECTIONAL when
> the BO is prepared for both read and write operations.
>
> Fixes: a8c21a5451d8 ("drm/etnaviv: add initial etnaviv DRM driver")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> v2: switch conditions to be exact matches
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 71a6d2b1c80f..5c0c9d4e3be1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -355,9 +355,11 @@ static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>
>  static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
>  {
> -       if (op & ETNA_PREP_READ)
> +       op &= ETNA_PREP_READ | ETNA_PREP_WRITE;
> +
> +       if (op == ETNA_PREP_READ)
>                 return DMA_FROM_DEVICE;
> -       else if (op & ETNA_PREP_WRITE)
> +       else if (op == ETNA_PREP_WRITE)
>                 return DMA_TO_DEVICE;
>         else
>                 return DMA_BIDIRECTIONAL;
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
