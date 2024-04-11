Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3DA8A1A73
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 18:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D3910E1C7;
	Thu, 11 Apr 2024 16:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JLtaEV4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C6210E1C7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 16:53:04 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso7037276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712854384; x=1713459184;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xk9ow4mQo0ztyiO7KrDlitvaa4igMglZOi5Xwvcpnhc=;
 b=JLtaEV4rp4db4aYxAYfaL69qzwSyDrk8HHSnl4mYoEnNNyx7VwLamE6rvJRG2c5bNA
 U3v1LLPrOcdwP9ga+oRuhG4sJR+5ubUOtoXwpkb8AXGFhrWhqE42OwSx/Qk9MrCuShDS
 FCMHQY6Kx/vkC2yY/dOv4ndP055gd3sX8UdG0oAFOiC7P2VIhzy34+zKCxl+wd3ohYtT
 c7emPxfIrdYOjC9uBRawN/lyB7JeFgPhDYwXq7KHOG+zlu8YHRZSO9DGz98d/CK62IYD
 6Jqhs/jqSMgeUtMCoxi+WHm+bHmOg3MNr6fNFcqTjPEbcbwkxFp0JvwPgPatBwtL76Gk
 lseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712854384; x=1713459184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xk9ow4mQo0ztyiO7KrDlitvaa4igMglZOi5Xwvcpnhc=;
 b=P1VIgw/khvHzqImmN2xfXLIoP3LEz7MYnlouGlvxRiJpOmRMpP5Mpr34J6al5eGwHg
 VyTDOD2rPUEYga7zlQAzwkNCtgjekN0BkiBq7Pc7ytZnLN7neqPi5SXQH49j2U3Ec4z9
 I0j1xz8EnjBbgx9eQQGbLYDMHggPMMyIC/qgRxNHPkzp+rJMtdhCY7MYnGVUTYHTiGe0
 wr4Rym8z1Tr1WljdJ+LnXdQfaYFGWFieK0NnTgjeE3SnSEpjB4nGEgEf6vs/Vkf0Fz/A
 dNNqxBj3zr6pPzMbTf6Ft5ZAH8HVaJd+aK77XKwpDKx5zOb/sLG9YQ5T4EQQTLUwmTlK
 9efg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY9HsN3vDGc6UEo9L4AXihaKEXRnycnkXhtoNUC8DoU7/WTotzSmd/exL3Wx8RtPZYsWHWzNulaMfCJFBluTsHUeP2MIdTnsSAluGoR7oX
X-Gm-Message-State: AOJu0YwSUeuLcg0O8ZJi2IBC32HH+5DV+Ry4uiLDy1VqqgDW4Tzf2nhz
 QYp4pOOWvPCuHGertq6cl0Yes5YiXMtNck41+OoCSZ8BHiJ5/Qq4lPFKI/9PdIhMQBtJUgaHZ4P
 eqBT+y7lKJtSsPC9SlhUjnk8fFD58qh0ikm5E
X-Google-Smtp-Source: AGHT+IHrAmk4FEak1U24FFhz5I0pjJ4Y1W1GoH1d+YXdH2uAvcc4gxTiyypFZ0hyOkDoXT/aukk4rEfY2anMtoK+l4s=
X-Received: by 2002:a25:86d1:0:b0:dc6:b088:e742 with SMTP id
 y17-20020a2586d1000000b00dc6b088e742mr112053ybm.8.1712854383276; Thu, 11 Apr
 2024 09:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
 <da21fe55-2ffb-4c8e-9863-2f27aa18cf5c@vivo.com>
In-Reply-To: <da21fe55-2ffb-4c8e-9863-2f27aa18cf5c@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 11 Apr 2024 09:52:51 -0700
Message-ID: <CABdmKX0AJjdVBPR=3c7oRyDRQx86GCGheVwkheXi7fOkJaRY8A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: Rong Qianfeng <11065417@vivo.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 sumit.semwal@linaro.org, 
 pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch, jason@jlekstrand.net, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
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

On Thu, Apr 11, 2024 at 1:21=E2=80=AFAM Rong Qianfeng <11065417@vivo.com> w=
rote:
>
>
> =E5=9C=A8 2024/4/10 0:37, T.J. Mercier =E5=86=99=E9=81=93:
> > [You don't often get email from tjmercier@google.com. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Tue, Apr 9, 2024 at 12:34=E2=80=AFAM Rong Qianfeng <11065417@vivo.co=
m> wrote:
> >>
> >> =E5=9C=A8 2024/4/8 15:58, Christian K=C3=B6nig =E5=86=99=E9=81=93:
> >>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
> >>>> [SNIP]
> >>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
> >>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf wi=
th
> >>>>>> offset and len.
> >>>>> You have not given an use case for this so it is a bit hard to
> >>>>> review. And from the existing use cases I don't see why this should
> >>>>> be necessary.
> >>>>>
> >>>>> Even worse from the existing backend implementation I don't even se=
e
> >>>>> how drivers should be able to fulfill this semantics.
> >>>>>
> >>>>> Please explain further,
> >>>>> Christian.
> >>>> Here is a practical case:
> >>>> The user space can allocate a large chunk of dma-buf for
> >>>> self-management, used as a shared memory pool.
> >>>> Small dma-buf can be allocated from this shared memory pool and
> >>>> released back to it after use, thus improving the speed of dma-buf
> >>>> allocation and release.
> >>>> Additionally, custom functionalities such as memory statistics and
> >>>> boundary checking can be implemented in the user space.
> >>>> Of course, the above-mentioned functionalities require the
> >>>> implementation of a partial cache sync interface.
> >>> Well that is obvious, but where is the code doing that?
> >>>
> >>> You can't send out code without an actual user of it. That will
> >>> obviously be rejected.
> >>>
> >>> Regards,
> >>> Christian.
> >> In fact, we have already used the user-level dma-buf memory pool in th=
e
> >> camera shooting scenario on the phone.
> >>
> >>   From the test results, The execution time of the photo shooting
> >> algorithm has been reduced from 3.8s to 3s.
> >>
> > For phones, the (out of tree) Android version of the system heap has a
> > page pool connected to a shrinker. That allows you to skip page
> > allocation without fully pinning the memory like you get when
> > allocating a dma-buf that's way larger than necessary. If it's for a
> > camera maybe you need physically contiguous memory, but it's also
> > possible to set that up.
> >
> > https://android.googlesource.com/kernel/common/+/refs/heads/android14-6=
.1/drivers/dma-buf/heaps/system_heap.c#377
> >
> Thank you for the reminder.
>
> The page pool of the system heap can meet the needs of most scenarios,
> but the camera shooting scenario is quite special.
>
> Why the camera shooting scenario needs to have a dma-buf memory pool in
> the user-level=EF=BC=9F
>
> (1) The memory demand is extremely high and time requirements are
> stringent.

Preallocating for this makes sense to me, whether it is individual
buffers or one large one.

> (2) The memory in the page pool(system heap) is easily reclaimed or used
> by other apps.

Yeah, by design I guess. I have seen an implementation where the page
pool is proactively refilled after it has been empty for some time
which would help in scenarios where the pool is often reclaimed and
low/empty. You could add that in a vendor heap.

> (3) High concurrent allocation and release (with deferred-free) lead to
> high memory usage peaks.

Hopefully this is not every frame? I saw enough complaints about the
deferred free of pool pages that it hasn't been carried forward since
Android 13, so this should be less of a problem on recent kernels.

> Additionally, after the camera exits, the shared memory pool can be
> released, with minimal impact.

Why do you care about the difference here? In one case it's when the
buffer refcount goes to 0 and memory is freed immediately, and in the
other it's the next time reclaim runs the shrinker.


I don't want to add UAPI for DMA_BUF_IOCTL_SYNC_PARTIAL to Android
without it being in the upstream kernel. I don't think we can get that
without an in-kernel user of dma_buf_begin_cpu_access_partial first,
even though your use case wouldn't rely on that in-kernel usage. :\ So
if you want to add this to phones for your camera app, then I think
your best option is to add a vendor driver which implements this IOCTL
and calls the dma_buf_begin_cpu_access_partial functions which are
already exported.

Best,
T.J.
