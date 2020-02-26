Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED116FBA6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 11:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16CA6E437;
	Wed, 26 Feb 2020 10:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C646E431
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:10:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so2242789wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ijZBUMAjTA025BZO0mb/NNb7nr6mtksE+QiFRzg8U28=;
 b=bZhII0rsDCY+Nx0YyBSkeLDaHZZzlES9DoL+5BOhrj7Pymybh5dAe/lqTgQ8NstAcr
 qEtMtNfLtVHa6mGXVOpwwwJvcw/UDpBluG81Xd+wtz1fc/slkGxPIT65oCS7G22XwK0Y
 4T1WiFKY7lgkVgYPMNnwBgI3i1wZs317iVDiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ijZBUMAjTA025BZO0mb/NNb7nr6mtksE+QiFRzg8U28=;
 b=cbLI/OujnGfKMvoKb+ynlcS+LUc5WMCH5rZvfi4g1218MrEX/emLxDvgcNrS077G9h
 vs6ZOi+q4IuwoeciwBGcKAKWzfP6JULABpQv5IkhPbTW3KjAIUEXgesRDYLcb/JBBPIS
 8hqUhFx7NcN9QJgNq82w9nieRh2I4IoVfu5udUb+FJZ1l/8RKH1/lfhq8hXSXfiuUTdS
 nTcuhLAIz7LtznP72uR4YfhjHlUznSU/WyNqV882Btr207gWuSYLYliof1Ip/MAvadXw
 VDwVjjUD8K4nA/T/YT+oRgIDhH16UCizGaiBae+0USNE0trE5Eaw3tjZ/RTD0eXmGu6K
 seww==
X-Gm-Message-State: APjAAAVanmOluGZP+L6M+Gge/Oy+dk58g0rYc9xLfEX+iGvzkoY6blCd
 W8TDUOwivjPLEednqCgqmkHbEg==
X-Google-Smtp-Source: APXvYqw10mI21vbVk4gC/21Yt3MWdmB5YYCL3bnPVuI9cgtlygmusLcvWFZD4r7QrcJf/tAUh65eHA==
X-Received: by 2002:adf:f892:: with SMTP id u18mr4422902wrp.328.1582711802353; 
 Wed, 26 Feb 2020 02:10:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k7sm2188160wmi.19.2020.02.26.02.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 02:10:01 -0800 (PST)
Date: Wed, 26 Feb 2020 11:09:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/7] dma-buf: add dynamic DMA-buf handling v15
Message-ID: <20200226100959.GR2363188@phenom.ffwll.local>
References: <20200219125910.89147-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219125910.89147-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 01:59:04PM +0100, Christian K=F6nig wrote:
> On the exporter side we add optional explicit pinning callbacks. Which are
> called when the importer doesn't implement dynamic handling, move notific=
ation
> or need the DMA-buf locked in place for its use case.
> =

> On the importer side we add an optional move_notify callback. This callba=
ck is
> used by the exporter to inform the importers that their mappings should be
> destroyed as soon as possible.
> =

> This allows the exporter to provide the mappings without the need to pin
> the backing store.
> =

> v2: don't try to invalidate mappings when the callback is NULL,
>     lock the reservation obj while using the attachments,
>     add helper to set the callback
> v3: move flag for invalidation support into the DMA-buf,
>     use new attach_info structure to set the callback
> v4: use importer_priv field instead of mangling exporter priv.
> v5: drop invalidation_supported flag
> v6: squash together with pin/unpin changes
> v7: pin/unpin takes an attachment now
> v8: nuke dma_buf_attachment_(map|unmap)_locked,
>     everything is now handled backward compatible
> v9: always cache when export/importer don't agree on dynamic handling
> v10: minimal style cleanup
> v11: drop automatically re-entry avoidance
> v12: rename callback to move_notify
> v13: add might_lock in appropriate places
> v14: rebase on separated locking change
> v15: add EXPERIMENTAL flag, some more code comments
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

intel-gfx-ci seems now happy too after some prodding, and I think this is
a solid step in roughly the right direction. More important, and think we
now have a fairly good shared understanding of many of the additional pain
points we still need to solve. And some ideas for how to do that. I think
that was the really important thing to achieve, and over seemingly endless
discussions we've got there.

On the dma-buf patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

For the ttm/amdgpu stuff:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> ---
>  drivers/dma-buf/Kconfig                     |  10 ++
>  drivers/dma-buf/dma-buf.c                   | 110 ++++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |   6 +-
>  include/linux/dma-buf.h                     |  82 +++++++++++++--
>  4 files changed, 188 insertions(+), 20 deletions(-)
> =

> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e7d820ce0724..ef73b678419c 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -39,6 +39,16 @@ config UDMABUF
>  	  A driver to let userspace turn memfd regions into dma-bufs.
>  	  Qemu can use this to create host dmabufs for guest framebuffers.
>  =

> +config DMABUF_MOVE_NOTIFY
> +	bool "Move notify between drivers (EXPERIMENTAL)"
> +	default n
> +	help
> +	  Don''t pin buffers if the dynamic DMA-buf interface is available on b=
oth the
> +	  exporter as well as the importer. This fixes a security problem where
> +	  userspace is able to pin unrestricted amounts of memory through DMA-b=
uf.
> +	  But marked experimental because we don''t jet have a consistent execu=
tion
> +	  context and memory management between drivers.
> +
>  config DMABUF_SELFTESTS
>  	tristate "Selftests for the dma-buf interfaces"
>  	default n
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d4097856c86b..5f10d1929476 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -527,6 +527,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_=
export_info *exp_info)
>  		    exp_info->ops->dynamic_mapping))
>  		return ERR_PTR(-EINVAL);
>  =

> +	if (WARN_ON(!exp_info->ops->dynamic_mapping &&
> +		    (exp_info->ops->pin || exp_info->ops->unpin)))
> +		return ERR_PTR(-EINVAL);
> +
>  	if (!try_module_get(exp_info->owner))
>  		return ERR_PTR(-ENOENT);
>  =

> @@ -651,7 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   * calls attach() of dma_buf_ops to allow device-specific attach functio=
nality
>   * @dmabuf:		[in]	buffer to attach device to.
>   * @dev:		[in]	device to be attached.
> - * @dynamic_mapping:	[in]	calling convention for map/unmap
> + * @importer_ops	[in]	importer operations for the attachment
> + * @importer_priv	[in]	importer private pointer for the attachment
>   *
>   * Returns struct dma_buf_attachment pointer for this attachment. Attach=
ments
>   * must be cleaned up by calling dma_buf_detach().
> @@ -667,11 +672,13 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   */
>  struct dma_buf_attachment *
>  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       bool dynamic_mapping)
> +		       const struct dma_buf_attach_ops *importer_ops,
> +		       void *importer_priv)
>  {
>  	struct dma_buf_attachment *attach;
>  	int ret;
>  =

> +	/* TODO: make move_notify mandatory if importer_ops are provided. */
>  	if (WARN_ON(!dmabuf || !dev))
>  		return ERR_PTR(-EINVAL);
>  =

> @@ -681,7 +688,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct=
 device *dev,
>  =

>  	attach->dev =3D dev;
>  	attach->dmabuf =3D dmabuf;
> -	attach->dynamic_mapping =3D dynamic_mapping;
> +	attach->importer_ops =3D importer_ops;
> +	attach->importer_priv =3D importer_priv;
>  =

>  	if (dmabuf->ops->attach) {
>  		ret =3D dmabuf->ops->attach(dmabuf, attach);
> @@ -700,15 +708,19 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
>  	    dma_buf_is_dynamic(dmabuf)) {
>  		struct sg_table *sgt;
>  =

> -		if (dma_buf_is_dynamic(attach->dmabuf))
> +		if (dma_buf_is_dynamic(attach->dmabuf)) {
>  			dma_resv_lock(attach->dmabuf->resv, NULL);
> +			ret =3D dma_buf_pin(attach);
> +			if (ret)
> +				goto err_unlock;
> +		}
>  =

>  		sgt =3D dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
>  		if (!sgt)
>  			sgt =3D ERR_PTR(-ENOMEM);
>  		if (IS_ERR(sgt)) {
>  			ret =3D PTR_ERR(sgt);
> -			goto err_unlock;
> +			goto err_unpin;
>  		}
>  		if (dma_buf_is_dynamic(attach->dmabuf))
>  			dma_resv_unlock(attach->dmabuf->resv);
> @@ -722,6 +734,10 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struc=
t device *dev,
>  	kfree(attach);
>  	return ERR_PTR(ret);
>  =

> +err_unpin:
> +	if (dma_buf_is_dynamic(attach->dmabuf))
> +		dma_buf_unpin(attach);
> +
>  err_unlock:
>  	if (dma_buf_is_dynamic(attach->dmabuf))
>  		dma_resv_unlock(attach->dmabuf->resv);
> @@ -742,7 +758,7 @@ EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev)
>  {
> -	return dma_buf_dynamic_attach(dmabuf, dev, false);
> +	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_attach);
>  =

> @@ -765,8 +781,10 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct d=
ma_buf_attachment *attach)
>  =

>  		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
>  =

> -		if (dma_buf_is_dynamic(attach->dmabuf))
> +		if (dma_buf_is_dynamic(attach->dmabuf)) {
> +			dma_buf_unpin(attach);
>  			dma_resv_unlock(attach->dmabuf->resv);
> +		}
>  	}
>  =

>  	dma_resv_lock(dmabuf->resv, NULL);
> @@ -779,6 +797,44 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct d=
ma_buf_attachment *attach)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_detach);
>  =

> +/**
> + * dma_buf_pin - Lock down the DMA-buf
> + *
> + * @attach:	[in]	attachment which should be pinned
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int dma_buf_pin(struct dma_buf_attachment *attach)
> +{
> +	struct dma_buf *dmabuf =3D attach->dmabuf;
> +	int ret =3D 0;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	if (dmabuf->ops->pin)
> +		ret =3D dmabuf->ops->pin(attach);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_pin);
> +
> +/**
> + * dma_buf_unpin - Remove lock from DMA-buf
> + *
> + * @attach:	[in]	attachment which should be unpinned
> + */
> +void dma_buf_unpin(struct dma_buf_attachment *attach)
> +{
> +	struct dma_buf *dmabuf =3D attach->dmabuf;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	if (dmabuf->ops->unpin)
> +		dmabuf->ops->unpin(attach);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_unpin);
> +
>  /**
>   * dma_buf_map_attachment - Returns the scatterlist table of the attachm=
ent;
>   * mapped into _device_ address space. Is a wrapper for map_dma_buf() of=
 the
> @@ -798,6 +854,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_bu=
f_attachment *attach,
>  					enum dma_data_direction direction)
>  {
>  	struct sg_table *sg_table;
> +	int r;
>  =

>  	might_sleep();
>  =

> @@ -819,13 +876,25 @@ struct sg_table *dma_buf_map_attachment(struct dma_=
buf_attachment *attach,
>  		return attach->sgt;
>  	}
>  =

> -	if (dma_buf_is_dynamic(attach->dmabuf))
> +	if (dma_buf_is_dynamic(attach->dmabuf)) {
>  		dma_resv_assert_held(attach->dmabuf->resv);
> +		if (!attach->importer_ops->move_notify ||
> +		    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> +			r =3D dma_buf_pin(attach);
> +			if (r)
> +				return ERR_PTR(r);
> +		}
> +	}
>  =

>  	sg_table =3D attach->dmabuf->ops->map_dma_buf(attach, direction);
>  	if (!sg_table)
>  		sg_table =3D ERR_PTR(-ENOMEM);
>  =

> +	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> +	    (!attach->importer_ops->move_notify ||
> +	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)))
> +		dma_buf_unpin(attach);
> +
>  	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
>  		attach->sgt =3D sg_table;
>  		attach->dir =3D direction;
> @@ -864,9 +933,34 @@ void dma_buf_unmap_attachment(struct dma_buf_attachm=
ent *attach,
>  		dma_resv_assert_held(attach->dmabuf->resv);
>  =

>  	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +
> +	if (dma_buf_is_dynamic(attach->dmabuf) &&
> +	    (!attach->importer_ops->move_notify ||
> +	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)))
> +		dma_buf_unpin(attach);
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
>  =

> +/**
> + * dma_buf_move_notify - notify attachments that DMA-buf is moving
> + *
> + * @dmabuf:	[in]	buffer which is moving
> + *
> + * Informs all attachmenst that they need to destroy and recreated all t=
heir
> + * mappings.
> + */
> +void dma_buf_move_notify(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_attachment *attach;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	list_for_each_entry(attach, &dmabuf->attachments, node)
> +		if (attach->importer_ops && attach->importer_ops->move_notify)
> +			attach->importer_ops->move_notify(attach);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> +
>  /**
>   * DOC: cpu access
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index a59cd47aa6c1..7cafc65fd76a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -412,6 +412,9 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, str=
uct dma_buf *dma_buf)
>  	return ERR_PTR(ret);
>  }
>  =

> +static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops =3D {
> +};
> +
>  /**
>   * amdgpu_gem_prime_import - &drm_driver.gem_prime_import implementation
>   * @dev: DRM device
> @@ -444,7 +447,8 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct=
 drm_device *dev,
>  	if (IS_ERR(obj))
>  		return obj;
>  =

> -	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev, true);
> +	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> +					&amdgpu_dma_buf_attach_ops, NULL);
>  	if (IS_ERR(attach)) {
>  		drm_gem_object_put(obj);
>  		return ERR_CAST(attach);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index abf5459a5b9d..b38cea240b67 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -93,14 +93,41 @@ struct dma_buf_ops {
>  	 */
>  	void (*detach)(struct dma_buf *, struct dma_buf_attachment *);
>  =

> +	/**
> +	 * @pin:
> +	 *
> +	 * This is called by dma_buf_pin and lets the exporter know that the
> +	 * DMA-buf can't be moved any more.
> +	 *
> +	 * This is called with the dmabuf->resv object locked.
> +	 *
> +	 * This callback is optional and should only be used in limited use
> +	 * cases like scanout and not for temporary pin operations.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success, negative error code on failure.
> +	 */
> +	int (*pin)(struct dma_buf_attachment *attach);
> +
> +	/**
> +	 * @unpin:
> +	 *
> +	 * This is called by dma_buf_unpin and lets the exporter know that the
> +	 * DMA-buf can be moved again.
> +	 *
> +	 * This is called with the dmabuf->resv object locked.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*unpin)(struct dma_buf_attachment *attach);
> +
>  	/**
>  	 * @map_dma_buf:
>  	 *
>  	 * This is called by dma_buf_map_attachment() and is used to map a
>  	 * shared &dma_buf into device address space, and it is mandatory. It
> -	 * can only be called if @attach has been called successfully. This
> -	 * essentially pins the DMA buffer into place, and it cannot be moved
> -	 * any more
> +	 * can only be called if @attach has been called successfully.
>  	 *
>  	 * This call may sleep, e.g. when the backing storage first needs to be
>  	 * allocated, or moved to a location suitable for all currently attached
> @@ -141,9 +168,8 @@ struct dma_buf_ops {
>  	 *
>  	 * This is called by dma_buf_unmap_attachment() and should unmap and
>  	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
> -	 * It should also unpin the backing storage if this is the last mapping
> -	 * of the DMA buffer, it the exporter supports backing storage
> -	 * migration.
> +	 * For static dma_buf handling this might also unpins the backing
> +	 * storage if this is the last mapping of the DMA buffer.
>  	 */
>  	void (*unmap_dma_buf)(struct dma_buf_attachment *,
>  			      struct sg_table *,
> @@ -311,6 +337,34 @@ struct dma_buf {
>  	} cb_excl, cb_shared;
>  };
>  =

> +/**
> + * struct dma_buf_attach_ops - importer operations for an attachment
> + * @move_notify: [optional] notification that the DMA-buf is moving
> + *
> + * Attachment operations implemented by the importer.
> + */
> +struct dma_buf_attach_ops {
> +	/**
> +	 * @move_notify
> +	 *
> +	 * If this callback is provided the framework can avoid pinning the
> +	 * backing store while mappings exists.
> +	 *
> +	 * This callback is called with the lock of the reservation object
> +	 * associated with the dma_buf held and the mapping function must be
> +	 * called with this lock held as well. This makes sure that no mapping
> +	 * is created concurrently with an ongoing move operation.
> +	 *
> +	 * Mappings stay valid and are not directly affected by this callback.
> +	 * But the DMA-buf can now be in a different physical location, so all
> +	 * mappings should be destroyed and re-created as soon as possible.
> +	 *
> +	 * New mappings can be created after this callback returns, and will
> +	 * point to the new location of the DMA-buf.
> +	 */
> +	void (*move_notify)(struct dma_buf_attachment *attach);
> +};
> +
>  /**
>   * struct dma_buf_attachment - holds device-buffer attachment data
>   * @dmabuf: buffer for this attachment.
> @@ -319,8 +373,9 @@ struct dma_buf {
>   * @sgt: cached mapping.
>   * @dir: direction of cached mapping.
>   * @priv: exporter specific attachment data.
> - * @dynamic_mapping: true if dma_buf_map/unmap_attachment() is called wi=
th the
> - * dma_resv lock held.
> + * @importer_ops: importer operations for this attachment, if provided
> + * dma_buf_map/unmap_attachment() must be called with the dma_resv lock =
held.
> + * @importer_priv: importer specific attachment data.
>   *
>   * This structure holds the attachment information between the dma_buf b=
uffer
>   * and its user device(s). The list contains one attachment struct per d=
evice
> @@ -337,7 +392,8 @@ struct dma_buf_attachment {
>  	struct list_head node;
>  	struct sg_table *sgt;
>  	enum dma_data_direction dir;
> -	bool dynamic_mapping;
> +	const struct dma_buf_attach_ops *importer_ops;
> +	void *importer_priv;
>  	void *priv;
>  };
>  =

> @@ -399,6 +455,7 @@ static inline void get_dma_buf(struct dma_buf *dmabuf)
>   */
>  static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  {
> +	/* TODO: switch to using pin/unpin functions as indicator. */
>  	return dmabuf->ops->dynamic_mapping;
>  }
>  =

> @@ -413,16 +470,19 @@ static inline bool dma_buf_is_dynamic(struct dma_bu=
f *dmabuf)
>  static inline bool
>  dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>  {
> -	return attach->dynamic_mapping;
> +	return !!attach->importer_ops;
>  }
>  =

>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
>  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       bool dynamic_mapping);
> +		       const struct dma_buf_attach_ops *importer_ops,
> +		       void *importer_priv);
>  void dma_buf_detach(struct dma_buf *dmabuf,
>  		    struct dma_buf_attachment *attach);
> +int dma_buf_pin(struct dma_buf_attachment *attach);
> +void dma_buf_unpin(struct dma_buf_attachment *attach);
>  =

>  struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_inf=
o);
>  =

> -- =

> 2.17.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
