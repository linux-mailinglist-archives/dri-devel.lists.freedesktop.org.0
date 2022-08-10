Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A17D58EB4C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 13:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D252B318B;
	Wed, 10 Aug 2022 11:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A9BB1979;
 Wed, 10 Aug 2022 11:30:46 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id uj29so27266511ejc.0;
 Wed, 10 Aug 2022 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=dEWvHa33UtEQZakAjRcTyVj6RCu0Nkbbp24JNYA0nSM=;
 b=Pj9WjetNUoKtXtinHgQlM5yWj0emKQxTS/qFW2XLv7IfSgj5x+mLRHJg4Pr68y+acN
 yP0TujFtSoB5DLJywFbze3fMiQWqJHiHYfh5b9Sgj8LBoQY1I1GQIOfOwJm1n+GFhjMf
 pA3D7K5LWg72S/rdZOPenB8BpF87S1uhZntSrj/bM2JJGcikaCDX93zJuvHzONzf+e0P
 8ZbK4hDS+NUQpok4FFCG+DAODhy9O6pIawiIbi/jxsN9go2L6dC2VqnGGtdZkkIXwAUP
 rDgkWtUUa9VVuFSxr/cndh3cUeAghKWleXO1livvFlyssfSjajW62aewwRQs+9+DfrpJ
 /vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=dEWvHa33UtEQZakAjRcTyVj6RCu0Nkbbp24JNYA0nSM=;
 b=0KGTUFl0lFMs99QBeo5J6Zo/WBE6R0a3/1VvPdjd43QqrR9gAouw94Mt4g3SBWAoKc
 SN2pJdXoD6cBbWC9UypAj8kOCuXGxyB0WhrJaQFcQNtawg95Ox7AgAxAUqoK6adEP3YQ
 gJ5EWak3oyuyoYntdcVcbDOscTHJEYDOoM1MxxjuBxwTd6W9j7sGmJrgEElv5v6w/fF4
 ExWT1fMa7XWe81k0hWn9BUklGPGGjeW5u/jSUlsi0+JApSDORmlJz22PpIfyiWao3Ugl
 48nycfDzyOm7S8E42C0S+00qQvqBXQHnr7qzptNom2QWWScOR47Iif2jOCKm6IoOdaYW
 ST5g==
X-Gm-Message-State: ACgBeo2qhrx3wLPr8si6y1zt512xo2BEIxoD6sKdEtQacflb92RHJq08
 WYKX1jRpYvX4CHrh8m+0Zl8=
X-Google-Smtp-Source: AA6agR74xLUmQ4TDrwxYZXig4RmUuv3s0shYSv7hdaMyo17EB0GHVDO7Frj9aytePEVKcdnGLYfRlw==
X-Received: by 2002:a17:906:7303:b0:730:a4e8:27f1 with SMTP id
 di3-20020a170906730300b00730a4e827f1mr20107051ejc.474.1660131044375; 
 Wed, 10 Aug 2022 04:30:44 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2eb9:26a5:fc9e:fdfc?
 ([2a02:908:1256:79a0:2eb9:26a5:fc9e:fdfc])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a50fb8c000000b0043a78236cd2sm7510134edq.89.2022.08.10.04.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 04:30:43 -0700 (PDT)
Message-ID: <6c8bded9-1809-608f-749a-5ee28b852d32@gmail.com>
Date: Wed, 10 Aug 2022 13:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH v2 3/5] dma-buf: Move all dma-bufs to
 dynamic locking specification
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220725151839.31622-1-dmitry.osipenko@collabora.com>
 <20220725151839.31622-4-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220725151839.31622-4-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.07.22 um 17:18 schrieb Dmitry Osipenko:
> This patch moves the non-dynamic dma-buf users over to the dynamic
> locking specification. The strict locking convention prevents deadlock
> situation for dma-buf importers and exporters.
>
> Previously the "unlocked" versions of the dma-buf API functions weren't
> taking the reservation lock and this patch makes them to take the lock.
>
> Intel and AMD GPU drivers already were mapping imported dma-bufs under
> the held lock, hence the "locked" variant of the functions are added
> for them and the drivers are updated to use the "locked" versions.

In general "Yes, please", but that won't be that easy.

You not only need to change amdgpu and i915, but all drivers 
implementing the map_dma_buf(), unmap_dma_buf() callbacks.

Auditing all that code is a huge bunch of work.

>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   Documentation/driver-api/dma-buf.rst       |   6 +
>   drivers/dma-buf/dma-buf.c                  | 186 ++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   4 +-
>   drivers/gpu/drm/drm_prime.c                |   4 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |   8 +-
>   include/linux/dma-buf.h                    |  28 ++--
>   6 files changed, 179 insertions(+), 57 deletions(-)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 36a76cbe9095..622b8156d212 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -119,6 +119,12 @@ DMA Buffer ioctls
>   
>   .. kernel-doc:: include/uapi/linux/dma-buf.h
>   
> +DMA-BUF locking convention
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/dma-buf/dma-buf.c
> +   :doc: locking convention
> +
>   Kernel Functions and Structures Reference
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d16237a6ffaa..bfdd551c7571 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -559,7 +559,7 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>    * 2. Userspace passes this file-descriptors to all drivers it wants this buffer
>    *    to share with: First the file descriptor is converted to a &dma_buf using
>    *    dma_buf_get(). Then the buffer is attached to the device using
> - *    dma_buf_attach().
> + *    dma_buf_attach_unlocked().
>    *
>    *    Up to this stage the exporter is still free to migrate or reallocate the
>    *    backing storage.
> @@ -569,8 +569,8 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>    *    dma_buf_map_attachment() and dma_buf_unmap_attachment().
>    *
>    * 4. Once a driver is done with a shared buffer it needs to call
> - *    dma_buf_detach() (after cleaning up any mappings) and then release the
> - *    reference acquired with dma_buf_get() by calling dma_buf_put().
> + *    dma_buf_detach_unlocked() (after cleaning up any mappings) and then
> + *    release the reference acquired with dma_buf_get() by calling dma_buf_put().
>    *
>    * For the detailed semantics exporters are expected to implement see
>    * &dma_buf_ops.
> @@ -794,6 +794,63 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>   	return sg_table;
>   }
>   
> +/**
> + * DOC: locking convention
> + *
> + * In order to avoid deadlock situations between dma-buf exports and importers,
> + * all dma-buf API users must follow the common dma-buf locking convention.
> + *
> + * Convention for importers
> + *
> + * 1. Importers must hold the dma-buf reservation lock when calling these
> + *    functions:
> + *
> + *     - dma_buf_pin()
> + *     - dma_buf_unpin()

> + *     - dma_buf_move_notify()

This one is called by the exporter, not the importer.

Regards,
Christian.

> + *     - dma_buf_map_attachment_locked()
> + *     - dma_buf_unmap_attachment_locked()
> + *
> + * 2. Importers must not hold the dma-buf reservation lock when calling these
> + *    functions:
> + *
> + *     - dma_buf_attach_unlocked()
> + *     - dma_buf_dynamic_attach_unlocked()
> + *     - dma_buf_detach_unlocked()
> + *     - dma_buf_export(
> + *     - dma_buf_fd()
> + *     - dma_buf_get()
> + *     - dma_buf_put()
> + *     - dma_buf_begin_cpu_access()
> + *     - dma_buf_end_cpu_access()
> + *     - dma_buf_map_attachment_unlocked()
> + *     - dma_buf_unmap_attachment_unlocked()
> + *     - dma_buf_vmap_unlocked()
> + *     - dma_buf_vunmap_unlocked()
> + *
> + * Convention for exporters
> + *
> + * 1. These &dma_buf_ops callbacks are invoked with unlocked dma-buf
> + *    reservation and exporter can take the lock:
> + *
> + *     - &dma_buf_ops.attach()
> + *     - &dma_buf_ops.detach()
> + *     - &dma_buf_ops.release()
> + *     - &dma_buf_ops.begin_cpu_access()
> + *     - &dma_buf_ops.end_cpu_access()
> + *
> + * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
> + *    reservation and exporter can't take the lock:
> + *
> + *     - &dma_buf_ops.pin()
> + *     - &dma_buf_ops.unpin()
> + *     - &dma_buf_ops.map_dma_buf()
> + *     - &dma_buf_ops.unmap_dma_buf()
> + *     - &dma_buf_ops.mmap()
> + *     - &dma_buf_ops.vmap()
> + *     - &dma_buf_ops.vunmap()
> + */
> +
>   /**
>    * dma_buf_dynamic_attach_unlocked - Add the device to dma_buf's attachments list
>    * @dmabuf:		[in]	buffer to attach device to.
> @@ -802,7 +859,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>    * @importer_priv:	[in]	importer private pointer for the attachment
>    *
>    * Returns struct dma_buf_attachment pointer for this attachment. Attachments
> - * must be cleaned up by calling dma_buf_detach().
> + * must be cleaned up by calling dma_buf_detach_unlocked().
>    *
>    * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
>    * functionality.
> @@ -858,8 +915,8 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   	    dma_buf_is_dynamic(dmabuf)) {
>   		struct sg_table *sgt;
>   
> +		dma_resv_lock(attach->dmabuf->resv, NULL);
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
> -			dma_resv_lock(attach->dmabuf->resv, NULL);
>   			ret = dmabuf->ops->pin(attach);
>   			if (ret)
>   				goto err_unlock;
> @@ -872,8 +929,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   			ret = PTR_ERR(sgt);
>   			goto err_unpin;
>   		}
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dma_resv_unlock(attach->dmabuf->resv);
> +		dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
>   	}
> @@ -889,8 +945,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   		dmabuf->ops->unpin(attach);
>   
>   err_unlock:
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dma_resv_unlock(attach->dmabuf->resv);
> +	dma_resv_unlock(attach->dmabuf->resv);
>   
>   	dma_buf_detach_unlocked(dmabuf, attach);
>   	return ERR_PTR(ret);
> @@ -927,7 +982,7 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>    * @dmabuf:	[in]	buffer to detach from.
>    * @attach:	[in]	attachment to be detached; is free'd after this call.
>    *
> - * Clean up a device attachment obtained by calling dma_buf_attach().
> + * Clean up a device attachment obtained by calling dma_buf_attach_unlocked().
>    *
>    * Optionally this calls &dma_buf_ops.detach for device-specific detach.
>    */
> @@ -937,21 +992,19 @@ void dma_buf_detach_unlocked(struct dma_buf *dmabuf,
>   	if (WARN_ON(!dmabuf || !attach))
>   		return;
>   
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +
>   	if (attach->sgt) {
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
>   		__unmap_dma_buf(attach, attach->sgt, attach->dir);
>   
> -		if (dma_buf_is_dynamic(attach->dmabuf)) {
> +		if (dma_buf_is_dynamic(attach->dmabuf))
>   			dmabuf->ops->unpin(attach);
> -			dma_resv_unlock(attach->dmabuf->resv);
> -		}
>   	}
> -
> -	dma_resv_lock(dmabuf->resv, NULL);
>   	list_del(&attach->node);
> +
>   	dma_resv_unlock(dmabuf->resv);
> +
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> @@ -1030,10 +1083,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>    *
>    * Important: Dynamic importers must wait for the exclusive fence of the struct
>    * dma_resv attached to the DMA-BUF first.
> + *
> + * Importer is responsible for holding dmabuf's reservation lock.
>    */
> -struct sg_table *
> -dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
> -				enum dma_data_direction direction)
> +struct sg_table *dma_buf_map_attachment_locked(struct dma_buf_attachment *attach,
> +					       enum dma_data_direction direction)
>   {
>   	struct sg_table *sg_table;
>   	int r;
> @@ -1043,8 +1097,7 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   	if (WARN_ON(!attach || !attach->dmabuf))
>   		return ERR_PTR(-EINVAL);
>   
> -	if (dma_buf_attachment_is_dynamic(attach))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> +	dma_resv_assert_held(attach->dmabuf->resv);
>   
>   	if (attach->sgt) {
>   		/*
> @@ -1059,7 +1112,6 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   	}
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf)) {
> -		dma_resv_assert_held(attach->dmabuf->resv);
>   		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
>   			r = attach->dmabuf->ops->pin(attach);
>   			if (r)
> @@ -1099,10 +1151,38 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   #endif /* CONFIG_DMA_API_DEBUG */
>   	return sg_table;
>   }
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_locked, DMA_BUF);
> +
> +/**
> + * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
> + * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
> + * dma_buf_ops.
> + * @attach:	[in]	attachment whose scatterlist is to be returned
> + * @direction:	[in]	direction of DMA transfer
> + *
> + * Unlocked variant of dma_buf_map_attachment_locked().
> + */
> +struct sg_table *
> +dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
> +				enum dma_data_direction direction)
> +{
> +	struct sg_table *sg_table;
> +
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	sg_table = dma_buf_map_attachment_locked(attach, direction);
> +	dma_resv_unlock(attach->dmabuf->resv);
> +
> +	return sg_table;
> +}
>   EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
>   
>   /**
> - * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
> + * dma_buf_unmap_attachment_locked - unmaps and decreases usecount of the buffer;might
>    * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
>    * dma_buf_ops.
>    * @attach:	[in]	attachment to unmap buffer from
> @@ -1110,31 +1190,51 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
>    * @direction:  [in]    direction of DMA transfer
>    *
>    * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
> + *
> + * Importer is responsible for holding dmabuf's reservation lock.
>    */
> -void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
> -				       struct sg_table *sg_table,
> -				       enum dma_data_direction direction)
> +void dma_buf_unmap_attachment_locked(struct dma_buf_attachment *attach,
> +				     struct sg_table *sg_table,
> +				     enum dma_data_direction direction)
>   {
>   	might_sleep();
>   
> -	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> -		return;
> -
> -	if (dma_buf_attachment_is_dynamic(attach))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> +	dma_resv_assert_held(attach->dmabuf->resv);
>   
>   	if (attach->sgt == sg_table)
>   		return;
>   
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> -
>   	__unmap_dma_buf(attach, sg_table, direction);
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
>   }
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_locked, DMA_BUF);
> +
> +/**
> + * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
> + * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
> + * dma_buf_ops.
> + * @attach:	[in]	attachment to unmap buffer from
> + * @sg_table:	[in]	scatterlist info of the buffer to unmap
> + * @direction:	[in]	direction of DMA transfer
> + *
> + * Unlocked variant of dma_buf_unmap_attachment_locked().
> + */
> +void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
> +				       struct sg_table *sg_table,
> +				       enum dma_data_direction direction)
> +{
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> +		return;
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	dma_buf_unmap_attachment_locked(attach, sg_table, direction);
> +	dma_resv_unlock(attach->dmabuf->resv);
> +}
>   EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, DMA_BUF);
>   
>   /**
> @@ -1174,8 +1274,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>    *
>    *   Interfaces::
>    *
> - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct iosys_map \*map)
> - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct iosys_map \*map)
> + *      void \*dma_buf_vmap_unlocked(struct dma_buf \*dmabuf, struct iosys_map \*map)
> + *      void dma_buf_vunmap_unlocked(struct dma_buf \*dmabuf, struct iosys_map \*map)
>    *
>    *   The vmap call can fail if there is no vmap support in the exporter, or if
>    *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
> @@ -1348,6 +1448,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
>   int dma_buf_mmap_unlocked(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   			  unsigned long pgoff)
>   {
> +	int ret;
> +
>   	if (WARN_ON(!dmabuf || !vma))
>   		return -EINVAL;
>   
> @@ -1368,7 +1470,11 @@ int dma_buf_mmap_unlocked(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   	vma_set_file(vma, dmabuf->file);
>   	vma->vm_pgoff = pgoff;
>   
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	ret = dmabuf->ops->mmap(dmabuf, vma);
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
>   
> @@ -1401,6 +1507,7 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>   	if (!dmabuf->ops->vmap)
>   		return -EINVAL;
>   
> +	dma_resv_lock(dmabuf->resv, NULL);
>   	mutex_lock(&dmabuf->lock);
>   	if (dmabuf->vmapping_counter) {
>   		dmabuf->vmapping_counter++;
> @@ -1422,6 +1529,7 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>   
>   out_unlock:
>   	mutex_unlock(&dmabuf->lock);
> +	dma_resv_unlock(dmabuf->resv);
>   	return ret;
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vmap_unlocked, DMA_BUF);
> @@ -1440,6 +1548,7 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>   	BUG_ON(dmabuf->vmapping_counter == 0);
>   	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
>   
> +	dma_resv_lock(dmabuf->resv, NULL);
>   	mutex_lock(&dmabuf->lock);
>   	if (--dmabuf->vmapping_counter == 0) {
>   		if (dmabuf->ops->vunmap)
> @@ -1447,6 +1556,7 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>   		iosys_map_clear(&dmabuf->vmap_ptr);
>   	}
>   	mutex_unlock(&dmabuf->lock);
> +	dma_resv_unlock(dmabuf->resv);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index dd6ac1606316..1b426116c22e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -882,7 +882,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   			struct sg_table *sgt;
>   
>   			attach = gtt->gobj->import_attach;
> -			sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
> +			sgt = dma_buf_map_attachment_locked(attach, DMA_BIDIRECTIONAL);
>   			if (IS_ERR(sgt))
>   				return PTR_ERR(sgt);
>   
> @@ -1007,7 +1007,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>   		struct dma_buf_attachment *attach;
>   
>   		attach = gtt->gobj->import_attach;
> -		dma_buf_unmap_attachment_unlocked(attach, ttm->sg, DMA_BIDIRECTIONAL);
> +		dma_buf_unmap_attachment_locked(attach, ttm->sg, DMA_BIDIRECTIONAL);
>   		ttm->sg = NULL;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1bd234fd21a5..b75ef1756873 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -678,7 +678,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	return drm_gem_vmap_unlocked(obj, map);
> +	return drm_gem_vmap(obj, map);
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>   
> @@ -694,7 +694,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	drm_gem_vunmap_unlocked(obj, map);
> +	drm_gem_vunmap(obj, map);
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index cc54a5b1d6ae..d1bb6a3760e8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -241,8 +241,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   
>   	assert_object_held(obj);
>   
> -	pages = dma_buf_map_attachment_unlocked(obj->base.import_attach,
> -						DMA_BIDIRECTIONAL);
> +	pages = dma_buf_map_attachment_locked(obj->base.import_attach,
> +					      DMA_BIDIRECTIONAL);
>   	if (IS_ERR(pages))
>   		return PTR_ERR(pages);
>   
> @@ -270,8 +270,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
>   					     struct sg_table *pages)
>   {
> -	dma_buf_unmap_attachment_unlocked(obj->base.import_attach, pages,
> -					  DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_locked(obj->base.import_attach, pages,
> +					DMA_BIDIRECTIONAL);
>   }
>   
>   static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 9ab09569dec1..e7a6a8d28862 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -46,7 +46,7 @@ struct dma_buf_ops {
>   	/**
>   	 * @attach:
>   	 *
> -	 * This is called from dma_buf_attach() to make sure that a given
> +	 * This is called from dma_buf_attach_unlocked() to make sure that a given
>   	 * &dma_buf_attachment.dev can access the provided &dma_buf. Exporters
>   	 * which support buffer objects in special locations like VRAM or
>   	 * device-specific carveout areas should check whether the buffer could
> @@ -74,7 +74,7 @@ struct dma_buf_ops {
>   	/**
>   	 * @detach:
>   	 *
> -	 * This is called by dma_buf_detach() to release a &dma_buf_attachment.
> +	 * This is called by dma_buf_detach_unlocked() to release a &dma_buf_attachment.
>   	 * Provided so that exporters can clean up any housekeeping for an
>   	 * &dma_buf_attachment.
>   	 *
> @@ -94,7 +94,7 @@ struct dma_buf_ops {
>   	 * exclusive with @cache_sgt_mapping.
>   	 *
>   	 * This is called automatically for non-dynamic importers from
> -	 * dma_buf_attach().
> +	 * dma_buf_attach_unlocked().
>   	 *
>   	 * Note that similar to non-dynamic exporters in their @map_dma_buf
>   	 * callback the driver must guarantee that the memory is available for
> @@ -124,8 +124,8 @@ struct dma_buf_ops {
>   	/**
>   	 * @map_dma_buf:
>   	 *
> -	 * This is called by dma_buf_map_attachment() and is used to map a
> -	 * shared &dma_buf into device address space, and it is mandatory. It
> +	 * This is called by dma_buf_map_attachment_locked() and is used to map
> +	 * a shared &dma_buf into device address space, and it is mandatory. It
>   	 * can only be called if @attach has been called successfully.
>   	 *
>   	 * This call may sleep, e.g. when the backing storage first needs to be
> @@ -181,8 +181,8 @@ struct dma_buf_ops {
>   	/**
>   	 * @unmap_dma_buf:
>   	 *
> -	 * This is called by dma_buf_unmap_attachment() and should unmap and
> -	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
> +	 * This is called by dma_buf_unmap_attachment_locked() and should unmap
> +	 * and release the &sg_table allocated in @map_dma_buf, and it is mandatory.
>   	 * For static dma_buf handling this might also unpin the backing
>   	 * storage if this is the last mapping of the DMA buffer.
>   	 */
> @@ -509,10 +509,10 @@ struct dma_buf_attach_ops {
>    * and its user device(s). The list contains one attachment struct per device
>    * attached to the buffer.
>    *
> - * An attachment is created by calling dma_buf_attach(), and released again by
> - * calling dma_buf_detach(). The DMA mapping itself needed to initiate a
> - * transfer is created by dma_buf_map_attachment() and freed again by calling
> - * dma_buf_unmap_attachment().
> + * An attachment is created by calling dma_buf_attach_unlocked(), and released
> + * again by calling dma_buf_detach_unlocked(). The DMA mapping itself needed to
> + * initiate a transfer is created by dma_buf_map_attachment_locked() and freed
> + * again by calling dma_buf_unmap_attachment_locked().
>    */
>   struct dma_buf_attachment {
>   	struct dma_buf *dmabuf;
> @@ -626,6 +626,12 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *,
>   				       struct sg_table *,
>   				       enum dma_data_direction);
>   
> +struct sg_table *dma_buf_map_attachment_locked(struct dma_buf_attachment *,
> +					       enum dma_data_direction);
> +void dma_buf_unmap_attachment_locked(struct dma_buf_attachment *attach,
> +				     struct sg_table *sg_table,
> +				     enum dma_data_direction direction);
> +
>   void dma_buf_move_notify(struct dma_buf *dma_buf);
>   int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>   			     enum dma_data_direction dir);

