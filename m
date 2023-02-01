Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C5685EFA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 06:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26D10E15C;
	Wed,  1 Feb 2023 05:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE00310E15C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 05:34:10 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id i185so18471263vsc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 21:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ekhLKUWZkf2mPPk6EvYEH+Yg2GrOJtmbhmTzkV8B7w0=;
 b=pkjel1inRIowraUvEvDzU961i0/PYti6DHVL5yGJX7oZaWfBIqjBhPojKSHOfujN7n
 UKNjhgldQkehIMcyrVTm5HgD57omMtm2Tk0zlPmlC8zTvDVjJxBmdHL7in0XizVa+1zK
 iDoCm8UwrK0/JHENCnnARfSygXqzf50WV/+CYzc3mxGX1XL1pWQrLEGFS8hxLq0IMoJD
 bLve0/Lwo4C84/Ke2uflIfjz/OdD9884L6g2VBFCtIJbg8c+pGyUEXn1EbD9rShpBm48
 oFyh2amEZJ6fbLYcyMZugEaYVXN0TQucHv5Vkmjv3lBrasg2F5dbEhDMtHxGZkblO0NP
 N7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ekhLKUWZkf2mPPk6EvYEH+Yg2GrOJtmbhmTzkV8B7w0=;
 b=SgcGsar3Mx/RvcZ2B1dr82N6xVDDMEBTdeh4hJASfwibAaqrIBKRd24xv0LP74sfOI
 e7tfcbIp1wqtZRdrUegDTLhGB9vZtZDEBOVdtE2UATvkOXaCOf3IMCrPcjDE726oRDVU
 JRGptdX9KeEq5cMhDzqn1oBhAmfp/zoclif23vnRLDoytDr7Xzy//gRbqiGd/Lzv7Ec7
 4gxBuHLcLH9ntWesHMAoHUxQ/EfH0+zv/2VjdxNU/K+jM7N9bfaENZdFHSWuAvL7coSO
 23iHAkwsAGhmVltVqGT9ZExXdlFSSSpquNckGZZwTT/AP1Arv6XYwcCyMYA08h0LqTnT
 kWcA==
X-Gm-Message-State: AO0yUKV1ZK01hKMIUg9LnVtTgk83yitdi1ZPBP6gKkQkBMx6BUoqzxIO
 kPmhasuPMCmFZIE/piVfpQ+1BqOi+5tWVxUYsyCWKg==
X-Google-Smtp-Source: AK7set/ZFcRr6tjf6hR4enSGOYHwqZl7gtA+HMTfvneHvoyW+9ENP1EzZ6qRZVXlcB/X7unOOpSkqSeCcBSKqoIqSbg=
X-Received: by 2002:a67:ebc1:0:b0:3d0:d172:3a02 with SMTP id
 y1-20020a67ebc1000000b003d0d1723a02mr242392vso.41.1675229649442; Tue, 31 Jan
 2023 21:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
In-Reply-To: <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 1 Feb 2023 11:03:58 +0530
Message-ID: <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
To: Olivier Masse <olivier.masse@nxp.com>
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
Cc: Peter Griffin <peter.griffin@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Cyrille Fleury <cyrille.fleury@nxp.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olivier,

On Fri, 27 Jan 2023 at 16:24, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Hi Joakim,
> Hi Etienne,
>
> Let me bring back this pull request for OPTEE Linux driver.
>
> Last feedback was from Christian K=C3=B6nig and Sumit Garg.
> From Christian:
> > Just two comments:
> >
> > 1. Dmitry is working on a change which renames some functions and
> > makes
> > it mandatory to call them with the dma_resv lock held.
> >
> > Depending on how you want to upstream this change you will certainly
> > run
> > into conflicts with that.
>
> Is there any update on these changes ?
>
> >
> > 2. Would it be possible to do this dynamically? In other words does
> > the
> > tee driver has a concept of buffers moving around?
>
> We do not support dynamic secure memory heap.
>
> From Sumit:
> > What limits you to extend this feature to non-contiguous memory
> > buffers? I believe that should be possible with OP-TEE dynamic shared
> > memory which gives you the granularity to register a list of pages.
>
> Our solution use a fixed protected reserved memory region and do not
> rely on a dynamic protection managed in secure.
>
> The scope of this implementation rely on a static memory region handled
> by a specific DMA Heap type.
>

AFAIR, the last review for v2 is here [1]. So we need to have this
secure DMA heap upstream in order for ioctl added by this patch to be
usable.

[1] https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfir=
mware.org/message/M3WLO7RNG22OR4744BY6XNG2GLIYMNHN/

-Sumit

> Best regards,
> Olivier MASSE
>
>
> On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
> > From: Etienne Carriere <etienne.carriere@linaro.org>
> >
> > This change allows userland to create a tee_shm object that refers
> > to a dmabuf reference.
> >
> > Userland provides a dmabuf file descriptor as buffer reference.
> > The created tee_shm object exported as a brand new dmabuf reference
> > used to provide a clean fd to userland. Userland shall closed this
> > new
> > fd to release the tee_shm object resources. The initial dmabuf
> > resources
> > are tracked independently through original dmabuf file descriptor.
> >
> > Once the buffer is registered and until it is released, TEE driver
> > keeps a refcount on the registered dmabuf structure.
> >
> > This change only support dmabuf references that relates to physically
> > contiguous memory buffers.
> >
> > New tee_shm flag to identify tee_shm objects built from a registered
> > dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged with
> > TEE_SHM_EXT_DMA_BUF.
> >
> > Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > From: https://github.com/linaro-swg/linux.git
> > (cherry picked from commit 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> > ---
> >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> >  drivers/tee/tee_shm.c    | 99
> > +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_drv.h  | 11 +++++
> >  include/uapi/linux/tee.h | 29 ++++++++++++
> >  4 files changed, 175 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index 8aa1a4836b92..7c45cbf85eb9 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >       return ret;
> >  }
> >
> > +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                                  struct
> > tee_ioctl_shm_register_fd_data __user *udata)
> > +{
> > +     struct tee_ioctl_shm_register_fd_data data;
> > +     struct tee_shm *shm;
> > +     long ret;
> > +
> > +     if (copy_from_user(&data, udata, sizeof(data)))
> > +             return -EFAULT;
> > +
> > +     /* Currently no input flags are supported */
> > +     if (data.flags)
> > +             return -EINVAL;
> > +
> > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > +     if (IS_ERR(shm))
> > +             return -EINVAL;
> > +
> > +     data.id =3D shm->id;
> > +     data.flags =3D shm->flags;
> > +     data.size =3D shm->size;
> > +
> > +     if (copy_to_user(udata, &data, sizeof(data)))
> > +             ret =3D -EFAULT;
> > +     else
> > +             ret =3D tee_shm_get_fd(shm);
> > +
> > +     /*
> > +      * When user space closes the file descriptor the shared memory
> > +      * should be freed or if tee_shm_get_fd() failed then it will
> > +      * be freed immediately.
> > +      */
> > +     tee_shm_put(shm);
> > +     return ret;
> > +}
> > +
> >  static int params_from_user(struct tee_context *ctx, struct
> > tee_param *params,
> >                           size_t num_params,
> >                           struct tee_ioctl_param __user *uparams)
> > @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned
> > int cmd, unsigned long arg)
> >               return tee_ioctl_shm_alloc(ctx, uarg);
> >       case TEE_IOC_SHM_REGISTER:
> >               return tee_ioctl_shm_register(ctx, uarg);
> > +     case TEE_IOC_SHM_REGISTER_FD:
> > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> >       case TEE_IOC_OPEN_SESSION:
> >               return tee_ioctl_open_session(ctx, uarg);
> >       case TEE_IOC_INVOKE:
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index 836872467dc6..55a3fbbb022e 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -4,6 +4,7 @@
> >   */
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/idr.h>
> >  #include <linux/mm.h>
> >  #include <linux/sched.h>
> > @@ -12,6 +13,14 @@
> >  #include <linux/uio.h>
> >  #include "tee_private.h"
> >
> > +/* extra references appended to shm object for registered shared
> > memory */
> > +struct tee_shm_dmabuf_ref {
> > +     struct tee_shm shm;
> > +     struct dma_buf *dmabuf;
> > +     struct dma_buf_attachment *attach;
> > +     struct sg_table *sgt;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t
> > page_count)
> >  {
> >       size_t n;
> > @@ -71,7 +80,16 @@ static void release_registered_pages(struct
> > tee_shm *shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct
> > tee_shm *shm)
> >  {
> > -     if (shm->flags & TEE_SHM_POOL) {
> > +     if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> > +             struct tee_shm_dmabuf_ref *ref;
> > +
> > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref,
> > shm);
> > +             dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +                                      DMA_BIDIRECTIONAL);
> > +
> > +             dma_buf_detach(ref->dmabuf, ref->attach);
> > +             dma_buf_put(ref->dmabuf);
> > +     } else if (shm->flags & TEE_SHM_POOL) {
> >               teedev->pool->ops->free(teedev->pool, shm);
> >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx,
> > shm);
> > @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct
> > tee_context *ctx, size_t size)
> >   * tee_client_invoke_func(). The memory allocated is later freed
> > with a
> >   * call to tee_shm_free().
> >   *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
> > failure
> >   */
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,
> > size_t size)
> >  {
> > @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct
> > tee_context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> > +{
> > +     struct tee_shm_dmabuf_ref *ref;
> > +     int rc;
> > +
> > +     if (!tee_device_get(ctx->teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > +     if (!ref) {
> > +             rc =3D -ENOMEM;
> > +             goto err_put_tee;
> > +     }
> > +
> > +     refcount_set(&ref->shm.refcount, 1);
> > +     ref->shm.ctx =3D ctx;
> > +     ref->shm.id =3D -1;
> > +
> > +     ref->dmabuf =3D dma_buf_get(fd);
> > +     if (IS_ERR(ref->dmabuf)) {
> > +             rc =3D PTR_ERR(ref->dmabuf);
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx-
> > >teedev->dev);
> > +     if (IS_ERR(ref->attach)) {
> > +             rc =3D PTR_ERR(ref->attach);
> > +             goto err_detach;
> > +     }
> > +
> > +     ref->sgt =3D dma_buf_map_attachment(ref->attach,
> > DMA_BIDIRECTIONAL);
> > +     if (IS_ERR(ref->sgt)) {
> > +             rc =3D PTR_ERR(ref->sgt);
> > +             goto err_unmap_attachement;
> > +     }
> > +
> > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +             rc =3D PTR_ERR(ref->sgt->sgl);
> > +             goto err_unmap_attachement;
> > +     }
> > +
> > +     ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> > +     ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> > +     ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> > +
> > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> > +                             1, 0, GFP_KERNEL);
> > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +     if (ref->shm.id < 0) {
> > +             rc =3D ref->shm.id;
> > +             goto err_idr_remove;
> > +     }
> > +
> > +     return &ref->shm;
> > +
> > +err_idr_remove:
> > +     mutex_lock(&ctx->teedev->mutex);
> > +     idr_remove(&ctx->teedev->idr, ref->shm.id);
> > +     mutex_unlock(&ctx->teedev->mutex);
> > +err_unmap_attachement:
> > +     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > DMA_BIDIRECTIONAL);
> > +err_detach:
> > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +     dma_buf_put(ref->dmabuf);
> > +     kfree(ref);
> > +err_put_tee:
> > +     teedev_ctx_put(ctx);
> > +     tee_device_put(ctx->teedev);
> > +
> > +     return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> >  static struct tee_shm *
> >  register_shm_helper(struct tee_context *ctx, unsigned long addr,
> >                   size_t length, u32 flags, int id)
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index 911cad324acc..40ddd5376c2d 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -25,6 +25,7 @@
> >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user space
> > */
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool
> > */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver
> > */
> > +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
> > handle */
> >
> >  struct device;
> >  struct tee_device;
> > @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct
> > tee_context *ctx, size_t size);
> >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >                                           void *addr, size_t length);
> >
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file
> > descriptor
> > + *
> > + * @ctx:     Context that allocates the shared memory
> > + * @fd:              Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
> > failure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > fd);
> > +
> >  /**
> >   * tee_shm_is_dynamic() - Check if shared memory object is of the
> > dynamic kind
> >   * @shm:     Shared memory handle
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index 25a6c534beb1..baf3cd7cfdac 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1,
> > \
> >                                    struct tee_ioctl_shm_alloc_data)
> >
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory registering
> > argument
> > + * @fd:              [in] File descriptor identifying the shared
> > memory
> > + * @size:    [out] Size of shared memory to allocate
> > + * @flags:   [in] Flags to/from allocation.
> > + * @id:              [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by the
> > call
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
> > below.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +     __s64 fd;
> > +     __u64 size;
> > +     __u32 flags;
> > +     __s32 id;
> > +} __attribute__ ((aligned (8)));
> > +
> > +/**
> > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file
> > descriptor
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor refers to the shared memory object
> > in kernel
> > + * land. The shared memory is freed when the descriptor is closed.
> > + */
> > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC,
> > TEE_IOC_BASE + 8, \
> > +                                  struct
> > tee_ioctl_shm_register_fd_data)
> > +
> >  /**
> >   * struct tee_ioctl_buf_data - Variable sized buffer
> >   * @buf_ptr: [in] A __user pointer to a buffer
