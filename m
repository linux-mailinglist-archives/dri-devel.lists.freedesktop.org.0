Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763896B730
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07FF89067;
	Wed,  4 Sep 2024 09:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uoK364oE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB2189067
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:44:46 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5df9343b5b8so4082589eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 02:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725443085; x=1726047885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2jCB3Mh2D7e/fKcpdcpOCelHevV01EHEW0KXFzYpnE=;
 b=uoK364oEyEAbGIE0tYxOGSxKQllfPKz1lvrI2nm5L/aFx51/daRw9THbLlv3SSxPuB
 cJhM+SUGJ1BGeUDcH0nxZSHUUoeSnjbgSFUZU7IubNfLO6AymZaeSjKCuZcdE7g3jffK
 7twFSntl50tk2DSfexIK1XRxLrGEbQs9zYFhUI1oGGDljoc06+qWMj6ADh6a9NgLKjmh
 pXsiF2XVCD39EgjvQ7Jf0iLK2rTfneUHArYdyA5gB2dRWjJ3q9H4EGLf6vO4jqvI5p5W
 Q7wcy9WueOxJwpYCDLys5yhdMZzp0ZtFHFUuDHTARdMaNlvixQQRY8KuKpmNdgsLBir4
 8cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725443085; x=1726047885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G2jCB3Mh2D7e/fKcpdcpOCelHevV01EHEW0KXFzYpnE=;
 b=ZgBuWTp/yhomQ6Xja6fnXFdBs5vvJrB1YsJi+zTVnrRpPLOUUuRMDZiOHECmGAGAWI
 shKwOqHuB2BXZidCISPWDcwxp8ukUjkdDRD13menLPmWymXbkvySF/x6mWZn73cXTc5e
 EkDSJfIoqtNkm9LT+WmQ+OfQ1R+7ZL6ZHYsUaOeJzDjYl9PXWcdAAo2uc27ZlxwcaoAm
 jJZjX1yezfnVeMS6obfjS665EEb3ykszm56TWKuzEyo7MztlKwYsnjiousiTAw2/GKyl
 5hIeHJRgXMyLe+wClzGR/XG6AdanxQTIXg1+wmTX4o00zLrHydAKyJyWOdNDP3lHdy5U
 Tz7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVED+JlYSTVzWk47mJ5bMX3Qk5cdS7NTOEPbPoBGhY+2UTyVoH3VsIDlYcYincSaYkdbyy5zzuPWts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA9kgpm02PpAIWm0epGZSNsanHjCo0X/qu4c5E9/y2CsrZpPFQ
 V5PAcxpKljESo4AZAbPedE4TrVycw0ja8bMuInm/zdTAvKmrHrWxy7565KvVtLGozlXT7HoxrFI
 Z52DgiRDmcvWE9bnC9vjDMkWznZP9g/wf+L5eWw==
X-Google-Smtp-Source: AGHT+IGYbHJdBZDqXfJaLvPa+cheRpz0nZvpY4lYVwTEuIeN+wJEbeHIAIs0Kb9fRcKIKf3+GKU49MLlqIZtGriKRJU=
X-Received: by 2002:a05:6870:171d:b0:25d:f0ba:eab7 with SMTP id
 586e51a60fabf-27810b95f26mr7655971fac.18.1725443085257; Wed, 04 Sep 2024
 02:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org>
 <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
In-Reply-To: <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Sep 2024 11:44:33 +0200
Message-ID: <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap
 support
To: "T.J. Mercier" <tjmercier@google.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> <jens.wiklander@linaro.org> wrote:
> >
> > Add a Linaro restricted heap using the linaro,restricted-heap bindings
> > implemented based on the generic restricted heap.
> >
> > The bindings defines a range of physical restricted memory. The heap
> > manages this address range using genalloc. The allocated dma-buf file
> > descriptor can later be registered with the TEE subsystem for later use
> > via Trusted Applications in the secure world.
> >
> > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> >  drivers/dma-buf/heaps/Makefile                |   1 +
> >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> >  3 files changed, 176 insertions(+)
> >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> >
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kcon=
fig
> > index 58903bc62ac8..82e2c5d09242 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> >         help
> >           Enable restricted dma-buf heaps for MediaTek platform. This h=
eap is backed by
> >           TEE client interfaces. If in doubt, say N.
> > +
> > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > +       bool "Linaro DMA-BUF Restricted Heap"
> > +       depends on DMABUF_HEAPS_RESTRICTED
> > +       help
> > +         Choose this option to enable the Linaro restricted dma-buf he=
ap.
> > +         The restricted heap pools are defined according to the DT. He=
aps
> > +         are allocated in the pools using gen allocater.
> > +         If in doubt, say N.
> > +
> > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Mak=
efile
> > index 0028aa9d875f..66b2f67c47b5 100644
> > --- a/drivers/dma-buf/heaps/Makefile
> > +++ b/drivers/dma-buf/heaps/Makefile
> > @@ -2,4 +2,5 @@
> >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_heap_mt=
k.o
> > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_heap_li=
naro.o
> >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/drivers/d=
ma-buf/heaps/restricted_heap_linaro.c
> > new file mode 100644
> > index 000000000000..4b08ed514023
> > --- /dev/null
> > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > @@ -0,0 +1,165 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * DMABUF secure heap exporter
> > + *
> > + * Copyright 2021 NXP.
> > + * Copyright 2024 Linaro Limited.
> > + */
> > +
> > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/err.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> > +
> > +#include "restricted_heap.h"
> > +
> > +#define MAX_HEAP_COUNT 2
>
> Are multiple supported because of what Cyrille mentioned here about permi=
ssions?
> https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709@DBBPR=
04MB7514.eurprd04.prod.outlook.com/

Yes, I kept that as is.

>
> So this is just some arbitrary limit? I'd prefer to have some sort of
> documentation about this.

How about removing the limit and using dynamic allocation instead?

Thanks,
Jens

>
>
> > +#define HEAP_NAME_LEN  32
> > +
> > +struct resmem_restricted {
> > +       phys_addr_t base;
> > +       phys_addr_t size;
> > +
> > +       char name[HEAP_NAME_LEN];
> > +
> > +       bool no_map;
> > +};
> > +
> > +static struct resmem_restricted restricted_data[MAX_HEAP_COUNT] =3D {0=
};
> > +static unsigned int restricted_data_count;
> > +
> > +static int linaro_restricted_memory_allocate(struct restricted_heap *h=
eap,
> > +                                            struct restricted_buffer *=
buf)
> > +{
> > +       struct gen_pool *pool =3D heap->priv_data;
> > +       unsigned long pa;
> > +       int ret;
> > +
> > +       buf->size =3D ALIGN(buf->size, PAGE_SIZE);
> > +       pa =3D gen_pool_alloc(pool, buf->size);
> > +       if (!pa)
> > +               return -ENOMEM;
> > +
> > +       ret =3D sg_alloc_table(&buf->sg_table, 1, GFP_KERNEL);
> > +       if (ret) {
> > +               gen_pool_free(pool, pa, buf->size);
> > +               return ret;
> > +       }
> > +
> > +       sg_set_page(buf->sg_table.sgl, phys_to_page(pa), buf->size, 0);
> > +
> > +       return 0;
> > +}
> > +
> > +static void linaro_restricted_memory_free(struct restricted_heap *heap=
,
> > +                                         struct restricted_buffer *buf=
)
> > +{
> > +       struct gen_pool *pool =3D heap->priv_data;
> > +       struct scatterlist *sg;
> > +       unsigned int i;
> > +
> > +       for_each_sg(buf->sg_table.sgl, sg, buf->sg_table.nents, i)
> > +               gen_pool_free(pool, page_to_phys(sg_page(sg)), sg->leng=
th);
> > +       sg_free_table(&buf->sg_table);
> > +}
> > +
> > +static const struct restricted_heap_ops linaro_restricted_heap_ops =3D=
 {
> > +       .alloc =3D linaro_restricted_memory_allocate,
> > +       .free =3D linaro_restricted_memory_free,
> > +};
> > +
> > +static int add_heap(struct resmem_restricted *mem)
> > +{
> > +       struct restricted_heap *heap;
> > +       struct gen_pool *pool;
> > +       int ret;
> > +
> > +       if (mem->base =3D=3D 0 || mem->size =3D=3D 0) {
> > +               pr_err("restricted_data base or size is not correct\n")=
;
> > +               return -EINVAL;
> > +       }
> > +
> > +       heap =3D kzalloc(sizeof(*heap), GFP_KERNEL);
> > +       if (!heap)
> > +               return -ENOMEM;
> > +
> > +       pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > +       if (!pool) {
> > +               ret =3D -ENOMEM;
> > +               goto err_free_heap;
> > +       }
> > +
> > +       ret =3D gen_pool_add(pool, mem->base, mem->size, -1);
> > +       if (ret)
> > +               goto err_free_pool;
> > +
> > +       heap->no_map =3D mem->no_map;
> > +       heap->priv_data =3D pool;
> > +       heap->name =3D mem->name;
> > +       heap->ops =3D &linaro_restricted_heap_ops;
> > +
> > +       ret =3D restricted_heap_add(heap);
> > +       if (ret)
> > +               goto err_free_pool;
> > +
> > +       return 0;
> > +
> > +err_free_pool:
> > +       gen_pool_destroy(pool);
> > +err_free_heap:
> > +       kfree(heap);
> > +
> > +       return ret;
> > +}
> > +
> > +static int __init rmem_restricted_heap_setup(struct reserved_mem *rmem=
)
> > +{
> > +       size_t len =3D HEAP_NAME_LEN;
> > +       const char *s;
> > +       bool no_map;
> > +
> > +       if (WARN_ONCE(restricted_data_count >=3D MAX_HEAP_COUNT,
> > +                     "Cannot handle more than %u restricted heaps\n",
> > +                     MAX_HEAP_COUNT))
> > +               return -EINVAL;
> > +
> > +       no_map =3D of_get_flat_dt_prop(rmem->fdt_node, "no-map", NULL);
> > +       s =3D strchr(rmem->name, '@');
> > +       if (s)
> > +               len =3D umin(s - rmem->name + 1, len);
> > +
> > +       restricted_data[restricted_data_count].base =3D rmem->base;
> > +       restricted_data[restricted_data_count].size =3D rmem->size;
> > +       restricted_data[restricted_data_count].no_map =3D no_map;
> > +       strscpy(restricted_data[restricted_data_count].name, rmem->name=
, len);
> > +
> > +       restricted_data_count++;
> > +       return 0;
> > +}
> > +
> > +RESERVEDMEM_OF_DECLARE(linaro_restricted_heap, "linaro,restricted-heap=
",
> > +                      rmem_restricted_heap_setup);
> > +
> > +static int linaro_restricted_heap_init(void)
> > +{
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       for (i =3D 0; i < restricted_data_count; i++) {
> > +               ret =3D add_heap(&restricted_data[i]);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +       return 0;
> > +}
> > +
> > +module_init(linaro_restricted_heap_init);
> > +MODULE_DESCRIPTION("Linaro Restricted Heap Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
