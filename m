Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDDA2FACFB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EDD6E595;
	Mon, 18 Jan 2021 21:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EDC6E593;
 Mon, 18 Jan 2021 21:52:49 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id x13so17784493oto.8;
 Mon, 18 Jan 2021 13:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLxfqjTvp8Id83UScDcwxgOhF9UZooF2vHxIW2TXHic=;
 b=Vu/gUIvKVC5bTDduDjv9yNLtdplX2S+YCZMSE48n/vtfm33TWRJ1JJTOg2MFgJO0Iu
 HYQrzcz5wR1UQ2dZwIFe0J+MdudYXf5vJ6ZcvYfFDSLEl+UjH426vwPepasV/nDQUQKt
 RwRpF5NHQYYyqAbLTaS4Q13VHda4CcWzC3riqCwriEFo1l7c5pqrQlfXlBXvE9NSiNMD
 8pz7wiEHqJXFFzsOubhw7egeNm8kqDdfMPrpt9zoOAhO6LhiqGuevAevUwrdhZsqrzqe
 XhfEaGN6/GVRhhB468IIhzWFjhuUmgme4iGaoV0LOjpEFYFhWKe37E5hlJCvviWW07zc
 r34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLxfqjTvp8Id83UScDcwxgOhF9UZooF2vHxIW2TXHic=;
 b=rkSFTIbJjqy6N+kS7AMJQAT5grS0LYBlIFs3v8TppiZAQ+3/kGITvZN9kogDHfTP7U
 LAW9cfbqRurd65aq90y8sAF6ahh+k/xzub+UzuqjEVLWWNhWCbqp332lIn2C4cnnbwcP
 MXy1vDSBd2wKXgiBdGvatKoK1FJt31Q8/ivS1eGikufJCR8kh9EGEzMPHbGn2YKjWNsk
 Q91QUYSmbdCfJqFxIC+4BS2WlVnPGHblV/QPpMn297sSN4OC1OHrP7thMhb8clqwQZKq
 sdCp5vZgAZ+PViHuwFzFkBfUb/xRrAlgZ6upPmwHyybZwWgx2W/AgyZFnHlSf0uNJyPy
 gjWQ==
X-Gm-Message-State: AOAM530CIUgsmVA6fA1RFPiirgrZeccAcESZ34tuM6wYqWWHmzVcpGxi
 vjFrJSOMjs7vjM/29alQppGITyM3V8yPZpM6BzH4nild
X-Google-Smtp-Source: ABdhPJxRAq4lRwpv3vfBHtyBlx9zpMJw0RuEBe6cWXGb5CAIHIfnox73f/ltX8W5Abzg9LznmUivVXbo7lcXB1Jrq8U=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr1165181otb.23.1611006768451; 
 Mon, 18 Jan 2021 13:52:48 -0800 (PST)
MIME-Version: 1.0
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-8-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1611003683-3534-8-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Jan 2021 16:52:37 -0500
Message-ID: <CADnq5_PEzNaeakyYfyTgKgDeTpGimoJ7he6Jv9x5SL91mZo=KA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] drm/amdgpu: Register IOMMU topology notifier per
 device.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 4:02 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Handle all DMA IOMMU gropup related dependencies before the

gropup -> group

Alex

> group is removed.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 46 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
>  6 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 478a7d8..2953420 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -51,6 +51,7 @@
>  #include <linux/dma-fence.h>
>  #include <linux/pci.h>
>  #include <linux/aer.h>
> +#include <linux/notifier.h>
>
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
> @@ -1041,6 +1042,10 @@ struct amdgpu_device {
>
>         bool                            in_pci_err_recovery;
>         struct pci_saved_state          *pci_state;
> +
> +       struct notifier_block           nb;
> +       struct blocking_notifier_head   notifier;
> +       struct list_head                device_bo_list;
>  };
>
>  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 45e23e3..e99f4f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -70,6 +70,8 @@
>  #include <drm/task_barrier.h>
>  #include <linux/pm_runtime.h>
>
> +#include <linux/iommu.h>
> +
>  MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
> @@ -3200,6 +3202,39 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>  };
>
>
> +static int amdgpu_iommu_group_notifier(struct notifier_block *nb,
> +                                    unsigned long action, void *data)
> +{
> +       struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, nb);
> +       struct amdgpu_bo *bo = NULL;
> +
> +       /*
> +        * Following is a set of IOMMU group dependencies taken care of before
> +        * device's IOMMU group is removed
> +        */
> +       if (action == IOMMU_GROUP_NOTIFY_DEL_DEVICE) {
> +
> +               spin_lock(&ttm_bo_glob.lru_lock);
> +               list_for_each_entry(bo, &adev->device_bo_list, bo) {
> +                       if (bo->tbo.ttm)
> +                               ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
> +               }
> +               spin_unlock(&ttm_bo_glob.lru_lock);
> +
> +               if (adev->irq.ih.use_bus_addr)
> +                       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
> +               if (adev->irq.ih1.use_bus_addr)
> +                       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> +               if (adev->irq.ih2.use_bus_addr)
> +                       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> +
> +               amdgpu_gart_dummy_page_fini(adev);
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
> +
>  /**
>   * amdgpu_device_init - initialize the driver
>   *
> @@ -3304,6 +3339,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>
>         INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>
> +       INIT_LIST_HEAD(&adev->device_bo_list);
> +
>         adev->gfx.gfx_off_req_count = 1;
>         adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>
> @@ -3575,6 +3612,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         if (amdgpu_device_cache_pci_state(adev->pdev))
>                 pci_restore_state(pdev);
>
> +       BLOCKING_INIT_NOTIFIER_HEAD(&adev->notifier);
> +       adev->nb.notifier_call = amdgpu_iommu_group_notifier;
> +
> +       if (adev->dev->iommu_group) {
> +               r = iommu_group_register_notifier(adev->dev->iommu_group, &adev->nb);
> +               if (r)
> +                       goto failed;
> +       }
> +
>         return 0;
>
>  failed:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index 0db9330..486ad6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>   *
>   * Frees the dummy page used by the driver (all asics).
>   */
> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>  {
>         if (!adev->dummy_page_addr)
>                 return;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> index afa2e28..5678d9c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> @@ -61,6 +61,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>  void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>  int amdgpu_gart_init(struct amdgpu_device *adev);
>  void amdgpu_gart_fini(struct amdgpu_device *adev);
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>  int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>                        int pages);
>  int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 6cc9919..4a1de69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -94,6 +94,10 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>         }
>         amdgpu_bo_unref(&bo->parent);
>
> +       spin_lock(&ttm_bo_glob.lru_lock);
> +       list_del(&bo->bo);
> +       spin_unlock(&ttm_bo_glob.lru_lock);
> +
>         kfree(bo->metadata);
>         kfree(bo);
>  }
> @@ -613,6 +617,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>         if (bp->type == ttm_bo_type_device)
>                 bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>
> +       INIT_LIST_HEAD(&bo->bo);
> +
> +       spin_lock(&ttm_bo_glob.lru_lock);
> +       list_add_tail(&bo->bo, &adev->device_bo_list);
> +       spin_unlock(&ttm_bo_glob.lru_lock);
> +
>         return 0;
>
>  fail_unreserve:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 9ac3756..5ae8555 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -110,6 +110,8 @@ struct amdgpu_bo {
>         struct list_head                shadow_list;
>
>         struct kgd_mem                  *kfd_bo;
> +
> +       struct list_head                bo;
>  };
>
>  static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
