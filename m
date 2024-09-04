Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F796B751
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE9310E0AA;
	Wed,  4 Sep 2024 09:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AKBNphNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C55E10E0AA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:49:18 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5e172cc6d66so1648337eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725443357; x=1726048157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpZ7KdRqBjlI4gv4PMlRGcwdk6EzHsOECmqGEz11ZOc=;
 b=AKBNphNOUSAboe9ZkmefTekH+VCpo95/FIkyCgFDAjfqJ8FxjfuhsjdRmJg0/5g5QS
 aI4pKcHA1GwStEtWzfX7tnVNEVXeXe2IuiBOqYnkNpfCm3u/RGLB3GCrY8a+bH1HoZNo
 NslhroNWDf5mI1d3kB3qhGqZLgtpj/T3YNS7L6E2VcSpC75NvmChn4AHWd8Gdji2GyKR
 Qu7LbNirlMeOB8qOiuCz52eIUw3YKuja/ceK5nbrTHa5oC2X1U9/OEC+7Ib6DS+75HAu
 bChyuwmswnFQ8fhUCLa4nOuYm4KXbrose+B44ZR7Xbo0U1Pj2hMx1YLLblcMIM6TsdeU
 6UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725443357; x=1726048157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpZ7KdRqBjlI4gv4PMlRGcwdk6EzHsOECmqGEz11ZOc=;
 b=S9NoW+t7lndDTvAOpPCLR5eY7m+0SH2VKD7GSXbt/0MsbhVHAwsDfp5z8PLYk9H45b
 XDa3i3bdD0DF/sru3t3ywaKjWHAPTh8NMR1gH9ItvRRfxydJ6stAI8rWyuBG+IQVgkw3
 nuCkChO8dNxJiMFvy9ZEftAb1g7qL/yeapwR+6ARMVkYU9VwoYIGzEjSBxKfMmkSMVJV
 Lpp7McuXIYNO6pU2PbY5X5LK3Spv2fkNdCA1z8db626XjyFvZBvduaVq/bpj8xWsJUtw
 IDKHrmNkBWKtU9i1LXzddqVgjPQcXuYX3IAC2qiEHrj5RS7i9pqsyBxr3hREWFkkCVq1
 yn6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXGf+iRmTmAPU3Omwo/jhcs5ky9Y/Q7nYRNmkP3JTFYwaQiAvaSIuyFXuo8qcSGkFAT4KTbPpy688=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaFyk0V9fPAJCRCfMgaInO7kOyxdPFobnThWE5eg4YfpAfjM5k
 /mGE7VBtIZxd0Gk2cMEgIG39mFbXKdwHbDl73SUBxH8GKO5UuTkg69trP5Bb2rz6GkRh/sibmKS
 EHOyT75kZKbRDwk1yuF0HLjHoUkbNqNS+s0qVCw==
X-Google-Smtp-Source: AGHT+IEiz409Dd1CoVYf0iPvsq+r4irwqwy0woQMNOijgx+ZDuuXpfWlT5y5hKMkjy9IqrAvLIbrceafR3Xii3Kutro=
X-Received: by 2002:a05:6870:f691:b0:277:f301:40ce with SMTP id
 586e51a60fabf-2781a7abfc4mr5476161fac.20.1725443357455; Wed, 04 Sep 2024
 02:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-3-jens.wiklander@linaro.org>
 <CABdmKX02Zd98euuxvKHuV2C5Cng+4P3_8UL3xn2apMP9to+KOA@mail.gmail.com>
In-Reply-To: <CABdmKX02Zd98euuxvKHuV2C5Cng+4P3_8UL3xn2apMP9to+KOA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Sep 2024 11:49:06 +0200
Message-ID: <CAHUa44HfZ=xT8QFvseR_-e3xhYWQU9kg=Q-wgxN5noXBi_cLbg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Etienne Carriere <etienne.carriere@linaro.org>
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
> > From: Etienne Carriere <etienne.carriere@linaro.org>
> >
> > Enable userspace to create a tee_shm object that refers to a dmabuf
> > reference.
> >
> > Userspace registers the dmabuf file descriptor as in a tee_shm object.
> > The registration is completed with a tee_shm file descriptor returned t=
o
> > userspace.
> >
> > Userspace is free to close the dmabuf file descriptor now since all the
> > resources are now held via the tee_shm object.
> >
> > Closing the tee_shm file descriptor will release all resources used by =
the
> > tee_shm object.
> >
> > This change only support dmabuf references that relates to physically
> > contiguous memory buffers.
> >
> > New tee_shm flag to identify tee_shm objects built from a registered
> > dmabuf, TEE_SHM_DMA_BUF.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_core.c   |  38 ++++++++++++++
> >  drivers/tee/tee_shm.c    | 104 +++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_drv.h  |  11 +++++
> >  include/uapi/linux/tee.h |  29 +++++++++++
> >  4 files changed, 179 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index e59c20d74b36..3dfd5428d58c 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -356,6 +356,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >         return ret;
> >  }
> >
> > +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                                    struct tee_ioctl_shm_register_fd_d=
ata __user *udata)
> > +{
> > +       struct tee_ioctl_shm_register_fd_data data;
> > +       struct tee_shm *shm;
> > +       long ret;
> > +
> > +       if (copy_from_user(&data, udata, sizeof(data)))
> > +               return -EFAULT;
> > +
> > +       /* Currently no input flags are supported */
> > +       if (data.flags)
> > +               return -EINVAL;
> > +
> > +       shm =3D tee_shm_register_fd(ctx, data.fd);
> > +       if (IS_ERR(shm))
> > +               return -EINVAL;
> > +
> > +       data.id =3D shm->id;
> > +       data.flags =3D shm->flags;
> > +       data.size =3D shm->size;
> > +
> > +       if (copy_to_user(udata, &data, sizeof(data)))
> > +               ret =3D -EFAULT;
> > +       else
> > +               ret =3D tee_shm_get_fd(shm);
> > +
> > +       /*
> > +        * When user space closes the file descriptor the shared memory
> > +        * should be freed or if tee_shm_get_fd() failed then it will
> > +        * be freed immediately.
> > +        */
> > +       tee_shm_put(shm);
> > +       return ret;
> > +}
> > +
> >  static int params_from_user(struct tee_context *ctx, struct tee_param =
*params,
> >                             size_t num_params,
> >                             struct tee_ioctl_param __user *uparams)
> > @@ -830,6 +866,8 @@ static long tee_ioctl(struct file *filp, unsigned i=
nt cmd, unsigned long arg)
> >                 return tee_ioctl_shm_alloc(ctx, uarg);
> >         case TEE_IOC_SHM_REGISTER:
> >                 return tee_ioctl_shm_register(ctx, uarg);
> > +       case TEE_IOC_SHM_REGISTER_FD:
> > +               return tee_ioctl_shm_register_fd(ctx, uarg);
> >         case TEE_IOC_OPEN_SESSION:
> >                 return tee_ioctl_open_session(ctx, uarg);
> >         case TEE_IOC_INVOKE:
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index 731d9028b67f..a1cb3c8b6423 100644
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
> > @@ -14,6 +15,14 @@
> >  #include <linux/highmem.h>
> >  #include "tee_private.h"
> >
> > +/* extra references appended to shm object for registered shared memor=
y */
> > +struct tee_shm_dmabuf_ref {
> > +       struct tee_shm shm;
> > +       struct dma_buf *dmabuf;
> > +       struct dma_buf_attachment *attach;
> > +       struct sg_table *sgt;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t page_coun=
t)
> >  {
> >         size_t n;
> > @@ -44,7 +53,16 @@ static void release_registered_pages(struct tee_shm =
*shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct tee_shm =
*shm)
> >  {
> > -       if (shm->flags & TEE_SHM_POOL) {
> > +       if (shm->flags & TEE_SHM_DMA_BUF) {
> > +               struct tee_shm_dmabuf_ref *ref;
> > +
> > +               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, sh=
m);
> > +               dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +               DMA_BIDIRECTIONAL);
> > +
> > +               dma_buf_detach(ref->dmabuf, ref->attach);
> > +               dma_buf_put(ref->dmabuf);
> > +       } else if (shm->flags & TEE_SHM_POOL) {
> >                 teedev->pool->ops->free(teedev->pool, shm);
> >         } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >                 int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, =
shm);
> > @@ -56,7 +74,8 @@ static void tee_shm_release(struct tee_device *teedev=
, struct tee_shm *shm)
> >                 release_registered_pages(shm);
> >         }
> >
> > -       teedev_ctx_put(shm->ctx);
> > +       if (shm->ctx)
> > +               teedev_ctx_put(shm->ctx);
> >
> >         kfree(shm);
> >
> > @@ -168,7 +187,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_c=
ontext *ctx, size_t size)
> >   * tee_client_invoke_func(). The memory allocated is later freed with =
a
> >   * call to tee_shm_free().
> >   *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> >   */
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size=
_t size)
> >  {
> > @@ -178,6 +197,85 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
e_context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
> >
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> > +{
> > +       struct tee_shm_dmabuf_ref *ref;
> > +       int rc;
> > +
> > +       if (!tee_device_get(ctx->teedev))
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       teedev_ctx_get(ctx);
> > +
> > +       ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > +       if (!ref) {
> > +               rc =3D -ENOMEM;
> > +               goto err_put_tee;
> > +       }
> > +
> > +       refcount_set(&ref->shm.refcount, 1);
> > +       ref->shm.ctx =3D ctx;
> > +       ref->shm.id =3D -1;
> > +
> > +       ref->dmabuf =3D dma_buf_get(fd);
> > +       if (IS_ERR(ref->dmabuf)) {
> > +               rc =3D PTR_ERR(ref->dmabuf);
> > +               goto err_put_dmabuf;
> > +       }
>
> Hi,
>
> Most of the gotos in the errors paths from here on look offset by one
> to me. Attempting to put a dmabuf after failing to get, detaching
> after failing to attach, unmapping after failing to map, removing an
> IDR after failing to allocate one.

You're right, I'll fix them.

Thanks,
Jens

>
>
> > +
> > +       ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx->teed=
ev->dev);
> > +       if (IS_ERR(ref->attach)) {
> > +               rc =3D PTR_ERR(ref->attach);
> > +               goto err_detach;
> > +       }
> > +
> > +       ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIO=
NAL);
> > +       if (IS_ERR(ref->sgt)) {
> > +               rc =3D PTR_ERR(ref->sgt);
> > +               goto err_unmap_attachement;
> > +       }
> > +
> > +       if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +               rc =3D PTR_ERR(ref->sgt->sgl);
> > +               goto err_unmap_attachement;
> > +       }
> > +
> > +       ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> > +       ref->shm.size =3D ref->sgt->sgl->length;
> > +       ref->shm.flags =3D TEE_SHM_DMA_BUF;
> > +
> > +       mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +       ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm=
,
> > +                               1, 0, GFP_KERNEL);
> > +       mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +       if (ref->shm.id < 0) {
> > +               rc =3D ref->shm.id;
> > +               goto err_idr_remove;
> > +       }
> > +
> > +       return &ref->shm;
> > +
> > +err_idr_remove:
> > +       mutex_lock(&ctx->teedev->mutex);
> > +       idr_remove(&ctx->teedev->idr, ref->shm.id);
> > +       mutex_unlock(&ctx->teedev->mutex);
> > +err_unmap_attachement:
> > +       dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTION=
AL);
> > +err_detach:
> > +       dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +       dma_buf_put(ref->dmabuf);
> > +       kfree(ref);
> > +err_put_tee:
> > +       teedev_ctx_put(ctx);
> > +       tee_device_put(ctx->teedev);
> > +
> > +       return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> > +
> > +
> >  /**
> >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately s=
hared
> >   *                           kernel buffer
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index 71632e3c5f18..6a1fee689007 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -25,6 +25,7 @@
> >  #define TEE_SHM_USER_MAPPED    BIT(1)  /* Memory mapped in user space =
*/
> >  #define TEE_SHM_POOL           BIT(2)  /* Memory allocated from pool *=
/
> >  #define TEE_SHM_PRIV           BIT(3)  /* Memory private to TEE driver=
 */
> > +#define TEE_SHM_DMA_BUF                BIT(4)  /* Memory with dma-buf =
handle */
> >
> >  struct device;
> >  struct tee_device;
> > @@ -275,6 +276,16 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t=
 size);
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size=
_t size);
> >
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file descriptor
> > + *
> > + * @ctx:       Context that allocates the shared memory
> > + * @fd:                Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> > +
> >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >                                             void *addr, size_t length);
> >
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index 23e57164693c..77bc8ef24d3c 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -117,6 +117,35 @@ struct tee_ioctl_shm_alloc_data {
> >  #define TEE_IOC_SHM_ALLOC      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, =
\
> >                                      struct tee_ioctl_shm_alloc_data)
> >
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory registering a=
rgument
> > + * @fd:                [in] File descriptor identifying the shared mem=
ory
> > + * @size:      [out] Size of shared memory to allocate
> > + * @flags:     [in] Flags to/from allocation.
> > + * @id:                [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by the c=
all
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD belo=
w.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +       __s64 fd;
> > +       __u64 size;
> > +       __u32 flags;
> > +       __s32 id;
> > +} __aligned(8);
> > +
> > +/**
> > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file desc=
riptor
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor refers to the shared memory object in =
kernel
> > + * land. The shared memory is freed when the descriptor is closed.
> > + */
> > +#define TEE_IOC_SHM_REGISTER_FD        _IOWR(TEE_IOC_MAGIC, TEE_IOC_BA=
SE + 8, \
> > +                                    struct tee_ioctl_shm_register_fd_d=
ata)
> > +
> >  /**
> >   * struct tee_ioctl_buf_data - Variable sized buffer
> >   * @buf_ptr:   [in] A __user pointer to a buffer
> > --
> > 2.34.1
> >
