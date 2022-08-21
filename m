Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947959B41D
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 15:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320EA8A3C2;
	Sun, 21 Aug 2022 13:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF99E8A3C2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 13:52:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A706460EB5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 13:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F460C43141
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661089922;
 bh=Cs1R0ayCNZkYrq3++4uQgdjpOaygBYC5LDyh8JN5Adw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S+P1dflOlfgFwv5oS6amOPq8R8wTzzUk64PFbBsZaHAB2I2M8yS1nhjB8Pn4tC+Tk
 dUJDAMX1cAVr+MpipJt1E6jKv9EaK94Xy/9BPr3InzIZGFwswdmnPwW3y9mz/EOmlp
 /dsvOyMXBZUeH224VJmBSMEs3AiGxjBbyoNdhr+XV2kiLDKPJUcN/lfQomyi2LENQf
 ZWLFTOSZk7VzWzjra8iHFD0Fz7fSKYXfAFLDj0mmPqybRER7mVDVtvSLea7/gJzUg2
 BpujcFqKcaCMwmTyJM3OsKSZAYg/2gsNJyODgqquhp1oYKq3twcJdQaqtePP2oYDfF
 mbIt3HtE9bwXg==
Received: by mail-oi1-f177.google.com with SMTP id t140so737388oie.8
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 06:52:02 -0700 (PDT)
X-Gm-Message-State: ACgBeo2/hH2XZxp7rZqaXnixzzpnaLyJ1BO3J7DLHXvq2mb8vgaG2ncb
 ZPeRSigkYw9CttK0UcFtxNTL8bceGkMgnoE7i2A=
X-Google-Smtp-Source: AA6agR7/lq7Nr4W7X4xv4Dtr5mL4DQ+23dBmnxJe4zp/EjDwUnrx/kAODOAjyqxyujbbSzpSB9gebdD93gh5j7ZDGlc=
X-Received: by 2002:a05:6808:f8f:b0:345:4955:a8 with SMTP id
 o15-20020a0568080f8f00b00345495500a8mr2176106oiw.166.1661089921087; Sun, 21
 Aug 2022 06:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <4-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
In-Reply-To: <4-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 21 Aug 2022 16:51:34 +0300
X-Gmail-Original-Message-ID: <CAFCwf13kOBri3NDO=6SGHOXq-M=wndbdcMxik9bf8H1AUCE1tQ@mail.gmail.com>
Message-ID: <CAFCwf13kOBri3NDO=6SGHOXq-M=wndbdcMxik9bf8H1AUCE1tQ@mail.gmail.com>
Subject: Fwd: [PATCH 4/4] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
To: Alex Williamson <alex.williamson@redhat.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Cornelia Huck <cohuck@redhat.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 KVM list <kvm@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 7:11 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> dma-buf has become a way to safely acquire a handle to non-struct page
> memory that can still have lifetime controlled by the exporter. Notably
> RDMA can now import dma-buf FDs and build them into MRs which allows for
> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> from PCI device BARs.
>
> The patch design loosely follows the pattern in commit
> db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
> does not support pinning.
>
> Instead, this implements what, in the past, we've called a revocable
> attachment using move. In normal situations the attachment is pinned, as a
> BAR does not change physical address. However when the VFIO device is
> closed, or a PCI reset is issued, access to the MMIO memory is revoked.
>
> Revoked means that move occurs, but an attempt to immediately re-map the
> memory will fail. In the reset case a future move will be triggered when
> MMIO access returns. As both close and reset are under userspace control
> it is expected that userspace will suspend use of the dma-buf before doing
> these operations, the revoke is purely for kernel self-defense against a
> hostile userspace.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/Makefile           |   1 +
>  drivers/vfio/pci/vfio_pci_config.c  |   8 +-
>  drivers/vfio/pci/vfio_pci_core.c    |  28 ++-
>  drivers/vfio/pci/vfio_pci_dma_buf.c | 265 ++++++++++++++++++++++++++++
>  drivers/vfio/pci/vfio_pci_priv.h    |  23 +++
>  include/linux/vfio_pci_core.h       |   1 +
>  include/uapi/linux/vfio.h           |  18 ++
>  7 files changed, 336 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/vfio/pci/vfio_pci_dma_buf.c
>
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index 24c524224da5a3..81006a157cde14 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -2,6 +2,7 @@
>
>  vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>  vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
> +vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += vfio_pci_dma_buf.o
>  obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>
>  vfio-pci-y := vfio_pci.o
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index d22921efa25987..f8a9c24d04aeb7 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -584,10 +584,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>                 virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
>                 new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>
> -               if (!new_mem)
> +               if (!new_mem) {
>                         vfio_pci_zap_and_down_write_memory_lock(vdev);
> -               else
> +                       vfio_pci_dma_buf_move(vdev, true);
> +               } else {
>                         down_write(&vdev->memory_lock);
> +               }
>
>                 /*
>                  * If the user is writing mem/io enable (new_mem/io) and we
> @@ -622,6 +624,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>                 *virt_cmd &= cpu_to_le16(~mask);
>                 *virt_cmd |= cpu_to_le16(new_cmd & mask);
>
> +               if (__vfio_pci_memory_enabled(vdev))
> +                       vfio_pci_dma_buf_move(vdev, false);
>                 up_write(&vdev->memory_lock);
>         }
>
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index d13e22021860cc..206f159c480e42 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -504,6 +504,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
>         vfio_spapr_pci_eeh_release(vdev->pdev);
>         vfio_pci_core_disable(vdev);
>
> +       vfio_pci_dma_buf_cleanup(vdev);
> +
>         mutex_lock(&vdev->igate);
>         if (vdev->err_trigger) {
>                 eventfd_ctx_put(vdev->err_trigger);
> @@ -980,7 +982,10 @@ int vfio_pci_try_reset_function(struct vfio_pci_core_device *vdev)
>          */
>         vfio_pci_set_power_state(vdev, PCI_D0);
>
> +       vfio_pci_dma_buf_move(vdev, true);
>         ret = pci_try_reset_function(vdev->pdev);
> +       if (__vfio_pci_memory_enabled(vdev))
> +               vfio_pci_dma_buf_move(vdev, false);
>         up_write(&vdev->memory_lock);
>
>         return ret;
> @@ -1210,11 +1215,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);
>
> -static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
> -                                      uuid_t __user *arg, size_t argsz)
> +static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
> +                                      u32 flags, uuid_t __user *arg,
> +                                      size_t argsz)
>  {
> -       struct vfio_pci_core_device *vdev =
> -               container_of(device, struct vfio_pci_core_device, vdev);
>         uuid_t uuid;
>         int ret;
>
> @@ -1241,9 +1245,14 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
>  int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>                                 void __user *arg, size_t argsz)
>  {
> +       struct vfio_pci_core_device *vdev =
> +               container_of(device, struct vfio_pci_core_device, vdev);
> +
>         switch (flags & VFIO_DEVICE_FEATURE_MASK) {
>         case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
> -               return vfio_pci_core_feature_token(device, flags, arg, argsz);
> +               return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> +       case VFIO_DEVICE_FEATURE_DMA_BUF:
> +               return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
>         default:
>                 return -ENOTTY;
>         }
> @@ -1881,6 +1890,7 @@ void vfio_pci_core_init_device(struct vfio_pci_core_device *vdev,
>         INIT_LIST_HEAD(&vdev->vma_list);
>         INIT_LIST_HEAD(&vdev->sriov_pfs_item);
>         init_rwsem(&vdev->memory_lock);
> +       INIT_LIST_HEAD(&vdev->dmabufs);
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_init_device);
>
> @@ -2227,11 +2237,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>          * cause the PCI config space reset without restoring the original
>          * state (saved locally in 'vdev->pm_save').
>          */
> -       list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +       list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +               vfio_pci_dma_buf_move(cur, true);
>                 vfio_pci_set_power_state(cur, PCI_D0);
> +       }
>
>         ret = pci_reset_bus(pdev);
>
> +       list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +               if (__vfio_pci_memory_enabled(cur))
> +                       vfio_pci_dma_buf_move(cur, false);
> +
>  err_undo:
>         list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
>                 if (cur == cur_mem)
> diff --git a/drivers/vfio/pci/vfio_pci_dma_buf.c b/drivers/vfio/pci/vfio_pci_dma_buf.c
> new file mode 100644
> index 00000000000000..ac32405de5e48d
> --- /dev/null
> +++ b/drivers/vfio/pci/vfio_pci_dma_buf.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2022, NVIDIA CORPORATION & AFFILIATES.
> + */
> +#include <linux/dma-buf.h>
> +#include <linux/pci-p2pdma.h>
> +#include <linux/dma-resv.h>
> +
> +#include "vfio_pci_priv.h"
> +
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +struct vfio_pci_dma_buf {
> +       struct dma_buf *dmabuf;
> +       struct vfio_pci_core_device *vdev;
> +       struct list_head dmabufs_elm;
> +       unsigned int index;
> +       size_t offset;
> +       bool revoked;
> +};
> +
> +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> +                                  struct dma_buf_attachment *attachment)
> +{
> +       struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +       int rc;
> +
> +       rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
> +                                     true);
> +       if (rc < 0)
> +               attachment->peer2peer = false;
> +       return 0;
> +}
> +
> +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> +{
> +}
> +
> +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> +{
> +       /*
> +        * Uses the dynamic interface but must always allow for
> +        * dma_buf_move_notify() to do revoke
> +        */
> +       return -EINVAL;
> +}
> +
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +                    enum dma_data_direction dir)
> +{
> +       size_t sgl_size = dma_get_max_seg_size(attachment->dev);
> +       struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +       struct scatterlist *sgl;
> +       struct sg_table *sgt;
> +       dma_addr_t dma_addr;
> +       unsigned int nents;
> +       size_t offset;
> +       int ret;
> +
> +       dma_resv_assert_held(priv->dmabuf->resv);
> +
> +       if (!attachment->peer2peer)
> +               return ERR_PTR(-EPERM);
> +
> +       if (!priv->revoked)
> +               return ERR_PTR(-ENODEV);
> +
> +       sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +       if (!sgt)
> +               return ERR_PTR(-ENOMEM);
> +
> +       nents = DIV_ROUND_UP(priv->dmabuf->size, sgl_size);
> +       ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> +       if (ret)
> +               goto err_kfree_sgt;
> +
> +       /*
> +        * Since the memory being mapped is a device memory it could never be in
> +        * CPU caches.
> +        */
> +       dma_addr = dma_map_resource(
> +               attachment->dev,
> +               pci_resource_start(priv->vdev->pdev, priv->index) +
> +                       priv->offset,
> +               priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
> +       ret = dma_mapping_error(attachment->dev, dma_addr);
> +       if (ret)
> +               goto err_free_sgt;
> +
> +       /*
> +        * Break the BAR's physical range up into max sized SGL's according to
> +        * the device's requirement.
> +        */
> +       sgl = sgt->sgl;
> +       for (offset = 0; offset != priv->dmabuf->size;) {
> +               size_t chunk_size = min(priv->dmabuf->size - offset, sgl_size);
> +
> +               sg_set_page(sgl, NULL, chunk_size, 0);
> +               sg_dma_address(sgl) = dma_addr + offset;
> +               sg_dma_len(sgl) = chunk_size;
> +               sgl = sg_next(sgl);
> +               offset += chunk_size;
> +       }
> +
> +       /*
> +        * Because we are not going to include a CPU list we want to have some
> +        * chance that other users will detect this by setting the orig_nents to
> +        * 0 and using only nents (length of DMA list) when going over the sgl
> +        */
> +       sgt->orig_nents = 0;
> +       return sgt;
> +
> +err_free_sgt:
> +       sg_free_table(sgt);
> +err_kfree_sgt:
> +       kfree(sgt);
> +       return ERR_PTR(ret);
> +}
> +
> +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> +                                  struct sg_table *sgt,
> +                                  enum dma_data_direction dir)
> +{
> +       struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +
> +       dma_unmap_resource(attachment->dev, sg_dma_address(sgt->sgl),
> +                          priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
> +       sg_free_table(sgt);
Before calling sg_free_table(), you need to restore the orig_nents as
it is used in that function to free the allocated memory of the sgt.

> +       kfree(sgt);
> +}
> +
> +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +       struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +       /*
> +        * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> +        * The refcount prevents both.
> +        */
> +       if (priv->vdev) {
> +               down_write(&priv->vdev->memory_lock);
> +               list_del_init(&priv->dmabufs_elm);
> +               up_write(&priv->vdev->memory_lock);
> +               vfio_device_put(&priv->vdev->vdev);
> +       }
> +       kfree(priv);
> +}
> +
> +static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +       .attach = vfio_pci_dma_buf_attach,
> +       .map_dma_buf = vfio_pci_dma_buf_map,
> +       .pin = vfio_pci_dma_buf_pin,
> +       .unpin = vfio_pci_dma_buf_unpin,
> +       .release = vfio_pci_dma_buf_release,
> +       .unmap_dma_buf = vfio_pci_dma_buf_unmap,
> +};
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +                                 struct vfio_device_feature_dma_buf __user *arg,
> +                                 size_t argsz)
> +{
> +       struct vfio_device_feature_dma_buf get_dma_buf;
> +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +       struct vfio_pci_dma_buf *priv;
> +       int ret;
> +
> +       ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +                                sizeof(get_dma_buf));
> +       if (ret != 1)
> +               return ret;
> +
> +       if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +               return -EFAULT;
> +
> +       /* For PCI the region_index is the BAR number like everything else */
> +       if (get_dma_buf.region_index >= VFIO_PCI_ROM_REGION_INDEX)
> +               return -EINVAL;
> +
> +       exp_info.ops = &vfio_pci_dmabuf_ops;
> +       exp_info.size = pci_resource_len(vdev->pdev, get_dma_buf.region_index);
> +       if (!exp_info.size)
> +               return -EINVAL;
> +       if (get_dma_buf.offset || get_dma_buf.length) {
> +               if (get_dma_buf.length > exp_info.size ||
> +                   get_dma_buf.offset >= exp_info.size ||
> +                   get_dma_buf.length > exp_info.size - get_dma_buf.offset ||
> +                   get_dma_buf.offset % PAGE_SIZE ||
> +                   get_dma_buf.length % PAGE_SIZE)
> +                       return -EINVAL;
> +               exp_info.size = get_dma_buf.length;
> +       }
> +       exp_info.flags = get_dma_buf.open_flags;
> +
> +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       INIT_LIST_HEAD(&priv->dmabufs_elm);
> +       priv->offset = get_dma_buf.offset;
> +
> +       exp_info.priv = priv;
> +       priv->dmabuf = dma_buf_export(&exp_info);
> +       if (IS_ERR(priv->dmabuf)) {
> +               ret = PTR_ERR(priv->dmabuf);
> +               kfree(priv);
> +               return ret;
> +       }
> +
> +       /* dma_buf_put() now frees priv */
> +
> +       down_write(&vdev->memory_lock);
> +       dma_resv_lock(priv->dmabuf->resv, NULL);
> +       priv->revoked = __vfio_pci_memory_enabled(vdev);
> +       priv->vdev = vdev;
> +       vfio_device_get(&vdev->vdev);
> +       list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> +       dma_resv_unlock(priv->dmabuf->resv);
> +       up_write(&vdev->memory_lock);
> +
> +       /*
> +        * dma_buf_fd() consumes the reference, when the file closes the dmabuf
> +        * will be released.
> +        */
> +       return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> +}
> +
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> +{
> +       struct vfio_pci_dma_buf *priv;
> +       struct vfio_pci_dma_buf *tmp;
> +
> +       lockdep_assert_held_write(&vdev->memory_lock);
> +
> +       list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +               if (!dma_buf_try_get(priv->dmabuf))
> +                       continue;
> +               if (priv->revoked != revoked) {
> +                       dma_resv_lock(priv->dmabuf->resv, NULL);
> +                       priv->revoked = revoked;
> +                       dma_buf_move_notify(priv->dmabuf);
> +                       dma_resv_unlock(priv->dmabuf->resv);
> +               }
> +               dma_buf_put(priv->dmabuf);
> +       }
> +}
> +
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +       struct vfio_pci_dma_buf *priv;
> +       struct vfio_pci_dma_buf *tmp;
> +
> +       down_write(&vdev->memory_lock);
> +       list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +               if (!dma_buf_try_get(priv->dmabuf))
> +                       continue;
> +               dma_resv_lock(priv->dmabuf->resv, NULL);
> +               list_del_init(&priv->dmabufs_elm);
> +               priv->vdev = NULL;
> +               priv->revoked = true;
> +               dma_buf_move_notify(priv->dmabuf);
> +               dma_resv_unlock(priv->dmabuf->resv);
> +               vfio_device_put(&vdev->vdev);
> +               dma_buf_put(priv->dmabuf);
> +       }
> +       up_write(&vdev->memory_lock);
> +}
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 5b1cb9a9838442..c295a1166e7a9c 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -102,4 +102,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
>         return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
>  }
>
> +#ifdef CONFIG_DMA_SHARED_BUFFER
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +                                 struct vfio_device_feature_dma_buf __user *arg,
> +                                 size_t argsz);
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
> +#else
> +static int
> +vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +                             struct vfio_device_feature_dma_buf __user *arg,
> +                             size_t argsz)
> +{
> +       return -ENOTTY;
> +}
> +static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +}
> +static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
> +                                        bool revoked)
> +{
> +}
> +#endif
> +
>  #endif
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index 9d18b832e61a0d..b57f4ecc2665e1 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -93,6 +93,7 @@ struct vfio_pci_core_device {
>         struct mutex            vma_lock;
>         struct list_head        vma_list;
>         struct rw_semaphore     memory_lock;
> +       struct list_head        dmabufs;
>  };
>
>  /* Will be exported for vfio pci drivers usage */
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 733a1cddde30a5..1dcfad6dcb6863 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -986,6 +986,24 @@ enum vfio_device_mig_state {
>         VFIO_DEVICE_STATE_RUNNING_P2P = 5,
>  };
>
> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * region selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf from.
> + * If both are 0 then the whole region is used.
> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +struct vfio_device_feature_dma_buf {
> +       __u32 region_index;
> +       __u32 open_flags;
> +       __u32 offset;
> +       __u64 length;
> +};
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 3
> +
>  /* -------- API for Type1 VFIO IOMMU -------- */
>
>  /**
> --
> 2.37.2
>
