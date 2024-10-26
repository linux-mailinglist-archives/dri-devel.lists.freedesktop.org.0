Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017979B15BF
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 09:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2604E10E2CF;
	Sat, 26 Oct 2024 07:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NqWKH1V8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F1110E2CC;
 Sat, 26 Oct 2024 07:07:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7ed9c16f687so2028371a12.0; 
 Sat, 26 Oct 2024 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729926431; x=1730531231; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VSZdGt6XyxhqgKU8LT1Y+ePARVbh/MxfM7kXa2gUtZg=;
 b=NqWKH1V88BFjHhY00BYb2VczPysc+cbIgzzufNNsOo3u5f73XJuCMFDfA2vtHs9bJh
 Cyp4PVRnTjPvKVM+/Yc5TQcxSXtUgnubA5b61VcFbtW/wrKowWDU0pIvHE154Cq/ltgo
 +lMhHrLo+3OFUy+yuFR12iok/YYJsETmhYXL7FLSk7RcgesNKZ5dMpZF2e5C+a+wIj4A
 /89cByNDI+Ut2HOxRQkSQnzjuoK2qiUySwD+d6P2BL7cMuUxW2+0CA5TuE4gUiqRyum/
 ebGlBWbaIjyHvUaMxhPvxVtNhfmdSCQi5eIOkgxIIFH2F2m0Dz14HN8evFGXM4Ng2Dyx
 w2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729926431; x=1730531231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VSZdGt6XyxhqgKU8LT1Y+ePARVbh/MxfM7kXa2gUtZg=;
 b=hjuUyfWMiqFKJF6HNUVVRG7AmeyuO0RzWk6weUM3FGqwMaujwArbpPgHaNzDEPXU4l
 tXlGpA9FsZjpmLLBU9k0iZu4xRn91CHqpt4sCp3/K2c9NTA/x+WQu3MTExL/GXFKNWnD
 lUjOeYtDfB/n1o9LPfHgoWRkpAyjl6rOLSDOhn73OM8dDPtN6CPbno7gH2kgZjg7P0mK
 dS3kEMaRO3a24RtbXa02oCuVVWGb/BhyA5iyEKbiH3LkGCWaKePcJk3NAQNbc4Wh161E
 PtZOuUwvQYG4FNxMk3sBdmfjODWq+sgrICqoyfSFVa2kC0ek2CiiS0P5t6+W2b8+44KL
 3c7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY6sZ9hCvwRHcmi0YjpyWOUL87IPzfO/2FjvVA/0h5aWhHbxdnN8PHfa6kYiu7vKQ3j81gUPkdIog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAyWBOYGtMjIKW3zUlB4PNuBBSMeUYMFiYIpwiHmEbjhI3ieJW
 YXpNL9vgnxPsHwwQUG+7Jipg7AhBBcQhNlk9CrOF3u6iIwl7KysvhBD/hsVDZpDQ7qwqRhJAgbB
 7VgtlUQzLFCBdTtjy/K11wdz5roA=
X-Google-Smtp-Source: AGHT+IG4kEbB0kl+W+RUx83pzEK+/MGy6K/8bG12M4ie3exwHjFB1j5Bo6VF4mRnF6/haFlIdrrBuVkNRsrdlG/Wpyg=
X-Received: by 2002:a05:6a21:3a41:b0:1d9:22c1:1235 with SMTP id
 adf61e73a8af0-1d9a8401c39mr2665112637.22.1729926431291; Sat, 26 Oct 2024
 00:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241025151417.2475966-1-l.stach@pengutronix.de>
In-Reply-To: <20241025151417.2475966-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 26 Oct 2024 09:06:59 +0200
Message-ID: <CAH9NwWeNW3Gc9zdQQtFE1EM7Ca9fVYaRgphSC+Le9MZQOCuHCA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: always allocate 4K for kernel ringbuffers
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
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

Am Fr., 25. Okt. 2024 um 17:14 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Since the kernel ringbuffers are allocated from a larger suballocated
> area, same as the user commandbufs, they don't need to be CPU page
> sized. Allocate 4KB for the kernel ring buffers, as we never use more
> than that.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7c7f97793ddd..7b39786871b3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -848,8 +848,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>                 priv->shm_gfp_mask |= GFP_DMA32;
>
>         /* Create buffer: */
> -       ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
> -                                 PAGE_SIZE);
> +       ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer, SZ_4K);
>         if (ret) {
>                 dev_err(gpu->dev, "could not create command buffer\n");
>                 goto fail;
> --
> 2.39.5
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
