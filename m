Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF6A77AF1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A13610E580;
	Tue,  1 Apr 2025 12:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q27hmqnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB3010E580
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 12:27:11 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2c2dc6c30c2so1696241fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743510431; x=1744115231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sCqoi2+dXPe214Qh2/irU3yim1lmhg8lbu3VkUkCRk=;
 b=q27hmqnMW5+wQlxwMwakoUw91X7A+48cQybM25Ipg06XXaoggL6hvEXQ9ov9o37f4z
 RZ/7FkpABqvg4kVA2avuE4IjwibJLWfYM+Imu1khJnItV2dwLkJbqmmWOQO45mzIGfVs
 bOn/XB57rWPdWGos+sND+LBhL6aduUabOMpIis19gcJjPW5YjZuWSnEbWRaUjopZLuU5
 nNIRPuvxLAlrwhgppxEFP+mnGqTPROnRZMCId2N0EwiJstD+2NQLAtp4W4I4g6bZB57m
 xRLETaA5CV/HSoSfHXhtDqKQBskPAlu0KEWviDypnplSP6IxoGAF1fXnLaJIShwOH79E
 kcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743510431; x=1744115231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2sCqoi2+dXPe214Qh2/irU3yim1lmhg8lbu3VkUkCRk=;
 b=Pw0ZJzCOY9gF8YE4vezebXcdlrEXPfTrQ5akocC8FeIAQfbObWUJ3k/5Mr/2d2HGES
 I/jyXwcRvCt/uAncmF4EbfEkLNcYRHmAT1kYDKUkezNJNwvVfIQAZVFfP8JThL5tDkvB
 hVYn+OjAeA6UyDloYbrRbqF+3pGXyvfqLBFcsV2bowponqrQw02LWLLkQH78VP8gzGq+
 bevRiaKYkWEXRE4C3BnEZAwRGZmH9YTFB8zPin1x4zOQ9lWFTFTLgB85mqTNNsPLSAZr
 gwonfnxt/xH0zRXkGQ1NfvUW7BQY8R+aOhmeq+FQA7FNj9llMRAcaKwwDeVaFUI8gzJe
 +c4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpGoMynhwvS76tUhuziUJHHrTAL/MTOCj1Y3SIaz+UjxyqKqXsCGwJvvn6Snf5wNyN8beGjRCbYyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVxkVR3NUfixo7/2FD6BByfkg0LqHis2uhKTdMdW+oaAK54U/w
 PUrisDMzW7MbElb1bB46UegeUO+5Gynd9/y+ranrBgJtzsAZ0eIKO+1srmc3l461qJUqP1aMewG
 3NtVkyXWvq6jFX1vlVrBnDNw3TTG8gBhM9qeP4A==
X-Gm-Gg: ASbGncvseQurTygmKdANlQXwPZRd4bbFUL6WfyVFqnXTInJa8xH5b0si/Y5aYpaTSlF
 +U2+eAqG0IO9gvBsO2s8eNW/XzUDR572B9/mxG5nlUN5GLwMfvB+57dnaNzOgHHWOBq1tKtowb8
 UrkBTNp1s7XmB6gpQv9z3aOo9RncFlxSGh/ksqjQ==
X-Google-Smtp-Source: AGHT+IEgukiORr4SZjKbgRpiqVcotRwJmBe7YTtNBvIBuB03areMpUPGe3dEZLGjY/JgwKfG2LLes1zFXMHJJLCf0GQ=
X-Received: by 2002:a05:6871:3a11:b0:2c2:3a7f:e702 with SMTP id
 586e51a60fabf-2cbcf4ed1c0mr6236036fac.11.1743510430925; Tue, 01 Apr 2025
 05:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org>
 <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
 <Z-u8MWNVNy9lLbkK@sumit-X1>
In-Reply-To: <Z-u8MWNVNy9lLbkK@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 14:26:59 +0200
X-Gm-Features: AQ5f1JqpEmTnupXLsUS7i7QDnCB4PmN4PxsDBJJ9FxT6NqnXbZNKDY1Mpm4OmN8
Message-ID: <CAHUa44GGEypYfiVz5E1aBsZ0TOK0UoeDBVRYB8_dUYJLhrSyUg@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory allocation
To: Sumit Garg <sumit.garg@kernel.org>
Cc: akpm@linux-foundation.org, david@redhat.com, rppt@linux.ibm.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>,
 linux-mm@kvack.org
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

On Tue, Apr 1, 2025 at 12:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> + MM folks to seek guidance here.
>
> On Thu, Mar 27, 2025 at 09:07:34AM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
> > On Tue, Mar 25, 2025 at 8:42=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
> > > > Add support in the OP-TEE backend driver dynamic restricted memory
> > > > allocation with FF-A.
> > > >
> > > > The restricted memory pools for dynamically allocated restrict memo=
ry
> > > > are instantiated when requested by user-space. This instantiation c=
an
> > > > fail if OP-TEE doesn't support the requested use-case of restricted
> > > > memory.
> > > >
> > > > Restricted memory pools based on a static carveout or dynamic alloc=
ation
> > > > can coexist for different use-cases. We use only dynamic allocation=
 with
> > > > FF-A.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/optee/Makefile        |   1 +
> > > >  drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> > > >  drivers/tee/optee/optee_private.h |  13 +-
> > > >  drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++++++=
++++
> > > >  4 files changed, 483 insertions(+), 3 deletions(-)
> > > >  create mode 100644 drivers/tee/optee/rstmem.c
> > > >
>
> <snip>
>
> > > > diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.=
c
> > > > new file mode 100644
> > > > index 000000000000..ea27769934d4
> > > > --- /dev/null
> > > > +++ b/drivers/tee/optee/rstmem.c
> > > > @@ -0,0 +1,329 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (c) 2025, Linaro Limited
> > > > + */
> > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > +
> > > > +#include <linux/errno.h>
> > > > +#include <linux/genalloc.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/tee_core.h>
> > > > +#include <linux/types.h>
> > > > +#include "optee_private.h"
> > > > +
> > > > +struct optee_rstmem_cma_pool {
> > > > +     struct tee_rstmem_pool pool;
> > > > +     struct gen_pool *gen_pool;
> > > > +     struct optee *optee;
> > > > +     size_t page_count;
> > > > +     u16 *end_points;
> > > > +     u_int end_point_count;
> > > > +     u_int align;
> > > > +     refcount_t refcount;
> > > > +     u32 use_case;
> > > > +     struct tee_shm *rstmem;
> > > > +     /* Protects when initializing and tearing down this struct */
> > > > +     struct mutex mutex;
> > > > +};
> > > > +
> > > > +static struct optee_rstmem_cma_pool *
> > > > +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
> > > > +{
> > > > +     return container_of(pool, struct optee_rstmem_cma_pool, pool)=
;
> > > > +}
> > > > +
> > > > +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     int rc;
> > > > +
> > > > +     rp->rstmem =3D tee_shm_alloc_cma_phys_mem(rp->optee->ctx, rp-=
>page_count,
> > > > +                                             rp->align);
> > > > +     if (IS_ERR(rp->rstmem)) {
> > > > +             rc =3D PTR_ERR(rp->rstmem);
> > > > +             goto err_null_rstmem;
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * TODO unmap the memory range since the physical memory will
> > > > +      * become inaccesible after the lend_rstmem() call.
> > > > +      */
> > >
> > > What's your plan for this TODO? I think we need a CMA allocator here
> > > which can allocate un-mapped memory such that any cache speculation
> > > won't lead to CPU hangs once the memory restriction comes into pictur=
e.
> >
> > What happens is platform-specific. For some platforms, it might be
> > enough to avoid explicit access. Yes, a CMA allocator with unmapped
> > memory or where memory can be unmapped is one option.
>
> Did you get a chance to enable real memory protection on RockPi board?

No, I don't think I have access to the needed documentation for the
board to set it up for relevant peripherals.

> This will atleast ensure that mapped restricted memory without explicit
> access works fine. Since otherwise once people start to enable real
> memory restriction in OP-TEE, there can be chances of random hang ups
> due to cache speculation.

A hypervisor in the normal world can also make the memory inaccessible
to the kernel. That shouldn't cause any hangups due to cache
speculation.

Cheers,
Jens

>
> MM folks,
>
> Basically what we are trying to achieve here is a "no-map" DT behaviour
> [1] which is rather dynamic in  nature. The use-case here is that a memor=
y
> block allocated from CMA can be marked restricted at runtime where we
> would like the Linux not being able to directly or indirectly (cache
> speculation) access it. Once memory restriction use-case has been
> completed, the memory block can be marked as normal and freed for
> further CMA allocation.
>
> It will be apprciated if you can guide us regarding the appropriate APIs
> to use for un-mapping/mamping CMA allocations for this use-case.
>
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema=
s/reserved-memory/reserved-memory.yaml#L79
>
> -Sumit
>
> >
> > >
> > > > +     rc =3D rp->optee->ops->lend_rstmem(rp->optee, rp->rstmem, rp-=
>end_points,
> > > > +                                      rp->end_point_count, rp->use=
_case);
> > > > +     if (rc)
> > > > +             goto err_put_shm;
> > > > +     rp->rstmem->flags |=3D TEE_SHM_DYNAMIC;
> > > > +
> > > > +     rp->gen_pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > > > +     if (!rp->gen_pool) {
> > > > +             rc =3D -ENOMEM;
> > > > +             goto err_reclaim;
> > > > +     }
> > > > +
> > > > +     rc =3D gen_pool_add(rp->gen_pool, rp->rstmem->paddr,
> > > > +                       rp->rstmem->size, -1);
> > > > +     if (rc)
> > > > +             goto err_free_pool;
> > > > +
> > > > +     refcount_set(&rp->refcount, 1);
> > > > +     return 0;
> > > > +
> > > > +err_free_pool:
> > > > +     gen_pool_destroy(rp->gen_pool);
> > > > +     rp->gen_pool =3D NULL;
> > > > +err_reclaim:
> > > > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > > > +err_put_shm:
> > > > +     tee_shm_put(rp->rstmem);
> > > > +err_null_rstmem:
> > > > +     rp->rstmem =3D NULL;
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +static int get_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     int rc =3D 0;
> > > > +
> > > > +     if (!refcount_inc_not_zero(&rp->refcount)) {
> > > > +             mutex_lock(&rp->mutex);
> > > > +             if (rp->gen_pool) {
> > > > +                     /*
> > > > +                      * Another thread has already initialized the=
 pool
> > > > +                      * before us, or the pool was just about to b=
e torn
> > > > +                      * down. Either way we only need to increase =
the
> > > > +                      * refcount and we're done.
> > > > +                      */
> > > > +                     refcount_inc(&rp->refcount);
> > > > +             } else {
> > > > +                     rc =3D init_cma_rstmem(rp);
> > > > +             }
> > > > +             mutex_unlock(&rp->mutex);
> > > > +     }
> > > > +
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +static void release_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     gen_pool_destroy(rp->gen_pool);
> > > > +     rp->gen_pool =3D NULL;
> > > > +
> > > > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > > > +     rp->rstmem->flags &=3D ~TEE_SHM_DYNAMIC;
> > > > +
> > > > +     WARN(refcount_read(&rp->rstmem->refcount) !=3D 1, "Unexpected=
 refcount");
> > > > +     tee_shm_put(rp->rstmem);
> > > > +     rp->rstmem =3D NULL;
> > > > +}
> > > > +
> > > > +static void put_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > +{
> > > > +     if (refcount_dec_and_test(&rp->refcount)) {
> > > > +             mutex_lock(&rp->mutex);
> > > > +             if (rp->gen_pool)
> > > > +                     release_cma_rstmem(rp);
> > > > +             mutex_unlock(&rp->mutex);
> > > > +     }
> > > > +}
> > > > +
> > > > +static int rstmem_pool_op_cma_alloc(struct tee_rstmem_pool *pool,
> > > > +                                 struct sg_table *sgt, size_t size=
,
> > > > +                                 size_t *offs)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +     size_t sz =3D ALIGN(size, PAGE_SIZE);
> > > > +     phys_addr_t pa;
> > > > +     int rc;
> > > > +
> > > > +     rc =3D get_cma_rstmem(rp);
> > > > +     if (rc)
> > > > +             return rc;
> > > > +
> > > > +     pa =3D gen_pool_alloc(rp->gen_pool, sz);
> > > > +     if (!pa) {
> > > > +             rc =3D -ENOMEM;
> > > > +             goto err_put;
> > > > +     }
> > > > +
> > > > +     rc =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > > > +     if (rc)
> > > > +             goto err_free;
> > > > +
> > > > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
> > > > +     *offs =3D pa - rp->rstmem->paddr;
> > > > +
> > > > +     return 0;
> > > > +err_free:
> > > > +     gen_pool_free(rp->gen_pool, pa, size);
> > > > +err_put:
> > > > +     put_cma_rstmem(rp);
> > > > +
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +static void rstmem_pool_op_cma_free(struct tee_rstmem_pool *pool,
> > > > +                                 struct sg_table *sgt)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +     struct scatterlist *sg;
> > > > +     int i;
> > > > +
> > > > +     for_each_sgtable_sg(sgt, sg, i)
> > > > +             gen_pool_free(rp->gen_pool, sg_phys(sg), sg->length);
> > > > +     sg_free_table(sgt);
> > > > +     put_cma_rstmem(rp);
> > > > +}
> > > > +
> > > > +static int rstmem_pool_op_cma_update_shm(struct tee_rstmem_pool *p=
ool,
> > > > +                                      struct sg_table *sgt, size_t=
 offs,
> > > > +                                      struct tee_shm *shm,
> > > > +                                      struct tee_shm **parent_shm)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +
> > > > +     *parent_shm =3D rp->rstmem;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void pool_op_cma_destroy_pool(struct tee_rstmem_pool *pool)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool)=
;
> > > > +
> > > > +     mutex_destroy(&rp->mutex);
> > > > +     kfree(rp);
> > > > +}
> > > > +
> > > > +static struct tee_rstmem_pool_ops rstmem_pool_ops_cma =3D {
> > > > +     .alloc =3D rstmem_pool_op_cma_alloc,
> > > > +     .free =3D rstmem_pool_op_cma_free,
> > > > +     .update_shm =3D rstmem_pool_op_cma_update_shm,
> > > > +     .destroy_pool =3D pool_op_cma_destroy_pool,
> > > > +};
> > > > +
> > > > +static int get_rstmem_config(struct optee *optee, u32 use_case,
> > > > +                          size_t *min_size, u_int *min_align,
> > > > +                          u16 *end_points, u_int *ep_count)
> > >
> > > I guess this end points terminology is specific to FF-A ABI. Is there
> > > any relevance for this in the common APIs?
> >
> > Yes, endpoints are specific to FF-A ABI. The list of end-points must
> > be presented to FFA_MEM_LEND. We're relying on the secure world to
> > know which endpoints are needed for a specific use case.
> >
> > Cheers,
> > Jens
> >
> > >
> > > -Sumit
> > >
> > > > +{
> > > > +     struct tee_param params[2] =3D {
> > > > +             [0] =3D {
> > > > +                     .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INO=
UT,
> > > > +                     .u.value.a =3D use_case,
> > > > +             },
> > > > +             [1] =3D {
> > > > +                     .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OU=
TPUT,
> > > > +             },
> > > > +     };
> > > > +     struct optee_shm_arg_entry *entry;
> > > > +     struct tee_shm *shm_param =3D NULL;
> > > > +     struct optee_msg_arg *msg_arg;
> > > > +     struct tee_shm *shm;
> > > > +     u_int offs;
> > > > +     int rc;
> > > > +
> > > > +     if (end_points && *ep_count) {
> > > > +             params[1].u.memref.size =3D *ep_count * sizeof(*end_p=
oints);
> > > > +             shm_param =3D tee_shm_alloc_priv_buf(optee->ctx,
> > > > +                                                params[1].u.memref=
.size);
> > > > +             if (IS_ERR(shm_param))
> > > > +                     return PTR_ERR(shm_param);
> > > > +             params[1].u.memref.shm =3D shm_param;
> > > > +     }
> > > > +
> > > > +     msg_arg =3D optee_get_msg_arg(optee->ctx, ARRAY_SIZE(params),=
 &entry,
> > > > +                                 &shm, &offs);
> > > > +     if (IS_ERR(msg_arg)) {
> > > > +             rc =3D PTR_ERR(msg_arg);
> > > > +             goto out_free_shm;
> > > > +     }
> > > > +     msg_arg->cmd =3D OPTEE_MSG_CMD_GET_RSTMEM_CONFIG;
> > > > +
> > > > +     rc =3D optee->ops->to_msg_param(optee, msg_arg->params,
> > > > +                                   ARRAY_SIZE(params), params,
> > > > +                                   false /*!update_out*/);
> > > > +     if (rc)
> > > > +             goto out_free_msg;
> > > > +
> > > > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, fa=
lse);
> > > > +     if (rc)
> > > > +             goto out_free_msg;
> > > > +     if (msg_arg->ret && msg_arg->ret !=3D TEEC_ERROR_SHORT_BUFFER=
) {
> > > > +             rc =3D -EINVAL;
> > > > +             goto out_free_msg;
> > > > +     }
> > > > +
> > > > +     rc =3D optee->ops->from_msg_param(optee, params, ARRAY_SIZE(p=
arams),
> > > > +                                     msg_arg->params, true /*updat=
e_out*/);
> > > > +     if (rc)
> > > > +             goto out_free_msg;
> > > > +
> > > > +     if (!msg_arg->ret && end_points &&
> > > > +         *ep_count < params[1].u.memref.size / sizeof(u16)) {
> > > > +             rc =3D -EINVAL;
> > > > +             goto out_free_msg;
> > > > +     }
> > > > +
> > > > +     *min_size =3D params[0].u.value.a;
> > > > +     *min_align =3D params[0].u.value.b;
> > > > +     *ep_count =3D params[1].u.memref.size / sizeof(u16);
> > > > +
> > > > +     if (msg_arg->ret =3D=3D TEEC_ERROR_SHORT_BUFFER) {
> > > > +             rc =3D -ENOSPC;
> > > > +             goto out_free_msg;
> > > > +     }
> > > > +
> > > > +     if (end_points)
> > > > +             memcpy(end_points, tee_shm_get_va(shm_param, 0),
> > > > +                    params[1].u.memref.size);
> > > > +
> > > > +out_free_msg:
> > > > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > > > +out_free_shm:
> > > > +     if (shm_param)
> > > > +             tee_shm_free(shm_param);
> > > > +     return rc;
> > > > +}
> > > > +
> > > > +struct tee_rstmem_pool *optee_rstmem_alloc_cma_pool(struct optee *=
optee,
> > > > +                                                 enum tee_dma_heap=
_id id)
> > > > +{
> > > > +     struct optee_rstmem_cma_pool *rp;
> > > > +     u32 use_case =3D id;
> > > > +     size_t min_size;
> > > > +     int rc;
> > > > +
> > > > +     rp =3D kzalloc(sizeof(*rp), GFP_KERNEL);
> > > > +     if (!rp)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +     rp->use_case =3D use_case;
> > > > +
> > > > +     rc =3D get_rstmem_config(optee, use_case, &min_size, &rp->ali=
gn, NULL,
> > > > +                            &rp->end_point_count);
> > > > +     if (rc) {
> > > > +             if (rc !=3D -ENOSPC)
> > > > +                     goto err;
> > > > +             rp->end_points =3D kcalloc(rp->end_point_count,
> > > > +                                      sizeof(*rp->end_points), GFP=
_KERNEL);
> > > > +             if (!rp->end_points) {
> > > > +                     rc =3D -ENOMEM;
> > > > +                     goto err;
> > > > +             }
> > > > +             rc =3D get_rstmem_config(optee, use_case, &min_size, =
&rp->align,
> > > > +                                    rp->end_points, &rp->end_point=
_count);
> > > > +             if (rc)
> > > > +                     goto err_kfree_eps;
> > > > +     }
> > > > +
> > > > +     rp->pool.ops =3D &rstmem_pool_ops_cma;
> > > > +     rp->optee =3D optee;
> > > > +     rp->page_count =3D min_size / PAGE_SIZE;
> > > > +     mutex_init(&rp->mutex);
> > > > +
> > > > +     return &rp->pool;
> > > > +
> > > > +err_kfree_eps:
> > > > +     kfree(rp->end_points);
> > > > +err:
> > > > +     kfree(rp);
> > > > +     return ERR_PTR(rc);
> > > > +}
> > > > --
> > > > 2.43.0
> > > >
