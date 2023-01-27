Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52567EBCB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 18:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC43410E9AF;
	Fri, 27 Jan 2023 17:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE6310E9AF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 17:00:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so5854534wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 09:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CZtt5s3IqiZ5RLxjtJ1pV/c8mrzc1zVNDq6Rym4EIZ4=;
 b=bCas/iA7ybcTji39nRwGj94Hgz8HusEKkjQdfgtG3HQX5/GIJK/jPz7DhRUdTncVNv
 0NoKCo651umDVNWSYvtmFgTd+heRqbL6nA7gdGYcD7gxxyzI2yDomrj8i9wKpflNNsVg
 R7T4UmEglsQ9MC0VXx3+gDqgVEjvLJrXGv2Otpxon/JWBjaQx7CujufRlJ6z0KW8Bkc9
 u9mh76aOT5JnWBAE5/yfxopAyJaUfkXo0HAIt+dm9i9ihY6zdcUcT42yHl77Zvb8+Ho8
 MI0zCn6HaekgG5roc3Sz24J85Ipd6LEQU4GLRekQu0To9N5g2qkxLkV2MfB0AxDZmAq7
 O6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CZtt5s3IqiZ5RLxjtJ1pV/c8mrzc1zVNDq6Rym4EIZ4=;
 b=hsSKHrePdsLIO++TrxZMQxGKSJIYAycmAdXyI8PuTRbBgL/5dD4rWHnNayCMw/8TKy
 otRGlz+q1uVSE9IR/DtvcLTQOpZVMr9YFhybDeHWOYzsLGifdJt6GAJPfdmyvF0JM73v
 yeC0T7DQGMaztHBxzWAuX4Uyl2f/WS5BE8/Vx5D9m522QfSKuJjboY+eQrD51w8MBZiu
 V1uGR4BGp5fqFBClBthw/8lIB4zBYOYomSlduj8yVaxRKyPE68NXiQcGRqcLRuJBcKrG
 9n6NWX7Y1+b1uFDnFAwQT50yyCNLZp7xgbQhsZQolXRMbwji42WQ9tOfrqL5Yj/qPCsY
 +LLg==
X-Gm-Message-State: AO0yUKWFJfauVATFwvxAXad+pUbAXNNS9vn5sEMmyR3Y4gU3Btel9MhZ
 KpNlxic9OUovVfwF7OXWL/E=
X-Google-Smtp-Source: AK7set/vOR/tX2+33qLtYgXaqJBanK+mbhtZB9Z5/PFvDYTzN/Js5TkR/q2SI+cQotymP7RqfbLjwg==
X-Received: by 2002:a05:600c:3d87:b0:3dc:3c98:c105 with SMTP id
 bi7-20020a05600c3d8700b003dc3c98c105mr2309693wmb.14.1674838818560; 
 Fri, 27 Jan 2023 09:00:18 -0800 (PST)
Received: from [192.168.2.181] (46-10-148-141.ip.btc-net.bg. [46.10.148.141])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a7bc8c1000000b003c6bbe910fdsm9755462wml.9.2023.01.27.09.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 09:00:17 -0800 (PST)
Message-ID: <e62178a8-e75a-366f-ced3-263d8dfd2b58@gmail.com>
Date: Fri, 27 Jan 2023 19:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/7] drm/vmwgfx: Remove the duplicate bo_free function
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230126173813.602748-1-zack@kde.org>
 <20230126173813.602748-3-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230126173813.602748-3-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM!
Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,
Martin


On 26.01.23 г. 19:38 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Remove the explicit bo_free parameter which was switching between
> vmw_bo_bo_free and vmw_gem_destroy which had exactly the same
> implementation.
>
> It makes no sense to keep parameter which is always the same, remove it
> and all code referencing it. Instead use the vmw_bo_bo_free directly.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       | 49 ++++++++++--------------
>   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c      |  3 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |  6 +--
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c      | 18 +--------
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  3 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c     |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   |  2 +-
>   8 files changed, 27 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index aa1cd5126a32..8aaeeecd2016 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -46,6 +46,22 @@ vmw_buffer_object(struct ttm_buffer_object *bo)
>   	return container_of(bo, struct vmw_buffer_object, base);
>   }
>   
> +/**
> + * vmw_bo_bo_free - vmw buffer object destructor
> + *
> + * @bo: Pointer to the embedded struct ttm_buffer_object
> + */
> +static void vmw_bo_bo_free(struct ttm_buffer_object *bo)
> +{
> +	struct vmw_buffer_object *vmw_bo = vmw_buffer_object(bo);
> +
> +	WARN_ON(vmw_bo->dirty);
> +	WARN_ON(!RB_EMPTY_ROOT(&vmw_bo->res_tree));
> +	vmw_bo_unmap(vmw_bo);
> +	drm_gem_object_release(&bo->base);
> +	kfree(vmw_bo);
> +}
> +
>   /**
>    * bo_is_vmw - check if the buffer object is a &vmw_buffer_object
>    * @bo: ttm buffer object to be checked
> @@ -58,8 +74,7 @@ vmw_buffer_object(struct ttm_buffer_object *bo)
>    */
>   static bool bo_is_vmw(struct ttm_buffer_object *bo)
>   {
> -	return bo->destroy == &vmw_bo_bo_free ||
> -	       bo->destroy == &vmw_gem_destroy;
> +	return bo->destroy == &vmw_bo_bo_free;
>   }
>   
>   /**
> @@ -376,23 +391,6 @@ void vmw_bo_unmap(struct vmw_buffer_object *vbo)
>   	ttm_bo_kunmap(&vbo->map);
>   }
>   
> -
> -/**
> - * vmw_bo_bo_free - vmw buffer object destructor
> - *
> - * @bo: Pointer to the embedded struct ttm_buffer_object
> - */
> -void vmw_bo_bo_free(struct ttm_buffer_object *bo)
> -{
> -	struct vmw_buffer_object *vmw_bo = vmw_buffer_object(bo);
> -
> -	WARN_ON(vmw_bo->dirty);
> -	WARN_ON(!RB_EMPTY_ROOT(&vmw_bo->res_tree));
> -	vmw_bo_unmap(vmw_bo);
> -	drm_gem_object_release(&bo->base);
> -	kfree(vmw_bo);
> -}
> -
>   /* default destructor */
>   static void vmw_bo_default_destroy(struct ttm_buffer_object *bo)
>   {
> @@ -449,13 +447,10 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
>   int vmw_bo_create(struct vmw_private *vmw,
>   		  size_t size, struct ttm_placement *placement,
>   		  bool interruptible, bool pin,
> -		  void (*bo_free)(struct ttm_buffer_object *bo),
>   		  struct vmw_buffer_object **p_bo)
>   {
>   	int ret;
>   
> -	BUG_ON(!bo_free);
> -
>   	*p_bo = kmalloc(sizeof(**p_bo), GFP_KERNEL);
>   	if (unlikely(!*p_bo)) {
>   		DRM_ERROR("Failed to allocate a buffer.\n");
> @@ -463,8 +458,7 @@ int vmw_bo_create(struct vmw_private *vmw,
>   	}
>   
>   	ret = vmw_bo_init(vmw, *p_bo, size,
> -			  placement, interruptible, pin,
> -			  bo_free);
> +			  placement, interruptible, pin);
>   	if (unlikely(ret != 0))
>   		goto out_error;
>   
> @@ -484,7 +478,6 @@ int vmw_bo_create(struct vmw_private *vmw,
>    * @placement: Initial placement.
>    * @interruptible: Whether waits should be performed interruptible.
>    * @pin: If the BO should be created pinned at a fixed location.
> - * @bo_free: The buffer object destructor.
>    * Returns: Zero on success, negative error code on error.
>    *
>    * Note that on error, the code will free the buffer object.
> @@ -492,8 +485,7 @@ int vmw_bo_create(struct vmw_private *vmw,
>   int vmw_bo_init(struct vmw_private *dev_priv,
>   		struct vmw_buffer_object *vmw_bo,
>   		size_t size, struct ttm_placement *placement,
> -		bool interruptible, bool pin,
> -		void (*bo_free)(struct ttm_buffer_object *bo))
> +		bool interruptible, bool pin)
>   {
>   	struct ttm_operation_ctx ctx = {
>   		.interruptible = interruptible,
> @@ -503,7 +495,6 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>   	struct drm_device *vdev = &dev_priv->drm;
>   	int ret;
>   
> -	WARN_ON_ONCE(!bo_free);
>   	memset(vmw_bo, 0, sizeof(*vmw_bo));
>   	BUILD_BUG_ON(TTM_MAX_BO_PRIORITY <= 3);
>   	vmw_bo->base.priority = 3;
> @@ -513,7 +504,7 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>   	drm_gem_private_object_init(vdev, &vmw_bo->base.base, size);
>   
>   	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, ttm_bo_type_device,
> -				   placement, 0, &ctx, NULL, NULL, bo_free);
> +				   placement, 0, &ctx, NULL, NULL, vmw_bo_bo_free);
>   	if (unlikely(ret)) {
>   		return ret;
>   	}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index b78a10312fad..87455446a6f9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -424,7 +424,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>   	 * we can use tryreserve without failure.
>   	 */
>   	ret = vmw_bo_create(dev_priv, new_size, &vmw_mob_placement,
> -			    true, true, vmw_bo_bo_free, &buf);
> +			    true, true, &buf);
>   	if (ret) {
>   		DRM_ERROR("Failed initializing new cotable MOB.\n");
>   		goto out_done;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index e0c2e3748015..7272aff7855d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -398,8 +398,7 @@ static int vmw_dummy_query_bo_create(struct vmw_private *dev_priv)
>   	 * user of the bo currently.
>   	 */
>   	ret = vmw_bo_create(dev_priv, PAGE_SIZE,
> -			    &vmw_sys_placement, false, true,
> -			    &vmw_bo_bo_free, &vbo);
> +			    &vmw_sys_placement, false, true, &vbo);
>   	if (unlikely(ret != 0))
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 4dfa5044a9e7..3e8ab2ce5b94 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -891,7 +891,6 @@ extern int vmw_bo_unpin(struct vmw_private *vmw_priv,
>   extern void vmw_bo_get_guest_ptr(const struct ttm_buffer_object *buf,
>   				 SVGAGuestPtr *ptr);
>   extern void vmw_bo_pin_reserved(struct vmw_buffer_object *bo, bool pin);
> -extern void vmw_bo_bo_free(struct ttm_buffer_object *bo);
>   extern int vmw_bo_create_kernel(struct vmw_private *dev_priv,
>   				unsigned long size,
>   				struct ttm_placement *placement,
> @@ -899,13 +898,11 @@ extern int vmw_bo_create_kernel(struct vmw_private *dev_priv,
>   extern int vmw_bo_create(struct vmw_private *dev_priv,
>   			 size_t size, struct ttm_placement *placement,
>   			 bool interruptible, bool pin,
> -			 void (*bo_free)(struct ttm_buffer_object *bo),
>   			 struct vmw_buffer_object **p_bo);
>   extern int vmw_bo_init(struct vmw_private *dev_priv,
>   		       struct vmw_buffer_object *vmw_bo,
>   		       size_t size, struct ttm_placement *placement,
> -		       bool interruptible, bool pin,
> -		       void (*bo_free)(struct ttm_buffer_object *bo));
> +		       bool interruptible, bool pin);
>   extern int vmw_bo_unref_ioctl(struct drm_device *dev, void *data,
>   			      struct drm_file *file_priv);
>   extern int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
> @@ -980,7 +977,6 @@ extern int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>   					     struct vmw_buffer_object **p_vbo);
>   extern int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
>   				       struct drm_file *filp);
> -extern void vmw_gem_destroy(struct ttm_buffer_object *bo);
>   extern void vmw_debugfs_gem_init(struct vmw_private *vdev);
>   
>   /**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index ba4ddd9f7a7e..ae39029fec4a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -125,22 +125,6 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>   	.vm_ops = &vmw_vm_ops,
>   };
>   
> -/**
> - * vmw_gem_destroy - vmw buffer object destructor
> - *
> - * @bo: Pointer to the embedded struct ttm_buffer_object
> - */
> -void vmw_gem_destroy(struct ttm_buffer_object *bo)
> -{
> -	struct vmw_buffer_object *vbo = vmw_buffer_object(bo);
> -
> -	WARN_ON(vbo->dirty);
> -	WARN_ON(!RB_EMPTY_ROOT(&vbo->res_tree));
> -	vmw_bo_unmap(vbo);
> -	drm_gem_object_release(&vbo->base.base);
> -	kfree(vbo);
> -}
> -
>   int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>   				      struct drm_file *filp,
>   				      uint32_t size,
> @@ -153,7 +137,7 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>   			    (dev_priv->has_mob) ?
>   				    &vmw_sys_placement :
>   				    &vmw_vram_sys_placement,
> -			    true, false, &vmw_gem_destroy, p_vbo);
> +			    true, false, p_vbo);
>   
>   	(*p_vbo)->base.base.funcs = &vmw_gem_object_funcs;
>   	if (ret != 0)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index c7d645e5ec7b..5879e8b9950a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -332,8 +332,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
>   
>   	ret = vmw_bo_create(res->dev_priv, res->backup_size,
>   			    res->func->backup_placement,
> -			    interruptible, false,
> -			    &vmw_bo_bo_free, &backup);
> +			    interruptible, false, &backup);
>   	if (unlikely(ret != 0))
>   		goto out_no_bo;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> index e1f36a09c59c..e51a63c05943 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -445,7 +445,7 @@ vmw_sou_primary_plane_prepare_fb(struct drm_plane *plane,
>   	vmw_overlay_pause_all(dev_priv);
>   	ret = vmw_bo_create(dev_priv, size,
>   			    &vmw_vram_placement,
> -			    false, true, &vmw_bo_bo_free, &vps->bo);
> +			    false, true, &vps->bo);
>   	vmw_overlay_resume_all(dev_priv);
>   	if (ret) {
>   		vps->bo = NULL; /* vmw_bo_init frees on error */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> index 108a496b5d18..93b1400aed4a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -893,7 +893,7 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
>   		return -EINVAL;
>   
>   	ret = vmw_bo_create(dev_priv, size, &vmw_sys_placement,
> -			    true, true, vmw_bo_bo_free, &buf);
> +			    true, true, &buf);
>   	if (unlikely(ret != 0))
>   		goto out;
>   
