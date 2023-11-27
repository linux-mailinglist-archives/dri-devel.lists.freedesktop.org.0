Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0C7FAC40
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A11610E3F8;
	Mon, 27 Nov 2023 21:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A589210E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:07:19 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6d817ccaa6dso1416505a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119239; x=1701724039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PSwhnKabmqy1BuA4nI/oDlHD6PyBzH35o/2kcvDJUk=;
 b=lfy2Q7LNBdBgxvAd/1Dzgcnt0sJJdk0nnhD2D8VdNoLOgUVSESpyy8LtTaGEekXr9r
 vxOhJBC7ZR9vETBg8D+u/ZX/pqCrO35nTh3w7tUbDhhhuOMPAB+qkbAtL+TIluJBWDQx
 YiHFtkYIJvTVECqAecFLKUXtJZCW2qDTWscHdPXKAlfzusIs/siElN2tNFXhvuewOcR5
 nzH1eDpfD9jZimIvt0EVDBv4iO7xdwz7tPrLVYwRdSR8wKDciCU6Exj0sCxusGQa0PeP
 bt3l34IbtF7i1PUbnzLJ/kp6pXGckp9yzMwhWteP2IDubMZIWK7UkJ5/SfRhK01s3abf
 Q5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119239; x=1701724039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PSwhnKabmqy1BuA4nI/oDlHD6PyBzH35o/2kcvDJUk=;
 b=uMDRkAZfdCDZ8TmDPrJCuO+DlZ/Ff5X96e+ikaXjSd96G+2f3P70bj6+6jBcxrYiHd
 P0u1+r0r4SWoXMGV0ImvOADuG9cFaEgg1X8NMiva7KwZMgIjl0aQqxF16rDevYNNjeyr
 DWuVjP7X6WPb7d0EIM+8Bds2At2eQif4949snE8jV0vpyWXZxmu7TPpTXREOMXEMv4/y
 YUZ0WKQykUwRqJanlbynZdJf4ksmmUBk/XjD4zsHoSBXW81DtoeEAcKlKxMHewd69ASk
 /AcHj2rzX7mzwQkYwd5/XPQgODk2UmK0iaVcaHIlSDknkmoFaQZYYT7y0p82QLR1k7xf
 UWZg==
X-Gm-Message-State: AOJu0YzC2UzXp9tWgR6gpzlB8HLTlFwnHUqMgxHSp5+09Pjq2mt32nuV
 WKNv1zch4XxTspj5wRTKUZJJEoQIritb2J6FkEU=
X-Google-Smtp-Source: AGHT+IHZdj992QerI4BEfDGkXpu06dZP3+DJAE9elL4XSB2IudqhEyuGtntEhJoOaSlpXcpM7cQxMtv/o/N35PnS/68=
X-Received: by 2002:a05:6871:29c:b0:1fa:136f:5758 with SMTP id
 i28-20020a056871029c00b001fa136f5758mr14078683oae.44.1701119238543; Mon, 27
 Nov 2023 13:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-14-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-14-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:07:07 -0500
Message-ID: <CADnq5_OSd8FW3To5twAhVjp9k0vgSigYtv0vUJGwNUvUkuBpZQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] char/agp: Remove frontend code
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The AGP subsystem supports a user-space interface via /dev/agpgart. It
> is only enabled with DRM support for mode setting in user space. (i.e.,
> CONFIG_DRM_LEGACY). All of that DRM code has been removed and the option
> will go away. Hence remove the AGP frontend.
>
> Modern DRM drivers with kernel mode setting handle AGP support internally=
.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/char/agp/Makefile       |    6 -
>  drivers/char/agp/agp.h          |    9 -
>  drivers/char/agp/backend.c      |   11 -
>  drivers/char/agp/compat_ioctl.c |  291 ---------
>  drivers/char/agp/compat_ioctl.h |  106 ---
>  drivers/char/agp/frontend.c     | 1068 -------------------------------
>  6 files changed, 1491 deletions(-)
>  delete mode 100644 drivers/char/agp/compat_ioctl.c
>  delete mode 100644 drivers/char/agp/compat_ioctl.h
>  delete mode 100644 drivers/char/agp/frontend.c
>
> diff --git a/drivers/char/agp/Makefile b/drivers/char/agp/Makefile
> index 25834557e4865..43b09cf193bb7 100644
> --- a/drivers/char/agp/Makefile
> +++ b/drivers/char/agp/Makefile
> @@ -1,12 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  agpgart-y :=3D backend.o generic.o isoch.o
>
> -ifeq ($(CONFIG_DRM_LEGACY),y)
> -agpgart-$(CONFIG_COMPAT)       +=3D compat_ioctl.o
> -agpgart-y                      +=3D frontend.o
> -endif
> -
> -
>  obj-$(CONFIG_AGP)              +=3D agpgart.o
>  obj-$(CONFIG_AGP_ALI)          +=3D ali-agp.o
>  obj-$(CONFIG_AGP_ATI)          +=3D ati-agp.o
> diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
> index 8771dcc9b8e2f..5c36ab85f80b7 100644
> --- a/drivers/char/agp/agp.h
> +++ b/drivers/char/agp/agp.h
> @@ -185,15 +185,6 @@ void agp_put_bridge(struct agp_bridge_data *bridge);
>  int agp_add_bridge(struct agp_bridge_data *bridge);
>  void agp_remove_bridge(struct agp_bridge_data *bridge);
>
> -/* Frontend routines. */
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -int agp_frontend_initialize(void);
> -void agp_frontend_cleanup(void);
> -#else
> -static inline int agp_frontend_initialize(void) { return 0; }
> -static inline void agp_frontend_cleanup(void) {}
> -#endif
> -
>  /* Generic routines. */
>  void agp_generic_enable(struct agp_bridge_data *bridge, u32 mode);
>  int agp_generic_create_gatt_table(struct agp_bridge_data *bridge);
> diff --git a/drivers/char/agp/backend.c b/drivers/char/agp/backend.c
> index 0e19c600db531..1776afd3ee078 100644
> --- a/drivers/char/agp/backend.c
> +++ b/drivers/char/agp/backend.c
> @@ -293,13 +293,6 @@ int agp_add_bridge(struct agp_bridge_data *bridge)
>         }
>
>         if (list_empty(&agp_bridges)) {
> -               error =3D agp_frontend_initialize();
> -               if (error) {
> -                       dev_info(&bridge->dev->dev,
> -                                "agp_frontend_initialize() failed\n");
> -                       goto frontend_err;
> -               }
> -
>                 dev_info(&bridge->dev->dev, "AGP aperture is %dM @ 0x%lx\=
n",
>                          bridge->driver->fetch_size(), bridge->gart_bus_a=
ddr);
>
> @@ -308,8 +301,6 @@ int agp_add_bridge(struct agp_bridge_data *bridge)
>         list_add(&bridge->list, &agp_bridges);
>         return 0;
>
> -frontend_err:
> -       agp_backend_cleanup(bridge);
>  err_out:
>         module_put(bridge->driver->owner);
>  err_put_bridge:
> @@ -323,8 +314,6 @@ void agp_remove_bridge(struct agp_bridge_data *bridge=
)
>  {
>         agp_backend_cleanup(bridge);
>         list_del(&bridge->list);
> -       if (list_empty(&agp_bridges))
> -               agp_frontend_cleanup();
>         module_put(bridge->driver->owner);
>  }
>  EXPORT_SYMBOL_GPL(agp_remove_bridge);
> diff --git a/drivers/char/agp/compat_ioctl.c b/drivers/char/agp/compat_io=
ctl.c
> deleted file mode 100644
> index 52ffe1706ce05..0000000000000
> --- a/drivers/char/agp/compat_ioctl.c
> +++ /dev/null
> @@ -1,291 +0,0 @@
> -/*
> - * AGPGART driver frontend compatibility ioctls
> - * Copyright (C) 2004 Silicon Graphics, Inc.
> - * Copyright (C) 2002-2003 Dave Jones
> - * Copyright (C) 1999 Jeff Hartmann
> - * Copyright (C) 1999 Precision Insight, Inc.
> - * Copyright (C) 1999 Xi Graphics, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed
> - * in all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS
> - * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * JEFF HARTMANN, OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
> - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
> - * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/pci.h>
> -#include <linux/fs.h>
> -#include <linux/agpgart.h>
> -#include <linux/slab.h>
> -#include <linux/uaccess.h>
> -#include "agp.h"
> -#include "compat_ioctl.h"
> -
> -static int compat_agpioc_info_wrap(struct agp_file_private *priv, void _=
_user *arg)
> -{
> -       struct agp_info32 userinfo;
> -       struct agp_kern_info kerninfo;
> -
> -       agp_copy_info(agp_bridge, &kerninfo);
> -
> -       userinfo.version.major =3D kerninfo.version.major;
> -       userinfo.version.minor =3D kerninfo.version.minor;
> -       userinfo.bridge_id =3D kerninfo.device->vendor |
> -           (kerninfo.device->device << 16);
> -       userinfo.agp_mode =3D kerninfo.mode;
> -       userinfo.aper_base =3D (compat_long_t)kerninfo.aper_base;
> -       userinfo.aper_size =3D kerninfo.aper_size;
> -       userinfo.pg_total =3D userinfo.pg_system =3D kerninfo.max_memory;
> -       userinfo.pg_used =3D kerninfo.current_memory;
> -
> -       if (copy_to_user(arg, &userinfo, sizeof(userinfo)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -static int compat_agpioc_reserve_wrap(struct agp_file_private *priv, voi=
d __user *arg)
> -{
> -       struct agp_region32 ureserve;
> -       struct agp_region kreserve;
> -       struct agp_client *client;
> -       struct agp_file_private *client_priv;
> -
> -       DBG("");
> -       if (copy_from_user(&ureserve, arg, sizeof(ureserve)))
> -               return -EFAULT;
> -
> -       if ((unsigned) ureserve.seg_count >=3D ~0U/sizeof(struct agp_segm=
ent32))
> -               return -EFAULT;
> -
> -       kreserve.pid =3D ureserve.pid;
> -       kreserve.seg_count =3D ureserve.seg_count;
> -
> -       client =3D agp_find_client_by_pid(kreserve.pid);
> -
> -       if (kreserve.seg_count =3D=3D 0) {
> -               /* remove a client */
> -               client_priv =3D agp_find_private(kreserve.pid);
> -
> -               if (client_priv !=3D NULL) {
> -                       set_bit(AGP_FF_IS_CLIENT, &client_priv->access_fl=
ags);
> -                       set_bit(AGP_FF_IS_VALID, &client_priv->access_fla=
gs);
> -               }
> -               if (client =3D=3D NULL) {
> -                       /* client is already removed */
> -                       return 0;
> -               }
> -               return agp_remove_client(kreserve.pid);
> -       } else {
> -               struct agp_segment32 *usegment;
> -               struct agp_segment *ksegment;
> -               int seg;
> -
> -               if (ureserve.seg_count >=3D 16384)
> -                       return -EINVAL;
> -
> -               usegment =3D kmalloc_array(ureserve.seg_count,
> -                                        sizeof(*usegment),
> -                                        GFP_KERNEL);
> -               if (!usegment)
> -                       return -ENOMEM;
> -
> -               ksegment =3D kmalloc_array(kreserve.seg_count,
> -                                        sizeof(*ksegment),
> -                                        GFP_KERNEL);
> -               if (!ksegment) {
> -                       kfree(usegment);
> -                       return -ENOMEM;
> -               }
> -
> -               if (copy_from_user(usegment, (void __user *) ureserve.seg=
_list,
> -                                  sizeof(*usegment) * ureserve.seg_count=
)) {
> -                       kfree(usegment);
> -                       kfree(ksegment);
> -                       return -EFAULT;
> -               }
> -
> -               for (seg =3D 0; seg < ureserve.seg_count; seg++) {
> -                       ksegment[seg].pg_start =3D usegment[seg].pg_start=
;
> -                       ksegment[seg].pg_count =3D usegment[seg].pg_count=
;
> -                       ksegment[seg].prot =3D usegment[seg].prot;
> -               }
> -
> -               kfree(usegment);
> -               kreserve.seg_list =3D ksegment;
> -
> -               if (client =3D=3D NULL) {
> -                       /* Create the client and add the segment */
> -                       client =3D agp_create_client(kreserve.pid);
> -
> -                       if (client =3D=3D NULL) {
> -                               kfree(ksegment);
> -                               return -ENOMEM;
> -                       }
> -                       client_priv =3D agp_find_private(kreserve.pid);
> -
> -                       if (client_priv !=3D NULL) {
> -                               set_bit(AGP_FF_IS_CLIENT, &client_priv->a=
ccess_flags);
> -                               set_bit(AGP_FF_IS_VALID, &client_priv->ac=
cess_flags);
> -                       }
> -               }
> -               return agp_create_segment(client, &kreserve);
> -       }
> -       /* Will never really happen */
> -       return -EINVAL;
> -}
> -
> -static int compat_agpioc_allocate_wrap(struct agp_file_private *priv, vo=
id __user *arg)
> -{
> -       struct agp_memory *memory;
> -       struct agp_allocate32 alloc;
> -
> -       DBG("");
> -       if (copy_from_user(&alloc, arg, sizeof(alloc)))
> -               return -EFAULT;
> -
> -       memory =3D agp_allocate_memory_wrap(alloc.pg_count, alloc.type);
> -
> -       if (memory =3D=3D NULL)
> -               return -ENOMEM;
> -
> -       alloc.key =3D memory->key;
> -       alloc.physical =3D memory->physical;
> -
> -       if (copy_to_user(arg, &alloc, sizeof(alloc))) {
> -               agp_free_memory_wrap(memory);
> -               return -EFAULT;
> -       }
> -       return 0;
> -}
> -
> -static int compat_agpioc_bind_wrap(struct agp_file_private *priv, void _=
_user *arg)
> -{
> -       struct agp_bind32 bind_info;
> -       struct agp_memory *memory;
> -
> -       DBG("");
> -       if (copy_from_user(&bind_info, arg, sizeof(bind_info)))
> -               return -EFAULT;
> -
> -       memory =3D agp_find_mem_by_key(bind_info.key);
> -
> -       if (memory =3D=3D NULL)
> -               return -EINVAL;
> -
> -       return agp_bind_memory(memory, bind_info.pg_start);
> -}
> -
> -static int compat_agpioc_unbind_wrap(struct agp_file_private *priv, void=
 __user *arg)
> -{
> -       struct agp_memory *memory;
> -       struct agp_unbind32 unbind;
> -
> -       DBG("");
> -       if (copy_from_user(&unbind, arg, sizeof(unbind)))
> -               return -EFAULT;
> -
> -       memory =3D agp_find_mem_by_key(unbind.key);
> -
> -       if (memory =3D=3D NULL)
> -               return -EINVAL;
> -
> -       return agp_unbind_memory(memory);
> -}
> -
> -long compat_agp_ioctl(struct file *file, unsigned int cmd, unsigned long=
 arg)
> -{
> -       struct agp_file_private *curr_priv =3D file->private_data;
> -       int ret_val =3D -ENOTTY;
> -
> -       mutex_lock(&(agp_fe.agp_mutex));
> -
> -       if ((agp_fe.current_controller =3D=3D NULL) &&
> -           (cmd !=3D AGPIOC_ACQUIRE32)) {
> -               ret_val =3D -EINVAL;
> -               goto ioctl_out;
> -       }
> -       if ((agp_fe.backend_acquired !=3D true) &&
> -           (cmd !=3D AGPIOC_ACQUIRE32)) {
> -               ret_val =3D -EBUSY;
> -               goto ioctl_out;
> -       }
> -       if (cmd !=3D AGPIOC_ACQUIRE32) {
> -               if (!(test_bit(AGP_FF_IS_CONTROLLER, &curr_priv->access_f=
lags))) {
> -                       ret_val =3D -EPERM;
> -                       goto ioctl_out;
> -               }
> -               /* Use the original pid of the controller,
> -                * in case it's threaded */
> -
> -               if (agp_fe.current_controller->pid !=3D curr_priv->my_pid=
) {
> -                       ret_val =3D -EBUSY;
> -                       goto ioctl_out;
> -               }
> -       }
> -
> -       switch (cmd) {
> -       case AGPIOC_INFO32:
> -               ret_val =3D compat_agpioc_info_wrap(curr_priv, (void __us=
er *) arg);
> -               break;
> -
> -       case AGPIOC_ACQUIRE32:
> -               ret_val =3D agpioc_acquire_wrap(curr_priv);
> -               break;
> -
> -       case AGPIOC_RELEASE32:
> -               ret_val =3D agpioc_release_wrap(curr_priv);
> -               break;
> -
> -       case AGPIOC_SETUP32:
> -               ret_val =3D agpioc_setup_wrap(curr_priv, (void __user *) =
arg);
> -               break;
> -
> -       case AGPIOC_RESERVE32:
> -               ret_val =3D compat_agpioc_reserve_wrap(curr_priv, (void _=
_user *) arg);
> -               break;
> -
> -       case AGPIOC_PROTECT32:
> -               ret_val =3D agpioc_protect_wrap(curr_priv);
> -               break;
> -
> -       case AGPIOC_ALLOCATE32:
> -               ret_val =3D compat_agpioc_allocate_wrap(curr_priv, (void =
__user *) arg);
> -               break;
> -
> -       case AGPIOC_DEALLOCATE32:
> -               ret_val =3D agpioc_deallocate_wrap(curr_priv, (int) arg);
> -               break;
> -
> -       case AGPIOC_BIND32:
> -               ret_val =3D compat_agpioc_bind_wrap(curr_priv, (void __us=
er *) arg);
> -               break;
> -
> -       case AGPIOC_UNBIND32:
> -               ret_val =3D compat_agpioc_unbind_wrap(curr_priv, (void __=
user *) arg);
> -               break;
> -
> -       case AGPIOC_CHIPSET_FLUSH32:
> -               break;
> -       }
> -
> -ioctl_out:
> -       DBG("ioctl returns %d\n", ret_val);
> -       mutex_unlock(&(agp_fe.agp_mutex));
> -       return ret_val;
> -}
> -
> diff --git a/drivers/char/agp/compat_ioctl.h b/drivers/char/agp/compat_io=
ctl.h
> deleted file mode 100644
> index f30e0fd979635..0000000000000
> --- a/drivers/char/agp/compat_ioctl.h
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -/*
> - * Copyright (C) 1999 Jeff Hartmann
> - * Copyright (C) 1999 Precision Insight, Inc.
> - * Copyright (C) 1999 Xi Graphics, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed
> - * in all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS
> - * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * JEFF HARTMANN, OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
> - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
> - * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef _AGP_COMPAT_IOCTL_H
> -#define _AGP_COMPAT_IOCTL_H
> -
> -#include <linux/compat.h>
> -#include <linux/agpgart.h>
> -
> -#define AGPIOC_INFO32       _IOR (AGPIOC_BASE, 0, compat_uptr_t)
> -#define AGPIOC_ACQUIRE32    _IO  (AGPIOC_BASE, 1)
> -#define AGPIOC_RELEASE32    _IO  (AGPIOC_BASE, 2)
> -#define AGPIOC_SETUP32      _IOW (AGPIOC_BASE, 3, compat_uptr_t)
> -#define AGPIOC_RESERVE32    _IOW (AGPIOC_BASE, 4, compat_uptr_t)
> -#define AGPIOC_PROTECT32    _IOW (AGPIOC_BASE, 5, compat_uptr_t)
> -#define AGPIOC_ALLOCATE32   _IOWR(AGPIOC_BASE, 6, compat_uptr_t)
> -#define AGPIOC_DEALLOCATE32 _IOW (AGPIOC_BASE, 7, compat_int_t)
> -#define AGPIOC_BIND32       _IOW (AGPIOC_BASE, 8, compat_uptr_t)
> -#define AGPIOC_UNBIND32     _IOW (AGPIOC_BASE, 9, compat_uptr_t)
> -#define AGPIOC_CHIPSET_FLUSH32 _IO (AGPIOC_BASE, 10)
> -
> -struct agp_info32 {
> -       struct agp_version version;     /* version of the driver        *=
/
> -       u32 bridge_id;          /* bridge vendor/device         */
> -       u32 agp_mode;           /* mode info of bridge          */
> -       compat_long_t aper_base;        /* base of aperture             *=
/
> -       compat_size_t aper_size;        /* size of aperture             *=
/
> -       compat_size_t pg_total; /* max pages (swap + system)    */
> -       compat_size_t pg_system;        /* max pages (system)           *=
/
> -       compat_size_t pg_used;          /* current pages used           *=
/
> -};
> -
> -/*
> - * The "prot" down below needs still a "sleep" flag somehow ...
> - */
> -struct agp_segment32 {
> -       compat_off_t pg_start;          /* starting page to populate    *=
/
> -       compat_size_t pg_count; /* number of pages              */
> -       compat_int_t prot;              /* prot flags for mmap          *=
/
> -};
> -
> -struct agp_region32 {
> -       compat_pid_t pid;               /* pid of process               *=
/
> -       compat_size_t seg_count;        /* number of segments           *=
/
> -       struct agp_segment32 *seg_list;
> -};
> -
> -struct agp_allocate32 {
> -       compat_int_t key;               /* tag of allocation            *=
/
> -       compat_size_t pg_count; /* number of pages              */
> -       u32 type;               /* 0 =3D=3D normal, other devspec   */
> -       u32 physical;           /* device specific (some devices
> -                                * need a phys address of the
> -                                * actual page behind the gatt
> -                                * table)                        */
> -};
> -
> -struct agp_bind32 {
> -       compat_int_t key;               /* tag of allocation            *=
/
> -       compat_off_t pg_start;          /* starting page to populate    *=
/
> -};
> -
> -struct agp_unbind32 {
> -       compat_int_t key;               /* tag of allocation            *=
/
> -       u32 priority;           /* priority for paging out      */
> -};
> -
> -extern struct agp_front_data agp_fe;
> -
> -int agpioc_acquire_wrap(struct agp_file_private *priv);
> -int agpioc_release_wrap(struct agp_file_private *priv);
> -int agpioc_protect_wrap(struct agp_file_private *priv);
> -int agpioc_setup_wrap(struct agp_file_private *priv, void __user *arg);
> -int agpioc_deallocate_wrap(struct agp_file_private *priv, int arg);
> -struct agp_file_private *agp_find_private(pid_t pid);
> -struct agp_client *agp_create_client(pid_t id);
> -int agp_remove_client(pid_t id);
> -int agp_create_segment(struct agp_client *client, struct agp_region *reg=
ion);
> -void agp_free_memory_wrap(struct agp_memory *memory);
> -struct agp_memory *agp_allocate_memory_wrap(size_t pg_count, u32 type);
> -struct agp_memory *agp_find_mem_by_key(int key);
> -struct agp_client *agp_find_client_by_pid(pid_t id);
> -
> -#endif /* _AGP_COMPAT_H */
> diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
> deleted file mode 100644
> index 321118a9cfa52..0000000000000
> --- a/drivers/char/agp/frontend.c
> +++ /dev/null
> @@ -1,1068 +0,0 @@
> -/*
> - * AGPGART driver frontend
> - * Copyright (C) 2004 Silicon Graphics, Inc.
> - * Copyright (C) 2002-2003 Dave Jones
> - * Copyright (C) 1999 Jeff Hartmann
> - * Copyright (C) 1999 Precision Insight, Inc.
> - * Copyright (C) 1999 Xi Graphics, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed
> - * in all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS
> - * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * JEFF HARTMANN, OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
> - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
> - * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#include <linux/types.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mman.h>
> -#include <linux/pci.h>
> -#include <linux/miscdevice.h>
> -#include <linux/agp_backend.h>
> -#include <linux/agpgart.h>
> -#include <linux/slab.h>
> -#include <linux/mm.h>
> -#include <linux/fs.h>
> -#include <linux/sched.h>
> -#include <linux/uaccess.h>
> -
> -#include "agp.h"
> -#include "compat_ioctl.h"
> -
> -struct agp_front_data agp_fe;
> -
> -struct agp_memory *agp_find_mem_by_key(int key)
> -{
> -       struct agp_memory *curr;
> -
> -       if (agp_fe.current_controller =3D=3D NULL)
> -               return NULL;
> -
> -       curr =3D agp_fe.current_controller->pool;
> -
> -       while (curr !=3D NULL) {
> -               if (curr->key =3D=3D key)
> -                       break;
> -               curr =3D curr->next;
> -       }
> -
> -       DBG("key=3D%d -> mem=3D%p", key, curr);
> -       return curr;
> -}
> -
> -static void agp_remove_from_pool(struct agp_memory *temp)
> -{
> -       struct agp_memory *prev;
> -       struct agp_memory *next;
> -
> -       /* Check to see if this is even in the memory pool */
> -
> -       DBG("mem=3D%p", temp);
> -       if (agp_find_mem_by_key(temp->key) !=3D NULL) {
> -               next =3D temp->next;
> -               prev =3D temp->prev;
> -
> -               if (prev !=3D NULL) {
> -                       prev->next =3D next;
> -                       if (next !=3D NULL)
> -                               next->prev =3D prev;
> -
> -               } else {
> -                       /* This is the first item on the list */
> -                       if (next !=3D NULL)
> -                               next->prev =3D NULL;
> -
> -                       agp_fe.current_controller->pool =3D next;
> -               }
> -       }
> -}
> -
> -/*
> - * Routines for managing each client's segment list -
> - * These routines handle adding and removing segments
> - * to each auth'ed client.
> - */
> -
> -static struct
> -agp_segment_priv *agp_find_seg_in_client(const struct agp_client *client=
,
> -                                               unsigned long offset,
> -                                           int size, pgprot_t page_prot)
> -{
> -       struct agp_segment_priv *seg;
> -       int i;
> -       off_t pg_start;
> -       size_t pg_count;
> -
> -       pg_start =3D offset / 4096;
> -       pg_count =3D size / 4096;
> -       seg =3D *(client->segments);
> -
> -       for (i =3D 0; i < client->num_segments; i++) {
> -               if ((seg[i].pg_start =3D=3D pg_start) &&
> -                   (seg[i].pg_count =3D=3D pg_count) &&
> -                   (pgprot_val(seg[i].prot) =3D=3D pgprot_val(page_prot)=
)) {
> -                       return seg + i;
> -               }
> -       }
> -
> -       return NULL;
> -}
> -
> -static void agp_remove_seg_from_client(struct agp_client *client)
> -{
> -       DBG("client=3D%p", client);
> -
> -       if (client->segments !=3D NULL) {
> -               if (*(client->segments) !=3D NULL) {
> -                       DBG("Freeing %p from client %p", *(client->segmen=
ts), client);
> -                       kfree(*(client->segments));
> -               }
> -               DBG("Freeing %p from client %p", client->segments, client=
);
> -               kfree(client->segments);
> -               client->segments =3D NULL;
> -       }
> -}
> -
> -static void agp_add_seg_to_client(struct agp_client *client,
> -                              struct agp_segment_priv ** seg, int num_se=
gments)
> -{
> -       struct agp_segment_priv **prev_seg;
> -
> -       prev_seg =3D client->segments;
> -
> -       if (prev_seg !=3D NULL)
> -               agp_remove_seg_from_client(client);
> -
> -       DBG("Adding seg %p (%d segments) to client %p", seg, num_segments=
, client);
> -       client->num_segments =3D num_segments;
> -       client->segments =3D seg;
> -}
> -
> -static pgprot_t agp_convert_mmap_flags(int prot)
> -{
> -       unsigned long prot_bits;
> -
> -       prot_bits =3D calc_vm_prot_bits(prot, 0) | VM_SHARED;
> -       return vm_get_page_prot(prot_bits);
> -}
> -
> -int agp_create_segment(struct agp_client *client, struct agp_region *reg=
ion)
> -{
> -       struct agp_segment_priv **ret_seg;
> -       struct agp_segment_priv *seg;
> -       struct agp_segment *user_seg;
> -       size_t i;
> -
> -       seg =3D kzalloc((sizeof(struct agp_segment_priv) * region->seg_co=
unt), GFP_KERNEL);
> -       if (seg =3D=3D NULL) {
> -               kfree(region->seg_list);
> -               region->seg_list =3D NULL;
> -               return -ENOMEM;
> -       }
> -       user_seg =3D region->seg_list;
> -
> -       for (i =3D 0; i < region->seg_count; i++) {
> -               seg[i].pg_start =3D user_seg[i].pg_start;
> -               seg[i].pg_count =3D user_seg[i].pg_count;
> -               seg[i].prot =3D agp_convert_mmap_flags(user_seg[i].prot);
> -       }
> -       kfree(region->seg_list);
> -       region->seg_list =3D NULL;
> -
> -       ret_seg =3D kmalloc(sizeof(void *), GFP_KERNEL);
> -       if (ret_seg =3D=3D NULL) {
> -               kfree(seg);
> -               return -ENOMEM;
> -       }
> -       *ret_seg =3D seg;
> -       agp_add_seg_to_client(client, ret_seg, region->seg_count);
> -       return 0;
> -}
> -
> -/* End - Routines for managing each client's segment list */
> -
> -/* This function must only be called when current_controller !=3D NULL *=
/
> -static void agp_insert_into_pool(struct agp_memory * temp)
> -{
> -       struct agp_memory *prev;
> -
> -       prev =3D agp_fe.current_controller->pool;
> -
> -       if (prev !=3D NULL) {
> -               prev->prev =3D temp;
> -               temp->next =3D prev;
> -       }
> -       agp_fe.current_controller->pool =3D temp;
> -}
> -
> -
> -/* File private list routines */
> -
> -struct agp_file_private *agp_find_private(pid_t pid)
> -{
> -       struct agp_file_private *curr;
> -
> -       curr =3D agp_fe.file_priv_list;
> -
> -       while (curr !=3D NULL) {
> -               if (curr->my_pid =3D=3D pid)
> -                       return curr;
> -               curr =3D curr->next;
> -       }
> -
> -       return NULL;
> -}
> -
> -static void agp_insert_file_private(struct agp_file_private * priv)
> -{
> -       struct agp_file_private *prev;
> -
> -       prev =3D agp_fe.file_priv_list;
> -
> -       if (prev !=3D NULL)
> -               prev->prev =3D priv;
> -       priv->next =3D prev;
> -       agp_fe.file_priv_list =3D priv;
> -}
> -
> -static void agp_remove_file_private(struct agp_file_private * priv)
> -{
> -       struct agp_file_private *next;
> -       struct agp_file_private *prev;
> -
> -       next =3D priv->next;
> -       prev =3D priv->prev;
> -
> -       if (prev !=3D NULL) {
> -               prev->next =3D next;
> -
> -               if (next !=3D NULL)
> -                       next->prev =3D prev;
> -
> -       } else {
> -               if (next !=3D NULL)
> -                       next->prev =3D NULL;
> -
> -               agp_fe.file_priv_list =3D next;
> -       }
> -}
> -
> -/* End - File flag list routines */
> -
> -/*
> - * Wrappers for agp_free_memory & agp_allocate_memory
> - * These make sure that internal lists are kept updated.
> - */
> -void agp_free_memory_wrap(struct agp_memory *memory)
> -{
> -       agp_remove_from_pool(memory);
> -       agp_free_memory(memory);
> -}
> -
> -struct agp_memory *agp_allocate_memory_wrap(size_t pg_count, u32 type)
> -{
> -       struct agp_memory *memory;
> -
> -       memory =3D agp_allocate_memory(agp_bridge, pg_count, type);
> -       if (memory =3D=3D NULL)
> -               return NULL;
> -
> -       agp_insert_into_pool(memory);
> -       return memory;
> -}
> -
> -/* Routines for managing the list of controllers -
> - * These routines manage the current controller, and the list of
> - * controllers
> - */
> -
> -static struct agp_controller *agp_find_controller_by_pid(pid_t id)
> -{
> -       struct agp_controller *controller;
> -
> -       controller =3D agp_fe.controllers;
> -
> -       while (controller !=3D NULL) {
> -               if (controller->pid =3D=3D id)
> -                       return controller;
> -               controller =3D controller->next;
> -       }
> -
> -       return NULL;
> -}
> -
> -static struct agp_controller *agp_create_controller(pid_t id)
> -{
> -       struct agp_controller *controller;
> -
> -       controller =3D kzalloc(sizeof(struct agp_controller), GFP_KERNEL)=
;
> -       if (controller =3D=3D NULL)
> -               return NULL;
> -
> -       controller->pid =3D id;
> -       return controller;
> -}
> -
> -static int agp_insert_controller(struct agp_controller *controller)
> -{
> -       struct agp_controller *prev_controller;
> -
> -       prev_controller =3D agp_fe.controllers;
> -       controller->next =3D prev_controller;
> -
> -       if (prev_controller !=3D NULL)
> -               prev_controller->prev =3D controller;
> -
> -       agp_fe.controllers =3D controller;
> -
> -       return 0;
> -}
> -
> -static void agp_remove_all_clients(struct agp_controller *controller)
> -{
> -       struct agp_client *client;
> -       struct agp_client *temp;
> -
> -       client =3D controller->clients;
> -
> -       while (client) {
> -               struct agp_file_private *priv;
> -
> -               temp =3D client;
> -               agp_remove_seg_from_client(temp);
> -               priv =3D agp_find_private(temp->pid);
> -
> -               if (priv !=3D NULL) {
> -                       clear_bit(AGP_FF_IS_VALID, &priv->access_flags);
> -                       clear_bit(AGP_FF_IS_CLIENT, &priv->access_flags);
> -               }
> -               client =3D client->next;
> -               kfree(temp);
> -       }
> -}
> -
> -static void agp_remove_all_memory(struct agp_controller *controller)
> -{
> -       struct agp_memory *memory;
> -       struct agp_memory *temp;
> -
> -       memory =3D controller->pool;
> -
> -       while (memory) {
> -               temp =3D memory;
> -               memory =3D memory->next;
> -               agp_free_memory_wrap(temp);
> -       }
> -}
> -
> -static int agp_remove_controller(struct agp_controller *controller)
> -{
> -       struct agp_controller *prev_controller;
> -       struct agp_controller *next_controller;
> -
> -       prev_controller =3D controller->prev;
> -       next_controller =3D controller->next;
> -
> -       if (prev_controller !=3D NULL) {
> -               prev_controller->next =3D next_controller;
> -               if (next_controller !=3D NULL)
> -                       next_controller->prev =3D prev_controller;
> -
> -       } else {
> -               if (next_controller !=3D NULL)
> -                       next_controller->prev =3D NULL;
> -
> -               agp_fe.controllers =3D next_controller;
> -       }
> -
> -       agp_remove_all_memory(controller);
> -       agp_remove_all_clients(controller);
> -
> -       if (agp_fe.current_controller =3D=3D controller) {
> -               agp_fe.current_controller =3D NULL;
> -               agp_fe.backend_acquired =3D false;
> -               agp_backend_release(agp_bridge);
> -       }
> -       kfree(controller);
> -       return 0;
> -}
> -
> -static void agp_controller_make_current(struct agp_controller *controlle=
r)
> -{
> -       struct agp_client *clients;
> -
> -       clients =3D controller->clients;
> -
> -       while (clients !=3D NULL) {
> -               struct agp_file_private *priv;
> -
> -               priv =3D agp_find_private(clients->pid);
> -
> -               if (priv !=3D NULL) {
> -                       set_bit(AGP_FF_IS_VALID, &priv->access_flags);
> -                       set_bit(AGP_FF_IS_CLIENT, &priv->access_flags);
> -               }
> -               clients =3D clients->next;
> -       }
> -
> -       agp_fe.current_controller =3D controller;
> -}
> -
> -static void agp_controller_release_current(struct agp_controller *contro=
ller,
> -                                     struct agp_file_private *controller=
_priv)
> -{
> -       struct agp_client *clients;
> -
> -       clear_bit(AGP_FF_IS_VALID, &controller_priv->access_flags);
> -       clients =3D controller->clients;
> -
> -       while (clients !=3D NULL) {
> -               struct agp_file_private *priv;
> -
> -               priv =3D agp_find_private(clients->pid);
> -
> -               if (priv !=3D NULL)
> -                       clear_bit(AGP_FF_IS_VALID, &priv->access_flags);
> -
> -               clients =3D clients->next;
> -       }
> -
> -       agp_fe.current_controller =3D NULL;
> -       agp_fe.used_by_controller =3D false;
> -       agp_backend_release(agp_bridge);
> -}
> -
> -/*
> - * Routines for managing client lists -
> - * These routines are for managing the list of auth'ed clients.
> - */
> -
> -static struct agp_client
> -*agp_find_client_in_controller(struct agp_controller *controller, pid_t =
id)
> -{
> -       struct agp_client *client;
> -
> -       if (controller =3D=3D NULL)
> -               return NULL;
> -
> -       client =3D controller->clients;
> -
> -       while (client !=3D NULL) {
> -               if (client->pid =3D=3D id)
> -                       return client;
> -               client =3D client->next;
> -       }
> -
> -       return NULL;
> -}
> -
> -static struct agp_controller *agp_find_controller_for_client(pid_t id)
> -{
> -       struct agp_controller *controller;
> -
> -       controller =3D agp_fe.controllers;
> -
> -       while (controller !=3D NULL) {
> -               if ((agp_find_client_in_controller(controller, id)) !=3D =
NULL)
> -                       return controller;
> -               controller =3D controller->next;
> -       }
> -
> -       return NULL;
> -}
> -
> -struct agp_client *agp_find_client_by_pid(pid_t id)
> -{
> -       struct agp_client *temp;
> -
> -       if (agp_fe.current_controller =3D=3D NULL)
> -               return NULL;
> -
> -       temp =3D agp_find_client_in_controller(agp_fe.current_controller,=
 id);
> -       return temp;
> -}
> -
> -static void agp_insert_client(struct agp_client *client)
> -{
> -       struct agp_client *prev_client;
> -
> -       prev_client =3D agp_fe.current_controller->clients;
> -       client->next =3D prev_client;
> -
> -       if (prev_client !=3D NULL)
> -               prev_client->prev =3D client;
> -
> -       agp_fe.current_controller->clients =3D client;
> -       agp_fe.current_controller->num_clients++;
> -}
> -
> -struct agp_client *agp_create_client(pid_t id)
> -{
> -       struct agp_client *new_client;
> -
> -       new_client =3D kzalloc(sizeof(struct agp_client), GFP_KERNEL);
> -       if (new_client =3D=3D NULL)
> -               return NULL;
> -
> -       new_client->pid =3D id;
> -       agp_insert_client(new_client);
> -       return new_client;
> -}
> -
> -int agp_remove_client(pid_t id)
> -{
> -       struct agp_client *client;
> -       struct agp_client *prev_client;
> -       struct agp_client *next_client;
> -       struct agp_controller *controller;
> -
> -       controller =3D agp_find_controller_for_client(id);
> -       if (controller =3D=3D NULL)
> -               return -EINVAL;
> -
> -       client =3D agp_find_client_in_controller(controller, id);
> -       if (client =3D=3D NULL)
> -               return -EINVAL;
> -
> -       prev_client =3D client->prev;
> -       next_client =3D client->next;
> -
> -       if (prev_client !=3D NULL) {
> -               prev_client->next =3D next_client;
> -               if (next_client !=3D NULL)
> -                       next_client->prev =3D prev_client;
> -
> -       } else {
> -               if (next_client !=3D NULL)
> -                       next_client->prev =3D NULL;
> -               controller->clients =3D next_client;
> -       }
> -
> -       controller->num_clients--;
> -       agp_remove_seg_from_client(client);
> -       kfree(client);
> -       return 0;
> -}
> -
> -/* End - Routines for managing client lists */
> -
> -/* File Operations */
> -
> -static int agp_mmap(struct file *file, struct vm_area_struct *vma)
> -{
> -       unsigned int size, current_size;
> -       unsigned long offset;
> -       struct agp_client *client;
> -       struct agp_file_private *priv =3D file->private_data;
> -       struct agp_kern_info kerninfo;
> -
> -       mutex_lock(&(agp_fe.agp_mutex));
> -
> -       if (agp_fe.backend_acquired !=3D true)
> -               goto out_eperm;
> -
> -       if (!(test_bit(AGP_FF_IS_VALID, &priv->access_flags)))
> -               goto out_eperm;
> -
> -       agp_copy_info(agp_bridge, &kerninfo);
> -       size =3D vma->vm_end - vma->vm_start;
> -       current_size =3D kerninfo.aper_size;
> -       current_size =3D current_size * 0x100000;
> -       offset =3D vma->vm_pgoff << PAGE_SHIFT;
> -       DBG("%lx:%lx", offset, offset+size);
> -
> -       if (test_bit(AGP_FF_IS_CLIENT, &priv->access_flags)) {
> -               if ((size + offset) > current_size)
> -                       goto out_inval;
> -
> -               client =3D agp_find_client_by_pid(current->pid);
> -
> -               if (client =3D=3D NULL)
> -                       goto out_eperm;
> -
> -               if (!agp_find_seg_in_client(client, offset, size, vma->vm=
_page_prot))
> -                       goto out_inval;
> -
> -               DBG("client vm_ops=3D%p", kerninfo.vm_ops);
> -               if (kerninfo.vm_ops) {
> -                       vma->vm_ops =3D kerninfo.vm_ops;
> -               } else if (io_remap_pfn_range(vma, vma->vm_start,
> -                               (kerninfo.aper_base + offset) >> PAGE_SHI=
FT,
> -                               size,
> -                               pgprot_writecombine(vma->vm_page_prot))) =
{
> -                       goto out_again;
> -               }
> -               mutex_unlock(&(agp_fe.agp_mutex));
> -               return 0;
> -       }
> -
> -       if (test_bit(AGP_FF_IS_CONTROLLER, &priv->access_flags)) {
> -               if (size !=3D current_size)
> -                       goto out_inval;
> -
> -               DBG("controller vm_ops=3D%p", kerninfo.vm_ops);
> -               if (kerninfo.vm_ops) {
> -                       vma->vm_ops =3D kerninfo.vm_ops;
> -               } else if (io_remap_pfn_range(vma, vma->vm_start,
> -                               kerninfo.aper_base >> PAGE_SHIFT,
> -                               size,
> -                               pgprot_writecombine(vma->vm_page_prot))) =
{
> -                       goto out_again;
> -               }
> -               mutex_unlock(&(agp_fe.agp_mutex));
> -               return 0;
> -       }
> -
> -out_eperm:
> -       mutex_unlock(&(agp_fe.agp_mutex));
> -       return -EPERM;
> -
> -out_inval:
> -       mutex_unlock(&(agp_fe.agp_mutex));
> -       return -EINVAL;
> -
> -out_again:
> -       mutex_unlock(&(agp_fe.agp_mutex));
> -       return -EAGAIN;
> -}
> -
> -static int agp_release(struct inode *inode, struct file *file)
> -{
> -       struct agp_file_private *priv =3D file->private_data;
> -
> -       mutex_lock(&(agp_fe.agp_mutex));
> -
> -       DBG("priv=3D%p", priv);
> -
> -       if (test_bit(AGP_FF_IS_CONTROLLER, &priv->access_flags)) {
> -               struct agp_controller *controller;
> -
> -               controller =3D agp_find_controller_by_pid(priv->my_pid);
> -
> -               if (controller !=3D NULL) {
> -                       if (controller =3D=3D agp_fe.current_controller)
> -                               agp_controller_release_current(controller=
, priv);
> -                       agp_remove_controller(controller);
> -                       controller =3D NULL;
> -               }
> -       }
> -
> -       if (test_bit(AGP_FF_IS_CLIENT, &priv->access_flags))
> -               agp_remove_client(priv->my_pid);
> -
> -       agp_remove_file_private(priv);
> -       kfree(priv);
> -       file->private_data =3D NULL;
> -       mutex_unlock(&(agp_fe.agp_mutex));
> -       return 0;
> -}
> -
> -static int agp_open(struct inode *inode, struct file *file)
> -{
> -       int minor =3D iminor(inode);
> -       struct agp_file_private *priv;
> -       struct agp_client *client;
> -
> -       if (minor !=3D AGPGART_MINOR)
> -               return -ENXIO;
> -
> -       mutex_lock(&(agp_fe.agp_mutex));
> -
> -       priv =3D kzalloc(sizeof(struct agp_file_private), GFP_KERNEL);
> -       if (priv =3D=3D NULL) {
> -               mutex_unlock(&(agp_fe.agp_mutex));
> -               return -ENOMEM;
> -       }
> -
> -       set_bit(AGP_FF_ALLOW_CLIENT, &priv->access_flags);
> -       priv->my_pid =3D current->pid;
> -
> -       if (capable(CAP_SYS_RAWIO))
> -               /* Root priv, can be controller */
> -               set_bit(AGP_FF_ALLOW_CONTROLLER, &priv->access_flags);
> -
> -       client =3D agp_find_client_by_pid(current->pid);
> -
> -       if (client !=3D NULL) {
> -               set_bit(AGP_FF_IS_CLIENT, &priv->access_flags);
> -               set_bit(AGP_FF_IS_VALID, &priv->access_flags);
> -       }
> -       file->private_data =3D (void *) priv;
> -       agp_insert_file_private(priv);
> -       DBG("private=3D%p, client=3D%p", priv, client);
> -
> -       mutex_unlock(&(agp_fe.agp_mutex));
> -
> -       return 0;
> -}
> -
> -static int agpioc_info_wrap(struct agp_file_private *priv, void __user *=
arg)
> -{
> -       struct agp_info userinfo;
> -       struct agp_kern_info kerninfo;
> -
> -       agp_copy_info(agp_bridge, &kerninfo);
> -
> -       memset(&userinfo, 0, sizeof(userinfo));
> -       userinfo.version.major =3D kerninfo.version.major;
> -       userinfo.version.minor =3D kerninfo.version.minor;
> -       userinfo.bridge_id =3D kerninfo.device->vendor |
> -           (kerninfo.device->device << 16);
> -       userinfo.agp_mode =3D kerninfo.mode;
> -       userinfo.aper_base =3D kerninfo.aper_base;
> -       userinfo.aper_size =3D kerninfo.aper_size;
> -       userinfo.pg_total =3D userinfo.pg_system =3D kerninfo.max_memory;
> -       userinfo.pg_used =3D kerninfo.current_memory;
> -
> -       if (copy_to_user(arg, &userinfo, sizeof(struct agp_info)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -int agpioc_acquire_wrap(struct agp_file_private *priv)
> -{
> -       struct agp_controller *controller;
> -
> -       DBG("");
> -
> -       if (!(test_bit(AGP_FF_ALLOW_CONTROLLER, &priv->access_flags)))
> -               return -EPERM;
> -
> -       if (agp_fe.current_controller !=3D NULL)
> -               return -EBUSY;
> -
> -       if (!agp_bridge)
> -               return -ENODEV;
> -
> -        if (atomic_read(&agp_bridge->agp_in_use))
> -                return -EBUSY;
> -
> -       atomic_inc(&agp_bridge->agp_in_use);
> -
> -       agp_fe.backend_acquired =3D true;
> -
> -       controller =3D agp_find_controller_by_pid(priv->my_pid);
> -
> -       if (controller !=3D NULL) {
> -               agp_controller_make_current(controller);
> -       } else {
> -               controller =3D agp_create_controller(priv->my_pid);
> -
> -               if (controller =3D=3D NULL) {
> -                       agp_fe.backend_acquired =3D false;
> -                       agp_backend_release(agp_bridge);
> -                       return -ENOMEM;
> -               }
> -               agp_insert_controller(controller);
> -               agp_controller_make_current(controller);
> -       }
> -
> -       set_bit(AGP_FF_IS_CONTROLLER, &priv->access_flags);
> -       set_bit(AGP_FF_IS_VALID, &priv->access_flags);
> -       return 0;
> -}
> -
> -int agpioc_release_wrap(struct agp_file_private *priv)
> -{
> -       DBG("");
> -       agp_controller_release_current(agp_fe.current_controller, priv);
> -       return 0;
> -}
> -
> -int agpioc_setup_wrap(struct agp_file_private *priv, void __user *arg)
> -{
> -       struct agp_setup mode;
> -
> -       DBG("");
> -       if (copy_from_user(&mode, arg, sizeof(struct agp_setup)))
> -               return -EFAULT;
> -
> -       agp_enable(agp_bridge, mode.agp_mode);
> -       return 0;
> -}
> -
> -static int agpioc_reserve_wrap(struct agp_file_private *priv, void __use=
r *arg)
> -{
> -       struct agp_region reserve;
> -       struct agp_client *client;
> -       struct agp_file_private *client_priv;
> -
> -       DBG("");
> -       if (copy_from_user(&reserve, arg, sizeof(struct agp_region)))
> -               return -EFAULT;
> -
> -       if ((unsigned) reserve.seg_count >=3D ~0U/sizeof(struct agp_segme=
nt))
> -               return -EFAULT;
> -
> -       client =3D agp_find_client_by_pid(reserve.pid);
> -
> -       if (reserve.seg_count =3D=3D 0) {
> -               /* remove a client */
> -               client_priv =3D agp_find_private(reserve.pid);
> -
> -               if (client_priv !=3D NULL) {
> -                       set_bit(AGP_FF_IS_CLIENT, &client_priv->access_fl=
ags);
> -                       set_bit(AGP_FF_IS_VALID, &client_priv->access_fla=
gs);
> -               }
> -               if (client =3D=3D NULL) {
> -                       /* client is already removed */
> -                       return 0;
> -               }
> -               return agp_remove_client(reserve.pid);
> -       } else {
> -               struct agp_segment *segment;
> -
> -               if (reserve.seg_count >=3D 16384)
> -                       return -EINVAL;
> -
> -               segment =3D kmalloc((sizeof(struct agp_segment) * reserve=
.seg_count),
> -                                 GFP_KERNEL);
> -
> -               if (segment =3D=3D NULL)
> -                       return -ENOMEM;
> -
> -               if (copy_from_user(segment, (void __user *) reserve.seg_l=
ist,
> -                                  sizeof(struct agp_segment) * reserve.s=
eg_count)) {
> -                       kfree(segment);
> -                       return -EFAULT;
> -               }
> -               reserve.seg_list =3D segment;
> -
> -               if (client =3D=3D NULL) {
> -                       /* Create the client and add the segment */
> -                       client =3D agp_create_client(reserve.pid);
> -
> -                       if (client =3D=3D NULL) {
> -                               kfree(segment);
> -                               return -ENOMEM;
> -                       }
> -                       client_priv =3D agp_find_private(reserve.pid);
> -
> -                       if (client_priv !=3D NULL) {
> -                               set_bit(AGP_FF_IS_CLIENT, &client_priv->a=
ccess_flags);
> -                               set_bit(AGP_FF_IS_VALID, &client_priv->ac=
cess_flags);
> -                       }
> -               }
> -               return agp_create_segment(client, &reserve);
> -       }
> -       /* Will never really happen */
> -       return -EINVAL;
> -}
> -
> -int agpioc_protect_wrap(struct agp_file_private *priv)
> -{
> -       DBG("");
> -       /* This function is not currently implemented */
> -       return -EINVAL;
> -}
> -
> -static int agpioc_allocate_wrap(struct agp_file_private *priv, void __us=
er *arg)
> -{
> -       struct agp_memory *memory;
> -       struct agp_allocate alloc;
> -
> -       DBG("");
> -       if (copy_from_user(&alloc, arg, sizeof(struct agp_allocate)))
> -               return -EFAULT;
> -
> -       if (alloc.type >=3D AGP_USER_TYPES)
> -               return -EINVAL;
> -
> -       memory =3D agp_allocate_memory_wrap(alloc.pg_count, alloc.type);
> -
> -       if (memory =3D=3D NULL)
> -               return -ENOMEM;
> -
> -       alloc.key =3D memory->key;
> -       alloc.physical =3D memory->physical;
> -
> -       if (copy_to_user(arg, &alloc, sizeof(struct agp_allocate))) {
> -               agp_free_memory_wrap(memory);
> -               return -EFAULT;
> -       }
> -       return 0;
> -}
> -
> -int agpioc_deallocate_wrap(struct agp_file_private *priv, int arg)
> -{
> -       struct agp_memory *memory;
> -
> -       DBG("");
> -       memory =3D agp_find_mem_by_key(arg);
> -
> -       if (memory =3D=3D NULL)
> -               return -EINVAL;
> -
> -       agp_free_memory_wrap(memory);
> -       return 0;
> -}
> -
> -static int agpioc_bind_wrap(struct agp_file_private *priv, void __user *=
arg)
> -{
> -       struct agp_bind bind_info;
> -       struct agp_memory *memory;
> -
> -       DBG("");
> -       if (copy_from_user(&bind_info, arg, sizeof(struct agp_bind)))
> -               return -EFAULT;
> -
> -       memory =3D agp_find_mem_by_key(bind_info.key);
> -
> -       if (memory =3D=3D NULL)
> -               return -EINVAL;
> -
> -       return agp_bind_memory(memory, bind_info.pg_start);
> -}
> -
> -static int agpioc_unbind_wrap(struct agp_file_private *priv, void __user=
 *arg)
> -{
> -       struct agp_memory *memory;
> -       struct agp_unbind unbind;
> -
> -       DBG("");
> -       if (copy_from_user(&unbind, arg, sizeof(struct agp_unbind)))
> -               return -EFAULT;
> -
> -       memory =3D agp_find_mem_by_key(unbind.key);
> -
> -       if (memory =3D=3D NULL)
> -               return -EINVAL;
> -
> -       return agp_unbind_memory(memory);
> -}
> -
> -static long agp_ioctl(struct file *file,
> -                    unsigned int cmd, unsigned long arg)
> -{
> -       struct agp_file_private *curr_priv =3D file->private_data;
> -       int ret_val =3D -ENOTTY;
> -
> -       DBG("priv=3D%p, cmd=3D%x", curr_priv, cmd);
> -       mutex_lock(&(agp_fe.agp_mutex));
> -
> -       if ((agp_fe.current_controller =3D=3D NULL) &&
> -           (cmd !=3D AGPIOC_ACQUIRE)) {
> -               ret_val =3D -EINVAL;
> -               goto ioctl_out;
> -       }
> -       if ((agp_fe.backend_acquired !=3D true) &&
> -           (cmd !=3D AGPIOC_ACQUIRE)) {
> -               ret_val =3D -EBUSY;
> -               goto ioctl_out;
> -       }
> -       if (cmd !=3D AGPIOC_ACQUIRE) {
> -               if (!(test_bit(AGP_FF_IS_CONTROLLER, &curr_priv->access_f=
lags))) {
> -                       ret_val =3D -EPERM;
> -                       goto ioctl_out;
> -               }
> -               /* Use the original pid of the controller,
> -                * in case it's threaded */
> -
> -               if (agp_fe.current_controller->pid !=3D curr_priv->my_pid=
) {
> -                       ret_val =3D -EBUSY;
> -                       goto ioctl_out;
> -               }
> -       }
> -
> -       switch (cmd) {
> -       case AGPIOC_INFO:
> -               ret_val =3D agpioc_info_wrap(curr_priv, (void __user *) a=
rg);
> -               break;
> -
> -       case AGPIOC_ACQUIRE:
> -               ret_val =3D agpioc_acquire_wrap(curr_priv);
> -               break;
> -
> -       case AGPIOC_RELEASE:
> -               ret_val =3D agpioc_release_wrap(curr_priv);
> -               break;
> -
> -       case AGPIOC_SETUP:
> -               ret_val =3D agpioc_setup_wrap(curr_priv, (void __user *) =
arg);
> -               break;
> -
> -       case AGPIOC_RESERVE:
> -               ret_val =3D agpioc_reserve_wrap(curr_priv, (void __user *=
) arg);
> -               break;
> -
> -       case AGPIOC_PROTECT:
> -               ret_val =3D agpioc_protect_wrap(curr_priv);
> -               break;
> -
> -       case AGPIOC_ALLOCATE:
> -               ret_val =3D agpioc_allocate_wrap(curr_priv, (void __user =
*) arg);
> -               break;
> -
> -       case AGPIOC_DEALLOCATE:
> -               ret_val =3D agpioc_deallocate_wrap(curr_priv, (int) arg);
> -               break;
> -
> -       case AGPIOC_BIND:
> -               ret_val =3D agpioc_bind_wrap(curr_priv, (void __user *) a=
rg);
> -               break;
> -
> -       case AGPIOC_UNBIND:
> -               ret_val =3D agpioc_unbind_wrap(curr_priv, (void __user *)=
 arg);
> -               break;
> -
> -       case AGPIOC_CHIPSET_FLUSH:
> -               break;
> -       }
> -
> -ioctl_out:
> -       DBG("ioctl returns %d\n", ret_val);
> -       mutex_unlock(&(agp_fe.agp_mutex));
> -       return ret_val;
> -}
> -
> -static const struct file_operations agp_fops =3D
> -{
> -       .owner          =3D THIS_MODULE,
> -       .llseek         =3D no_llseek,
> -       .unlocked_ioctl =3D agp_ioctl,
> -#ifdef CONFIG_COMPAT
> -       .compat_ioctl   =3D compat_agp_ioctl,
> -#endif
> -       .mmap           =3D agp_mmap,
> -       .open           =3D agp_open,
> -       .release        =3D agp_release,
> -};
> -
> -static struct miscdevice agp_miscdev =3D
> -{
> -       .minor  =3D AGPGART_MINOR,
> -       .name   =3D "agpgart",
> -       .fops   =3D &agp_fops
> -};
> -
> -int agp_frontend_initialize(void)
> -{
> -       memset(&agp_fe, 0, sizeof(struct agp_front_data));
> -       mutex_init(&(agp_fe.agp_mutex));
> -
> -       if (misc_register(&agp_miscdev)) {
> -               printk(KERN_ERR PFX "unable to get minor: %d\n", AGPGART_=
MINOR);
> -               return -EIO;
> -       }
> -       return 0;
> -}
> -
> -void agp_frontend_cleanup(void)
> -{
> -       misc_deregister(&agp_miscdev);
> -}
> --
> 2.42.1
>
