Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA092B6C1A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB8D89F8E;
	Tue, 17 Nov 2020 17:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194EF89F8E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:46:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so4094540wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kPk1ZZhy3J0GAdcV4HCLIN1L0nW/G6KmOSYNpQStbc8=;
 b=MGLM4s/CEjKONnMLX1tH4T9MZ2voAb68yPcskmE8JQcirF5j4h2ivjXHUG67EYR66G
 DAFrtV0jxLQvEVEVNJm1JgJG6RzqwBr3QZ2Y+i7oeRkflewI+Mq3XnIM6hhhVbs7YOeX
 Og/pFsxqJg1J5xmlwB1lIGWQNrLyqy3y9Bmg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kPk1ZZhy3J0GAdcV4HCLIN1L0nW/G6KmOSYNpQStbc8=;
 b=A5Md23oSZ1XzntsSJedoi4rgp1MogXJhhHjYcw0O+aehDCAOWCxx5TcEj0whDqGTwU
 rzC4mXjClUjdLwBiu658UUhAprX/lJu82szUE5zp3bnbETjA7iGnX98YZeLdh1csA9um
 NNA/gSXehXe490EIkO8qCr65KmF3l0Qr1ZBpBm2pyBitPIFHyeCnCACYUh4cJPA3Rviz
 q4gx0QUcKmGg6lhAOcKIaqbxaNMOsaYfpeA7pGnP4QUhMALjlE/aj6UTlboZBShmBBht
 y9Orgm13mJLhpmp9Z2NrNFOx5guefTCFa7FjM5d/W7JZ/R2Iz1O1+gAS/jlB+nrzJPap
 DJ+A==
X-Gm-Message-State: AOAM531j9grSqamGpiUk8YXFhfqq5RjDLKk0eZXAy1th+IHvt43H+Io9
 26S+sUN4GGTa/z79iN6o99Mb7g==
X-Google-Smtp-Source: ABdhPJzyH4KO8ILdnWctvc6V6ViM41TxOvVM46znQ8hhb7RkoIUOdbZxZLiX9KVZEJy4mU9HQCHWAA==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr242800wmc.64.1605635213711;
 Tue, 17 Nov 2020 09:46:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 89sm29733563wrp.58.2020.11.17.09.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:46:53 -0800 (PST)
Date: Tue, 17 Nov 2020 18:46:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm/drivers: remove unecessary ttm_module.h
 include
Message-ID: <20201117174651.GO401619@phenom.ffwll.local>
References: <20201117163338.1784-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117163338.1784-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 05:33:35PM +0100, Christian K=F6nig wrote:
> ttm_module.h deals with internals of TTM and should never
> be include outside of it.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Maybe also move it to drivers/gpu/drm/ttm/ttm_internal.h. We're using the
_interal.h suffix in a few other places for module internal functions
already. Perhaps in a follow-up?

Anyway this here is Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
(I didn't bother compile testing it on everything, just to make that
clear).
-Daniel
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 1 -
>  drivers/gpu/drm/nouveau/nouveau_drv.h         | 1 -
>  drivers/gpu/drm/qxl/qxl_drv.h                 | 1 -
>  drivers/gpu/drm/qxl/qxl_ttm.c                 | 1 -
>  drivers/gpu/drm/radeon/radeon.h               | 1 -
>  drivers/gpu/drm/radeon/radeon_ttm.c           | 1 -
>  drivers/gpu/drm/ttm/ttm_agp_backend.c         | 1 -
>  drivers/gpu/drm/ttm/ttm_bo_vm.c               | 1 -
>  drivers/gpu/drm/ttm/ttm_range_manager.c       | 1 -
>  drivers/gpu/drm/vmwgfx/ttm_object.c           | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 1 -
>  include/drm/ttm/ttm_bo_driver.h               | 1 -
>  16 files changed, 16 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 183b09d71b64..6e042b4ed13d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -55,7 +55,6 @@
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  =

>  #include <drm/amdgpu_drm.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index c438d290a6db..967859c6be3c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -46,7 +46,6 @@
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> -#include <drm/ttm/ttm_module.h>
>  =

>  #include <drm/drm_debugfs.h>
>  #include <drm/amdgpu_drm.h>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 8e90b3e47bbe..700fa0979d14 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -54,7 +54,6 @@
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> -#include <drm/ttm/ttm_module.h>
>  =

>  #include <drm/drm_audio_component.h>
>  =

> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> index 8bd0f916dfbc..83b54f0dad61 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -46,7 +46,6 @@
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_placement.h>
>  =

>  #include "qxl_dev.h"
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 128c38c8a837..0cc661df2258 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -31,7 +31,6 @@
>  #include <drm/qxl_drm.h>
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_placement.h>
>  =

>  #include "qxl_drv.h"
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
> index 28cb8ced91b9..428c561a4e2c 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -75,7 +75,6 @@
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  =

>  #include <drm/drm_gem.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 0ca381b95d3d..2259d3811a45 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -46,7 +46,6 @@
>  #include <drm/radeon_drm.h>
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_placement.h>
>  =

>  #include "radeon_reg.h"
> diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/=
ttm_agp_backend.c
> index 03c86628e4ac..8f9fa4188897 100644
> --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> @@ -32,7 +32,6 @@
>  =

>  #define pr_fmt(fmt) "[TTM] " fmt
>  =

> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <linux/agp_backend.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index 2944fa0af493..144a4940b6b6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -31,7 +31,6 @@
>  =

>  #define pr_fmt(fmt) "[TTM] " fmt
>  =

> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/drm_vma_manager.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/tt=
m/ttm_range_manager.c
> index ea77919569a2..4c0c756c9124 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -29,7 +29,6 @@
>   * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>   */
>  =

> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/drm_mm.h>
> diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx=
/ttm_object.c
> index 16077785ad47..0fe869d0fad1 100644
> --- a/drivers/gpu/drm/vmwgfx/ttm_object.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
> @@ -59,7 +59,6 @@
>  =

>  #define pr_fmt(fmt) "[TTM] " fmt
>  =

> -#include <drm/ttm/ttm_module.h>
>  #include <linux/list.h>
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 1310857879e7..e6de876a016a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -35,7 +35,6 @@
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_sysfs.h>
>  #include <drm/ttm/ttm_bo_driver.h>
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_placement.h>
>  =

>  #include "ttm_object.h"
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index b45becbb00f8..5b9a28157dd3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -39,7 +39,6 @@
>  =

>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
> -#include <drm/ttm/ttm_module.h>
>  =

>  #include "ttm_lock.h"
>  #include "ttm_object.h"
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/=
drm/vmwgfx/vmwgfx_gmrid_manager.c
> index be325a62c178..8fe26e32f920 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -29,7 +29,6 @@
>   */
>  =

>  #include "vmwgfx_drv.h"
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <linux/idr.h>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_thp.c
> index 155ca3a5c7e5..e8e79de255cf 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -5,7 +5,6 @@
>   * Copyright (C) 2007-2019 Vmware, Inc. All rights reservedd.
>   */
>  #include "vmwgfx_drv.h"
> -#include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  =

> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 54788a5160a0..fdf01c7f1f99 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -38,7 +38,6 @@
>  #include <linux/dma-resv.h>
>  =

>  #include "ttm_bo_api.h"
> -#include "ttm_module.h"
>  #include "ttm_placement.h"
>  #include "ttm_tt.h"
>  #include "ttm_pool.h"
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
