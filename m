Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A7314D8B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 11:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610E289EAE;
	Tue,  9 Feb 2021 10:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04A089E43
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 10:54:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 7so21110006wrz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 02:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=awNConcuSbmVFJzREz9wfmqSSfcskIy7qYDmwEBMAKU=;
 b=gKyAmiNvB2F1i+4EufDrLxr8R2beTgutFGgGDfgCpmN8LqzxmQ1pehhE0TZwe5L2sg
 QWMwOw4LXZR5lI9WjQGjqUa+7fSr9+Ey4/OuXTYHG3zPt3tCd3VMSNXHoBwsaRhDTOxt
 ydIXg4wd4Rpn0Kzg5/mkEVnGnGC1mN95ptcgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=awNConcuSbmVFJzREz9wfmqSSfcskIy7qYDmwEBMAKU=;
 b=hnfmFQeU9I1LfFchv2o+Cz/vnPYa64/Akk//CNxPRd1QXQ7ISOzwyA0QtFYnkfnbWG
 fg3NhNQZTsx7PWY2M7ocdbfjKv7jwwTq0O3YrAUHUnroO9z2w11U6opX0zOu0OPK0bfp
 Oyhsffr6GbuW0HcFxB0bc0+Yk+xKUmo+CTkCq3SIwS/Z+Em4pUQCI8czH5fxT9gqLth/
 lOSwBYZjpygZ8wQkx5rKwgKRzfadENGfRs5BDL0cVkhOWtOF89FfGkxUGHZfJ7CeucNX
 0oK3ssnbdq2pKRfMbRYswduBztyzz6rvZBwFJX9D2RHyLSqxSPu0udwLK+p+wZ+ctDhi
 9N2Q==
X-Gm-Message-State: AOAM5301hPuPRcJMrDkBsB6DwB+bU88tg4kzdXZD1trll4m2V9IA6dzL
 4yk99LX+gYW7wQLBqcIpDf4kmQ==
X-Google-Smtp-Source: ABdhPJzdKiCudlXfgTvYPZHzQkGot8yHiXWc/ffuubTe+e5BcXUfrtmJyUGMZZddlc8iZNJwuMj6kw==
X-Received: by 2002:a5d:4988:: with SMTP id r8mr24887041wrq.26.1612868098279; 
 Tue, 09 Feb 2021 02:54:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c62sm4123695wmd.43.2021.02.09.02.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 02:54:57 -0800 (PST)
Date: Tue, 9 Feb 2021 11:54:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [RFC PATCH 8/9] drm/gem: Associate GEM objects with drm cgroup
Message-ID: <YCJp//kMC7YjVMXv@phenom.ffwll.local>
References: <20210126214626.16260-1-brian.welty@intel.com>
 <20210126214626.16260-9-brian.welty@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126214626.16260-9-brian.welty@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>, David Airlie <airlied@linux.ie>,
 Kenny Ho <Kenny.Ho@amd.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 amd-gfx@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 01:46:25PM -0800, Brian Welty wrote:
> This patch adds tracking of which cgroup to make charges against for a
> given GEM object.  We associate the current task's cgroup with GEM objects
> as they are created.  First user of this is for charging DRM cgroup for
> device memory allocations.  The intended behavior is for device drivers to
> make the cgroup charging calls at the time that backing store is allocated
> or deallocated for the object.
> 
> Exported functions are provided for charging memory allocations for a
> GEM object to DRM cgroup. To aid in debugging, we store how many bytes
> have been charged inside the GEM object.  Add helpers for setting and
> clearing the object's associated cgroup which will check that charges are
> not being leaked.
> 
> For shared objects, this may make the charge against a cgroup that is
> potentially not the same cgroup as the process using the memory.  Based
> on the memory cgroup's discussion of "memory ownership", this seems
> acceptable [1].
> 
> [1] https://www.kernel.org/doc/Documentation/cgroup-v2.txt, "Memory Ownership"
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Since for now we only have the generic gpu/xpu/bikeshed.memory bucket that
counts everything, why don't we also charge in these gem functions?

Also, that would remove the need for all these functions exported to
drivers. Plus the cgroups setup could also move fully into drm core code,
since all drivers (*) support it. That way this would really be a fully
generic cgroups controller, and we could land it.

The other things I'd do:
- drop gpu scheduling controller from the initial patch series. Yes we'll
  need it, but we also need vram limits and all these things for full
  featured controller. Having the minimal viable cgroup controller in
  upstream would unblock all these other things, and we could discuss them
  in separate patch series, instead of one big bikeshed that never reaches
  full consensus.

- the xpu thing is probably real, I just chatted with Android people for
  their gpu memory accounting needs, and cgroups sounds like a solution
  for them too. But unlike on desktop/server linux, on Android all shared
  buffers are allocated from dma-buf heaps, so outside of drm, and hence a
  cgroup controller that's tightly tied to drm isn't that useful. So I
  think we should move the controller/charge functions up one level into
  drivers/gpu/cgroups.

  On the naming bikeshed I think gpu is perfectly fine, just explain in
  the docs that the G stands for "general" :-) Otherwise we might need to
  rename drivers/gpu to drivers/xpu too, and that's maybe one bikeshed too
  far. Plus, right now it really is the controller for gpu related memory,
  even if we extend it to Android (where it would also include
  video/camera allocatioons). Extending this cgroup controller to
  accelerators in general is maybe a bit too much.
 
- The other disambiguation is how we account dma-buf (well, buffer based)
  gpu allocations vs HMM gpu memory allocations, that might be worth
  clarifying in the docs.

- Finally to accelerate this further, I think it'd be good to pull out the
  cgroup spec for this more minimized series into patch 1, as a draft.
  That way we could get all stakeholders to ack on that ack, so hopefully
  we're building something that will work for everyone. That way we can
  hopefully untangle the controller design discussions from the
  implementation bikeshedding as much as possible.

Cheers, Daniel

*: vmwgfx is the only non-gem driver, but there's plans to move at least
vmwgfx internals (maybe not the uapi, we'll see) over to gem. Once that's
done it's truly all gpu memory.
> ---
>  drivers/gpu/drm/drm_gem.c | 89 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gem.h     | 17 ++++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c2ce78c4edc3..a12da41eaafe 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -29,6 +29,7 @@
>  #include <linux/slab.h>
>  #include <linux/mm.h>
>  #include <linux/uaccess.h>
> +#include <linux/cgroup_drm.h>
>  #include <linux/fs.h>
>  #include <linux/file.h>
>  #include <linux/module.h>
> @@ -112,6 +113,89 @@ drm_gem_init(struct drm_device *dev)
>  	return drmm_add_action(dev, drm_gem_init_release, NULL);
>  }
>  
> +/**
> + * drm_gem_object_set_cgroup - associate GEM object with a cgroup
> + * @obj: GEM object which is being associated with a cgroup
> + * @task: task associated with process control group to use
> + *
> + * This will acquire a reference on cgroup and use for charging GEM
> + * memory allocations.
> + * This helper could be extended in future to migrate charges to another
> + * cgroup, print warning if this usage occurs.
> + */
> +void drm_gem_object_set_cgroup(struct drm_gem_object *obj,
> +			       struct task_struct *task)
> +{
> +	/* if object has existing cgroup, we migrate the charge... */
> +	if (obj->drmcg) {
> +		pr_warn("DRM: need to migrate cgroup charge of %lld\n",
> +			atomic64_read(&obj->drmcg_bytes_charged));
> +	}
> +	obj->drmcg = drmcg_get(task);
> +}
> +EXPORT_SYMBOL(drm_gem_object_set_cgroup);
> +
> +/**
> + * drm_gem_object_unset_cgroup - clear GEM object's associated cgroup
> + * @obj: GEM object
> + *
> + * This will release a reference on cgroup.
> + */
> +void drm_gem_object_unset_cgroup(struct drm_gem_object *obj)
> +{
> +	WARN_ON(atomic64_read(&obj->drmcg_bytes_charged));
> +	drmcg_put(obj->drmcg);
> +}
> +EXPORT_SYMBOL(drm_gem_object_unset_cgroup);
> +
> +/**
> + * drm_gem_object_charge_mem - try charging size bytes to DRM cgroup
> + * @obj: GEM object which is being charged
> + * @size: number of bytes to charge
> + *
> + * Try to charge @size bytes to GEM object's associated DRM cgroup.  This
> + * will fail if a successful charge would cause the current device memory
> + * usage to go above the cgroup's GPU memory maximum limit.
> + *
> + * Returns 0 on success.  Otherwise, an error code is returned.
> + */
> +int drm_gem_object_charge_mem(struct drm_gem_object *obj, u64 size)
> +{
> +	int ret;
> +
> +	ret = drm_cgroup_try_charge(obj->drmcg, obj->dev,
> +				    DRMCG_TYPE_MEM_CURRENT, size);
> +	if (!ret)
> +		atomic64_add(size, &obj->drmcg_bytes_charged);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_object_charge_mem);
> +
> +/**
> + * drm_gem_object_uncharge_mem - uncharge size bytes from DRM cgroup
> + * @obj: GEM object which is being uncharged
> + * @size: number of bytes to uncharge
> + *
> + * Uncharge @size bytes from the DRM cgroup associated with specified
> + * GEM object.
> + *
> + * Returns 0 on success.  Otherwise, an error code is returned.
> + */
> +void drm_gem_object_uncharge_mem(struct drm_gem_object *obj, u64 size)
> +{
> +	u64 charged = atomic64_read(&obj->drmcg_bytes_charged);
> +
> +	if (WARN_ON(!charged))
> +		return;
> +	if (WARN_ON(size > charged))
> +		size = charged;
> +
> +	atomic64_sub(size, &obj->drmcg_bytes_charged);
> +	drm_cgroup_uncharge(obj->drmcg, obj->dev, DRMCG_TYPE_MEM_CURRENT,
> +			    size);
> +}
> +EXPORT_SYMBOL(drm_gem_object_uncharge_mem);
> +
>  /**
>   * drm_gem_object_init - initialize an allocated shmem-backed GEM object
>   * @dev: drm_device the object should be initialized for
> @@ -156,6 +240,8 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  	obj->dev = dev;
>  	obj->filp = NULL;
>  
> +	drm_gem_object_set_cgroup(obj, current);
> +
>  	kref_init(&obj->refcount);
>  	obj->handle_count = 0;
>  	obj->size = size;
> @@ -950,6 +1036,9 @@ drm_gem_object_release(struct drm_gem_object *obj)
>  
>  	dma_resv_fini(&obj->_resv);
>  	drm_gem_free_mmap_offset(obj);
> +
> +	/* Release reference on cgroup used with GEM object charging */
> +	drm_gem_object_unset_cgroup(obj);
>  }
>  EXPORT_SYMBOL(drm_gem_object_release);
>  
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 240049566592..06ea10fc17bc 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -37,6 +37,7 @@
>  #include <linux/kref.h>
>  #include <linux/dma-resv.h>
>  
> +#include <drm/drm_cgroup.h>
>  #include <drm/drm_vma_manager.h>
>  
>  struct dma_buf_map;
> @@ -222,6 +223,17 @@ struct drm_gem_object {
>  	 */
>  	struct file *filp;
>  
> +	/**
> +	 * @drmcg:
> +	 *
> +	 * cgroup used for charging GEM object page allocations against. This
> +	 * is set to the current cgroup during GEM object creation.
> +	 * Charging policy is up to the DRM driver to implement and should be
> +	 * charged when allocating backing store from device memory.
> +	 */
> +	struct drmcg *drmcg;
> +	atomic64_t drmcg_bytes_charged;
> +
>  	/**
>  	 * @vma_node:
>  	 *
> @@ -417,4 +429,9 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>  int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>  			    u32 handle, u64 *offset);
>  
> +void drm_gem_object_set_cgroup(struct drm_gem_object *obj,
> +			       struct task_struct *task);
> +void drm_gem_object_unset_cgroup(struct drm_gem_object *obj);
> +int drm_gem_object_charge_mem(struct drm_gem_object *obj, u64 size);
> +void drm_gem_object_uncharge_mem(struct drm_gem_object *obj, u64 size);
>  #endif /* __DRM_GEM_H__ */
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
