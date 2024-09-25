Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E278B98537E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 09:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565C310E7AC;
	Wed, 25 Sep 2024 07:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LNhgNgHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A2E10E7A9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 07:15:10 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso435225466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 00:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727248508; x=1727853308; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TDaNdhjF6czZwZ8GYJQ+xlqUWHjP+ROLSrQsWDOJZts=;
 b=LNhgNgHLvWdsG/b8V4FgDb/0SFOB2tqKSYxBqzjFG/INxUJJRcUwrd1tbHnCTPVv+k
 J3FhuycKhG4iUAFAI/zKHtAxzlR+mZjZgJMKMhKZgxbrG+GqQnTnOs8zgs7MT5n0cFnt
 u5i0hVhZjlQp76yxuW35J/VZO6Hu9u+qXVc/42DoLCCt2EcLVy46R8ZbYJX1ATmd3ALG
 VMS/I8O0pxZI68OZ3SUawhWq9QLrZ/K2bJota4MfDYtq/IxTrNeRoHG7GCzkk2XjAGbF
 AU+Zp9d2pwGLYDaLiLIGzEcifatZF860Zdnz4SkgjBVYQsvbWO3EbYt+wCy8hEi0MI2p
 st4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727248508; x=1727853308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TDaNdhjF6czZwZ8GYJQ+xlqUWHjP+ROLSrQsWDOJZts=;
 b=EW1WMwAYgMW7VEXzcyZd04XALqbBnvuZ1Gcv/3KS/jRTit4ry2j5dCPwu26Js8c1XQ
 2WlVyS2HI9c/nYBz3W6jd6E9B2cd1Jzg1luAtDa25yN7R1kefyN0kQVQIYxl04SDDrjz
 Re/a06Dmu6SrPeSBiLMujIo65rPZAyWQOBzmtKZxF5gWaDE0LZcNA74+fvgrpu37jT2M
 2JRnfWbMCIKGFkR4lN9ayGy3ldm6CmSp1DMIn3Jp47dvV7LwaEZPLdL0aXCQdO7ShAGF
 yiHedcnEqUV1JZyVAIuXSIldBNBsR/ZqMlUtvjFEKFPRCDTRiih+tXtrS7ljJp0S4DPv
 buaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOn9cJ3/cBSxjwZtWhb4CtejZeIDuI2cQSP2xC+Rq3ZcCKCn+qOKgSCQ20S40TzTGHhVPCr6Q40AA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyviy+PP9t3PJ/WaE+ZK/TvuBQ1xH5xJW/xH1LRQMJpNL9jZ4IH
 DWgOr3iFsiCYcg8mYHhipdnfToCXOVL7GSgo080cEqbLTKzvo48La3loLDX52mE=
X-Google-Smtp-Source: AGHT+IHv93X+9j84xZuTxFkaqtse2mqrU5kPecB2WQv7iIqPArSVbHN4jb/WWw/ItxeQzBtjVNzB3Q==
X-Received: by 2002:a17:907:e656:b0:a86:9644:2a60 with SMTP id
 a640c23a62f3a-a93a03200d0mr161368666b.6.1727248508395; 
 Wed, 25 Sep 2024 00:15:08 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393138bd5sm174570466b.205.2024.09.25.00.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 00:15:06 -0700 (PDT)
Date: Wed, 25 Sep 2024 09:15:04 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
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
Message-ID: <20240925071504.GA3519798@rayden>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
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

On Mon, Sep 23, 2024 at 09:33:29AM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > Hi,
> > 
> > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > 
> > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > carvout. This is a difference from the Mediatek restricted heap which
> > relies on the secure world to manage the carveout.
> > 
> > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > afraid I've had to skip some comments.
> 
> I know I have raised the same question during LPC (in connection to
> Qualcomm's dma-heap implementation). Is there any reason why we are
> using generic heaps instead of allocating the dma-bufs on the device
> side?
> 
> In your case you already have TEE device, you can use it to allocate and
> export dma-bufs, which then get imported by the V4L and DRM drivers.
> 
> I have a feeling (I might be completely wrong here) that by using
> generic dma-buf heaps we can easily end up in a situation when the
> userspace depends heavily on the actual platform being used (to map the
> platform to heap names). I think we should instead depend on the
> existing devices (e.g. if there is a TEE device, use an IOCTL to
> allocate secured DMA BUF from it, otherwise check for QTEE device,
> otherwise check for some other vendor device).

That makes sense, it's similar to what we do with TEE_IOC_SHM_ALLOC
where we allocate from a carveout reserverd for shared memory with the
secure world. It was even based on dma-buf until commit dfd0743f1d9e
("tee: handle lookup of shm with reference count 0").

We should use a new TEE_IOC_*_ALLOC for these new dma-bufs to avoid
confusion and to have more freedom when designing the interface.

> 
> The mental experiment to check if the API is correct is really simple:
> Can you use exactly the same rootfs on several devices without
> any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> laptop, etc)?

No, I don't think so.

> 
> > 
> > This can be tested on QEMU with the following steps:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> >         -b prototype/sdp-v1
> > repo sync -j8
> > cd build
> > make toolchains -j4
> > make all -j$(nproc)
> > make run-only
> > # login and at the prompt:
> > xtest --sdp-basic
> > 
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > list dependencies needed to build the above.
> > 
> > The tests are pretty basic, mostly checking that a Trusted Application in
> > the secure world can access and manipulate the memory.
> 
> - Can we test that the system doesn't crash badly if user provides
>   non-secured memory to the users which expect a secure buffer?
> 
> - At the same time corresponding entities shouldn't decode data to the
>   buffers accessible to the rest of the sytem.

I'll a few tests along that.

Thanks,
Jens

> 
> > 
> > Cheers,
> > Jens
> > 
> > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> > 
> > Changes since Olivier's post [2]:
> > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> >   the generic restricted heap
> > * Simplifications and cleanup
> > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> >   support"
> > * Replaced the word "secure" with "restricted" where applicable
> > 
> > Etienne Carriere (1):
> >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > 
> > Jens Wiklander (2):
> >   dma-buf: heaps: restricted_heap: add no_map attribute
> >   dma-buf: heaps: add Linaro restricted dmabuf heap support
> > 
> > Olivier Masse (1):
> >   dt-bindings: reserved-memory: add linaro,restricted-heap
> > 
> >  .../linaro,restricted-heap.yaml               |  56 ++++++
> >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> >  drivers/dma-buf/heaps/Makefile                |   1 +
> >  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> >  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> >  drivers/tee/tee_core.c                        |  38 ++++
> >  drivers/tee/tee_shm.c                         | 104 ++++++++++-
> >  include/linux/tee_drv.h                       |  11 ++
> >  include/uapi/linux/tee.h                      |  29 +++
> >  10 files changed, 426 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
