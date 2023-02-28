Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D896A5100
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 03:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8481510E029;
	Tue, 28 Feb 2023 02:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C992D10E029
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677550642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L1Mb2daXfEUQHvXVW4hyDc03Jb2/hD1w1K+XnRGqyVE=;
 b=F1MC0Qhblh1asNeXbpk7VJ43CPCWgKDfCrutkmOk6lrjTP1/pHh/6swjuppwjZSzlVSKnH
 L/vwUC6QlXBZijADd+GfIl9GTMKn8whVk01sSIqcqS5RpQ4t8QqROREnb97pMKYQUc7m8G
 fDh0DXukkWiq0rQBbNXsKzwtdX/+vyo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-VuR_AZVfNLeHT_0hDJS1sw-1; Mon, 27 Feb 2023 21:17:21 -0500
X-MC-Unique: VuR_AZVfNLeHT_0hDJS1sw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso11281285edb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 18:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:to
 :from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaG8/Bg6dhlDDPoj6nBl4VpMZT/wui8WldswSe4hBs4=;
 b=7ZPT0zEcSxE4hml8/KmzYvNU60MsOh4fBt4su330tRKRXNdNbU7yWxEap/IhS23ZJU
 O4Fyh1EIw5D8fFC69HeCZxBDazWw3OB90ubPCFZXBlwxzLhb19xhr+k5uLEIkHEk+gKF
 KP71Y22yDGObHX9ddwDFzwrXQFv0xmr0HA84Q2LOC0J0v7Im02kqERSIGiJxLJv4nGSs
 5gak4hZhmYzYN6dsCb3WGfz1zkKa19yl1ClAMCmjMa7BgsUXo1T6fcEGhqCRO4kXuf4u
 9/qzaDykT7jY2CPQYC7zp6saknbxA5IppmjwxTXeYdvmEVPtcZHmogIijUIF63ZqUuTB
 V83w==
X-Gm-Message-State: AO0yUKX00FS7UpU/r/P/2ZXI0SQ5hz/L4aQtyviVK0/XHalSSPOJBgdT
 OAB6W888cyOmNIeFzCepDH51Hdgblh9oVhxJ8DcyWINsu2lKIKFBykkEQp2Sse2fngUhRutpszv
 d7NS0HYVB8qrMeGZO/O72yQa3ouD+
X-Received: by 2002:a17:906:714e:b0:8b2:8876:6a3c with SMTP id
 z14-20020a170906714e00b008b288766a3cmr878955ejj.29.1677550640048; 
 Mon, 27 Feb 2023 18:17:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9tTXKhn1koDlG1F1zP1IAfope6sN3htqLi1+Nr+TLZ9X3jnhKZaiB/RADncuz0n/Vy80QyHA==
X-Received: by 2002:a17:906:714e:b0:8b2:8876:6a3c with SMTP id
 z14-20020a170906714e00b008b288766a3cmr878917ejj.29.1677550639717; 
 Mon, 27 Feb 2023 18:17:19 -0800 (PST)
Received: from WINDOWS. ([2a02:810d:4b3f:de78:41c:160e:6481:ed36])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170906501100b008b17aa6afc8sm3927141ejj.30.2023.02.27.18.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 18:17:18 -0800 (PST)
Message-ID: <63fd642e.170a0220.f67f6.e248@mx.google.com>
X-Google-Original-Message-ID: <Y/1kK5mjGoovZ8dU@WINDOWS.>
Date: Tue, 28 Feb 2023 03:17:15 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
MIME-Version: 1.0
In-Reply-To: <20230221182050.day6z5ge2e3dxerv@revolver>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="xgWBGL0J166I1n9/"
Content-Disposition: inline
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

--xgWBGL0J166I1n9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 01:20:50PM -0500, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230217 08:45]:
> > Add infrastructure to keep track of GPU virtual address (VA) mappings
> > with a decicated VA space manager implementation.
> > 
> > New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> > start implementing, allow userspace applications to request multiple and
> > arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> > intended to serve the following purposes in this context.
> > 
> > 1) Provide infrastructure to track GPU VA allocations and mappings,
> >    making use of the maple_tree.
> > 
> > 2) Generically connect GPU VA mappings to their backing buffers, in
> >    particular DRM GEM objects.
> > 
> > 3) Provide a common implementation to perform more complex mapping
> >    operations on the GPU VA space. In particular splitting and merging
> >    of GPU VA mappings, e.g. for intersecting mapping requests or partial
> >    unmap requests.
> > 
> > Suggested-by: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  Documentation/gpu/drm-mm.rst    |   31 +
> >  drivers/gpu/drm/Makefile        |    1 +
> >  drivers/gpu/drm/drm_gem.c       |    3 +
> >  drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
> >  include/drm/drm_drv.h           |    6 +
> >  include/drm/drm_gem.h           |   75 ++
> >  include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
> >  7 files changed, 2534 insertions(+)
> >  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> >  create mode 100644 include/drm/drm_gpuva_mgr.h
> > 
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > index a52e6f4117d6..c9f120cfe730 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
> >  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
> >     :export:
> >  
> ...
> 
> > +
> > +/**
> > + * drm_gpuva_remove_iter - removes the iterators current element
> > + * @it: the &drm_gpuva_iterator
> > + *
> > + * This removes the element the iterator currently points to.
> > + */
> > +void
> > +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
> > +{
> > +	mas_erase(&it->mas);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_iter_remove);
> > +
> > +/**
> > + * drm_gpuva_insert - insert a &drm_gpuva
> > + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > + * @va: the &drm_gpuva to insert
> > + * @addr: the start address of the GPU VA
> > + * @range: the range of the GPU VA
> > + *
> > + * Insert a &drm_gpuva with a given address and range into a
> > + * &drm_gpuva_manager.
> > + *
> > + * Returns: 0 on success, negative error code on failure.
> > + */
> > +int
> > +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +		 struct drm_gpuva *va)
> > +{
> > +	u64 addr = va->va.addr;
> > +	u64 range = va->va.range;
> > +	MA_STATE(mas, &mgr->va_mt, addr, addr + range - 1);
> > +	struct drm_gpuva_region *reg = NULL;
> > +	int ret;
> > +
> > +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
> > +		return -EINVAL;
> > +
> > +	if (unlikely(drm_gpuva_in_kernel_region(mgr, addr, range)))
> > +		return -EINVAL;
> > +
> > +	if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS) {
> > +		reg = drm_gpuva_in_region(mgr, addr, range);
> > +		if (unlikely(!reg))
> > +			return -EINVAL;
> > +	}
> > +
> 
> -----
> 
> > +	if (unlikely(drm_gpuva_find_first(mgr, addr, range)))
> > +		return -EEXIST;
> > +
> > +	ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> 
> mas_walk() will set the internal maple state to the limits to what it
> finds.  So, instead of an iterator, you can use the walk function and
> ensure there is a large enough area in the existing NULL:
> 
> /*
>  * Nothing at addr, mas now points to the location where the store would
>  * happen
>  */
> if (mas_walk(&mas))
> 	return -EEXIST;
> 

For some reason mas_walk() finds an entry and hence this function returns
-EEXIST for the following sequence of insertions.

A = [0xc0000 - 0xfffff]
B = [0x0 - 0xbffff]

Interestingly, inserting B before A works fine.

I attached a test module that reproduces the issue. I hope its just a stupid
mistake I just can't spot though.

> /* The NULL entry ends at mas.last, make sure there is room */
> if (mas.last < (addr + range - 1))
> 	return -EEXIST;
> 
> /* Limit the store size to the correct end address, and store */
>  mas.last = addr + range - 1;
>  ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> 

--xgWBGL0J166I1n9/
Content-Type: text/x-c; charset=us-ascii
Content-Disposition: attachment; filename="maple.c"

/* SPDX-License-Identifier: GPL-2.0 */
#if 1
#include <linux/init.h>
#include <linux/ioctl.h>
#include <linux/kernel.h>
#include <linux/list.h>
#include <linux/maple_tree.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/mutex.h>
#include <linux/printk.h>
#include <linux/proc_fs.h>
#include <linux/slab.h>
#include <linux/types.h>
#endif

struct maple_tree mt;

struct va {
	u64 addr;
	u64 range;
};

static int va_store(struct va *va)
{
	void *entry = NULL;
	u64 addr = va->addr;
	u64 range = va->range;
	u64 last = addr + range - 1;
	MA_STATE(mas, &mt, addr, addr);
	int ret;

	mas_lock(&mas);

	if ((entry = mas_walk(&mas))) {
		pr_err("addr=%llx, range=%llx, last=%llx, mas.index=%lx, mas.last=%lx, entry=%px - exists\n",
		       addr, range, last, mas.index, mas.last, entry);
		ret = -EEXIST;
		goto err_unlock;
	}

	if (mas.last < last) {
		pr_err("addr=%llx, range=%llx, last=%llx, mas.index=%lx, mas.last%lx, va=%px - not enough space\n",
		       addr, range, last, mas.index, mas.last, va);
		ret = -EEXIST;
		goto err_unlock;
	}

	mas.last = last;
	ret = mas_store_gfp(&mas, &va, GFP_KERNEL);
	if (ret) {
		pr_err("mas_store_gfp() failed\n");
		goto err_unlock;
	}

	mas_unlock(&mas);

	pr_info("addr=%llx, range=%llx, last=%llx, mas.index=%lx, mas.last=%lx, va=%px - insert\n",
		addr, range, last, mas.index, mas.last, va);

	return 0;

err_unlock:
	mas_unlock(&mas);
	return ret;
}

static int __init maple_init(void)
{
	struct va kernel_node = { .addr = 0xc0000, .range = 0x40000 };
	struct va node = { .addr = 0x0, .range = 0xc0000 };

	mt_init(&mt);

	va_store(&kernel_node);
	va_store(&node);

	return 0;
}

static void __exit maple_exit(void)
{
	mtree_lock(&mt);
	__mt_destroy(&mt);
	mtree_unlock(&mt);
}

module_init(maple_init);
module_exit(maple_exit);

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("Danilo Krummrich");
MODULE_DESCRIPTION("Maple Tree example.");
MODULE_VERSION("0.1");

--xgWBGL0J166I1n9/--

