Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93FFC90228
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 21:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326F710E874;
	Thu, 27 Nov 2025 20:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f3rF8aSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7EB10E874
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 20:44:07 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-88242fc32c9so13813126d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 12:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764276246; x=1764881046; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qwCD3atudzQaR/LDn9XgIygiEi/nCI5QmZX0e0EMwzk=;
 b=f3rF8aSzd/ikYd3OZP87N+i0MXYK4vk/D1CRp/Tl7tFhqk7m2CYz59sVYVpk1GgzpB
 iGkbLVExHnqxgJmWi3e945H/tgcrDYZ8ocS/oO49H0IUOZTdUIjQQ5XYOqZSZZKMsiTW
 w8qzOM7t854AUcXRnQ7v58cb/ooMYB2tGGKGiOzsGAkQ7WhgAXjb00izwtwKrYtkQUrB
 Ku63emJ6F9RzjxdOvk/yk5ZhPxScy5Dz/sPE4jCKqU1tVVczziDwJaZyG8msgUESO0cv
 Ny9/eincgiJjwwQ78AtkAsdgQ81p9ulDemVAn+dkSCAUc0S1sl9bsDD2FHpM4srkPJlm
 p7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764276246; x=1764881046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwCD3atudzQaR/LDn9XgIygiEi/nCI5QmZX0e0EMwzk=;
 b=eZ53sVA/0PMT9f11lDL9rlTf8g7chvU7TokPpqV0HUZIKJn5469bweOYXIaqFPLgOc
 PTBFVkQDWCcYxUf9xfz6i75gB5l/UuwIO3V+cJH8eNtm+PrK2mZbpnSW34sIypgEHUYK
 HqRL39NWYGfRP1h0zy5cbbekn/1CDr28p/5mH97SOrS9gXck3ryDIzRg6icFbDNXjSZX
 DDf/ldFeD3wJXJuUjmOv9sXeVYUcdEgYRPLa5FzN2Z/eCYSFPBysEcHv8w/FxR5M+kS4
 YBhhtb1+8AjIFhmfQbcnSCLNfoLnLzf3ky7oW1hwYO/dVWmICRR2aXhXi1uiAMd8dxqa
 iv+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtJi7UsJdzaTuw6nsTLQl80hSKafJfvqcu5a4T1ePfS/LLNFEvBUvXO0QQkMphQEf38qf+Aue3QEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFKifOR/+yx7f8azNpcC3ea7AEI/98xdun+cAC+LNIYcuY7uMs
 ih70ul4YU/FQ5Ul2qYXLO53xhWGDnjfmcMVMQsvlNIsOSsBwiSSk6Th1w+elDMqd8AcDBWTOk81
 5r3h+JKl84F9dOVsIww/rv6Fhxw20mgE=
X-Gm-Gg: ASbGncvk5UvDUt+W4fPIv5k0/qFYG1qm2IM72R5x/i4j6YGD4RkLiz7qRbjDa9V6LVQ
 TsCwV0z//vEgLGbAyTrAw4d2jJSQSLpUliGr5Tn7nGiefV6Z+1XgN7PqR2gMf4hVY1U54lk8H65
 b9zwY58TGohX29yzmRyCDb1r8e/xIkBvbSoSd5qUvKblxu373e3ZFXprGuEtVh1V/WqbMxKAFDO
 Ovfr0MC0R429nBmk2ZayBZkuYJBBDRjWHoHK2JD1+2J+oVg/mQFJAgH81EEwH0/bdtqgA==
X-Google-Smtp-Source: AGHT+IE7voQiHDKLB4NwV8zGSE3REVdUO0e8yn38MIWlpfXSI6ZQdpofqkZUcP8t3D35swjRjPiF80F/keI36AiYhgc=
X-Received: by 2002:a05:6214:4018:b0:880:4c02:c49 with SMTP id
 6a1803df08f44-8847c49a3ffmr351784406d6.23.1764276246078; Thu, 27 Nov 2025
 12:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20251122090343.81243-1-21cnbao@gmail.com> <aSiB-UsunuE7u295@milan>
In-Reply-To: <aSiB-UsunuE7u295@milan>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 04:43:54 +0800
X-Gm-Features: AWmQ_bn1BA-EHgk099B5JdrbxARNS1wqxvNFJMmU7BmZqAfXIiS6yKlNivY5AG4
Message-ID: <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

> >
> > +     /*
> > +      * Some users may allocate pages from high-order down to order 0.
> > +      * We roughly check if the first page is a compound page. If so,
> > +      * there is a chance to batch multiple pages together.
> > +      */
> >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift == PAGE_SHIFT)
> > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> >
> Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:

This is not the case for vmalloc, but applies to dma-bufs that are allocated
using alloc_pages() with GFP_COMP.

#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
#define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
                                | __GFP_NORETRY) & ~__GFP_RECLAIM) \
                                | __GFP_COMP)

>
> /*
>  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
>  * This gfp lists all flags currently passed through vmalloc. Currently,
>  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
>  * and BPF also use GFP_USER. Additionally, various users pass
>  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
>  */
> #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
>                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
>                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
>                                GFP_USER | __GFP_NOLOCKDEP)
>
> Could you please clarify when PageCompound(pages[0]) returns true?
>

In this case, dma-buf attempts to allocate as many compound high-order pages
as possible, falling back to 0-order allocations if necessary.

Then, dma_buf_vmap() is called by the GPU drivers:

 1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
             dma_buf_vmap(abo->dma_buf, map);
   2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
             ret = dma_buf_vmap(dmabuf, map);
   3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
<<drm_gem_shmem_vmap_locked>>
             ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
   4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
<<etnaviv_gem_prime_vmap_impl>>
             ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
   5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
             ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
   6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
             ret = dma_buf_vmap(obj->import_attach->dmabuf, map);

Thanks
Barry
