Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAEB1A37BD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 18:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42906E245;
	Thu,  9 Apr 2020 16:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A536E245
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:08:30 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id u65so4316245pfb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bv5T4MVa9umd8pCEPysPH2jSGjRAmk+aGGhx29rknXE=;
 b=ovy0PS179BjEGMUbAV2YUjlkuVA7wmm5oMqdDajjp0TOKuVkoKJNQkBmal3FBh3iyk
 6uQVZEQZEmdg0/J26gmqgI3Xbf+Y9SwaKDT64/0Z8CygXa+0ktwKWdiNPZDog7inLt6j
 EkNOW+ZQR5kRoBjRRrAAWzyEACYmqWpUvYZJGZKKegZXwil+zgJHu093SKQthM1j8MLC
 8Rf5ULsWMKhJYVAk3C2yHu3UnAeVJgnEj0auKCeACDctiuS3MWj/DOurMbx2MkaY2pLJ
 LiDf/+F+qoyR8JD20gbatncLOb49n47pMUxVIU2+YzFasivC6WMkGvIWS3obeKnzK4ew
 qc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Bv5T4MVa9umd8pCEPysPH2jSGjRAmk+aGGhx29rknXE=;
 b=bxtinGObXCi7yJJUbGI8OXLffGksriALKUjkHwdGxtNrxxu0LFywQvfAEsfWY2vqf8
 AEQzAjut57q6K160P+KbU5g/L02cvB3oohiBLIq3WG8SNcsh3nFK41tz1W0ixpSGhKL7
 tpK/RBG53cfWHquVD7fVrBZxC0rIW1h6pYrIN1IywX2mrqrtG0CfcLUI4YQb2UiHALWI
 H/zZ1nulGPl7GV7bzZ1tH3G2eqqMN2LzT4yQp555P1zoCjl6co4DgWmN8Eys+/wR63as
 N5o4CuuKRE/6ptdW9aZbswMhdBmEb8/r4SDQXYjXRfH20wBidrHet0rr3samX6xHU3wB
 DRNw==
X-Gm-Message-State: AGi0PuZHwARVuk/wNC0y4CuHpHL+oVXbIn5Ccy5XqAUm3jiCWYVOpcAH
 QxsLcoyvK2u8YWdWmDMCNkj3Dmzz
X-Google-Smtp-Source: APiQypJFLGcG6dVXLdib9gF5oJvHoXpdIxKhy+0DVfXFFx+ZgGNqEvh6DF50PGrfKmNfspKnDLZDsQ==
X-Received: by 2002:a62:7e0e:: with SMTP id z14mr269015pfc.27.1586448510359;
 Thu, 09 Apr 2020 09:08:30 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id k12sm5867045pgj.33.2020.04.09.09.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 09:08:29 -0700 (PDT)
Date: Thu, 9 Apr 2020 09:08:26 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200409160826.GC247701@google.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-11-hch@lst.de>
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
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 01:59:08PM +0200, Christoph Hellwig wrote:
> This allows to unexport map_vm_area and unmap_kernel_range, which are
> rather deep internal and should not be available to modules.

Even though I don't know how many usecase we have using zsmalloc as
module(I heard only once by dumb reason), it could affect existing
users. Thus, please include concrete explanation in the patch to
justify when the complain occurs.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/Kconfig   | 2 +-
>  mm/vmalloc.c | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 36949a9425b8..614cc786b519 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -702,7 +702,7 @@ config ZSMALLOC
>  
>  config ZSMALLOC_PGTABLE_MAPPING
>  	bool "Use page table mapping to access object in zsmalloc"
> -	depends on ZSMALLOC
> +	depends on ZSMALLOC=y
>  	help
>  	  By default, zsmalloc uses a copy-based object mapping method to
>  	  access allocations that span two pages. However, if a particular
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3375f9508ef6..9183fc0d365a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2046,7 +2046,6 @@ void unmap_kernel_range(unsigned long addr, unsigned long size)
>  	vunmap_page_range(addr, end);
>  	flush_tlb_kernel_range(addr, end);
>  }
> -EXPORT_SYMBOL_GPL(unmap_kernel_range);
>  
>  int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
>  {
> @@ -2058,7 +2057,6 @@ int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
>  
>  	return err > 0 ? 0 : err;
>  }
> -EXPORT_SYMBOL_GPL(map_vm_area);
>  
>  static inline void setup_vmalloc_vm_locked(struct vm_struct *vm,
>  	struct vmap_area *va, unsigned long flags, const void *caller)
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
