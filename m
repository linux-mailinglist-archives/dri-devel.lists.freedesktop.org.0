Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB57E7B6E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B76D10E984;
	Fri, 10 Nov 2023 10:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B47710E984;
 Fri, 10 Nov 2023 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699612801; x=1731148801;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aiWafxryBwfpkTrcwmhJTaMpDr70Q1+h/+e7js8bdjA=;
 b=BhJoglGvCy0jTyoghGa9uWqgoJ0Unm7M8+FDlwcIrIeTLnLBVUw9hL7U
 lJc6juEYP/7Tl4+jv8BRV/18jSnbv9dYXRHgYJXhtHhBZ/+u0ppA8JP+n
 ui49TzNYZ28P9vbStJCdtGLELOTSFJjpaUKe/tRedZbTGGUI9ttxIBK0n
 PEmCizx1/TloOkxjGwNaUJje6RbHMiQXNY1LfQxY5kPxN5cT59MnmvnDF
 fdx77hs/vG9oxOFgl6r9o4w7Ofac5TNJCaZ/rjKT65HiTrKEd6hyQ2v39
 mVc5baKWcpa8O8Xx/gRO/WNGUeKWlhIe1pjLHHpfu4DyhR7EZs1hiAraQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375207255"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="375207255"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:40:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887327528"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="887327528"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO [10.249.254.223])
 ([10.249.254.223])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:39:57 -0800
Message-ID: <92cfbfd9-b9d0-68b4-6375-a0d460f23dbc@linux.intel.com>
Date: Fri, 10 Nov 2023 11:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next v9 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231108001259.15123-1-dakr@redhat.com>
 <20231108001259.15123-10-dakr@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231108001259.15123-10-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/8/23 01:12, Danilo Krummrich wrote:
> Implement reference counting for struct drm_gpuvm.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/drm_gpuvm.c            | 56 +++++++++++++++++++++-----
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 ++++++---
>   include/drm/drm_gpuvm.h                | 31 +++++++++++++-
>   3 files changed, 90 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 53e2c406fb04..ef968eba6fe6 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>   	gpuvm->rb.tree = RB_ROOT_CACHED;
>   	INIT_LIST_HEAD(&gpuvm->rb.list);
>   
> +	kref_init(&gpuvm->kref);
> +
>   	gpuvm->name = name ? name : "unknown";
>   	gpuvm->flags = flags;
>   	gpuvm->ops = ops;
> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>   
> -/**
> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> - * @gpuvm: pointer to the &drm_gpuvm to clean up
> - *
> - * Note that it is a bug to call this function on a manager that still
> - * holds GPU VA mappings.
> - */
> -void
> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> +static void
> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>   {
>   	gpuvm->name = NULL;
>   
> @@ -790,7 +785,35 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>   
>   	drm_gem_object_put(gpuvm->r_obj);
>   }
> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> +
> +static void
> +drm_gpuvm_free(struct kref *kref)
> +{
> +	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
> +
> +	drm_gpuvm_fini(gpuvm);
> +
> +	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
> +		return;
> +
> +	gpuvm->ops->vm_free(gpuvm);
> +}
> +
> +/**
> + * drm_gpuvm_put() - drop a struct drm_gpuvm reference
> + * @gpuvm: the &drm_gpuvm to release the reference of
> + *
> + * This releases a reference to @gpuvm.
> + *
> + * This function may be called from atomic context.
> + */
> +void
> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
> +{
> +	if (gpuvm)
> +		kref_put(&gpuvm->kref, drm_gpuvm_free);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>   
>   static int
>   __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> @@ -839,11 +862,21 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>   {
>   	u64 addr = va->va.addr;
>   	u64 range = va->va.range;
> +	int ret;
>   
>   	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>   		return -EINVAL;
>   
> -	return __drm_gpuva_insert(gpuvm, va);
> +	ret = __drm_gpuva_insert(gpuvm, va);
> +	if (likely(!ret))
> +		/* Take a reference of the GPUVM for the successfully inserted
> +		 * drm_gpuva. We can't take the reference in
> +		 * __drm_gpuva_insert() itself, since we don't want to increse
> +		 * the reference count for the GPUVM's kernel_alloc_node.
> +		 */
> +		drm_gpuvm_get(gpuvm);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_insert);
>   
> @@ -876,6 +909,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
>   	}
>   
>   	__drm_gpuva_remove(va);
> +	drm_gpuvm_put(va->vm);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 54be12c1272f..cb2f06565c46 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
>   	}
>   }
>   
> +static void
> +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
> +{
> +	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
> +
> +	kfree(uvmm);
> +}
> +
> +static const struct drm_gpuvm_ops gpuvm_ops = {
> +	.vm_free = nouveau_uvmm_free,
> +};
> +
>   int
>   nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>   			   void *data,
> @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>   		       NOUVEAU_VA_SPACE_END,
>   		       init->kernel_managed_addr,
>   		       init->kernel_managed_size,
> -		       NULL);
> +		       &gpuvm_ops);
>   	/* GPUVM takes care from here on. */
>   	drm_gem_object_put(r_obj);
>   
> @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>   	return 0;
>   
>   out_gpuvm_fini:
> -	drm_gpuvm_destroy(&uvmm->base);
> -	kfree(uvmm);
> +	drm_gpuvm_put(&uvmm->base);
>   out_unlock:
>   	mutex_unlock(&cli->mutex);
>   	return ret;
> @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>   
>   	mutex_lock(&cli->mutex);
>   	nouveau_vmm_fini(&uvmm->vmm);
> -	drm_gpuvm_destroy(&uvmm->base);
> -	kfree(uvmm);
> +	drm_gpuvm_put(&uvmm->base);
>   	mutex_unlock(&cli->mutex);
>   }
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 0c2e24155a93..4e6e1fd3485a 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -247,6 +247,11 @@ struct drm_gpuvm {
>   		struct list_head list;
>   	} rb;
>   
> +	/**
> +	 * @kref: reference count of this object
> +	 */
> +	struct kref kref;
> +
>   	/**
>   	 * @kernel_alloc_node:
>   	 *
> @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>   		    u64 start_offset, u64 range,
>   		    u64 reserve_offset, u64 reserve_range,
>   		    const struct drm_gpuvm_ops *ops);
> -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> +
> +/**
> + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
> + * @gpuvm: the &drm_gpuvm to acquire the reference of
> + *
> + * This function acquires an additional reference to @gpuvm. It is illegal to
> + * call this without already holding a reference. No locks required.
> + */
> +static inline struct drm_gpuvm *
> +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
> +{
> +	kref_get(&gpuvm->kref);
> +
> +	return gpuvm;
> +}
> +
> +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
>   
>   bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>   bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
> @@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>    * operations to drivers.
>    */
>   struct drm_gpuvm_ops {
> +	/**
> +	 * @vm_free: called when the last reference of a struct drm_gpuvm is
> +	 * dropped
> +	 *
> +	 * This callback is mandatory.
> +	 */
> +	void (*vm_free)(struct drm_gpuvm *gpuvm);
> +
>   	/**
>   	 * @op_alloc: called when the &drm_gpuvm allocates
>   	 * a struct drm_gpuva_op
