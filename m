Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DDD2A2D53
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 15:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A86E50D;
	Mon,  2 Nov 2020 14:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550C6E52E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 14:49:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 13so9670097wmf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eWPSTQ3LyHRATFWSmNrhaF+4O+LGE489CHQSWVvIakQ=;
 b=EYaEVplljEOVq2w2k+Y6BXIiI7Vfv1pSWBIA+xAnno6DFFMsikJaHm5gJKlCVe4oNL
 SB2tE9qxLCaHEH/TTvabzX3NLPbaSxHeFniMk9SgFJOjSUF3ibflTJaIq4+LtEtYMIz9
 ipn2ttrvnId8SW0J8MhV7x85Sx+aHqz/21AdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eWPSTQ3LyHRATFWSmNrhaF+4O+LGE489CHQSWVvIakQ=;
 b=F29WOt/Myg7NVkmYNHL6vwDJwXVhAWWRpGTbHk4ChQN9lY4BBifnqZIRfUlLMDb3PC
 qgSBr5RAtPam2jp5jxpT/QmRl/K3E4dKCGbx3YMfbnfxkpyeIUlf9tjYj8CWNaPbPybk
 v2jvhWc254wOJVuVIHYmN8fVIlthKHMnG4fmVvWpsKJz2DvQ0KfEhXGEPBBUyuQLsw85
 fxHNfD7qF5pMuBwjfzP1UNc4jplag8wUcSxy8iPj0GhXTwL9gVs5qhAEZ93G60HEdOZG
 CekEN8f6OdLTX8wzBFvU95LjHuqQ/6gyrXfs9wlj1xQxHfAqyRBD7GmRZdb6PC8yEFe8
 wNFQ==
X-Gm-Message-State: AOAM530pK5XewyIUbPQV9cA2JM1vwo1d5TqypRf5x1xJqNd47EN4u/ZQ
 CDvvhEjPcGaB7xfC0GcD9rLjHA==
X-Google-Smtp-Source: ABdhPJx61R08kqYlbeAzGt1hVvEsgHasNzxVslBvrG1yqRmR0TnkXDcIQp++Tx0H8mvrszOhyYUHWQ==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr10715678wma.154.1604328563837; 
 Mon, 02 Nov 2020 06:49:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z14sm16312474wmc.15.2020.11.02.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:49:22 -0800 (PST)
Date: Mon, 2 Nov 2020 15:49:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm: Remove SCATTERLIST_MAX_SEGMENT
Message-ID: <20201102144920.GS401619@phenom.ffwll.local>
References: <0-v1-44733fccd781+13d-rm_scatterlist_max_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v1-44733fccd781+13d-rm_scatterlist_max_jgg@nvidia.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>, intel-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Qian Cai <cai@lca.pw>, Christoph Hellwig <hch@lst.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 04:15:26PM -0300, Jason Gunthorpe wrote:
> Since commit 9a40401cfa13 ("lib/scatterlist: Do not limit max_segment to
> PAGE_ALIGNED values") the max_segment input to sg_alloc_table_from_pages()
> does not have to be any special value. The new algorithm will always
> create something less than what the user provides. Thus eliminate this
> confusing constant.
> 
> - vmwgfx should use the HW capability, not mix in the OS page size for
>   calling dma_set_max_seg_size()
> 
> - i915 uses i915_sg_segment_size() both for sg_alloc_table_from_pages
>   and for some open coded sgl construction. This doesn't change the value
>   since rounddown(size, UINT_MAX) == SCATTERLIST_MAX_SEGMENT
> 
> - drm_prime_pages_to_sg uses it as a default if max_segment is zero,
>   UINT_MAX is fine to use directly.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Merged to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_prime.c             | 4 ++--
>  drivers/gpu/drm/i915/i915_scatterlist.h | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 3 +--
>  include/linux/scatterlist.h             | 6 ------
>  tools/testing/scatterlist/main.c        | 2 +-
>  5 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d6808f678db541..c3693e5e8b74b0 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -816,8 +816,8 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
>  
>  	if (dev)
>  		max_segment = dma_max_mapping_size(dev->dev);
> -	if (max_segment == 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
> -		max_segment = SCATTERLIST_MAX_SEGMENT;
> +	if (max_segment == 0)
> +		max_segment = UINT_MAX;
>  	sge = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
>  					  nr_pages << PAGE_SHIFT,
>  					  max_segment,
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index b7b59328cb76ab..883dd8d09d6bf2 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -112,7 +112,7 @@ static inline unsigned int i915_sg_segment_size(void)
>  	unsigned int size = swiotlb_max_segment();
>  
>  	if (size == 0)
> -		return SCATTERLIST_MAX_SEGMENT;
> +		size = UINT_MAX;
>  
>  	size = rounddown(size, PAGE_SIZE);
>  	/* swiotlb_max_segment_size can return 1 byte when it means one page. */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 31e3e5c9f36223..c1817f1a3006e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -792,8 +792,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  	if (unlikely(ret != 0))
>  		goto out_err0;
>  
> -	dma_set_max_seg_size(dev->dev, min_t(unsigned int, U32_MAX & PAGE_MASK,
> -					     SCATTERLIST_MAX_SEGMENT));
> +	dma_set_max_seg_size(dev->dev, U32_MAX);
>  
>  	if (dev_priv->capabilities & SVGA_CAP_GMR2) {
>  		DRM_INFO("Max GMR ids is %u\n",
> diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
> index 36c47e7e66a203..6f70572b2938be 100644
> --- a/include/linux/scatterlist.h
> +++ b/include/linux/scatterlist.h
> @@ -18,12 +18,6 @@ struct scatterlist {
>  #endif
>  };
>  
> -/*
> - * Since the above length field is an unsigned int, below we define the maximum
> - * length in bytes that can be stored in one scatterlist entry.
> - */
> -#define SCATTERLIST_MAX_SEGMENT (UINT_MAX & PAGE_MASK)
> -
>  /*
>   * These macros should be used after a dma_map_sg call has been done
>   * to get bus addresses of each of the SG entries and their lengths.
> diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
> index b2c7e9f7b8d3dc..d264bf853034bd 100644
> --- a/tools/testing/scatterlist/main.c
> +++ b/tools/testing/scatterlist/main.c
> @@ -50,7 +50,7 @@ static void fail(struct test *test, struct sg_table *st, const char *cond)
>  
>  int main(void)
>  {
> -	const unsigned int sgmax = SCATTERLIST_MAX_SEGMENT;
> +	const unsigned int sgmax = UINT_MAX;
>  	struct test *test, tests[] = {
>  		{ -EINVAL, 1, pfn(0), PAGE_SIZE, PAGE_SIZE + 1, 1 },
>  		{ -EINVAL, 1, pfn(0), PAGE_SIZE, 0, 1 },
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
