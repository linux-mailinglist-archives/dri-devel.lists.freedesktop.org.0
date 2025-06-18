Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C22ADEE9B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D6B10E852;
	Wed, 18 Jun 2025 13:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XLb0U9Su";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431510E852
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:57:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so10652962a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750255058; x=1750859858; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XbaxxxxlsK1/WbFmos2jPouear+VV9P5VeLTIDzDubU=;
 b=XLb0U9Su6LZRbKp0qG8mwi76tgAF+XjckKCBxiZKUNwMjcZ4dM0RAycpIS0sluyGXP
 US4NsKbLRR+Sma0vn8gRdQMmcEH0vDk782Daa2+JBwMBpmVgdciW21gzD+e+Q5siXiVm
 jtEN9GJ20AvKKyukNnz1UyprghC/0UNZtb6sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750255058; x=1750859858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbaxxxxlsK1/WbFmos2jPouear+VV9P5VeLTIDzDubU=;
 b=LLRmDE0dJ9wWrk5WMarsQVFj9MhFDsNY6FesyzTpKFBtFzmXxqgYkX+/O59hP0P1ZH
 3ZitajQC4O13lgMeg3c5HO16UzN2BWYhUdzQa8tj0dD0Rt7uzB6ewZAd3z7IVg5epIyh
 /6VqnDS8FcUt1s5/kigcSSorMUaPw/9lSn13z/L6rJm1u3HAVmRayFWv4tmZKUj21/aW
 OUPxxRo/b4CR0Jj2gpB5ksn0R2kMuToAJeN3tHrDNgyjvfz/qBd+x6zLS+wAvoKJlRtF
 VSAOXmRWONTKputWxSF3X0x0ILa4wJDhAXGj5GHXeaA9beDwLA+lSDAMPBqJS3nzELX2
 xilg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrUH2pJLT5ocjNM7HZ5lVldeKbmuk06Hxo7CY0hs+tYGRKlEqkNhi1wjdqSq2jUxa921Lt2mSiID0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhJ2zc3WTQ/l7N6hc4B9qxgiLZFUEnHIzwzBeemHZhrJQbgScs
 KxGD5tSjapoN1JrtkVITBpIcoAKJkcRlCB6oiRoF+OrUMKCwl78hsIZS/oamkAWEJ1w=
X-Gm-Gg: ASbGnctv0AT81RntvyqNlQFgl3XbJeVMB8YvUDhpwaYFV/VVhN8dwir0QuLedhDJXJ5
 YUF7LGSa+RtcmSrLett6quEAlIK1OUe6lFs5pOymE1sE7cpSqfzH+5bHxaGKzJrHBc5jGGbVN5n
 brEkCQiT8lRpgXEYSaUBeak+KdnDlenZ7CZIZ9Uk5AqVxPOkqOCYGb35tfFvCVbm5qdAljtBiQ0
 GUchvFV27SDMTBueQn4PAEBtBJOE1zPPzTrdaIlqClqrH4St8NZtlqC26XpeYPtR+i2Av4Tap+3
 3n2TriRQFzupM72FCCDRN37MOxSBnJKEanQrLXB/X3bXRrMoFqqFkpAO5Xx50i4NkWPBtK94lA=
 =
X-Google-Smtp-Source: AGHT+IHSLvWaxr+yFt86isAiGtpM4boKjYyQcs4o/wVXByNvnpRd3h/hwuvizch2sRm38xRaf1aVBA==
X-Received: by 2002:a05:6402:2811:b0:607:6097:2faa with SMTP id
 4fb4d7f45d1cf-608d08b5d2fmr14774994a12.8.1750255057949; 
 Wed, 18 Jun 2025 06:57:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60900cdd4f1sm6851187a12.2.2025.06.18.06.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 06:57:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:57:35 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 8/8] drm/xe: Allow mapping DMA-BUF buffer objects
 connected through IAF
Message-ID: <aFLFz_20G9R8h-Tu@phenom.ffwll.local>
References: <20250613134520.2458175-10-dev@lankhorst.se>
 <20250613134520.2458175-18-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134520.2458175-18-dev@lankhorst.se>
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

On Fri, Jun 13, 2025 at 03:45:27PM +0200, Maarten Lankhorst wrote:
> IAF allows multiple xe devices to import VRAM from each other.
> It's mapped as local VRAM, but outside the local device range.
> 
> To support this, Xe is changed to allow a special case of
> same-implementation importing with direction = DMA_NONE.
> 
> If this DMA direction is used, the physical VRAM addresses are exported,
> and can be imported into a xe_vm with the device memory bit set.
> 
> In order to prevent bugs, we ensure that this is only allowed for
> xe <-> xe imports/exports, and only when the VRAM flag is set.
> 
> If any of the steps required fails for IAF-import, the default
> non-IAF import path is attempted.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 85 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_bo.h           |  2 +
>  drivers/gpu/drm/xe/xe_dma_buf.c      | 27 ++++++++-
>  drivers/gpu/drm/xe/xe_dma_buf.h      |  1 +
>  drivers/gpu/drm/xe/xe_ggtt.c         |  4 +-
>  drivers/gpu/drm/xe/xe_iaf.c          | 42 ++++++++++++++
>  drivers/gpu/drm/xe/xe_iaf.h          | 16 ++++++
>  drivers/gpu/drm/xe/xe_pt.c           |  4 ++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 23 +++++---
>  drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>  10 files changed, 184 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021ab..13f0c685a012f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -24,6 +24,7 @@
>  #include "xe_drm_client.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_iaf.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
>  #include "xe_pm.h"
> @@ -82,6 +83,11 @@ bool mem_type_is_vram(u32 mem_type)
>  	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
>  }
>  
> +bool xe_bo_is_iaf(struct xe_bo *bo)
> +{
> +	return bo->flags & XE_BO_FLAG_IAF;
> +}
> +
>  static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
>  {
>  	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
> @@ -656,6 +662,68 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  	return ret;
>  }
>  
> +static void bo_unmap_dma_buf(struct xe_bo *bo)
> +{
> +	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
> +	struct dma_buf_attachment *attach = bo->ttm.base.import_attach;
> +	struct dma_buf *dmabuf;
> +
> +	if (xe_bo_is_iaf(bo))
> +		dir = DMA_NONE;
> +
> +	dma_buf_unmap_attachment(attach, bo->ttm.sg, dir);
> +	bo->ttm.sg = NULL;
> +
> +	if (xe_bo_is_iaf(bo)) {
> +		/* Cleanup IAF bindings */
> +		dmabuf = attach->dmabuf;
> +		xe_iaf_mapping_put(xe_bo_device(gem_to_xe_bo(dmabuf->priv))->iaf);
> +		xe_iaf_mapping_put(xe_bo_device(bo)->iaf);
> +		bo->flags &= ~XE_BO_FLAG_IAF;
> +	}
> +}
> +
> +static struct sg_table *bo_map_dma_buf(struct xe_bo *bo)
> +{
> +	struct dma_buf_attachment *attach = bo->ttm.base.import_attach;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	struct sg_table *sg;
> +
> +	if (is_xe_dma_buf(dmabuf)) {
> +		struct xe_device *src = xe_bo_device(gem_to_xe_bo(dmabuf->priv));
> +		struct xe_device *dst = xe_bo_device(bo);
> +		int err;
> +
> +		if (!xe_iaf_fabrics_connected(dst->iaf, src->iaf))

Ok, so bunch of comments on the actual interface below, but I also looked
at the iaf patches to see how that's all implemented. And it's not the
worst hand-rolled locking and refcounting I've seen, but I'm pretty sure
it's buggy. Specifically the wait_for_completion_killable() in
mappings_ref_wait() means that a simple ^C on module unload or sysfs
unbind gives you a nice kernel UAF.

[Aside: the other wait_for_completion_killable() also look equally fishy]

I think the right way to sort that issue out is:

- refcount the structures with a proper kref_t.

- no waiting for access to cease (that needs to be protected by the
  separate mutex you have, and not dropping that lock between checkis and
  ref acquisition here is another reason why I think you want a single
  xe_iaf_() interface that takes care of everything). Instead all
  functions need to check whether the hw is gone and just bail out in that
  case.

- You need to nuke all dma_buf mappings with the move_notify stuff. That's
  needed for p2p dma already anyway, so if that's not there we have bigger
  issues. IAF just makes this problem bigger.

I think ideally we'd not hand-roll this all, but component doesn't really
fit that well for reasons. And I'm not sure anything else exists that
makes sense. I've had some chats with amd folks over the years about how
to do this all, and it's a ton of work. The important part is to have at
least some refcounting instead of only relying on locking, you have that,
so for me this is good enough. But the implementation needs to be fixed to
not be exploitable with a SIGKILL ;-)

> +			goto no_iaf;
> +
> +		err = xe_iaf_mapping_get(dst->iaf);
> +		if (err) {
> +			drm_warn(&dst->drm, "Getting DST IAF mapping ref failed with %pe", ERR_PTR(err));
> +			goto no_iaf;
> +		}
> +
> +		err = xe_iaf_mapping_get(src->iaf);
> +		if (err) {
> +			drm_warn(&src->drm, "Getting SRC IAF mapping ref failed with %pe", ERR_PTR(err));
> +			goto err_put_dst;
> +		}
> +
> +		sg = dma_buf_map_attachment(attach, DMA_NONE);

I think this is a bit too much of a hack, especially since you also need
to do a bunch of refcounting outside of the dma_buf call, so you
definitely have a different contract here. I think much better would be to
just have an xe_iaf_map_attachment, which does it all:


	if (is_xe_dma_buf(dmabuf)) {
		err = xe_iaf_map_attachment(attach);
		if (err)
			goto no_iaf;
	}	

I also think there's a missing fallback here for the case where you can't
migrate the bo into vram. I guess eventually you want a mode that forces
iaf access mode, but that would need to be checked in VM_BIND or similar:
Essentially checking that the placements are vram only and you have iaf
connectivity to everything, and you probably also want to grab all the
refcounts there.

You might want to split out the bo move into the caller here, depending
how the placement hints all work out, but I think that's the only thing
you want to pull out from that single function.

Of course the implementation of xe_iaf_map_attachment can and should
probably share a lot of code with the map_attachment callback for dma_buf.
But that really shouldn't go through the dma_buf layer in any shape or
form.

> +		if (!IS_ERR(sg)) {
> +			bo->flags |= XE_BO_FLAG_IAF;
> +			return sg;
> +		}
> +
> +		xe_iaf_mapping_put(src->iaf);
> +err_put_dst:
> +		xe_iaf_mapping_put(dst->iaf);
> +	}
> +
> +no_iaf:
> +	return dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +}
> +
>  /*
>   * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
>   * Note that unmapping the attachment is deferred to the next
> @@ -665,9 +733,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   * backing store out. Should that assumption not hold, then we will be able
>   * to unconditionally call unmap_attachment() when moving out to system.
>   */
> -static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
> -			     struct ttm_resource *new_res)
> +static int xe_bo_move_dmabuf(struct xe_bo *bo, struct ttm_resource *new_res)
>  {
> +	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>  	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
>  	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>  					       ttm);
> @@ -682,19 +750,16 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>  	    ttm_bo->sg) {
>  		dma_resv_wait_timeout(ttm_bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
>  				      false, MAX_SCHEDULE_TIMEOUT);
> -		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
> -		ttm_bo->sg = NULL;
> +		bo_unmap_dma_buf(bo);
>  	}
>  
>  	if (new_res->mem_type == XE_PL_SYSTEM)
>  		goto out;
>  
> -	if (ttm_bo->sg) {
> -		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
> -		ttm_bo->sg = NULL;
> -	}
> +	if (ttm_bo->sg)
> +		bo_unmap_dma_buf(bo);
>  
> -	sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	sg = bo_map_dma_buf(bo);
>  	if (IS_ERR(sg))
>  		return PTR_ERR(sg);
>  
> @@ -797,7 +862,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	if (ttm_bo->type == ttm_bo_type_sg) {
>  		ret = xe_bo_move_notify(bo, ctx);
>  		if (!ret)
> -			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
> +			ret = xe_bo_move_dmabuf(bo, new_mem);
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index ecb5fe3b1c1dc..210ee49d6a04d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -44,6 +44,7 @@
>  #define XE_BO_FLAG_GGTT2		BIT(22)
>  #define XE_BO_FLAG_GGTT3		BIT(23)
>  #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
> +#define XE_BO_FLAG_IAF			BIT(25)
>  
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> @@ -262,6 +263,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
>  int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
>  
>  bool mem_type_is_vram(u32 mem_type);
> +bool xe_bo_is_iaf(struct xe_bo *bo);
>  bool xe_bo_is_vram(struct xe_bo *bo);
>  bool xe_bo_is_stolen(struct xe_bo *bo);
>  bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 346f857f38374..2e8aca5d572ae 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -86,6 +86,8 @@ static void xe_dma_buf_unpin(struct dma_buf_attachment *attach)
>  	xe_bo_unpin_external(bo);
>  }
>  
> +static const struct dma_buf_attach_ops xe_dma_buf_attach_ops;
> +
>  static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  				       enum dma_data_direction dir)
>  {
> @@ -94,12 +96,21 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	struct sg_table *sgt;
>  	int r = 0;
> +	bool iaf = false;
> +
> +	if (dir == DMA_NONE) {
> +		if (attach->importer_ops != &xe_dma_buf_attach_ops)
> +			return ERR_PTR(-EOPNOTSUPP);

I think this check here is the giveaway that you _really_ want a direct
function call here, since this only works if both importer and exporter
exactly agree on what they're doing. Hence xe_iaf_map_attachment.

That also prepares you for a future where other drivers might want to be
involved in this interconnect special path. And it mirrors the design we
already have for vfio buffers and their magic uuid. You can also use that
pattern for handling multiple exporters, see virtio_dma_buf_attach().

> +
> +		iaf = true;
> +	}
>  
> -	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
> +	if (!attach->peer2peer && !iaf &&
> +	    !xe_bo_can_migrate(bo, XE_PL_TT))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
>  	if (!xe_bo_is_pinned(bo)) {
> -		if (!attach->peer2peer)
> +		if (!attach->peer2peer && !iaf)
>  			r = xe_bo_migrate(bo, XE_PL_TT);
>  		else
>  			r = xe_bo_validate(bo, NULL, false);
> @@ -109,6 +120,10 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  
>  	switch (bo->ttm.resource->mem_type) {
>  	case XE_PL_TT:
> +		/* IAF only available for VRAM */
> +		if (iaf)
> +			return ERR_PTR(-EOPNOTSUPP);
> +
>  		sgt = drm_prime_pages_to_sg(obj->dev,
>  					    bo->ttm.ttm->pages,
>  					    bo->ttm.ttm->num_pages);
> @@ -146,7 +161,8 @@ static void xe_dma_buf_unmap(struct dma_buf_attachment *attach,
>  			     enum dma_data_direction dir)
>  {
>  	if (sg_page(sgt->sgl)) {
> -		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
> +		if (dir != DMA_NONE)
> +			dma_unmap_sgtable(attach->dev, sgt, dir, 0);
>  		sg_free_table(sgt);
>  		kfree(sgt);
>  	} else {
> @@ -187,6 +203,11 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.vunmap = drm_gem_dmabuf_vunmap,
>  };
>  
> +bool is_xe_dma_buf(struct dma_buf *dma_buf)
> +{
> +	return dma_buf->ops == &xe_dmabuf_ops;
> +}
> +
>  struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>  {
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.h b/drivers/gpu/drm/xe/xe_dma_buf.h
> index 861dd28a862c7..80d12c624b921 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.h
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.h
> @@ -11,5 +11,6 @@
>  struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags);
>  struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  					   struct dma_buf *dma_buf);
> +bool is_xe_dma_buf(struct dma_buf *dma_buf);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index b8e1b44452e4d..c6ff18deb9db1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -122,7 +122,9 @@ static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>  {
>  	u64 pte = XE_PAGE_PRESENT;
>  
> -	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo) ||
> +	    /* It's likely legal to map IAF to GGTT, but it should be impossible? */
> +	    drm_WARN_ON(bo->ttm.base.dev, xe_bo_is_iaf(bo)))
>  		pte |= XE_GGTT_PTE_DM;
>  
>  	return pte;
> diff --git a/drivers/gpu/drm/xe/xe_iaf.c b/drivers/gpu/drm/xe/xe_iaf.c
> index 431d20fea5369..af2a8d045b593 100644
> --- a/drivers/gpu/drm/xe/xe_iaf.c
> +++ b/drivers/gpu/drm/xe/xe_iaf.c
> @@ -416,3 +416,45 @@ struct query_info *xe_iaf_connectivity_query(struct xe_iaf *iaf, u32 fabric_id)
>  
>  	return iaf->ops->connectivity_query(iaf->handle, fabric_id);
>  }
> +
> +bool xe_iaf_fabrics_connected(struct xe_iaf *src, struct xe_iaf *dst)
> +{
> +	struct query_info *qi;
> +	bool connected;
> +
> +	if (!src || !dst || !src->ops || !dst->ops)
> +		return false;
> +
> +	qi = xe_iaf_connectivity_query(src, dst->fabric_id);
> +	if (IS_ERR(qi))
> +		return false;
> +
> +	if (WARN_ON_ONCE(!qi))
> +		return true;
> +
> +	connected = true;
> +	for (int i = 0, n = qi->src_cnt * qi->dst_cnt; i < n; i++)
> +		if (!qi->sd2sd[i].bandwidth) {
> +			connected = false;
> +			break;
> +		}
> +
> +	kfree(qi);
> +	return connected;
> +}
> +
> +int xe_iaf_mapping_get(struct xe_iaf *iaf)
> +{
> +	if (!iaf || !iaf->ops)
> +		return -ENODEV;
> +
> +	return iaf->ops->parent_event(iaf->handle, IAF_PARENT_MAPPING_GET);
> +}
> +
> +void xe_iaf_mapping_put(struct xe_iaf *iaf)
> +{
> +	if (!iaf || !iaf->ops)
> +		return;
> +
> +	iaf->ops->parent_event(iaf->handle, IAF_PARENT_MAPPING_PUT);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_iaf.h b/drivers/gpu/drm/xe/xe_iaf.h
> index df6b8f9f2bc5f..b8e75640e8967 100644
> --- a/drivers/gpu/drm/xe/xe_iaf.h
> +++ b/drivers/gpu/drm/xe/xe_iaf.h
> @@ -38,6 +38,9 @@ int xe_iaf_init(struct xe_device *xe);
>  int xe_iaf_init_aux(struct xe_device *xe);
>  u64 xe_iaf_dpa_base(struct xe_device *xe);
>  struct query_info *xe_iaf_connectivity_query(struct xe_iaf *iaf, u32 fabric_id);
> +bool xe_iaf_fabrics_connected(struct xe_iaf *src, struct xe_iaf *dst);
> +int xe_iaf_mapping_get(struct xe_iaf *iaf);
> +void xe_iaf_mapping_put(struct xe_iaf *iaf);
>  
>  #else
>  
> @@ -61,6 +64,19 @@ struct query_info *xe_iaf_connectivity_query(struct xe_iaf *iaf, u32 fabric_id)
>  	return ERR_PTR(-ENODEV);
>  }
>  
> +static inline int xe_iaf_mapping_get(struct xe_iaf *iaf)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline void xe_iaf_mapping_put(struct xe_iaf *iaf)
> +{}
> +
> +static inline bool xe_iaf_fabrics_connected(struct xe_iaf *src, struct xe_iaf *dst)
> +{
> +	return false;
> +}
> +
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f39d5cc9f411e..2231882b2bc45 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -764,6 +764,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		else
>  			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
>  					xe_vma_size(vma), &curs);
> +
> +		/* When IAF is used, the bo requires the DM flag */
> +		if (xe_bo_is_iaf(bo))
> +			curs.mem_type = XE_PL_VRAM0;
>  	} else if (!range) {
>  		curs.size = xe_vma_size(vma);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9e375a40aee90..94a572693e139 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -396,11 +396,16 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  		size_t size = min_t(u64, cursor.size, SZ_2G);
>  		dma_addr_t addr;
>  
> -		addr = dma_map_resource(dev, phys, size, dir,
> -					DMA_ATTR_SKIP_CPU_SYNC);
> -		r = dma_mapping_error(dev, addr);
> -		if (r)
> -			goto error_unmap;
> +		if (valid_dma_direction(dir)) {

I guess you want additional flags or an XE_DMA_MODE enum with a special
XE_XIAF flag instead of abusing DMA_NONE in a pile of places.

> +			addr = dma_map_resource(dev, phys, size, dir,
> +						DMA_ATTR_SKIP_CPU_SYNC);
> +			r = dma_mapping_error(dev, addr);
> +			if (r)
> +				goto error_unmap;
> +		} else {
> +			/* Only want the SG table for fabric */
> +			addr = cursor.start + tile->mem.vram.dpa_base;

I guess we do have the discussion of whether it's really ok to stuff this
into an sg table or not. But for lack of better options I think this is
all fine, but please make sure xe_iaf_map_attachment has it all properly
documented - especially if/once that gets exported to other drivers.

Cheers, Sima

> +		}
>  
>  		sg_set_page(sg, NULL, size, 0);
>  		sg_dma_address(sg) = addr;
> @@ -413,7 +418,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  
>  error_unmap:
>  	for_each_sgtable_sg((*sgt), sg, i) {
> -		if (!sg->length)
> +		if (!sg->length || !valid_dma_direction(dir))
>  			continue;
>  
>  		dma_unmap_resource(dev, sg->dma_address,
> @@ -433,10 +438,14 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
>  	struct scatterlist *sg;
>  	int i;
>  
> -	for_each_sgtable_sg(sgt, sg, i)
> +	for_each_sgtable_sg(sgt, sg, i) {
> +		if (!valid_dma_direction(dir))
> +			continue;
> +
>  		dma_unmap_resource(dev, sg->dma_address,
>  				   sg->length, dir,
>  				   DMA_ATTR_SKIP_CPU_SYNC);
> +	}
>  	sg_free_table(sgt);
>  	kfree(sgt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 18f967ce1f1a6..f3dd38c95deb5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1534,7 +1534,7 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  	pte |= pte_encode_pat_index(pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
> -	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo) || xe_bo_is_iaf(bo))
>  		pte |= XE_PPGTT_PTE_DM;
>  
>  	return pte;
> -- 
> 2.45.2
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
