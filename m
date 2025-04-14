Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86DA88C62
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 21:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB17E10E31D;
	Mon, 14 Apr 2025 19:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="BwaxlqCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B3510E31D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 19:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744659793; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NYnh47+N5Vhhhzu4jLqQuWk9ZpietQY7sN1ScxaVTcrrmhJcwHd2tYBQtTnOHw9vwPyrskAkMY+CcBk5fIEOnBWMONYSLvfQ2JGVDp7dMsXZiB5qCxcTG8Dp0Ksed7sI7ZnNMpZ1UNiuQ1vT/yH2Por+ZS8+CZmurSJPJ1OX8V4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744659793;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Xh7ESEH0SRDsTTA+0VoPrwh9bXEKVfaUYrmcwXEkfOg=; 
 b=Qf38uLw6VfsPrXWVxAxndjuPEPXit6ArSF8hUQ42r9zq2D5/xWZplW5yTBABtBHWXhKNLUvo68zswondDpqa9ZcnReaI5alrhQTuu9LvcKXpjywulgoJoL2Kn4aPMnvu8YXUn6PAym3OvK010pba+sRfoxRpZRLPwvpoALqFyvM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744659792; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=Xh7ESEH0SRDsTTA+0VoPrwh9bXEKVfaUYrmcwXEkfOg=;
 b=BwaxlqCfLXMr58D60gn3JgKo/6P31uyvk23G+z12+RjnAky8hTQLNRN2e3s5M/1X
 ItXsS4IgADsBxBx5LWayrJsCgqsC7LRTBGTQYEkt+SiHIAoB6L55opi5/s847HIVF/X
 /UMdHQYaNt7XVW6chd79fTZe33z6MbE67GKmkPRc=
Received: by mx.zohomail.com with SMTPS id 17446597917831022.0556401897062;
 Mon, 14 Apr 2025 12:43:11 -0700 (PDT)
Date: Mon, 14 Apr 2025 20:43:06 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v7 1/4] drm/panthor: Introduce BO labeling
Message-ID: <ejq47pilr3phywio3oudfrqbj2a3u2j3irk7uhlwd4pz24ve2c@3pc3cbdlerqk>
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
 <20250411150357.3308921-2-adrian.larumbe@collabora.com>
 <93a4ec41-3bd8-4485-a4fe-d0def3509b79@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93a4ec41-3bd8-4485-a4fe-d0def3509b79@arm.com>
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

Hi Steven,

On 14.04.2025 10:50, Steven Price wrote:
> Hi Adrián,
>
> On 11/04/2025 16:03, Adrián Larumbe wrote:
> > Add a new character string Panthor BO field, and a function that allows
> > setting it from within the driver.
> >
> > Driver takes care of freeing the string when it's replaced or no longer
> > needed at object destruction time, but allocating it is the responsibility
> > of callers.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 39 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 8244a4e6c2a2..af0ac17f357f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -2,6 +2,7 @@
> >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> >  /* Copyright 2023 Collabora ltd. */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/dma-buf.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/err.h>
> > @@ -18,6 +19,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
> >  	struct panthor_gem_object *bo = to_panthor_bo(obj);
> >  	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
> >
> > +	/*
> > +	 * Label might have been allocated with kstrdup_const(),
> > +	 * we need to take that into account when freeing the memory
> > +	 */
> > +	kfree_const(bo->label.str);
> > +
> > +	mutex_destroy(&bo->label.lock);
> > +
> >  	drm_gem_free_mmap_offset(&bo->base.base);
> >  	mutex_destroy(&bo->gpuva_list_lock);
> >  	drm_gem_shmem_free(&bo->base);
> > @@ -196,6 +205,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
> >  	obj->base.map_wc = !ptdev->coherent;
> >  	mutex_init(&obj->gpuva_list_lock);
> >  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> > +	mutex_init(&obj->label.lock);
> >
> >  	return &obj->base.base;
> >  }
> > @@ -247,3 +257,32 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >
> >  	return ret;
> >  }
> > +
> > +void
> > +panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
> > +{
> > +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> > +	const char *old_label;
> > +
> > +	scoped_guard(mutex, &bo->label.lock) {
> > +		old_label = bo->label.str;
> > +		bo->label.str = label;
> > +	}
> > +
> > +	kfree(old_label);
>
> Shouldn't this be kfree_const()? I suspect as things stand we can't
> trigger this bug but it's inconsistent.

This could only be called either from the set_label() ioctl, in which case
old_label could be NULL or a pointer to a string obtained from strdup(); or from
panthor_gem_kernel_bo_set_label(). In the latter case, it could only ever be
NULL, since we don't reassign kernel BO labels, so it'd be safe too.

However I do agree that it's not consistent, and then in the future perhaps
relabelling kernel BO's might be justified, so I'll change it to kfree_const().

> > +}
> > +
> > +void
> > +panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
> > +{
> > +	const char *str;
> > +
> > +	str = kstrdup_const(label, GFP_KERNEL);
> > +	if (!str) {
>
> In the next patch you permit user space to clear the label
> (args->size==0) which means label==NULL and AFAICT kstrdup_const() will
> return NULL in this case triggering this warning.

Kernel and UM-exposed BO's should never experience cross-labelling, so in theory
this scenario ought to be impossible. The only way panthor_gem_kernel_bo_set_label()
might take NULL in the 'label' argument is that someone called panthor_kernel_bo_create()
with NULL for its name 'argument'.

I think as a defensive check, I could do something as follows

void
panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
{
	const char *str;

	/* We should never attempt labelling a UM-exposed GEM object */
	if (drm_WARN_ON(bo->obj->dev, &bo->obj->handle_count > 0))
		return;

	if (!label)
		return;

       [...]
}

> Thanks,
> Steve
>
> > +		/* Failing to allocate memory for a label isn't a fatal condition */
> > +		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
> > +		return;
> > +	}
> > +
> > +	panthor_gem_bo_set_label(bo->obj, str);
> > +}
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> > index 1a363bb814f4..af0d77338860 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > @@ -46,6 +46,20 @@ struct panthor_gem_object {
> >
> >  	/** @flags: Combination of drm_panthor_bo_flags flags. */
> >  	u32 flags;
> > +
> > +	/**
> > +	 * @label: BO tagging fields. The label can be assigned within the
> > +	 * driver itself or through a specific IOCTL.
> > +	 */
> > +	struct {
> > +		/**
> > +		 * @label.str: Pointer to NULL-terminated string,
> > +		 */
> > +		const char *str;
> > +
> > +		/** @lock.str: Protects access to the @label.str field. */
> > +		struct mutex lock;
> > +	} label;
> >  };
> >
> >  /**
> > @@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >  			       struct panthor_vm *exclusive_vm,
> >  			       u64 *size, u32 flags, uint32_t *handle);
> >
> > +void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
> > +void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
> > +
> >  static inline u64
> >  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
> >  {

Adrian Larumbe
