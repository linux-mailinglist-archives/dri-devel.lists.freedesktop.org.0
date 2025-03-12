Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0CA5E4F0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 21:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6700810E19D;
	Wed, 12 Mar 2025 20:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="UD4V6+bA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C4E10E19D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 20:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741809928; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PviTS/4OaJ3lhiuPoiHbQ4Bhx6WNTtuXbDKJGXGXEqtaXD1rTr9JNXx/cRVQ/PJPSpnsrEPWJJOdw6o7TZPJTQjRrGbIHjbo2lPgvBiGRFfQRf/lLPAcHV7CKpy0r6vX5Qyd/gBIiyKFTc6CquQQ80n7tpLz/i1NKXHn/kC/y+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741809928;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=T6oTJ/T6m/WggVmL8h7Mzw7Ixokc3/XGdC0+YtzoXtE=; 
 b=I2IsBRVa4yBBNqxuu89Ksj2jgNhUBXz1cLd89AO8Y+qEHAfjWOB7DK6N3IQc/5rKk45rPxnu3kpOx8pWCmaYo9jG6+1AepEgpRGzO/Z91g8gmu6tYcjmB9gXAVvKootnqgDETiZlpuDS0QK8FaVHZmZjpN+CDNp86oqJEMgYGD0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741809928; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=T6oTJ/T6m/WggVmL8h7Mzw7Ixokc3/XGdC0+YtzoXtE=;
 b=UD4V6+bAwlQkx9kuTKejOfO28T6ArUAoBSaLaJBqGfhuJdfzj0soJw/qhuttbLbL
 7BXYtBr2iFX2Kl754NfFQF/kHPLmBDKFhyNxQg1jDbkfNbk8cIymd9muNS4zEbGQQUX
 39dPpYzL6tU7yKrce4zcBdbMXcTrRtjDG0C1Xl7c=
Received: by mx.zohomail.com with SMTPS id 1741809925948773.0672405161134;
 Wed, 12 Mar 2025 13:05:25 -0700 (PDT)
Date: Wed, 12 Mar 2025 20:05:14 +0000
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 4/5] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <yzshale7kmhdkjjmdcjt7hsekrftor66nshdnxlmc4ji3wuexd@5ptz7dtze7ez>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <821252c96ab2ab3e2d8ef211a09f8b171719baaa.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <821252c96ab2ab3e2d8ef211a09f8b171719baaa.1738228114.git.florent.tomasin@arm.com>
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

Hi Florent,

There's a chance whatever I say here's already been discussed in the
review before. If that were the case, ignore it without further ado.

On 30.01.2025 13:09, Florent Tomasin wrote:
> This patch allows Panthor to allocate buffer objects from a
> protected heap. The Panthor driver should be seen as a consumer
> of the heap and not an exporter.
>
> To help with the review of this patch, here are important information
> about the Mali GPU protected mode support:
> - On CSF FW load, the Panthor driver must allocate a protected
>   buffer object to hold data to use by the FW when in protected
>   mode. This protected buffer object is owned by the device
>   and does not belong to a process.
> - On CSG creation, the Panthor driver must allocate a protected
>   suspend buffer object for the FW to store data when suspending
>   the CSG while in protected mode. The kernel owns this allocation
>   and does not allow user space mapping. The format of the data
>   in this buffer is only known by the FW and does not need to be
>   shared with other entities.
>
> To summarize, Mali GPUs require allocations of protected buffer
> objects at the kernel level.
>
> * How is the protected heap accessed by the Panthor driver?
> The driver will retrieve the protected heap using the name of the
> heap provided to the driver via the DTB as attribute.
> If the heap is not yet available, the panthor driver will defer
> the probe until created. It is an integration error to provide
> a heap name that does not exist or is never created in the
> DTB node.
>
> * How is the Panthor driver allocating from the heap?
> Panthor is calling the DMA heap allocation function
> and obtains a DMA buffer from it. This buffer is then
> registered to GEM via PRIME by importing the DMA buffer.
>
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> ---
>  drivers/gpu/drm/panthor/Kconfig          |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c | 22 ++++++++++-
>  drivers/gpu/drm/panthor/panthor_device.h |  7 ++++
>  drivers/gpu/drm/panthor/panthor_fw.c     | 36 +++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_fw.h     |  2 +
>  drivers/gpu/drm/panthor/panthor_gem.c    | 49 ++++++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_gem.h    | 16 +++++++-
>  drivers/gpu/drm/panthor/panthor_heap.c   |  2 +
>  drivers/gpu/drm/panthor/panthor_sched.c  |  5 ++-
>  9 files changed, 130 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> index 55b40ad07f3b..c0208b886d9f 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -7,6 +7,7 @@ config DRM_PANTHOR
>  	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
>  	depends on MMU
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	select DMABUF_HEAPS
>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_GPUVM
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 00f7b8ce935a..1018e5c90a0e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -4,7 +4,9 @@
>  /* Copyright 2023 Collabora ltd. */
>
>  #include <linux/clk.h>
> +#include <linux/dma-heap.h>
>  #include <linux/mm.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -102,6 +104,9 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	panthor_mmu_unplug(ptdev);
>  	panthor_gpu_unplug(ptdev);
>
> +	if (ptdev->protm.heap)
> +		dma_heap_put(ptdev->protm.heap);
> +
Probably beyond the point here, but I think in this case you might be
better off using the CMA API directly rather than going through a
hypothetical extension of dma-heaps.

>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
>
> @@ -172,6 +177,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	u32 *dummy_page_virt;
>  	struct resource *res;
>  	struct page *p;
> +	const char *protm_heap_name;
>  	int ret;
>
>  	ret = panthor_gpu_coherency_init(ptdev);
> @@ -246,9 +252,19 @@ int panthor_device_init(struct panthor_device *ptdev)
>  			return ret;
>  	}
>
> +	/* If a protected heap is specified but not found, defer the probe until created */
> +	if (!of_property_read_string(ptdev->base.dev->of_node, "protected-heap-name",
> +				     &protm_heap_name)) {
> +		ptdev->protm.heap = dma_heap_find(protm_heap_name);
> +		if (!ptdev->protm.heap) {
> +			ret = -EPROBE_DEFER;
> +			goto err_rpm_put;
> +		}
> +	}

Cince none of the DMA memory is going to be shared with othe devices, I don't
think a dma-heap interface is the right tool for the job here. Whatever
protected contiguous memory you allocate for protected mode, it'll always remain
within the boundaries of the driver, so maybe just do the usual sequence here:

of_reserved_mem_device_init();
dev_get_cma_area();
cma_alloc();

>  	ret = panthor_gpu_init(ptdev);
>  	if (ret)
> -		goto err_rpm_put;
> +		goto err_dma_heap_put;
>
>  	ret = panthor_mmu_init(ptdev);
>  	if (ret)
> @@ -286,6 +302,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  err_unplug_gpu:
>  	panthor_gpu_unplug(ptdev);
>
> +err_dma_heap_put:
> +	if (ptdev->protm.heap)
> +		dma_heap_put(ptdev->protm.heap);
> +
>  err_rpm_put:
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
>  	return ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 0e68f5a70d20..406de9e888e2 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -7,6 +7,7 @@
>  #define __PANTHOR_DEVICE_H__
>
>  #include <linux/atomic.h>
> +#include <linux/dma-heap.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/sched.h>
> @@ -190,6 +191,12 @@ struct panthor_device {
>
>  	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
>  	unsigned long fast_rate;
> +
> +	/** @protm: Protected mode related data. */
> +	struct {
> +		/** @heap: Pointer to the protected heap */
> +		struct dma_heap *heap;
> +	} protm;
>  };
>
>  struct panthor_gpu_usage {
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4a2e36504fea..7822af1533b4 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -458,6 +458,7 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
>
>  	mem = panthor_kernel_bo_create(ptdev, ptdev->fw->vm, SZ_8K,
>  				       DRM_PANTHOR_BO_NO_MMAP,
> +				       0,
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>  				       PANTHOR_VM_KERNEL_AUTO_VA);
> @@ -491,6 +492,28 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
>  {
>  	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
>  					DRM_PANTHOR_BO_NO_MMAP,
> +					0,
> +					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> +					PANTHOR_VM_KERNEL_AUTO_VA);
> +}
> +
> +/**
> + * panthor_fw_alloc_protm_suspend_buf_mem() - Allocate a protm suspend buffer
> + * for a command stream group.
> + * @ptdev: Device.
> + * @size: Size of the protm suspend buffer.
> + *
> + * Return: A valid pointer in case of success, NULL if no protected heap, an ERR_PTR() otherwise.
> + */
> +struct panthor_kernel_bo *
> +panthor_fw_alloc_protm_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
> +{
> +	if (!ptdev->protm.heap)
> +		return NULL;
> +
> +	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
> +					DRM_PANTHOR_BO_NO_MMAP,
> +					DRM_PANTHOR_KBO_PROTECTED_HEAP,
>  					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
>  					PANTHOR_VM_KERNEL_AUTO_VA);
>  }

Unify the two above into a single interface like:
struct panthor_kernel_bo *
panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size, bool protected)

and then

return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
				DRM_PANTHOR_BO_NO_MMAP,
				(protected ? DRM_PANTHOR_KBO_PROTECTED_HEAP : 0)
				DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
				PANTHOR_VM_KERNEL_AUTO_VA);

> @@ -503,6 +526,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
>  	struct panthor_fw_binary_section_entry_hdr hdr;
>  	struct panthor_fw_section *section;
> +	bool is_protm_section = false;
>  	u32 section_size;
>  	u32 name_len;
>  	int ret;
> @@ -541,10 +565,13 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		return -EINVAL;
>  	}
>
> -	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) {
> +	if ((hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) && !ptdev->protm.heap) {
>  		drm_warn(&ptdev->base,
>  			 "Firmware protected mode entry not be supported, ignoring");
>  		return 0;
> +	} else if ((hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) && ptdev->protm.heap) {
> +		drm_info(&ptdev->base, "Firmware protected mode entry supported");
> +		is_protm_section = true;
>  	}
>
>  	if (hdr.va.start == CSF_MCU_SHARED_REGION_START &&
> @@ -610,9 +637,10 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
>
>  		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
> -							section_size,
> -							DRM_PANTHOR_BO_NO_MMAP,
> -							vm_map_flags, va);
> +					section_size,
> +					DRM_PANTHOR_BO_NO_MMAP,
> +					(is_protm_section ? DRM_PANTHOR_KBO_PROTECTED_HEAP : 0),
> +					vm_map_flags, va);
>  		if (IS_ERR(section->mem))
>  			return PTR_ERR(section->mem);
>
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 22448abde992..29042d0dc60c 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -481,6 +481,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
>  				 u32 *input_fw_va, u32 *output_fw_va);
>  struct panthor_kernel_bo *
>  panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
> +struct panthor_kernel_bo *
> +panthor_fw_alloc_protm_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
>
>  struct panthor_vm *panthor_fw_vm(struct panthor_device *ptdev);
>
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 8244a4e6c2a2..88caf928acd0 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -9,10 +9,14 @@
>
>  #include <drm/panthor_drm.h>
>
> +#include <uapi/linux/dma-heap.h>
> +
>  #include "panthor_device.h"
>  #include "panthor_gem.h"
>  #include "panthor_mmu.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
>  {
>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
> @@ -31,6 +35,7 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>   */
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  {
> +	struct dma_buf *dma_bo = NULL;
>  	struct panthor_vm *vm;
>  	int ret;
>
> @@ -38,6 +43,10 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  		return;
>
>  	vm = bo->vm;
> +
> +	if (bo->flags & DRM_PANTHOR_KBO_PROTECTED_HEAP)
> +		dma_bo = bo->obj->import_attach->dmabuf;
> +
>  	panthor_kernel_bo_vunmap(bo);
>
>  	if (drm_WARN_ON(bo->obj->dev,
> @@ -51,6 +60,9 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  	panthor_vm_free_va(vm, &bo->va_node);
>  	drm_gem_object_put(bo->obj);
>
> +	if (dma_bo)
> +		dma_buf_put(dma_bo);
> +
>  out_free_bo:
>  	panthor_vm_put(vm);
>  	kfree(bo);
> @@ -62,6 +74,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>   * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
>   * @size: Size of the buffer object.
>   * @bo_flags: Combination of drm_panthor_bo_flags flags.
> + * @kbo_flags: Combination of drm_panthor_kbo_flags flags.
>   * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
>   * that are related to map operations).
>   * @gpu_va: GPU address assigned when mapping to the VM.
> @@ -72,9 +85,11 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>   */
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
> -			 size_t size, u32 bo_flags, u32 vm_map_flags,
> +			 size_t size, u32 bo_flags, u32 kbo_flags, u32 vm_map_flags,
>  			 u64 gpu_va)
>  {
> +	struct dma_buf *dma_bo = NULL;
> +	struct drm_gem_object *gem_obj = NULL;
>  	struct drm_gem_shmem_object *obj;
>  	struct panthor_kernel_bo *kbo;
>  	struct panthor_gem_object *bo;
> @@ -87,14 +102,38 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	if (!kbo)
>  		return ERR_PTR(-ENOMEM);
>
> -	obj = drm_gem_shmem_create(&ptdev->base, size);
> +	if (kbo_flags & DRM_PANTHOR_KBO_PROTECTED_HEAP) {
> +		if (!ptdev->protm.heap) {
> +			ret = -EINVAL;
> +			goto err_free_bo;
> +		}
> +
> +		dma_bo = dma_heap_buffer_alloc(ptdev->protm.heap, size,
> +					       DMA_HEAP_VALID_FD_FLAGS, DMA_HEAP_VALID_HEAP_FLAGS);

		dma_heap_buffer_alloc() is a static function, so why do you call it from here?
                I suppose you plan on extending the dma-heap interface in the future?

> +		if (!dma_bo) {
> +			ret = -ENOMEM;
> +			goto err_free_bo;
> +		}
> +
> +		gem_obj = drm_gem_prime_import(&ptdev->base, dma_bo);
> +		if (IS_ERR(gem_obj)) {
> +			ret = PTR_ERR(gem_obj);
> +			goto err_free_dma_bo;
> +		}
> +

If you chose the dma-heap interface because dma-heap offers you an easy
way to create a GEM object from an sgtable, perhaps you could create the
dma-buf right here and do a self-import. That way you wouldn't need to
extend dma-heap.


> +		obj = to_drm_gem_shmem_obj(gem_obj);
> +	} else {
> +		obj = drm_gem_shmem_create(&ptdev->base, size);
> +	}
> +
>  	if (IS_ERR(obj)) {
>  		ret = PTR_ERR(obj);
> -		goto err_free_bo;
> +		goto err_free_dma_bo;
>  	}
>
>  	bo = to_panthor_bo(&obj->base);
>  	kbo->obj = &obj->base;
> +	kbo->flags = kbo_flags;
>  	bo->flags = bo_flags;
>
>  	/* The system and GPU MMU page size might differ, which becomes a
> @@ -124,6 +163,10 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  err_put_obj:
>  	drm_gem_object_put(&obj->base);
>
> +err_free_dma_bo:
> +	if (dma_bo)
> +		dma_buf_put(dma_bo);
> +
>  err_free_bo:
>  	kfree(kbo);
>  	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index e43021cf6d45..d4fe8ae9f0a8 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -13,6 +13,17 @@
>
>  struct panthor_vm;
>
> +/**
> + * enum drm_panthor_kbo_flags -  Kernel buffer object flags, passed at creation time
> + */
> +enum drm_panthor_kbo_flags {
> +	/**
> +	 * @DRM_PANTHOR_KBO_PROTECTED_HEAP: The buffer object will be allocated
> +	 * from a DMA-Buf protected heap.
> +	 */
> +	DRM_PANTHOR_KBO_PROTECTED_HEAP = (1 << 0),
> +};
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
> @@ -75,6 +86,9 @@ struct panthor_kernel_bo {
>  	 * @kmap: Kernel CPU mapping of @gem.
>  	 */
>  	void *kmap;
> +
> +	/** @flags: Combination of drm_panthor_kbo_flags flags. */
> +	u32 flags;
>  };
>
>  static inline
> @@ -138,7 +152,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
>
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
> -			 size_t size, u32 bo_flags, u32 vm_map_flags,
> +			 size_t size, u32 bo_flags, u32 kbo_flags, u32 vm_map_flags,
>  			 u64 gpu_va);
>
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3796a9eb22af..5395f0d90360 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -146,6 +146,7 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
>
>  	chunk->bo = panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
>  					     DRM_PANTHOR_BO_NO_MMAP,
> +					     0,
>  					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
>  					     PANTHOR_VM_KERNEL_AUTO_VA);
>  	if (IS_ERR(chunk->bo)) {
> @@ -549,6 +550,7 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
>
>  	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
>  						      DRM_PANTHOR_BO_NO_MMAP,
> +						      0,
>  						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
>  						      PANTHOR_VM_KERNEL_AUTO_VA);
>  	if (IS_ERR(pool->gpu_contexts)) {
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index ef4bec7ff9c7..e260ed8aef5b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3298,6 +3298,7 @@ group_create_queue(struct panthor_group *group,
>  	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, group->vm,
>  						  args->ringbuf_size,
>  						  DRM_PANTHOR_BO_NO_MMAP,
> +						  0,
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>  						  PANTHOR_VM_KERNEL_AUTO_VA);
> @@ -3328,6 +3329,7 @@ group_create_queue(struct panthor_group *group,
>  					 queue->profiling.slot_count *
>  					 sizeof(struct panthor_job_profiling_data),
>  					 DRM_PANTHOR_BO_NO_MMAP,
> +					 0,
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>  					 PANTHOR_VM_KERNEL_AUTO_VA);
> @@ -3435,7 +3437,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	}
>
>  	suspend_size = csg_iface->control->protm_suspend_size;
> -	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
> +	group->protm_suspend_buf = panthor_fw_alloc_protm_suspend_buf_mem(ptdev, suspend_size);

I think  you could reuse panthor_fw_alloc_suspend_buf_mem() and extend its interface
so that it takes a boolean for the case you want to allocate a protected buffer.

>  	if (IS_ERR(group->protm_suspend_buf)) {
>  		ret = PTR_ERR(group->protm_suspend_buf);
>  		group->protm_suspend_buf = NULL;
> @@ -3446,6 +3448,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  						   group_args->queues.count *
>  						   sizeof(struct panthor_syncobj_64b),
>  						   DRM_PANTHOR_BO_NO_MMAP,
> +						   0,
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>  						   PANTHOR_VM_KERNEL_AUTO_VA);
> --
> 2.34.1


Adrian Larumbe
