Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB39854C0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 09:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9520C10E7AF;
	Wed, 25 Sep 2024 07:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ll+TqoJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0724E10E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 07:58:35 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2055a3f80a4so40497195ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727251114; x=1727855914; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w3005EJcuEMyy2pLBvy7gjdyTGC+071SxJGUSCLD2e8=;
 b=Ll+TqoJki1WRx766UMSoM5Lw9ga3cyt3T0fdSmokysjcHv4qOvbrn0isn0/julmsLA
 NHYPVoTVxaaYRYlujKEGEgekpwH5GLfdDVbuBqNGPrjRiZUVr3vl2fS02Y8dk7Ma01Pt
 kPOH2BTPiGIEwU6ZtnMW7VYKAjEbtNsLS3E2UuAS5fiDlrLSj2WC9mvIO0KWG6YwQO4x
 a2bxRlluZKDx0lGWw54ELbIzEJRalIvljhL/LwZ/pjCrKV9mXmZ7NF2qyBnrL0UwHDXT
 p95Hew9B4hT8kdNtgvUoidVevmgcrTTx4nrmfHNs3ieqRkjzmMgm30mOkQ7JsFMdkugA
 nGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727251114; x=1727855914;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3005EJcuEMyy2pLBvy7gjdyTGC+071SxJGUSCLD2e8=;
 b=P7Yv5L9+oXarRPHAGbSL/U2/AKwCoAYvLILJKkL6lGAE4Gw9YVcrsPOut/BPhPqUGk
 AsWrnEEFLm1egqxVulYNu381oc0GqcC6I/zGifRFp03YEa6DMwigl6f6/dlOj5Gvlv5p
 7xqz8bFvB+s/MUeEf8L8jtWkcKM6Ch5paOrqVQ0kNcadAuNYyVpvd69VQo4e+q6gGeNE
 3iO9EofDaswgpGpa32m+5eCr7hRmCi6jHXohTX+LhOnhb+KECWfEpbxjB71/hkTnQrzO
 YOF1FVY8yCxKSIG8YrPGPc2Rir9Ot0h3wfR7KeHYliuWuabpeuIKJZ6gP0WIyRFcu0fb
 ORmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXCxClSGEIz1yujzi9EXwLm1fI0agtioz7SJIlpDia79j+cBVlb6EN2Slurh+8xhHJmVkcQB5OHtc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDMg84AdO61UBSJaW457JzNP5+lE2vRb2d3mIJinPWzjFFfLBe
 +lGbtONcHzmvxxyaUzXXceEviZ8o0/k0oHrWKxRiXKm9T+QpSk52UPT8udYw10E=
X-Google-Smtp-Source: AGHT+IGhTQDOf5we86hU+CNxE3kXgJHwrrMO+v6dx5bUnVpNTQVXtu4MODwnFs2d5aVPIf4yHzsI+A==
X-Received: by 2002:a17:903:2b07:b0:205:80e7:dcc5 with SMTP id
 d9443c01a7336-20afc5e112bmr19118195ad.44.1727251114400; 
 Wed, 25 Sep 2024 00:58:34 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af182d693sm19978135ad.221.2024.09.25.00.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 00:58:33 -0700 (PDT)
Date: Wed, 25 Sep 2024 09:58:17 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <20240925075817.GB3519798@rayden>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
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

Hi,

On Tue, Sep 24, 2024 at 01:13:18PM -0500, Andrew Davis wrote:
> On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> > Hi,
> > 
> > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > Hi,
> > > 
> > > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > > 
> > > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > > carvout. This is a difference from the Mediatek restricted heap which
> > > relies on the secure world to manage the carveout.
> > > 
> > > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > > afraid I've had to skip some comments.
> > 
> > I know I have raised the same question during LPC (in connection to
> > Qualcomm's dma-heap implementation). Is there any reason why we are
> > using generic heaps instead of allocating the dma-bufs on the device
> > side?
> > 
> > In your case you already have TEE device, you can use it to allocate and
> > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > 
> 
> This goes to the heart of why we have dma-heaps in the first place.
> We don't want to burden userspace with having to figure out the right
> place to get a dma-buf for a given use-case on a given hardware.
> That would be very non-portable, and fail at the core purpose of
> a kernel: to abstract hardware specifics away.
> 
> Worse, the actual interface for dma-buf exporting changes from
> framework to framework (getting a dma-buf from DRM is different
> than V4L, and there would be yet another API for TEE, etc..)
> 
> Most subsystem don't need an allocator, they work just fine
> simply being only dma-bufs importers. Recent example being the
> IIO subsystem[0], for which some early posting included an
> allocator, but in the end, all that was needed was to consume
> buffers.
> 
> For devices that don't actually contain memory there is no
> reason to be an exporter. What most want is just to consume
> normal system memory. Or system memory with some constraints
> (e.g. contiguous, coherent, restricted, etc..).
> 
> > I have a feeling (I might be completely wrong here) that by using
> > generic dma-buf heaps we can easily end up in a situation when the
> > userspace depends heavily on the actual platform being used (to map the
> > platform to heap names). I think we should instead depend on the
> > existing devices (e.g. if there is a TEE device, use an IOCTL to
> > allocate secured DMA BUF from it, otherwise check for QTEE device,
> > otherwise check for some other vendor device).
> > 
> > The mental experiment to check if the API is correct is really simple:
> > Can you use exactly the same rootfs on several devices without
> > any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> > laptop, etc)?
> > 
> 
> This is a great north star to follow. And exactly the reason we should
> *not* be exposing device specific constraints to userspace. The constrains
> change based on the platform. So a userspace would have to also pick
> a different set of constraints based on each platform.
> 
> Userspace knows which subsystems it will attach a buffer, and the
> kernel knows what constraints those devices have on a given platform.
> Ideal case is then allocate from the one exporter, attach to various
> devices, and have the constraints solved at map time by the exporter
> based on the set of attached devices.
> 
> For example, on one platform the display needs contiguous buffers,
> but on a different platform the display can scatter-gather. So
> what heap should our generic application allocate from when it
> wants a buffer consumable by the display, CMA or System?
> Answer *should* be always use the generic exporter, and that
> exporter then picks the right backing type based on the platform.
> 
> Userspace shouldn't be dealing with any of these constraints
> (looking back, adding the CMA heap was probably incorrect,
> and the System heap should have been the only one. Idea back
> then was a userspace helper would show up to do the constraint
> solving and pick the right heap. That has yet to materialize and
> folks are still just hardcoding which heap to use..).
> 
> Same for this restricted heap, I'd like to explore if we can
> enhance the System heap such that when attached to the TEE framework,
> the backing memory is either made restricted by fire-walling,
> or allocating from a TEE carveout (based on platform).

So the exporter (you mentioned System heap) will somehow know how to
interact with the TEE subsystem to allocate suitable memory?

I suppose the memory could be from a static carveout, dynamic restricted
memory allocation, or how to turn normal memory into restricted memory
(fire-walling), depending on the platform.

> 
> This will mean more inter-subsystem coordination, but we can
> iterate on these in kernel interfaces. We cannot iterate on
> userspace interfaces, those have to be correct the first time.

Good point, this approach should make it easier for userspace.

Thanks,
Jens

> 
> Andrew
> 
> [0] https://www.kernel.org/doc/html/next/iio/iio_dmabuf_api.html
> 
> > > 
> > > This can be tested on QEMU with the following steps:
> > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > >          -b prototype/sdp-v1
> > > repo sync -j8
> > > cd build
> > > make toolchains -j4
> > > make all -j$(nproc)
> > > make run-only
> > > # login and at the prompt:
> > > xtest --sdp-basic
> > > 
> > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > list dependencies needed to build the above.
> > > 
> > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > the secure world can access and manipulate the memory.
> > 
> > - Can we test that the system doesn't crash badly if user provides
> >    non-secured memory to the users which expect a secure buffer?
> > 
> > - At the same time corresponding entities shouldn't decode data to the
> >    buffers accessible to the rest of the sytem.
> > 
> > > 
> > > Cheers,
> > > Jens
> > > 
> > > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> > > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> > > 
> > > Changes since Olivier's post [2]:
> > > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> > >    the generic restricted heap
> > > * Simplifications and cleanup
> > > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> > >    support"
> > > * Replaced the word "secure" with "restricted" where applicable
> > > 
> > > Etienne Carriere (1):
> > >    tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > > 
> > > Jens Wiklander (2):
> > >    dma-buf: heaps: restricted_heap: add no_map attribute
> > >    dma-buf: heaps: add Linaro restricted dmabuf heap support
> > > 
> > > Olivier Masse (1):
> > >    dt-bindings: reserved-memory: add linaro,restricted-heap
> > > 
> > >   .../linaro,restricted-heap.yaml               |  56 ++++++
> > >   drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > >   drivers/dma-buf/heaps/Makefile                |   1 +
> > >   drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> > >   drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> > >   .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> > >   drivers/tee/tee_core.c                        |  38 ++++
> > >   drivers/tee/tee_shm.c                         | 104 ++++++++++-
> > >   include/linux/tee_drv.h                       |  11 ++
> > >   include/uapi/linux/tee.h                      |  29 +++
> > >   10 files changed, 426 insertions(+), 7 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> > >   create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
