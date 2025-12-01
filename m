Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3555C96CE4
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CFA10E389;
	Mon,  1 Dec 2025 11:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q12NCTIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BFC10E389
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 11:08:28 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37a2d9cf22aso27121361fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764587306; x=1765192106; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=apPnjqLgYv5KFdQVAUozAIQDApH/iP9GbYj6xjZKpNk=;
 b=Q12NCTIJ1EZjfCdXW0RdqHq75ELHsEQA0up/z8Yw6U5jdV9Yq0OjtRscNAHOrJpRcD
 fcF+jdDwou4DHoz2v6kEjp0tlVB7kmcMHNBJ1O+YnIrYKA60fq1xIBrf8s6mmNFAiQOM
 ik8+2aXxSQQlzNM3OrX40zYWmONM02dnppVkPpmus/UKkp9S9FBVYUCBcpVySzAtqS8I
 EuuLzJvhoEX8fJpz81HOIHJa1vW1vovleXAUQYC72eDkvZWIBmnDEXtwCwSVcUt7S3c5
 wTNNvFflpBf/635WMJw9LhY48fWzTcsT8bnxpItxnH98uWbO3qOURhgFi7f6TLMFsYdC
 ZK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764587306; x=1765192106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apPnjqLgYv5KFdQVAUozAIQDApH/iP9GbYj6xjZKpNk=;
 b=SQU2YV0JKnuSNxIYuJbwelo02KBClkdY6CzpDa/Prrfw4Dyz68C0YuGpCwYA9ngsl6
 YfvaD623VX5CeoUT9HDo4nIz/BHXHdmTq3zVSX1dMQnZO6hwf+Q/loLaXBRWJK4ANqDT
 hLPJNm7bemN2ojFFkZre2kMjC3Xlv62K2Z7lk2ZwucSbpe4UpiYeUN0p84eVTebTbUvG
 OnG6V0Szx3Iff+XCndygU18ixXJefXj5pYvVsaIXcV/iJrwhGVZZnGt2eUjJlvUmE+Jb
 Ct6Fr5silJoXfOH8kQ8FLb6yLuYm8THjcrEOqYLQtJ99XgAeTXHG8i8ys+FeSw+3vUs5
 SpJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwjzNwLDxPEQathOasL3lHxk8DAr367G6pB0blZYQfQE49ncecEo9uJ5gHE4cZYrR4SNWFosZ1EUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxohmgwwsxZYW22QZ7V1CpdtPyL00JaBLpIIr9fc74kBfdYCuBu
 uJ9tHfjhgnL/ePGI7fJIDysCkIYx/Zr9X5v11uNUjf5odRzGeeHinHcr
X-Gm-Gg: ASbGnct9wZWn8r6rarGW8KMXETJ4qH53ky+vKfRO3eYgNyZBoQ22aBoxbCHUHZgLSm9
 iyqJ1caM79H8RbmHjz2KasFvMiygMp47JSOBT65DyPC1LOWTRlv2thi34L6A5O3HCtxWOHAAkP2
 5S11kfAw8ev6QoJKpStdURjvGVAqQgMx0KG2ITvxT9q6ape2Rh8fUthvybfP49EbTdc0k142B3h
 dsoK5YpWSQudcEzdpuPN4Yo1fwORVxIZM0MyqaESvsdn6pODluKyGEAq5aRf2nqg1f9KUq3iO2/
 ZGEecshDjSNxwq4D1KWx9wRhRziBffJMRm7t1c5j4Gc1cGP1A8ee0Pd9MAe5b3P1P+KoopbXQfE
 JvvX1x50ULUihZsNI/K4Sd+TaYg5OXmFNynDe65dJRxUDCeAPR+RlPQ==
X-Google-Smtp-Source: AGHT+IFYuTqVq/XXzpVDPZNlji0QpaJTMsgY/VJiO3ObVzX6tMfBu+vPiuyhJLxl2QXQDIY11tZWpg==
X-Received: by 2002:a2e:bc26:0:b0:376:41f5:a6ca with SMTP id
 38308e7fff4ca-37cc8213bf3mr101258641fa.0.1764587306127; 
 Mon, 01 Dec 2025 03:08:26 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37d240981cbsm27895361fa.24.2025.12.01.03.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 03:08:25 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 1 Dec 2025 12:08:23 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
Message-ID: <aS13J6U-QMOrwwbs@milan>
References: <20251122090343.81243-1-21cnbao@gmail.com> <aSiB-UsunuE7u295@milan>
 <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
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

On Fri, Nov 28, 2025 at 04:43:54AM +0800, Barry Song wrote:
> > >
> > > +     /*
> > > +      * Some users may allocate pages from high-order down to order 0.
> > > +      * We roughly check if the first page is a compound page. If so,
> > > +      * there is a chance to batch multiple pages together.
> > > +      */
> > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > -                     page_shift == PAGE_SHIFT)
> > > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> > >
> > Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:
> 
> This is not the case for vmalloc, but applies to dma-bufs that are allocated
> using alloc_pages() with GFP_COMP.
> 
> #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
>                                 | __GFP_COMP)
> 
> >
> > /*
> >  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
> >  * This gfp lists all flags currently passed through vmalloc. Currently,
> >  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
> >  * and BPF also use GFP_USER. Additionally, various users pass
> >  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
> >  */
> > #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
> >                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
> >                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
> >                                GFP_USER | __GFP_NOLOCKDEP)
> >
> > Could you please clarify when PageCompound(pages[0]) returns true?
> >
> 
> In this case, dma-buf attempts to allocate as many compound high-order pages
> as possible, falling back to 0-order allocations if necessary.
> 
OK, it is folio who uses it.

> Then, dma_buf_vmap() is called by the GPU drivers:
> 
>  1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
>              dma_buf_vmap(abo->dma_buf, map);
>    2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
>              ret = dma_buf_vmap(dmabuf, map);
>    3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
> <<drm_gem_shmem_vmap_locked>>
>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>    4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> <<etnaviv_gem_prime_vmap_impl>>
>              ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
>    5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
>              ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
>    6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> 
Thank you for clarification. That would be good to reflect it in the
commit message. Also, please note that:

>       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -                     page_shift == PAGE_SHIFT)
> +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>
we rely on page_shift == PAGE_SHIFT condition for the non-sleep vmalloc()
allocations(GFP_ATOMIC, GFP_NOWAIT), so we go via vmap_small_pages_range_noflush()
path. Your patch adds !PageCompound(pages[0]) also. It is not a problem
since it is vmap() path but we need to comment that.

--
Uladzislau Rezki
