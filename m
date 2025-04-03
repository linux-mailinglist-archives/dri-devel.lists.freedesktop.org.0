Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862B0A79E1E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 10:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F0C10E1A8;
	Thu,  3 Apr 2025 08:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bWky0SJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202D710E1A8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 08:27:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so69651966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1743668842; x=1744273642; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o+Mp6jmtYK1H17CFfYiwi2sa1wA1pdf2H15LrCJwia8=;
 b=bWky0SJnyIIxTez+ScsRCBpK3uSbGHTlWeU9lxO+BZnm4N1WayXLI3xj5d4AbLhw1O
 RttLDX8xhINirN5PBMiAUgX32puqk29rHcISFBy0gw7Y9IeW/NzlhednTiyiUAjrkugQ
 QlxatlPv5Y9Rq3acd96Ve6SO9DkaaPyptJOPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743668842; x=1744273642;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+Mp6jmtYK1H17CFfYiwi2sa1wA1pdf2H15LrCJwia8=;
 b=UYDyF4U2xtgH2n+fCX9iS1Y/R12hWjQJe3qMJaUWDeR47WCEiM3Nutxz1agwaJLcdJ
 9CTimXYVzGu4Z/Z7ycrF9MDMqsFk3xSfBLYCa+2SfWJSwdHpE/0hFFMUcfAvqcdadhQm
 ximVTd5rZ1Gc0GpXTUx06KRf4vMjtWapwLkDg4+9Q6WQpe0GRKzUBbJCsjsLETyMJstL
 hSzQKVP/wpeUcuhGWved9kJYLzGqggFTzOL0Ntqdf+jzAD/KRUbyib5mCwWucwwXpocu
 Zy3wCE+ULA5p+MeVAwaK2tt3WuFZCaXKVMMYMTZvvWV2iI9zFGw5lsbkQfFN8PsrLkPE
 3wkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0m+uDRNhu2+k+z2bUkWH+wHKbaEEZOD0QLLBK+DItxY29iNhxeUS2KBCVKS+Ty0uTuzoWR82GrpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzJEmH3zkolkhC1qbMB0LC/sE3HG2okGlL2jwFL64F4fbBOAm2
 YNk5JuQHfSC64bJ5osXFn5rSNWUZO7/xhCv8w9vtZgRu+t+1/3IiFWJLvkr3klQ=
X-Gm-Gg: ASbGnctjK5PXjVO5sVdPbcwgS4MGPEPNOYnYjkpBPpswRC2I+UYuuE7XpPTZ7LgcT+L
 ASx43zh93nMbhKyRd/SVnNqWyhD/sWgcMlWei/4bpr97nMBZF5sQvCBRupkmir85oTyQRwCq/G7
 uEGAz1U5ToBx/KmKapICUNwCHfMZpMiCNp/WxaN0zMPAz2nUAbvNwO3vRuzVHPOLNPL4zP7YSuU
 9PFLFt4GNCbo5RXNV5dUT8J7NzT/lusVcQ85HjDsJvAw5Nw2r07kN9vDkBfRZq3FthQOBPaIW3t
 NG5HVbv35c+6oea/EyIGfSwwXVmcgTXzTuhVMf7UcAL0gLoVgy3NIuyn
X-Google-Smtp-Source: AGHT+IGcfR+2lbcGxpYCyqAi52EwdZb7Vb//nyaqQ4Ire5aanYllMG0HRfmeR5SThj3fwVAh+TVljw==
X-Received: by 2002:a17:907:7f93:b0:ac3:ed4d:c9a1 with SMTP id
 a640c23a62f3a-ac7b6dd2448mr199507466b.17.1743668842335; 
 Thu, 03 Apr 2025 01:27:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c01c2170sm55536566b.170.2025.04.03.01.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 01:27:21 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:27:19 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
Message-ID: <Z-5GZ3kJDbhgVBPG@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Mon, Mar 10, 2025 at 01:06:06PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's preliminary work to enable dmem tracking for heavy users of DMA
> allocations on behalf of userspace: v4l2, DRM, and dma-buf heaps.
> 
> It's not really meant for inclusion at the moment, because I really
> don't like it that much, and would like to discuss solutions on how to
> make it nicer.
> 
> In particular, the dma dmem region accessors don't feel that great to
> me. It duplicates the logic to select the proper accessor in
> dma_alloc_attrs(), and it looks fragile and potentially buggy to me.
> 
> One solution I tried is to do the accounting in dma_alloc_attrs()
> directly, depending on a flag being set, similar to what __GFP_ACCOUNT
> is doing.
> 
> It didn't work because dmem initialises a state pointer when charging an
> allocation to a region, and expects that state pointer to be passed back
> when uncharging. Since dma_alloc_attrs() returns a void pointer to the
> allocated buffer, we need to put that state into a higher-level
> structure, such as drm_gem_object, or dma_buf.
> 
> Since we can't share the region selection logic, we need to get the
> region through some other mean. Another thing I consider was to return
> the region as part of the allocated buffer (through struct page or
> folio), but those are lost across the calls and dma_alloc_attrs() will
> only get a void pointer. So that's not doable without some heavy
> rework, if it's a good idea at all.
> 
> So yeah, I went for the dumbest possible solution with the accessors,
> hoping you could suggest a much smarter idea :)

I've had a private chat with Maxime to get him up to speed on hopefully a
lot of the past discussions, but probably best I put my notes here too.
Somewhat unstructured list of challenges with trying to account all the
memory for gpu/isp/camera/whatever:

- At LPC in Dublin I think we've pretty much reached the conclusion that
  normal struct page memory should be just accounted in memcg. Otherwise
  you just get really nasty double-accounting chaos or issues where you
  can exhaust reserves.

- We did not figure out what to do with mixed stuff like CMA, where we
  probably want to account it both into memcg (because it's struct page)
  but also separately into dmem (because the CMA region is a limited
  resource and only using memcg will not help us manage it).

- There's the entire chaos of carve-out vs CMA and how userspace can
  figure out how to set reasonable limits automatically. Maxime brought
  the issue that limits need to be adjusted if carve-out/CMA/shmem aren't
  accounted the same, which I think is a valid concern. But due to the
  above conclusion around memcg accounting I think that's unavoidable, so
  we need some means for userspace to autoconfigure reasonable limits.
  Then that autoconfig can be done on each boot, and kernel (or dt or
  whatever) changes between these three allocators don't matter anymore.

- Autoconfiguration challenges also exist for split display/render SoC. It
  gets even more fun if you also throw in camera and media codecs, and
  even more fun if you have multiple CMA regions.

- Discrete gpu also has a very fun autoconfiguration issue because you
  have dmem limits for vram, and memcg limits for system memory. Vram
  might be swapped out to system memory, so naively you might want to
  assume that you need higher memcg limits than dmem limits. But there's
  systems with more dmem and smem (because the cpu with its memory is
  essentially just the co-processor that orchestrates the real compute
  machine, which is all gpus).

- We need a charge transfer, least for Android since there all memory is
  allocated through binder. TJ Mercier did some patches:

  https://lore.kernel.org/dri-devel/20230123191728.2928839-3-tjmercier@google.com/

  Ofc with dmem this would need to work for both dmem and memcg charges,
  since with CMA and discrete gpu we'll have bo that are tracked in both.

- Hard limits for shmem/ttm drivers need a memcg-aware shrinker. TTM
  doesn't even have a shrinker yet, but with xe we now have a
  helper-library approach to enabling shrinking for TTM drivers.
  memcg-aware shrinking will be a large step up in complexity on top (and
  probably a good reason to switch over to the common shrinker lru instead
  of hand-rolling).

  See the various attempts at ttm shrinkers by Christian König and Thomas
  Hellstrom over the past years on dri-devel.

  This also means that most likely cgroup limit enforcement for ttm based
  drivers will be per-driver or at least very uneven.

- Hard limits for dmem vram means ttm eviction needs to be able to account
  the evicted bo against the right memcg. Because this can happen in
  random other threads (cs ioctl of another process, kernel threads)
  accounting this correctly is going to be "fun". Plus I haven't thought
  through interactions with memcg-aware shrinkers, which might cause some
  really fundamental issues.

- We also ideally need pin account, but I don't think we have any
  consensus on how to do that for memcg memory. Thus far it's all
  functionality-specific limits (e.g. mlock, rdma has its own for
  long-term pinned memory), not sure it makes sense to push for a unified
  tracking in memcg here?

  For dmem I think it's pretty easy, but there the question is how to
  differentiate between dmem that's always pinned (cma, I don't think
  anyone bothered with a shrinker for cma memory, vc4 maybe?) and dmem
  that generally has a shrinker and really wants a separate pin limit
  (vram/ttm drivers).

- Unfortunately on top of the sometimes very high individual complexity
  these issues also all interact. Which means that we won't be able to
  roll this out in one go, and we need to cope with very uneven
  enforcement. I think trying to allow userspace to cope with changing
  cgroup support through autoconfiguration is the most feasible way out of
  this challenge.

tldr; cgroup for device memory is a really complex mess

Cheers, Sima

> Thanks,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (12):
>       cma: Register dmem region for each cma region
>       cma: Provide accessor to cma dmem region
>       dma: coherent: Register dmem region for each coherent region
>       dma: coherent: Provide accessor to dmem region
>       dma: contiguous: Provide accessor to dmem region
>       dma: direct: Provide accessor to dmem region
>       dma: Create default dmem region for DMA allocations
>       dma: Provide accessor to dmem region
>       dma-buf: Clear cgroup accounting on release
>       dma-buf: cma: Account for allocations in dmem cgroup
>       drm/gem: Add cgroup memory accounting
>       media: videobuf2: Track buffer allocations through the dmem cgroup
> 
>  drivers/dma-buf/dma-buf.c                          |  7 ++++
>  drivers/dma-buf/heaps/cma_heap.c                   | 18 ++++++++--
>  drivers/gpu/drm/drm_gem.c                          |  5 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |  6 ++++
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 19 +++++++++++
>  include/drm/drm_device.h                           |  1 +
>  include/drm/drm_gem.h                              |  2 ++
>  include/linux/cma.h                                |  9 +++++
>  include/linux/dma-buf.h                            |  5 +++
>  include/linux/dma-direct.h                         |  2 ++
>  include/linux/dma-map-ops.h                        | 32 ++++++++++++++++++
>  include/linux/dma-mapping.h                        | 11 ++++++
>  kernel/dma/coherent.c                              | 26 +++++++++++++++
>  kernel/dma/direct.c                                |  8 +++++
>  kernel/dma/mapping.c                               | 39 ++++++++++++++++++++++
>  mm/cma.c                                           | 21 +++++++++++-
>  mm/cma.h                                           |  3 ++
>  17 files changed, 211 insertions(+), 3 deletions(-)
> ---
> base-commit: 55a2aa61ba59c138bd956afe0376ec412a7004cf
> change-id: 20250307-dmem-cgroups-73febced0989
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
