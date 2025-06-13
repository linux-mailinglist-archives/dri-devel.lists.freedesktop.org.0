Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B0AD88E0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 12:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F3C10E962;
	Fri, 13 Jun 2025 10:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A02Dv2Qc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A110E962
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749809386; x=1781345386;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YEELuWDyWPXz42Olc3aOzwu4ga/EoS9qYme+NA5beNs=;
 b=A02Dv2QccodhowX41f0+Ae8Y6ffHbnzQFdyavh+xda1AlvqIssIzbku+
 EWloVVrkAE81y0ZU3apEuTKtTdPpcEK2mLjXu7yQ722bQKpc0waZjCPk9
 RCCmtqC3v85PxbGxEKb9SD7aUqceBsxT0aIMQhUjaPccXiKX69epffQoh
 Xm+Ud3NVcX18190h8mra7emMdJfkl9S+YPJaFlj4AINJwZLtHrgY15z4K
 7vzKCWmpVEg8x7fsPdYKUHnS2IvrpKmjVnDmAOgcij2BoiCMokePm8nAh
 tsN5M30WiYJwQxCALdD3H+8RWWYXoKXXZnbbUzvJvrIc7UonVcjy5bxxo Q==;
X-CSE-ConnectionGUID: 8CjMqFWBTYi5Hyv7sILXyg==
X-CSE-MsgGUID: vUiDdtx8TIeaSVWdSYZ7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52117035"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="52117035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:09:46 -0700
X-CSE-ConnectionGUID: IZIDPwYHQ+CVzGGmAmRpjw==
X-CSE-MsgGUID: 9PSlw5B8QiGylmI/IpzOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148341449"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.26])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:09:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Christian =?utf-8?Q?K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>
Cc: tzimmermann@suse.de, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
In-Reply-To: <aEByd4gidRpxJkfp@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local>
 <aEByd4gidRpxJkfp@phenom.ffwll.local>
Date: Fri, 13 Jun 2025 13:09:40 +0300
Message-ID: <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
>> On Wed, Jun 04, 2025 at 01:32:34PM +0200, Christian K=C3=B6nig wrote:
>> > This was added by Sima +10 years ago as a solution to avoid exporting
>> > multiple dma-bufs for the same GEM object. I tried to remove it before,
>> > but wasn't 100% sure about all the side effects.
>> >=20
>> > Now Thomas recent modified drm_gem_prime_handle_to_dmabuf() which makes
>> > it obvious that this is a superflous step. We try to look up the DMA-b=
uf
>> > by handle handle and if that fails for some reason (must likely because
>> > the handle is a duplicate) the code just use the DMA-buf from the GEM
>> > object.
>> >=20
>> > Just using the DMA-buf from the GEM object in the first place has the
>> > same effect as far as I can see.
>>=20
>> So the history is a bit more funny, might want to add that.
>>=20
>> In d0b2c5334f41 ("drm/prime: Always add exported buffers to the handle
>> cache") I added this additional lookup. It wasn't part of the bugfix,
>> but back then the handle list was just a linked list and you could do
>> lookups in either direction. And I guess I felt like doing a quick lookup
>> before we grab the next lock makes sense. Premature optimization, I'm
>> confessing to the crime guilty as charged :-/
>>=20
>> Then Chris Wilson in 077675c1e8a1 ("drm: Convert prime dma-buf <-> handle
>> to rbtree") and added 2 rb trees to support both directions. At that poi=
nt
>> that handle2buf lookup really didn't make much sense anymore, but we just
>> kept it and it's been in the tree confusing people ever since.
>>=20
>> With that added:
>>=20
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> lol :-/
>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>
> Cheers, Sima

This regressed one of our CI IGT tests [1].

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463



>
>>=20
>>=20
>> >=20
>> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>> > ---
>> >  drivers/gpu/drm/drm_gem.c      |  2 +-
>> >  drivers/gpu/drm/drm_internal.h |  1 +
>> >  drivers/gpu/drm/drm_prime.c    | 56 +++++-----------------------------
>> >  3 files changed, 10 insertions(+), 49 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> > index 1e659d2660f7..2eacd86e1cf9 100644
>> > --- a/drivers/gpu/drm/drm_gem.c
>> > +++ b/drivers/gpu/drm/drm_gem.c
>> > @@ -282,7 +282,7 @@ drm_gem_object_release_handle(int id, void *ptr, v=
oid *data)
>> >  	if (obj->funcs->close)
>> >  		obj->funcs->close(obj, file_priv);
>> >=20=20
>> > -	drm_prime_remove_buf_handle(&file_priv->prime, id);
>> > +	drm_prime_remove_buf_handle(&file_priv->prime, obj->dma_buf, id);
>> >  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>> >=20=20
>> >  	drm_gem_object_handle_put_unlocked(obj);
>> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inte=
rnal.h
>> > index e44f28fd81d3..504565857f4d 100644
>> > --- a/drivers/gpu/drm/drm_internal.h
>> > +++ b/drivers/gpu/drm/drm_internal.h
>> > @@ -86,6 +86,7 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *=
dev, void *data,
>> >  void drm_prime_init_file_private(struct drm_prime_file_private *prime=
_fpriv);
>> >  void drm_prime_destroy_file_private(struct drm_prime_file_private *pr=
ime_fpriv);
>> >  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime=
_fpriv,
>> > +				 struct dma_buf *dma_buf,
>> >  				 uint32_t handle);
>> >=20=20
>> >  /* drm_managed.c */
>> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> > index d828502268b8..f4facfa469db 100644
>> > --- a/drivers/gpu/drm/drm_prime.c
>> > +++ b/drivers/gpu/drm/drm_prime.c
>> > @@ -90,7 +90,6 @@ struct drm_prime_member {
>> >  	uint32_t handle;
>> >=20=20
>> >  	struct rb_node dmabuf_rb;
>> > -	struct rb_node handle_rb;
>> >  };
>> >=20=20
>> >  static int drm_prime_add_buf_handle(struct drm_prime_file_private *pr=
ime_fpriv,
>> > @@ -122,45 +121,9 @@ static int drm_prime_add_buf_handle(struct drm_pr=
ime_file_private *prime_fpriv,
>> >  	rb_link_node(&member->dmabuf_rb, rb, p);
>> >  	rb_insert_color(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>> >=20=20
>> > -	rb =3D NULL;
>> > -	p =3D &prime_fpriv->handles.rb_node;
>> > -	while (*p) {
>> > -		struct drm_prime_member *pos;
>> > -
>> > -		rb =3D *p;
>> > -		pos =3D rb_entry(rb, struct drm_prime_member, handle_rb);
>> > -		if (handle > pos->handle)
>> > -			p =3D &rb->rb_right;
>> > -		else
>> > -			p =3D &rb->rb_left;
>> > -	}
>> > -	rb_link_node(&member->handle_rb, rb, p);
>> > -	rb_insert_color(&member->handle_rb, &prime_fpriv->handles);
>> > -
>> >  	return 0;
>> >  }
>> >=20=20
>> > -static struct dma_buf *drm_prime_lookup_buf_by_handle(struct drm_prim=
e_file_private *prime_fpriv,
>> > -						      uint32_t handle)
>> > -{
>> > -	struct rb_node *rb;
>> > -
>> > -	rb =3D prime_fpriv->handles.rb_node;
>> > -	while (rb) {
>> > -		struct drm_prime_member *member;
>> > -
>> > -		member =3D rb_entry(rb, struct drm_prime_member, handle_rb);
>> > -		if (member->handle =3D=3D handle)
>> > -			return member->dma_buf;
>> > -		else if (member->handle < handle)
>> > -			rb =3D rb->rb_right;
>> > -		else
>> > -			rb =3D rb->rb_left;
>> > -	}
>> > -
>> > -	return NULL;
>> > -}
>> > -
>> >  static int drm_prime_lookup_buf_handle(struct drm_prime_file_private =
*prime_fpriv,
>> >  				       struct dma_buf *dma_buf,
>> >  				       uint32_t *handle)
>> > @@ -186,25 +149,28 @@ static int drm_prime_lookup_buf_handle(struct dr=
m_prime_file_private *prime_fpri
>> >  }
>> >=20=20
>> >  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime=
_fpriv,
>> > +				 struct dma_buf *dma_buf,
>> >  				 uint32_t handle)
>> >  {
>> >  	struct rb_node *rb;
>> >=20=20
>> > +	if (!dma_buf)
>> > +		return;
>> > +
>> >  	mutex_lock(&prime_fpriv->lock);
>> >=20=20
>> > -	rb =3D prime_fpriv->handles.rb_node;
>> > +	rb =3D prime_fpriv->dmabufs.rb_node;
>> >  	while (rb) {
>> >  		struct drm_prime_member *member;
>> >=20=20
>> > -		member =3D rb_entry(rb, struct drm_prime_member, handle_rb);
>> > -		if (member->handle =3D=3D handle) {
>> > -			rb_erase(&member->handle_rb, &prime_fpriv->handles);
>> > +		member =3D rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>> > +		if (member->dma_buf =3D=3D dma_buf && member->handle =3D=3D handle)=
 {
>> >  			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>> >=20=20
>> >  			dma_buf_put(member->dma_buf);
>> >  			kfree(member);
>> >  			break;
>> > -		} else if (member->handle < handle) {
>> > +		} else if (member->dma_buf < dma_buf) {
>> >  			rb =3D rb->rb_right;
>> >  		} else {
>> >  			rb =3D rb->rb_left;
>> > @@ -446,12 +412,6 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(st=
ruct drm_device *dev,
>> >  		goto out_unlock;
>> >  	}
>> >=20=20
>> > -	dmabuf =3D drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
>> > -	if (dmabuf) {
>> > -		get_dma_buf(dmabuf);
>> > -		goto out;
>> > -	}
>> > -
>> >  	mutex_lock(&dev->object_name_lock);
>> >  	/* re-export the original imported/exported object */
>> >  	if (obj->dma_buf) {
>> > --=20
>> > 2.34.1
>> >=20
>>=20
>> --=20
>> Simona Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

--=20
Jani Nikula, Intel
