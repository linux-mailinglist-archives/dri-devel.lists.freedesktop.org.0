Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE84A839C2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 08:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686CE10E2AC;
	Thu, 10 Apr 2025 06:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vFI/kyMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E993F10E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:49:51 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2d0a742df27so441281fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744267791; x=1744872591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpF7wEE+1cJWx9zAtKf9QlygCmnNGJM9CNsxuBDedRk=;
 b=vFI/kyMW3z0j1FPn9SY9TnYWfv1VLdHnhgci2X4MT1cS9UYG/imAXA3ViS/SclFqOa
 6pdfwJg1iqSfW6gJL/vM+N4zz8nLYhWLzZuuldX4yjRzwl56vTlEmM36iamU9+8wluLT
 m9+fHFhibSRBupzfeGMLs0ceqeeCLsLfXTn2AIJxbpBveA4pYa7lECQ7TFnPhMkcjDD4
 naLDbqXbApVRtUrmozgMdUG6q7M9qM4GVC93wZ19DhRXf5LXlFkDFNJMpCwZrjzktb9D
 q6YAwrotBYDD273o2tgnHg37LXLRz1xc0PRktjHEnuq9jcuWvrBd3HKeRQDr7mA+7kB2
 D6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744267791; x=1744872591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpF7wEE+1cJWx9zAtKf9QlygCmnNGJM9CNsxuBDedRk=;
 b=XEmv+5E3yCNT/IDmW870otjJeqwXG3LIXdl7QRdcNY7s3GjkDBInstFiHkyQCNDkmw
 o36/8YJUNC0BnJT12fhQ3IHliM/G/P1ZbjG0Xj+lWy8WrIerDiovrMl5oAT3xNf+tqSS
 Tc1JO8T38tcOw6vFxMd3lAhd0zkn6mCn5TpSpMMYiynaDYw/AhkMIJ9N2KHJj/uFzcAn
 U0uV9AJSeysve8nXdo7GRCVe2hC3Eh7c2uGOQwsbf86lGyQoA7u5Vaz0eUB+SnIA9xP/
 ZwZzQjL9mZG/pmKj6ltBDlH8v0JT7JZdqacAVhfIUp9Kw57IPXfmcU9UhXEb0wBhayAq
 7HQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2r4+VYoSc0dA2oaSx69tdT1RaNmEJNh+oEiUZGBav/XjxXV2zOhSVvTEwK/EBUWs1KxfcevBOuvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yweiz2it65LgKajN7cy9+91tINtp0L+QtoAL0m3e3h/D4OlNWBj
 ndJOtnHsoTsts4+TlWD3kRYsl7yeWR+Ppv+GIT0nlrooX2XDKF3omNNJlthRICpkSCkJ3lRlcsH
 tbO6AWYt0Vfm+NDF10pvuh5LvYM2SZYxRx2ctDQ==
X-Gm-Gg: ASbGncutWpzAUCQdLZwh3jfXhKiKY3+L97thnJl3pQU6WVLvYpOyCnRx2Ya5GCc2l24
 W9AvGbPgDXGG/UZU1g6xVkozw++sMfqVIOErFsDy+x/F9nUei0RKwqPq2hAVCa+1GdxFCIOJ1Uq
 w+VsgKcCT04sKwVwlBEF4202A=
X-Google-Smtp-Source: AGHT+IHI4FgOoH6eOg0ztL2Lx7hiXdosqXiiUD+d8J9IOEiCubchzZoLqMtVD0Mmvo3sJz+QQ7r84CVnm0uFw++DJDA=
X-Received: by 2002:a05:6871:4009:b0:2c4:1b1c:42c3 with SMTP id
 586e51a60fabf-2d0b3a2a298mr929589fac.9.1744267791101; Wed, 09 Apr 2025
 23:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1>
 <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1>
 <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
 <Z_ZtDQQY4eouqBh8@sumit-X1>
In-Reply-To: <Z_ZtDQQY4eouqBh8@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 10 Apr 2025 08:49:39 +0200
X-Gm-Features: ATxdqUEvXiuy3pdj5yJylN_i-qNjZAR_HHoPy2N2W57yI_8PinKhMCxfS6kRFGI
Message-ID: <CAHUa44GFzG8dr1Kbapbjy77c-wJb4gQVVom24eLLueOK=gCq=A@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
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

On Wed, Apr 9, 2025 at 2:50=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Apr 08, 2025 at 03:28:45PM +0200, Jens Wiklander wrote:
> > On Tue, Apr 8, 2025 at 11:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > > > On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kerne=
l.org> wrote:
> > > > >
> > > > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > > > Hi Sumit,
> > > > > >
> > > > >
> > > > > <snip>
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +#include "tee_private.h"
> > > > > > > > +
> > > > > > > > +struct tee_dma_heap {
> > > > > > > > +     struct dma_heap *heap;
> > > > > > > > +     enum tee_dma_heap_id id;
> > > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > > +     struct tee_device *teedev;
> > > > > > > > +     /* Protects pool and teedev above */
> > > > > > > > +     struct mutex mu;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_heap_buffer {
> > > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > > +     struct tee_device *teedev;
> > > > > > > > +     size_t size;
> > > > > > > > +     size_t offs;
> > > > > > > > +     struct sg_table table;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_heap_attachment {
> > > > > > > > +     struct sg_table table;
> > > > > > > > +     struct device *dev;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_rstmem_static_pool {
> > > > > > > > +     struct tee_rstmem_pool pool;
> > > > > > > > +     struct gen_pool *gen_pool;
> > > > > > > > +     phys_addr_t pa_base;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEA=
PS)
> > > > > > >
> > > > > > > Can this dependency rather be better managed via Kconfig?
> > > > > >
> > > > > > This was the easiest yet somewhat flexible solution I could fin=
d. If
> > > > > > you have something better, let's use that instead.
> > > > > >
> > > > >
> > > > > --- a/drivers/tee/optee/Kconfig
> > > > > +++ b/drivers/tee/optee/Kconfig
> > > > > @@ -5,6 +5,7 @@ config OPTEE
> > > > >         depends on HAVE_ARM_SMCCC
> > > > >         depends on MMU
> > > > >         depends on RPMB || !RPMB
> > > > > +       select DMABUF_HEAPS
> > > > >         help
> > > > >           This implements the OP-TEE Trusted Execution Environmen=
t (TEE)
> > > > >           driver.
> > > >
> > > > I wanted to avoid that since there are plenty of use cases where
> > > > DMABUF_HEAPS aren't needed.
> > >
> > > Yeah, but how the users will figure out the dependency to enable DMA
> > > heaps with TEE subsystem.
> >
> > I hope, without too much difficulty. They are after all looking for a
> > way to allocate memory from a DMA heap.
> >
> > > So it's better we provide a generic kernel
> > > Kconfig which enables all the default features.
> >
> > I disagree, it should be possible to configure without DMABUF_HEAPS if =
desired.
>
> It's hard to see a use-case for that additional compile time option. If
> you are worried about kernel size then those can be built as modules. On
> the other hand the benifit is that we avoid ifdefery and providing sane
> TEE defaults where features can be detected and enabled at runtime
> instead.

My primary concern isn't kernel size, even if it shouldn't be
irrelevant. It doesn't seem right to enable features that are not
asked for casually. In this case, it's not unreasonable or unexpected
that DMABUF_HEAPS must be explicitly enabled in the config if a heap
interface is needed. It's the same as before this patch set.

>
> >
> > >
> > > > This seems to do the job:
> > > > +config TEE_DMABUF_HEAP
> > > > + bool
> > > > + depends on TEE =3D y && DMABUF_HEAPS
> > > >
> > > > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into =
the kernel.
> > >
> > > Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsyste=
m
> > > to use. We should do that such that there isn't a hard dependency to
> > > compile them into the kernel.
> >
> > I was saving that for a later patch set as a later problem. We may
> > save some time by not doing it now.
> >
>
> But I think it's not a correct way to just reuse internal APIs from DMA
> heaps subsystem without exporting them. It can be seen as a inter
> subsystem API contract breach. I hope it won't be an issue with DMA heap
> maintainers regarding export of those APIs.

Fair enough. I'll add a patch in the next patch set for that. I guess
the same goes for CMA.

Cheers,
Jens
