Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259895F3BC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 16:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03F510E211;
	Mon, 26 Aug 2024 14:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WUMS39pG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2347210E210;
 Mon, 26 Aug 2024 14:23:38 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2d3d662631aso3357588a91.1; 
 Mon, 26 Aug 2024 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724682217; x=1725287017; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Fz2LLvQTYlEOsUpiHug0Zo0dLswBmU+LLedYnqHt04=;
 b=WUMS39pGJnaEx++ab8Drx/LiNrFYCWajT4Cj32yTDoPnjvuaj2XWFQ2oobshGjB2H3
 FpZKb+yPPnBeYlxnCQTIm61ddhRTTZrsUoNCUP0YmflJUMGZnrOj5Ffb0SsWBA77TO0t
 JmmrgvxlJrvh7XmjHegfzPTUse7dO6wWHfN98X2uT21ZzgVARpYGTkJokLoR4CVkmiWw
 iRrCM1DJttPtRUz8piTthLV/+A2mDyajJDm3t7K3BmQoqPN6wnVi/ZH1yIqMCNf7o345
 lXnF9a/ywVjHKIZhPIlSBSs17tUCYcOOaLwv8XELxTGo8x/p6ysi11x/v8v2crWZ/hyu
 Uk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724682217; x=1725287017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Fz2LLvQTYlEOsUpiHug0Zo0dLswBmU+LLedYnqHt04=;
 b=CpDew1aprMwsVPXTVweIJeDI0QNzwwAN0oYXmGqHd1g+8NCf/+x6i8Kw4dJmgyQoP2
 zdF1QlGqMmtUEx3on1L+t0Qwk48it9bNl/C6QOGIrOB9QCog+Ai5bt4yk4/DTvZ2Qdon
 R1nLibmy8VNezsoImA7YKfXV6edC+Dw/iN8Dx2GmaoRIxbASjBvh/xICBrPIgk6TDAiC
 0NG/NIELhFs9aDAMW27zbxxA58TZIX3wkM16TF8OpGdlHlyQvtVa1th099cRRG3+fY/+
 Y6glc8B/Q8s0/7w4LUgG8Q6g9cZI8aYzZvuEGaGFHqwajEz16IUf14w0Cznk1346FpaZ
 1Kjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbavltEJU9/6Tq9q2segg34rhm2Obog0DgpVyDDQt6hXR5dUb5JOfODZlITmYl+cE1tyALCnw3pA==@lists.freedesktop.org,
 AJvYcCVbxj18XmfHKdzfpL7oqMFiFFzdLHBhvKh2lg1GkpPzCq6/Bb6IzqHXMZ6EW3gYnZ7+9xbwWpthBAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfQfmURR3JvFHM/yruLOOhk/NhrXEPqzcH3bFpAhi3wa300Yrd
 FN47XXkzOUs7eIA5Fdo1ufZnygU/NHYiD5fhnrJGK+wktgzYhNmhvxp2R00O+g5PaZHh9+5Herf
 2az7vj9gq4oC1bVmBa9hbMudTdd8=
X-Google-Smtp-Source: AGHT+IGmmcvpWkvHXDq0cyYNprm+1dAOPoQUI8Pf8pqeqVMWP0gYwF0AFm0EPNBk25rmIxaGPD40kue34U//HVWJy8Q=
X-Received: by 2002:a17:90a:ff17:b0:2c9:7219:1db0 with SMTP id
 98e67ed59e1d1-2d646bccfafmr12498489a91.3.1724682217421; Mon, 26 Aug 2024
 07:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240825174128.474100-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240825174128.474100-1-sui.jingfeng@linux.dev>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 26 Aug 2024 16:23:26 +0200
Message-ID: <CAH9NwWeVFtOuQ=6dpXotrR-BGMjYAo3-fR6CHgcHbOxiZ87xCA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Use unsigned type to count the number of
 userspace pages
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
> The unpin_user_pages() function takes an unsigned long argument to store
> length of the number of user space pages, and struct drm_gem_object::size
> is a size_t type. The number of pages can not be negative, hence, use an
> unsigned variable to store the number of pages.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index ce9c9233c4a6..fa0d193cec26 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -695,7 +695,7 @@ static void etnaviv_gem_userptr_release(struct etnaviv_gem_object *etnaviv_obj)
>                 kfree(etnaviv_obj->sgt);
>         }
>         if (etnaviv_obj->pages) {
> -               int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
> +               unsigned int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
>
>                 unpin_user_pages(etnaviv_obj->pages, npages);
>                 kvfree(etnaviv_obj->pages);
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
