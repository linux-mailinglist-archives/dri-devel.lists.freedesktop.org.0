Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3257B248FBD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 22:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D352089725;
	Tue, 18 Aug 2020 20:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE66989725
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 20:56:10 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id u63so19172053oie.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WVlaqaJEkLaogLxHkb59x+3913QcwhMo1tlZOm9AT0s=;
 b=F7t4t8R2e65gCr9vdIxnNuliGDt2ahdeDAfavI7tANLzu2aQ0/Dm9nm68MjGmfDIEn
 +INKamv7mBD5XwNAn5unHK7F4wcGpKBzLWiimwLuJuMjurd9FzQdSLd4A3XwNq4oZgON
 0mJ1mp3STPu72DoEU6s2oGDaAPZc1d9iqm6UukG6YQUqg1rxoULI89OmVCHGV1I5M6PW
 LehxdYwb6AkyftI67q/r18iiMmsk+U2qcn2C0MXIx9alBu+BWFFFFCArG9HhsRjc+0Ow
 eHMsfDTsciu66LcErJpINTzl2QMt9ciDVh42trJ4L0rc+/x0fLt7IxkYDBuYtyO6wsbj
 4YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVlaqaJEkLaogLxHkb59x+3913QcwhMo1tlZOm9AT0s=;
 b=dTdiTXnJVhBG2r+y5ErZmrn7cUBSvMwbp5xhgnA+O/eOUrWG7hUXouax1oDHA0nixj
 IG5fdbKdRavzClekquqYqSlZU3NNLHIym+QJpH7OMStCA2YjoFFYVc4URJ3TouCkXZp3
 DKhKkMBQ7mYVTnSKnyAyw36BnDVUWVHD/mxY0iiaL83pBwZWEWE1Yc8CQUlHVJEnIUe1
 RBPnoxX13dZLOXzd5cHPw/JC17hnQp5p+rrnDqq/QCcAjzPPtTYynbCkBqNeiZJyhgWX
 FMhew+5h5EkXp3V2Xgg7xrYWw+TWpbYx55AZU3m7W6OrYQZLPsHRjmldIgNDIMmVvNK5
 UdTg==
X-Gm-Message-State: AOAM532R8JtWBb7UDur/iREa5KBTzC9gYKhJZq24lN3fbTU7xYDd7y+X
 HqTacjgXwjgMg957ezIOZS5l117V6xv5iii42pegdQ==
X-Google-Smtp-Source: ABdhPJwbu8MfbO3BaVc7WQtY8gCaYLyN64siinjCbEFyrvhEdhXeVpE86gO8wO6noTbeRWOhZomU5kKcgOZGItaZTUA=
X-Received: by 2002:aca:1117:: with SMTP id 23mr1367198oir.97.1597784170084;
 Tue, 18 Aug 2020 13:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6@epcas2p2.samsung.com>
 <20200818080415.7531-1-hyesoo.yu@samsung.com>
In-Reply-To: <20200818080415.7531-1-hyesoo.yu@samsung.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 18 Aug 2020 13:55:59 -0700
Message-ID: <CALAqxLWRLOqNrhhpjfqfztsWTib8SQQgeX3jJM+_ij_CvC6hiw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Chunk Heap Support on DMA-HEAP
To: Hyesoo Yu <hyesoo.yu@samsung.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Laura Abbott <labbott@redhat.com>,
 linux-media <linux-media@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-mm <linux-mm@kvack.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, joaodias@google.com,
 iamjoonsoo.kim@lge.com, Andrew Morton <akpm@linux-foundation.org>,
 KyongHo Cho <pullip.cho@samsung.com>, Suren Baghdasaryan <surenb@google.com>,
 vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 12:45 AM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
>
> These patch series to introduce a new dma heap, chunk heap.
> That heap is needed for special HW that requires bulk allocation of
> fixed high order pages. For example, 64MB dma-buf pages are made up
> to fixed order-4 pages * 1024.
>
> The chunk heap uses alloc_pages_bulk to allocate high order page.
> https://lore.kernel.org/linux-mm/20200814173131.2803002-1-minchan@kernel.org
>
> The chunk heap is registered by device tree with alignment and memory node
> of contiguous memory allocator(CMA). Alignment defines chunk page size.
> For example, alignment 0x1_0000 means chunk page size is 64KB.
> The phandle to memory node indicates contiguous memory allocator(CMA).
> If device node doesn't have cma, the registration of chunk heap fails.
>
> The patchset includes the following:
>  - export dma-heap API to register kernel module dma heap.
>  - add chunk heap implementation.
>  - document of device tree to register chunk heap
>
> Hyesoo Yu (3):
>   dma-buf: add missing EXPORT_SYMBOL_GPL() for dma heaps
>   dma-buf: heaps: add chunk heap to dmabuf heaps
>   dma-heap: Devicetree binding for chunk heap

Hey! Thanks so much for sending this out! I'm really excited to see
these heaps be submitted and reviewed on the list!

The first general concern I have with your series is that it adds a dt
binding for the chunk heap, which we've gotten a fair amount of
pushback on.

A possible alternative might be something like what Kunihiko Hayashi
proposed for non-default CMA heaps:
  https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/

This approach would insteal allow a driver to register a CMA area with
the chunk heap implementation.

However, (and this was the catch Kunihiko Hayashi's patch) this
requires that the driver also be upstream, as we need an in-tree user
of such code.

Also, it might be good to provide some further rationale on why this
heap is beneficial over the existing CMA heap?  In general focusing
the commit messages more on the why we might want the patch, rather
than what the patch does, is helpful.

"Special hardware" that doesn't have upstream drivers isn't very
compelling for most maintainers.

That said, I'm very excited to see these sorts of submissions, as I
know lots of vendors have historically had very custom out of tree ION
heaps, and I think it would be a great benefit to the community to
better understand the experience vendors have in optimizing
performance on their devices, so we can create good common solutions
upstream. So I look forward to your insights on future revisions of
this patch series!

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
