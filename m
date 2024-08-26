Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21BD95F3B9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 16:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94AC10E204;
	Mon, 26 Aug 2024 14:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PyPFNXk6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9B710E20F;
 Mon, 26 Aug 2024 14:23:08 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d3e46ba5bcso3080265a91.0; 
 Mon, 26 Aug 2024 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724682187; x=1725286987; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2utW4FMHDyZpSCUZj+xJI3mr8FO/CAwmDufTeK2CIk=;
 b=PyPFNXk6QO0Zoz73Y3D6azZwWj83StALW2k0d1KyN/Sj1SjbRb2b6tFJlQEeHI7ofI
 IJAKH1yFi+6+Q8Lli9py3rFZSQY/5lSAtU9qgk79KCPoq1QVtKWJ5FXtTbKzpTKK+tQH
 9ZMgjc/uJ1xEE2t45XSo6ZTRSij32Ni8oHRZvLErE32ikKmf3rX13czzwQ/W4zdHmgHc
 /FpiqWeAeUg8lDDTw2MIH3idSRC7Ch6wuAAbQDv0B/uJAq+OYMYuEkTIrl1zcnnohac3
 POZUyvFNYu83n6hIMBSRYXvOqw6yNsj71knx8v861aCD7fJ8E/p8ytIv17QXneTGtelf
 6Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724682187; x=1725286987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z2utW4FMHDyZpSCUZj+xJI3mr8FO/CAwmDufTeK2CIk=;
 b=LPhhEO6WvUVTbBLcunhpzvcWK4/fzJWKiQaM1F+Tszrgay3xqb7NBTsYjbUgU6aCde
 rBVd4colsOI50bsfGfuop5K3YHtKMrIC/3SKP2tDtpJb2rOEDKXmx5Hd6F8BEH5UzGto
 d+QOQvcK+rsGHaGT1rTieo06wOcxj8G00SPYg/CilQxnFBn07+q2otcdyHM9LNatlgIq
 s7bMTZE+GdWEXk/pTvxmXN8xfmqgRyBi/VoezgB1ggqeRmP+Nai2bjhEP7rwd7zG/ers
 iueOwhEsPMSZyZ8/nH2Az0YFo7+YTo+6N3RPXftaPzCDDQD5LEo2/kTdge9cf1hH5Qjp
 Geyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1tWA433WxV5Iz3FKIwRmTnjl9DERUUfN1Z58u2lXKqYUc9O8nR6ltbLrp9W8nOEkJEzpdll2eJQ==@lists.freedesktop.org,
 AJvYcCWEOFZ9lKqXJ+b0rI0Npzjem0RqHOEKIjKUIEfibJgazLKMjXRaTSEtFxReOEBHOt/9fpIgNR1Cheo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLSSY4oqWA4e0aO4CAejRrT7EFAFYq1tYTCTiuetkeR4tm644S
 zlQ/RGpkTlKs6DsVRiJsDA/R6q1vl3t3mIwq54nIxmfWrjEtn9Rh7sX8fqYAD0FDa/uA3HCzJ+V
 6uYWqQkrAenWBHle1gvSdICgsakE=
X-Google-Smtp-Source: AGHT+IG/Dn/nxIV8yTlxqUE7f8LjK6OewCj2LtaTb2+9FKUHNqJ0iVTLhayt1aCPR/UYr9jW6k6FIt2I+rl0sqv23EY=
X-Received: by 2002:a17:90a:3484:b0:2d3:cd5c:15bb with SMTP id
 98e67ed59e1d1-2d646c04128mr9594862a91.25.1724682187111; Mon, 26 Aug 2024
 07:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240825162300.417306-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240825162300.417306-1-sui.jingfeng@linux.dev>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 26 Aug 2024 16:22:55 +0200
Message-ID: <CAH9NwWft0aBQdPUtREK3hLnPFgofFmDRk738k2C-Rxo1DVjOvA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Use unsigned type to count the number of
 pages
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
> The drm_prime_pages_to_sg() function takes unsigned int argument to store
> length of the page vector, and the type of struct drm_gem_object::size is
> a size_t. The size of the object in CPU pages can not be negative, hence,
> use unsigned variable to store the number of pages, instead of the signed
> type.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 3524b5811682..6b98200068e4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -17,7 +17,7 @@ static struct lock_class_key etnaviv_prime_lock_class;
>  struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>         struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
> -       int npages = obj->size >> PAGE_SHIFT;
> +       unsigned int npages = obj->size >> PAGE_SHIFT;
>
>         if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
>                 return ERR_PTR(-EINVAL);
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
