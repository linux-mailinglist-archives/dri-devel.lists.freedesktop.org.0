Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D595A3C9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 19:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48A10E68B;
	Wed, 21 Aug 2024 17:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DyQUGNr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCBD10E687
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 17:21:20 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e13d5cbc067so4614194276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1724260880; x=1724865680;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=015rYsEP7yfhpkEIWRHux/biwfA+OwNX3ERgw0+e/fU=;
 b=DyQUGNr8eProSRf1kLimwHhnpVxpLEllr313tII/F30t8sbOsJ/F6xiomVvwp3j8ub
 C0hGKpkSDWwZ3E+o652+0LSKOug+KQUCtpafwT4vDPdC1UYP4JpJizVWoKYjabG3t06D
 VTouzRtrrti8uU6n9PrtDFk4hDBbKXSwcWlcvxIIUhtKjURd/7v1oUZ+ST5OuJZuWP31
 fUhKnIRsqObu8qDnc3s5FJzxI47X5cPDo8rFjTeRWO0b2apIb/AvX5bCWuJLqpuCxCxr
 KY9VGagKqMFmnS06AUZijxsMZmgQXkPC2EtJRCzHixZrQsQMMgv/qe5VSSlap2ye4yr4
 Jfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724260880; x=1724865680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=015rYsEP7yfhpkEIWRHux/biwfA+OwNX3ERgw0+e/fU=;
 b=Wr7HmiJ7FqynaXyYs8ZY1GqvKr86R8IhWiCxw3TlP2PBP33QJruP9Dyn785yseXUUj
 7eehHt32Tgfb14eyKiUAoxFwsQCHm6tX2//NHwjGiYKlrfo8NjRCkSRULM2OMAqZdsNG
 kfoWTklKYlhm3ZRvhsp9sCureTWYGqd0t36cC+7AMsTMQKekqQTDWDQhHokeY+EK93MS
 tnB0yzQORberHSUFEzvFU3z2Swuwznm9/uNrxMQpnKWWrJqNkW3GYI/yUoyYji7pSWNj
 gvam0r1miNCf4dqRFNlFkCa1dxhxD7kZhesYBGIEmXhDLo/ScT+IWkm0/nzb32U1dB45
 MG5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaQeralUASOlj8G4afFjrm37ayc0BtX2aLQefAt+IJOAr1Jlwh2m0qUv5KkRj5ZJlWnCwEvCjQO90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJmBJr7CdXCAdQx/uXPzKJfJigvWDLOjYqbIgP/JJ+ZYUj9DC0
 VxAA0SMN6HCkUnRLBafKau1pgGoykn7gzgPATv28UchkwA1WcOmyJ3PPn+80DBfcrIw92rV56um
 SAtthhbVcLE8PhHBN7rNnNg7BY2s8mni5/UeAEg==
X-Google-Smtp-Source: AGHT+IFQIUYiqr9oXIpOCAWbvMIqreaNR6efa2UkbC2wXzdj0+7XiJlJ/bxcMVvFQA58O+M6v+X5MHJ8N7n6A61CWXI=
X-Received: by 2002:a05:6902:100a:b0:e0b:c297:8a1c with SMTP id
 3f1490d57ef6-e166544e86bmr4285471276.15.1724260879808; Wed, 21 Aug 2024
 10:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-48-tzimmermann@suse.de>
In-Reply-To: <20240821130348.73038-48-tzimmermann@suse.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Aug 2024 18:21:03 +0100
Message-ID: <CAPY8ntCrRjRWRAuM1HzV+=VMUzhxLg5Zw4KqhK0rkA3ed5avfg@mail.gmail.com>
Subject: Re: [PATCH v2 47/86] drm/vc4: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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

On Wed, 21 Aug 2024 at 14:04, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> v2:
> - use drm_client_setup_with_fourcc()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index c133e96b8aca..86786caaf8a5 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -32,8 +32,10 @@
>
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_vblank.h>
>
>  #include <soc/bcm2835/raspberrypi-firmware.h>
> @@ -212,6 +214,7 @@ const struct drm_driver vc4_drm_driver = {
>         .gem_create_object = vc4_create_object,
>
>         DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vc4_bo_dumb_create),
> +       DRM_FBDEV_DMA_DRIVER_OPS,
>
>         .ioctls = vc4_drm_ioctls,
>         .num_ioctls = ARRAY_SIZE(vc4_drm_ioctls),
> @@ -389,7 +392,7 @@ static int vc4_drm_bind(struct device *dev)
>         if (ret < 0)
>                 goto err;
>
> -       drm_fbdev_dma_setup(drm, 16);
> +       drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
>
>         return 0;
>
> --
> 2.46.0
>
