Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A3ACE218
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E591F10E759;
	Wed,  4 Jun 2025 16:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZQhNVqM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D22C10E759
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:21:15 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-adb5fd85996so3042166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749054074; x=1749658874; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3lYrTX5yYdb8EVsCDMM8XXCq22FAPK3DgHAjM/RcHFM=;
 b=ZQhNVqM+PYKe9m1buV3IT7WK05YlSM4kefFPGd5KGHWsSYNf6oGCEWITJ7g8BDCd8V
 NW0hXZYT/YB/lK/o3Td3NqiaXoyJ3isWIEsbvRGf506XWxeDKAGktcKZwOfi3eRB0We5
 zfgYgs5wIktuaV8VNI2jhFGbDfOvUsuLeoawE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749054074; x=1749658874;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3lYrTX5yYdb8EVsCDMM8XXCq22FAPK3DgHAjM/RcHFM=;
 b=Y7cJtq/drdfwSCJMgRrGt3F2djjlM8jaY8dv4Oi+j4ZgSw51ZZJ8Ib99wUbzsdr7wR
 fOhOzH/q2rNE6CI4XmOVhPIgHu9AwiCm9xm8PyryKYqNOUrPukBnnKzDd5v0j9yhLxoO
 bFP4phGLLjb9619LwnJ6N3TNFp7kj8Gq0qdziMiYxyBYXDWCRn2LgCfcH1/+MgEDvRGe
 cm2VlbGWG7tZwJGRBdxmWsuobYQZBJA801KUHTuyT5+nBlrmX7xUdW+AMAb8q0GH1Tll
 /5fSk0uXSJ9LYNo6+aT7yXqTyQaN9E9IlNai0jc687MbUzslwqXkAZZAgDFbZ8o4q5cc
 7Rxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa4gwsU2v5m2edi0NwSHx0Twl2WAtZWF48nCl3+QkTEaa6Jg7L7+YVfPL2ng5KbwvWd/qk6hMoapU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxQUGLllMDy9ItWBSgENJoVyQFAF7un97UQQkUZg5qlmnwk4kw
 fIpPJRH9XQpCxUHCrA/lcqKpP0qGZMC2EitHrrqfgCGnjF8JyMzfWonZHXnfaVJGA1mw50/oqDS
 KjMpe
X-Gm-Gg: ASbGnct7m4XUwRqMth0QBNw0t6v9hQvwwRwnIZ44oMVGGHGrB0ymvPYk3pKY6D8H3Vh
 zHAUIpOWYJ1jG136bJNnsWEE/e5VVp2Q/NoguO9ZD/UExkEmi7L1iV7PM2gRo9BnNEctiWRXefz
 NxvE976v2tcs3A04BD297gGatxQtAaH7dVXDFBW3pEIcTLH59zH8EQNLTCL72hQT7KBzVan3CJE
 GOVeIdP/RKfv7AEVVN088lYmux3W3e23T+iXLHxT5PnRAzJlGhR4AaIlDpSBpyatdosdLwGcYRc
 gVfpRhBh+YCBxPczuZb8faJSa0RGoPfbTjBd0jixDuNaDgKOjWJ5vJSIVkcJ1k4=
X-Google-Smtp-Source: AGHT+IFLMTGTNKC4g/BVr0CVnUU8Y/o65I/9wNyzUs8TT/uLIUjhZPSU6xV4sVaAHNxYEyN9Me574Q==
X-Received: by 2002:a17:906:2cc7:b0:ad8:93a3:29c1 with SMTP id
 a640c23a62f3a-addf8ea6ef0mr248740466b.37.1749054074249; 
 Wed, 04 Jun 2025 09:21:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-606ea3bd2afsm1222437a12.13.2025.06.04.09.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 09:21:13 -0700 (PDT)
Date: Wed, 4 Jun 2025 18:21:11 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tzimmermann@suse.de, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Message-ID: <aEByd4gidRpxJkfp@phenom.ffwll.local>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEBn9o-bARNut3ek@phenom.ffwll.local>
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

On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
> On Wed, Jun 04, 2025 at 01:32:34PM +0200, Christian König wrote:
> > This was added by Sima +10 years ago as a solution to avoid exporting
> > multiple dma-bufs for the same GEM object. I tried to remove it before,
> > but wasn't 100% sure about all the side effects.
> > 
> > Now Thomas recent modified drm_gem_prime_handle_to_dmabuf() which makes
> > it obvious that this is a superflous step. We try to look up the DMA-buf
> > by handle handle and if that fails for some reason (must likely because
> > the handle is a duplicate) the code just use the DMA-buf from the GEM
> > object.
> > 
> > Just using the DMA-buf from the GEM object in the first place has the
> > same effect as far as I can see.
> 
> So the history is a bit more funny, might want to add that.
> 
> In d0b2c5334f41 ("drm/prime: Always add exported buffers to the handle
> cache") I added this additional lookup. It wasn't part of the bugfix,
> but back then the handle list was just a linked list and you could do
> lookups in either direction. And I guess I felt like doing a quick lookup
> before we grab the next lock makes sense. Premature optimization, I'm
> confessing to the crime guilty as charged :-/
> 
> Then Chris Wilson in 077675c1e8a1 ("drm: Convert prime dma-buf <-> handle
> to rbtree") and added 2 rb trees to support both directions. At that point
> that handle2buf lookup really didn't make much sense anymore, but we just
> kept it and it's been in the tree confusing people ever since.
> 
> With that added:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

lol :-/

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

> 
> 
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c      |  2 +-
> >  drivers/gpu/drm/drm_internal.h |  1 +
> >  drivers/gpu/drm/drm_prime.c    | 56 +++++-----------------------------
> >  3 files changed, 10 insertions(+), 49 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 1e659d2660f7..2eacd86e1cf9 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -282,7 +282,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
> >  	if (obj->funcs->close)
> >  		obj->funcs->close(obj, file_priv);
> >  
> > -	drm_prime_remove_buf_handle(&file_priv->prime, id);
> > +	drm_prime_remove_buf_handle(&file_priv->prime, obj->dma_buf, id);
> >  	drm_vma_node_revoke(&obj->vma_node, file_priv);
> >  
> >  	drm_gem_object_handle_put_unlocked(obj);
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index e44f28fd81d3..504565857f4d 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -86,6 +86,7 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
> >  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
> >  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> >  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> > +				 struct dma_buf *dma_buf,
> >  				 uint32_t handle);
> >  
> >  /* drm_managed.c */
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index d828502268b8..f4facfa469db 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -90,7 +90,6 @@ struct drm_prime_member {
> >  	uint32_t handle;
> >  
> >  	struct rb_node dmabuf_rb;
> > -	struct rb_node handle_rb;
> >  };
> >  
> >  static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> > @@ -122,45 +121,9 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> >  	rb_link_node(&member->dmabuf_rb, rb, p);
> >  	rb_insert_color(&member->dmabuf_rb, &prime_fpriv->dmabufs);
> >  
> > -	rb = NULL;
> > -	p = &prime_fpriv->handles.rb_node;
> > -	while (*p) {
> > -		struct drm_prime_member *pos;
> > -
> > -		rb = *p;
> > -		pos = rb_entry(rb, struct drm_prime_member, handle_rb);
> > -		if (handle > pos->handle)
> > -			p = &rb->rb_right;
> > -		else
> > -			p = &rb->rb_left;
> > -	}
> > -	rb_link_node(&member->handle_rb, rb, p);
> > -	rb_insert_color(&member->handle_rb, &prime_fpriv->handles);
> > -
> >  	return 0;
> >  }
> >  
> > -static struct dma_buf *drm_prime_lookup_buf_by_handle(struct drm_prime_file_private *prime_fpriv,
> > -						      uint32_t handle)
> > -{
> > -	struct rb_node *rb;
> > -
> > -	rb = prime_fpriv->handles.rb_node;
> > -	while (rb) {
> > -		struct drm_prime_member *member;
> > -
> > -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
> > -		if (member->handle == handle)
> > -			return member->dma_buf;
> > -		else if (member->handle < handle)
> > -			rb = rb->rb_right;
> > -		else
> > -			rb = rb->rb_left;
> > -	}
> > -
> > -	return NULL;
> > -}
> > -
> >  static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpriv,
> >  				       struct dma_buf *dma_buf,
> >  				       uint32_t *handle)
> > @@ -186,25 +149,28 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
> >  }
> >  
> >  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> > +				 struct dma_buf *dma_buf,
> >  				 uint32_t handle)
> >  {
> >  	struct rb_node *rb;
> >  
> > +	if (!dma_buf)
> > +		return;
> > +
> >  	mutex_lock(&prime_fpriv->lock);
> >  
> > -	rb = prime_fpriv->handles.rb_node;
> > +	rb = prime_fpriv->dmabufs.rb_node;
> >  	while (rb) {
> >  		struct drm_prime_member *member;
> >  
> > -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
> > -		if (member->handle == handle) {
> > -			rb_erase(&member->handle_rb, &prime_fpriv->handles);
> > +		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> > +		if (member->dma_buf == dma_buf && member->handle == handle) {
> >  			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
> >  
> >  			dma_buf_put(member->dma_buf);
> >  			kfree(member);
> >  			break;
> > -		} else if (member->handle < handle) {
> > +		} else if (member->dma_buf < dma_buf) {
> >  			rb = rb->rb_right;
> >  		} else {
> >  			rb = rb->rb_left;
> > @@ -446,12 +412,6 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
> >  		goto out_unlock;
> >  	}
> >  
> > -	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
> > -	if (dmabuf) {
> > -		get_dma_buf(dmabuf);
> > -		goto out;
> > -	}
> > -
> >  	mutex_lock(&dev->object_name_lock);
> >  	/* re-export the original imported/exported object */
> >  	if (obj->dma_buf) {
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
