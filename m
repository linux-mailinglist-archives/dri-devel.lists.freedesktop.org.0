Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681198584C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ACF10E7E6;
	Wed, 25 Sep 2024 11:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sCbIefFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E7910E7E8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 11:41:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5365c512b00so1394006e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727264471; x=1727869271; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eq5kqVdxIPnr1qj+gRKTOVccfM5+TlCgxfIme/nC8tk=;
 b=sCbIefFMgSUTIDyBYXWwGSYoIevi3FWVxED3zK7kJhNq2Rq49XiUWPx6iaiZxPDiEf
 /7BgaiCu/hIj/UmA/Yoet7ZxLhneQilH8eRTsnsXkrOSCo5Pbk2Q++nrme5+R6jwlahu
 w7K7L5Q18WIbLHk6Dn2OPPbyvmcZM5+GVxHrpuIW0suTjMN+jy/FZ5Hv00ttYTk3UGsh
 4BoHFuppT7Pj5DtqHf6718O4vMZDb4mK8SDgXNp9CKoH7J6j12eHIGj41xTzjWzY4y9f
 Osl5wPBOmFE5ZJzn+KL7kzg0zNnLxDw2Ic3iZ/vlmEYYYiuzlsAXr9e9urdLQ8EUNW5F
 8MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727264471; x=1727869271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eq5kqVdxIPnr1qj+gRKTOVccfM5+TlCgxfIme/nC8tk=;
 b=qKWjC15a7YYtWnYWNwUO45Y1/q89RDP4DT5z6MjHkYCSlm8yJCby5pHIMSgaTebq/B
 RCE4Jc6seTKyQCLNsDJu87qgyWN7sC/z83VzBbDek964lH28Ly6hTzWGzKM8SM1OvC9U
 oaFtEhQIFP/UEUYfdVDFSXYvF/KK5baOutkbEAhh04ExYwzcUETXMc3QwTsNHbJA9WGv
 IWtdQ7gbbgwfWH6TG4AnVgemzTce6WO95tXAGmPrEP5AuQ+s3U88KwCVYmWR+3aeQTLc
 bjBO0oIjG+DL+Vp/D1nP0GpDIZwuxOcFa2PFF49b1iIApO6cVlw5Kv9AiKi5sCW7dsu9
 m1Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkZRYogf/W+mmyNPkI63v5p6cJ8koou8MyxAbDeTjErKojAeWooNCLA7kfG4aANwTxmcDuTCKPqUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwelhJDbTRiUp9Vb3eL5nrqp0aei2uG4AUP0NysrbwAEUtBVkKX
 3cSrdDNVC7ZeOF9EGHmgHUWaBmNBwpCi2QKoKH+z0rAO25IdajF6Zi6LFjN7RlA=
X-Google-Smtp-Source: AGHT+IHqv2IMWN3oXR6umOJo26p2rI5FNSuQAxfP5Ks/Hkq3jsOKqQQKyJ6wBA/PwN9+yj2xFK6XGw==
X-Received: by 2002:a05:6512:3d0a:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-5387c7799d8mr1295841e87.39.1727264470164; 
 Wed, 25 Sep 2024 04:41:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e5bf3sm500872e87.75.2024.09.25.04.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:41:09 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:41:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <bktt4yanmfn4gjljy2wxmigj6mncpga237oxyf4g4h2vxu2a3q@asnsn7smi4u2>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <20240925071504.GA3519798@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925071504.GA3519798@rayden>
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

On Wed, Sep 25, 2024 at 09:15:04AM GMT, Jens Wiklander wrote:
> On Mon, Sep 23, 2024 at 09:33:29AM +0300, Dmitry Baryshkov wrote:
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
> > I have a feeling (I might be completely wrong here) that by using
> > generic dma-buf heaps we can easily end up in a situation when the
> > userspace depends heavily on the actual platform being used (to map the
> > platform to heap names). I think we should instead depend on the
> > existing devices (e.g. if there is a TEE device, use an IOCTL to
> > allocate secured DMA BUF from it, otherwise check for QTEE device,
> > otherwise check for some other vendor device).
> 
> That makes sense, it's similar to what we do with TEE_IOC_SHM_ALLOC
> where we allocate from a carveout reserverd for shared memory with the
> secure world. It was even based on dma-buf until commit dfd0743f1d9e
> ("tee: handle lookup of shm with reference count 0").
> 
> We should use a new TEE_IOC_*_ALLOC for these new dma-bufs to avoid
> confusion and to have more freedom when designing the interface.
> 
> > 
> > The mental experiment to check if the API is correct is really simple:
> > Can you use exactly the same rootfs on several devices without
> > any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> > laptop, etc)?
> 
> No, I don't think so.

Then the API needs to be modified.

Or the userspace needs to be modified in the way similar to Vulkan /
OpenCL / glvnd / VA / VDPU: platform-specific backends, coexisting on a
single rootfs.

It is more or less fine to have platform-specific rootfs when we are
talking about the embedded, resource-limited devices. But for the
end-user devices we must be able to install a generic distro with no
device-specific packages being selected.

> 
> > 
> > > 
> > > This can be tested on QEMU with the following steps:
> > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > >         -b prototype/sdp-v1
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
> >   non-secured memory to the users which expect a secure buffer?
> > 
> > - At the same time corresponding entities shouldn't decode data to the
> >   buffers accessible to the rest of the sytem.
> 
> I'll a few tests along that.
> 
> Thanks,
> Jens
> 
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
> > >   the generic restricted heap
> > > * Simplifications and cleanup
> > > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> > >   support"
> > > * Replaced the word "secure" with "restricted" where applicable
> > > 
> > > Etienne Carriere (1):
> > >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > > 
> > > Jens Wiklander (2):
> > >   dma-buf: heaps: restricted_heap: add no_map attribute
> > >   dma-buf: heaps: add Linaro restricted dmabuf heap support
> > > 
> > > Olivier Masse (1):
> > >   dt-bindings: reserved-memory: add linaro,restricted-heap
> > > 
> > >  .../linaro,restricted-heap.yaml               |  56 ++++++
> > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > >  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> > >  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> > >  drivers/tee/tee_core.c                        |  38 ++++
> > >  drivers/tee/tee_shm.c                         | 104 ++++++++++-
> > >  include/linux/tee_drv.h                       |  11 ++
> > >  include/uapi/linux/tee.h                      |  29 +++
> > >  10 files changed, 426 insertions(+), 7 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
