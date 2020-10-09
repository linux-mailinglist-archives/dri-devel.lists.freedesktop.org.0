Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DC289BA9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 00:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A760D6EE2A;
	Fri,  9 Oct 2020 22:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DECD6EE2A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 22:15:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a72so636368wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EVbWBMj90KrvpPEBggifSgbaOd/h19avGrpBxpoJI38=;
 b=D5CQVxAnIxOf1vpT+5lyhHuecAlbfmmcUTCB8e5t++gs1RbfhWYvCppbQ5fldP5tQZ
 DA9TMFP3YqDNj9OO8dmmTffGfaTcQ0w/XW8jJaSpo2ZuT5ABEM4fXoiAleZf/bycYUgR
 Fgqj7E2N1peAanp2YETrAxma+egYy90EEPbas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EVbWBMj90KrvpPEBggifSgbaOd/h19avGrpBxpoJI38=;
 b=BFWsxxEMDu7c1eMiehmJq40dFOp2SptTST7QkgLVac/6Z+1+STI5d8+Do1AQ2oRYTd
 /Q/laR/dtZqwaceB3ZLlAqCakWzMlhqPrj/OKETyKSZCuxuEKxqMdK1LqSrJETr3XK68
 2ZNh9h4qfKWE2YZt1TXMQz/JZSdSq033aO2GpK+vYOM2KTvwDlLZqMMYC8jbQSCAeKLf
 soNlGuwqGoRN/seySfsgPBUlgemTGm0QIWeIxjihZHRa58XkYxnI5inpevivkE+aaEJB
 5wJ32CuqOWijy9uwvrUIQpnqdHbF1uPr6/j8bO+NaWopyv5i799pyKc0l50Ic9H3A0lm
 Wk2g==
X-Gm-Message-State: AOAM531TbdHplWC/ttR/36pahP7EK9YmALht587JmSOnerATFX6R/Pcb
 MpQkSPqdgN1AbOrf/RctLeolIQ==
X-Google-Smtp-Source: ABdhPJxIeEebTudBefzkVnGz0RQVRhEzDdR6rPmnQYVy0y9KEiDPDw4HtbUwney7fSnD3SxhXn8auQ==
X-Received: by 2002:a1c:5a86:: with SMTP id o128mr28303wmb.129.1602281719318; 
 Fri, 09 Oct 2020 15:15:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d2sm3598262wrq.34.2020.10.09.15.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 15:15:18 -0700 (PDT)
Date: Sat, 10 Oct 2020 00:15:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: kuhanh.murugasen.krishnan@intel.com
Subject: Re: [PATCH v1 1/4] drm: Add Keem Bay VPU codec DRM
Message-ID: <20201009221516.GR438822@phenom.ffwll.local>
References: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
 <1602244675-8785-2-git-send-email-kuhanh.murugasen.krishnan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602244675-8785-2-git-send-email-kuhanh.murugasen.krishnan@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64
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
Cc: Greg KH <gregkh@linuxfoundation.org>, mgross@linux.intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 07:57:52PM +0800, kuhanh.murugasen.krishnan@intel.com wrote:
> From: "Murugasen Krishnan, Kuhanh" <kuhanh.murugasen.krishnan@intel.com>
> 
> This is a new DRM media codec driver for Intel's Keem Bay SOC which
> integrates the Verisilicon's Hantro Video Processor Unit (VPU) IP.
> The SoC couples an ARM Cortex A53 CPU with an Intel Movidius VPU.
> 
> Hantro VPU IP is a series of video decoder and encoder semiconductor IP cores,
> which can be flexibly configured for video surveillance, multimedia consumer
> products, Internet of Things, cloud service products, data centers, aerial
> photography and recorders, thereby providing video transcoding and multi-channel
> HD video encoding and decoding.
> 
> Hantro VPU IP consists of Hantro VC8000D for decoder and Hantro VC8000E for encoder.
> 
> Signed-off-by: Murugasen Krishnan, Kuhanh <kuhanh.murugasen.krishnan@intel.com>
> Acked-by: Mark, Gross <mgross@linux.intel.com>

So there's this intel-internal pre-approval review process thing going on,
and apparently it's utterly useless.

This driver here happily copypastes like half of drm. This is not how
upstream developement is done.

The other issue, and that's the same as with the other kmb drm driver:
Doesn't start out with dt changes and schema, in the same patch series as
the driver itself. In the case of kmb display driver this means it's at
v9, and only now did we discover that the architecture is (maybe, verdict
by dt/armsoc people is still pending) is all wrong.

And finally you might have picked the wrong subsystem, proposing the first
media codec for drm is certainly bold, but not entirely out of line.

I'm not sure what the goal here is, but you might want to send a mail to
my intel address first before we proceed here.
-Daniel

> ---
>  drivers/gpu/drm/hantro/hantro_drm.c   | 1673 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/hantro/hantro_drm.h   |  208 ++++
>  drivers/gpu/drm/hantro/hantro_fence.c |  284 ++++++
>  drivers/gpu/drm/hantro/hantro_priv.h  |  106 +++
>  4 files changed, 2271 insertions(+)
>  create mode 100644 drivers/gpu/drm/hantro/hantro_drm.c
>  create mode 100644 drivers/gpu/drm/hantro/hantro_drm.h
>  create mode 100644 drivers/gpu/drm/hantro/hantro_fence.c
>  create mode 100644 drivers/gpu/drm/hantro/hantro_priv.h
> 
> diff --git a/drivers/gpu/drm/hantro/hantro_drm.c b/drivers/gpu/drm/hantro/hantro_drm.c
> new file mode 100644
> index 0000000..50ccddf
> --- /dev/null
> +++ b/drivers/gpu/drm/hantro/hantro_drm.c
> @@ -0,0 +1,1673 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *    Hantro driver main DRM file
> + *
> + *    Copyright (c) 2017 - 2020, VeriSilicon Inc.
> + *    Copyright (c) 2020 Intel Corporation
> + */
> +
> +#include <linux/io.h>
> +#include <linux/sched.h>
> +#include <linux/uaccess.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/ioport.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/mm.h>
> +#include <linux/shmem_fs.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +#include <linux/dma-contiguous.h>
> +#include <drm/drm_modeset_helper.h>
> +/* hantro header */
> +#include "hantro_priv.h"
> +#include "hantro_enc.h"
> +#include "hantro_dec.h"
> +/* for dynamic ddr */
> +#include <linux/dma-mapping.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/cma.h>
> +
> +struct hantro_device_handle hantro_dev;
> +
> +/* struct used for dynamic ddr allocations */
> +struct hantro_mem ddr1;
> +struct device *ddr_dev;
> +
> +static u32 hantro_vblank_no_hw_counter(struct drm_device *dev,
> +				       unsigned int pipe)
> +{
> +	return 0;
> +}
> +
> +static int hantro_recordmem(struct drm_file *priv, void *obj, int size)
> +{
> +	int ret;
> +	struct idr *list = (struct idr *)priv->driver_priv;
> +
> +	ret = idr_alloc(list, obj, 1, 0, GFP_KERNEL);
> +
> +	return (ret > 0 ? 0 : -ENOMEM);
> +}
> +
> +static void hantro_unrecordmem(struct drm_file *priv, void *obj)
> +{
> +	int id;
> +	struct idr *list = (struct idr *)priv->driver_priv;
> +	void *gemobj;
> +
> +	idr_for_each_entry(list, gemobj, id) {
> +		if (gemobj == obj) {
> +			idr_remove(list, id);
> +			break;
> +		}
> +	}
> +}
> +
> +static void hantro_drm_fb_destroy(struct drm_framebuffer *fb)
> +{
> +	struct hantro_drm_fb *vsi_fb = (struct hantro_drm_fb *)fb;
> +	int i;
> +
> +	for (i = 0; i < 4; i++)
> +		hantro_unref_drmobj(vsi_fb->obj[i]);
> +
> +	drm_framebuffer_cleanup(fb);
> +	kfree(vsi_fb);
> +}
> +
> +static int hantro_drm_fb_create_handle(struct drm_framebuffer *fb,
> +				       struct drm_file *file_priv,
> +				       unsigned int *handle)
> +{
> +	struct hantro_drm_fb *vsi_fb = (struct hantro_drm_fb *)fb;
> +
> +	return drm_gem_handle_create(file_priv, vsi_fb->obj[0], handle);
> +}
> +
> +static int hantro_drm_fb_dirty(struct drm_framebuffer *fb,
> +			       struct drm_file *file, unsigned int flags,
> +			       unsigned int color, struct drm_clip_rect *clips,
> +			       unsigned int num_clips)
> +{
> +	return 0;
> +}
> +
> +static const struct drm_framebuffer_funcs hantro_drm_fb_funcs = {
> +	.destroy = hantro_drm_fb_destroy,
> +	.create_handle = hantro_drm_fb_create_handle,
> +	.dirty = hantro_drm_fb_dirty,
> +};
> +
> +static int hantro_gem_dumb_create_internal(struct drm_file *file_priv,
> +					   struct drm_device *dev,
> +					   struct drm_mode_create_dumb *args)
> +{
> +	int ret = 0;
> +	int in_size, out_size;
> +	struct drm_gem_hantro_object *cma_obj;
> +	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> +	struct drm_gem_object *obj;
> +
> +	if (mutex_lock_interruptible(&dev->struct_mutex))
> +		return -EBUSY;
> +	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> +	if (!cma_obj) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +	obj = &cma_obj->base;
> +	out_size = sizeof(*args);
> +	in_size = sizeof(*args);
> +	args->pitch = ALIGN(min_pitch, 64);
> +	args->size = (__u64)args->pitch * (__u64)args->height;
> +	args->size = (args->size + PAGE_SIZE - 1) / PAGE_SIZE * PAGE_SIZE;
> +
> +	cma_obj->num_pages = args->size >> PAGE_SHIFT;
> +	cma_obj->flag = 0;
> +	cma_obj->pageaddr = NULL;
> +	cma_obj->pages = NULL;
> +	cma_obj->vaddr = NULL;
> +
> +	if (args->handle == DDR0_CHANNEL) {
> +		ddr_dev = dev->dev;
> +		cma_obj->ddr_channel = DDR0_CHANNEL;
> +	} else if (args->handle == DDR1_CHANNEL) {
> +		ddr_dev = ddr1.dev;
> +		cma_obj->ddr_channel = DDR1_CHANNEL;
> +	}
> +	cma_obj->vaddr = dma_alloc_coherent(ddr_dev, args->size,
> +					    &cma_obj->paddr, GFP_KERNEL | GFP_DMA);
> +	if (!cma_obj->vaddr) {
> +		kfree(cma_obj);
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	drm_gem_object_init(dev, obj, args->size);
> +
> +	args->handle = 0;
> +	ret = drm_gem_handle_create(file_priv, obj, &args->handle);
> +	if (ret == 0)
> +		ret = hantro_recordmem(file_priv, cma_obj, args->size);
> +	if (ret) {
> +		dma_free_coherent(ddr_dev, args->size, cma_obj->vaddr,
> +				  cma_obj->paddr);
> +		kfree(cma_obj);
> +	}
> +	init_hantro_resv(&cma_obj->kresv, cma_obj);
> +	cma_obj->handle = args->handle;
> +out:
> +	mutex_unlock(&dev->struct_mutex);
> +
> +	return ret;
> +}
> +
> +static int hantro_gem_dumb_create(struct drm_device *dev, void *data,
> +				  struct drm_file *file_priv)
> +{
> +	return hantro_gem_dumb_create_internal(file_priv, dev,
> +					       (struct drm_mode_create_dumb *)data);
> +}
> +
> +static int hantro_gem_dumb_map_offset(struct drm_file *file_priv,
> +				      struct drm_device *dev, uint32_t handle,
> +				      uint64_t *offset)
> +{
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = hantro_gem_object_lookup(dev, file_priv, handle);
> +	if (!obj)
> +		return -EINVAL;
> +
> +	ret = drm_gem_create_mmap_offset(obj);
> +	if (ret == 0)
> +		*offset = drm_vma_node_offset_addr(&obj->vma_node);
> +	hantro_unref_drmobj(obj);
> +
> +	return ret;
> +}
> +
> +static int hantro_destroy_dumb(struct drm_device *dev, void *data,
> +			       struct drm_file *file_priv)
> +{
> +	struct drm_mode_destroy_dumb *args = data;
> +	struct drm_gem_object *obj;
> +	struct drm_gem_hantro_object *cma_obj;
> +
> +	if (mutex_lock_interruptible(&dev->struct_mutex))
> +		return -EBUSY;
> +	obj = hantro_gem_object_lookup(dev, file_priv, args->handle);
> +	if (!obj) {
> +		mutex_unlock(&dev->struct_mutex);
> +		return -EINVAL;
> +	}
> +	hantro_unref_drmobj(obj);
> +
> +	cma_obj = to_drm_gem_hantro_obj(obj);
> +	if ((cma_obj->flag & HANTRO_GEM_FLAG_IMPORT) == 0)
> +		hantro_unrecordmem(file_priv, cma_obj);
> +
> +	drm_gem_handle_delete(file_priv, args->handle);
> +	hantro_unref_drmobj(obj);
> +	mutex_unlock(&dev->struct_mutex);
> +
> +	return 0;
> +}
> +
> +static int hantro_release_dumb(struct drm_device *dev,
> +			       struct drm_file *file_priv, void *obj)
> +{
> +	struct drm_gem_object *gemobj = obj;
> +	struct drm_gem_hantro_object *cma_obj;
> +
> +	cma_obj = to_drm_gem_hantro_obj(gemobj);
> +
> +	drm_gem_free_mmap_offset(&cma_obj->base);
> +
> +	if (cma_obj->flag & HANTRO_GEM_FLAG_EXPORT) {
> +		drm_gem_handle_delete(file_priv, cma_obj->handle);
> +		hantro_unref_drmobj(obj);
> +		return 0;
> +	}
> +
> +	drm_gem_object_release(gemobj);
> +	drm_gem_handle_delete(file_priv, cma_obj->handle);
> +
> +	if (cma_obj->vaddr) {
> +		if (cma_obj->ddr_channel == DDR0_CHANNEL)
> +			ddr_dev = gemobj->dev->dev;
> +		else if (cma_obj->ddr_channel == DDR1_CHANNEL)
> +			ddr_dev = ddr1.dev;
> +		dma_free_coherent(ddr_dev, cma_obj->base.size, cma_obj->vaddr,
> +				  cma_obj->paddr);
> +	}
> +	dma_resv_fini(&cma_obj->kresv);
> +	kfree(cma_obj);
> +
> +	return 0;
> +}
> +
> +static int hantro_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	int ret = 0;
> +	struct drm_gem_object *obj = NULL;
> +	struct drm_gem_hantro_object *cma_obj;
> +	struct drm_vma_offset_node *node;
> +	unsigned long page_num = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
> +	unsigned long address = 0;
> +	int sgtidx = 0;
> +	struct scatterlist *pscatter = NULL;
> +	struct page **pages = NULL;
> +
> +	if (mutex_lock_interruptible(&hantro_dev.drm_dev->struct_mutex))
> +		return -EBUSY;
> +	drm_vma_offset_lock_lookup(hantro_dev.drm_dev->vma_offset_manager);
> +	node = drm_vma_offset_exact_lookup_locked(hantro_dev.drm_dev->vma_offset_manager,
> +						  vma->vm_pgoff, vma_pages(vma));
> +
> +	if (likely(node)) {
> +		obj = container_of(node, struct drm_gem_object, vma_node);
> +		if (!kref_get_unless_zero(&obj->refcount))
> +			obj = NULL;
> +	}
> +	drm_vma_offset_unlock_lookup(hantro_dev.drm_dev->vma_offset_manager);
> +	hantro_unref_drmobj(obj);
> +
> +	if (!obj) {
> +		mutex_unlock(&hantro_dev.drm_dev->struct_mutex);
> +		return -EINVAL;
> +	}
> +	cma_obj = to_drm_gem_hantro_obj(obj);
> +
> +	if (page_num > cma_obj->num_pages) {
> +		mutex_unlock(&hantro_dev.drm_dev->struct_mutex);
> +		return -EINVAL;
> +	}
> +
> +	if ((cma_obj->flag & HANTRO_GEM_FLAG_IMPORT) == 0) {
> +		address = (unsigned long)cma_obj->vaddr;
> +		if (address == 0) {
> +			mutex_unlock(&hantro_dev.drm_dev->struct_mutex);
> +			return -EINVAL;
> +		}
> +		ret = drm_gem_mmap_obj(obj,
> +				       drm_vma_node_size(node) << PAGE_SHIFT, vma);
> +
> +		if (ret) {
> +			mutex_unlock(&hantro_dev.drm_dev->struct_mutex);
> +			return ret;
> +		}
> +	} else {
> +		pscatter = &cma_obj->sgt->sgl[sgtidx];
> +		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	}
> +
> +	vma->vm_pgoff = 0;
> +	if (cma_obj->ddr_channel == DDR0_CHANNEL)
> +		ddr_dev = hantro_dev.drm_dev->dev;
> +	else if (cma_obj->ddr_channel == DDR1_CHANNEL)
> +		ddr_dev = ddr1.dev;
> +
> +	if (dma_mmap_coherent(ddr_dev, vma, cma_obj->vaddr, cma_obj->paddr,
> +			      page_num << PAGE_SHIFT)) {
> +		mutex_unlock(&hantro_dev.drm_dev->struct_mutex);
> +		return -EAGAIN;
> +	}
> +
> +	vma->vm_private_data = cma_obj;
> +	cma_obj->pages = pages;
> +	mutex_unlock(&hantro_dev.drm_dev->struct_mutex);
> +
> +	return ret;
> +}
> +
> +static int hantro_gem_open_obj(struct drm_gem_object *obj,
> +			       struct drm_file *filp)
> +{
> +	return 0;
> +}
> +
> +static int hantro_device_open(struct inode *inode, struct file *filp)
> +{
> +	int ret;
> +
> +	ret = drm_open(inode, filp);
> +	hantrodec_open(inode, filp);
> +
> +	return ret;
> +}
> +
> +static int hantro_device_release(struct inode *inode, struct file *filp)
> +{
> +	return drm_release(inode, filp);
> +}
> +
> +static vm_fault_t hantro_vm_fault(struct vm_fault *vmf)
> +{
> +	return -EPERM;
> +}
> +
> +#ifndef virt_to_bus
> +static inline unsigned long virt_to_bus(void *address)
> +{
> +	return (unsigned long)address;
> +}
> +#endif
> +
> +static struct sg_table *
> +hantro_gem_prime_get_sg_table(struct drm_gem_object *obj)
> +{
> +	struct drm_gem_hantro_object *cma_obj = to_drm_gem_hantro_obj(obj);
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return NULL;
> +
> +	if (cma_obj->ddr_channel == DDR0_CHANNEL)
> +		ddr_dev = obj->dev->dev;
> +	else if (cma_obj->ddr_channel == DDR1_CHANNEL)
> +		ddr_dev = ddr1.dev;
> +
> +	ret = dma_get_sgtable(ddr_dev, sgt, cma_obj->vaddr, cma_obj->paddr,
> +			      obj->size);
> +	if (ret < 0)
> +		goto out;
> +
> +	return sgt;
> +
> +out:
> +	kfree(sgt);
> +	return NULL;
> +}
> +
> +static struct drm_gem_object *
> +hantro_gem_prime_import_sg_table(struct drm_device *dev,
> +				 struct dma_buf_attachment *attach,
> +				 struct sg_table *sgt)
> +{
> +	struct drm_gem_hantro_object *cma_obj;
> +	struct drm_gem_object *obj;
> +
> +	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> +	if (!cma_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	obj = &cma_obj->base;
> +
> +	if (sgt->nents > 1) {
> +		/* check if the entries in the sg_table are contiguous */
> +		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
> +		struct scatterlist *s;
> +		unsigned int i;
> +
> +		for_each_sg(sgt->sgl, s, sgt->nents, i) {
> +			/*
> +			 * sg_dma_address(s) is only valid for entries
> +			 * that have sg_dma_len(s) != 0
> +			 */
> +			if (!sg_dma_len(s))
> +				continue;
> +
> +			if (sg_dma_address(s) != next_addr) {
> +				kfree(cma_obj);
> +				return ERR_PTR(-EINVAL);
> +			}
> +
> +			next_addr = sg_dma_address(s) + sg_dma_len(s);
> +		}
> +	}
> +	if (drm_gem_object_init(dev, obj, attach->dmabuf->size) != 0) {
> +		kfree(cma_obj);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +	cma_obj->paddr = sg_dma_address(sgt->sgl);
> +	cma_obj->vaddr = dma_buf_vmap(attach->dmabuf);
> +	cma_obj->sgt = sgt;
> +	cma_obj->flag |= HANTRO_GEM_FLAG_IMPORT;
> +	cma_obj->num_pages = attach->dmabuf->size >> PAGE_SHIFT;
> +
> +	return obj;
> +}
> +
> +static void *hantro_gem_prime_vmap(struct drm_gem_object *obj)
> +{
> +	struct drm_gem_hantro_object *cma_obj = to_drm_gem_hantro_obj(obj);
> +
> +	return cma_obj->vaddr;
> +}
> +
> +static void hantro_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +{
> +}
> +
> +static int hantro_gem_prime_mmap(struct drm_gem_object *obj,
> +				 struct vm_area_struct *vma)
> +{
> +	struct drm_gem_hantro_object *cma_obj;
> +	unsigned long page_num = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
> +	int ret = 0;
> +
> +	cma_obj = to_drm_gem_hantro_obj(obj);
> +
> +	if (page_num > cma_obj->num_pages)
> +		return -EINVAL;
> +
> +	if ((cma_obj->flag & HANTRO_GEM_FLAG_IMPORT) != 0)
> +		return -EINVAL;
> +
> +	if ((unsigned long)cma_obj->vaddr == 0)
> +		return -EINVAL;
> +
> +	ret = drm_gem_mmap_obj(obj, obj->size, vma);
> +	if (ret < 0)
> +		return ret;
> +
> +	vma->vm_flags &= ~VM_PFNMAP;
> +	vma->vm_pgoff = 0;
> +
> +	if (cma_obj->ddr_channel == DDR0_CHANNEL)
> +		ddr_dev = obj->dev->dev;
> +	else if (cma_obj->ddr_channel == DDR1_CHANNEL)
> +		ddr_dev = ddr1.dev;
> +
> +	if (dma_mmap_coherent(ddr_dev, vma, cma_obj->vaddr, cma_obj->paddr,
> +			      vma->vm_end - vma->vm_start)) {
> +		drm_gem_vm_close(vma);
> +		mutex_unlock(&hantro_dev.drm_dev->struct_mutex);
> +		return -EAGAIN;
> +	}
> +	vma->vm_private_data = cma_obj;
> +
> +	return ret;
> +}
> +
> +static struct drm_gem_object *
> +hantro_drm_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
> +{
> +	return drm_gem_prime_import(dev, dma_buf);
> +}
> +
> +static void hantro_gem_free_object(struct drm_gem_object *gem_obj)
> +{
> +	struct drm_gem_hantro_object *cma_obj;
> +
> +	cma_obj = to_drm_gem_hantro_obj(gem_obj);
> +	if (cma_obj->pages) {
> +		int i;
> +
> +		for (i = 0; i < cma_obj->num_pages; i++)
> +			unref_page(cma_obj->pages[i]);
> +
> +		kfree(cma_obj->pages);
> +		cma_obj->pages = NULL;
> +	}
> +
> +	drm_gem_free_mmap_offset(gem_obj);
> +	drm_gem_object_release(gem_obj);
> +	if (gem_obj->import_attach) {
> +		if (cma_obj->vaddr)
> +			dma_buf_vunmap(gem_obj->import_attach->dmabuf,
> +				       cma_obj->vaddr);
> +		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
> +	} else if (cma_obj->vaddr) {
> +		if (cma_obj->ddr_channel == DDR0_CHANNEL)
> +			ddr_dev = gem_obj->dev->dev;
> +		else if (cma_obj->ddr_channel == DDR1_CHANNEL)
> +			ddr_dev = ddr1.dev;
> +		dma_free_coherent(ddr_dev, cma_obj->base.size, cma_obj->vaddr,
> +				  cma_obj->paddr);
> +	}
> +
> +	dma_resv_fini(&cma_obj->kresv);
> +	kfree(cma_obj);
> +}
> +
> +static int hantro_gem_close(struct drm_device *dev, void *data,
> +			    struct drm_file *file_priv)
> +{
> +	struct drm_gem_close *args = data;
> +	int ret = 0;
> +	struct drm_gem_object *obj =
> +		hantro_gem_object_lookup(dev, file_priv, args->handle);
> +
> +	if (!obj)
> +		return -EINVAL;
> +
> +	ret = drm_gem_handle_delete(file_priv, args->handle);
> +	hantro_unref_drmobj(obj);
> +
> +	return ret;
> +}
> +
> +static int hantro_gem_open(struct drm_device *dev, void *data,
> +			   struct drm_file *file_priv)
> +{
> +	int ret;
> +	u32 handle;
> +	struct drm_gem_open *openarg;
> +	struct drm_gem_object *obj = NULL;
> +
> +	openarg = (struct drm_gem_open *)data;
> +
> +	obj = idr_find(&dev->object_name_idr, (int)openarg->name);
> +	if (obj)
> +		hantro_ref_drmobj(obj);
> +	else
> +		return -ENOENT;
> +
> +	ret = drm_gem_handle_create(file_priv, obj, &handle);
> +	hantro_unref_drmobj(obj);
> +	if (ret)
> +		return ret;
> +
> +	openarg->handle = handle;
> +	openarg->size = obj->size;
> +
> +	return ret;
> +}
> +
> +static int hantro_map_vaddr(struct drm_device *dev, void *data,
> +			    struct drm_file *file_priv)
> +{
> +	struct hantro_addrmap *pamap = data;
> +	struct drm_gem_object *obj;
> +	struct drm_gem_hantro_object *cma_obj;
> +
> +	obj = hantro_gem_object_lookup(dev, file_priv, pamap->handle);
> +	if (!obj)
> +		return -EINVAL;
> +
> +	cma_obj = to_drm_gem_hantro_obj(obj);
> +	pamap->vm_addr = (unsigned long)cma_obj->vaddr;
> +	pamap->phy_addr = cma_obj->paddr;
> +	hantro_unref_drmobj(obj);
> +
> +	return 0;
> +}
> +
> +static int hantro_gem_flink(struct drm_device *dev, void *data,
> +			    struct drm_file *file_priv)
> +{
> +	struct drm_gem_flink *args = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_GEM))
> +		return -ENODEV;
> +
> +	obj = hantro_gem_object_lookup(dev, file_priv, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	mutex_lock(&dev->object_name_lock);
> +	/* prevent races with concurrent gem_close. */
> +	if (obj->handle_count == 0) {
> +		ret = -ENOENT;
> +		goto err;
> +	}
> +
> +	if (!obj->name) {
> +		ret = idr_alloc(&dev->object_name_idr, obj, 1, 0, GFP_KERNEL);
> +		if (ret < 0)
> +			goto err;
> +
> +		obj->name = ret;
> +	}
> +
> +	args->name = (uint64_t)obj->name;
> +	ret = 0;
> +
> +err:
> +	mutex_unlock(&dev->object_name_lock);
> +	hantro_unref_drmobj(obj);
> +	return ret;
> +}
> +
> +static int hantro_map_dumb(struct drm_device *dev, void *data,
> +			   struct drm_file *file_priv)
> +{
> +	int ret;
> +	struct drm_mode_map_dumb *temparg = (struct drm_mode_map_dumb *)data;
> +
> +	ret = hantro_gem_dumb_map_offset(file_priv, dev, temparg->handle,
> +					 &temparg->offset);
> +
> +	return ret;
> +}
> +
> +static int hantro_drm_open(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct idr *ptr;
> +
> +	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +	idr_init(ptr);
> +	file->driver_priv = ptr;
> +
> +	return 0;
> +}
> +
> +static void hantro_drm_postclose(struct drm_device *dev, struct drm_file *file)
> +{
> +	int id;
> +	struct idr *cmalist = (struct idr *)file->driver_priv;
> +	void *obj;
> +
> +	mutex_lock(&dev->struct_mutex);
> +	if (file->driver_priv) {
> +		idr_for_each_entry(cmalist, obj, id) {
> +			if (obj) {
> +				hantro_release_dumb(dev, file, obj);
> +				idr_remove(cmalist, id);
> +			}
> +		}
> +		idr_destroy(cmalist);
> +		kfree(file->driver_priv);
> +		file->driver_priv = NULL;
> +	}
> +	mutex_unlock(&dev->struct_mutex);
> +}
> +
> +static int hantro_handle_to_fd(struct drm_device *dev, void *data,
> +			       struct drm_file *file_priv)
> +{
> +	int ret;
> +	struct drm_prime_handle *primeargs = (struct drm_prime_handle *)data;
> +	struct drm_gem_object *obj;
> +	struct drm_gem_hantro_object *cma_obj;
> +
> +	obj = hantro_gem_object_lookup(dev, file_priv, primeargs->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	ret = drm_gem_prime_handle_to_fd(dev, file_priv, primeargs->handle,
> +					 primeargs->flags, &primeargs->fd);
> +
> +	if (ret == 0) {
> +		cma_obj = to_drm_gem_hantro_obj(obj);
> +		cma_obj->flag |= HANTRO_GEM_FLAG_EXPORT;
> +	}
> +	hantro_unref_drmobj(obj);
> +
> +	return ret;
> +}
> +
> +static int hantro_fd_to_handle(struct drm_device *dev, void *data,
> +			       struct drm_file *file_priv)
> +{
> +	struct drm_prime_handle *primeargs = (struct drm_prime_handle *)data;
> +
> +	return drm_gem_prime_fd_to_handle(dev, file_priv, primeargs->fd,
> +					  &primeargs->handle);
> +}
> +
> +static int hantro_fb_create2(struct drm_device *dev, void *data,
> +			     struct drm_file *file_priv)
> +{
> +	struct drm_mode_fb_cmd2 *mode_cmd = (struct drm_mode_fb_cmd2 *)data;
> +	struct hantro_drm_fb *vsifb;
> +	struct drm_gem_object *objs[4];
> +	struct drm_gem_object *obj;
> +	const struct drm_format_info *info = drm_get_format_info(dev, mode_cmd);
> +	unsigned int hsub;
> +	unsigned int vsub;
> +	int num_planes;
> +	int ret;
> +	int i;
> +
> +	hsub = info->hsub;
> +	vsub = info->vsub;
> +	num_planes = min_t(int, info->num_planes, 4);
> +	for (i = 0; i < num_planes; i++) {
> +		unsigned int width = mode_cmd->width / (i ? hsub : 1);
> +		unsigned int height = mode_cmd->height / (i ? vsub : 1);
> +		unsigned int min_size;
> +
> +		obj = hantro_gem_object_lookup(dev, file_priv,
> +					       mode_cmd->handles[i]);
> +		if (!obj) {
> +			ret = -ENXIO;
> +			goto err_gem_object_unreference;
> +		}
> +		hantro_unref_drmobj(obj);
> +		min_size = (height - 1) * mode_cmd->pitches[i] +
> +			   mode_cmd->offsets[i] + width * info->cpp[i];
> +		if (obj->size < min_size) {
> +			ret = -EINVAL;
> +			goto err_gem_object_unreference;
> +		}
> +		objs[i] = obj;
> +	}
> +	vsifb = kzalloc(sizeof(*vsifb), GFP_KERNEL);
> +	if (!vsifb)
> +		return -ENOMEM;
> +	drm_helper_mode_fill_fb_struct(dev, &vsifb->fb, mode_cmd);
> +	for (i = 0; i < num_planes; i++)
> +		vsifb->obj[i] = objs[i];
> +	ret = drm_framebuffer_init(dev, &vsifb->fb, &hantro_drm_fb_funcs);
> +	if (ret)
> +		kfree(vsifb);
> +	return ret;
> +
> +err_gem_object_unreference:
> +	return ret;
> +}
> +
> +static int hantro_fb_create(struct drm_device *dev, void *data,
> +			    struct drm_file *file_priv)
> +{
> +	struct drm_mode_fb_cmd *or = data;
> +	struct drm_mode_fb_cmd2 r = {};
> +	int ret;
> +
> +	/* convert to new format and call new ioctl */
> +	r.fb_id = or->fb_id;
> +	r.width = or->width;
> +	r.height = or->height;
> +	r.pitches[0] = or->pitch;
> +	r.pixel_format = drm_mode_legacy_fb_format(or->bpp, or->depth);
> +	r.handles[0] = or->handle;
> +
> +	ret = hantro_fb_create2(dev, &r, file_priv);
> +	if (ret)
> +		return ret;
> +
> +	or->fb_id = r.fb_id;
> +
> +	return 0;
> +}
> +
> +static int hantro_get_version(struct drm_device *dev, void *data,
> +			      struct drm_file *file_priv)
> +{
> +	struct drm_version *pversion;
> +	char *sname = DRIVER_NAME;
> +	char *sdesc = DRIVER_DESC;
> +	char *sdate = DRIVER_DATE;
> +
> +	pversion = (struct drm_version *)data;
> +	pversion->version_major = dev->driver->major;
> +	pversion->version_minor = dev->driver->minor;
> +	pversion->version_patchlevel = 0;
> +	pversion->name_len = strlen(DRIVER_NAME);
> +	pversion->desc_len = strlen(DRIVER_DESC);
> +	pversion->date_len = strlen(DRIVER_DATE);
> +
> +	if (pversion->name)
> +		if (copy_to_user(pversion->name, sname, pversion->name_len))
> +			return -EFAULT;
> +	if (pversion->date)
> +		if (copy_to_user(pversion->date, sdate, pversion->date_len))
> +			return -EFAULT;
> +	if (pversion->desc)
> +		if (copy_to_user(pversion->desc, sdesc, pversion->desc_len))
> +			return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int hantro_get_cap(struct drm_device *dev, void *data,
> +			  struct drm_file *file_priv)
> +{
> +	struct drm_get_cap *req = (struct drm_get_cap *)data;
> +
> +	req->value = 0;
> +	switch (req->capability) {
> +	case DRM_CAP_PRIME:
> +		req->value |= dev->driver->prime_fd_to_handle ?
> +				      DRM_PRIME_CAP_IMPORT :
> +				      0;
> +		req->value |= dev->driver->prime_handle_to_fd ?
> +				      DRM_PRIME_CAP_EXPORT :
> +				      0;
> +		return 0;
> +	case DRM_CAP_DUMB_BUFFER:
> +		req->value = 1;
> +		break;
> +	case DRM_CAP_VBLANK_HIGH_CRTC:
> +		req->value = 1;
> +		break;
> +	case DRM_CAP_DUMB_PREFERRED_DEPTH:
> +		req->value = dev->mode_config.preferred_depth;
> +		break;
> +	case DRM_CAP_DUMB_PREFER_SHADOW:
> +		req->value = dev->mode_config.prefer_shadow;
> +		break;
> +	case DRM_CAP_ASYNC_PAGE_FLIP:
> +		req->value = dev->mode_config.async_page_flip;
> +		break;
> +	case DRM_CAP_CURSOR_WIDTH:
> +		if (dev->mode_config.cursor_width)
> +			req->value = dev->mode_config.cursor_width;
> +		else
> +			req->value = 64;
> +		break;
> +	case DRM_CAP_CURSOR_HEIGHT:
> +		if (dev->mode_config.cursor_height)
> +			req->value = dev->mode_config.cursor_height;
> +		else
> +			req->value = 64;
> +		break;
> +	case DRM_CAP_ADDFB2_MODIFIERS:
> +		req->value = dev->mode_config.allow_fb_modifiers;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hantro_test(struct drm_device *dev, void *data,
> +		       struct drm_file *file_priv)
> +{
> +	unsigned int *input = data;
> +	int handle = *input;
> +	struct drm_gem_object *obj;
> +	struct dma_fence *pfence;
> +	int ret = 10 * HZ; /* timeout */
> +
> +	obj = hantro_gem_object_lookup(dev, file_priv, handle);
> +	if (!obj)
> +		return -EINVAL;
> +
> +	pfence = dma_resv_get_excl(obj->dma_buf->resv);
> +	while (ret > 0)
> +		ret = schedule_timeout(ret);
> +	hantro_fence_signal(pfence);
> +	hantro_unref_drmobj(obj);
> +
> +	return 0;
> +}
> +
> +static int hantro_getprimeaddr(struct drm_device *dev, void *data,
> +			       struct drm_file *file_priv)
> +{
> +	unsigned long *input = data;
> +	int fd = *input;
> +	struct drm_gem_hantro_object *cma_obj;
> +	struct dma_buf *dma_buf;
> +
> +	dma_buf = dma_buf_get(fd);
> +	if (IS_ERR(dma_buf))
> +		return PTR_ERR(dma_buf);
> +	cma_obj = (struct drm_gem_hantro_object *)dma_buf->priv;
> +	*input = cma_obj->paddr;
> +	dma_buf_put(dma_buf);
> +
> +	return 0;
> +}
> +
> +static int hantro_ptr_to_phys(struct drm_device *dev, void *data,
> +			      struct drm_file *file_priv)
> +{
> +	unsigned long *arg = data;
> +	struct vm_area_struct *vma;
> +	struct drm_gem_hantro_object *cma_obj;
> +	unsigned long vaddr = *arg;
> +
> +	vma = find_vma(current->mm, vaddr);
> +	if (!vma)
> +		return -EFAULT;
> +
> +	cma_obj = (struct drm_gem_hantro_object *)vma->vm_private_data;
> +	if (!cma_obj)
> +		return -EFAULT;
> +	if (cma_obj->base.dev != dev)
> +		return -EFAULT;
> +	if (vaddr < vma->vm_start ||
> +	    vaddr >= vma->vm_start + (cma_obj->num_pages << PAGE_SHIFT))
> +		return -EFAULT;
> +
> +	*arg = (phys_addr_t)(vaddr - vma->vm_start) + cma_obj->paddr;
> +
> +	return 0;
> +}
> +
> +static int hantro_getmagic(struct drm_device *dev, void *data,
> +			   struct drm_file *file_priv)
> +{
> +	struct drm_auth *auth = data;
> +	int ret = 0;
> +
> +	mutex_lock(&dev->struct_mutex);
> +	if (!file_priv->magic) {
> +		ret = idr_alloc(&file_priv->master->magic_map, file_priv, 1, 0,
> +				GFP_KERNEL);
> +		if (ret >= 0)
> +			file_priv->magic = ret;
> +	}
> +	auth->magic = file_priv->magic;
> +	mutex_unlock(&dev->struct_mutex);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int hantro_authmagic(struct drm_device *dev, void *data,
> +			    struct drm_file *file_priv)
> +{
> +	struct drm_auth *auth = data;
> +	struct drm_file *file;
> +
> +	mutex_lock(&dev->struct_mutex);
> +	file = idr_find(&file_priv->master->magic_map, auth->magic);
> +	if (file) {
> +		file->authenticated = 1;
> +		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
> +	}
> +	mutex_unlock(&dev->struct_mutex);
> +
> +	return file ? 0 : -EINVAL;
> +}
> +
> +#define DRM_IOCTL_DEF(ioctl, _func, _flags)                                    \
> +	[DRM_IOCTL_NR(ioctl)] = {                                              \
> +		.cmd = ioctl, .func = _func, .flags = _flags, .name = #ioctl   \
> +	}
> +
> +#define DRM_CONTROL_ALLOW 0
> +/* Ioctl table */
> +static const struct drm_ioctl_desc hantro_ioctls[] = {
> +	DRM_IOCTL_DEF(DRM_IOCTL_VERSION, hantro_get_version,
> +		      DRM_UNLOCKED | DRM_RENDER_ALLOW | DRM_CONTROL_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_invalid_op, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, hantro_getmagic, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_invalid_op,
> +		      DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_invalid_op, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_CLIENT, drm_invalid_op, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_STATS, drm_invalid_op, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_CAP, hantro_get_cap,
> +		      DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_CLIENT_CAP, drm_invalid_op, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_VERSION, drm_invalid_op,
> +		      DRM_UNLOCKED | DRM_MASTER),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_UNIQUE, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_BLOCK, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_UNBLOCK, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AUTH_MAGIC, hantro_authmagic,
> +		      DRM_AUTH | DRM_UNLOCKED | DRM_MASTER),
> +	DRM_IOCTL_DEF(DRM_IOCTL_ADD_MAP, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_RM_MAP, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_invalid_op,
> +		      DRM_UNLOCKED | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_invalid_op,
> +		      DRM_UNLOCKED | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_invalid_op,
> +		      DRM_AUTH | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MOD_CTX, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GET_CTX, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SWITCH_CTX, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_NEW_CTX, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_RES_CTX, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_ADD_DRAW, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_RM_DRAW, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_LOCK, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_UNLOCK, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_FINISH, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_ADD_BUFS, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MARK_BUFS, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_INFO_BUFS, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MAP_BUFS, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_FREE_BUFS, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_DMA, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_CONTROL, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +#if IS_ENABLED(CONFIG_AGP)
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_ACQUIRE, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_RELEASE, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_ENABLE, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_INFO, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_ALLOC, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_FREE, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_BIND, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_AGP_UNBIND, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +#endif
> +	DRM_IOCTL_DEF(DRM_IOCTL_SG_ALLOC, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SG_FREE, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_invalid_op, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODESET_CTL, drm_invalid_op, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_UPDATE_DRAW, drm_invalid_op,
> +		      DRM_AUTH | DRM_MASTER | DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, hantro_gem_close,
> +		      DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, hantro_gem_flink,
> +		      DRM_AUTH | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, hantro_gem_open,
> +		      DRM_AUTH | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, hantro_handle_to_fd,
> +		      DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, hantro_fd_to_handle,
> +		      DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANE, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETPLANE, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CURSOR, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETGAMMA, drm_invalid_op, DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETGAMMA, drm_invalid_op,
> +		      DRM_MASTER | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETENCODER, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCONNECTOR, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ATTACHMODE, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DETACHMODE, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPROPERTY, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETPROPERTY, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPROPBLOB, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETFB, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB, hantro_fb_create,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB2, hantro_fb_create2,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_RMFB, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_PAGE_FLIP, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DIRTYFB, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_DUMB, hantro_gem_dumb_create,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_MAP_DUMB, hantro_map_dumb,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DESTROY_DUMB, hantro_destroy_dumb,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_OBJ_GETPROPERTIES, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_OBJ_SETPROPERTY, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CURSOR2, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ATOMIC, drm_invalid_op,
> +		      DRM_MASTER | DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATEPROPBLOB, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DESTROYPROPBLOB, drm_invalid_op,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +
> +	/* hantro specific ioctls */
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_TESTCMD, hantro_test,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_GETPADDR, hantro_map_vaddr,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_TESTREADY, hantro_testbufvalid,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_SETDOMAIN, hantro_setdomain,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_ACQUIREBUF, hantro_acquirebuf,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_RELEASEBUF, hantro_releasebuf,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_GETPRIMEADDR, hantro_getprimeaddr,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +	DRM_IOCTL_DEF(DRM_IOCTL_HANTRO_PTR_PHYADDR, hantro_ptr_to_phys,
> +		      DRM_CONTROL_ALLOW | DRM_UNLOCKED),
> +};
> +
> +#if DRM_CONTROL_ALLOW == 0
> +#undef DRM_CONTROL_ALLOW
> +#endif
> +
> +#define HANTRO_IOCTL_COUNT ARRAY_SIZE(hantro_ioctls)
> +static long hantro_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +	struct drm_file *file_priv = filp->private_data;
> +	struct drm_device *dev = hantro_dev.drm_dev;
> +	const struct drm_ioctl_desc *ioctl = NULL;
> +	drm_ioctl_t *func;
> +	unsigned int nr = DRM_IOCTL_NR(cmd);
> +	int retcode = 0;
> +	char stack_kdata[128];
> +	char *kdata = stack_kdata;
> +	unsigned int in_size, out_size;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	out_size = _IOC_SIZE(cmd);
> +	in_size = _IOC_SIZE(cmd);
> +
> +	if (in_size > 0) {
> +		if (_IOC_DIR(cmd) & _IOC_READ)
> +			retcode = !hantro_access_ok(VERIFY_WRITE, (void *)arg,
> +						    in_size);
> +		else if (_IOC_DIR(cmd) & _IOC_WRITE)
> +			retcode = !hantro_access_ok(VERIFY_READ, (void *)arg,
> +						    in_size);
> +		if (retcode)
> +			return -EFAULT;
> +	}
> +	if (nr >= DRM_IOCTL_NR(HX280ENC_IOC_START) &&
> +	    nr <= DRM_IOCTL_NR(HX280ENC_IOC_END)) {
> +		return hantroenc_ioctl(filp, cmd, arg);
> +	}
> +	if (nr >= DRM_IOCTL_NR(HANTRODEC_IOC_START) &&
> +	    nr <= DRM_IOCTL_NR(HANTRODEC_IOC_END)) {
> +		return hantrodec_ioctl(filp, cmd, arg);
> +	}
> +
> +	if (nr >= HANTRO_IOCTL_COUNT)
> +		return -EINVAL;
> +	ioctl = &hantro_ioctls[nr];
> +
> +	if (copy_from_user(kdata, (void __user *)arg, in_size) != 0)
> +		return -EFAULT;
> +
> +	if (cmd == DRM_IOCTL_MODE_SETCRTC ||
> +	    cmd == DRM_IOCTL_MODE_GETRESOURCES ||
> +	    cmd == DRM_IOCTL_SET_CLIENT_CAP || cmd == DRM_IOCTL_MODE_GETCRTC ||
> +	    cmd == DRM_IOCTL_MODE_GETENCODER ||
> +	    cmd == DRM_IOCTL_MODE_GETCONNECTOR || cmd == DRM_IOCTL_MODE_GETFB) {
> +		retcode = drm_ioctl(filp, cmd, arg);
> +		return retcode;
> +	}
> +	func = ioctl->func;
> +	if (!func)
> +		return -EINVAL;
> +	retcode = func(dev, kdata, file_priv);
> +
> +	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
> +		retcode = -EFAULT;
> +
> +	return retcode;
> +}
> +
> +/* VFS methods */
> +static const struct file_operations hantro_fops = {
> +	.owner = THIS_MODULE,
> +	.open = hantro_device_open,
> +	.mmap = hantro_mmap,
> +	.release = hantro_device_release,
> +	.poll = drm_poll,
> +	.read = drm_read,
> +	.unlocked_ioctl = hantro_ioctl, //drm_ioctl,
> +	.compat_ioctl = drm_compat_ioctl,
> +};
> +
> +void hantro_gem_vm_close(struct vm_area_struct *vma)
> +{
> +	struct drm_gem_hantro_object *obj =
> +		(struct drm_gem_hantro_object *)vma->vm_private_data;
> +	/* unmap callback */
> +
> +	if (obj->pages) {
> +		int i;
> +
> +		for (i = 0; i < obj->num_pages; i++)
> +			unref_page(obj->pages[i]);
> +
> +		kfree(obj->pages);
> +		obj->pages = NULL;
> +	}
> +	drm_gem_vm_close(vma);
> +}
> +
> +static void hantro_release(struct drm_device *dev)
> +{
> +}
> +
> +static void hantro_gem_dmabuf_release(struct dma_buf *dma_buf)
> +{
> +	return drm_gem_dmabuf_release(dma_buf);
> +}
> +
> +static int hantro_gem_map_attach(struct dma_buf *dma_buf,
> +				 struct dma_buf_attachment *attach)
> +{
> +	int ret;
> +	struct drm_gem_hantro_object *cma_obj =
> +		(struct drm_gem_hantro_object *)dma_buf->priv;
> +
> +	ret = drm_gem_map_attach(dma_buf, attach);
> +	if (ret == 0)
> +		cma_obj->flag |= HANTRO_GEM_FLAG_EXPORTUSED;
> +
> +	return ret;
> +}
> +
> +static void hantro_gem_map_detach(struct dma_buf *dma_buf,
> +				  struct dma_buf_attachment *attach)
> +{
> +	drm_gem_map_detach(dma_buf, attach);
> +}
> +
> +static struct sg_table *
> +hantro_gem_map_dma_buf(struct dma_buf_attachment *attach,
> +		       enum dma_data_direction dir)
> +{
> +	return drm_gem_map_dma_buf(attach, dir);
> +}
> +
> +static int hantro_gem_dmabuf_mmap(struct dma_buf *dma_buf,
> +				  struct vm_area_struct *vma)
> +{
> +	return drm_gem_dmabuf_mmap(dma_buf, vma);
> +}
> +
> +static void *hantro_gem_dmabuf_vmap(struct dma_buf *dma_buf)
> +{
> +	return drm_gem_dmabuf_vmap(dma_buf);
> +}
> +
> +static const struct dma_buf_ops hantro_dmabuf_ops = {
> +	.attach = hantro_gem_map_attach,
> +	.detach = hantro_gem_map_detach,
> +	.map_dma_buf = hantro_gem_map_dma_buf,
> +	.unmap_dma_buf = drm_gem_unmap_dma_buf,
> +	.release = hantro_gem_dmabuf_release,
> +	.mmap = hantro_gem_dmabuf_mmap,
> +	.vmap = hantro_gem_dmabuf_vmap,
> +	.vunmap = drm_gem_dmabuf_vunmap,
> +};
> +
> +static struct drm_driver hantro_drm_driver;
> +static struct dma_buf *hantro_prime_export(struct drm_gem_object *obj,
> +					   int flags)
> +{
> +	struct drm_gem_hantro_object *cma_obj;
> +	struct dma_buf_export_info exp_info = {
> +		.exp_name = KBUILD_MODNAME,
> +		.owner = obj->dev->driver->fops->owner,
> +		.ops = &hantro_dmabuf_ops,
> +		.flags = flags,
> +		.priv = obj,
> +	};
> +
> +	cma_obj = to_drm_gem_hantro_obj(obj);
> +	exp_info.resv = &cma_obj->kresv;
> +	exp_info.size = cma_obj->num_pages << PAGE_SHIFT;
> +
> +	return drm_gem_dmabuf_export(obj->dev, &exp_info);
> +}
> +
> +static void hantro_close_object(struct drm_gem_object *obj,
> +				struct drm_file *file_priv)
> +{
> +	struct drm_gem_hantro_object *cma_obj;
> +
> +	cma_obj = to_drm_gem_hantro_obj(obj);
> +	if (obj->dma_buf && (cma_obj->flag & HANTRO_GEM_FLAG_EXPORTUSED))
> +		dma_buf_put(obj->dma_buf);
> +}
> +
> +static int hantro_gem_prime_handle_to_fd(struct drm_device *dev,
> +					 struct drm_file *filp, u32 handle,
> +					 u32 flags, int *prime_fd)
> +{
> +	return drm_gem_prime_handle_to_fd(dev, filp, handle, flags, prime_fd);
> +}
> +
> +static const struct vm_operations_struct hantro_drm_gem_cma_vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = hantro_gem_vm_close,
> +	.fault = hantro_vm_fault,
> +};
> +
> +static struct drm_driver hantro_drm_driver = {
> +	//these two are related with controlD and renderD
> +	.driver_features = DRIVER_GEM | DRIVER_RENDER,
> +	.get_vblank_counter = hantro_vblank_no_hw_counter,
> +	.open = hantro_drm_open,
> +	.postclose = hantro_drm_postclose,
> +	.release = hantro_release,
> +	.dumb_destroy = drm_gem_dumb_destroy,
> +	.dumb_create = hantro_gem_dumb_create_internal,
> +	.dumb_map_offset = hantro_gem_dumb_map_offset,
> +	.gem_open_object = hantro_gem_open_obj,
> +	.gem_close_object = hantro_close_object,
> +	.gem_prime_export = hantro_prime_export,
> +	.gem_prime_import = hantro_drm_gem_prime_import,
> +	.prime_handle_to_fd = hantro_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +	.gem_prime_import_sg_table = hantro_gem_prime_import_sg_table,
> +	.gem_prime_get_sg_table = hantro_gem_prime_get_sg_table,
> +	.gem_prime_vmap = hantro_gem_prime_vmap,
> +	.gem_prime_vunmap = hantro_gem_prime_vunmap,
> +	.gem_prime_mmap = hantro_gem_prime_mmap,
> +	.gem_free_object_unlocked = hantro_gem_free_object,
> +	.gem_vm_ops = &hantro_drm_gem_cma_vm_ops,
> +	.fops = &hantro_fops,
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +};
> +
> +static ssize_t bandwidth_dec_read_show(struct device *kdev,
> +				       struct device_attribute *attr, char *buf)
> +{
> +	/*
> +	 *  sys/bus/platform/drivers/hantro/xxxxx.vpu/bandwidth_dec_read
> +	 *  Used to show bandwidth info to user space.
> +	 *  Real data should be read from HW registers
> +	 *  This file is read only.
> +	 */
> +	u32 bandwidth = hantrodec_readbandwidth(1);
> +
> +	return snprintf(buf, PAGE_SIZE, "%u\n", bandwidth);
> +}
> +
> +static ssize_t bandwidth_dec_write_show(struct device *kdev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	u32 bandwidth = hantrodec_readbandwidth(0);
> +
> +	return snprintf(buf, PAGE_SIZE, "%u\n", bandwidth);
> +}
> +
> +static ssize_t bandwidth_enc_read_show(struct device *kdev,
> +				       struct device_attribute *attr, char *buf)
> +{
> +	u32 bandwidth = hantroenc_readbandwidth(1);
> +
> +	return snprintf(buf, PAGE_SIZE, "%u\n", bandwidth);
> +}
> +
> +static ssize_t bandwidth_enc_write_show(struct device *kdev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	u32 bandwidth = hantroenc_readbandwidth(0);
> +
> +	return snprintf(buf, PAGE_SIZE, "%u\n", bandwidth);
> +}
> +
> +static DEVICE_ATTR(bandwidth_dec_read, 0444, bandwidth_dec_read_show, NULL);
> +static DEVICE_ATTR(bandwidth_dec_write, 0444, bandwidth_dec_write_show, NULL);
> +static DEVICE_ATTR(bandwidth_enc_read, 0444, bandwidth_enc_read_show, NULL);
> +static DEVICE_ATTR(bandwidth_enc_write, 0444, bandwidth_enc_write_show, NULL);
> +
> +static int hantro_create_sysfs_api(struct device *dev)
> +{
> +	int result;
> +
> +	result = device_create_file(dev, &dev_attr_bandwidth_dec_read);
> +	if (result != 0)
> +		return result;
> +
> +	result = device_create_file(dev, &dev_attr_bandwidth_dec_write);
> +	if (result != 0) {
> +		device_remove_file(dev, &dev_attr_bandwidth_dec_read);
> +		return result;
> +	}
> +
> +	result = device_create_file(dev, &dev_attr_bandwidth_enc_read);
> +	if (result != 0) {
> +		device_remove_file(dev, &dev_attr_bandwidth_dec_read);
> +		device_remove_file(dev, &dev_attr_bandwidth_dec_write);
> +		return result;
> +	}
> +
> +	result = device_create_file(dev, &dev_attr_bandwidth_enc_write);
> +	if (result != 0) {
> +		device_remove_file(dev, &dev_attr_bandwidth_dec_read);
> +		device_remove_file(dev, &dev_attr_bandwidth_dec_write);
> +		device_remove_file(dev, &dev_attr_bandwidth_enc_read);
> +		return result;
> +	}
> +
> +	return 0;
> +}
> +
> +static int init_hantro_rsvd_mem(struct device *dev, struct hantro_mem *mem,
> +				const char *mem_name, unsigned int mem_idx)
> +{
> +	struct device *mem_dev;
> +	dma_addr_t dma_handle;
> +	int rc;
> +	size_t mem_size;
> +	void *vaddr;
> +
> +	/* Create a child device (of dev) to own the reserved memory. */
> +	mem_dev =
> +		devm_kzalloc(dev, sizeof(struct device), GFP_KERNEL | GFP_DMA);
> +	if (!mem_dev)
> +		return -ENOMEM;
> +
> +	device_initialize(mem_dev);
> +	dev_set_name(mem_dev, "%s:%s", dev_name(dev), mem_name);
> +	mem_dev->parent = dev;
> +	mem_dev->dma_mask = dev->dma_mask;
> +	mem_dev->coherent_dma_mask = dev->coherent_dma_mask;
> +
> +	/* Set up DMA configuration using information from parent's DT node. */
> +	rc = of_dma_configure(mem_dev, dev->of_node, true);
> +	mem_dev->release = of_reserved_mem_device_release;
> +
> +	rc = device_add(mem_dev);
> +	if (rc)
> +		goto err;
> +	/* Initialized the device reserved memory region. */
> +	rc = of_reserved_mem_device_init_by_idx(mem_dev, dev->of_node, mem_idx);
> +	if (rc) {
> +		dev_err(dev, "Couldn't get reserved memory with idx = %d, %d\n",
> +			mem_idx, rc);
> +		device_del(mem_dev);
> +		goto err;
> +	} else {
> +		dev_info(dev, "Success get reserved memory with idx = %d, %d\n",
> +			 mem_idx, rc);
> +	}
> +
> +	dma_handle -= dev->dma_pfn_offset << PAGE_SHIFT;
> +
> +	mem->dev = mem_dev;
> +	mem->vaddr = vaddr;
> +	mem->dma_handle = dma_handle;
> +	mem->size = mem_size;
> +
> +	return 0;
> +err:
> +	put_device(mem_dev);
> +	return rc;
> +}
> +
> +static int hantro_drm_probe(struct platform_device *pdev)
> +{
> +	int result;
> +	struct device *dev = &pdev->dev;
> +
> +	if (!hantro_dev.platformdev)
> +		hantro_dev.platformdev = pdev;
> +
> +	/* try to attach rsv mem to dtb node */
> +	result = init_hantro_rsvd_mem(dev, &ddr1, "ddr1", 0);
> +	if (result) {
> +		dev_err(dev, "Failed to set up DDR1 reserved memory.\n");
> +		return result;
> +	}
> +
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	dma_set_mask_and_coherent(ddr1.dev, DMA_BIT_MASK(64));
> +
> +	dev_info(dev, "ddr1 vaddr 0x%p paddr 0x%pad size 0x%zX\n", ddr1.vaddr,
> +		 &ddr1.dma_handle, ddr1.size);
> +
> +	result = hantro_create_sysfs_api(dev);
> +	if (result != 0)
> +		pr_info("create sysfs fail");
> +
> +	/* check if pdev equals hantro_dev.platformdev */
> +	result = hantrodec_init(pdev);
> +	if (result != 0)
> +		return result;
> +	result = hantroenc_init(pdev);
> +	if (result != 0)
> +		return result;
> +
> +	return 0;
> +}
> +
> +static int hantro_drm_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	device_remove_file(dev, &dev_attr_bandwidth_dec_read);
> +	device_remove_file(dev, &dev_attr_bandwidth_dec_write);
> +	device_remove_file(dev, &dev_attr_bandwidth_enc_read);
> +	device_remove_file(dev, &dev_attr_bandwidth_enc_write);
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id hantro_drm_platform_ids[] = {
> +	{
> +		.name = "hantro",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(platform, hantro_drm_platform_ids);
> +
> +static const struct of_device_id hantro_of_match[] = {
> +	/* to match dtb, else reg io will fail */
> +	{
> +		.compatible = "intel,hantro",
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static int hantro_pm_suspend(struct device *kdev)
> +{
> +	return 0;
> +}
> +
> +static int hantro_pm_resume(struct device *kdev)
> +{
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops hantro_pm_ops = {
> +	.suspend = hantro_pm_suspend,
> +	.resume = hantro_pm_resume,
> +};
> +
> +static struct platform_driver hantro_drm_platform_driver = {
> +	.probe = hantro_drm_probe,
> +	.remove = hantro_drm_remove,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.owner = THIS_MODULE,
> +		.of_match_table = hantro_of_match,
> +		.pm = &hantro_pm_ops,
> +	},
> +	.id_table = hantro_drm_platform_ids,
> +};
> +
> +static const struct platform_device_info hantro_platform_info = {
> +	.name = DRIVER_NAME,
> +	.id = -1,
> +	.dma_mask = DMA_BIT_MASK(64),
> +};
> +
> +static int hantro_major = 1; /* dynamic */
> +void __exit hantro_cleanup(void)
> +{
> +	device_unregister(ddr1.dev);
> +	hantrodec_cleanup();
> +	hantroenc_cleanup();
> +	release_fence_data();
> +	unregister_chrdev(hantro_major, "hantro");
> +	drm_dev_unregister(hantro_dev.drm_dev);
> +	drm_dev_put(hantro_dev.drm_dev);
> +	platform_device_unregister(hantro_dev.platformdev);
> +	platform_driver_unregister(&hantro_drm_platform_driver);
> +}
> +
> +int __init hantro_init(void)
> +{
> +	int result;
> +
> +	hantro_dev.platformdev = NULL;
> +	result = platform_driver_register(&hantro_drm_platform_driver);
> +	if (result < 0)
> +		return result;
> +
> +	if (!hantro_dev.platformdev) {
> +		pr_info("hantro create platform device fail");
> +		return -1;
> +	}
> +
> +	hantro_dev.drm_dev =
> +		drm_dev_alloc(&hantro_drm_driver, &hantro_dev.platformdev->dev);
> +	if (IS_ERR(hantro_dev.drm_dev)) {
> +		pr_info("init drm failed\n");
> +		platform_driver_unregister(&hantro_drm_platform_driver);
> +		return PTR_ERR(hantro_dev.drm_dev);
> +	}
> +
> +	hantro_dev.drm_dev->dev = &hantro_dev.platformdev->dev;
> +	pr_info("hantro device created");
> +
> +	drm_mode_config_init(hantro_dev.drm_dev);
> +	result = drm_dev_register(hantro_dev.drm_dev, 0);
> +	if (result < 0) {
> +		drm_dev_unregister(hantro_dev.drm_dev);
> +		drm_dev_put(hantro_dev.drm_dev);
> +		platform_driver_unregister(&hantro_drm_platform_driver);
> +	} else {
> +		init_fence_data();
> +	}
> +
> +	return result;
> +}
> +
> +module_init(hantro_init);
> +module_exit(hantro_cleanup);
> +
> +/* module description */
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Verisilicon");
> +MODULE_DESCRIPTION("Hantro DRM manager");
> diff --git a/drivers/gpu/drm/hantro/hantro_drm.h b/drivers/gpu/drm/hantro/hantro_drm.h
> new file mode 100644
> index 0000000..13b6f14
> --- /dev/null
> +++ b/drivers/gpu/drm/hantro/hantro_drm.h
> @@ -0,0 +1,208 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *    Hantro driver public header file.
> + *
> + *    Copyright (c) 2017 - 2020, VeriSilicon Inc.
> + *    Copyright (c) 2020 Intel Corporation
> + */
> +
> +#ifndef HANTRO_H
> +#define HANTRO_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/dma-resv.h>
> +#include <linux/dma-mapping.h>
> +#include <drm/drm_vma_manager.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem.h>
> +#include <linux/dma-buf.h>
> +#include <drm/drm.h>
> +#include <drm/drm_auth.h>
> +#include <drm/drm.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
> +#include <linux/version.h>
> +#include <linux/dma-fence.h>
> +#include <linux/platform_device.h>
> +
> +/* basic driver definitions */
> +#define DRIVER_NAME     "hantro"
> +#define DRIVER_DESC     "hantro DRM"
> +#define DRIVER_DATE     "20201008"
> +#define DRIVER_MAJOR    1
> +#define DRIVER_MINOR    0
> +
> +/* these domain definitions are identical to hantro_bufmgr.h */
> +#define HANTRO_DOMAIN_NONE		0x00000
> +#define HANTRO_CPU_DOMAIN		0x00001
> +#define HANTRO_HEVC264_DOMAIN		0x00002
> +#define HANTRO_JPEG_DOMAIN		0x00004
> +#define HANTRO_DECODER0_DOMAIN		0x00008
> +#define HANTRO_DECODER1_DOMAIN		0x00010
> +#define HANTRO_DECODER2_DOMAIN		0x00020
> +#define HANTRO_GEM_FLAG_IMPORT		BIT(0)
> +#define HANTRO_GEM_FLAG_EXPORT		BIT(1)
> +#define HANTRO_GEM_FLAG_EXPORTUSED	BIT(2)
> +#define HANTRO_FENCE_WRITE 1
> +
> +/* dynamic ddr allocation defines */
> +#define DDR0_CHANNEL			0
> +#define DDR1_CHANNEL			1
> +
> +struct hantro_mem {
> +	struct device *dev;	/* Child device managing the memory region. */
> +	void *vaddr;		/* The virtual address of the memory region. */
> +	dma_addr_t dma_handle;	/* The address of the memory region. */
> +	size_t size;		/* The size of the memory region. */
> +};
> +
> +struct hantro_drm_fb {
> +	struct drm_framebuffer fb;
> +	struct drm_gem_object *obj[4];
> +};
> +
> +struct drm_gem_hantro_object {
> +	struct drm_gem_object base;
> +	dma_addr_t paddr;
> +	struct sg_table *sgt;
> +	/* For objects with DMA memory allocated by GEM CMA */
> +	void *vaddr;
> +	struct page *pageaddr;
> +	struct page **pages;
> +	unsigned long num_pages;
> +	/* fence ref */
> +	struct dma_resv kresv;
> +	unsigned int ctxno;
> +	int handle;
> +	int flag;
> +	int ddr_channel;
> +};
> +
> +struct hantro_fencecheck {
> +	unsigned int handle;
> +	int ready;
> +};
> +
> +struct hantro_domainset {
> +	unsigned int handle;
> +	unsigned int writedomain;
> +	unsigned int readdomain;
> +};
> +
> +struct hantro_addrmap {
> +	unsigned int handle;
> +	unsigned long vm_addr;
> +	unsigned long phy_addr;
> +};
> +
> +struct hantro_regtransfer {
> +	unsigned long coreid;
> +	unsigned long offset;
> +	unsigned long size;
> +	const void *data;
> +	int benc; /* encoder core or decoder core */
> +	int direction; /* 0=read, 1=write */
> +};
> +
> +struct hantro_corenum {
> +	unsigned int deccore;
> +	unsigned int enccore;
> +};
> +
> +struct hantro_acquirebuf {
> +	unsigned long handle;
> +	unsigned long flags;
> +	unsigned long timeout;
> +	unsigned long fence_handle;
> +};
> +
> +struct hantro_releasebuf {
> +	unsigned long fence_handle;
> +};
> +
> +struct core_desc {
> +	__u32 id;	/* id of the core */
> +	__u32 *regs;	/* pointer to user registers */
> +	__u32 size;	/* size of register space */
> +	__u32 reg_id;
> +};
> +
> +/* Ioctl definitions */
> +/*hantro drm */
> +#define HANTRO_IOCTL_START (DRM_COMMAND_BASE)
> +#define DRM_IOCTL_HANTRO_TESTCMD DRM_IOWR(HANTRO_IOCTL_START, unsigned int)
> +#define DRM_IOCTL_HANTRO_GETPADDR                                              \
> +	DRM_IOWR(HANTRO_IOCTL_START + 1, struct hantro_addrmap)
> +#define DRM_IOCTL_HANTRO_TESTREADY                                             \
> +	DRM_IOWR(HANTRO_IOCTL_START + 3, struct hantro_fencecheck)
> +#define DRM_IOCTL_HANTRO_SETDOMAIN                                             \
> +	DRM_IOWR(HANTRO_IOCTL_START + 4, struct hantro_domainset)
> +#define DRM_IOCTL_HANTRO_ACQUIREBUF                                            \
> +	DRM_IOWR(HANTRO_IOCTL_START + 6, struct hantro_acquirebuf)
> +#define DRM_IOCTL_HANTRO_RELEASEBUF                                            \
> +	DRM_IOWR(HANTRO_IOCTL_START + 7, struct hantro_releasebuf)
> +#define DRM_IOCTL_HANTRO_GETPRIMEADDR                                          \
> +	DRM_IOWR(HANTRO_IOCTL_START + 8, unsigned long *)
> +#define DRM_IOCTL_HANTRO_PTR_PHYADDR                                           \
> +	DRM_IOWR(HANTRO_IOCTL_START + 9, unsigned long *)
> +
> +/* hantro enc */
> +#define HX280ENC_IOC_START DRM_IO(HANTRO_IOCTL_START + 16)
> +#define HX280ENC_IOCGHWOFFSET DRM_IOR(HANTRO_IOCTL_START + 17, unsigned long *)
> +#define HX280ENC_IOCGHWIOSIZE DRM_IOWR(HANTRO_IOCTL_START + 18, unsigned long *)
> +#define HX280ENC_IOC_CLI DRM_IO(HANTRO_IOCTL_START + 19)
> +#define HX280ENC_IOC_STI DRM_IO(HANTRO_IOCTL_START + 20)
> +#define HX280ENC_IOCHARDRESET                                                  \
> +	DRM_IO(HANTRO_IOCTL_START + 21) /* debugging tool */
> +#define HX280ENC_IOCGSRAMOFFSET                                                \
> +	DRM_IOR(HANTRO_IOCTL_START + 22, unsigned long *)
> +#define HX280ENC_IOCGSRAMEIOSIZE                                               \
> +	DRM_IOR(HANTRO_IOCTL_START + 23, unsigned int *)
> +#define HX280ENC_IOCH_ENC_RESERVE                                              \
> +	DRM_IOR(HANTRO_IOCTL_START + 24, unsigned int *)
> +#define HX280ENC_IOCH_ENC_RELEASE                                              \
> +	DRM_IOR(HANTRO_IOCTL_START + 25, unsigned int *)
> +#define HX280ENC_IOCG_CORE_NUM DRM_IOR(HANTRO_IOCTL_START + 26, unsigned int *)
> +#define HX280ENC_IOCG_CORE_WAIT DRM_IOR(HANTRO_IOCTL_START + 27, unsigned int *)
> +#define HX280ENC_IOC_END DRM_IO(HANTRO_IOCTL_START + 39)
> +
> +/* hantro dec */
> +#define HANTRODEC_IOC_START DRM_IO(HANTRO_IOCTL_START + 40)
> +#define HANTRODEC_PP_INSTANCE DRM_IO(HANTRO_IOCTL_START + 41)
> +#define HANTRODEC_HW_PERFORMANCE DRM_IO(HANTRO_IOCTL_START + 42)
> +#define HANTRODEC_IOCGHWOFFSET DRM_IOR(HANTRO_IOCTL_START + 43, unsigned long *)
> +#define HANTRODEC_IOCGHWIOSIZE DRM_IOR(HANTRO_IOCTL_START + 44, unsigned int *)
> +#define HANTRODEC_IOC_CLI DRM_IO(HANTRO_IOCTL_START + 45)
> +#define HANTRODEC_IOC_STI DRM_IO(HANTRO_IOCTL_START + 46)
> +#define HANTRODEC_IOC_MC_OFFSETS                                               \
> +	DRM_IOR(HANTRO_IOCTL_START + 47, unsigned long *)
> +#define HANTRODEC_IOC_MC_CORES DRM_IOR(HANTRO_IOCTL_START + 48, unsigned int *)
> +#define HANTRODEC_IOCS_DEC_PUSH_REG                                            \
> +	DRM_IOW(HANTRO_IOCTL_START + 49, struct core_desc *)
> +#define HANTRODEC_IOCS_PP_PUSH_REG                                             \
> +	DRM_IOW(HANTRO_IOCTL_START + 50, struct core_desc *)
> +#define HANTRODEC_IOCH_DEC_RESERVE DRM_IO(HANTRO_IOCTL_START + 51)
> +#define HANTRODEC_IOCT_DEC_RELEASE DRM_IO(HANTRO_IOCTL_START + 52)
> +#define HANTRODEC_IOCQ_PP_RESERVE DRM_IO(HANTRO_IOCTL_START + 53)
> +#define HANTRODEC_IOCT_PP_RELEASE DRM_IO(HANTRO_IOCTL_START + 54)
> +#define HANTRODEC_IOCX_DEC_WAIT                                                \
> +	DRM_IOWR(HANTRO_IOCTL_START + 55, struct core_desc *)
> +#define HANTRODEC_IOCX_PP_WAIT                                                 \
> +	DRM_IOWR(HANTRO_IOCTL_START + 56, struct core_desc *)
> +#define HANTRODEC_IOCS_DEC_PULL_REG                                            \
> +	DRM_IOWR(HANTRO_IOCTL_START + 57, struct core_desc *)
> +#define HANTRODEC_IOCS_PP_PULL_REG                                             \
> +	DRM_IOWR(HANTRO_IOCTL_START + 58, struct core_desc *)
> +#define HANTRODEC_IOCG_CORE_WAIT DRM_IOR(HANTRO_IOCTL_START + 59, int *)
> +#define HANTRODEC_IOX_ASIC_ID DRM_IOR(HANTRO_IOCTL_START + 60, __u32 *)
> +#define HANTRODEC_IOCG_CORE_ID DRM_IO(HANTRO_IOCTL_START + 61)
> +#define HANTRODEC_IOCS_DEC_WRITE_REG                                           \
> +	DRM_IOW(HANTRO_IOCTL_START + 62, struct core_desc *)
> +#define HANTRODEC_IOCS_DEC_READ_REG                                            \
> +	DRM_IOWR(HANTRO_IOCTL_START + 63, struct core_desc *)
> +#define HANTRODEC_DEBUG_STATUS DRM_IO(HANTRO_IOCTL_START + 64)
> +#define HANTRODEC_IOX_ASIC_BUILD_ID DRM_IOR(HANTRO_IOCTL_START + 65, __u32 *)
> +#define HANTRODEC_IOC_END DRM_IO(HANTRO_IOCTL_START + 80)
> +
> +#endif /* HANTRO_H */
> diff --git a/drivers/gpu/drm/hantro/hantro_fence.c b/drivers/gpu/drm/hantro/hantro_fence.c
> new file mode 100644
> index 0000000..e009ba9
> --- /dev/null
> +++ b/drivers/gpu/drm/hantro/hantro_fence.c
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *    Hantro driver DMA_BUF fence operation.
> + *
> + *    Copyright (c) 2017 - 2020, VeriSilicon Inc.
> + *    Copyright (c) 2020 Intel Corporation
> + */
> +
> +#include "hantro_priv.h"
> +
> +static unsigned long seqno;
> +DEFINE_IDR(fence_idr);
> +/* fence mutex struct */
> +struct mutex fence_mutex;
> +
> +static const char *hantro_fence_get_driver_name(struct dma_fence *fence)
> +{
> +	return "hantro";
> +}
> +
> +static const char *hantro_fence_get_timeline_name(struct dma_fence *fence)
> +{
> +	return " ";
> +}
> +
> +static bool hantro_fence_enable_signaling(struct dma_fence *fence)
> +{
> +	if (test_bit(HANTRO_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static bool hantro_fence_signaled(struct dma_fence *fobj)
> +{
> +	unsigned long irqflags;
> +	bool ret;
> +
> +	spin_lock_irqsave(fobj->lock, irqflags);
> +	ret = (test_bit(HANTRO_FENCE_FLAG_SIGNAL_BIT, &fobj->flags) != 0);
> +	spin_unlock_irqrestore(fobj->lock, irqflags);
> +
> +	return ret;
> +}
> +
> +static void hantro_fence_free(struct dma_fence *fence)
> +{
> +	kfree(fence->lock);
> +	fence->lock = NULL;
> +	dma_fence_free(fence);
> +}
> +
> +const static struct dma_fence_ops hantro_fenceops = {
> +	.get_driver_name = hantro_fence_get_driver_name,
> +	.get_timeline_name = hantro_fence_get_timeline_name,
> +	.enable_signaling = hantro_fence_enable_signaling,
> +	.signaled = hantro_fence_signaled,
> +	.wait = hantro_fence_default_wait,
> +	.release = hantro_fence_free,
> +};
> +
> +static struct dma_fence *alloc_fence(unsigned int ctxno)
> +{
> +	struct dma_fence *fobj;
> +	/* spinlock for fence */
> +	spinlock_t *lock;
> +
> +	fobj = kzalloc(sizeof(*fobj), GFP_KERNEL);
> +	if (!fobj)
> +		return NULL;
> +	lock = kzalloc(sizeof(*lock), GFP_KERNEL);
> +	if (!lock) {
> +		kfree(fobj);
> +		return NULL;
> +	}
> +
> +	spin_lock_init(lock);
> +	hantro_fence_init(fobj, &hantro_fenceops, lock, ctxno, seqno++);
> +	clear_bit(HANTRO_FENCE_FLAG_SIGNAL_BIT, &fobj->flags);
> +	set_bit(HANTRO_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fobj->flags);
> +
> +	return fobj;
> +}
> +
> +static int is_hantro_fence(struct dma_fence *fence)
> +{
> +	return (fence->ops == &hantro_fenceops);
> +}
> +
> +int init_hantro_resv(struct dma_resv *presv,
> +		     struct drm_gem_hantro_object *cma_obj)
> +{
> +	dma_resv_init(presv);
> +	cma_obj->ctxno = hantro_fence_context_alloc(1);
> +
> +	return 0;
> +}
> +
> +int hantro_waitfence(struct dma_fence *pfence)
> +{
> +	if (test_bit(HANTRO_FENCE_FLAG_SIGNAL_BIT, &pfence->flags))
> +		return 0;
> +
> +	if (is_hantro_fence(pfence))
> +		return 0;
> +	else
> +		return hantro_fence_wait_timeout(pfence, true, 30 * HZ);
> +}
> +
> +int hantro_setdomain(struct drm_device *dev, void *data,
> +		     struct drm_file *file_priv)
> +{
> +	return 0;
> +}
> +
> +void init_fence_data(void)
> +{
> +	seqno = 0;
> +	mutex_init(&fence_mutex);
> +	idr_init(&fence_idr);
> +}
> +
> +static int fence_idr_fini(int id, void *p, void *data)
> +{
> +	hantro_fence_signal(p);
> +	hantro_fence_put(p);
> +
> +	return 0;
> +}
> +
> +void release_fence_data(void)
> +{
> +	mutex_lock(&fence_mutex);
> +	idr_for_each(&fence_idr, fence_idr_fini, NULL);
> +	idr_destroy(&fence_idr);
> +	mutex_unlock(&fence_mutex);
> +}
> +
> +int hantro_acquirebuf(struct drm_device *dev, void *data,
> +		      struct drm_file *file_priv)
> +{
> +	struct hantro_acquirebuf *arg = data;
> +	struct dma_resv *resv;
> +	struct drm_gem_object *obj;
> +	struct dma_fence *fence = NULL;
> +	unsigned long timeout = arg->timeout;
> +	unsigned long fenceid = -1;
> +	int ret = 0;
> +
> +	obj = hantro_gem_object_lookup(dev, file_priv, arg->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (!obj->dma_buf) {
> +		if (hantro_dev.drm_dev == obj->dev) {
> +			struct drm_gem_hantro_object *hobj =
> +				to_drm_gem_hantro_obj(obj);
> +
> +			resv = &hobj->kresv;
> +		} else {
> +			ret = -ENOENT;
> +			goto err;
> +		}
> +	} else {
> +		resv = obj->dma_buf->resv;
> +	}
> +	/* Check for a stalled fence */
> +	if (!dma_resv_wait_timeout_rcu(resv, arg->flags
> +					& HANTRO_FENCE_WRITE,
> +					1, timeout)) {
> +		ret = -EBUSY;
> +		goto err;
> +	}
> +
> +	/* Expose the fence via the dma-buf */
> +	ret = -ENOMEM;
> +	fence = alloc_fence(hantro_fence_context_alloc(1));
> +	if (!fence)
> +		goto err;
> +
> +	mutex_lock(&fence_mutex);
> +	ret = idr_alloc(&fence_idr, fence, 1, 0, GFP_KERNEL);
> +	mutex_unlock(&fence_mutex);
> +	if (ret >= 0)
> +		fenceid = ret;
> +	else
> +		goto err;
> +
> +	dma_resv_lock(resv, NULL);
> +	if (resv->fence_excl  &&
> +	    !hantro_fence_is_signaled(resv->fence_excl)) {
> +		dma_resv_unlock(resv);
> +		ret = -EBUSY;
> +		goto err;
> +	}
> +	ret = 0;
> +	if (arg->flags & HANTRO_FENCE_WRITE) {
> +		dma_resv_add_excl_fence(resv, fence);
> +	} else {
> +		ret = hantro_reserve_obj_shared(resv, 1);
> +		if (ret == 0)
> +			dma_resv_add_shared_fence(resv, fence);
> +	}
> +	dma_resv_unlock(resv);
> +
> +	/* Record the fence in our idr for later signaling */
> +	if (ret == 0) {
> +		arg->fence_handle = fenceid;
> +		hantro_unref_drmobj(obj);
> +
> +		return ret;
> +	}
> +err:
> +	if (fenceid >= 0) {
> +		mutex_lock(&fence_mutex);
> +		idr_remove(&fence_idr, fenceid);
> +		mutex_unlock(&fence_mutex);
> +	}
> +	if (fence) {
> +		hantro_fence_signal(fence);
> +		hantro_fence_put(fence);
> +	}
> +	hantro_unref_drmobj(obj);
> +	return ret;
> +}
> +
> +int hantro_testbufvalid(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv)
> +{
> +	struct hantro_fencecheck *arg = data;
> +	struct dma_resv *resv;
> +	struct drm_gem_object *obj;
> +
> +	arg->ready = 0;
> +	obj = hantro_gem_object_lookup(dev, file_priv, arg->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (!obj->dma_buf) {
> +		if (hantro_dev.drm_dev == obj->dev) {
> +			struct drm_gem_hantro_object *hobj =
> +				to_drm_gem_hantro_obj(obj);
> +
> +			resv = &hobj->kresv;
> +		} else {
> +			return -ENOENT;
> +		}
> +	} else {
> +		resv = obj->dma_buf->resv;
> +	}
> +
> +	/* Check for a stalled fence */
> +	if (dma_resv_wait_timeout_rcu(resv, 1, 1, 0) <= 0)
> +		arg->ready = 0;
> +	else
> +		arg->ready = 1;
> +
> +	return 0;
> +}
> +
> +int hantro_releasebuf(struct drm_device *dev, void *data,
> +		      struct drm_file *file_priv)
> +{
> +	struct hantro_releasebuf *arg = data;
> +	struct dma_fence *fence;
> +	int ret = 0;
> +
> +	mutex_lock(&fence_mutex);
> +	fence = idr_replace(&fence_idr, NULL, arg->fence_handle);
> +	mutex_unlock(&fence_mutex);
> +
> +	if (!fence || IS_ERR(fence))
> +		return -ENOENT;
> +	if (hantro_fence_is_signaled(fence))
> +		ret = -ETIMEDOUT;
> +
> +	hantro_fence_signal(fence);
> +	hantro_fence_put(fence);
> +	mutex_lock(&fence_mutex);
> +	idr_remove(&fence_idr, arg->fence_handle);
> +	mutex_unlock(&fence_mutex);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/hantro/hantro_priv.h b/drivers/gpu/drm/hantro/hantro_priv.h
> new file mode 100644
> index 0000000..7257cfd
> --- /dev/null
> +++ b/drivers/gpu/drm/hantro/hantro_priv.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *    Hantro driver private header file.
> + *
> + *    Copyright (c) 2017 - 2020, VeriSilicon Inc.
> + *    Copyright (c) 2020 Intel Corporation
> + */
> +
> +#ifndef HANTRO_PRIV_H
> +#define HANTRO_PRIV_H
> +#include "hantro_drm.h"
> +
> +#define hantro_access_ok(a, b, c)	access_ok(b, c)
> +#define hantro_reserve_obj_shared(a, b)	dma_resv_reserve_shared(a, b)
> +#define hantro_ref_drmobj		drm_gem_object_get
> +#define hantro_unref_drmobj		drm_gem_object_put
> +
> +struct hantro_device_handle {
> +	struct platform_device *platformdev; /* parent device */
> +	struct drm_device *drm_dev;
> +	int bprobed;
> +};
> +
> +extern struct hantro_device_handle hantro_dev;
> +
> +#define HANTRO_FENCE_FLAG_ENABLE_SIGNAL_BIT DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT
> +#define HANTRO_FENCE_FLAG_SIGNAL_BIT DMA_FENCE_FLAG_SIGNALED_BIT
> +
> +static inline signed long
> +hantro_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
> +{
> +	return dma_fence_default_wait(fence, intr, timeout);
> +}
> +
> +static inline void hantro_fence_init(struct dma_fence *fence,
> +				     const struct dma_fence_ops *ops,
> +				     spinlock_t *lock, unsigned int context,
> +				     unsigned int seqno)
> +{
> +	return dma_fence_init(fence, ops, lock, context, seqno);
> +}
> +
> +static inline unsigned int hantro_fence_context_alloc(unsigned int num)
> +{
> +	return dma_fence_context_alloc(num);
> +}
> +
> +static inline signed long
> +hantro_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
> +{
> +	return dma_fence_wait_timeout(fence, intr, timeout);
> +}
> +
> +static inline struct drm_gem_object *
> +hantro_gem_object_lookup(struct drm_device *dev, struct drm_file *filp,
> +			 u32 handle)
> +{
> +	return drm_gem_object_lookup(filp, handle);
> +}
> +
> +static inline void hantro_fence_put(struct dma_fence *fence)
> +{
> +	return dma_fence_put(fence);
> +}
> +
> +static inline int hantro_fence_signal(struct dma_fence *fence)
> +{
> +	return dma_fence_signal(fence);
> +}
> +
> +static inline void ref_page(struct page *pp)
> +{
> +	atomic_inc(&pp->_refcount);
> +	atomic_inc(&pp->_mapcount);
> +}
> +
> +static inline void unref_page(struct page *pp)
> +{
> +	atomic_dec(&pp->_refcount);
> +	atomic_dec(&pp->_mapcount);
> +}
> +
> +static inline bool hantro_fence_is_signaled(struct dma_fence *fence)
> +{
> +	return dma_fence_is_signaled(fence);
> +}
> +
> +static inline struct drm_gem_hantro_object *
> +to_drm_gem_hantro_obj(struct drm_gem_object *gem_obj)
> +{
> +	return container_of(gem_obj, struct drm_gem_hantro_object, base);
> +}
> +
> +int hantro_setdomain(struct drm_device *dev, void *data,
> +		     struct drm_file *file_priv);
> +int hantro_acquirebuf(struct drm_device *dev, void *data,
> +		      struct drm_file *file_priv);
> +int hantro_testbufvalid(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv);
> +int hantro_releasebuf(struct drm_device *dev, void *data,
> +		      struct drm_file *file_priv);
> +int init_hantro_resv(struct dma_resv *presv,
> +		     struct drm_gem_hantro_object *cma_obj);
> +void init_fence_data(void);
> +void release_fence_data(void);
> +#endif /*HANTRO_PRIV_H*/
> -- 
> 1.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
