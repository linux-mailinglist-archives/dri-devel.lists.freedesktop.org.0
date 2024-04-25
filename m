Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FC78B204F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 13:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F9810EC22;
	Thu, 25 Apr 2024 11:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RbXZ94PD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4A210EA2A;
 Thu, 25 Apr 2024 11:32:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e9320c2ef6so5719335ad.2; 
 Thu, 25 Apr 2024 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714044756; x=1714649556; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ffuFzFDT/hhmG/R8PcprPn2rgAavZDqODrquN+sri9E=;
 b=RbXZ94PDPdlGjKIHcTtKCqTfbU5aPSv2zQdeYDrErWI2H9w6reTAfUJ42E3QjlbKPS
 84g7zRwVrOreZMApB0+e48fX+Kyfl96cJCp6FNveua8nIQbnCvM/Fb5RmB6d0/gsasZ2
 3naTSiidKNRui9CvfyLCrc2vEy4cWY3FsaSxNRW9NO2+zxm44yEgUOZpXOoGCGK7Mg2X
 277aGKXcUCFkZq+Rsb76+g7zZ/HBSpIPsqrymtaDtL2wmoxYanmPw2wlAe1I0+3tcW3a
 76ohW2qMg/IPYGwWByw6bj7ooQSD+VF/UZYcg4aDxl1/r6Dvex6GGJkRMC+7bGQ1kUv/
 TiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714044756; x=1714649556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ffuFzFDT/hhmG/R8PcprPn2rgAavZDqODrquN+sri9E=;
 b=g53lNIoy2A/yLFVrM1CQhOR2qNemgJRj+TxdH/BGvkmTjmfBXPj4HprIxq4AGGzqVq
 IZ7sPYGSF5bXzp9BbcaH5DXwwgprGcJ9xTUx/v0TnMSalqnRw6QfFlp1cEurHtTM2F8d
 DtMk5kqzP0mgZuoTDdoTOj8lSfMp03lYo7rPY+FHVeAma3CGKgTnDh/nFbrogTpEZox6
 Om4NaYfElIZVbss6iUsE3cLAkMN1Lw6nqfcwHfAzWDFt+xwDcIlghvnTP2trc8aG7ARV
 +wzPuZhjxf/T72IwVgGsy3UIT8jAM53w7Iu9z/x7ncODSHASjkKLaS6C/dq8m5b1XMl+
 dN1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkoYaQrUqV6q2JrOkw2OWtny1otK6u3O/IXRzhibqKi5/7BMoTUKt28n7DU0aYIe26nZHw9q9h34Wu+EXTjtaW6WIqYcK9m1d/raCByyTzl/S12EBeL5iABigPf5g2c53y2TiC47ZIL80DcjZmqw==
X-Gm-Message-State: AOJu0Yx6yZwG6MCvISBeZiv3xnQ3vynOk0TlLCocSDpg01tfVNRFuQL4
 ggjCWnVeUVnq7qe4JmbHADBUcMUnZi8oMBzUL3QdiPNcyM3S393lcanAutUKvtBrj0dkIb/b937
 axa14WxNIWprwhlriFw6JOjEdMwc=
X-Google-Smtp-Source: AGHT+IFAoonKY+Ldbjb5uRtArPVjR8I2eZU4gdaiybP+CEgjB+Lv8nAczp2WQLanPJwYBun3KbKBIsySsFAIfcS6O8U=
X-Received: by 2002:a17:902:8690:b0:1e2:7dc7:477 with SMTP id
 g16-20020a170902869000b001e27dc70477mr5255109plo.57.1714044755686; Thu, 25
 Apr 2024 04:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
In-Reply-To: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 25 Apr 2024 13:32:23 +0200
Message-ID: <CAH9NwWdzeF0=USW_bckDhPSUrgTfnFuAq44m1OhEmTL4JnBzLg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

Hi Tomeu,

>
> If we expose a render node for NPUs without rendering capabilities, the
> userspace stack will offer it to compositors and applications for
> rendering, which of course won't work.
>
> Userspace is probably right in not questioning whether a render node
> might not be capable of supporting rendering, so change it in the kernel
> instead by exposing a /dev/accel node.
>
> Before we bring the device up we don't know whether it is capable of
> rendering or not (depends on the features of its blocks), so first try
> to probe a rendering node, and if we find out that there is no rendering
> hardware, abort and retry with an accel node.
>

I really love this idea of moving away from a render node. What needs to be done
on the userspace side?

> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Cc: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 46 ++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6500f3999c5f..8e7dd23115f4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>
> +#include <drm/drm_accel.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -488,10 +489,10 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>         ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
>
> -DEFINE_DRM_GEM_FOPS(fops);
> +DEFINE_DRM_GEM_FOPS(render_fops);
> +DEFINE_DRM_ACCEL_FOPS(accel_fops);
>
> -static const struct drm_driver etnaviv_drm_driver = {
> -       .driver_features    = DRIVER_GEM | DRIVER_RENDER,
> +static struct drm_driver etnaviv_drm_driver = {
>         .open               = etnaviv_open,
>         .postclose           = etnaviv_postclose,
>         .gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
> @@ -500,7 +501,6 @@ static const struct drm_driver etnaviv_drm_driver = {
>  #endif
>         .ioctls             = etnaviv_ioctls,
>         .num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
> -       .fops               = &fops,
>         .name               = "etnaviv",
>         .desc               = "etnaviv DRM",
>         .date               = "20151214",
> @@ -508,15 +508,20 @@ static const struct drm_driver etnaviv_drm_driver = {
>         .minor              = 4,
>  };
>
> -/*
> - * Platform driver:
> - */
> -static int etnaviv_bind(struct device *dev)
> +static int etnaviv_bind_with_type(struct device *dev, u32 type)
>  {
>         struct etnaviv_drm_private *priv;
>         struct drm_device *drm;
> +       bool is_compute_only = true;
>         int ret;
>
> +       etnaviv_drm_driver.driver_features = DRIVER_GEM | type;
> +
> +       if (type == DRIVER_RENDER)
> +               etnaviv_drm_driver.fops = &render_fops;
> +       else
> +               etnaviv_drm_driver.fops = &accel_fops;
> +
>         drm = drm_dev_alloc(&etnaviv_drm_driver, dev);
>         if (IS_ERR(drm))
>                 return PTR_ERR(drm);
> @@ -553,6 +558,18 @@ static int etnaviv_bind(struct device *dev)
>
>         load_gpu(drm);
>
> +       for (unsigned int i = 0; i < ETNA_MAX_PIPES; i++) {
> +               struct etnaviv_gpu *g = priv->gpu[i];
> +
> +               if (g && (g->identity.minor_features8 & chipMinorFeatures8_COMPUTE_ONLY) == 0)
> +                       is_compute_only = false;
> +       }
> +
> +       if (type == DRIVER_RENDER && is_compute_only) {
> +               ret = -EINVAL;
> +               goto out_unbind;
> +       }
> +
>         ret = drm_dev_register(drm, 0);
>         if (ret)
>                 goto out_unbind;
> @@ -571,6 +588,19 @@ static int etnaviv_bind(struct device *dev)
>         return ret;
>  }
>
> +/*
> + * Platform driver:
> + */
> +static int etnaviv_bind(struct device *dev)
> +{
> +       int ret = etnaviv_bind_with_type(dev, DRIVER_RENDER);
> +
> +       if (ret == -EINVAL)
> +               return etnaviv_bind_with_type(dev, DRIVER_COMPUTE_ACCEL);
> +
> +       return ret;
> +}
> +
>  static void etnaviv_unbind(struct device *dev)
>  {
>         struct drm_device *drm = dev_get_drvdata(dev);
> --
> 2.44.0
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
