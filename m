Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36B1B42DE1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 02:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1380B10E00F;
	Thu,  4 Sep 2025 00:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="slHMPjTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC67310E096
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:07:02 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-336b908cbaaso3656961fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 17:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756944421; x=1757549221;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoZmhLyKn/nkdQ8DJ5UpZG4Aw6d8utBCwrwUaI83R7I=;
 b=slHMPjTwJZp3MqSo+T9SwprTgcezVNbpm4MTNQr0/7+ZFn2cqwAoKsrdtYb3I8aD+k
 2g6ZRJhR6yDt0YeKcFwn0wQrsAv62HR3PBu6Rr1J4O1n5934pomzvg2hZdTd1XEqdETi
 uTcOCNQnAevqfSbhIDx8hOgpYLobk4enQaWJTqfw9SHIKfZLfiB3jr5fuv0LtJtm8clk
 yo+ymAFXxGZ/FR8rUUCykiNusm0pJ1REItJFPt8KTKq6/W1FH7lhDWb6rxBI2tW0NQFa
 EjEH6oBWEbzauLJjg3I3oPnxloOkswDCqkmD6w6RV0GGcl2QnNeFG0B/aWOqr2JZydV7
 oFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756944421; x=1757549221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoZmhLyKn/nkdQ8DJ5UpZG4Aw6d8utBCwrwUaI83R7I=;
 b=YE0bbWk2s9CBymL5UtWniLhXWvbPzpiNI2bsNsc2j8jhkYfv0qQybaGUup+dBUrKsF
 dFnTdJW39NZAEzAn3Nmb/S1ix5Qx84XqevSoE03rcgFxwQ8ytTZ8ruoaooqEMJIPIUUn
 +3M8syk4AkfUhype+k0ASjQ9pIWCggma8QHL8LwXNN3aE37ccLAdua/ZKGCfOan2e6MM
 qfsNKpyn/fwGtxwm6C7G5aL2h4OfN9Ke4SbF6Z1nrLoQIRx/Ui8MjNxOj4LIxPWr18YS
 4oJ92QSimZPtVst5hCzgQSI4d1R9KdpPobKT4foFZ0H3//d+3qMiUwrFoGtVPd8/7jH2
 dtfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm+4PyL7RfxLJr+TWc7pTVNrvUhNAeNOnLBoI/5+T2j5gVnTHdWZO5xZuYJAsZtsVHM4sZuKwHpBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRcyar5S0xP/jf2CoJiwa5JdY6hTWze7omsIG+MaNfR7awXp2I
 8jxgONazVVab8fZXUj5hiR+J2rB5z9HJXD5GaDZCUwYrhl4wjKtLLNF/VeEmPBEaQ505jxjNaVK
 qDyPm4U6BcgGIJqqEm/evNVcIln4OeCjUv6lmnPs=
X-Gm-Gg: ASbGncuS/n8bF2v22damPOQRjink554+suXAEdrG34l7UsRYREomzQ+PAYtEktcGmUH
 HWZk5M73jDhAUfC2N9nWB1TTfn2L/STT4iNUjd+W3q6OLb7vQk3SXT4aQc59RNBNnl5aebFcl6i
 WImSwznwNm9Sdbry+0LWVED7YrqjRqkOkMP8CK7LSgZGpGXeVUtT0RjJw52uRezF6I2JkzY4ZZN
 gxqSQ3YDJrHbcD0s+W36BZLIeL/mIHTgFrg/CZyoDTR9pvR8Dbf
X-Google-Smtp-Source: AGHT+IEct78UJdrP8Mw1fHoqQhwiDSK6WJTCelvjHpNt0ZBbR9UBNmKHi6gPcy7tM8EHSgXZol8bWA6P0Y5bJNZG0cQ=
X-Received: by 2002:a05:6512:258a:b0:55f:6fcc:6f4c with SMTP id
 2adb3069b0e04-55f7095249bmr5080694e87.47.1756944420550; Wed, 03 Sep 2025
 17:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250830235838.58067-1-21cnbao@gmail.com>
In-Reply-To: <20250830235838.58067-1-21cnbao@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 3 Sep 2025 17:06:48 -0700
X-Gm-Features: Ac12FXzqtilJ6SdZS-KX2jb500H77ogaF5l5m6ZQqtBfs2J7DgcHM6yl_AOpcwo
Message-ID: <CANDhNCqcoR3USLG0Ys2WBQmEdS0u6gdaHGCVsftMk3OC5Vhjpw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
To: Barry Song <21cnbao@gmail.com>
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

On Sat, Aug 30, 2025 at 4:58=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> We can allocate high-order pages, but mapping them one by
> one is inefficient. This patch changes the code to map
> as large a chunk as possible. The code looks somewhat
> complicated mainly because supporting mmap with a
> non-zero offset is a bit tricky.
>
> Using the micro-benchmark below, we see that mmap becomes
> 3.5X faster:
...

It's been awhile since I've done mm things, so take it with a pinch of
salt, but this seems reasonable to me.

Though, one thought below...

> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index bbe7881f1360..4c782fe33fd4 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -186,20 +186,35 @@ static int system_heap_mmap(struct dma_buf *dmabuf,=
 struct vm_area_struct *vma)
>         struct system_heap_buffer *buffer =3D dmabuf->priv;
>         struct sg_table *table =3D &buffer->sg_table;
>         unsigned long addr =3D vma->vm_start;
> -       struct sg_page_iter piter;
> -       int ret;
> +       unsigned long pgoff =3D vma->vm_pgoff;
> +       struct scatterlist *sg;
> +       int i, ret;
> +
> +       for_each_sgtable_sg(table, sg, i) {
> +               unsigned long n =3D sg->length >> PAGE_SHIFT;
>
> -       for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> -               struct page *page =3D sg_page_iter_page(&piter);
> +               if (pgoff < n)
> +                       break;
> +               pgoff -=3D n;
> +       }
> +
> +       for (; sg && addr < vma->vm_end; sg =3D sg_next(sg)) {
> +               unsigned long n =3D (sg->length >> PAGE_SHIFT) - pgoff;
> +               struct page *page =3D sg_page(sg) + pgoff;
> +               unsigned long size =3D n << PAGE_SHIFT;
> +
> +               if (addr + size > vma->vm_end)
> +                       size =3D vma->vm_end - addr;
>
> -               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page), PAG=
E_SIZE,
> -                                     vma->vm_page_prot);
> +               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page),
> +                               size, vma->vm_page_prot);

It feels like this sort of mapping loop for higher order pages
wouldn't be a unique pattern to just this code.  Would this be better
worked into a helper so it would be more generally usable?

Otherwise,
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
