Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B43A38909
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE4610E327;
	Mon, 17 Feb 2025 16:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="a7yUMRNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4110E327
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:24:34 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38f22fe8762so2290083f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739809472; x=1740414272; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cVpiBEwmTZ+hIf3rfr0Tri2GW3LedUj1k1zkfGPuiS8=;
 b=a7yUMRNmrc97nev9YqcDqsMoW1IroBp9x+rOZLR07Z5ekXAYpBaUUqDSWeGfKYTL2/
 ZvD7KGWa+zFJim11H8ZAAQ8UibnOnAYOUocA9FHt1f76aN0Qnxc67SthXJPJuBbUSDAk
 P2Wh2PUlJ6ZGwrTxqWvTE3xfDWukWDgzeE/oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739809472; x=1740414272;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cVpiBEwmTZ+hIf3rfr0Tri2GW3LedUj1k1zkfGPuiS8=;
 b=CJhlcLMoqaf31Lszcc/uKaB1NDRT+Vicr5/kj1ClYpbz8Ms2SL+8JQxw+YEMq/ncea
 NpnzOYcSxDqRq+WSLzkVdLfQSvpV6BiJ4zW06tZy461YCwAkz8j+EaPHW7LseZULtbjS
 R72jGj5oRHi0lT4OwahdI/w/q3HLZuDknX1Fpm8uowmA1pMzNITRdqNtEQlSQQ643HoD
 JJ6k5S+h8KsVrlwXBziVb+Fu0/AS9UAtBhyuyL+pLorBSWuSMDipf+3ZjqHIWGFmH5VL
 smsFpbbcwxm4/pMYAXzsl6+4dUr8xHQH+sUWqJJ8QiunQmYTHNS5k7XOrkHsKGuiz+8k
 1nSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcBDekeVXeM6pQoHHWIXYjfYaiwPZOpi/LdZTgB9qbMlt5IiBke7ytUNUwCyVhCmhOAmxrWMLpbFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaBSsGM2PT272ToOAQAvVOl/S1YLch9ipZcHsqLw+Qc2Q5AmZW
 hBCb8D6b+PS2XwdgzMpLkJCLWVl3SPIS9HyGzAbC5zLa6tQm3Ena7aKz7yntg7U=
X-Gm-Gg: ASbGncs8XADkLLmFeACIixvh7l39K2p6tPPRfy3BP9TaMJXsRCZrxjEkB3yCt+sQwbA
 jYrU1Q5gTSiPcliAG8aJQvJc7d3QdWwUAHiNjz8sgdNiKCTC3KhOdL5A4G0DOac4N3tu+K7fyH+
 FMKBK+bS6T9SmQrWH7UN5mE642okBwRAfA0cqIeIOviYnLudJBj3NFznb290fQWcWQ/fsDHO3q+
 jBKM58MI9/gcFpuFwwhGpQ2ssxsOHDY5hBeW+D5phh7JbqdcpBoSy9+XD1+HCajhritOkEu3Sbs
 HqQxRt7a441kRsJ6nSiRB9YzS+A=
X-Google-Smtp-Source: AGHT+IFX0aTtATY/VLNjmT4pi2siZ81mv7Hi+dm14O+B6Sur7KDWc6qse8YbKRPTU1RFieIuBpqeNA==
X-Received: by 2002:a05:6000:154f:b0:38f:2093:6e75 with SMTP id
 ffacd0b85a97d-38f33f3599fmr10217014f8f.33.1739809472473; 
 Mon, 17 Feb 2025 08:24:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b4158sm12553149f8f.3.2025.02.17.08.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:24:31 -0800 (PST)
Date: Mon, 17 Feb 2025 17:24:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/4] dma-buf: dma-buf: stop mapping sg_tables on attach
Message-ID: <Z7NivTrXl5NiGw-k@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Feb 11, 2025 at 05:31:08PM +0100, Christian König wrote:
> As a workaround to smoothly transit from static to dynamic DMA-buf
> handling we cached the sg_table on attach if dynamic handling mismatched
> between exporter and importer.
> 
> Since Dmitry and Thomas cleaned that up and also documented the lock
> handling we can drop this workaround now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 149 ++++++++++++++------------------------
>  include/linux/dma-buf.h   |  14 ----
>  2 files changed, 56 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5baa83b85515..357b94a3dbaa 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -782,7 +782,7 @@ static void mangle_sg_table(struct sg_table *sg_table)
>  
>  	/* To catch abuse of the underlying struct page by importers mix
>  	 * up the bits, but take care to preserve the low SG_ bits to
> -	 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
> +	 * not corrupt the sgt. The mixing is undone on unmap
>  	 * before passing the sgt back to the exporter.
>  	 */
>  	for_each_sgtable_sg(sg_table, sg, i)
> @@ -790,29 +790,20 @@ static void mangle_sg_table(struct sg_table *sg_table)
>  #endif
>  
>  }
> -static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
> -				       enum dma_data_direction direction)
> -{
> -	struct sg_table *sg_table;
> -	signed long ret;
> -
> -	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> -	if (IS_ERR_OR_NULL(sg_table))
> -		return sg_table;
> -
> -	if (!dma_buf_attachment_is_dynamic(attach)) {
> -		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
> -					    DMA_RESV_USAGE_KERNEL, true,
> -					    MAX_SCHEDULE_TIMEOUT);
> -		if (ret < 0) {
> -			attach->dmabuf->ops->unmap_dma_buf(attach, sg_table,
> -							   direction);
> -			return ERR_PTR(ret);
> -		}
> -	}
>  
> -	mangle_sg_table(sg_table);
> -	return sg_table;
> +/**
> + * dma_buf_pin_on_map - check if a DMA-buf should be pinned when mapped
> + * @attach: the DMA-buf attachment to check

Generally we don't do kerneldoc for static helper functions, the function
name should be clear enough here. I think you can just delete this.

> + *
> + * Returns: True if a DMA-buf export provided pin/unpin callbacks and we can't
> + * use the importers move notify for some reason.
> + */
> +static bool
> +dma_buf_pin_on_map(struct dma_buf_attachment *attach)
> +{
> +	return attach->dmabuf->ops->pin &&
> +		(!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) ||
> +		 !attach->importer_ops);

I think moving the dma_buf_attachment_is_dynamic helper into this file
right above as a static inline helper without kerneldoc would be good,
just as a piece of self-documentation of what this check here means. It's
a bit opaque otherwise, and if we add more importer_ops we might screw
this up otherwise.

>  }
>  
>  /**
> @@ -935,48 +926,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	list_add(&attach->node, &dmabuf->attachments);
>  	dma_resv_unlock(dmabuf->resv);
>  
> -	/* When either the importer or the exporter can't handle dynamic
> -	 * mappings we cache the mapping here to avoid issues with the
> -	 * reservation object lock.
> -	 */
> -	if (dma_buf_attachment_is_dynamic(attach) !=
> -	    dma_buf_is_dynamic(dmabuf)) {
> -		struct sg_table *sgt;
> -
> -		dma_resv_lock(attach->dmabuf->resv, NULL);
> -		if (dma_buf_is_dynamic(attach->dmabuf)) {
> -			ret = dmabuf->ops->pin(attach);
> -			if (ret)
> -				goto err_unlock;
> -		}
> -
> -		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
> -		if (!sgt)
> -			sgt = ERR_PTR(-ENOMEM);
> -		if (IS_ERR(sgt)) {
> -			ret = PTR_ERR(sgt);
> -			goto err_unpin;
> -		}
> -		dma_resv_unlock(attach->dmabuf->resv);
> -		attach->sgt = sgt;
> -		attach->dir = DMA_BIDIRECTIONAL;
> -	}
> -
>  	return attach;
>  
>  err_attach:
>  	kfree(attach);
>  	return ERR_PTR(ret);
> -
> -err_unpin:
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dmabuf->ops->unpin(attach);
> -
> -err_unlock:
> -	dma_resv_unlock(attach->dmabuf->resv);
> -
> -	dma_buf_detach(dmabuf, attach);
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
>  
> @@ -995,16 +949,6 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
>  
> -static void __unmap_dma_buf(struct dma_buf_attachment *attach,
> -			    struct sg_table *sg_table,
> -			    enum dma_data_direction direction)
> -{
> -	/* uses XOR, hence this unmangles */
> -	mangle_sg_table(sg_table);
> -
> -	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> -}
> -
>  /**
>   * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
>   * @dmabuf:	[in]	buffer to detach from.
> @@ -1022,11 +966,12 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  	dma_resv_lock(dmabuf->resv, NULL);
>  
>  	if (attach->sgt) {
> +		mangle_sg_table(attach->sgt);
> +		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
> +						   attach->dir);
>  
> -		__unmap_dma_buf(attach, attach->sgt, attach->dir);
> -
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dmabuf->ops->unpin(attach);
> +		if (dma_buf_pin_on_map(attach))
> +			dma_buf_unpin(attach);
>  	}
>  	list_del(&attach->node);
>  
> @@ -1058,7 +1003,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
>  	struct dma_buf *dmabuf = attach->dmabuf;
>  	int ret = 0;
>  
> -	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
> +	WARN_ON(!attach->importer_ops);
>  
>  	dma_resv_assert_held(dmabuf->resv);
>  
> @@ -1081,7 +1026,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
>  {
>  	struct dma_buf *dmabuf = attach->dmabuf;
>  
> -	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
> +	WARN_ON(!attach->importer_ops);
>  
>  	dma_resv_assert_held(dmabuf->resv);
>  
> @@ -1115,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  					enum dma_data_direction direction)
>  {
>  	struct sg_table *sg_table;
> -	int r;
> +	signed long ret;
>  
>  	might_sleep();
>  
> @@ -1136,29 +1081,37 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  		return attach->sgt;
>  	}
>  
> -	if (dma_buf_is_dynamic(attach->dmabuf)) {
> -		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> -			r = attach->dmabuf->ops->pin(attach);
> -			if (r)
> -				return ERR_PTR(r);
> -		}
> +	if (dma_buf_pin_on_map(attach)) {
> +		ret = attach->dmabuf->ops->pin(attach);
> +		if (ret)

I do wonder whether we should have a WARN_ON(ret = -EBUSY) or similar, to
catch drivers who've moved the memory to an unsuitable place despite
attachments existing?

> +			return ERR_PTR(ret);
>  	}
>  
> -	sg_table = __map_dma_buf(attach, direction);

> +	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>  	if (!sg_table)
>  		sg_table = ERR_PTR(-ENOMEM);
> +	if (IS_ERR(sg_table))
> +		goto error_unpin;
>  
> -	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> -	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> -		attach->dmabuf->ops->unpin(attach);
> +	/*
> +	 * When not providing ops the importer doesn't wait for fences either.
> +	 */
> +	if (!attach->importer_ops) {

Yeah we definitely want to keep this static helper function to make this
check less opaque. Also I think this is strictly speaking only needed for
the dma_buf_pin_on_map case and not for everyone, plus there shouldn't be
any harm to do this after pinning, but before calling map_dma_buf. But
maybe better to leave as-is.

> +		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
> +					    DMA_RESV_USAGE_KERNEL, true,
> +					    MAX_SCHEDULE_TIMEOUT);
> +		if (ret < 0)
> +			goto error_unmap;
> +	}
> +	mangle_sg_table(sg_table);
>  
> -	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
> +	if (attach->dmabuf->ops->cache_sgt_mapping) {
>  		attach->sgt = sg_table;
>  		attach->dir = direction;
>  	}
>  
>  #ifdef CONFIG_DMA_API_DEBUG
> -	if (!IS_ERR(sg_table)) {
> +	{
>  		struct scatterlist *sg;
>  		u64 addr;
>  		int len;
> @@ -1175,6 +1128,16 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  	}
>  #endif /* CONFIG_DMA_API_DEBUG */
>  	return sg_table;
> +
> +error_unmap:
> +	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +	sg_table = ERR_PTR(ret);
> +
> +error_unpin:
> +	if (dma_buf_pin_on_map(attach))
> +		attach->dmabuf->ops->unpin(attach);
> +
> +	return sg_table;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, "DMA_BUF");
>  
> @@ -1230,11 +1193,11 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>  	if (attach->sgt == sg_table)
>  		return;
>  
> -	__unmap_dma_buf(attach, sg_table, direction);
> +	mangle_sg_table(sg_table);
> +	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>  
> -	if (dma_buf_is_dynamic(attach->dmabuf) &&
> -	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> -		dma_buf_unpin(attach);
> +	if (dma_buf_pin_on_map(attach))
> +		attach->dmabuf->ops->unpin(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, "DMA_BUF");
>  
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 36216d28d8bd..c54ff2dda8cb 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -583,20 +583,6 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  	return !!dmabuf->ops->pin;
>  }
>  
> -/**
> - * dma_buf_attachment_is_dynamic - check if a DMA-buf attachment uses dynamic
> - * mappings
> - * @attach: the DMA-buf attachment to check
> - *
> - * Returns true if a DMA-buf importer wants to call the map/unmap functions with
> - * the dma_resv lock held.

Yeah this kerneldoc is a bit much outdated :-)

> - */
> -static inline bool
> -dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
> -{
> -	return !!attach->importer_ops;
> -}

With the nits addressed:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima


> -
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
