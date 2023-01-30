Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82EA680E6B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 14:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D5210E242;
	Mon, 30 Jan 2023 13:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D354810E242
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 13:04:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ml19so7958792ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 05:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZuHVl5hGmJ4fZkRt1Yrk6j1AQz/7NfuVRUiWBNlLoA=;
 b=oRiQNtD8JxychICWlI33NIYEwScdivXaagfMtJhWBXStjp+/NTU9AtCRt8iQE/PWr+
 BO5jCTUUxN26sf/wpdQRySFmkddV0VHoL2obLQfp/MzG1sJQzOcFNViTPpug0rHZ0TnF
 Dfi7GzsKHUKeTWn1FHOwEtUX570zTxlOrVnOCdocvgc0QBHWZdLBemN74SijcdAAZiMV
 +B47xYaZD8YWd0OVYOKqDjhbeLtuIpJ6xuPHQv8NAQ9dHst+NQgoU5QfEZfoECFxO/gJ
 KmX36v4Jmhzsba0zoaNLjIZR6bTLZTJC+RO0qfKVdacy2nyx6eJGkdnYTov+oYHUyxe+
 vx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZuHVl5hGmJ4fZkRt1Yrk6j1AQz/7NfuVRUiWBNlLoA=;
 b=uQDUTiBnuhonNruCYfTv/KT51pfziIwlxEywKt2z7tRD+QOFQni3DjbrQcYAqFqcZd
 qeLKvii3FI+8fpw5E/ENzSIHkli7ZcBHxHI+jlK/DfF145dSpoEwvVS7qGUPTTlPBmeu
 Tj3sNdTnBeWLUvtS6mGOmdl/y7F2/6NcAJHtAby1MLstt9+sC4pXSbaM2P8VKNkoFBOh
 J9HL0KoNJec5qcCn2Xcxhkob8qh/u3OoJu1uJvpdq/f5bZVETiX3dDNAPNaabAhgUrME
 noE+sfJBnAA7PHalDYw2uKgxXp83e0k0jaEUOwlvcO1l/yiRMPfhIPbfXGTwhTrTOG7y
 YdBQ==
X-Gm-Message-State: AO0yUKW/uBNAnUo9llV4haI30zjXPmV0MRnEyz/I7hYHoPSoasWVuW3Q
 LQEbU4M1D9rsSyPN5UX47xIPtUY//SnLniWwe02Kjih8E7fJ/tL+
X-Google-Smtp-Source: AK7set/ZXDXv8lI64elVdlupXYFVhQJUz6pJQ5wLNKdS+mDyS8tmTntWgpkft+AloQ/vWI//EVROAZypBFz605XeRkI=
X-Received: by 2002:a17:906:7244:b0:882:c2dd:f29e with SMTP id
 n4-20020a170906724400b00882c2ddf29emr2145140ejk.268.1675083895092; Mon, 30
 Jan 2023 05:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <7f42ae75-c269-68a9-9037-91fd2ff6cbff@amd.com>
In-Reply-To: <7f42ae75-c269-68a9-9037-91fd2ff6cbff@amd.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 30 Jan 2023 14:04:43 +0100
Message-ID: <CAN5uoS-nT1Bi0dhf74Hpv9LS6XPeTCdZ7sujAKNjacZ+PNh4xA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Cyrille Fleury <cyrille.fleury@nxp.com>, Olivier Masse <olivier.masse@nxp.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Christian, Olivier,


On Fri, 27 Jan 2023 at 12:19, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Hi guys,
>
> Am 27.01.23 um 11:54 schrieb Olivier Masse:
> > Hi Joakim,
> > Hi Etienne,
> >
> > Let me bring back this pull request for OPTEE Linux driver.
> >
> > Last feedback was from Christian K=C3=B6nig and Sumit Garg.
> >  From Christian:
> >> Just two comments:
> >>
> >> 1. Dmitry is working on a change which renames some functions and
> >> makes
> >> it mandatory to call them with the dma_resv lock held.
> >>
> >> Depending on how you want to upstream this change you will certainly
> >> run
> >> into conflicts with that.
> > Is there any update on these changes ?
>
> Just FYI: The upstream changes Dmitry worked on are now committed, so
> you just need to rebase your work on top and send it out once more.

Could you point out the changes you're referring to?  Is it the below chang=
e?

I've reviewed this change. It looks good to me, at least for opteee driver =
side,
with few fixes in the tee_shm_register_fd() error case path.

Br,
etienne


>
> >> 2. Would it be possible to do this dynamically? In other words does
> >> the
> >> tee driver has a concept of buffers moving around?
> > We do not support dynamic secure memory heap.
>
> That's not an issue. If you pin the memory anyway then you can expose it
> pinned through DMA-buf as well.
>
> The only thing you should avoid is pinning it extra for DMA-buf, because
> then you often create a really nice possibility for an OOM deny of servic=
e.
>
> Regards,
> Christian.
>
> >
> >  From Sumit:
> >> What limits you to extend this feature to non-contiguous memory
> >> buffers? I believe that should be possible with OP-TEE dynamic shared
> >> memory which gives you the granularity to register a list of pages.
> > Our solution use a fixed protected reserved memory region and do not
> > rely on a dynamic protection managed in secure.
> >
> > The scope of this implementation rely on a static memory region handled
> > by a specific DMA Heap type.
> >
> > Best regards,
> > Olivier MASSE
> >
> >
> > On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
> >> From: Etienne Carriere <etienne.carriere@linaro.org>
> >>
> >> This change allows userland to create a tee_shm object that refers
> >> to a dmabuf reference.
> >>
> >> Userland provides a dmabuf file descriptor as buffer reference.
> >> The created tee_shm object exported as a brand new dmabuf reference
> >> used to provide a clean fd to userland. Userland shall closed this
> >> new
> >> fd to release the tee_shm object resources. The initial dmabuf
> >> resources
> >> are tracked independently through original dmabuf file descriptor.
> >>
> >> Once the buffer is registered and until it is released, TEE driver
> >> keeps a refcount on the registered dmabuf structure.
> >>
> >> This change only support dmabuf references that relates to physically
> >> contiguous memory buffers.
> >>
> >> New tee_shm flag to identify tee_shm objects built from a registered
> >> dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged with
> >> TEE_SHM_EXT_DMA_BUF.
> >>
> >> Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> >> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> From: https://github.com/linaro-swg/linux.git
> >> (cherry picked from commit 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> >> ---
> >>   drivers/tee/tee_core.c   | 38 +++++++++++++++
> >>   drivers/tee/tee_shm.c    | 99
> >> +++++++++++++++++++++++++++++++++++++++-
> >>   include/linux/tee_drv.h  | 11 +++++
> >>   include/uapi/linux/tee.h | 29 ++++++++++++
> >>   4 files changed, 175 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >> index 8aa1a4836b92..7c45cbf85eb9 100644
> >> --- a/drivers/tee/tee_core.c
> >> +++ b/drivers/tee/tee_core.c
> >> @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >>      return ret;
> >>   }
> >>
> >> +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> >> +                                 struct
> >> tee_ioctl_shm_register_fd_data __user *udata)
> >> +{
> >> +    struct tee_ioctl_shm_register_fd_data data;
> >> +    struct tee_shm *shm;
> >> +    long ret;
> >> +
> >> +    if (copy_from_user(&data, udata, sizeof(data)))
> >> +            return -EFAULT;
> >> +
> >> +    /* Currently no input flags are supported */
> >> +    if (data.flags)
> >> +            return -EINVAL;
> >> +
> >> +    shm =3D tee_shm_register_fd(ctx, data.fd);
> >> +    if (IS_ERR(shm))
> >> +            return -EINVAL;
> >> +
> >> +    data.id =3D shm->id;
> >> +    data.flags =3D shm->flags;
> >> +    data.size =3D shm->size;
> >> +
> >> +    if (copy_to_user(udata, &data, sizeof(data)))
> >> +            ret =3D -EFAULT;
> >> +    else
> >> +            ret =3D tee_shm_get_fd(shm);
> >> +
> >> +    /*
> >> +     * When user space closes the file descriptor the shared memory
> >> +     * should be freed or if tee_shm_get_fd() failed then it will
> >> +     * be freed immediately.
> >> +     */
> >> +    tee_shm_put(shm);
> >> +    return ret;
> >> +}
> >> +
> >>   static int params_from_user(struct tee_context *ctx, struct
> >> tee_param *params,
> >>                          size_t num_params,
> >>                          struct tee_ioctl_param __user *uparams)
> >> @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned
> >> int cmd, unsigned long arg)
> >>              return tee_ioctl_shm_alloc(ctx, uarg);
> >>      case TEE_IOC_SHM_REGISTER:
> >>              return tee_ioctl_shm_register(ctx, uarg);
> >> +    case TEE_IOC_SHM_REGISTER_FD:
> >> +            return tee_ioctl_shm_register_fd(ctx, uarg);
> >>      case TEE_IOC_OPEN_SESSION:
> >>              return tee_ioctl_open_session(ctx, uarg);
> >>      case TEE_IOC_INVOKE:
> >> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> >> index 836872467dc6..55a3fbbb022e 100644
> >> --- a/drivers/tee/tee_shm.c
> >> +++ b/drivers/tee/tee_shm.c
> >> @@ -4,6 +4,7 @@
> >>    */
> >>   #include <linux/anon_inodes.h>
> >>   #include <linux/device.h>
> >> +#include <linux/dma-buf.h>
> >>   #include <linux/idr.h>
> >>   #include <linux/mm.h>
> >>   #include <linux/sched.h>
> >> @@ -12,6 +13,14 @@
> >>   #include <linux/uio.h>
> >>   #include "tee_private.h"
> >>
> >> +/* extra references appended to shm object for registered shared
> >> memory */
> >> +struct tee_shm_dmabuf_ref {
> >> +     struct tee_shm shm;
> >> +     struct dma_buf *dmabuf;
> >> +     struct dma_buf_attachment *attach;
> >> +     struct sg_table *sgt;
> >> +};
> >> +
> >>   static void shm_put_kernel_pages(struct page **pages, size_t
> >> page_count)
> >>   {
> >>      size_t n;
> >> @@ -71,7 +80,16 @@ static void release_registered_pages(struct
> >> tee_shm *shm)
> >>
> >>   static void tee_shm_release(struct tee_device *teedev, struct
> >> tee_shm *shm)
> >>   {
> >> -    if (shm->flags & TEE_SHM_POOL) {
> >> +    if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> >> +            struct tee_shm_dmabuf_ref *ref;
> >> +
> >> +            ref =3D container_of(shm, struct tee_shm_dmabuf_ref,
> >> shm);
> >> +            dma_buf_unmap_attachment(ref->attach, ref->sgt,
> >> +                                     DMA_BIDIRECTIONAL);
> >> +
> >> +            dma_buf_detach(ref->dmabuf, ref->attach);
> >> +            dma_buf_put(ref->dmabuf);
> >> +    } else if (shm->flags & TEE_SHM_POOL) {
> >>              teedev->pool->ops->free(teedev->pool, shm);
> >>      } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >>              int rc =3D teedev->desc->ops->shm_unregister(shm->ctx,
> >> shm);
> >> @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct
> >> tee_context *ctx, size_t size)
> >>    * tee_client_invoke_func(). The memory allocated is later freed
> >> with a
> >>    * call to tee_shm_free().
> >>    *
> >> - * @returns a pointer to 'struct tee_shm'
> >> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
> >> failure
> >>    */
> >>   struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,
> >> size_t size)
> >>   {
> >> @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct
> >> tee_context *ctx, size_t size)
> >>   }
> >>   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >>
> >> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> >> +{
> >> +    struct tee_shm_dmabuf_ref *ref;
> >> +    int rc;
> >> +
> >> +    if (!tee_device_get(ctx->teedev))
> >> +            return ERR_PTR(-EINVAL);
> >> +
> >> +    teedev_ctx_get(ctx);
> >> +
> >> +    ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> >> +    if (!ref) {
> >> +            rc =3D -ENOMEM;
> >> +            goto err_put_tee;
> >> +    }
> >> +
> >> +    refcount_set(&ref->shm.refcount, 1);
> >> +    ref->shm.ctx =3D ctx;
> >> +    ref->shm.id =3D -1;
> >> +
> >> +    ref->dmabuf =3D dma_buf_get(fd);
> >> +    if (IS_ERR(ref->dmabuf)) {
> >> +            rc =3D PTR_ERR(ref->dmabuf);
> >> +            goto err_put_dmabuf;

goto err_put_tee

> >> +    }
> >> +
> >> +    ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx-
> >>> teedev->dev);
> >> +    if (IS_ERR(ref->attach)) {
> >> +            rc =3D PTR_ERR(ref->attach);
> >> +            goto err_detach;

goto err_put_dmabuf

> >> +    }
> >> +
> >> +    ref->sgt =3D dma_buf_map_attachment(ref->attach,
> >> DMA_BIDIRECTIONAL);
> >> +    if (IS_ERR(ref->sgt)) {
> >> +            rc =3D PTR_ERR(ref->sgt);
> >> +            goto err_unmap_attachement;

goto err_detach

> >> +    }
> >> +
> >> +    if (sg_nents(ref->sgt->sgl) !=3D 1) {
> >> +            rc =3D PTR_ERR(ref->sgt->sgl);
> >> +            goto err_unmap_attachement;
> >> +    }
> >> +
> >> +    ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> >> +    ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> >> +    ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> >> +
> >> +    mutex_lock(&ref->shm.ctx->teedev->mutex);
> >> +    ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> >> +                            1, 0, GFP_KERNEL);
> >> +    mutex_unlock(&ref->shm.ctx->teedev->mutex);
> >> +    if (ref->shm.id < 0) {
> >> +            rc =3D ref->shm.id;
> >> +            goto err_idr_remove;

goto err_unmap_attachement

> >> +    }
> >> +
> >> +    return &ref->shm;
> >> +
> >> +err_idr_remove:
> >> +    mutex_lock(&ctx->teedev->mutex);
> >> +    idr_remove(&ctx->teedev->idr, ref->shm.id);
> >> +    mutex_unlock(&ctx->teedev->mutex);

Can remove the 4 above lines.

> >> +err_unmap_attachement:
> >> +    dma_buf_unmap_attachment(ref->attach, ref->sgt,
> >> DMA_BIDIRECTIONAL);
> >> +err_detach:
> >> +    dma_buf_detach(ref->dmabuf, ref->attach);
> >> +err_put_dmabuf:
> >> +    dma_buf_put(ref->dmabuf);
> >> +    kfree(ref);
> >> +err_put_tee:
> >> +    teedev_ctx_put(ctx);
> >> +    tee_device_put(ctx->teedev);
> >> +
> >> +    return ERR_PTR(rc);
> >> +}
> >> +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> >> +
> >>   static struct tee_shm *
> >>   register_shm_helper(struct tee_context *ctx, unsigned long addr,
> >>                  size_t length, u32 flags, int id)
> >> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> >> index 911cad324acc..40ddd5376c2d 100644
> >> --- a/include/linux/tee_drv.h
> >> +++ b/include/linux/tee_drv.h
> >> @@ -25,6 +25,7 @@
> >>   #define TEE_SHM_USER_MAPPED        BIT(1)  /* Memory mapped in user =
space
> >> */
> >>   #define TEE_SHM_POOL               BIT(2)  /* Memory allocated from =
pool
> >> */
> >>   #define TEE_SHM_PRIV               BIT(3)  /* Memory private to TEE =
driver
> >> */
> >> +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
> >> handle */
> >>
> >>   struct device;
> >>   struct tee_device;
> >> @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct
> >> tee_context *ctx, size_t size);
> >>   struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >>                                          void *addr, size_t length);
> >>
> >> +/**
> >> + * tee_shm_register_fd() - Register shared memory from file
> >> descriptor
> >> + *
> >> + * @ctx:    Context that allocates the shared memory
> >> + * @fd:             Shared memory file descriptor reference
> >> + *
> >> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
> >> failure
> >> + */
> >> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> >> fd);
> >> +
> >>   /**
> >>    * tee_shm_is_dynamic() - Check if shared memory object is of the
> >> dynamic kind
> >>    * @shm:   Shared memory handle
> >> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> >> index 25a6c534beb1..baf3cd7cfdac 100644
> >> --- a/include/uapi/linux/tee.h
> >> +++ b/include/uapi/linux/tee.h
> >> @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> >>   #define TEE_IOC_SHM_ALLOC  _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1,
> >> \
> >>                                   struct tee_ioctl_shm_alloc_data)
> >>
> >> +/**
> >> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering
> >> argument
> >> + * @fd:             [in] File descriptor identifying the shared
> >> memory
> >> + * @size:   [out] Size of shared memory to allocate
> >> + * @flags:  [in] Flags to/from allocation.
> >> + * @id:             [out] Identifier of the shared memory
> >> + *
> >> + * The flags field should currently be zero as input. Updated by the
> >> call
> >> + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> >> + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
> >> below.
> >> + */
> >> +struct tee_ioctl_shm_register_fd_data {
> >> +    __s64 fd;
> >> +    __u64 size;
> >> +    __u32 flags;
> >> +    __s32 id;
> >> +} __attribute__ ((aligned (8)));
> >> +
> >> +/**
> >> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file
> >> descriptor
> >> + *
> >> + * Returns a file descriptor on success or < 0 on failure
> >> + *
> >> + * The returned file descriptor refers to the shared memory object
> >> in kernel
> >> + * land. The shared memory is freed when the descriptor is closed.
> >> + */
> >> +#define TEE_IOC_SHM_REGISTER_FD     _IOWR(TEE_IOC_MAGIC,
> >> TEE_IOC_BASE + 8, \
> >> +                                 struct
> >> tee_ioctl_shm_register_fd_data)
> >> +
> >>   /**
> >>    * struct tee_ioctl_buf_data - Variable sized buffer
> >>    * @buf_ptr:       [in] A __user pointer to a buffer
>
