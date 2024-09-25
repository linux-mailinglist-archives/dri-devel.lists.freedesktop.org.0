Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D888A985CA7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6988810E0C8;
	Wed, 25 Sep 2024 12:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gXDmmMRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0CA10E0CA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 12:51:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f77fe7ccc4so65577701fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727268687; x=1727873487; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LGma69Sr28MXVjXEqnOY6cy8Xe0bfhYxw2mh4o1EehI=;
 b=gXDmmMRL5HduGaM243y1DYubU1XcZJv1lmNrgp9aiMK0elTp4Vn779krSjDTgd/2/B
 pCttkpHUws+ALe/S+mlfJcOXr7zf2jV/LOJyqzmX73G1EDEwfPnLN3FEYSbq2goe+mmz
 Rt5Sm2FgGGyn6GWgMoTWHpsG3Q1zz4Pssqk/ZGb1CeD7+5xVAGp22xjzwuHcWp22Rwav
 lJiqBo368aNkayg+Srfc7mDEkLJJjU+dWPiYEQKwn2OJMpwW8rgaRrRgLfcdutEqO1M5
 KvMBNI9hTpuNbGvZCVKRfHdUzdsKfegNK4Ios8gvgfV7PsKR6CFvrs6s9+pp04XNyM7M
 1Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727268687; x=1727873487;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGma69Sr28MXVjXEqnOY6cy8Xe0bfhYxw2mh4o1EehI=;
 b=pe1aa23Mi3GbQ6XLRq+v7mmVH5+GLcujDv5y/ks0QpowtNNZ8c+WlV5+cUxDiSqFps
 9yq+1GF+gO49VRbn4jmr+sdhLzi4/eCFK1jThH9ZPkuJArHJimW1O3ndsprEFOUKtDsH
 Q9aWofbT+MY4ecoFu5huZilwLk3+jqnG84DAAewcU7bADYRDkBrDkOlyuxrUT6IIhWaG
 s0ypYxgYfJs0HYUJw24U8jjZGkj+hHlL5+vhRrHBnLIH/1uwuVMhzIXW6Qpc9YHExPdM
 KS5yZTqtGvSaKXWbkZJ/E4RHEGPwf6exsqLzN+70fVqsivdtJaQBJ1m5ly9TnYaqKpJP
 +YdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjunAW7zTemXofQerwwN7syfXEcb3oMgxioOZ0R2vZCgZhj4XhCRYH0geF65rmoOI3I5/4Ja+qMOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoRWuWW6IGIFGHs5YRiRqMBBuMum52rKUbvyhYh0JK59W7FSsA
 kybMrZFK+bXwqUiFa2rYPwGv1xQCvHEP6TwgMtn7SN8bhW6Ph7LjUDb+MdUjEeQ=
X-Google-Smtp-Source: AGHT+IEGQnkRVJDhYLTjRbwCd1JcWlry2TnoRPviQ16wlDbXpkXhhkV0VphxcyVjJS5vqRD4q2JN9A==
X-Received: by 2002:a2e:90c3:0:b0:2f6:649e:bf70 with SMTP id
 38308e7fff4ca-2f916012799mr14524141fa.26.1727268686577; 
 Wed, 25 Sep 2024 05:51:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d28998e5sm4935891fa.101.2024.09.25.05.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 05:51:25 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:51:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
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

On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
> Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> > On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> > > On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> > > > Hi,
> > > > 
> > > > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > > > Hi,
> > > > > 
> > > > > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > > > > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > > > > 
> > > > > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > > > > carvout. This is a difference from the Mediatek restricted heap which
> > > > > relies on the secure world to manage the carveout.
> > > > > 
> > > > > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > > > > afraid I've had to skip some comments.
> > > > I know I have raised the same question during LPC (in connection to
> > > > Qualcomm's dma-heap implementation). Is there any reason why we are
> > > > using generic heaps instead of allocating the dma-bufs on the device
> > > > side?
> > > > 
> > > > In your case you already have TEE device, you can use it to allocate and
> > > > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > > > 
> > > This goes to the heart of why we have dma-heaps in the first place.
> > > We don't want to burden userspace with having to figure out the right
> > > place to get a dma-buf for a given use-case on a given hardware.
> > > That would be very non-portable, and fail at the core purpose of
> > > a kernel: to abstract hardware specifics away.
> > Unfortunately all proposals to use dma-buf heaps were moving in the
> > described direction: let app select (somehow) from a platform- and
> > vendor- specific list of dma-buf heaps. In the kernel we at least know
> > the platform on which the system is running. Userspace generally doesn't
> > (and shouldn't). As such, it seems better to me to keep the knowledge in
> > the kernel and allow userspace do its job by calling into existing
> > device drivers.
> 
> The idea of letting the kernel fully abstract away the complexity of inter
> device data exchange is a completely failed design. There has been plenty of
> evidence for that over the years.
> 
> Because of this in DMA-buf it's an intentional design decision that
> userspace and *not* the kernel decides where and what to allocate from.

Hmm, ok.

> 
> What the kernel should provide are the necessary information what type of
> memory a device can work with and if certain memory is accessible or not.
> This is the part which is unfortunately still not well defined nor
> implemented at the moment.
> 
> Apart from that there are a whole bunch of intentional design decision which
> should prevent developers to move allocation decision inside the kernel. For
> example DMA-buf doesn't know what the content of the buffer is (except for
> it's total size) and which use cases a buffer will be used with.
> 
> So the question if memory should be exposed through DMA-heaps or a driver
> specific allocator is not a question of abstraction, but rather one of the
> physical location and accessibility of the memory.
> 
> If the memory is attached to any physical device, e.g. local memory on a
> dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
> memory as device specific allocator.

So, for embedded systems with unified memory all buffers (maybe except
PCIe BARs) should come from DMA-BUF heaps, correct?

> 
> If the memory is not physically attached to any device, but rather just
> memory attached to the CPU or a system wide memory controller then expose
> the memory as DMA-heap with specific requirements (e.g. certain sized pages,
> contiguous, restricted, encrypted, ...).

Is encrypted / protected a part of the allocation contract or should it
be enforced separately via a call to TEE / SCM / anything else?

-- 
With best wishes
Dmitry
