Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCF2845F8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 08:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C2A6E122;
	Tue,  6 Oct 2020 06:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953846E122
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 06:23:35 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id u126so11436349oif.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 23:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VlNmxwIhwcXv4qHaxqexSUmm4G1xHiiGF3qHpNL5GMg=;
 b=CT82R/qJcvEDDvUxaCuGu0crYHNtAwxAMVNAs/kuENoPD7ejHIrOjRRYZ5Z8oCc426
 9TSBbW807u/3VmVRvKsdS89xhG0WR+iBlXlWazslsVcZWyIlBUEZBJcv6Cup8NE4NVEO
 ylxmZFFhoOkflOBJvGoBFOXFntWaDWJ4rVAUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlNmxwIhwcXv4qHaxqexSUmm4G1xHiiGF3qHpNL5GMg=;
 b=En2cUZ8BQAfiwQQMjd7blbXEl+MSakOlTJad778GOJqRagupjUqxHSb2++aHwzGh5f
 uHXIlNhGQr4E9jeUFUDMLTRWjQnyzGOTOWH7QpJ9bNdNYKOR3rFfsSrX6feVDpDD+vpv
 d3xFZDEPMLxebhniud4hhPbfEJW/UDZ+cwTGELKuRv6dPDtpFU9LTP9p0eV7ZRCRwTPp
 WQh3+3+EloyaEoMpeIw8WGE+GeaSQQEq+nN+L3RBndLJFQoVYXNnzZFuLOpWmhbrwYzT
 iPVJtRKYHKLh1c5QFh16AF49FY43sWhHSsUsJm16eq4HiEU4BjGzMS8rpuwfd+mKaHcu
 TkyQ==
X-Gm-Message-State: AOAM530XE2cRj0ndI72swipaVVLuSZPOVuEhPQbhMrHieOcs0pRUgX2N
 iJ11taZTUAiuAiF7Yed/byN26a+gDx3kuQQvSUiarQ==
X-Google-Smtp-Source: ABdhPJwng0gDkXMKOpdZZMK3MDpDIZD7O95qBIJyXqDkv8t4rKoM6Kv3eRzC/BlAMFJrRN/Z/vlIq1gJtQeg5R2bqC0=
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mr1854734oie.128.1601965414834; 
 Mon, 05 Oct 2020 23:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
 <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
 <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
 <20201005234104.GD5177@ziepe.ca>
In-Reply-To: <20201005234104.GD5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Oct 2020 08:23:23 +0200
Message-ID: <CAKMK7uHt=kD=njZvMULy-k-bY4emn=u8__t7etQDq3_WUL7VAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 6, 2020 at 1:41 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:
>
> > > iow I think I can outright delete the frame vector stuff.
> >
> > Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> > which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> > not a carveout, we can't get the pages.
>
> If CMA memory has struct pages it probably should be mmap'd with
> different flags, and the lifecycle of the CMA memory needs to respect
> the struct page refcount?

I guess yes and no. The problem is if there's pagecache in the cma
region, pup(FOLL_LONGTERM) needs to first migrate those pages out of
the cma range. Because all normal page allocation in cma regions must
be migratable at all times. But when you use cma as the contig
allocator (mostly with dma_alloc_coherent) and then remap that for
userspace (e.g. dma_mmap_wc), then anyone doing pup or gup should not
try to migrate anything. Also in the past these contig ranges where
generally carveouts without any struct page, changing that would break
too much I guess.

> > Plus trying to move the cma pages out of cma for FOLL_LONGTERM would
> > be kinda bad when they've been allocated as a contig block by
> > dma_alloc_coherent :-)
>
> Isn't holding a long term reference to a CMA page one of those really
> scary use-after-free security issues I've been talking about?
>
> I know nothing about CMA, so can't say too much, sorry

Uh ... yes :-/

This is actually worse than the gpu case I had in mind, where at most
you can sneak access other gpu buffers. With cma you should be able to
get at arbitrary pagecache (well anything that's GFP_MOVEABLE really).
Nice :-(
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
