Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BC9B46494
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 22:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00C610EC41;
	Fri,  5 Sep 2025 20:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jgXJkEIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D719E10EC41
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 20:29:08 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-530cf611a7eso974761137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757104147; x=1757708947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRYdzv2yLfwIl3yvxCdZmpVjhYDMK6+sb3jbu48r2xw=;
 b=jgXJkEIn/wRWHoyk/uHxFdUivpdoNJrgow7lca2Z9tOloOScw6p6MTLAE/5nT47I5J
 mRNuXumXWltIAraHu8BvlMvmFOpAbtgwE4/RVLpAuSiZHk9hvXIVJsCltC0/UKznQ39W
 x4J4zLQo6xLzfWu5x1LnP54UTgA92+kyE/Q8IDNjiAGGq0zhuUQ0qnq+bONZTM8UMyP2
 Cwt1nmgnBboaCEnvyubBc4DfdzDEL0AzDCiwgdiqnZnMusqCiJHmiF/BKdhKx9mUyQmy
 vYKurGcmCq35X8jfmEhZYoxQfs7vTLdHhOexnqICP9cbHE0t7lALFwY6vkI0t/JXxDXf
 i6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757104147; x=1757708947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRYdzv2yLfwIl3yvxCdZmpVjhYDMK6+sb3jbu48r2xw=;
 b=s99TPhr6OV443D28tmM9WKDUgkn3PnC2JmXcwO1AMcXXCIpOqdBw7DN9IFK1BNZcyM
 SHXQjU7wJV4iAz++fF9TtcqAHEQ2CGYjDQ4pUx505XfGRkFF2MLyUbNqFbUOD+cu/Hjm
 o9W6Ag5P9cUD7LSN3WwxT+snLyMMejCEgN5umhSFZin8QRd0Wq9db1FcUp+cRGO/eTOU
 fN9TZTLT/Z/03mqKlvXp4c0Wi/Hbgeno3kIqfteBUQfQ33rVvWnYlkpUgHGJvw4Na6qx
 Ns8JTWtO/6g/HM6PH6VsNLy5pr7D2V6CLYuZt8k9csRlATZA/P/B4ybGwaLEPd+a8JS7
 Q85Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVup4mUU+r3BZa73GLSXDEAu7rpVI5lJLVzwgWcW0ihJq24AYvNvo8pu2xv9jzDvwDZB3uB8IltKQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRsowJJuAtB6n+QHQeVYwSwEhZ6H3QcRIGOuobnB0eqXK4tmXC
 sRrfQ+S9q0n+pAh381xNwNtyPkLg+G18iWCtVBS8atJgnf2mGUFQvHHmRFwnQhgB5OmHOCUvgVv
 WxZZwwO+PrZcZAP4i/qO1OH8o4TeHSw0=
X-Gm-Gg: ASbGnct1k1L6r3g7ft0qukkgs6iYQdrx84vJajc8pkep0MD59AADl7pwkAMiwRuxiy4
 Q/Ofn2PpzssFaQU/fkQAMpSIOVBvY+v9owttQJmGyvgGB0Ddx4+cTZjM7osjGz6n6ezssAt10eG
 nz+8vE+Hfi9jQvD9vmo98ca4gh+w1mBMpqNB7XOzj5cf6ZfmsM1M7DDhChAXvyJVz5h41MiJBgK
 YhFFwFu65l4muhf1A==
X-Google-Smtp-Source: AGHT+IHLSvJaZfMeUcdGrvlV/zH2BNv6jVe/NLyK9DH4UMQ+m7FQAP82CV7ckcxxGuAOoTuxkp531KXZ1ncTj66uGwM=
X-Received: by 2002:a05:6102:f0e:b0:52a:f858:14a6 with SMTP id
 ada2fe7eead31-53d0ce6b73amr100443137.11.1757104147552; Fri, 05 Sep 2025
 13:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250830235838.58067-1-21cnbao@gmail.com>
 <CANDhNCqcoR3USLG0Ys2WBQmEdS0u6gdaHGCVsftMk3OC5Vhjpw@mail.gmail.com>
In-Reply-To: <CANDhNCqcoR3USLG0Ys2WBQmEdS0u6gdaHGCVsftMk3OC5Vhjpw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 6 Sep 2025 04:28:56 +0800
X-Gm-Features: Ac12FXxSvETwT5SBYpmX3Lewm2vmP7y6oHoeUDfaqLEOtqhI45SlH7AV_3VHTQg
Message-ID: <CAGsJ_4wMn490tJgSOseA+6UMOdUuyPUT=Sy==FUYkRnHxQ8Afg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 zhengtangquan@oppo.com, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 4, 2025 at 8:07=E2=80=AFAM John Stultz <jstultz@google.com> wro=
te:
>
> On Sat, Aug 30, 2025 at 4:58=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > We can allocate high-order pages, but mapping them one by
> > one is inefficient. This patch changes the code to map
> > as large a chunk as possible. The code looks somewhat
> > complicated mainly because supporting mmap with a
> > non-zero offset is a bit tricky.
> >
> > Using the micro-benchmark below, we see that mmap becomes
> > 3.5X faster:
> ...
>
> It's been awhile since I've done mm things, so take it with a pinch of
> salt, but this seems reasonable to me.
>
> Though, one thought below...
>
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index bbe7881f1360..4c782fe33fd4 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -186,20 +186,35 @@ static int system_heap_mmap(struct dma_buf *dmabu=
f, struct vm_area_struct *vma)
> >         struct system_heap_buffer *buffer =3D dmabuf->priv;
> >         struct sg_table *table =3D &buffer->sg_table;
> >         unsigned long addr =3D vma->vm_start;
> > -       struct sg_page_iter piter;
> > -       int ret;
> > +       unsigned long pgoff =3D vma->vm_pgoff;
> > +       struct scatterlist *sg;
> > +       int i, ret;
> > +
> > +       for_each_sgtable_sg(table, sg, i) {
> > +               unsigned long n =3D sg->length >> PAGE_SHIFT;
> >
> > -       for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> > -               struct page *page =3D sg_page_iter_page(&piter);
> > +               if (pgoff < n)
> > +                       break;
> > +               pgoff -=3D n;
> > +       }
> > +
> > +       for (; sg && addr < vma->vm_end; sg =3D sg_next(sg)) {
> > +               unsigned long n =3D (sg->length >> PAGE_SHIFT) - pgoff;
> > +               struct page *page =3D sg_page(sg) + pgoff;
> > +               unsigned long size =3D n << PAGE_SHIFT;
> > +
> > +               if (addr + size > vma->vm_end)
> > +                       size =3D vma->vm_end - addr;
> >
> > -               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page), P=
AGE_SIZE,
> > -                                     vma->vm_page_prot);
> > +               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page),
> > +                               size, vma->vm_page_prot);
>
> It feels like this sort of mapping loop for higher order pages
> wouldn't be a unique pattern to just this code.  Would this be better
> worked into a helper so it would be more generally usable?

Another case is vmap, but that would require extending vmap_sg and
related code, with little chance to share code with mmap. It also seems
hard to find other drivers that use mmap with sg. If it turns out that
others are making similar changes, we could ask to extract our current
modifications into a common helper.

>
> Otherwise,
> Acked-by: John Stultz <jstultz@google.com>

Thanks!

>

Best regards,
Barry
