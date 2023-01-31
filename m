Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD5683AB4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 00:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA74F10E0E3;
	Tue, 31 Jan 2023 23:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BF010E0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 23:50:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 7573832002E2;
 Tue, 31 Jan 2023 18:50:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 31 Jan 2023 18:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1675209019; x=
 1675295419; bh=c7U2/nqIZOFDd1o8gfU6y5BzsVwyphnyJZMLQxM6gtM=; b=J
 OMt6RnzotHKuFZFJWQm49r5PYxe9xbwv2pTxRuXM1/5/U7ouiUjaoy/BeilsIZli
 fV6GOeBHl7QH47V+GnQYSjw9eMenniSFA7ZDF0iU7wjaX77Vdy9QK2IvKCfwbRQe
 7bHAD2fnGnR2szDyrqM9rhewSoscdbPTzArqGUqAAdu1thD4Jb7rVcV+NoXlASxa
 ChFPOwV2j/DkY+TsyUemrEteAMKzXrZoplnU3cOLl0UGqNpG8AFJQnjTPpxcjFGQ
 KbZVlm6plAhj/Wu6NbAaiMYVu264hsDVx5NbBxCRho7uvqmtRsL7zE0TevCUYMkX
 rTpayb8sdXyFqZHRefHvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675209019; x=
 1675295419; bh=c7U2/nqIZOFDd1o8gfU6y5BzsVwyphnyJZMLQxM6gtM=; b=h
 CHAKJXFP6V1PtLlYFqKKGWHyXKsNV/AT4ZHikibskzWVT1Qn/jACY5y09wUal38r
 UzdoqW7ZJndTgRyG7SwKWHTQvxGCqhm/SmS+uia6oH2Bq1ok1gVbatJ4pTZlYARd
 W9GZ2QNFQbi2XQW1ERzVKtc1WNOrJxzSAbdE0lQF2utmjl4KXKFzv1+wO3A1HnXd
 HEJxlSl19prFDMUjLpdJ2J+STkfGH0+wKJ0trVzfct+Vd/HjLRUP9lUbEMvDVv1w
 LdyWAuzRDJ7zhRZuiClLB4kymBWCBh85bnVg5Pu4J7rMmf4dhMkwidgVOUDhTbTG
 N/PLD02aAkIoPFUnoid9A==
X-ME-Sender: <xms:OqnZY-P-WvybcVzcp-6BFHu9mz7Cm6Lf7m5KY7XhNMP_JiRaZqj50A>
 <xme:OqnZY8-U-E4vXO0VJqSBNYOC4WGWjXnORvm_pwnSX8-UaBVuY7J-RHy5CNJuk27nu
 Zd43XqPE-MGmzdacD4>
X-ME-Received: <xmr:OqnZY1SuvZ0o7-nN_Vr1mqYQQ9zsG27CQtcw9HK5gLon9bxcMSPRZAuZPCXUZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpedfmgdf
 ofgrrgiiucfoohhmsggrshgrfigrlhgrucdlggfofigrrhgvmddfuceomhgrrgiimhesfh
 grshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhgedvvdfguedtteeh
 ffejlefhgfdufeduueejvdevheevuefhtefhtdejffenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrggriihmsehfrghsthhmrghilhdrtgho
 mh
X-ME-Proxy: <xmx:OqnZY-sdtmbDBLFvb0z9KsHf2qj7Iqr07RECoXM_aoZBD1LKJfukfw>
 <xmx:OqnZY2ejU_XOFsA3iEPH7y5nSMcUkkoHppxoAHorZwPEd20Kj9tNHQ>
 <xmx:OqnZYy25RQ8cgizAG1hLPFdAUgY-3mjWNhWw-FL_l_5QSrzROznoTA>
 <xmx:OqnZY243KeLd8es4nTxGh2_lMATvvmYpwGdscyLih-q-oTPPEA6FPw>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 18:50:18 -0500 (EST)
Message-ID: <ef562dc4-d479-4cf3-796f-19cce23902bb@fastmail.com>
Date: Tue, 31 Jan 2023 15:50:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/8] drm/vmwgfx: Remove the duplicate bo_free function
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-3-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20230131033542.953249-3-zack@kde.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 1/30/23 19:35, Zack Rusin wrote:
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
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       | 49 ++++++++++--------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c      |  3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |  6 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c      | 18 +--------
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c     |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   |  2 +-
>  8 files changed, 27 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index aa1cd5126a32..8aaeeecd2016 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -46,6 +46,22 @@ vmw_buffer_object(struct ttm_buffer_object *bo)
>  	return container_of(bo, struct vmw_buffer_object, base);
>  }
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
>  /**
>   * bo_is_vmw - check if the buffer object is a &vmw_buffer_object
>   * @bo: ttm buffer object to be checked
> @@ -58,8 +74,7 @@ vmw_buffer_object(struct ttm_buffer_object *bo)
>   */
>  static bool bo_is_vmw(struct ttm_buffer_object *bo)
>  {
> -	return bo->destroy == &vmw_bo_bo_free ||
> -	       bo->destroy == &vmw_gem_destroy;
> +	return bo->destroy == &vmw_bo_bo_free;
>  }
>  
>  /**
> @@ -376,23 +391,6 @@ void vmw_bo_unmap(struct vmw_buffer_object *vbo)
>  	ttm_bo_kunmap(&vbo->map);
>  }
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
>  /* default destructor */
>  static void vmw_bo_default_destroy(struct ttm_buffer_object *bo)
>  {
> @@ -449,13 +447,10 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
>  int vmw_bo_create(struct vmw_private *vmw,
>  		  size_t size, struct ttm_placement *placement,
>  		  bool interruptible, bool pin,
> -		  void (*bo_free)(struct ttm_buffer_object *bo),
>  		  struct vmw_buffer_object **p_bo)
>  {
>  	int ret;
>  
> -	BUG_ON(!bo_free);
> -
>  	*p_bo = kmalloc(sizeof(**p_bo), GFP_KERNEL);
>  	if (unlikely(!*p_bo)) {
>  		DRM_ERROR("Failed to allocate a buffer.\n");
> @@ -463,8 +458,7 @@ int vmw_bo_create(struct vmw_private *vmw,
>  	}
>  
>  	ret = vmw_bo_init(vmw, *p_bo, size,
> -			  placement, interruptible, pin,
> -			  bo_free);
> +			  placement, interruptible, pin);
>  	if (unlikely(ret != 0))
>  		goto out_error;
>  
> @@ -484,7 +478,6 @@ int vmw_bo_create(struct vmw_private *vmw,
>   * @placement: Initial placement.
>   * @interruptible: Whether waits should be performed interruptible.
>   * @pin: If the BO should be created pinned at a fixed location.
> - * @bo_free: The buffer object destructor.
>   * Returns: Zero on success, negative error code on error.
>   *
>   * Note that on error, the code will free the buffer object.
> @@ -492,8 +485,7 @@ int vmw_bo_create(struct vmw_private *vmw,
>  int vmw_bo_init(struct vmw_private *dev_priv,
>  		struct vmw_buffer_object *vmw_bo,
>  		size_t size, struct ttm_placement *placement,
> -		bool interruptible, bool pin,
> -		void (*bo_free)(struct ttm_buffer_object *bo))
> +		bool interruptible, bool pin)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = interruptible,
> @@ -503,7 +495,6 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>  	struct drm_device *vdev = &dev_priv->drm;
>  	int ret;
>  
> -	WARN_ON_ONCE(!bo_free);
>  	memset(vmw_bo, 0, sizeof(*vmw_bo));
>  	BUILD_BUG_ON(TTM_MAX_BO_PRIORITY <= 3);
>  	vmw_bo->base.priority = 3;
> @@ -513,7 +504,7 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>  	drm_gem_private_object_init(vdev, &vmw_bo->base.base, size);
>  
>  	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, ttm_bo_type_device,
> -				   placement, 0, &ctx, NULL, NULL, bo_free);
> +				   placement, 0, &ctx, NULL, NULL, vmw_bo_bo_free);
>  	if (unlikely(ret)) {
>  		return ret;
>  	}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index b78a10312fad..87455446a6f9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -424,7 +424,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>  	 * we can use tryreserve without failure.
>  	 */
>  	ret = vmw_bo_create(dev_priv, new_size, &vmw_mob_placement,
> -			    true, true, vmw_bo_bo_free, &buf);
> +			    true, true, &buf);
>  	if (ret) {
>  		DRM_ERROR("Failed initializing new cotable MOB.\n");
>  		goto out_done;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index e0c2e3748015..7272aff7855d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -398,8 +398,7 @@ static int vmw_dummy_query_bo_create(struct vmw_private *dev_priv)
>  	 * user of the bo currently.
>  	 */
>  	ret = vmw_bo_create(dev_priv, PAGE_SIZE,
> -			    &vmw_sys_placement, false, true,
> -			    &vmw_bo_bo_free, &vbo);
> +			    &vmw_sys_placement, false, true, &vbo);
>  	if (unlikely(ret != 0))
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 4dfa5044a9e7..3e8ab2ce5b94 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -891,7 +891,6 @@ extern int vmw_bo_unpin(struct vmw_private *vmw_priv,
>  extern void vmw_bo_get_guest_ptr(const struct ttm_buffer_object *buf,
>  				 SVGAGuestPtr *ptr);
>  extern void vmw_bo_pin_reserved(struct vmw_buffer_object *bo, bool pin);
> -extern void vmw_bo_bo_free(struct ttm_buffer_object *bo);
>  extern int vmw_bo_create_kernel(struct vmw_private *dev_priv,
>  				unsigned long size,
>  				struct ttm_placement *placement,
> @@ -899,13 +898,11 @@ extern int vmw_bo_create_kernel(struct vmw_private *dev_priv,
>  extern int vmw_bo_create(struct vmw_private *dev_priv,
>  			 size_t size, struct ttm_placement *placement,
>  			 bool interruptible, bool pin,
> -			 void (*bo_free)(struct ttm_buffer_object *bo),
>  			 struct vmw_buffer_object **p_bo);
>  extern int vmw_bo_init(struct vmw_private *dev_priv,
>  		       struct vmw_buffer_object *vmw_bo,
>  		       size_t size, struct ttm_placement *placement,
> -		       bool interruptible, bool pin,
> -		       void (*bo_free)(struct ttm_buffer_object *bo));
> +		       bool interruptible, bool pin);
>  extern int vmw_bo_unref_ioctl(struct drm_device *dev, void *data,
>  			      struct drm_file *file_priv);
>  extern int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
> @@ -980,7 +977,6 @@ extern int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>  					     struct vmw_buffer_object **p_vbo);
>  extern int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
>  				       struct drm_file *filp);
> -extern void vmw_gem_destroy(struct ttm_buffer_object *bo);
>  extern void vmw_debugfs_gem_init(struct vmw_private *vdev);
>  
>  /**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index ba4ddd9f7a7e..ae39029fec4a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -125,22 +125,6 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>  	.vm_ops = &vmw_vm_ops,
>  };
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
>  int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>  				      struct drm_file *filp,
>  				      uint32_t size,
> @@ -153,7 +137,7 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>  			    (dev_priv->has_mob) ?
>  				    &vmw_sys_placement :
>  				    &vmw_vram_sys_placement,
> -			    true, false, &vmw_gem_destroy, p_vbo);
> +			    true, false, p_vbo);
>  
>  	(*p_vbo)->base.base.funcs = &vmw_gem_object_funcs;
>  	if (ret != 0)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index c7d645e5ec7b..5879e8b9950a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -332,8 +332,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
>  
>  	ret = vmw_bo_create(res->dev_priv, res->backup_size,
>  			    res->func->backup_placement,
> -			    interruptible, false,
> -			    &vmw_bo_bo_free, &backup);
> +			    interruptible, false, &backup);
>  	if (unlikely(ret != 0))
>  		goto out_no_bo;
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> index e1f36a09c59c..e51a63c05943 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -445,7 +445,7 @@ vmw_sou_primary_plane_prepare_fb(struct drm_plane *plane,
>  	vmw_overlay_pause_all(dev_priv);
>  	ret = vmw_bo_create(dev_priv, size,
>  			    &vmw_vram_placement,
> -			    false, true, &vmw_bo_bo_free, &vps->bo);
> +			    false, true, &vps->bo);
>  	vmw_overlay_resume_all(dev_priv);
>  	if (ret) {
>  		vps->bo = NULL; /* vmw_bo_init frees on error */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> index 108a496b5d18..93b1400aed4a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -893,7 +893,7 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
>  		return -EINVAL;
>  
>  	ret = vmw_bo_create(dev_priv, size, &vmw_sys_placement,
> -			    true, true, vmw_bo_bo_free, &buf);
> +			    true, true, &buf);
>  	if (unlikely(ret != 0))
>  		goto out;
>  

LGTM!

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>

-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

