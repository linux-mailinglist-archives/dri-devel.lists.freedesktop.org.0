Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92043231FAD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 15:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7E088FA1;
	Wed, 29 Jul 2020 13:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6A88FA1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 13:57:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so11193939wrc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R/29PFy015/uXpi4dSqxYaWJmA2pz1Gg53WlP3YCa0g=;
 b=j35N1flPew4Jww1Tb8IJV0e387RiO3MhDmjYpfW+ksGWHHRwmO0sryGiFZO3R574cQ
 Zl7zzsocakacT8kfRPQaIEnoi0bCLJ+BZQfuBT6GxXLa4UzVI8pFwoLMbCWqyTqPleYd
 kzSOUFEpz+URBzkgQIVRbrXS5M8zsv/PrgffM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R/29PFy015/uXpi4dSqxYaWJmA2pz1Gg53WlP3YCa0g=;
 b=U9xVFhFb7ZvvCcIXuSeb+KqWNsUI6WyRwBNUMcTb3NGXSmUbRVyIkHLfPEGiti82pn
 us2b2h2Yr4SAIoC3LMtntC+A0DlnD/m/Hdhb/VxcP85zE3P8+62BEC8iAzWza/ZYDX/B
 PbxLrbaHKQWSESZ7uATk5htEN4H2Lt8UkfIjNp0FNIuPy4N9AyZ2N5zKobZkL6UfVaKm
 w3wSeedTdBFZTvEY2Db3lfo03tQBIMdNCDQJ2wcNrVyMT1Mqsjh5IykMCbWs49Mg9nuz
 Mt0k4WEd8wHwF+eZsoVeAoU3P9u1x22gSSJMWkkrb4cBPfhan+fRKRWUTeJQtEXg/pOZ
 Oonw==
X-Gm-Message-State: AOAM530pnvFH2l6agFbuGNVq1k0zq7rh8P0m4XlBu8gIBfnjENIEwx+j
 9frryDMEFCtPGXHRe8Vx8QAZZg==
X-Google-Smtp-Source: ABdhPJw81SHVC2bV33/EEJI9X1YPTOYuTVPlxK2h0k/rNK78swlsymuvSQgAiER8HClFqHhqSanbnw==
X-Received: by 2002:a5d:526d:: with SMTP id l13mr28277984wrc.279.1596031066725; 
 Wed, 29 Jul 2020 06:57:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c194sm5817932wme.8.2020.07.29.06.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 06:57:46 -0700 (PDT)
Date: Wed, 29 Jul 2020 15:57:44 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 3/5] drm: Add infrastructure for vmap operations of I/O
 memory
Message-ID: <20200729135744.GQ6419@phenom.ffwll.local>
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729134148.6855-4-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, natechancellor@gmail.com, sam@ravnborg.org,
 peda@axentia.se, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 03:41:46PM +0200, Thomas Zimmermann wrote:
> Most platforms allow for accessing framebuffer I/O memory with regular
> load and store operations. Some platforms, such as sparc64, require
> the use of special instructions instead.
> 
> This patch adds vmap_iomem to struct drm_gem_object_funcs. The new
> interface drm_client_buffer_vmap_iomem() gives DRM clients access to the
> I/O memory buffer. The semantics of struct drm_gem_objcet_funcs.vmap
> change slightly. It used to return system or I/O memory. Now it is
> expected to return memory addresses that can be accessed with regular
> load and store operations. So nothing changes for existing implementations
> of GEM objects. If the GEM object also implements vmap_iomem, a call
> to vmap shall only return system memory, even if I/O memory could be
> accessed with loads and stores.
> 
> The existing interface drm_client_buffer_vmap() shall only return memory
> as given by drm_gem_vmap ((i.e., that is accessible via regular load and
> store). The new interface drm_client_buffer_vmap_iomem() shall only
> return I/O memory.
> 
> DRM clients must map buffers by calling drm_client_buffer_vmap_iomem()
> and drm_client_buffer_vmap() to get the buffer in I/O or system memory.
> Each function returns NULL if the buffer is in the other memory area.
> Depending on the type of the returned memory, clients must access the
> framebuffer with the appropriate operations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm I don't think this works, since for more dynamic framebuffers (like
real big gpu ttm drivers) this is a dynamic thing, which can change every
time we do an mmap. So I think the ttm approach of having an is_iomem flag
is a lot better.

The trouble with that is that you don't have correct checking of sparse
mappings, but oh well :-/ The one idea I've had to address that is using
something like this

typedef dma_buf_addr_t {
	bool is_iomem;
	union {
		void __iomem *vaddr_iomem;
		void vaddr;
	};
};

And then having a wrapper for memcpy_from_dma_buf_addr and
memcpy_to_dma_buf_addr, which switches between memcpy and memcpy_from/toio
depending upon the is_iomem flag.

But it's a lot more invasive unfortunately :-/
-Daniel

> ---
>  drivers/gpu/drm/drm_client.c   | 52 ++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/drm_gem.c      | 19 +++++++++++++
>  drivers/gpu/drm/drm_internal.h |  1 +
>  include/drm/drm_client.h       |  8 +++++-
>  include/drm/drm_gem.h          | 17 +++++++++--
>  5 files changed, 91 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 495f47d23d87..b5bbe089a41e 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -327,6 +327,46 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>  
> +/**
> + * drm_client_buffer_vmap_iomem - Map DRM client buffer into address space
> + * @buffer: DRM client buffer
> + *
> + * This function maps a client buffer into kernel address space. If the
> + * buffer is already mapped, it returns the mapping's address.
> + *
> + * Client buffer mappings are not ref'counted. Each call to
> + * drm_client_buffer_vmap() should be followed by a call to
> + * drm_client_buffer_vunmap(); or the client buffer should be mapped
> + * throughout its lifetime.
> + *
> + * Returns:
> + *	The mapped memory's address
> + */
> +void __iomem *drm_client_buffer_vmap_iomem(struct drm_client_buffer *buffer)
> +{
> +	void __iomem *vaddr_iomem;
> +
> +	if (buffer->vaddr_iomem)
> +		return buffer->vaddr_iomem;
> +
> +	/*
> +	 * FIXME: The dependency on GEM here isn't required, we could
> +	 * convert the driver handle to a dma-buf instead and use the
> +	 * backend-agnostic dma-buf vmap support instead. This would
> +	 * require that the handle2fd prime ioctl is reworked to pull the
> +	 * fd_install step out of the driver backend hooks, to make that
> +	 * final step optional for internal users.
> +	 */
> +	vaddr_iomem = drm_gem_vmap_iomem(buffer->gem);
> +	if (IS_ERR(vaddr_iomem))
> +		return vaddr_iomem;
> +
> +	buffer->vaddr_iomem = vaddr_iomem;
> +
> +	return vaddr_iomem;
> +}
> +EXPORT_SYMBOL(drm_client_buffer_vmap_iomem);
> +
>  /**
>   * drm_client_buffer_vunmap - Unmap DRM client buffer
>   * @buffer: DRM client buffer
> @@ -337,8 +377,16 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>   */
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>  {
> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> -	buffer->vaddr = NULL;
> +	drm_WARN_ON(buffer->client->dev, buffer->vaddr && buffer->vaddr_iomem);
> +
> +	if (buffer->vaddr) {
> +		drm_gem_vunmap(buffer->gem, buffer->vaddr);
> +		buffer->vaddr = NULL;
> +	}
> +	if (buffer->vaddr_iomem) {
> +		drm_gem_vunmap(buffer->gem, (void *)buffer->vaddr_iomem);
> +		buffer->vaddr_iomem = NULL;
> +	}
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
>  
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index a57f5379fc08..a001be8c0965 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1227,6 +1227,25 @@ void *drm_gem_vmap(struct drm_gem_object *obj)
>  		vaddr = obj->funcs->vmap(obj);
>  	else if (obj->dev->driver->gem_prime_vmap)
>  		vaddr = obj->dev->driver->gem_prime_vmap(obj);
> +	else if (obj->funcs && obj->funcs->vmap_iomem)
> +		vaddr = NULL; /* requires mapping as I/O memory */
> +	else
> +		vaddr = ERR_PTR(-EOPNOTSUPP);
> +
> +	if (!vaddr)
> +		vaddr = ERR_PTR(-ENOMEM);
> +
> +	return vaddr;
> +}
> +
> +void __iomem *drm_gem_vmap_iomem(struct drm_gem_object *obj)
> +{
> +	void __iomem *vaddr;
> +
> +	if (obj->funcs && obj->funcs->vmap_iomem)
> +		vaddr = obj->funcs->vmap_iomem(obj);
> +	else if (obj->funcs && obj->funcs->vmap)
> +		vaddr = NULL; /* requires mapping as system memory */
>  	else
>  		vaddr = ERR_PTR(-EOPNOTSUPP);
>  
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 8e01caaf95cc..aa1a3d4f9223 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -187,6 +187,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>  int drm_gem_pin(struct drm_gem_object *obj);
>  void drm_gem_unpin(struct drm_gem_object *obj);
>  void *drm_gem_vmap(struct drm_gem_object *obj);
> +void __iomem *drm_gem_vmap_iomem(struct drm_gem_object *obj);
>  void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
>  
>  /* drm_debugfs.c drm_debugfs_crc.c */
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 7aaea665bfc2..94aa075ee4b6 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -141,10 +141,15 @@ struct drm_client_buffer {
>  	struct drm_gem_object *gem;
>  
>  	/**
> -	 * @vaddr: Virtual address for the buffer
> +	 * @vaddr: Virtual address for the buffer in system memory
>  	 */
>  	void *vaddr;
>  
> +	/**
> +	 * @vaddr: Virtual address for the buffer in I/O memory
> +	 */
> +	void *vaddr_iomem;
> +
>  	/**
>  	 * @fb: DRM framebuffer
>  	 */
> @@ -156,6 +161,7 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>  void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
> +void __iomem *drm_client_buffer_vmap_iomem(struct drm_client_buffer *buffer);
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>  
>  int drm_client_modeset_create(struct drm_client_dev *client);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 337a48321705..bc735ff522a8 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -134,17 +134,28 @@ struct drm_gem_object_funcs {
>  	 * @vmap:
>  	 *
>  	 * Returns a virtual address for the buffer. Used by the
> -	 * drm_gem_dmabuf_vmap() helper.
> +	 * drm_gem_dmabuf_vmap() helper. If the buffer is not
> +	 * located in system memory, the function returns NULL.
>  	 *
>  	 * This callback is optional.
>  	 */
>  	void *(*vmap)(struct drm_gem_object *obj);
>  
> +	/**
> +	 * @vmap_iomem:
> +	 *
> +	 * Returns a virtual address for the buffer. If the buffer is not
> +	 * located in I/O memory, the function returns NULL.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void __iomem *(*vmap_iomem)(struct drm_gem_object *obj);
> +
>  	/**
>  	 * @vunmap:
>  	 *
> -	 * Releases the address previously returned by @vmap. Used by the
> -	 * drm_gem_dmabuf_vunmap() helper.
> +	 * Releases the address previously returned by @vmap or @vmap_iomem.
> +	 * Used by the drm_gem_dmabuf_vunmap() helper.
>  	 *
>  	 * This callback is optional.
>  	 */
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
