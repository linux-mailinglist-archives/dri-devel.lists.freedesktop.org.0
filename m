Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB352C4C8
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 22:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6585D10E1F9;
	Wed, 18 May 2022 20:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F1910E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 20:54:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so3860981wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ctFVYwa77d5S+j41TLPnzk6Z9gclENj5erAIIp8QROY=;
 b=eN9LVVbskp0cXB30MxWUPlkRfWCxfcHB7stoJ7Zm82vyOQju5iq3mX/c+YMHvXFRl0
 jDVjwGXWSHHxn9mVt0jU8KfBKueL4A5yapGJXda9zbnpI3lX5j7f1EV0sQ67/RjY4CA3
 MT/kYQXr5LwfS66k5AMJbdpC8atnpz8EtflMds+fazokwnYsGVJGOH6tcE7icaCGjRr3
 +/TJke/ZtsWtBzVFd4QV2roEMa8AJxRVK39x3NOHyKRZTAz3yCEVj3cQIf2owkVuZMQr
 lQWZZMBsUf54YkUu4ZZOuzqxj7/T7gFWuvEZnerGMprHupD5B+k0ZP+tk2l/i4N5+ZAx
 rxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ctFVYwa77d5S+j41TLPnzk6Z9gclENj5erAIIp8QROY=;
 b=V6Iq5/+zuINr5Yzt/irLZ6Ui8m3EZsUqq8//AiCJ5ZngzQk6PkOTtTI+ngRj0GBfhr
 idzZKMop/HGB39tXY7xqs8XAPe1uvDHWT+bJxfGfoQIWYpi/Ow03aR0J0UXljh84FP7V
 XxROBTMF1l07r6Y8Zo3xrntP4r7vfZS/qdbE4Cn+P/9MR1l/LiIvHzDmq+7lrVX8lRKW
 mquuqNiLjCJYJBubOD0Y8wN2pDi1M8AMeDHfTcbuKgNjRCwrIYfJ6LsAwknoKQIKXpcJ
 iCVMFWRz2NbVIEDYDKxlTZ0v6Z4hmSI/7nHGYoajRxBRhwO/d2ckvKWHygt11b+o8kcR
 laLA==
X-Gm-Message-State: AOAM533j+kzNk4iBtEe03OLI555rdbbcfLdU6co39SP9ltclvtenTP9F
 bd7ngyuRJmkhbzLXJ+VRDMNgEeV0GX0yDpu5HFU=
X-Google-Smtp-Source: ABdhPJx2INMjssp9MXgXkR2xBshyabURLar70RsrgNxByd2jSKvl3CBQD0+IMWe/Xq3A4WLoEjEEGjVXQEeYUzK7Feo=
X-Received: by 2002:a05:600c:3d89:b0:397:104:b1c9 with SMTP id
 bi9-20020a05600c3d8900b003970104b1c9mr1052459wmb.84.1652907274516; Wed, 18
 May 2022 13:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220517174216.381287-1-adrian.larumbe@collabora.com>
 <20220517174216.381287-2-adrian.larumbe@collabora.com>
In-Reply-To: <20220517174216.381287-2-adrian.larumbe@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 18 May 2022 13:54:27 -0700
Message-ID: <CAF6AEGvcHoejVoL0Ch5k0YPG_-9jb+8LrR5YmfDNxC=sPOgB1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/panfrost: Add support for devcoredump
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 17, 2022 at 10:42 AM Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
>
> In the event of a job timeout, debug dump information will be written int=
o
> /sys/class/devcoredump.
>
> Inspired by etnaviv's similar feature.
>
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/Kconfig         |   1 +
>  drivers/gpu/drm/panfrost/Makefile        |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_dump.c | 198 +++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
>  drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
>  include/uapi/drm/panfrost_drm.h          |  32 ++++
>  6 files changed, 248 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h
>
> diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/=
Kconfig
> index 86cdc0ce79e6..079600328be1 100644
> --- a/drivers/gpu/drm/panfrost/Kconfig
> +++ b/drivers/gpu/drm/panfrost/Kconfig
> @@ -11,6 +11,7 @@ config DRM_PANFROST
>         select DRM_GEM_SHMEM_HELPER
>         select PM_DEVFREQ
>         select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +       select WANT_DEV_COREDUMP
>         help
>           DRM driver for ARM Mali Midgard (T6xx, T7xx, T8xx) and
>           Bifrost (G3x, G5x, G7x) GPUs.
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost=
/Makefile
> index b71935862417..7da2b3f02ed9 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -9,6 +9,7 @@ panfrost-y :=3D \
>         panfrost_gpu.o \
>         panfrost_job.o \
>         panfrost_mmu.o \
> -       panfrost_perfcnt.o
> +       panfrost_perfcnt.o \
> +       panfrost_dump.o
>
>  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/p=
anfrost/panfrost_dump.c
> new file mode 100644
> index 000000000000..a76dcf4acf6f
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2021 Collabora ltd. */
> +
> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/devcoredump.h>
> +#include <linux/moduleparam.h>
> +#include <linux/iosys-map.h>
> +#include <drm/panfrost_drm.h>
> +#include <drm/drm_device.h>
> +
> +#include "panfrost_job.h"
> +#include "panfrost_gem.h"
> +#include "panfrost_regs.h"
> +#include "panfrost_dump.h"
> +#include "panfrost_device.h"
> +
> +static bool panfrost_dump_core =3D true;
> +module_param_named(dump_core, panfrost_dump_core, bool, 0600);
> +
> +struct panfrost_dump_iterator {
> +       void *start;
> +       struct panfrost_dump_object_header *hdr;
> +       void *data;
> +};
> +
> +static const unsigned short panfrost_dump_registers[] =3D {
> +       GPU_ID,
> +       GPU_L2_FEATURES,
> +       GPU_CORE_FEATURES,
> +       GPU_TILER_FEATURES,
> +       GPU_MEM_FEATURES,
> +       GPU_MMU_FEATURES,
> +       GPU_AS_PRESENT,
> +       GPU_JS_PRESENT,
> +       GPU_INT_RAWSTAT,
> +       GPU_INT_CLEAR,
> +       GPU_INT_MASK,
> +       GPU_INT_STAT,
> +};
> +
> +static void panfrost_core_dump_header(struct panfrost_dump_iterator *ite=
r,
> +       u32 type, void *data_end)
> +{
> +       struct panfrost_dump_object_header *hdr =3D iter->hdr;
> +
> +       hdr->magic =3D cpu_to_le32(PANFROSTDUMP_MAGIC);
> +       hdr->type =3D cpu_to_le32(type);
> +       hdr->file_offset =3D cpu_to_le32(iter->data - iter->start);
> +       hdr->file_size =3D cpu_to_le32(data_end - iter->data);
> +
> +       iter->hdr++;
> +       iter->data +=3D le32_to_cpu(hdr->file_size);
> +}
> +
> +static void
> +panfrost_core_dump_registers(struct panfrost_dump_iterator *iter,
> +                            struct panfrost_device *pfdev)
> +{
> +       struct panfrost_dump_registers *reg =3D iter->data;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(panfrost_dump_registers); i++, reg++=
) {
> +               reg->reg =3D cpu_to_le32(panfrost_dump_registers[i]);
> +               reg->value =3D cpu_to_le32(gpu_read(pfdev, panfrost_dump_=
registers[i]));
> +       }
> +
> +       panfrost_core_dump_header(iter, PANFROSTDUMP_BUF_REG, reg);
> +}
> +
> +void panfrost_core_dump(struct panfrost_job *job)
> +{
> +       struct panfrost_device *pfdev =3D job->pfdev;
> +       struct panfrost_dump_iterator iter;
> +       struct drm_gem_object *dbo;
> +       unsigned int n_obj, n_bomap_pages;
> +       __le64 *bomap, *bomap_start;
> +       size_t file_size;
> +       int ret, i;
> +
> +       /* Only catch the first event, or when manually re-armed */
> +       if (!panfrost_dump_core)
> +               return;
> +       panfrost_dump_core =3D false;
> +
> +       /* At least, we dump registers and end marker */
> +       n_obj =3D 2;
> +       n_bomap_pages =3D 0;
> +       file_size =3D ARRAY_SIZE(panfrost_dump_registers) *
> +                       sizeof(struct panfrost_dump_registers);
> +
> +       /* Add in the active buffer objects */
> +       for (i =3D 0; i < job->bo_count; i++) {
> +               dbo =3D job->bos[i];
> +               file_size +=3D dbo->size;
> +               n_bomap_pages +=3D dbo->size >> PAGE_SHIFT;
> +               n_obj++;
> +       }
> +
> +       /* If we have any buffer objects, add a bomap object */
> +       if (n_bomap_pages) {
> +               file_size +=3D n_bomap_pages * sizeof(__le64);
> +               n_obj++;
> +       }
> +
> +       /* Add the size of the headers */
> +       file_size +=3D sizeof(*iter.hdr) * n_obj;
> +
> +       /* Allocate the file in vmalloc memory, it's likely to be big */
> +       iter.start =3D __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> +                       __GFP_NORETRY);
> +       if (!iter.start) {
> +               dev_warn(pfdev->dev, "failed to allocate devcoredump file=
\n");
> +               return;
> +       }
> +
> +       /* Point the data member after the headers */
> +       iter.hdr =3D iter.start;
> +       iter.data =3D &iter.hdr[n_obj];
> +
> +       memset(iter.hdr, 0, iter.data - iter.start);
> +
> +       /*
> +        * For now, we write the job identifier in the register dump head=
er,
> +        * so that we can decode the entire dump later with pandecode
> +        */
> +       iter.hdr->jc =3D cpu_to_le64(job->jc);
> +       iter.hdr->version =3D cpu_to_le32(PANFROSTDUMP_VERSION_1);
> +       iter.hdr->gpu_id =3D cpu_to_le32(pfdev->features.id);
> +       iter.hdr->nbos =3D cpu_to_le64(job->bo_count);
> +
> +       panfrost_core_dump_registers(&iter, pfdev);
> +
> +       /* Reserve space for the bomap */
> +       if (n_bomap_pages) {
> +               bomap_start =3D bomap =3D iter.data;
> +               memset(bomap, 0, sizeof(*bomap) * n_bomap_pages);
> +               panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BOMAP,
> +                                         bomap + n_bomap_pages);
> +       } else {
> +               /* Silence warning */
> +               bomap_start =3D bomap =3D NULL;
> +       }
> +
> +       for (i =3D 0; i < job->bo_count; i++) {
> +               struct iosys_map map;
> +               struct panfrost_gem_mapping *mapping;
> +               struct panfrost_gem_object *bo;
> +               struct sg_page_iter page_iter;
> +               void *vaddr;
> +
> +               bo =3D to_panfrost_bo(job->bos[i]);
> +               mapping =3D job->mappings[i];
> +
> +               if (!bo->base.sgt) {
> +                       dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt=
, cannot dump\n");
> +                       iter.hdr->valid =3D 0;
> +                       continue;
> +               }
> +
> +               ret =3D drm_gem_shmem_vmap(&bo->base, &map);
> +               if (ret) {
> +                       dev_err(pfdev->dev, "Panfrost Dump: couldn't map =
Buffer Object\n");
> +                       iter.hdr->valid =3D 0;
> +                       continue;
> +               }
> +
> +               WARN_ON(!mapping->active);
> +
> +               iter.hdr->data[0] =3D cpu_to_le32((bomap - bomap_start));
> +
> +               for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
> +                       struct page *page =3D sg_page_iter_page(&page_ite=
r);
> +
> +                       if (!IS_ERR(page))
> +                               *bomap++ =3D cpu_to_le64(page_to_phys(pag=
e));
> +                       else {
> +                               dev_err(pfdev->dev, "Panfrost Dump: wrong=
 page\n");
> +                               *bomap++ =3D ~cpu_to_le64(0);
> +                       }
> +               }
> +
> +               iter.hdr->iova =3D cpu_to_le64(mapping->mmnode.start << P=
AGE_SHIFT);
> +
> +               vaddr =3D map.vaddr;
> +               memcpy(iter.data, vaddr, bo->base.base.size);

I think you are going to want to invent some way to flag which buffers
you want to dump.  For example, cmdstream and cmdstream related
buffers, you want to capture.  But things that potentially texture
data, you do not for PII reasons, if this is ever wired up to distro
crash telemetry.  (Which is a thing that we've found very useful on
msm/freedreno devices.)

Looks like the panfrost submit ioctl doesn't already have per-bo
flags, but perhaps that dump flag could be a property of the GEM
object?

BR,
-R

> +
> +               drm_gem_shmem_vunmap(&bo->base, &map);
> +
> +               iter.hdr->valid =3D cpu_to_le32(1);
> +
> +               panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, ite=
r.data +
> +                                         bo->base.base.size);
> +       }
> +       panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_END, iter.data)=
;
> +
> +       dev_coredumpv(pfdev->dev, iter.start, iter.data - iter.start, GFP=
_KERNEL);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.h b/drivers/gpu/drm/p=
anfrost/panfrost_dump.h
> new file mode 100644
> index 000000000000..7d9bcefa5346
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_dump.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2021 Collabora ltd.
> + */
> +
> +#ifndef PANFROST_DUMP_H
> +#define PANFROST_DUMP_H
> +
> +struct panfrost_job;
> +void panfrost_core_dump(struct panfrost_job *job);
> +
> +#endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index fda5871aebe3..f506d0ea067c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -20,6 +20,7 @@
>  #include "panfrost_regs.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_mmu.h"
> +#include "panfrost_dump.h"
>
>  #define JOB_TIMEOUT_MS 500
>
> @@ -727,6 +728,8 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(=
struct drm_sched_job
>                 job_read(pfdev, JS_TAIL_LO(js)),
>                 sched_job);
>
> +       panfrost_core_dump(job);
> +
>         atomic_set(&pfdev->reset.pending, 1);
>         panfrost_reset(pfdev, sched_job);
>
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_=
drm.h
> index 9e40277d8185..a4e988be8478 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -224,6 +224,38 @@ struct drm_panfrost_madvise {
>         __u32 retained;       /* out, whether backing store still exists =
*/
>  };
>
> +/* Definitions for coredump decoding in user space */
> +enum {
> +       PANFROSTDUMP_MAGIC =3D 0xCAFECAFE,
> +       PANFROSTDUMP_BUF_REG =3D 0,
> +       PANFROSTDUMP_BUF_BOMAP,
> +       PANFROSTDUMP_BUF_BO,
> +       PANFROSTDUMP_BUF_END,
> +};
> +
> +#define PANFROSTDUMP_VERSION_1 1
> +
> +struct panfrost_dump_object_header {
> +       __le32 magic;
> +       __le32 type;
> +       __le32 version;
> +       __le32 bifrost;
> +       __le64 nbos;
> +       __le64 jc;
> +       __le32 file_offset;
> +       __le32 file_size;
> +       __le64 iova;
> +       __le32 gpu_id;
> +       __le32 valid;
> +       __le32 data[2];
> +};
> +
> +/* Registers object, an array of these */
> +struct panfrost_dump_registers {
> +       __le32 reg;
> +       __le32 value;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.35.1
>
