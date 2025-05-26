Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4FAC3BBC
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 10:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D55510E2D7;
	Mon, 26 May 2025 08:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lD9IEOCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE4E10E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:34:31 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-6064d4c14ebso365102eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748248471; x=1748853271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LoPH61q8XPOjbfYzC/BfDY+1ePizQkOc/PLdT+sy2I=;
 b=lD9IEOCUTXnMcIFMrRZG7Z2qFxDiOTMwRfNuDL08xuMhFHxpTcvQyvV6rjS/p4gYhn
 kSK0JAEQVIhSP/Y/yxn9gy26+5JUNS/bKJhYnU3Fli5fm0GRnrG4uUpXpC6Z5TMOdaY9
 6T355PZwvhcFzO6OKZiwV4G2DJkTNYJw/Lf9ZfHEdGbLgeizQm1lDsNf3I2yhkCF/2RL
 SYN5G/4QUHWx024EHClMf67SCt4/+SE7tCSAumCxY6VATvgTH9xiGoM0EKY9N6Qnu7sI
 RLFaCmL6OoD9nAH69J3SDjvx3oLY/iMk9KHVHo09Au3cARsDBYC7eYTnuB9HGUE62SvO
 0cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748248471; x=1748853271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7LoPH61q8XPOjbfYzC/BfDY+1ePizQkOc/PLdT+sy2I=;
 b=fiNYu3x1VK7e9tAxDGawG5q7UbO0gjRbronu3O59iFuZA6lCJzQ6Aqa6j/ZniJ0iOm
 Z4bqO8FHd795TghvOOWkrOHK+3tq4Caj4BekMzn2t04OwB/TKLXnWeZmuNtZrrEZhTxQ
 ECEecr0Iv4uNXbyNevTw8dSNH+Ym+85rnZziW0ki7LNRkzQBAamTxdAxcqtGYNX4P3IP
 lLTIvxniIjSAtwLdcf86HxA9G0mv3jrDPocBy7/eoi02z7UymZWjXrl4AJr0928IOTUx
 6cSRXWKQUirBh4gEhbaUexW4pWUrRgv2OHzgIIQZHmN5CGFK4oCCJhmV161S8yW8w/D9
 J56w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI7LWO0EB/iIU6WbE7N7VrEsnw7IJ6XzGoo5x267o85RLprSHeaTVXNR0wI+Rj7KAmUxBP6Vq4o0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7ohtEIx1qk+idRdFxbP36Lzm8C9dkQlzHI/oNPeeO7VTShyum
 asSzyoMjuV/K2nlpdU22vdU6lZAcRZvHlgSi95+VxOhE2cvf5ymcdEqRGPGLU/r/8mHmASGyQ/K
 tjGmgQMQHeGKlFUtU9nS05T8iUhByGp8+mPt7t+udxg==
X-Gm-Gg: ASbGncui0LPnLZBGdrPJToSxMmnc5bdxFCj/ibNRdw6uG+wl25LrXwkWxWIysOgZT0P
 zPOjeHYwTgEgTam1s9pTD5DjkPo/QANRMWdt3CNftQnqCsRR0FHCFJnJjq7dij8usTEGXUeCTx/
 HTzMhnC1txO8Pb1bQcgGnwMzvqNJIdZcFEOw==
X-Google-Smtp-Source: AGHT+IFs3UDjqOTSdOv6JwCPw8TzCpICd///u1SEUHvDHq7LoL4mVZ404dtJorGcqUi4neHh1nyFbCGcltbAy56lHN4=
X-Received: by 2002:a05:6820:4c0c:b0:60b:a766:f6d7 with SMTP id
 006d021491bc7-60ba766f853mr3600749eaf.6.1748248470410; Mon, 26 May 2025
 01:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-6-jens.wiklander@linaro.org>
 <aDB4oxesn5iIM4l8@sumit-X1>
In-Reply-To: <aDB4oxesn5iIM4l8@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 26 May 2025 10:34:19 +0200
X-Gm-Features: AX0GCFsC50wYBTGhqsG2zZYjbYVgiFZNJUDoCbXOMed-L280EoIu_JPErd75zlk
Message-ID: <CAHUa44EyuC8jg=du+_G1uuPqDPD-dU0EVi9jiy_edYiMVQ8dPA@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, 
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

On Fri, May 23, 2025 at 3:31=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 05:16:48PM +0200, Jens Wiklander wrote:
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
> >  drivers/tee/tee_shm.c     | 111 ++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_core.h  |   1 +
> >  include/linux/tee_drv.h   |  10 ++++
> >  include/uapi/linux/tee.h  |  31 +++++++++++
> >  6 files changed, 221 insertions(+), 5 deletions(-)
>
> With below minor comments fixed, feel free to add:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
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
>
> Is this an issue being detected now? If yes then shouldn't it be a
> separate fix eligible for backport?

No, this is to add an eventual offset for a TEE_SHM_DMA_BUF, introduced abo=
ve.

>
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
> > index daf6e5cfd59a..e1ed52ee0a16 100644
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
> > @@ -45,7 +46,23 @@ static void release_registered_pages(struct tee_shm =
*shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct tee_shm =
*shm)
> >  {
> > -     if (shm->flags & TEE_SHM_POOL) {
> > +     struct tee_shm *parent_shm =3D NULL;
> > +     void *p =3D shm;
> > +
> > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +             struct tee_shm_dmabuf_ref *ref;
> > +
> > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > +             parent_shm =3D ref->parent_shm;
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
> > @@ -57,9 +74,10 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >               release_registered_pages(shm);
> >       }
> >
> > -     teedev_ctx_put(shm->ctx);
> > +     if (shm->ctx)
> > +             teedev_ctx_put(shm->ctx);
>
> redundant change?

Yes, I'll remove it.

>
> >
> > -     kfree(shm);
> > +     kfree(p);
> >
> >       tee_device_put(teedev);
> >  }
> > @@ -169,7 +187,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_c=
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
> > @@ -179,6 +197,91 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
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
> > index b8b99c97e00c..02c07f661349 100644
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
> > index d0430bee8292..8ec5f46fbfbe 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -118,6 +118,37 @@ struct tee_ioctl_shm_alloc_data {
> >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
> >                                    struct tee_ioctl_shm_alloc_data)
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
>
> Please add this IOCTL in correct sequence order.

OK, I'll fix it.

Thanks,
Jens

>
> -Sumit
>
> > +
> >  /**
> >   * struct tee_ioctl_buf_data - Variable sized buffer
> >   * @buf_ptr: [in] A __user pointer to a buffer
> > --
> > 2.43.0
> >
