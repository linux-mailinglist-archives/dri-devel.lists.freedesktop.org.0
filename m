Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7C997C63
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ECD10E864;
	Thu, 10 Oct 2024 05:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xus70yyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D2C10E864
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:26:44 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53995380bb3so554908e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728538002; x=1729142802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2OggcA+gxqqTXGi/3T5tDMn09O+q9SzuiOHvmMgRpY=;
 b=Xus70yybjANWs7vKm7/iy5VjCKqSSi8fMEyQGB1wQSTkXHugavaGWhZlWxv5rKq9EG
 8dUpluR6TkHI7cAx1PWw+KHz5W4M3X+7v+njuDUqbLis5yScnkF1i7IfKvee8BLzNK1K
 yvNXh9ZMQEpkUGCotTm8t6hlUlKrf/wfrn/XhKEM2GrOfYqijINZXvI/7UkRXZ8QJYfG
 4XXFvaRK2O9MLTWNjv/9zrT1PMvJZM+erVcoK3l8EfwkSAN1+jUdTRLDKANPhUnbaa7X
 bH1PeofGLLAaxRhiny/YJ75wSRv6Y40SC/ien/zh1xLW6nrHcJVfWHGhdRcbmQTOevqP
 nMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728538002; x=1729142802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2OggcA+gxqqTXGi/3T5tDMn09O+q9SzuiOHvmMgRpY=;
 b=EeEJpRP/I47NeBDAq1PFfJXIS36e/g4OfkESxjW1M/UUI9VF535a7cMgul2+HaoERQ
 tU1weljjsAyMcmK5lf0Bcwozl9lOvC2K9RLJ3/Zr4M9yJ0gNQLpQE5c3k1pfjzShEvox
 eVGcmfSIpDmMJFAvtkAVieAwthQdD8Z4MCnNtKA1BinBb28X8GRpm5uC6/YiFnC56Rzs
 sSbtzxkJZ9QFLCAna8FDVebQzLei1YwALoeLqVgjq0soSjSJHvDfvle3BlEQ0+rhJ3CM
 4cZJ3Yt/xaxFJDoDhj3ynFaunzQrDIG+kKZJusznQutYhStW9Cmq6RiU8D59jYWlTTKu
 biaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/qZmMGVwcP+1I3Amjats20oiPPlTJxXM9URhHC0AgIZWh3xigcXfu4kL4PGPYKz30MKKeAWxtEYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNcgEnYlvr7XEFUUQ57e0GtD8O/0rLbpEEUd9/xVYNc7Hn9Atr
 SkANBVi4CYMJJCNy+MFz3OXX0jWxAi10mC7ZeceOwWyXPOCWTjepdfvGwOCDFaR+OecsWxOYLw9
 PJj1TGvp3gfwUDiycF2ucnbxzcpo=
X-Google-Smtp-Source: AGHT+IEbIWNphp9CaxyIBmS6fFoevv90QzHYFfcACGBeoawWKdzJgDWeGYAJzuVQ4Yqa5/qKqf5ITwHfksRZcGmb+ws=
X-Received: by 2002:a05:6512:4003:b0:539:88f7:d3c0 with SMTP id
 2adb3069b0e04-539c496ce04mr3124182e87.51.1728538001854; Wed, 09 Oct 2024
 22:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241001175057.27172-1-quic_pintu@quicinc.com>
 <CABdmKX2xEn8QjObqR3VNb=RqMZVNBiNtkfYWm8h_3Xc8KMkdag@mail.gmail.com>
In-Reply-To: <CABdmKX2xEn8QjObqR3VNb=RqMZVNBiNtkfYWm8h_3Xc8KMkdag@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 10 Oct 2024 10:56:29 +0530
Message-ID: <CAOuPNLihBBQ0zviFsQ7Vqsde+yy3CGP5OJUkaZFA=1aZbj_NZg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dma-buf/heaps: replace kmap_atomic with
 kmap_local_page
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Pintu Kumar <quic_pintu@quicinc.com>, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, joe@perches.com, skhan@linuxfoundation.org
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

On Wed, 2 Oct 2024 at 02:54, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Tue, Oct 1, 2024 at 7:51=E2=80=AFPM Pintu Kumar <quic_pintu@quicinc.co=
m> wrote:
> >
> > Use of kmap_atomic/kunmap_atomic is deprecated, use
> > kmap_local_page/kunmap_local instead.
> >
> > This is reported by checkpatch.
> > Also fix repeated word issue.
> >
> > WARNING: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' inst=
ead
> > +                       void *vaddr =3D kmap_atomic(page);
> >
> > WARNING: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' inste=
ad
> > +                       kunmap_atomic(vaddr);
> >
> > WARNING: Possible repeated word: 'by'
> > +                        * has been killed by by SIGKILL
> >
> > total: 0 errors, 3 warnings, 405 lines checked
> >
> > Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> The Android kernels have been doing this for over a year, so should be
> pretty well tested at this point:
> https://r.android.com/c/kernel/common/+/2500840
>
Thank you TJ for the review.
Hope this will be picked soon.

> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index 93be88b805fe..8c55431cc16c 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -309,13 +309,13 @@ static struct dma_buf *cma_heap_allocate(struct d=
ma_heap *heap,
> >                 struct page *page =3D cma_pages;
> >
> >                 while (nr_clear_pages > 0) {
> > -                       void *vaddr =3D kmap_atomic(page);
> > +                       void *vaddr =3D kmap_local_page(page);
> >
> >                         memset(vaddr, 0, PAGE_SIZE);
> > -                       kunmap_atomic(vaddr);
> > +                       kunmap_local(vaddr);

However, I realized one more thing.
This can be easily replaced by:
memset_page(page, 0, 0, PAGE_SIZE);

I will push this in new patchset once this is available in linux-next.

Thanks,
Pintu
