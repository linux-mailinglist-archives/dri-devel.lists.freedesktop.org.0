Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEAF2D72BF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 10:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDF06ECF8;
	Fri, 11 Dec 2020 09:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B486ECF8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 09:24:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so7885437wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 01:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Noiq8gsKgg/LmPBYtG4VjMmp/kERyYyDVQNSE22eDBs=;
 b=YJTmE9P6FWKESCHT99NVZ48X2FPzRfEvuv+TaYJap8W61ad8HrhmTIkP4DISixS4YH
 UwqC6CzRL/7k1wrePt0hA0EvJdpbQCpzFbeeAin/yNfw+d8JdaTCNbwvqkPgkXharbDz
 9YXL0Kl4jgi4VLGQEZ+/rDxK5G6k1TeQRprHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Noiq8gsKgg/LmPBYtG4VjMmp/kERyYyDVQNSE22eDBs=;
 b=WPxzJDrca2nE/8taEAr7OrUYLuecqkb1jq95926qE7FB2krJynMFYutVxk8FSxaF15
 ox2IbnCtkVJA2dxiZ64xDRLV7zOmkT1GK8M2V2qpQXrvyv8MuqPFvhmAK0h4HcqIBh+t
 bKxuF6m/ahy0lMwWxPJ0+/eQ4QWDBKMqyy8eGO6ECHAxvLoI0xEnJY2PnkCD2VH7ZFF7
 lw5BEPnXcEjtEdHzjD65DCNyAnBQF8r/FwYkd+iGVAi+jciURwoVT75SzrmMw6mS7Yc6
 bZbrpjJzdmtKGe4rDZrSYCmiPbr4WBwTrjbwhZhySdCWywz0uphoLWsRyrt5XITR+zOz
 C2/g==
X-Gm-Message-State: AOAM532t1trJlapmPU/JVnOrhZOATiDbxqS9CcYhXO7//PGVmk0IXGEY
 xZu5nQnm1hKXOyPBTaIE7gB6JA==
X-Google-Smtp-Source: ABdhPJwvltxF9wGnEXSjhojgpoMzESfVQ1Ad7xV1kWlQXLVSKVgbKNI49bhVbctGtSZoQ6qoyon36w==
X-Received: by 2002:a1c:2d8a:: with SMTP id
 t132mr12747335wmt.128.1607678690518; 
 Fri, 11 Dec 2020 01:24:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 65sm13809325wri.95.2020.12.11.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 01:24:49 -0800 (PST)
Date: Fri, 11 Dec 2020 10:24:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/8] dma-buf: Add vmap_local and vnumap_local operations
Message-ID: <20201211092447.GI401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209142527.26415-4-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 03:25:22PM +0100, Thomas Zimmermann wrote:
> The existing dma-buf calls dma_buf_vmap() and dma_buf_vunmap() are
> allowed to pin the buffer or acquire the buffer's reservation object
> lock.
> 
> This is a problem for callers that only require a short-term mapping
> of the buffer without the pinning, or callers that have special locking
> requirements. These may suffer from unnecessary overhead or interfere
> with regular pin operations.
> 
> The new interfaces dma_buf_vmap_local(), dma_buf_vunmapo_local(), and
> their rsp callbacks in struct dma_buf_ops provide an alternative without
> pinning or reservation locking. Callers are responsible for these
> operations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/dma-buf/dma-buf.c | 80 +++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf.h   | 34 +++++++++++++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e63684d4cd90..be9f80190a66 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1265,6 +1265,86 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>  
> +/**
> + * dma_buf_vmap_local - Create virtual mapping for the buffer object into kernel
> + * address space.
> + * @dmabuf:	[in]	buffer to vmap
> + * @map:	[out]	returns the vmap pointer
> + *
> + * This call may fail due to lack of virtual mapping address space.
> + * These calls are optional in drivers. The intended use for them
> + * is for mapping objects linear in kernel space for high use objects.
> + * Please attempt to use kmap/kunmap before thinking about these interfaces.

Kmap is gone, so the entire 2 sentences here are no longer needed. Maybe
mention something like "Unlike dma_buf_vmap() this is a short term mapping
and will not pin the buffer. The struct dma_resv for the @dmabuf must be
locked until dma_buf_vunmap_local() is called."


> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
> +{
> +	struct dma_buf_map ptr;
> +	int ret = 0;
> +
> +	dma_buf_map_clear(map);
> +
> +	if (WARN_ON(!dmabuf))
> +		return -EINVAL;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	if (!dmabuf->ops->vmap_local)
> +		return -EINVAL;
> +
> +	mutex_lock(&dmabuf->lock);
> +	if (dmabuf->vmapping_counter) {
> +		dmabuf->vmapping_counter++;
> +		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> +		*map = dmabuf->vmap_ptr;
> +		goto out_unlock;
> +	}
> +
> +	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
> +
> +	ret = dmabuf->ops->vmap_local(dmabuf, &ptr);
> +	if (WARN_ON_ONCE(ret))
> +		goto out_unlock;
> +
> +	dmabuf->vmap_ptr = ptr;
> +	dmabuf->vmapping_counter = 1;
> +
> +	*map = dmabuf->vmap_ptr;
> +
> +out_unlock:
> +	mutex_unlock(&dmabuf->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_vmap_local);
> +
> +/**
> + * dma_buf_vunmap_local - Unmap a vmap obtained by dma_buf_vmap_local.
> + * @dmabuf:	[in]	buffer to vunmap
> + * @map:	[in]	vmap pointer to vunmap

Maybe for hyperlinking add "Release a mapping established with
dma_buf_vmap_local()."
> + */
> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
> +{
> +	if (WARN_ON(!dmabuf))
> +		return;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> +	BUG_ON(dmabuf->vmapping_counter == 0);
> +	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
> +
> +	mutex_lock(&dmabuf->lock);
> +	if (--dmabuf->vmapping_counter == 0) {
> +		if (dmabuf->ops->vunmap_local)
> +			dmabuf->ops->vunmap_local(dmabuf, map);
> +		dma_buf_map_clear(&dmabuf->vmap_ptr);
> +	}
> +	mutex_unlock(&dmabuf->lock);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_vunmap_local);
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index cf72699cb2bc..f66580d23a9b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -269,6 +269,38 @@ struct dma_buf_ops {
>  
>  	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @vmap_local:
> +	 *
> +	 * Creates a virtual mapping for the buffer into kernel address space.
> +	 *
> +	 * This callback establishes short-term mappings for situations where
> +	 * callers only use the buffer for a bounded amount of time; such as
> +	 * updates to the framebuffer or reading back contained information.
> +	 * In contrast to the regular @vmap callback, vmap_local does never pin
> +	 * the buffer to a specific domain or acquire the buffer's reservation
> +	 * lock.
> +	 *
> +	 * This is called with the dmabuf->resv object locked. Callers must hold

				^^Not the right kerneldoc, I think it
				should be &dma_buf.resv to get the
				hyperlink.

> +	 * the lock until after removing the mapping with @vunmap_local.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*vmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @vunmap_local:
> +	 *
> +	 * Removes a virtual mapping that wa sestablished by @vmap_local.

					     ^^established
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*vunmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  };
>  
>  /**
> @@ -506,4 +538,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>  		 unsigned long);
>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  #endif /* __DMA_BUF_H__ */


With the doc nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
