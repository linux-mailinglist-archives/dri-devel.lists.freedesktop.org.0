Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07829E14BC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 08:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206EC10E921;
	Tue,  3 Dec 2024 07:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sgX5L7Bw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4BC10E921
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 07:58:10 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4aefcb3242aso1575711137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 23:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733212689; x=1733817489; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vuNLcU/D31i1jfqZ+fIe0HAjA1squHV+IYSLE5R8A94=;
 b=sgX5L7Bwbu6EfDLuY1DrEiYJuEPC9x/67Dm9n6TG+E6IpsaQK6rm64CdDXdvtvWZIE
 Az52Sma4f/coapE9mXIIzACSUPYYObSuOZPe3UHsAgTZ6OWcAznccERqHw303WuoT7Qr
 Q+OFStqyeseWIvW3mldjTiAbu4WOZqlzmKWVZieALwaAxTXQNt+Ph8rGv8g+m/mWhdtU
 urAcV0GG7mRIaBEyBCUSY2QnCJ8UUU/pdKh3BKOUHQyTyGvNKsVSjLOB8vX2v0bQMbIg
 KpXOkMUPcrBXsI8deD3s4sxy3kPTAjSLSEALt1NHP9NcuHQ7CMLxyIc51qqSfMEwTmKZ
 Q7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733212689; x=1733817489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vuNLcU/D31i1jfqZ+fIe0HAjA1squHV+IYSLE5R8A94=;
 b=l2MyIH7xiNE+tELhLXJR79T0jC5SQnNNqOBwBX9lmx/Vugrh/RXYrcGGSx6oLlL4p4
 5N1k4uSzSGXgcpmsWJ8N2U7bYJr414LnG2FuVUKMGm4klG21omm+BRo+JKLAFnS0xSM0
 91F9Ukd+MGfXXxA6YgLBFOCfvGyV8OatSEcYIriLTN+LYVeCwIJqEdissYXbMfVyZ18f
 vpMS0F28V0m3LqLWilblPV9Bxze80Mcde8xE9dLi4KDEBL/z2yOK9tio14DJkqYHpgLs
 7GwbG9hLVZhyZ94twezGRF3X7e1YcV76xTGqdcFLJcNOe2m8677kn/VbhpqmZSJlNuyS
 pdnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMMs67f8xBt4prXXTX3FKTDs0RRUtbi0+dVxEV8I5+116MtQCwidVnnCxua5OOLx18aVntyFc5hyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFd31legFEgqaDNYaZibyL1IRhzXAJ9bRZtMzsNo8B40W+qQ8i
 c7FLpDaPpog+W7Bjh6FZgu87a9OvewZ2xhp0txA1mFdgGWJxAaZNcc4TcMDnT/NMxIS2Z85L72p
 oHxTGCKSQGt7TL7APZZeC5gcgpsc0WU7pE1w8Kg==
X-Gm-Gg: ASbGncuX0ySIlT8VTPozuZ+oyb8fUXX5Byp0xbF/nVofApjV/E3ruiDRONN85iR2lKG
 rrWx8pgJ+qojceAG8R8IoH/oZOKYyleQgzg==
X-Google-Smtp-Source: AGHT+IHU5h6tCiTfq1d/McNUSE6M8u9XbRsEvEMFCK7lWQ6XBXs45F7+U8123+c6j9cexkYgtfp8D36ehRZiyjuzICk=
X-Received: by 2002:a67:f40a:0:b0:4af:9885:26e3 with SMTP id
 ada2fe7eead31-4af9885271dmr1390908137.23.1733212689253; Mon, 02 Dec 2024
 23:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20241128150927.1377981-1-jens.wiklander@linaro.org>
 <20241128150927.1377981-2-jens.wiklander@linaro.org>
In-Reply-To: <20241128150927.1377981-2-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 3 Dec 2024 13:27:57 +0530
Message-ID: <CAFA6WYPVEzNLRL3sFUBgGGF_9m7tqGmg+h4TY5LDCAN5=qgBTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] tee: add restricted memory allocation
To: Jens Wiklander <jens.wiklander@linaro.org>
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
 azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Jens,

On Thu, 28 Nov 2024 at 20:39, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Add restricted memory allocation to the TEE subsystem. Restricted memory
> is not be accessible by kernel during normal circumstances. A new ioctl

s/not be accessible/not accessible/

How about if we reword it as follows?

    Restricted memory refers to memory buffers behind a hardware enforced
    firewall. It is not accessible to the kernel during normal circumstances but
    rather only accessible to certain hardware IPs or CPUs executing in higher
    privileged mode than the kernel itself. This interface allows to
allocate and
    manage such restricted memory buffers via interaction with a TEE
    implementation.

> TEE_IOC_RSTMEM_ALLOC is added to allocate these restricted memory
> buffers.
>
> The restricted memory is allocated for a specific use-case, like Secure
> Video Playback, Trusted UI, or Secure Video Recording where certain
> hardware devices can access the memory.
>
> More use-cases can be added in userspace ABI, but it's up to the backend
> drivers to provide the implementation.
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/Makefile       |   1 +
>  drivers/tee/tee_core.c     |  37 ++++++-
>  drivers/tee/tee_private.h  |   2 +
>  drivers/tee/tee_rstmem.c   | 201 +++++++++++++++++++++++++++++++++++++
>  drivers/tee/tee_shm.c      |   2 +
>  drivers/tee/tee_shm_pool.c |  69 ++++++++++++-
>  include/linux/tee_core.h   |  15 +++
>  include/linux/tee_drv.h    |   4 +-
>  include/uapi/linux/tee.h   |  37 ++++++-
>  9 files changed, 363 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/tee/tee_rstmem.c
>
> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> index 5488cba30bd2..a4c6b55444b9 100644
> --- a/drivers/tee/Makefile
> +++ b/drivers/tee/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_TEE) += tee.o
>  tee-objs += tee_core.o
>  tee-objs += tee_shm.o
>  tee-objs += tee_shm_pool.o
> +tee-objs += tee_rstmem.o
>  obj-$(CONFIG_OPTEE) += optee/
>  obj-$(CONFIG_AMDTEE) += amdtee/
>  obj-$(CONFIG_ARM_TSTEE) += tstee/
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..e81167826002 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -1,12 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2015-2016, Linaro Limited
> + * Copyright (c) 2015-2022, 2024, Linaro Limited
>   */
>
>  #define pr_fmt(fmt) "%s: " fmt, __func__
>
>  #include <linux/cdev.h>
>  #include <linux/cred.h>
> +#include <linux/dma-buf.h>
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/module.h>
> @@ -815,6 +816,38 @@ static int tee_ioctl_supp_send(struct tee_context *ctx,
>         return rc;
>  }
>
> +static int
> +tee_ioctl_rstmem_alloc(struct tee_context *ctx,
> +                      struct tee_ioctl_rstmem_alloc_data __user *udata)
> +{
> +       struct tee_ioctl_rstmem_alloc_data data;
> +       struct dma_buf *dmabuf;
> +       int id;
> +       int fd;
> +
> +       if (copy_from_user(&data, udata, sizeof(data)))
> +               return -EFAULT;
> +
> +       if (data.use_case == TEE_IOC_UC_RESERVED)
> +               return -EINVAL;
> +
> +       dmabuf = tee_rstmem_alloc(ctx, data.flags, data.use_case, data.size,
> +                                 &id);
> +       if (IS_ERR(dmabuf))
> +               return PTR_ERR(dmabuf);
> +       if (put_user(id, &udata->id)) {
> +               fd = -EFAULT;
> +               goto err;
> +       }
> +       fd = dma_buf_fd(dmabuf, O_CLOEXEC);
> +       if (fd < 0)
> +               goto err;
> +       return fd;
> +err:
> +       dma_buf_put(dmabuf);
> +       return fd;
> +}
> +
>  static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>         struct tee_context *ctx = filp->private_data;
> @@ -839,6 +872,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>                 return tee_ioctl_supp_recv(ctx, uarg);
>         case TEE_IOC_SUPPL_SEND:
>                 return tee_ioctl_supp_send(ctx, uarg);
> +       case TEE_IOC_RSTMEM_ALLOC:
> +               return tee_ioctl_rstmem_alloc(ctx, uarg);
>         default:
>                 return -EINVAL;
>         }
> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> index 9bc50605227c..bf97796909c0 100644
> --- a/drivers/tee/tee_private.h
> +++ b/drivers/tee/tee_private.h
> @@ -23,5 +23,7 @@ void teedev_ctx_put(struct tee_context *ctx);
>  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
>                                           unsigned long addr, size_t length);
> +struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
> +                                u32 use_case, size_t size, int *shm_id);
>
>  #endif /*TEE_PRIVATE_H*/
> diff --git a/drivers/tee/tee_rstmem.c b/drivers/tee/tee_rstmem.c
> new file mode 100644
> index 000000000000..536bca2901e2
> --- /dev/null
> +++ b/drivers/tee/tee_rstmem.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Linaro Limited
> + */
> +#include <linux/device.h>
> +#include <linux/dma-buf.h>
> +#include <linux/genalloc.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/tee_core.h>
> +#include "tee_private.h"
> +
> +struct tee_rstmem_attachment {
> +       struct sg_table table;
> +       struct device *dev;
> +};
> +
> +static int rstmem_dma_attach(struct dma_buf *dmabuf,
> +                            struct dma_buf_attachment *attachment)
> +{
> +       struct tee_shm *shm = dmabuf->priv;
> +       struct tee_rstmem_attachment *a;
> +       int rc;
> +
> +       a = kzalloc(sizeof(*a), GFP_KERNEL);
> +       if (!a)
> +               return -ENOMEM;
> +
> +       if (shm->pages) {
> +               rc = sg_alloc_table_from_pages(&a->table, shm->pages,
> +                                              shm->num_pages, 0,
> +                                              shm->num_pages * PAGE_SIZE,
> +                                              GFP_KERNEL);
> +               if (rc)
> +                       goto err;
> +       } else {
> +               rc = sg_alloc_table(&a->table, 1, GFP_KERNEL);
> +               if (rc)
> +                       goto err;
> +               sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
> +                           0);
> +       }
> +
> +       a->dev = attachment->dev;
> +       attachment->priv = a;
> +
> +       return 0;
> +err:
> +       kfree(a);
> +       return rc;
> +}
> +
> +static void rstmem_dma_detach(struct dma_buf *dmabuf,
> +                             struct dma_buf_attachment *attachment)
> +{
> +       struct tee_rstmem_attachment *a = attachment->priv;
> +
> +       sg_free_table(&a->table);
> +       kfree(a);
> +}
> +
> +static struct sg_table *
> +rstmem_dma_map_dma_buf(struct dma_buf_attachment *attachment,
> +                      enum dma_data_direction direction)
> +{
> +       struct tee_rstmem_attachment *a = attachment->priv;
> +       int ret;
> +
> +       ret = dma_map_sgtable(attachment->dev, &a->table, direction,
> +                             DMA_ATTR_SKIP_CPU_SYNC);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &a->table;
> +}
> +
> +static void rstmem_dma_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +                                    struct sg_table *table,
> +                                    enum dma_data_direction direction)
> +{
> +       struct tee_rstmem_attachment *a = attachment->priv;
> +
> +       WARN_ON(&a->table != table);
> +
> +       dma_unmap_sgtable(attachment->dev, table, direction,
> +                         DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
> +static int rstmem_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> +                                          enum dma_data_direction direction)
> +{
> +       return -EPERM;
> +}
> +
> +static int rstmem_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> +                                        enum dma_data_direction direction)
> +{
> +       return -EPERM;
> +}
> +
> +static int rstmem_dma_buf_mmap(struct dma_buf *dmabuf,
> +                              struct vm_area_struct *vma)
> +{
> +       return -EPERM;
> +}
> +
> +static void rstmem_dma_buf_free(struct dma_buf *dmabuf)
> +{
> +       struct tee_shm *shm = dmabuf->priv;
> +
> +       tee_shm_put(shm);
> +}
> +
> +static const struct dma_buf_ops rstmem_generic_buf_ops = {
> +       .attach = rstmem_dma_attach,
> +       .detach = rstmem_dma_detach,
> +       .map_dma_buf = rstmem_dma_map_dma_buf,
> +       .unmap_dma_buf = rstmem_dma_unmap_dma_buf,
> +       .begin_cpu_access = rstmem_dma_buf_begin_cpu_access,
> +       .end_cpu_access = rstmem_dma_buf_end_cpu_access,
> +       .mmap = rstmem_dma_buf_mmap,
> +       .release = rstmem_dma_buf_free,
> +};
> +
> +struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
> +                                u32 use_case, size_t size, int *shm_id)
> +{
> +       struct tee_device *teedev = ctx->teedev;
> +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +       struct dma_buf *dmabuf;
> +       struct tee_shm *shm;
> +       void *ret;
> +       int rc;
> +
> +       if (!tee_device_get(teedev))
> +               return ERR_PTR(-EINVAL);
> +
> +       if (!teedev->desc->ops->rstmem_alloc ||
> +           !teedev->desc->ops->rstmem_free) {
> +               dmabuf = ERR_PTR(-EINVAL);
> +               goto err;
> +       }
> +
> +       shm = kzalloc(sizeof(*shm), GFP_KERNEL);
> +       if (!shm) {
> +               dmabuf = ERR_PTR(-ENOMEM);
> +               goto err;
> +       }
> +
> +       refcount_set(&shm->refcount, 1);
> +       shm->flags = TEE_SHM_RESTRICTED;
> +       shm->use_case = use_case;
> +       shm->ctx = ctx;
> +
> +       mutex_lock(&teedev->mutex);
> +       shm->id = idr_alloc(&teedev->idr, NULL, 1, 0, GFP_KERNEL);
> +       mutex_unlock(&teedev->mutex);
> +       if (shm->id < 0) {
> +               dmabuf = ERR_PTR(shm->id);
> +               goto err_kfree;
> +       }
> +
> +       rc = teedev->desc->ops->rstmem_alloc(ctx, shm, flags, use_case, size);
> +       if (rc) {
> +               dmabuf = ERR_PTR(rc);
> +               goto err_idr_remove;
> +       }
> +
> +       mutex_lock(&teedev->mutex);
> +       ret = idr_replace(&teedev->idr, shm, shm->id);
> +       mutex_unlock(&teedev->mutex);
> +       if (IS_ERR(ret)) {
> +               dmabuf = ret;
> +               goto err_rstmem_free;
> +       }
> +       teedev_ctx_get(ctx);
> +
> +       exp_info.ops = &rstmem_generic_buf_ops;
> +       exp_info.size = shm->size;
> +       exp_info.priv = shm;
> +       dmabuf = dma_buf_export(&exp_info);
> +       if (IS_ERR(dmabuf)) {
> +               tee_shm_put(shm);
> +               return dmabuf;
> +       }
> +
> +       *shm_id = shm->id;
> +       return dmabuf;
> +
> +err_rstmem_free:
> +       teedev->desc->ops->rstmem_free(ctx, shm);
> +err_idr_remove:
> +       mutex_lock(&teedev->mutex);
> +       idr_remove(&teedev->idr, shm->id);
> +       mutex_unlock(&teedev->mutex);
> +err_kfree:
> +       kfree(shm);
> +err:
> +       tee_device_put(teedev);
> +       return dmabuf;
> +}
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daf6e5cfd59a..416f7f25d885 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -55,6 +55,8 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>                                 "unregister shm %p failed: %d", shm, rc);
>
>                 release_registered_pages(shm);
> +       } else if (shm->flags & TEE_SHM_RESTRICTED) {
> +               teedev->desc->ops->rstmem_free(shm->ctx, shm);
>         }
>
>         teedev_ctx_put(shm->ctx);
> diff --git a/drivers/tee/tee_shm_pool.c b/drivers/tee/tee_shm_pool.c
> index 80004b55628d..ee57ef157a77 100644
> --- a/drivers/tee/tee_shm_pool.c
> +++ b/drivers/tee/tee_shm_pool.c
> @@ -1,9 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2015, 2017, 2022 Linaro Limited
> + * Copyright (c) 2015, 2017, 2022, 2024 Linaro Limited
>   */
>  #include <linux/device.h>
> -#include <linux/dma-buf.h>
>  #include <linux/genalloc.h>
>  #include <linux/slab.h>
>  #include <linux/tee_core.h>
> @@ -90,3 +89,69 @@ struct tee_shm_pool *tee_shm_pool_alloc_res_mem(unsigned long vaddr,
>         return ERR_PTR(rc);
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_pool_alloc_res_mem);
> +
> +static int rstmem_pool_op_gen_alloc(struct tee_shm_pool *pool,
> +                                   struct tee_shm *shm, size_t size,
> +                                   size_t align)
> +{
> +       size_t sz = ALIGN(size, PAGE_SIZE);
> +       phys_addr_t pa;
> +
> +       pa = gen_pool_alloc(pool->private_data, sz);
> +       if (!pa)
> +               return -ENOMEM;
> +
> +       shm->size = sz;
> +       shm->paddr = pa;
> +
> +       return 0;
> +}
> +
> +static void rstmem_pool_op_gen_free(struct tee_shm_pool *pool,
> +                                   struct tee_shm *shm)
> +{
> +       gen_pool_free(pool->private_data, shm->paddr, shm->size);
> +       shm->paddr = 0;
> +}
> +
> +static struct tee_shm_pool_ops rstmem_pool_ops_generic = {
> +       .alloc = rstmem_pool_op_gen_alloc,
> +       .free = rstmem_pool_op_gen_free,
> +       .destroy_pool = pool_op_gen_destroy_pool,
> +};
> +
> +struct tee_shm_pool *tee_rstmem_gen_pool_alloc(phys_addr_t paddr, size_t size)
> +{
> +       const size_t page_mask = PAGE_SIZE - 1;
> +       struct tee_shm_pool *pool;
> +       int rc;
> +
> +       /* Check it's page aligned */
> +       if ((paddr | size) & page_mask)
> +               return ERR_PTR(-EINVAL);
> +
> +       pool = kzalloc(sizeof(*pool), GFP_KERNEL);
> +       if (!pool)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pool->private_data = gen_pool_create(PAGE_SHIFT, -1);
> +       if (!pool->private_data) {
> +               rc = -ENOMEM;
> +               goto err_free;
> +       }
> +
> +       rc = gen_pool_add(pool->private_data, paddr, size, -1);
> +       if (rc)
> +               goto err_free_pool;
> +
> +       pool->ops = &rstmem_pool_ops_generic;
> +       return pool;
> +
> +err_free_pool:
> +       gen_pool_destroy(pool->private_data);
> +err_free:
> +       kfree(pool);
> +
> +       return ERR_PTR(rc);
> +}
> +EXPORT_SYMBOL_GPL(tee_rstmem_gen_pool_alloc);
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index a38494d6b5f4..608302f494fe 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -26,6 +26,7 @@
>  #define TEE_SHM_USER_MAPPED    BIT(1)  /* Memory mapped in user space */
>  #define TEE_SHM_POOL           BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV           BIT(3)  /* Memory private to TEE driver */
> +#define TEE_SHM_RESTRICTED     BIT(4)  /* Restricted memory */
>
>  #define TEE_DEVICE_FLAG_REGISTERED     0x1
>  #define TEE_MAX_DEV_NAME_LEN           32
> @@ -76,6 +77,8 @@ struct tee_device {
>   * @supp_send:         called for supplicant to send a response
>   * @shm_register:      register shared memory buffer in TEE
>   * @shm_unregister:    unregister shared memory buffer in TEE
> + * @rstmem_alloc:      allocate restricted memory
> + * @rstmem_free:       free restricted memory
>   */
>  struct tee_driver_ops {
>         void (*get_version)(struct tee_device *teedev,
> @@ -99,6 +102,9 @@ struct tee_driver_ops {
>                             struct page **pages, size_t num_pages,
>                             unsigned long start);
>         int (*shm_unregister)(struct tee_context *ctx, struct tee_shm *shm);
> +       int (*rstmem_alloc)(struct tee_context *ctx, struct tee_shm *shm,
> +                           u32 flags, u32 use_case, size_t size);
> +       void (*rstmem_free)(struct tee_context *ctx, struct tee_shm *shm);
>  };
>
>  /**
> @@ -229,6 +235,15 @@ static inline void tee_shm_pool_free(struct tee_shm_pool *pool)
>         pool->ops->destroy_pool(pool);
>  }
>
> +/**
> + * tee_rstmem_gen_pool_alloc() - Create a restricted memory manager
> + * @paddr:     Physical address of start of pool
> + * @size:      Size in bytes of the pool
> + *
> + * @returns pointer to a 'struct tee_shm_pool' or an ERR_PTR on failure.
> + */
> +struct tee_shm_pool *tee_rstmem_gen_pool_alloc(phys_addr_t paddr, size_t size);
> +
>  /**
>   * tee_get_drvdata() - Return driver_data pointer
>   * @returns the driver_data pointer supplied to tee_register().
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index a54c203000ed..b7ee346e5e44 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -55,6 +55,7 @@ struct tee_context {
>   * @pages:     locked pages from userspace
>   * @num_pages: number of locked pages
>   * @refcount:  reference counter
> + * @use_case:  defined by TEE_IOC_UC_* in tee.h
>   * @flags:     defined by TEE_SHM_* in tee_core.h
>   * @id:                unique id of a shared memory object on this device, shared
>   *             with user space
> @@ -71,7 +72,8 @@ struct tee_shm {
>         struct page **pages;
>         size_t num_pages;
>         refcount_t refcount;
> -       u32 flags;
> +       u16 use_case;
> +       u16 flags;

Shouldn't we keep them u32 instead to be aligned with user-space inputs?

>         int id;
>         u64 sec_world_id;
>  };
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index d0430bee8292..cdc8c82c9a38 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2015-2016, Linaro Limited
> + * Copyright (c) 2015-2017, 2020, 2024, Linaro Limited
>   * All rights reserved.
>   *
>   * Redistribution and use in source and binary forms, with or without
> @@ -48,6 +48,7 @@
>  #define TEE_GEN_CAP_PRIVILEGED (1 << 1)/* Privileged device (for supplicant) */
>  #define TEE_GEN_CAP_REG_MEM    (1 << 2)/* Supports registering shared memory */
>  #define TEE_GEN_CAP_MEMREF_NULL        (1 << 3)/* NULL MemRef support */
> +#define TEE_GEN_CAP_RSTMEM     (1 << 4)/* Supports restricted memory */
>
>  #define TEE_MEMREF_NULL                (__u64)(-1) /* NULL MemRef Buffer */
>
> @@ -389,6 +390,40 @@ struct tee_ioctl_shm_register_data {
>   */
>  #define TEE_IOC_SHM_REGISTER   _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 9, \
>                                      struct tee_ioctl_shm_register_data)
> +
> +#define TEE_IOC_UC_RESERVED            0
> +#define TEE_IOC_UC_SECURE_VIDEO_PLAY   1
> +#define TEE_IOC_UC_TRUSTED_UI          2
> +#define TEE_IOC_UC_SECURE_VIDEO_RECORD 3
> +
> +/**
> + * struct tee_ioctl_rstmem_alloc_data - Restricted memory allocate argument
> + * @size:      [in/out] Size of restricted memory to allocate
> + * @flags:     [in/out] Flags to/from allocate
> + * @use_case   [in] Restricted memory use case, TEE_IOC_UC_*
> + * @id:                [out] Identifier of the restricted memory
> + */
> +struct tee_ioctl_rstmem_alloc_data {
> +       __u64 size;
> +       __u32 flags;
> +       __u32 use_case;
> +       __s32 id;
> +};
> +
> +/**
> + * TEE_IOC_RSTMEM_ALLOC - allocate restricted memory
> + *
> + * Allocates restricted physically memory normally not accessible by the
> + * kernel.

Can we elaborate here as well on similar lines as per commit message?

-Sumit

> + *
> + * Returns a file descriptor on success or < 0 on failure
> + *
> + * The returned file descriptor is a dma-buf that can be attached and
> + * mapped for device with permission to access the physical memory.
> + */
> +#define TEE_IOC_RSTMEM_ALLOC     _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
> +                                      struct tee_ioctl_rstmem_alloc_data)
> +
>  /*
>   * Five syscalls are used when communicating with the TEE driver.
>   * open(): opens the device associated with the driver
> --
> 2.43.0
>
