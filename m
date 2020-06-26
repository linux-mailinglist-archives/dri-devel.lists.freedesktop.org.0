Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B8120B19A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 14:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14CF6EC89;
	Fri, 26 Jun 2020 12:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8316EC89
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 12:43:36 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l63so7902223oih.13
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 05:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eryy51bC8KJ7IMH+C6iEEAb5DGZSNcRCQj7MTibelso=;
 b=QQgcAg7gVd5c7LjRYPwFmJnteqrzdlj4/mwxhlXlJHSzBWzLdj464NX/jEbRUDBR4R
 Z+MnAn9Qt1iWQ8KdrVtvu06yATJsulvJJe0uM0641KIkN7Iij/LruXv89GjjiC7wcdH2
 gUUPdVCa7vG2NnVBgfujc04K49c6fckMGLFFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eryy51bC8KJ7IMH+C6iEEAb5DGZSNcRCQj7MTibelso=;
 b=PfhD5Vw5ptKWrfCu14/zdQ5qpxVWctpyvQPDSrHdMXGTqf0w31gc3hXlebidj31kuI
 emVrDKnimzmWUnyOWTQAjMdpYU8WT/sAJ5SJj5Jlceqs4qq/AzTU+y2Ny+49n/Og5i+G
 ZSxsNnc6W5pib6ZsJFNtg1sNfXNp+OGz4Pfr19ow29Obt29FC69J5A9JNpEFLPblFmye
 je3ZNRU1VRnMODkGxwLNDZMdfrFG4/Q4H+sZyYe5RsA8VoIcjUixiHFTy3oIrU0EdPQ2
 4mY2G2BUMIudo0yK7cxuhwMpgIKhbBRlCaUVdRaz0TmFaq7y2KtulMwcAvp++b3XFc/C
 7gGw==
X-Gm-Message-State: AOAM530GZWUc/6FwdQHu4IpvJbt0DyhN5btzaP5kMgFxvpq3CJcZoRyd
 r0HseId4U3fXsVc5FfaZwxPMdQQErNNzKDjjf6Cjgg==
X-Google-Smtp-Source: ABdhPJzulqpccJt2/gJ0Iuo4dPXLqCGcyCViTSJTIcbB4uCoyBo/Ap/6URRVbSZVw6CKisauFq66b6BnS+ql/0Et2eA=
X-Received: by 2002:aca:dc82:: with SMTP id t124mr2299471oig.14.1593175416044; 
 Fri, 26 Jun 2020 05:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200626122100.55123-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200626122100.55123-1-lionel.g.landwerlin@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 26 Jun 2020 14:43:24 +0200
Message-ID: <CAKMK7uGPsmbOqm4+jhSA4EWAyHw1evac8-Hxd2y42Dx-BZs5Sw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: document dma-fence-chain purpose/behavior
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:21 PM Lionel Landwerlin
<lionel.g.landwerlin@intel.com> wrote:
>
> Trying to explain a bit how this thing works. In my opinion diagrams
> are a bit easier to understand than words.

kerneldoc supports in-line DOT graphs, see e.g.

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#overview

If that doesn't work, then you can include a full-blown svg too.

And yes for this a quick DOT graph that explains how things connect
sound like the perfect use of a diagramm.

Cheers, Daniel

>
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 37 +++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 3d123502ff12..ac90ddf37b55 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -9,6 +9,43 @@
>
>  #include <linux/dma-fence-chain.h>
>
> +/**
> + * DOC: DMA fence chains overview
> + *
> + * DMA fence chains, represented by &struct dma_fence_chain, are a kernel
> + * internal synchronization primitive providing a wrapping mechanism of other
> + * DMA fences in the form a single link list.
> + *
> + * One of the use case of this primitive is to implement Vulkan timeline
> + * semaphores (see VK_KHR_timeline_semaphore extension or Vulkan specification
> + * 1.2).
> + *
> + * Each DMA fence chain item wraps 2 items :
> + *
> + * - A previous DMA fence.
> + *
> + * - A DMA fence associated to the current &struct dma_fence_chain.
> + *
> + * A DMA fence chain becomes signaled when its previous fence as well as its
> + * associated fence are signaled. If a chain of dma fence chains is created,
> + * this property recurses, meaning that any dma fence chain element in the
> + * list becomes signaled only if its associated fence and all the previous
> + * fences in the chain are also signaled.
> + *
> + * A DMA fence chain's seqno is specified through dma_fence_chain_init(). This
> + * value is lower bound to the seqno of the previous fence to ensure the chain
> + * is monotically increasing.
> + *
> + * By traversing the chain's linked list, one can compute a seqno number
> + * associated with the chain such that is the highest number for which all
> + * previous fences have signaled.
> + *
> + * One can also traverse the chain's linked list to find a &struct
> + * dma_fence_chain that when signaled guarantees that all previous fences in
> + * the chain are signaled. dma_fence_chain_find_seqno() provides this
> + * functionality.
> + */
> +
>  static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
>
>  /**
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
