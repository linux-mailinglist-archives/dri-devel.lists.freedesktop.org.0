Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B7153563F
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 00:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5610FB41;
	Thu, 26 May 2022 22:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C58F10FB41
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 22:58:12 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id p190so5228195ybg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 15:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MhVmMHw7ICVhAafPllDIHwDL80t/aJRGK27p3OyO64U=;
 b=OBGE97dSjTQGlbJnPPMoD0lldvThfKV96dxtovUcGuTaHcTr/LidEmk8RnNTeIY0cl
 1aKQgS6srXQkJ8IShv18Ke43pLh8w0stRYbCOzJS0VlYfMKu7WRkmMOagXdM56ZQlXW8
 Td8SrZxLHXcWiB+SKHMSHZicMU17TXRupviimNQTdMB5v6inXrO+BvrWgAZPC/EKcqPo
 uAG7fadrXsvsV8pi/hKBzetL7sHICIAZQMQab8ZS8IlbkLqbnq1GVUtzSGdpKxyhymFc
 e7LXlYFp1S5hL8bLQ0bc8tshHiIC+M4S3RyJKWNmzB82ZRcWdWwtm23+WIzYZtTF/Jjb
 ZT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhVmMHw7ICVhAafPllDIHwDL80t/aJRGK27p3OyO64U=;
 b=a81CaOqb4cegnWxzloYF3uPm0ugngxVfFHwdQszX1hJ6kBUpJKoHfwCThzhp5F1HC0
 cpo5jFO+c7qLMLJgpdoucQCcnilHgjAOxr8HWKuB9odjl3oPEIBTMFLiMoR8qzNjeQPN
 WgOeVHhZ/WHwThAFNzlP7uFYacBY+zPRchZ5+fwinl/ENPoGaa1Po3soIy2c7kTp2OdK
 I+2GN8GEXlES8CIfwn13/SeWvSPwhjBsS+TKuLKGUME7bT8JU/Ei6vKFn1t3GX31gpO6
 IFiy5y3LZoNXtQYhbtl3Odt4OSafz7X7QbMBy5YN+ah+BMvSqay29HIUuukZS76koeEJ
 g6gg==
X-Gm-Message-State: AOAM531gOoeXI6rn1CqISlQSpH7e/nATsAPbn9YdI4qx/Q7twL1+L//a
 coWZTzTu3DEApxGJFffSBdQRrqOShCjtAu2oGuoK9g==
X-Google-Smtp-Source: ABdhPJwY7kKz4PIdqv34Y/bWWCaHiZaM4Y+zPY/MTdjVhHEUNGKHoeOf7dMU9X/PojYuec7hSZgOIo65KFlIBrqOHaA=
X-Received: by 2002:a25:9742:0:b0:64e:2c40:b33e with SMTP id
 h2-20020a259742000000b0064e2c40b33emr38025204ybo.455.1653605891184; Thu, 26
 May 2022 15:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220526174025.344908-1-contact@emersion.fr>
In-Reply-To: <20220526174025.344908-1-contact@emersion.fr>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 26 May 2022 17:58:00 -0500
Message-ID: <CAOFGe94BdiRwELFvVygdj6kTrsF5ofdxyeDG8R8yUgQR_KBQnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] dma-buf: Add a capabilities directory
To: Simon Ser <contact@emersion.fr>
Content-Type: multipart/alternative; boundary="000000000000be30a305dff21fc0"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000be30a305dff21fc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 12:40 PM Simon Ser <contact@emersion.fr> wrote:

> To discover support for new DMA-BUF IOCTLs, user-space has no
> choice but to try to perform the IOCTL on an existing DMA-BUF.
> However, user-space may want to figure out whether or not the
> IOCTL is available before it has a DMA-BUF at hand, e.g. at
> initialization time in a Wayland compositor.
>
> Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> subsystem to advertise supported features. Add a
> sync_file_import_export entry which indicates that importing and
> exporting sync_files from/to DMA-BUFs is supported.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>
> Oops, I forgot to check in new files after spliting a commit.
> Fixed.
>
> This depends on:
> https://patchwork.freedesktop.org/series/103715/
>
>  .../ABI/testing/sysfs-kernel-dmabuf-buffers   | 14 +++++
>  drivers/dma-buf/Makefile                      |  2 +-
>  drivers/dma-buf/dma-buf-sysfs-caps.c          | 51 +++++++++++++++++++
>  drivers/dma-buf/dma-buf-sysfs-caps.h          | 16 ++++++
>  drivers/dma-buf/dma-buf-sysfs-stats.c         | 13 +----
>  drivers/dma-buf/dma-buf-sysfs-stats.h         |  6 ++-
>  drivers/dma-buf/dma-buf.c                     | 43 ++++++++++++++--
>  include/uapi/linux/dma-buf.h                  |  6 +++
>  8 files changed, 133 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.c
>  create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.h
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> index 5d3bc997dc64..682d313689d8 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> @@ -22,3 +22,17 @@ KernelVersion:       v5.13
>  Contact:       Hridya Valsaraju <hridya@google.com>
>  Description:   This file is read-only and specifies the size of the
> DMA-BUF in
>                 bytes.
> +
> +What:          /sys/kernel/dmabuf/caps
> +Date:          May 2022
> +KernelVersion: v5.19
> +Contact:       Simon Ser <contact@emersion.fr>
> +Description:   This directory advertises DMA-BUF capabilities supported
> by the
> +               kernel.
> +
> +What:          /sys/kernel/dmabuf/caps/sync_file_import_export
> +Date:          May 2022
> +KernelVersion: v5.19
> +Contact:       Simon Ser <contact@emersion.fr>
> +Description:   This file is read-only and advertises support for
> importing and
> +               exporting sync_files from/to DMA-BUFs.
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 4c9eb53ba3f8..afc874272710 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y :=3D dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -        dma-resv.o
> +        dma-resv.o dma-buf-sysfs-caps.o
>  obj-$(CONFIG_DMABUF_HEAPS)     +=3D dma-heap.o
>  obj-$(CONFIG_DMABUF_HEAPS)     +=3D heaps/
>  obj-$(CONFIG_SYNC_FILE)                +=3D sync_file.o
> diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.c
> b/drivers/dma-buf/dma-buf-sysfs-caps.c
> new file mode 100644
> index 000000000000..c760e55353bc
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-caps.c
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * DMA-BUF sysfs capabilities.
> + *
> + * Copyright (C) 2022 Simon Ser
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include "dma-buf-sysfs-caps.h"
> +
> +static ssize_t sync_file_import_export_show(struct kobject *kobj,
> +                                           struct kobj_attribute *attr,
> +                                           char *buf)
> +{
> +       return sysfs_emit(buf, "1\n");
> +}
> +
> +static struct kobj_attribute dma_buf_sync_file_import_export_attr =3D
> +       __ATTR_RO(sync_file_import_export);
> +
> +static struct attribute *dma_buf_caps_attrs[] =3D {
> +       &dma_buf_sync_file_import_export_attr.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group dma_buf_caps_attr_group =3D {
> +       .attrs =3D dma_buf_caps_attrs,
> +};
> +
> +static struct kobject *dma_buf_caps_kobj;
> +
> +int dma_buf_init_sysfs_capabilities(struct kset *kset)
> +{
> +       int ret;
> +
> +       dma_buf_caps_kobj =3D kobject_create_and_add("caps", &kset->kobj)=
;
> +       if (!dma_buf_caps_kobj)
> +               return -ENOMEM;
> +
> +       ret =3D sysfs_create_group(dma_buf_caps_kobj,
> &dma_buf_caps_attr_group);
> +       if (ret)
> +               kobject_put(dma_buf_caps_kobj);
> +       return ret;
> +}
> +
> +void dma_buf_uninit_sysfs_capabilities(void)
> +{
> +       kobject_put(dma_buf_caps_kobj);
> +}
> diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.h
> b/drivers/dma-buf/dma-buf-sysfs-caps.h
> new file mode 100644
> index 000000000000..d7bcef490b31
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-caps.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * DMA-BUF sysfs capabilities.
> + *
> + * Copyright (C) 2022 Simon Ser
> + */
> +
> +#ifndef _DMA_BUF_SYSFS_CAPS_H
> +#define _DMA_BUF_SYSFS_CAPS_H
> +
> +struct kset;
> +
> +int dma_buf_init_sysfs_capabilities(struct kset *kset);
> +void dma_buf_uninit_sysfs_capabilities(void);
> +
> +#endif // _DMA_BUF_SYSFS_CAPS_H
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c
> b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 2bba0babcb62..09e43c8891d6 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -141,21 +141,13 @@ static const struct kset_uevent_ops
> dmabuf_sysfs_no_uevent_ops =3D {
>         .filter =3D dmabuf_sysfs_uevent_filter,
>  };
>
> -static struct kset *dma_buf_stats_kset;
>  static struct kset *dma_buf_per_buffer_stats_kset;
> -int dma_buf_init_sysfs_statistics(void)
> +int dma_buf_init_sysfs_statistics(struct kset *kset)
>  {
> -       dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
> -
> &dmabuf_sysfs_no_uevent_ops,
> -                                                kernel_kobj);
> -       if (!dma_buf_stats_kset)
> -               return -ENOMEM;
> -
>         dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffers",
>
> &dmabuf_sysfs_no_uevent_ops,
> -
>  &dma_buf_stats_kset->kobj);
> +                                                           &kset->kobj);
>         if (!dma_buf_per_buffer_stats_kset) {
>

You can drop the braces now.  Otherwise,

Reviewed-by: Jason Ekstrand <jason.ekstrand@collabora.com>

I've updated my Mesa MR to use this so someone should go review that patch
so we have userspace.  I've tested everything and it works nicely together.


> -               kset_unregister(dma_buf_stats_kset);
>                 return -ENOMEM;
>         }
>
> @@ -165,7 +157,6 @@ int dma_buf_init_sysfs_statistics(void)
>  void dma_buf_uninit_sysfs_statistics(void)
>  {
>         kset_unregister(dma_buf_per_buffer_stats_kset);
> -       kset_unregister(dma_buf_stats_kset);
>  }
>
>  int dma_buf_stats_setup(struct dma_buf *dmabuf)
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h
> b/drivers/dma-buf/dma-buf-sysfs-stats.h
> index a49c6e2650cc..798c54fb8ee3 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -8,9 +8,11 @@
>  #ifndef _DMA_BUF_SYSFS_STATS_H
>  #define _DMA_BUF_SYSFS_STATS_H
>
> +struct kset;
> +
>  #ifdef CONFIG_DMABUF_SYSFS_STATS
>
> -int dma_buf_init_sysfs_statistics(void);
> +int dma_buf_init_sysfs_statistics(struct kset *kset);
>  void dma_buf_uninit_sysfs_statistics(void);
>
>  int dma_buf_stats_setup(struct dma_buf *dmabuf);
> @@ -18,7 +20,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf);
>  void dma_buf_stats_teardown(struct dma_buf *dmabuf);
>  #else
>
> -static inline int dma_buf_init_sysfs_statistics(void)
> +static inline int dma_buf_init_sysfs_statistics(struct kset *kset)
>  {
>         return 0;
>  }
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5e1b0534b3ce..b5c5a5050508 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -30,6 +30,7 @@
>  #include <uapi/linux/dma-buf.h>
>  #include <uapi/linux/magic.h>
>
> +#include "dma-buf-sysfs-caps.h"
>  #include "dma-buf-sysfs-stats.h"
>
>  static inline int is_dma_buf_file(struct file *);
> @@ -1546,22 +1547,54 @@ static inline void dma_buf_uninit_debugfs(void)
>  }
>  #endif
>
> +/* Capabilities and statistics files do not need to send uevents. */
> +static int dmabuf_sysfs_uevent_filter(struct kobject *kobj)
> +{
> +       return 0;
> +}
> +
> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {
> +       .filter =3D dmabuf_sysfs_uevent_filter,
> +};
> +
> +static struct kset *dma_buf_kset;
> +
>  static int __init dma_buf_init(void)
>  {
>         int ret;
>
> -       ret =3D dma_buf_init_sysfs_statistics();
> +       dma_buf_kset =3D kset_create_and_add("dmabuf",
> +                                          &dmabuf_sysfs_no_uevent_ops,
> +                                          kernel_kobj);
> +       if (!dma_buf_kset)
> +               return -ENOMEM;
> +
> +       ret =3D dma_buf_init_sysfs_capabilities(dma_buf_kset);
>         if (ret)
> -               return ret;
> +               goto err_kset;
> +
> +       ret =3D dma_buf_init_sysfs_statistics(dma_buf_kset);
> +       if (ret)
> +               goto err_sysfs_caps;
>
>         dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
> -       if (IS_ERR(dma_buf_mnt))
> -               return PTR_ERR(dma_buf_mnt);
> +       if (IS_ERR(dma_buf_mnt)) {
> +               ret =3D PTR_ERR(dma_buf_mnt);
> +               goto err_sysfs_stats;
> +       }
>
>         mutex_init(&db_list.lock);
>         INIT_LIST_HEAD(&db_list.head);
>         dma_buf_init_debugfs();
>         return 0;
> +
> +err_sysfs_stats:
> +       dma_buf_uninit_sysfs_statistics();
> +err_sysfs_caps:
> +       dma_buf_uninit_sysfs_capabilities();
> +err_kset:
> +       kset_unregister(dma_buf_kset);
> +       return ret;
>  }
>  subsys_initcall(dma_buf_init);
>
> @@ -1570,5 +1603,7 @@ static void __exit dma_buf_deinit(void)
>         dma_buf_uninit_debugfs();
>         kern_unmount(dma_buf_mnt);
>         dma_buf_uninit_sysfs_statistics();
> +       dma_buf_uninit_sysfs_capabilities();
> +       kset_unregister(dma_buf_kset);
>  }
>  __exitcall(dma_buf_deinit);
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 70e213a0d7d9..ab3afd5da75a 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -114,6 +114,9 @@ struct dma_buf_sync {
>   * ordering via these fences, it is the respnosibility of userspace to u=
se
>   * locks or other mechanisms to ensure that no other context adds fences
> or
>   * submits work between steps 1 and 3 above.
> + *
> + * Userspace can check the availability of this API via
> + * /sys/kernel/dmabuf/caps/sync_file_import_export.
>   */
>  struct dma_buf_export_sync_file {
>         /**
> @@ -146,6 +149,9 @@ struct dma_buf_export_sync_file {
>   * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
>   * which expect implicit synchronization such as OpenGL or most media
>   * drivers/video.
> + *
> + * Userspace can check the availability of this API via
> + * /sys/kernel/dmabuf/caps/sync_file_import_export.
>   */
>  struct dma_buf_import_sync_file {
>         /**
> --
> 2.36.1
>
>
>

--000000000000be30a305dff21fc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, May 26, 2022 at 12:40 PM Simon Ser &lt;<a href=3D"mailto:con=
tact@emersion.fr">contact@emersion.fr</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">To discover support for new DMA-BUF IO=
CTLs, user-space has no<br>
choice but to try to perform the IOCTL on an existing DMA-BUF.<br>
However, user-space may want to figure out whether or not the<br>
IOCTL is available before it has a DMA-BUF at hand, e.g. at<br>
initialization time in a Wayland compositor.<br>
<br>
Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF<br>
subsystem to advertise supported features. Add a<br>
sync_file_import_export entry which indicates that importing and<br>
exporting sync_files from/to DMA-BUFs is supported.<br>
<br>
Signed-off-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=
=3D"_blank">contact@emersion.fr</a>&gt;<br>
Cc: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" target=3D"_b=
lank">jason@jlekstrand.net</a>&gt;<br>
Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_=
blank">daniel.vetter@ffwll.ch</a>&gt;<br>
Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" target=
=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com" ta=
rget=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
---<br>
<br>
Oops, I forgot to check in new files after spliting a commit.<br>
Fixed.<br>
<br>
This depends on:<br>
<a href=3D"https://patchwork.freedesktop.org/series/103715/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.freedesktop.org/series/103715/</a>=
<br>
<br>
=C2=A0.../ABI/testing/sysfs-kernel-dmabuf-buffers=C2=A0 =C2=A0| 14 +++++<br=
>
=C2=A0drivers/dma-buf/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/dma-buf/dma-buf-sysfs-caps.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 51 +++++++++++++++++++<br>
=C2=A0drivers/dma-buf/dma-buf-sysfs-caps.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 16 ++++++<br>
=C2=A0drivers/dma-buf/dma-buf-sysfs-stats.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 13 +----<br>
=C2=A0drivers/dma-buf/dma-buf-sysfs-stats.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 ++-<br>
=C2=A0drivers/dma-buf/dma-buf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 ++++++++++++++--<br>
=C2=A0include/uapi/linux/dma-buf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++<br>
=C2=A08 files changed, 133 insertions(+), 18 deletions(-)<br>
=C2=A0create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.c<br>
=C2=A0create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.h<br>
<br>
diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Docume=
ntation/ABI/testing/sysfs-kernel-dmabuf-buffers<br>
index 5d3bc997dc64..682d313689d8 100644<br>
--- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers<br>
+++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers<br>
@@ -22,3 +22,17 @@ KernelVersion:=C2=A0 =C2=A0 =C2=A0 =C2=A0v5.13<br>
=C2=A0Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0Hridya Valsaraju &lt;<a href=3D"ma=
ilto:hridya@google.com" target=3D"_blank">hridya@google.com</a>&gt;<br>
=C2=A0Description:=C2=A0 =C2=A0This file is read-only and specifies the siz=
e of the DMA-BUF in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes.<br>
+<br>
+What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/kernel/dmabuf/caps<br>
+Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 May 2022<br>
+KernelVersion: v5.19<br>
+Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0Simon Ser &lt;<a href=3D"mailto:contact=
@emersion.fr" target=3D"_blank">contact@emersion.fr</a>&gt;<br>
+Description:=C2=A0 =C2=A0This directory advertises DMA-BUF capabilities su=
pported by the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel.<br>
+<br>
+What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/kernel/dmabuf/caps/sync_file_=
import_export<br>
+Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 May 2022<br>
+KernelVersion: v5.19<br>
+Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0Simon Ser &lt;<a href=3D"mailto:contact=
@emersion.fr" target=3D"_blank">contact@emersion.fr</a>&gt;<br>
+Description:=C2=A0 =C2=A0This file is read-only and advertises support for=
 importing and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exporting sync_file=
s from/to DMA-BUFs.<br>
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile<br>
index 4c9eb53ba3f8..afc874272710 100644<br>
--- a/drivers/dma-buf/Makefile<br>
+++ b/drivers/dma-buf/Makefile<br>
@@ -1,6 +1,6 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0obj-y :=3D dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o =
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma-resv.o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma-resv.o dma-buf-sysfs-caps.o<br>
=C2=A0obj-$(CONFIG_DMABUF_HEAPS)=C2=A0 =C2=A0 =C2=A0+=3D dma-heap.o<br>
=C2=A0obj-$(CONFIG_DMABUF_HEAPS)=C2=A0 =C2=A0 =C2=A0+=3D heaps/<br>
=C2=A0obj-$(CONFIG_SYNC_FILE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 +=3D sync_file.o<br>
diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.c b/drivers/dma-buf/dma-buf=
-sysfs-caps.c<br>
new file mode 100644<br>
index 000000000000..c760e55353bc<br>
--- /dev/null<br>
+++ b/drivers/dma-buf/dma-buf-sysfs-caps.c<br>
@@ -0,0 +1,51 @@<br>
+/* SPDX-License-Identifier: GPL-2.0-only */<br>
+/*<br>
+ * DMA-BUF sysfs capabilities.<br>
+ *<br>
+ * Copyright (C) 2022 Simon Ser<br>
+ */<br>
+<br>
+#include &lt;linux/kobject.h&gt;<br>
+#include &lt;linux/sysfs.h&gt;<br>
+<br>
+#include &quot;dma-buf-sysfs-caps.h&quot;<br>
+<br>
+static ssize_t sync_file_import_export_show(struct kobject *kobj,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct kobj_attribute *attr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sysfs_emit(buf, &quot;1\n&quot;);<br>
+}<br>
+<br>
+static struct kobj_attribute dma_buf_sync_file_import_export_attr =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__ATTR_RO(sync_file_import_export);<br>
+<br>
+static struct attribute *dma_buf_caps_attrs[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dma_buf_sync_file_import_export_attr.attr,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
+};<br>
+<br>
+static const struct attribute_group dma_buf_caps_attr_group =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D dma_buf_caps_attrs,<br>
+};<br>
+<br>
+static struct kobject *dma_buf_caps_kobj;<br>
+<br>
+int dma_buf_init_sysfs_capabilities(struct kset *kset)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_caps_kobj =3D kobject_create_and_add(&q=
uot;caps&quot;, &amp;kset-&gt;kobj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dma_buf_caps_kobj)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sysfs_create_group(dma_buf_caps_kobj, &=
amp;dma_buf_caps_attr_group);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kobject_put(dma_buf=
_caps_kobj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+void dma_buf_uninit_sysfs_capabilities(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kobject_put(dma_buf_caps_kobj);<br>
+}<br>
diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.h b/drivers/dma-buf/dma-buf=
-sysfs-caps.h<br>
new file mode 100644<br>
index 000000000000..d7bcef490b31<br>
--- /dev/null<br>
+++ b/drivers/dma-buf/dma-buf-sysfs-caps.h<br>
@@ -0,0 +1,16 @@<br>
+/* SPDX-License-Identifier: GPL-2.0-only */<br>
+/*<br>
+ * DMA-BUF sysfs capabilities.<br>
+ *<br>
+ * Copyright (C) 2022 Simon Ser<br>
+ */<br>
+<br>
+#ifndef _DMA_BUF_SYSFS_CAPS_H<br>
+#define _DMA_BUF_SYSFS_CAPS_H<br>
+<br>
+struct kset;<br>
+<br>
+int dma_buf_init_sysfs_capabilities(struct kset *kset);<br>
+void dma_buf_uninit_sysfs_capabilities(void);<br>
+<br>
+#endif // _DMA_BUF_SYSFS_CAPS_H<br>
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-bu=
f-sysfs-stats.c<br>
index 2bba0babcb62..09e43c8891d6 100644<br>
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c<br>
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c<br>
@@ -141,21 +141,13 @@ static const struct kset_uevent_ops dmabuf_sysfs_no_u=
event_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .filter =3D dmabuf_sysfs_uevent_filter,<br>
=C2=A0};<br>
<br>
-static struct kset *dma_buf_stats_kset;<br>
=C2=A0static struct kset *dma_buf_per_buffer_stats_kset;<br>
-int dma_buf_init_sysfs_statistics(void)<br>
+int dma_buf_init_sysfs_statistics(struct kset *kset)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_stats_kset =3D kset_create_and_add(&quo=
t;dmabuf&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;dmabuf_sysfs_no_uevent_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 kernel_kobj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dma_buf_stats_kset)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_per_buffer_stats_kset =3D kset_create_a=
nd_add(&quot;buffers&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dmabuf_=
sysfs_no_uevent_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dma_buf_=
stats_kset-&gt;kobj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;kset-&gt=
;kobj);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dma_buf_per_buffer_stats_kset) {<br></bloc=
kquote><div><br></div><div>You can drop the braces now.=C2=A0 Otherwise,</d=
iv><div><br></div><div>Reviewed-by: Jason Ekstrand &lt;<a href=3D"mailto:ja=
son.ekstrand@collabora.com">jason.ekstrand@collabora.com</a>&gt;</div><div>=
<br></div><div>I&#39;ve updated my Mesa MR to use this so someone should go=
 review that patch so we have userspace.=C2=A0 I&#39;ve tested everything a=
nd it works nicely together.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kset_unregister(dma=
_buf_stats_kset);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -165,7 +157,6 @@ int dma_buf_init_sysfs_statistics(void)<br>
=C2=A0void dma_buf_uninit_sysfs_statistics(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kset_unregister(dma_buf_per_buffer_stats_kset);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kset_unregister(dma_buf_stats_kset);<br>
=C2=A0}<br>
<br>
=C2=A0int dma_buf_stats_setup(struct dma_buf *dmabuf)<br>
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-bu=
f-sysfs-stats.h<br>
index a49c6e2650cc..798c54fb8ee3 100644<br>
--- a/drivers/dma-buf/dma-buf-sysfs-stats.h<br>
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h<br>
@@ -8,9 +8,11 @@<br>
=C2=A0#ifndef _DMA_BUF_SYSFS_STATS_H<br>
=C2=A0#define _DMA_BUF_SYSFS_STATS_H<br>
<br>
+struct kset;<br>
+<br>
=C2=A0#ifdef CONFIG_DMABUF_SYSFS_STATS<br>
<br>
-int dma_buf_init_sysfs_statistics(void);<br>
+int dma_buf_init_sysfs_statistics(struct kset *kset);<br>
=C2=A0void dma_buf_uninit_sysfs_statistics(void);<br>
<br>
=C2=A0int dma_buf_stats_setup(struct dma_buf *dmabuf);<br>
@@ -18,7 +20,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf);<br>
=C2=A0void dma_buf_stats_teardown(struct dma_buf *dmabuf);<br>
=C2=A0#else<br>
<br>
-static inline int dma_buf_init_sysfs_statistics(void)<br>
+static inline int dma_buf_init_sysfs_statistics(struct kset *kset)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c<br>
index 5e1b0534b3ce..b5c5a5050508 100644<br>
--- a/drivers/dma-buf/dma-buf.c<br>
+++ b/drivers/dma-buf/dma-buf.c<br>
@@ -30,6 +30,7 @@<br>
=C2=A0#include &lt;uapi/linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;uapi/linux/magic.h&gt;<br>
<br>
+#include &quot;dma-buf-sysfs-caps.h&quot;<br>
=C2=A0#include &quot;dma-buf-sysfs-stats.h&quot;<br>
<br>
=C2=A0static inline int is_dma_buf_file(struct file *);<br>
@@ -1546,22 +1547,54 @@ static inline void dma_buf_uninit_debugfs(void)<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
+/* Capabilities and statistics files do not need to send uevents. */<br>
+static int dmabuf_sysfs_uevent_filter(struct kobject *kobj)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.filter =3D dmabuf_sysfs_uevent_filter,<br>
+};<br>
+<br>
+static struct kset *dma_buf_kset;<br>
+<br>
=C2=A0static int __init dma_buf_init(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_init_sysfs_statistics();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_kset =3D kset_create_and_add(&quot;dmab=
uf&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;dmabuf_sysfs_no_uevent_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=
ernel_kobj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dma_buf_kset)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_init_sysfs_capabilities(dma_buf=
_kset);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kset;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_init_sysfs_statistics(dma_buf_k=
set);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_sysfs_caps=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_mnt =3D kern_mount(&amp;dma_buf_fs_type=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dma_buf_mnt))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dma_=
buf_mnt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dma_buf_mnt)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(dma=
_buf_mnt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_sysfs_stat=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_init(&amp;db_list.lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_LIST_HEAD(&amp;db_list.head);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_init_debugfs();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+<br>
+err_sysfs_stats:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_uninit_sysfs_statistics();<br>
+err_sysfs_caps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_uninit_sysfs_capabilities();<br>
+err_kset:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kset_unregister(dma_buf_kset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
=C2=A0subsys_initcall(dma_buf_init);<br>
<br>
@@ -1570,5 +1603,7 @@ static void __exit dma_buf_deinit(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_uninit_debugfs();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kern_unmount(dma_buf_mnt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_uninit_sysfs_statistics();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_uninit_sysfs_capabilities();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kset_unregister(dma_buf_kset);<br>
=C2=A0}<br>
=C2=A0__exitcall(dma_buf_deinit);<br>
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h<br=
>
index 70e213a0d7d9..ab3afd5da75a 100644<br>
--- a/include/uapi/linux/dma-buf.h<br>
+++ b/include/uapi/linux/dma-buf.h<br>
@@ -114,6 +114,9 @@ struct dma_buf_sync {<br>
=C2=A0 * ordering via these fences, it is the respnosibility of userspace t=
o use<br>
=C2=A0 * locks or other mechanisms to ensure that no other context adds fen=
ces or<br>
=C2=A0 * submits work between steps 1 and 3 above.<br>
+ *<br>
+ * Userspace can check the availability of this API via<br>
+ * /sys/kernel/dmabuf/caps/sync_file_import_export.<br>
=C2=A0 */<br>
=C2=A0struct dma_buf_export_sync_file {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
@@ -146,6 +149,9 @@ struct dma_buf_export_sync_file {<br>
=C2=A0 * synchronized APIs such as Vulkan to inter-op with dma-buf consumer=
s<br>
=C2=A0 * which expect implicit synchronization such as OpenGL or most media=
<br>
=C2=A0 * drivers/video.<br>
+ *<br>
+ * Userspace can check the availability of this API via<br>
+ * /sys/kernel/dmabuf/caps/sync_file_import_export.<br>
=C2=A0 */<br>
=C2=A0struct dma_buf_import_sync_file {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000be30a305dff21fc0--
