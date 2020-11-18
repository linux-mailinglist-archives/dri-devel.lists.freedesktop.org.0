Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00B2B8691
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 22:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C266E4C4;
	Wed, 18 Nov 2020 21:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77816E4C4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 21:25:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so3650671wrp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Gglv/yoI9M0fnkhCPqw+O8XXwbVXWbFWgw40lOYpUao=;
 b=hyG3xtidu17xApZ9XhuIqWhwTzA44MPrs/XzxbHb0WzsLV3vhB6K3TOXq600nbc1W/
 CqN8FAgohfLcvT8frAJAd+BmMI8qElbe7YbcyEpnJHZNwiETV3TYue7Adp15eNJxj6RC
 lX+I6P8MWCWgCe1XK1i0TZxZmYYN5NXhxBRZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Gglv/yoI9M0fnkhCPqw+O8XXwbVXWbFWgw40lOYpUao=;
 b=ci7bkw0dYmidYGhkBi40gUHze8Rn43T4Qo9O0Iuhk3HsWfqf5BR3TEHa4NoAPKHWmq
 u44hTPkp4UDthLEM6LQtFIQeEkmyJwR8PC9c3tkasSqPdJ2Myzj+hZe/DC9O8i5Q/NHT
 E1Zv6lTAasqNUKiRN8Xq4r1Xfdz+f4tNpSp2R4sUS7jHGREj/1YHkros2L7b0ZZ/mEYG
 vt9Y5rng1yiK9bblmfJLK8l6Sf54Y2BWsTAvr7a0FzAe70IAWQGkNHELpsem5/n+NbiM
 MstyzfBSKTvtU4pDXLo0LkaIlYnywHIkt/8vLQPE95WtILcjhZq2d9mp8Dq1QTVxNYA0
 LiWQ==
X-Gm-Message-State: AOAM531TJaz5vk9Jb5+YnltWd6aj8CrHCbvx3kTl6C2PiGaoWjERWs1L
 xd+8MQbuaecRkzJIuw1nfCj35NW71c1/Aw==
X-Google-Smtp-Source: ABdhPJzrk/KcJzxOyqpO5BipbS/XaHsQjkZj26P/x7QDixF2zGcuL1bXxuSuUFsJV9ztkcIPRKyyIA==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr7231591wrm.81.1605734751520;
 Wed, 18 Nov 2020 13:25:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm5822288wmk.24.2020.11.18.13.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:25:50 -0800 (PST)
Date: Wed, 18 Nov 2020 22:25:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 1/4] drm/ttm/drivers: remove unecessary ttm_module.h
 include
Message-ID: <20201118212548.GZ401619@phenom.ffwll.local>
References: <20201117163338.1784-1-christian.koenig@amd.com>
 <20201117174651.GO401619@phenom.ffwll.local>
 <684b8c72-9eb5-a942-038b-3b41685d65a8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <684b8c72-9eb5-a942-038b-3b41685d65a8@gmail.com>
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

On Wed, Nov 18, 2020 at 01:49:51PM +0100, Christian K=F6nig wrote:
> Am 17.11.20 um 18:46 schrieb Daniel Vetter:
> > On Tue, Nov 17, 2020 at 05:33:35PM +0100, Christian K=F6nig wrote:
> > > ttm_module.h deals with internals of TTM and should never
> > > be include outside of it.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Maybe also move it to drivers/gpu/drm/ttm/ttm_internal.h. We're using t=
he
> > _interal.h suffix in a few other places for module internal functions
> > already. Perhaps in a follow-up?
> =

> I've thought I already moved the header into drivers/gpu/drm/ttm/, but it
> somehow got mangled into patch #2.
> =

> Going to fix that and resend.
> =

> > Anyway this here is Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> For this one or the whole series? Please note that #2 removes the TTM sys=
fs
> files. I think that nobody every used those, but who knows?

Just this patch here, courage left me for the remaining ones today ...
-Daniel

> =

> Regards,
> Christian.
> =

> > (I didn't bother compile testing it on everything, just to make that
> > clear).
> > -Daniel
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 1 -
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 1 -
> > >   drivers/gpu/drm/nouveau/nouveau_drv.h         | 1 -
> > >   drivers/gpu/drm/qxl/qxl_drv.h                 | 1 -
> > >   drivers/gpu/drm/qxl/qxl_ttm.c                 | 1 -
> > >   drivers/gpu/drm/radeon/radeon.h               | 1 -
> > >   drivers/gpu/drm/radeon/radeon_ttm.c           | 1 -
> > >   drivers/gpu/drm/ttm/ttm_agp_backend.c         | 1 -
> > >   drivers/gpu/drm/ttm/ttm_bo_vm.c               | 1 -
> > >   drivers/gpu/drm/ttm/ttm_range_manager.c       | 1 -
> > >   drivers/gpu/drm/vmwgfx/ttm_object.c           | 1 -
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 1 -
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 1 -
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 1 -
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 1 -
> > >   include/drm/ttm/ttm_bo_driver.h               | 1 -
> > >   16 files changed, 16 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu.h
> > > index 183b09d71b64..6e042b4ed13d 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > @@ -55,7 +55,6 @@
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_execbuf_util.h>
> > >   #include <drm/amdgpu_drm.h>
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ttm.c
> > > index c438d290a6db..967859c6be3c 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > @@ -46,7 +46,6 @@
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/drm_debugfs.h>
> > >   #include <drm/amdgpu_drm.h>
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/=
nouveau/nouveau_drv.h
> > > index 8e90b3e47bbe..700fa0979d14 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > @@ -54,7 +54,6 @@
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/drm_audio_component.h>
> > > diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_=
drv.h
> > > index 8bd0f916dfbc..83b54f0dad61 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_drv.h
> > > +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> > > @@ -46,7 +46,6 @@
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_execbuf_util.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include "qxl_dev.h"
> > > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_=
ttm.c
> > > index 128c38c8a837..0cc661df2258 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > > @@ -31,7 +31,6 @@
> > >   #include <drm/qxl_drm.h>
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include "qxl_drv.h"
> > > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon=
/radeon.h
> > > index 28cb8ced91b9..428c561a4e2c 100644
> > > --- a/drivers/gpu/drm/radeon/radeon.h
> > > +++ b/drivers/gpu/drm/radeon/radeon.h
> > > @@ -75,7 +75,6 @@
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_execbuf_util.h>
> > >   #include <drm/drm_gem.h>
> > > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/ra=
deon/radeon_ttm.c
> > > index 0ca381b95d3d..2259d3811a45 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > > @@ -46,7 +46,6 @@
> > >   #include <drm/radeon_drm.h>
> > >   #include <drm/ttm/ttm_bo_api.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include "radeon_reg.h"
> > > diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/=
ttm/ttm_agp_backend.c
> > > index 03c86628e4ac..8f9fa4188897 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > > @@ -32,7 +32,6 @@
> > >   #define pr_fmt(fmt) "[TTM] " fmt
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include <linux/agp_backend.h>
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/tt=
m_bo_vm.c
> > > index 2944fa0af493..144a4940b6b6 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > @@ -31,7 +31,6 @@
> > >   #define pr_fmt(fmt) "[TTM] " fmt
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include <drm/drm_vma_manager.h>
> > > diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/dr=
m/ttm/ttm_range_manager.c
> > > index ea77919569a2..4c0c756c9124 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> > > @@ -29,7 +29,6 @@
> > >    * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
> > >    */
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include <drm/drm_mm.h>
> > > diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vm=
wgfx/ttm_object.c
> > > index 16077785ad47..0fe869d0fad1 100644
> > > --- a/drivers/gpu/drm/vmwgfx/ttm_object.c
> > > +++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
> > > @@ -59,7 +59,6 @@
> > >   #define pr_fmt(fmt) "[TTM] " fmt
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <linux/list.h>
> > >   #include <linux/spinlock.h>
> > >   #include <linux/slab.h>
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_drv.c
> > > index 1310857879e7..e6de876a016a 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > @@ -35,7 +35,6 @@
> > >   #include <drm/drm_ioctl.h>
> > >   #include <drm/drm_sysfs.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include "ttm_object.h"
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vm=
wgfx/vmwgfx_drv.h
> > > index b45becbb00f8..5b9a28157dd3 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > > @@ -39,7 +39,6 @@
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_execbuf_util.h>
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include "ttm_lock.h"
> > >   #include "ttm_object.h"
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/=
gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> > > index be325a62c178..8fe26e32f920 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> > > @@ -29,7 +29,6 @@
> > >    */
> > >   #include "vmwgfx_drv.h"
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include <linux/idr.h>
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_thp.c
> > > index 155ca3a5c7e5..e8e79de255cf 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> > > @@ -5,7 +5,6 @@
> > >    * Copyright (C) 2007-2019 Vmware, Inc. All rights reservedd.
> > >    */
> > >   #include "vmwgfx_drv.h"
> > > -#include <drm/ttm/ttm_module.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > > diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo=
_driver.h
> > > index 54788a5160a0..fdf01c7f1f99 100644
> > > --- a/include/drm/ttm/ttm_bo_driver.h
> > > +++ b/include/drm/ttm/ttm_bo_driver.h
> > > @@ -38,7 +38,6 @@
> > >   #include <linux/dma-resv.h>
> > >   #include "ttm_bo_api.h"
> > > -#include "ttm_module.h"
> > >   #include "ttm_placement.h"
> > >   #include "ttm_tt.h"
> > >   #include "ttm_pool.h"
> > > -- =

> > > 2.25.1
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
