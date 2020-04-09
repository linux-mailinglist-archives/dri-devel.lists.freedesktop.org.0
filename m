Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C61A4499
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCD26ECA9;
	Fri, 10 Apr 2020 09:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCD76E0DF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 22:25:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id z15so442120qki.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 15:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9zZmDvv9VsaMcSR+uAlcqBBO7fDfxOBX/cPeyIGlPXM=;
 b=W4onPV0FDtRSS9y6l1W+W/FVY7uMwYmp/vLxbV+vsTO2W55vIfLst1ikMIBLMv47KZ
 64ToStA7a/6zppDU+wTlTfU6Un6EOx32pfCLeSVtqFEU4ptlSPugU0N+X034gxeIEd+F
 sZ22vzsQqnM3Miz22Gk0POiNvD6ME0G4DRZUu2V8o+JOPEqF23MicCWNGTbmmYIhLe6V
 3W5oV53czY23X0IJIdp9cV+2Oc5V3oKlN3PwYT1QLJTo9I26Y6rC6ay6XFYA6QD+wQeh
 /I0xueubtqoupnFXkcYtIoaN9TVAPRTkCMdnq3avNZap0J3hFNk8iJ7/qgVG1ZOC7J6L
 Bwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9zZmDvv9VsaMcSR+uAlcqBBO7fDfxOBX/cPeyIGlPXM=;
 b=F7UGhGxxH0S4mlCxHwJ+AmN5MWyJobR4eSKMTyAjyySSKoIHW22eB4KSvURl8zfX7T
 cxXdBSpILmqyORpLyJ9iDTsRGwRcVhuAgMoNfsn3ajXEXY2K/3DYjyuWLbjl8f03k83I
 pnqVZIvu8WS1Z42HFdi8zh9EBOpn/CUIyENFmOIdmWM5+EUmllRqXx35N3XScWrGWK+D
 50Wq8GskExtyv+V0saQO3j9r8dl8wASKRMvNOnQ0I3n26AyQzrbjmMg0iq/H/htMCfM7
 LJ1lkbd/CA/f3liCdi+cHIC2P61D6oTmovYql8yPKHZMpygK0G3ez/HSVjrnFj6E6aB4
 s+Dg==
X-Gm-Message-State: AGi0PuYFUscyiuxY0w7c483neqwv8tq6Pad2rXJ5AQv/Iy7yFtkcXSN4
 xhTT6ZYsCYVKvTZKe3QW5dGQk7MYuH8P2zyF9Ck=
X-Google-Smtp-Source: APiQypIwNq7wZY1PnpGu/Qv59bzelpOE6CP1WGeABev8jhWjEtJ5m8SKmmGAGV+0ntLTtupM9GwEs2trz+3rj7Qjirg=
X-Received: by 2002:a37:6587:: with SMTP id z129mr1198478qkb.437.1586471114653; 
 Thu, 09 Apr 2020 15:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-26-hch@lst.de>
In-Reply-To: <20200408115926.1467567-26-hch@lst.de>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 9 Apr 2020 15:25:03 -0700
Message-ID: <CAEf4BzZOC2tLrqt_Km=WQb=9xiya2e31i6K3oJuzgYQt6wp1LQ@mail.gmail.com>
Subject: Re: [PATCH 25/28] mm: remove vmalloc_user_node_flags
To: Christoph Hellwig <hch@lst.de>, Johannes Weiner <hannes@cmpxchg.org>
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cc Johannes who suggested this API call originally

On Wed, Apr 8, 2020 at 5:03 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Open code it in __bpf_map_area_alloc, which is the only caller.  Also
> clean up __bpf_map_area_alloc to have a single vmalloc call with
> slightly different flags instead of the current two different calls.
>
> For this to compile for the nommu case add a __vmalloc_node_range stub
> to nommu.c.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/vmalloc.h |  1 -
>  kernel/bpf/syscall.c    | 23 +++++++++++++----------
>  mm/nommu.c              | 14 ++++++++------
>  mm/vmalloc.c            | 20 --------------------
>  4 files changed, 21 insertions(+), 37 deletions(-)
>
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 108f49b47756..f90f2946aac2 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -106,7 +106,6 @@ extern void *vzalloc(unsigned long size);
>  extern void *vmalloc_user(unsigned long size);
>  extern void *vmalloc_node(unsigned long size, int node);
>  extern void *vzalloc_node(unsigned long size, int node);
> -extern void *vmalloc_user_node_flags(unsigned long size, int node, gfp_t flags);
>  extern void *vmalloc_exec(unsigned long size);
>  extern void *vmalloc_32(unsigned long size);
>  extern void *vmalloc_32_user(unsigned long size);
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 48d98ea8fad6..249d9bd43321 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -281,26 +281,29 @@ static void *__bpf_map_area_alloc(u64 size, int numa_node, bool mmapable)
>          * __GFP_RETRY_MAYFAIL to avoid such situations.
>          */
>
> -       const gfp_t flags = __GFP_NOWARN | __GFP_ZERO;
> +       const gfp_t gfp = __GFP_NOWARN | __GFP_ZERO;
> +       unsigned int flags = 0;
> +       unsigned long align = 1;
>         void *area;
>
>         if (size >= SIZE_MAX)
>                 return NULL;
>
>         /* kmalloc()'ed memory can't be mmap()'ed */
> -       if (!mmapable && size <= (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER)) {
> -               area = kmalloc_node(size, GFP_USER | __GFP_NORETRY | flags,
> +       if (mmapable) {
> +               BUG_ON(!PAGE_ALIGNED(size));
> +               align = SHMLBA;
> +               flags = VM_USERMAP;
> +       } else if (size <= (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER)) {
> +               area = kmalloc_node(size, gfp | GFP_USER | __GFP_NORETRY,
>                                     numa_node);
>                 if (area != NULL)
>                         return area;
>         }
> -       if (mmapable) {
> -               BUG_ON(!PAGE_ALIGNED(size));
> -               return vmalloc_user_node_flags(size, numa_node, GFP_KERNEL |
> -                                              __GFP_RETRY_MAYFAIL | flags);
> -       }
> -       return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_RETRY_MAYFAIL | flags,
> -                             numa_node, __builtin_return_address(0));
> +
> +       return __vmalloc_node_range(size, align, VMALLOC_START, VMALLOC_END,
> +                       gfp | GFP_KERNEL | __GFP_RETRY_MAYFAIL, PAGE_KERNEL,
> +                       flags, numa_node, __builtin_return_address(0));
>  }
>
>  void *bpf_map_area_alloc(u64 size, int numa_node)
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 81a86cd85893..b42cd6003d7d 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -150,6 +150,14 @@ void *__vmalloc(unsigned long size, gfp_t gfp_mask)
>  }
>  EXPORT_SYMBOL(__vmalloc);
>
> +void *__vmalloc_node_range(unsigned long size, unsigned long align,
> +               unsigned long start, unsigned long end, gfp_t gfp_mask,
> +               pgprot_t prot, unsigned long vm_flags, int node,
> +               const void *caller)
> +{
> +       return __vmalloc(size, flags);
> +}
> +
>  void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
>                 int node, const void *caller)
>  {
> @@ -180,12 +188,6 @@ void *vmalloc_user(unsigned long size)
>  }
>  EXPORT_SYMBOL(vmalloc_user);
>
> -void *vmalloc_user_node_flags(unsigned long size, int node, gfp_t flags)
> -{
> -       return __vmalloc_user_flags(size, flags | __GFP_ZERO);
> -}
> -EXPORT_SYMBOL(vmalloc_user_node_flags);
> -
>  struct page *vmalloc_to_page(const void *addr)
>  {
>         return virt_to_page(addr);
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 333fbe77255a..f6f2acdaf70c 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2658,26 +2658,6 @@ void *vzalloc_node(unsigned long size, int node)
>  }
>  EXPORT_SYMBOL(vzalloc_node);
>
> -/**
> - * vmalloc_user_node_flags - allocate memory for userspace on a specific node
> - * @size: allocation size
> - * @node: numa node
> - * @flags: flags for the page level allocator
> - *
> - * The resulting memory area is zeroed so it can be mapped to userspace
> - * without leaking data.
> - *
> - * Return: pointer to the allocated memory or %NULL on error
> - */
> -void *vmalloc_user_node_flags(unsigned long size, int node, gfp_t flags)
> -{
> -       return __vmalloc_node_range(size, SHMLBA,  VMALLOC_START, VMALLOC_END,
> -                                   flags | __GFP_ZERO, PAGE_KERNEL,
> -                                   VM_USERMAP, node,
> -                                   __builtin_return_address(0));
> -}
> -EXPORT_SYMBOL(vmalloc_user_node_flags);
> -
>  /**
>   * vmalloc_exec - allocate virtually contiguous, executable memory
>   * @size:        allocation size
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
