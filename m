Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFC97E889
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91DC10E3C2;
	Mon, 23 Sep 2024 09:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PZTJaKtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFB310E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:22:51 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id
 d75a77b69052e-4582a0b438aso32771391cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727083370; x=1727688170;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHR5/PqnEGvG2nKOK2RFe26k4BMP9Pm6Oaseg0KD65Q=;
 b=PZTJaKtQfkapghpj8P9VmTbgDcaAOvIWmNvLFOAla+lFvMNz4tKTjfLYSMuSdGWFwR
 0FDGtOBXpKgSoSm9jl2T4zL5pm0ZpXIYcAT2iViR7LfH0PwRcTiq5wLv9QkjA6PF5mlk
 nR788tFUYmTqzeOEQOzZeGSP0Gvvuk2rZ4NQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727083370; x=1727688170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rHR5/PqnEGvG2nKOK2RFe26k4BMP9Pm6Oaseg0KD65Q=;
 b=nMVrSCwyvuCRMD9KCIfE8G/ElI9B89FrjWJfQ6FFXswfOSd84yPwb3B8Z34oD9DVFN
 Mx31LscKs/Sdh0jOaLNFKbmO1VmWcOqeAEw/S/lmxAdh+GgUZDpEwXX7lmGW9MwnwPVc
 jGmxWg/t7Ajd6n/eaSDx39G8qlcWB0hVD021BDGTRS21jUAbqYs9MH5yDjJ6gsk5xSax
 3T/MYvA3NjSHJKhSzx+sDtM4oLvxFCTP9WmTVq7mmTOCvrWSjsbBa4FfyFrBEvNpnj2e
 rKefGgUt78hwbX38XR6wf/pHfgWWoJFWCq+od4ecD3q/6LaUP5imIIPe2S6fQlVFa5jM
 r4Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2DXb6x7YKdfdKg4qAT0fNw4zuW4OP8jgIevBDrqTWUiU3SgoIRTA/1rHWLhI8LQ1L42S8c5YN5wA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFMKtSyJl9VqZYJAe5T50NJyeK71CC2YrDo7z5jvwf/vqgChKg
 Q0W5ATfW/jWJYGNYPnEIcyqwdcTwcF+K+uAC/vx53WVLKtKAMO9Ui3j8YbY/w4eo9XO9Aky0v+j
 r4IdoiKfG4YSYcYlXXvTQ3M0KrD40juTLSISq
X-Google-Smtp-Source: AGHT+IH2U8WBLfUNtvF0U7zgHJJecXFoNGuBJBPDQ5KlvHw1m5rB5qtsUrYjwY20aN5I76g0MS7qCKmMVYbcFU6lHf8=
X-Received: by 2002:a05:622a:1893:b0:458:3233:8eea with SMTP id
 d75a77b69052e-45b22694420mr173373311cf.12.1727083370617; Mon, 23 Sep 2024
 02:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240119033126.1802711-1-ototot@chromium.org>
 <CAH2knV03g8_z8326yd=pQV11X3N1VFc_DqXzVjMgM4Q0C+8awg@mail.gmail.com>
In-Reply-To: <CAH2knV03g8_z8326yd=pQV11X3N1VFc_DqXzVjMgM4Q0C+8awg@mail.gmail.com>
From: Tommy Chiang <ototot@chromium.org>
Date: Mon, 23 Sep 2024 09:22:39 +0000
Message-ID: <CAH2knV3RZdnu36+dDQGU834G+82dOqtyHY4RhRow5tb0VXWpqg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Add syntax highlighting to code listings in the
 document
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

Ping.
Please let me know if I'm doing something wrong.

On Mon, Feb 19, 2024 at 11:00=E2=80=AFAM Tommy Chiang <ototot@chromium.org>=
 wrote:
>
> Kindly ping :)
>
> On Fri, Jan 19, 2024 at 11:33=E2=80=AFAM Tommy Chiang <ototot@chromium.or=
g> wrote:
> >
> > This patch tries to improve the display of the code listing
> > on The Linux Kernel documentation website for dma-buf [1] .
> >
> > Originally, it appears that it was attempting to escape
> > the '*' character, but looks like it's not necessary (now),
> > so we are seeing something like '\*' on the webite.
> >
> > This patch removes these unnecessary backslashes and adds syntax
> > highlighting to improve the readability of the code listing.
> >
> > [1] https://docs.kernel.org/driver-api/dma-buf.html
> >
> > Signed-off-by: Tommy Chiang <ototot@chromium.org>
> > ---
> >  drivers/dma-buf/dma-buf.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 8fe5aa67b167..e083a0ab06d7 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1282,10 +1282,12 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_B=
UF);
> >   *   vmap interface is introduced. Note that on very old 32-bit archit=
ectures
> >   *   vmalloc space might be limited and result in vmap calls failing.
> >   *
> > - *   Interfaces::
> > + *   Interfaces:
> >   *
> > - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct iosys_map =
\*map)
> > - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct iosys_map =
\*map)
> > + *   .. code-block:: c
> > + *
> > + *     void *dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *ma=
p)
> > + *     void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *m=
ap)
> >   *
> >   *   The vmap call can fail if there is no vmap support in the exporte=
r, or if
> >   *   it runs out of vmalloc space. Note that the dma-buf layer keeps a=
 reference
> > @@ -1342,10 +1344,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_B=
UF);
> >   *   enough, since adding interfaces to intercept pagefaults and allow=
 pte
> >   *   shootdowns would increase the complexity quite a bit.
> >   *
> > - *   Interface::
> > + *   Interface:
> > + *
> > + *   .. code-block:: c
> >   *
> > - *      int dma_buf_mmap(struct dma_buf \*, struct vm_area_struct \*,
> > - *                    unsigned long);
> > + *     int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *, uns=
igned long);
> >   *
> >   *   If the importing subsystem simply provides a special-purpose mmap=
 call to
> >   *   set up a mapping in userspace, calling do_mmap with &dma_buf.file=
 will
> > --
> > 2.43.0.381.gb435a96ce8-goog
> >
