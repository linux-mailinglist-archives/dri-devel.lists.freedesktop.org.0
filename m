Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09351A38919
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A783A10E287;
	Mon, 17 Feb 2025 16:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="lK6gqQN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FFA10E287
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:28:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38f24fc466aso3248310f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739809688; x=1740414488; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N/MZAQpQPgkaOz9Nq3UpoejEMSS/cNqsJ8jUh5q1IAs=;
 b=lK6gqQN0I40DEBGZB9LTU4m3T9dNwOHQYLyq2S+AkwhVnWnOEA32YJocIOp5bhY/6J
 cX7OijNSGbfo1DtlpLdP2nZEsanzN8lkM+ePaL8a3RSy7+lbO5l54AOmnrXm1S3wVs+T
 wkHoI5BFuHa59/Ds+bFz2CERkHZ7ndbAgrT4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739809688; x=1740414488;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/MZAQpQPgkaOz9Nq3UpoejEMSS/cNqsJ8jUh5q1IAs=;
 b=RIo6LYgqZXPMxjlG1qq5PJUPJCyBSFzx2xpMx0xOy5UnKdVhIA8edhkadE5qDZd8++
 oOqQ4UCqu9TDRQSf15jQOq/mrFCYPg1WKxjk978ia54bV7AtK50l+xdgh+9GDmF02zLU
 ijx8N5e/c1VhQuEBuUuMdB4T4TyQH8X9V6A6JUuMNEtG3H46sLAp/aDVi5UTn4h8SzCR
 4C57V7Mw9E57JUtsAjKj7RM8zoY1lXY2Dp/FtA1dL7+gwIPlqQhaCRD+hNW38IJp2Ulp
 kmjjU6oFPzs+r6oLRGWPzyPeAAIiYR70ODflcUl2RkxZc8SPXozYzkb81Cf9LTiwlqnW
 gI4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+P77L720oKsx9A1fpv6FPOXmZDdeQjCMuLUIbOk/sw+Hk1WLkYuCM7AgrZOZMPqT64T50AF2ZuTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo3nGFwZ4T3wS+VnLngG0NS77P/lPprAAfz2q9TCH+kwreNUQ5
 aNcSs3pgg7wOUmG/UtkM9VBOGaVwO0ahBXqK55S+ApIY3Fis+8xZ7kwiGo5hmPE=
X-Gm-Gg: ASbGncu95qG82uX9femMGJfMijwUnmmetyBHsB7b02RwjOAz6tDSsL1dcVoS3xLOEee
 BLx8pQPFFbFdM8Ku3dXeaznaHQbUAzV9lkPoypzmyn6UTNBo+1u+gZedKyxNaG9CO0Ccr0O3ZTf
 bz1f51u+AQy4J8zq1KJBZkVF3Ag0nPNDigdjzbIKXz7ivYqep3U2JEKcr6XYHtZY7eHpVgUlBbk
 kRQx5inwKxtle74O3X57vh/dPVtUKZ5bb0XEOTmL7DCkKGLpNPicgNqPv/ZtV33u4+MnbF+czAJ
 q9SXxqWFhVrWyHc01VgRRpFyAFE=
X-Google-Smtp-Source: AGHT+IHu9KoE7wj7SL+2GqP0NTYUrWqabVAskWhzzDZBN8Yy0ohp5PY3zQnOSOQ2f5sInwhpbEhIFA==
X-Received: by 2002:a5d:44d1:0:b0:38f:2176:45a0 with SMTP id
 ffacd0b85a97d-38f33f511edmr8418553f8f.33.1739809688126; 
 Mon, 17 Feb 2025 08:28:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbb2sm12438602f8f.40.2025.02.17.08.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:28:07 -0800 (PST)
Date: Mon, 17 Feb 2025 17:28:05 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/4] dma-buf: drop caching of sg_tables
Message-ID: <Z7NjlfKYlxhTgRqe@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-5-christian.koenig@amd.com>
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

On Tue, Feb 11, 2025 at 05:31:09PM +0100, Christian König wrote:
> That was purely for the transition from static to dynamic dma-buf
> handling and can be removed again now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yay!

Might uncover some fun if people have meanwhile started to rely on this
for perf or something. But we'll figure that out when it happens.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>


> ---
>  drivers/dma-buf/dma-buf.c              | 34 --------------------------
>  drivers/dma-buf/udmabuf.c              |  1 -
>  drivers/gpu/drm/drm_prime.c            |  1 -
>  drivers/gpu/drm/virtio/virtgpu_prime.c |  1 -
>  include/linux/dma-buf.h                | 13 ----------
>  5 files changed, 50 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 357b94a3dbaa..35221c4ddbf5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -636,10 +636,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  		    || !exp_info->ops->release))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
> -		    (exp_info->ops->pin || exp_info->ops->unpin)))
> -		return ERR_PTR(-EINVAL);
> -
>  	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
>  		return ERR_PTR(-EINVAL);
>  
> @@ -964,17 +960,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  		return;
>  
>  	dma_resv_lock(dmabuf->resv, NULL);
> -
> -	if (attach->sgt) {
> -		mangle_sg_table(attach->sgt);
> -		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
> -						   attach->dir);
> -
> -		if (dma_buf_pin_on_map(attach))
> -			dma_buf_unpin(attach);
> -	}
>  	list_del(&attach->node);
> -
>  	dma_resv_unlock(dmabuf->resv);
>  
>  	if (dmabuf->ops->detach)
> @@ -1069,18 +1055,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  
>  	dma_resv_assert_held(attach->dmabuf->resv);
>  
> -	if (attach->sgt) {
> -		/*
> -		 * Two mappings with different directions for the same
> -		 * attachment are not allowed.
> -		 */
> -		if (attach->dir != direction &&
> -		    attach->dir != DMA_BIDIRECTIONAL)
> -			return ERR_PTR(-EBUSY);
> -
> -		return attach->sgt;
> -	}
> -
>  	if (dma_buf_pin_on_map(attach)) {
>  		ret = attach->dmabuf->ops->pin(attach);
>  		if (ret)
> @@ -1105,11 +1079,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  	}
>  	mangle_sg_table(sg_table);
>  
> -	if (attach->dmabuf->ops->cache_sgt_mapping) {
> -		attach->sgt = sg_table;
> -		attach->dir = direction;
> -	}
> -
>  #ifdef CONFIG_DMA_API_DEBUG
>  	{
>  		struct scatterlist *sg;
> @@ -1190,9 +1159,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>  
>  	dma_resv_assert_held(attach->dmabuf->resv);
>  
> -	if (attach->sgt == sg_table)
> -		return;
> -
>  	mangle_sg_table(sg_table);
>  	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>  
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index cc7398cc17d6..2fa2c9135eac 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -285,7 +285,6 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
>  }
>  
>  static const struct dma_buf_ops udmabuf_ops = {
> -	.cache_sgt_mapping = true,
>  	.map_dma_buf	   = map_udmabuf,
>  	.unmap_dma_buf	   = unmap_udmabuf,
>  	.release	   = release_udmabuf,
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67..c284f306d597 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -810,7 +810,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>  EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
>  
>  static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
> -	.cache_sgt_mapping = true,
>  	.attach = drm_gem_map_attach,
>  	.detach = drm_gem_map_detach,
>  	.map_dma_buf = drm_gem_map_dma_buf,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index fe6a0b018571..c6f3be3cb914 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -75,7 +75,6 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>  
>  static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>  	.ops = {
> -		.cache_sgt_mapping = true,
>  		.attach = virtio_dma_buf_attach,
>  		.detach = drm_gem_map_detach,
>  		.map_dma_buf = virtgpu_gem_map_dma_buf,
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index c54ff2dda8cb..544f8f8c3f44 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -34,15 +34,6 @@ struct dma_buf_attachment;
>   * @vunmap: [optional] unmaps a vmap from the buffer
>   */
>  struct dma_buf_ops {
> -	/**
> -	  * @cache_sgt_mapping:
> -	  *
> -	  * If true the framework will cache the first mapping made for each
> -	  * attachment. This avoids creating mappings for attachments multiple
> -	  * times.
> -	  */
> -	bool cache_sgt_mapping;
> -
>  	/**
>  	 * @attach:
>  	 *
> @@ -493,8 +484,6 @@ struct dma_buf_attach_ops {
>   * @dmabuf: buffer for this attachment.
>   * @dev: device attached to the buffer.
>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
> - * @sgt: cached mapping.
> - * @dir: direction of cached mapping.
>   * @peer2peer: true if the importer can handle peer resources without pages.
>   * @priv: exporter specific attachment data.
>   * @importer_ops: importer operations for this attachment, if provided
> @@ -514,8 +503,6 @@ struct dma_buf_attachment {
>  	struct dma_buf *dmabuf;
>  	struct device *dev;
>  	struct list_head node;
> -	struct sg_table *sgt;
> -	enum dma_data_direction dir;
>  	bool peer2peer;
>  	const struct dma_buf_attach_ops *importer_ops;
>  	void *importer_priv;
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
