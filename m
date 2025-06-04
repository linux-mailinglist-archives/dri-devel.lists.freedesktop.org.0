Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56422ACE195
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF1B10E696;
	Wed,  4 Jun 2025 15:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jnHzwsqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC2310E696
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 15:36:26 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-442ea341570so49832395e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749051385; x=1749656185; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/SCPvZiYHjkK7zoDlHp30cUPbDhijXHtTUnOmZ1ILuE=;
 b=jnHzwsqNfygdBAyqUwM/CYI74CuDxT00gGATHEyzPa5ydSF4G5r07evmqhUXTy2sIy
 xQujnHRqGq2yE/smplYx5OvieEqkGBuMHwBWLnBURjIqp8j2jypOoZdt7YHnnkIdX+5t
 3fudYUrh8LzbVmR3h/RU6AAegjCToHAoX4M88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749051385; x=1749656185;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/SCPvZiYHjkK7zoDlHp30cUPbDhijXHtTUnOmZ1ILuE=;
 b=DIZr5bBjMF0BFMqsMNVAzXmOJkSAxjd77diHWUjtMmEoiMtzQom6//jo3VPXkmaqy/
 w5t+R4/XGyy79Te4EQRFDTu88gVx7RDIMrsn7GW9H71naDqrTXbCZwgN715EAguhg6Hb
 zPOGYRYt2xLVaBQ/H8uAl1DzQkNPJNpUUO1QcN15ROxutKguQuTsIAZlI4KEhmae9y/B
 oO2vearwmH9j48kMU6msXfoTxB4narBqdiIyeAg5LTR5mX/1bw4LiR0IhW+qXOB4jCwT
 Ii9/fmJBFbQDqBlBeueDcDmncGE24e/fbMuEN3zMLS4+9zeKbcjURFNt4fxWTDNle1f/
 qK1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIIir2aN3j8ekHF0MzIR14HA+5WxS2hpHrP2ogqmfxmfItbfGoSn4Ku46KNCW95vFimPYrulkrhVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYIdeasYDRGnOZZ9rgcMVQTdba+0Na+6J0KR/5ylATZXPKMttt
 85m/R5ajlqcuFdlmgKyUR9nSyI5f7lmLLEEgMSDdK8m43ksQeC07WYOPzun6wCHMIKs=
X-Gm-Gg: ASbGncvuMjilDM/A5+/O7dXkYfDlb+zuST6kMTZ+M+78LQurAnUAt9P0XIwZEZ/yYI+
 ZUTBTbDZ30VVbGmWduGdOKrjtTDJbNcXzNsS+s6L+HaYlbCZXl0OzVQOZ2dpl3eG+UlLShLpZNZ
 5yvH6mDHwItWghGoRUZYrnPsBNQN+3nP8S/OOA0DJYVsfggKl55OrHtmfXLCo0DE1+wAJgDC6HF
 AujTLeCabLPrfCQDdEDOryiDuRODlLA8AATkpKoTYehSetCAMggFkLpIK3rIEHrI4ZjKprFOLvf
 fV9C1GWOSaRCfMtpEHZAYD14QSuuzetLVfGL5N/wVtYI7l6asx3Wr2+wvq8V/no=
X-Google-Smtp-Source: AGHT+IEL5ZPIcSlFAgC0KcFUaoGYNPzRcyzvuV5PGuN4i1Ht2gHXL4SvErVVOg9pPMyLWcnL5AnTlg==
X-Received: by 2002:a05:6000:2306:b0:3a4:f2aa:2e32 with SMTP id
 ffacd0b85a97d-3a51d97c186mr3011862f8f.44.1749051385275; 
 Wed, 04 Jun 2025 08:36:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f8f188sm204748415e9.3.2025.06.04.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 08:36:24 -0700 (PDT)
Date: Wed, 4 Jun 2025 17:36:22 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tzimmermann@suse.de, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Message-ID: <aEBn9o-bARNut3ek@phenom.ffwll.local>
References: <20250604113234.2520-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604113234.2520-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, Jun 04, 2025 at 01:32:34PM +0200, Christian König wrote:
> This was added by Sima +10 years ago as a solution to avoid exporting
> multiple dma-bufs for the same GEM object. I tried to remove it before,
> but wasn't 100% sure about all the side effects.
> 
> Now Thomas recent modified drm_gem_prime_handle_to_dmabuf() which makes
> it obvious that this is a superflous step. We try to look up the DMA-buf
> by handle handle and if that fails for some reason (must likely because
> the handle is a duplicate) the code just use the DMA-buf from the GEM
> object.
> 
> Just using the DMA-buf from the GEM object in the first place has the
> same effect as far as I can see.

So the history is a bit more funny, might want to add that.

In d0b2c5334f41 ("drm/prime: Always add exported buffers to the handle
cache") I added this additional lookup. It wasn't part of the bugfix,
but back then the handle list was just a linked list and you could do
lookups in either direction. And I guess I felt like doing a quick lookup
before we grab the next lock makes sense. Premature optimization, I'm
confessing to the crime guilty as charged :-/

Then Chris Wilson in 077675c1e8a1 ("drm: Convert prime dma-buf <-> handle
to rbtree") and added 2 rb trees to support both directions. At that point
that handle2buf lookup really didn't make much sense anymore, but we just
kept it and it's been in the tree confusing people ever since.

With that added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_gem.c      |  2 +-
>  drivers/gpu/drm/drm_internal.h |  1 +
>  drivers/gpu/drm/drm_prime.c    | 56 +++++-----------------------------
>  3 files changed, 10 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1e659d2660f7..2eacd86e1cf9 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> -	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +	drm_prime_remove_buf_handle(&file_priv->prime, obj->dma_buf, id);
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
>  	drm_gem_object_handle_put_unlocked(obj);
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index e44f28fd81d3..504565857f4d 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -86,6 +86,7 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +				 struct dma_buf *dma_buf,
>  				 uint32_t handle);
>  
>  /* drm_managed.c */
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d828502268b8..f4facfa469db 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -90,7 +90,6 @@ struct drm_prime_member {
>  	uint32_t handle;
>  
>  	struct rb_node dmabuf_rb;
> -	struct rb_node handle_rb;
>  };
>  
>  static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> @@ -122,45 +121,9 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  	rb_link_node(&member->dmabuf_rb, rb, p);
>  	rb_insert_color(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>  
> -	rb = NULL;
> -	p = &prime_fpriv->handles.rb_node;
> -	while (*p) {
> -		struct drm_prime_member *pos;
> -
> -		rb = *p;
> -		pos = rb_entry(rb, struct drm_prime_member, handle_rb);
> -		if (handle > pos->handle)
> -			p = &rb->rb_right;
> -		else
> -			p = &rb->rb_left;
> -	}
> -	rb_link_node(&member->handle_rb, rb, p);
> -	rb_insert_color(&member->handle_rb, &prime_fpriv->handles);
> -
>  	return 0;
>  }
>  
> -static struct dma_buf *drm_prime_lookup_buf_by_handle(struct drm_prime_file_private *prime_fpriv,
> -						      uint32_t handle)
> -{
> -	struct rb_node *rb;
> -
> -	rb = prime_fpriv->handles.rb_node;
> -	while (rb) {
> -		struct drm_prime_member *member;
> -
> -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
> -		if (member->handle == handle)
> -			return member->dma_buf;
> -		else if (member->handle < handle)
> -			rb = rb->rb_right;
> -		else
> -			rb = rb->rb_left;
> -	}
> -
> -	return NULL;
> -}
> -
>  static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				       struct dma_buf *dma_buf,
>  				       uint32_t *handle)
> @@ -186,25 +149,28 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
>  }
>  
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +				 struct dma_buf *dma_buf,
>  				 uint32_t handle)
>  {
>  	struct rb_node *rb;
>  
> +	if (!dma_buf)
> +		return;
> +
>  	mutex_lock(&prime_fpriv->lock);
>  
> -	rb = prime_fpriv->handles.rb_node;
> +	rb = prime_fpriv->dmabufs.rb_node;
>  	while (rb) {
>  		struct drm_prime_member *member;
>  
> -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
> -		if (member->handle == handle) {
> -			rb_erase(&member->handle_rb, &prime_fpriv->handles);
> +		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> +		if (member->dma_buf == dma_buf && member->handle == handle) {
>  			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>  
>  			dma_buf_put(member->dma_buf);
>  			kfree(member);
>  			break;
> -		} else if (member->handle < handle) {
> +		} else if (member->dma_buf < dma_buf) {
>  			rb = rb->rb_right;
>  		} else {
>  			rb = rb->rb_left;
> @@ -446,12 +412,6 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
>  		goto out_unlock;
>  	}
>  
> -	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
> -	if (dmabuf) {
> -		get_dma_buf(dmabuf);
> -		goto out;
> -	}
> -
>  	mutex_lock(&dev->object_name_lock);
>  	/* re-export the original imported/exported object */
>  	if (obj->dma_buf) {
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
