Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DBA33AD3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 10:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC6310EA33;
	Thu, 13 Feb 2025 09:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AXDokSh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B463810EA33
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:16:13 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-868e5684712so173780241.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739438172; x=1740042972; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BAacpC/hwDG/mtj28XuI3plzqqG6lLKWx9Gqjj8DVbw=;
 b=AXDokSh7sLavGQtecxREk4ScwajpFAX39VqjRIjJb+xBkI0Td3xgfiMyaZZtyXlWCY
 kWPcDprtgZ+artgShiiyRpCYMB7sAFAxXXBC04OdNjgrw7Jbzx0Xa/GhE9VAM2T74FU8
 VCxGnIjWRwJclh9do63jrhAn2/cikVqwcHtKTEjL1VrEN+2vfm9PR1FjhcB71+Cm9Fxn
 zYbbYMLOETw+L8cdfmNSnOhI+Q+byD/vUJCqoRRQfsIGAW5fvCc/j1XF2dQg0mFh3qwE
 EY2Upi5joYVsDNN8vyzEXUMU1I6zYZTfHqvBmgjxwvPr3hfNk5phOO2rIOwxEETpHw4T
 IqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739438172; x=1740042972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BAacpC/hwDG/mtj28XuI3plzqqG6lLKWx9Gqjj8DVbw=;
 b=tksSMav2mT9MKlbW9/LPw4QfVZkqeSRnxpjv6qAail+gdIcPyxZGbqw5CRk9pzqGJt
 HK5DmmodvNjL7GmdgOOTI2QoxZSJZAKw6PwPPtlwjyuB0AHhS/T0O+gDXDoSfwOkvvGs
 /9jDFMOvuPm5bXFF+IoebL6xubqeKImgKiivpFjrItaRwTwy3EnBdqMtIzFs05lBAj2e
 dKmEQIf+AG2ylKpR+1cOPd3eqhBcFjuym6mrVUCxVL9mXMzpCd2mBB/8SM2K75V56brp
 8R8C2Jpc3x9cTbvx6ca8O64LfkDNXhuIg6kpLg6FtJzD8qyUO7d03WVfsM9Ocrvrp6yX
 ERwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnVLD4BGLdC8M/eTtBN8azBs0uPsxDTLjaTfegZUvhfDzw7449Jk3U/sCDCDC6VG/MYy+wSm4npmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVpwt6WIItYOpMEu00kT1yXuGDlq0/mihpAj2aGg6YoESNtOxk
 CIrITRaxpwutAiVK4LYoCRTt8nkYW+MwV3KpwM8v/zSnFczL3L/pZ9rInGFs3ysBz7hqyranEs/
 +XJBdp+0Ypkxt15Y16RMJJ1PI/mFgaApCT9cl5Q==
X-Gm-Gg: ASbGncuPxOPUTwmSjiCmAO5Q8qnznh4FHmXkp5WLC8Ie5LqamzU1OPIWqPULRLkmskV
 yjkkRTzm78bJWObQuScQ3f15m9Tbu5u4EiibBBuLJn8s6nR1CUCzs2UoEPJovQZ8JBb+mB0wqqj
 Y=
X-Google-Smtp-Source: AGHT+IHuPpL4xteSdbWgrL0r9v96spUDd3pY29fru20lM3gKm1cy1XWf5xoLNbeh3qhFcvaDPibH3i24OVPTFa+BmLk=
X-Received: by 2002:a05:6102:2912:b0:4b9:bc52:e050 with SMTP id
 ada2fe7eead31-4bc0351978amr3199364137.2.1739438172547; Thu, 13 Feb 2025
 01:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
 <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com>
In-Reply-To: <20250213093557.278f5d19@collabora.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 13 Feb 2025 14:46:01 +0530
X-Gm-Features: AWEUYZm0Wp1I6dLShCTCErZfuQ5_X523x-MqvIqYj1fsBxxxtOs8WA89SI1vekc
Message-ID: <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
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

On Thu, 13 Feb 2025 at 14:06, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 13 Feb 2025 12:11:52 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > Hi Boris,
> >
> > On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > +Florent, who's working on protected-mode support in Panthor.
> > >
> > > Hi Jens,
> > >
> > > On Tue, 17 Dec 2024 11:07:36 +0100
> > > Jens Wiklander <jens.wiklander@linaro.org> wrote:
> > >
> > > > Hi,
> > > >
> > > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > >
> > > We're currently working on protected-mode support for Panthor [1] and it
> > > looks like your series (and the OP-TEE implementation that goes with
> > > it) would allow us to have a fully upstream/open solution for the
> > > protected content use case we're trying to support. I need a bit more
> > > time to play with the implementation but this looks very promising
> > > (especially the lend rstmem feature, which might help us allocate our
> > > FW sections that are supposed to execute code accessing protected
> > > content).
> >
> > Glad to hear that, if you can demonstrate an open source use case
> > based on this series then it will help to land it. We really would
> > love to see support for restricted DMA-buf consumers be it GPU, crypto
> > accelerator, media pipeline etc.
> >
> > >
> > > >
> > > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > > restrictions for the memory used for the DMA-bufs.
> > > >
> > > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > > how to allocate the restricted physical memory.
> > >
> > > I'll probably have more questions soon, but here's one to start: any
> > > particular reason you didn't go for a dma-heap to expose restricted
> > > buffer allocation to userspace? I see you already have a cdev you can
> > > take ioctl()s from, but my understanding was that dma-heap was the
> > > standard solution for these device-agnostic/central allocators.
> >
> > This series started with the DMA heap approach only here [1] but later
> > discussions [2] lead us here. To point out specifically:
> >
> > - DMA heaps require reliance on DT to discover static restricted
> > regions carve-outs whereas via the TEE implementation driver (eg.
> > OP-TEE) those can be discovered dynamically.
>
> Hm, the system heap [1] doesn't rely on any DT information AFAICT.

Yeah but all the prior vendor specific secure/restricted DMA heaps
relied on DT information.

> The dynamic allocation scheme, where the TEE implementation allocates a
> chunk of protected memory for us would have a similar behavior, I guess.

In a dynamic scheme, the allocation will still be from CMA or system
heap depending on TEE implementation capabilities but the restriction
will be enforced via interaction with TEE.

>
> > - Dynamic allocation of buffers and making them restricted requires
> > vendor specific driver hooks with DMA heaps whereas the TEE subsystem
> > abstracts that out with underlying TEE implementation (eg. OP-TEE)
> > managing the dynamic buffer restriction.
>
> Yeah, the lend rstmem feature is clearly something tee specific, and I
> think that's okay to assume the user knows the protection request
> should go through the tee subsystem in that case.

Yeah but how will the user discover that? Rather than that it's better
for the user to directly ask the TEE device to allocate restricted
memory without worrying about how the memory restriction gets
enforced.

>
> > - TEE subsystem already has a well defined user-space interface for
> > managing shared memory buffers with TEE and restricted DMA buffers
> > will be yet another interface managed along similar lines.
>
> Okay, so the very reason I'm asking about the dma-buf heap interface is
> because there might be cases where the protected/restricted allocation
> doesn't go through the TEE (Mediatek has a TEE-free implementation
> for instance, but I realize vendor implementations are probably not the
> best selling point :-/).

You can always have a system with memory and peripheral access
permissions setup during boot (or even have a pre-configured hardware
as a special case) prior to booting up the kernel too. But that even
gets somehow configured by a TEE implementation during boot, so
calling it a TEE-free implementation seems over-simplified and not a
scalable solution. However, this patchset [1] from Mediatek requires
runtime TEE interaction too.

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

> If we expose things as a dma-heap, we have
> a solution where integrators can pick the dma-heap they think is
> relevant for protected buffer allocations without the various drivers
> (GPU, video codec, ...) having to implement a dispatch function for all
> possible implementations. The same goes for userspace allocations,
> where passing a dma-heap name, is simpler than supporting different
> ioctl()s based on the allocation backend.

There have been several attempts with DMA heaps in the past which all
resulted in a very vendor specific vertically integrated solution. But
the solution with TEE subsystem aims to make it generic and vendor
agnostic.

>
> [1]https://elixir.bootlin.com/linux/v6.13.2/source/drivers/dma-buf/heaps/system_heap.c#L424

-Sumit
