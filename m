Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECECAFEA0E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034D110E02A;
	Wed,  9 Jul 2025 13:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="afamCcjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A76D10E02A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:24:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so46534885e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752067484; x=1752672284; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q8ZEcpX08vG5mKHJ2DY3TlATtYdrsLRkRKuyHi/49s0=;
 b=afamCcjIRsNdhiIP/ue/IiwVcy3iivcV6S2gGcsG14RjFwPb4hUAOfgiAb3Vq1ad0l
 Ijz0YiHi0fC6H4NvRyakmF0xpGjSGmNX7hpDoM0am9xjvIHWRWUcZIoIFMCoqnrYp19c
 tyqo8HorFmCMfJ5uluDDd1kTormVO5NgjjRLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752067484; x=1752672284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8ZEcpX08vG5mKHJ2DY3TlATtYdrsLRkRKuyHi/49s0=;
 b=Hi13113J2FCt8g895H+yN4Umq2UV+rp9q1ENAeyxfrJPfpzCQu/qnwgTpExTyHfSd0
 V8NWKEqXGmC5Zgye7IY2JFH5FZAO+FodfasbAmJr4vYyChttvz5qvRiLMbraCRpUsIWp
 4H7RzEBqwGjotW7uvJnBrVaptaVTIw8JmHRqIsyhvb0UFW6rZjR6h0vTtUBZQsWs4G1Z
 5MDPfnFVqcYJo3GeoVz3aGErWLFC44WFnKsqb7HC1wdJUgesEyZr+y+jTcp0ke1aqsor
 QezVLrN3F7dQv0I03LGDYMeHdOC/LO/Dj6EvbC9l2gYHN9ysvey0NnwWRQbNct5G+NOy
 Ptsg==
X-Gm-Message-State: AOJu0YzP3eH71j0tTRXl7UmepDWCFJnMCKaWNd3TqGvJGPU8QZMInk1o
 h4CtGiimjDmVvFaBwi/YJNPSfKur+Q47vkgwUaD3XabPMyTJ4D/I0eOoYx1xfd6g5qA=
X-Gm-Gg: ASbGncugbRhK9p/1JDKJZZGSMj3l0OlduQg30/9jpCpKXnw+Ejd5iBAxxutLJ1lznl3
 R22GBB+QG5MlYCWTKCb18Y6lgWqfT2jiWBRls49yO2oEy0gH132XC5ZRq0jBdrBfA4wshUrmjUX
 KclrUT1DOQ89xFjAhPHIvTay3KTrmXaUHJCc/Zxcz9lgh3nyMpz50AdwlIl0MLYP6erm2APSYB+
 QWSDs4bUn9Ii0FG3h5er9+39fv3w7LVVf4b6EWlLrmzCiHa+I7r8AWykw0/tOpZ9z4bMUc3UAus
 gGEeX/SMxLsm5caKZfYpEENvX5J8/QMMWv6peQlSlBCvS5crNcavbi8M1zlNQCtnO+CEzizXWxI
 w7G+8DSGp
X-Google-Smtp-Source: AGHT+IFtLRR3PyL4xrTvin2GTlSGY66fTDck0wGN2LCmxX92i40JBLQNuwcnAINT9O3t53nOCtoSDw==
X-Received: by 2002:a05:600c:828f:b0:440:6a79:6df0 with SMTP id
 5b1f17b1804b1-454daccacbfmr1424155e9.22.1752067483489; 
 Wed, 09 Jul 2025 06:24:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d508d1e0sm23043645e9.37.2025.07.09.06.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 06:24:42 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:24:41 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Francis <David.Francis@amd.com>
Cc: dri-devel@lists.freedesktop.org, tvrtko.ursulin@igalia.com,
 Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, Christian.Koenig@amd.com,
 dcostantino@meta.com, sruffell@meta.com, simona@ffwll.ch,
 mripard@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm: Add DRM prime interface to reassign GEM handle
Message-ID: <aG5tmedCTo8mfKd6@phenom.ffwll.local>
References: <20250708193809.403141-1-David.Francis@amd.com>
 <20250708193809.403141-2-David.Francis@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708193809.403141-2-David.Francis@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jul 08, 2025 at 03:38:09PM -0400, David Francis wrote:
> CRIU restore of drm buffer objects requires the ability to create
> or import a buffer object with a specific gem handle.
> 
> Add new drm ioctl DRM_IOCTL_GEM_CHANGE_HANDLE, which takes
> the gem handle of an object and moves that object to a
> specified new gem handle.
> 
> This ioctl needs to call drm_prime_remove_buf_handle,
> but that function acquires the prime lock, which the ioctl
> needs to hold for other purposes.
> 
> Make drm_prime_remove_buf_handle not acquire the prime lock,
> and change its other caller to reflect this.

I think it'd be good to also link to the CRIU patches here so that the
use-case for this is properly recorded in git history.

> Signed-off-by: David Francis <David.Francis@amd.com>

igt testcases for this would be needed too, see:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-requirements-for-userspace-api

> ---
>  drivers/gpu/drm/drm_gem.c      | 61 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h |  4 +++
>  drivers/gpu/drm/drm_ioctl.c    |  1 +
>  drivers/gpu/drm/drm_prime.c    |  6 +---
>  include/uapi/drm/drm.h         | 17 ++++++++++
>  5 files changed, 84 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c6240bab3fa5..693ef636fb3e 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> +	mutex_lock(&file_priv->prime.lock);
> +
>  	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +
> +	mutex_unlock(&file_priv->prime.lock);
> +
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
>  	drm_gem_object_handle_put_unlocked(obj);
> @@ -888,6 +893,62 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> +/**

We generally don't kerneldoc document internal functions in drm that
aren't exported to drivers. I think better to move this into the uapi
header, which should be documented.

> + * drm_gem_change_handle_ioctl - implementation of the GEM_CHANGE_HANDLE ioctl
> + * @dev: drm_device
> + * @data: ioctl data
> + * @file_priv: drm file-private structure
> + *
> + * Change the handle of a GEM object to the specified one.
> + * The new handle must be unused. On success the old handle is closed
> + * and all further IOCTL should refer to the new handle only.
> + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> + */
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv)
> +{
> +	struct drm_gem_change_handle *args = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(file_priv, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->handle == args->new_handle)
> +		return 0;
> +
> +	mutex_lock(&file_priv->prime.lock);
> +
> +	spin_lock(&file_priv->table_lock);
> +	ret = idr_alloc(&file_priv->object_idr, obj, args->new_handle, args->new_handle + 1, GFP_NOWAIT);
> +	spin_unlock(&file_priv->table_lock);
> +
> +	if (ret < 0)
> +		goto out_unlock;
> +
> +	if (obj->dma_buf) {
> +		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
> +		if (ret < 0) {
> +			spin_lock(&file_priv->table_lock);
> +			idr_remove(&file_priv->object_idr, args->new_handle);
> +			spin_unlock(&file_priv->table_lock);
> +			goto out_unlock;
> +		}
> +
> +		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
> +	}
> +
> +	spin_lock(&file_priv->table_lock);
> +	idr_remove(&file_priv->object_idr, args->handle);
> +	spin_unlock(&file_priv->table_lock);
> +
> +out_unlock:
> +	mutex_unlock(&file_priv->prime.lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
>   * @dev: drm_device
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..e9d5cdf7e033 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -85,6 +85,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +			     struct dma_buf *dma_buf, uint32_t handle);
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				 uint32_t handle);
>  
> @@ -168,6 +170,8 @@ int drm_gem_close_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
>  int drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv);
>  int drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv);
>  void drm_gem_open(struct drm_device *dev, struct drm_file *file_private);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f593dc569d31..d8a24875a7ba 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -653,6 +653,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, drm_gem_flink_ioctl, DRM_AUTH),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, drm_gem_open_ioctl, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CHANGE_HANDLE, drm_gem_change_handle_ioctl, DRM_RENDER_ALLOW),
>  
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_mode_getresources, 0),
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index bdb51c8f262e..1f2e858e5000 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -93,7 +93,7 @@ struct drm_prime_member {
>  	struct rb_node handle_rb;
>  };
>  
> -static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				    struct dma_buf *dma_buf, uint32_t handle)
>  {
>  	struct drm_prime_member *member;
> @@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  {
>  	struct rb_node *rb;
>  
> -	mutex_lock(&prime_fpriv->lock);
> -
>  	rb = prime_fpriv->handles.rb_node;
>  	while (rb) {
>  		struct drm_prime_member *member;
> @@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  			rb = rb->rb_left;
>  		}
>  	}
> -
> -	mutex_unlock(&prime_fpriv->lock);
>  }
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..84c819c171d2 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,6 +625,15 @@ struct drm_gem_open {
>  	__u64 size;
>  };
>  
> +/* DRM_IOCTL_GEM_CHANGE_HANDLE ioctl argument type */
> +struct drm_gem_change_handle {

Please give this struct a full blown kerneldoc comment that explains how
it works and why you want to use this. Also link with the #define below
and make sure it all renders correctly with make htmldocs.

Since you're touching this area I think I'd be really nice to also
document the related gem ioctls so that the new docs aren't entirely
floating around in vacuum.

Thanks, Sima

> +	/** Current handle of object */
> +	__u32 handle;
> +
> +	/** Handle to change that object to */
> +	__u32 new_handle;
> +};
> +
>  /**
>   * DRM_CAP_DUMB_BUFFER
>   *
> @@ -1305,6 +1314,14 @@ extern "C" {
>   */
>  #define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
>  
> +/**
> + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> + *
> + * Some applications (notably CRIU) need objects to have specific gem handles.
> + * This ioctl changes the object at one gem handle to use a new gem handle.
> + */
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
