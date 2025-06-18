Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFCCADE3F1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 08:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C09B10E7BB;
	Wed, 18 Jun 2025 06:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PBDvp13k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4799710E7A4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:48:04 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-4066a0d0256so4243673b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 23:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750229283; x=1750834083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnsoLmuO3csUx1qg//UCkqDpzxXEFnkU9Btic+XEOTg=;
 b=PBDvp13kTfqzQjX/9K2SxNxrATVzCVRQ49Drv7wjdDcbxHOkzGcXoeZeAUE/E1cOiq
 F6lFAecvG3DiBEF9rYsyaXFeHDVvOTCld6HEuoQyFQRIXBHXw1ni49Re7CI1HrtPnWpT
 IC5t7vYoLc6cZpnYnjOofibSV3hI3uY6xDGnuJSKXg9rjSJSj51crDFvmczDWattbrlX
 JFkVbtTzif1KN7gUsKH54xCAve/eshMhQWGjW2pl9TKHrnD/hjFtonC24itYJGNv1qnn
 wrftok+ClKfVNBxwrHrzEnj/Jxh2uaSIXI9VU8F3av4r1rMxqm7MZWi/iu8PBkT5x89l
 u6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750229283; x=1750834083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nnsoLmuO3csUx1qg//UCkqDpzxXEFnkU9Btic+XEOTg=;
 b=G/joDzGGVmufKgplFeg0msRHPX8nxkw9Ts0cBkYmhrbii/JTmbeBjh/5lSGmAKDrUq
 Z5NGbkVtAP/yU5A2LeKwA0XtjHwc7zVHBYg2/3XT+7xZw8IPq5xCuYvunvQ0m/VzwyX2
 9XyDPszQXXxvs7udWtVLl3QxI8NLZ4D8P1piuwqGnPKpjkirA4mWilqA0xJe77AxmG7R
 Kc3MBvjxha04qFKEcBBk8LpR/UGhXPu2e/WyYjjCluXsPDHs1JQQzmvk6zvSbaxZTxlp
 ks/wHQgWZPQiU4m+hUYiEei3QXue9KTIdrpe7qcdHwSGjlWahhIxKbAuc7fnm7NeP78U
 U3VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtabIkPlfO8crHnfPLVSGX9t8S52PdU3+D5qnBqHNp66KKjRpS6R/jAhZkWoB/g5mB6Eh7Wlsu9MI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYKp9Xugm8tCGQsH22p/bR38pj5ulrDXYF1sg58txFpBSPGAsd
 JpLLQutbmTjtQaSrwjSNAu1inCpwlXXlEbe2uBRfKmnDaBkjHYWnsB2f21ciGmd59qRdGgNysPa
 l05FZlq+6qKzOQbGZEiw6hB0kjW7jwA7EKXxqh7+qqQ==
X-Gm-Gg: ASbGnctc5G03ykYjPBPSSd8NNx2lu2apDmJEr+yCDq9d5SsEOm2KT3enMyFBxZXJ01X
 dRJyOfo29A1yhhErmR3wLSrRfcpMq+E7177UKL7pe11okziv20PkWgEPX7/3F0uN8RNtkYURrQU
 4td1A2GNA44kkV620NtzCooYpJR6kQ+TLQpgPrfDzTaZo=
X-Google-Smtp-Source: AGHT+IFP9EIG3tj0jAgtNhGjoHkRLBhC6oVQyPRvROrony9d3p9WGI2/mxvN0ZbrFjL6zlrp4PgKd9Szo6hKSr5lv8Q=
X-Received: by 2002:a05:6808:1825:b0:401:e6f0:a8d4 with SMTP id
 5614622812f47-40a7c1b1f7emr11398476b6e.5.1750229283226; Tue, 17 Jun 2025
 23:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-6-jens.wiklander@linaro.org>
 <aFFIAiU4ZSN1qZXK@sumit-X1>
In-Reply-To: <aFFIAiU4ZSN1qZXK@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 18 Jun 2025 08:47:51 +0200
X-Gm-Features: AX0GCFtpgp_r9JKq4Jq2B8UGDsgmMBvkUILLhZ3AbZwtRAMSoPIAJ1YqJQTR_AI
Message-ID: <CAHUa44E=nHjLf2guoG6LzTKZwTQGjEReKUF01PL31BfJ22e9EQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/9] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
 Etienne Carriere <etienne.carriere@foss.st.com>
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

On Tue, Jun 17, 2025 at 12:48=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, Jun 10, 2025 at 03:13:49PM +0200, Jens Wiklander wrote:
> > From: Etienne Carriere <etienne.carriere@foss.st.com>
> >
> > Add a userspace API to create a tee_shm object that refers to a dmabuf
> > reference.
> >
> > Userspace registers the dmabuf file descriptor as in a tee_shm object.
> > The registration is completed with a tee_shm returned file descriptor.
> >
> > Userspace is free to close the dmabuf file descriptor after it has been
> > registered since all the resources are now held via the new tee_shm
> > object.
> >
> > Closing the tee_shm file descriptor will eventually release all
> > resources used by the tee_shm object when all references are released.
> >
> > The new IOCTL, TEE_IOC_SHM_REGISTER_FD, supports dmabuf references to
> > physically contiguous memory buffers. Dmabuf references acquired from
> > the TEE DMA-heap can be used as protected memory for Secure Video Path
> > and such use cases. It depends on the TEE and the TEE driver if dmabuf
> > references acquired by other means can be used.
> >
> > A new tee_shm flag is added to identify tee_shm objects built from a
> > registered dmabuf, TEE_SHM_DMA_BUF.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_core.c    |  63 +++++++++++++++++++++-
> >  drivers/tee/tee_private.h |  10 ++++
> >  drivers/tee/tee_shm.c     | 106 ++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_core.h  |   1 +
> >  include/linux/tee_drv.h   |  10 ++++
> >  include/uapi/linux/tee.h  |  31 +++++++++++
> >  6 files changed, 217 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index 5259b8223c27..0e9d9e5872a4 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -353,11 +353,49 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >       return ret;
> >  }
> >
> > +static int
> > +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                       struct tee_ioctl_shm_register_fd_data __user *u=
data)
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
> >  static int param_from_user_memref(struct tee_context *ctx,
> >                                 struct tee_param_memref *memref,
> >                                 struct tee_ioctl_param *ip)
> >  {
> >       struct tee_shm *shm;
> > +     size_t offs =3D 0;
> >
> >       /*
> >        * If a NULL pointer is passed to a TA in the TEE,
> > @@ -388,6 +426,26 @@ static int param_from_user_memref(struct tee_conte=
xt *ctx,
> >                       tee_shm_put(shm);
> >                       return -EINVAL;
> >               }
> > +
> > +             if (shm->flags & TEE_SHM_DMA_BUF) {
> > +                     struct tee_shm_dmabuf_ref *ref;
> > +
> > +                     ref =3D container_of(shm, struct tee_shm_dmabuf_r=
ef, shm);
> > +                     if (ref->parent_shm) {
> > +                             /*
> > +                              * The shm already has one reference to
> > +                              * ref->parent_shm so we are clear of 0.
> > +                              * We're getting another reference since
> > +                              * this shm will be used in the parameter
> > +                              * list instead of the shm we got with
> > +                              * tee_shm_get_from_id() above.
> > +                              */
> > +                             refcount_inc(&ref->parent_shm->refcount);
> > +                             tee_shm_put(shm);
> > +                             shm =3D ref->parent_shm;
> > +                             offs =3D ref->offset;
> > +                     }
> > +             }
> >       } else if (ctx->cap_memref_null) {
> >               /* Pass NULL pointer to OP-TEE */
> >               shm =3D NULL;
> > @@ -395,7 +453,7 @@ static int param_from_user_memref(struct tee_contex=
t *ctx,
> >               return -EINVAL;
> >       }
> >
> > -     memref->shm_offs =3D ip->a;
> > +     memref->shm_offs =3D ip->a + offs;
> >       memref->size =3D ip->b;
> >       memref->shm =3D shm;
> >
> > @@ -841,6 +899,8 @@ static long tee_ioctl(struct file *filp, unsigned i=
nt cmd, unsigned long arg)
> >               return tee_ioctl_shm_alloc(ctx, uarg);
> >       case TEE_IOC_SHM_REGISTER:
> >               return tee_ioctl_shm_register(ctx, uarg);
> > +     case TEE_IOC_SHM_REGISTER_FD:
> > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> >       case TEE_IOC_OPEN_SESSION:
> >               return tee_ioctl_open_session(ctx, uarg);
> >       case TEE_IOC_INVOKE:
> > @@ -1300,3 +1360,4 @@ MODULE_AUTHOR("Linaro");
> >  MODULE_DESCRIPTION("TEE Driver");
> >  MODULE_VERSION("1.0");
> >  MODULE_LICENSE("GPL v2");
> > +MODULE_IMPORT_NS("DMA_BUF");
> > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > index 6c6ff5d5eed2..308467705da6 100644
> > --- a/drivers/tee/tee_private.h
> > +++ b/drivers/tee/tee_private.h
> > @@ -13,6 +13,16 @@
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> >
> > +/* extra references appended to shm object for registered shared memor=
y */
> > +struct tee_shm_dmabuf_ref {
> > +     struct tee_shm shm;
> > +     size_t offset;
> > +     struct dma_buf *dmabuf;
> > +     struct dma_buf_attachment *attach;
> > +     struct sg_table *sgt;
> > +     struct tee_shm *parent_shm;
> > +};
> > +
> >  int tee_shm_get_fd(struct tee_shm *shm);
> >
> >  bool tee_device_get(struct tee_device *teedev);
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index daf6e5cfd59a..e63095e84644 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -4,6 +4,7 @@
> >   */
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/idr.h>
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> > @@ -45,7 +46,21 @@ static void release_registered_pages(struct tee_shm =
*shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct tee_shm =
*shm)
> >  {
> > -     if (shm->flags & TEE_SHM_POOL) {
> > +     void *p =3D shm;
> > +
> > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +             struct tee_shm_dmabuf_ref *ref;
> > +
> > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > +             p =3D ref;
> > +             if (ref->attach) {
> > +                     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +                                              DMA_BIDIRECTIONAL);
> > +
> > +                     dma_buf_detach(ref->dmabuf, ref->attach);
> > +             }
> > +             dma_buf_put(ref->dmabuf);
> > +     } else if (shm->flags & TEE_SHM_POOL) {
> >               teedev->pool->ops->free(teedev->pool, shm);
> >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, sh=
m);
> > @@ -59,7 +74,7 @@ static void tee_shm_release(struct tee_device *teedev=
, struct tee_shm *shm)
> >
> >       teedev_ctx_put(shm->ctx);
> >
> > -     kfree(shm);
> > +     kfree(p);
> >
> >       tee_device_put(teedev);
> >  }
> > @@ -169,7 +184,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_c=
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
> > @@ -179,6 +194,91 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
e_context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
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
> > +     ref->shm.flags =3D TEE_SHM_DMA_BUF;
> > +
> > +     ref->dmabuf =3D dma_buf_get(fd);
> > +     if (IS_ERR(ref->dmabuf)) {
> > +             rc =3D PTR_ERR(ref->dmabuf);
> > +             goto err_kfree_ref;
> > +     }
> > +
> > +     rc =3D tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> > +                                       &ref->offset, &ref->shm,
> > +                                       &ref->parent_shm);
> > +     if (!rc)
> > +             goto out;
>
> One odd thing I find here, why do we bail out on success case here?
> Don't we need the DMA buffer attach and map APIs to be invoked on
> success case here?

No, because if tee_heap_update_from_dma_buf() succeeds, we know
everything we need about the buffer. Note that we're returning a valid
pointer below to indicate success.

Cheers,
Jens

>
> -Sumit
>
> > +     if (rc !=3D -EINVAL)
> > +             goto err_put_dmabuf;
> > +
> > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
> > +     if (IS_ERR(ref->attach)) {
> > +             rc =3D PTR_ERR(ref->attach);
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONA=
L);
> > +     if (IS_ERR(ref->sgt)) {
> > +             rc =3D PTR_ERR(ref->sgt);
> > +             goto err_detach;
> > +     }
> > +
> > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +             rc =3D -EINVAL;
> > +             goto err_unmap_attachement;
> > +     }
> > +
> > +     ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> > +     ref->shm.size =3D ref->sgt->sgl->length;
> > +
> > +out:
> > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> > +                             1, 0, GFP_KERNEL);
> > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +     if (ref->shm.id < 0) {
> > +             rc =3D ref->shm.id;
> > +             if (ref->attach)
> > +                     goto err_unmap_attachement;
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     return &ref->shm;
> > +
> > +err_unmap_attachement:
> > +     dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL=
);
> > +err_detach:
> > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +     dma_buf_put(ref->dmabuf);
> > +err_kfree_ref:
> > +     kfree(ref);
> > +err_put_tee:
> > +     teedev_ctx_put(ctx);
> > +     tee_device_put(ctx->teedev);
> > +
> > +     return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> >  /**
> >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately s=
hared
> >   *                         kernel buffer
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 22e03d897dc3..f17710196c4c 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -28,6 +28,7 @@
> >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user space */
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver *=
/
> > +#define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf ha=
ndle */
> >
> >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> >  #define TEE_MAX_DEV_NAME_LEN         32
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index a54c203000ed..824f1251de60 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
e_context *ctx, size_t size);
> >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >                                           void *addr, size_t length);
> >
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file descriptor
> > + *
> > + * @ctx:     Context that allocates the shared memory
> > + * @fd:              Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> > +
> >  /**
> >   * tee_shm_free() - Free shared memory
> >   * @shm:     Handle to shared memory to free
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index d0430bee8292..d843cf980d98 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -378,6 +378,37 @@ struct tee_ioctl_shm_register_data {
> >       __s32 id;
> >  };
> >
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory registering a=
rgument
> > + * @fd:              [in] File descriptor identifying dmabuf reference
> > + * @size:    [out] Size of referenced memory
> > + * @flags:   [in] Flags to/from allocation.
> > + * @id:              [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by the c=
all
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD belo=
w.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +     __s64 fd;
> > +     __u64 size;
> > +     __u32 flags;
> > +     __s32 id;
> > +};
> > +
> > +/**
> > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file desc=
riptor
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor refers to the shared memory object in =
the
> > + * kernel. The supplied file deccriptor can be closed if it's not need=
ed
> > + * for other purposes. The shared memory is freed when the descriptor =
is
> > + * closed.
> > + */
> > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE=
 + 8, \
> > +                                  struct tee_ioctl_shm_register_fd_dat=
a)
> > +
> >  /**
> >   * TEE_IOC_SHM_REGISTER - Register shared memory argument
> >   *
> > --
> > 2.43.0
> >
