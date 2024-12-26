Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28C9FC8C1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 06:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C96810E72E;
	Thu, 26 Dec 2024 05:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lxtRPbz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EF810E72E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 05:59:35 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4afe1009960so1750474137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 21:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735192774; x=1735797574; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tj/33c0J9joYWGIFk0SUpBommdcWsbOtMfpln3ym7us=;
 b=lxtRPbz9HBuGFJ+g+AIAGoSgmPM33Kklz4LzY42CFiPWi6diHVF4fq2CflfHwjrHMS
 4CwsK5bFn30EciTTVGMzVbSy8W5SDsJokhtI1pQvYqhfg0jFZZbNZjgPBhRf07e1uynq
 qD2RYXvsBzlxSA14VxEthKPABjsIA6UnkKjIe5Ma+7tjYU7fmjg3OLDy7eCMC51gI8Zw
 CZCeml2OMG2QBcBUSr/G7lo3229sofW0DGb5j7zaYMnJeKA6UTUZz91kHVq13aQvO7N1
 Ox5HGQ2VVjXpLX5pfC3GcJX4wGo6+LN1DRIeE3lFETX1/AAs810NA8rLLjSQ4W1hVhbZ
 5m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735192774; x=1735797574;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tj/33c0J9joYWGIFk0SUpBommdcWsbOtMfpln3ym7us=;
 b=xJOXA7HgVauwQmfTEs58gbITf+0rGh9mqC4oFR2Hhs63Id9Zci/W+H6IY09+VNJr5N
 Mcbr9Uf2IYI+C9pqoMps6EJne7h/ouTD+91L9QfJcygNTtXKLs30FWQgvFK8XDTa4D2V
 7bLsIZRFx5MNy4skb3bbePb75+KdvLZYR1vl5NVU5H5Fcj76HpqteGmtBOfii7oSZ2gq
 053PrkUM8S7WAScG9xQ+wbZJuSBXXAoySAJa0cRg2WPcv0A7Fe7luimRmXOi+llvbdAF
 7BWFLnLXk6N1bIgbT8BR3D2Ou7qgGvfeKWLlEBgGw7GDzix0r+yYnQUCycL3e0z8sHES
 tNgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh15q93z0kLl/MIb6clRsQFao/nZVzXuaf+61ZrEzyeqdS/X2rgaItkJP5rKWcRGy44EEN4Ne3tiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1/taLSbIe1bPWenBtPZQy//PWVFEnFG5xkJXHp0H1ZDDR7Djs
 US2JqUzJlstLBXJIv/hY2LIo+qJlq/hlDx28J4odcyFvg2oHE2cSJO8SHG/cXECl2ZbNQ30PyxR
 9DQ9DD7niFirE8PhZDyR22zIE4n6OjtzPuCNihg==
X-Gm-Gg: ASbGnctM1PDZapkA5RdIGc0pswi564XWwqmzBeEbXoLWLCtrGZHWM7FvQkTlfXgzzx7
 UGIvWT0iODWx47WgzDcaMTPnpK85fJodQg0PutP0=
X-Google-Smtp-Source: AGHT+IE00N5vnKOUc7MqeRMXg+SxsijMu6w8qky0ELkHlxmHmPLT1blVC7fcWxjQJ3Y0TOTnD9UaTmwXTcjzXGMlnJk=
X-Received: by 2002:a05:6102:3ec6:b0:4af:bf45:39a8 with SMTP id
 ada2fe7eead31-4b2cc3a793dmr19596749137.16.1735192774291; Wed, 25 Dec 2024
 21:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
In-Reply-To: <Z2p-v-xjhzhPso6u@wunner.de>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 26 Dec 2024 11:29:23 +0530
Message-ID: <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Lukas Wunner <lukas@wunner.de>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
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
 azarrabi@qti.qualcomm.com
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

Hi Lukas,

On Tue, 24 Dec 2024 at 14:58, Lukas Wunner <lukas@wunner.de> wrote:
>
> On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> > Restricted memory is a feature enforced by hardware specific firewalls
> > where a particular TEE implementation governs which particular block
> > of memory is accessible to a particular peripheral or a CPU running in
> > a higher privileged mode than the Linux kernel.
> [...]
> > - Another possible use-case can be for the TEE implementation to store
> > key material in a restricted buffer which is only accessible to the
> > hardware crypto accelerator.
>
> Just a heads-up:
>
> For RSA sign/verify operations using rsassa-pkcs1 encoding,
> the message to be signed/verified (which I understand could
> be located in restricted memory) is prepended by a padding.
>
> The crypto subsystem does the prepending of the padding in software.
> The actual signature generation/verification (which is an RSA encrypt
> or decrypt operation) may be performed in hardware by a crypto
> accelerator.
>
> Before commit 8552cb04e083 ("crypto: rsassa-pkcs1 - Copy source
> data for SG list"), the kernel constructed a scatterlist
> consisting of the padding on the one hand, and of the message
> to be signed/verified on the other hand.  I believe this worked
> for use cases where the message is located in restricted memory.
>
> However since that commit, the kernel kmalloc's a new buffer and
> copies the message to be signed/verified into it.  The argument
> was that although the *kernel* may be able to access the data,
> the crypto accelerator may *not* be able to do so.  In particular,
> portions of the padding are located in the kernel's .rodata section
> which is a valid virtual address on x86 but not on arm64 and
> which may be inaccessible to a crypto accelerator.
>
> However in the case of restricted memory, the situation is exactly
> the opposite:  The kernel may *not* be able to access the data,
> but the crypto accelerator can access it just fine.
>
> I did raise a concern about this to the maintainer, but to no avail:
> https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/

Herbert's point is valid that there isn't any point for mapping
restricted memory in the kernel virtual address space as any kernel
access to that space can lead to platform specific hardware error
scenarios. And for that reason we simply disallow dma_buf_mmap() and
don't support dma_buf_vmap() for DMA-bufs holding TEE restricted
memory. The only consumers for those DMA-bufs will be the DMA capable
peripherals granted access permissions by the TEE implementation. IOW,
kernel role here will be to just provide the DMA-buf infrastructure
for buffers to be set up by TEE and then setting up DMA addresses for
peripherals to access them. The hardware crypto accelerator can be one
such peripheral.

>
> This is the alternative solution I would have preferred:
> https://lore.kernel.org/r/3de5d373c86dcaa5abc36f501c1398c4fbf05f2f.1732865109.git.lukas@wunner.de/
>
> > I am also in favour of end to end open source use-cases. But I fear
> > without progressing in a step wise manner as with this proposal we
> > would rather force developers to upstream all the software pieces in
> > one go which will be kind of a chicken and egg situation. I am sure
> > once this feature lands Mediatek folks will be interested to port
> > their secure video playback patchset [3] on top of it. Similarly other
> > silicon vendors like NXP, Qcom etc. will be motivated to do the same.
>
> The crypto use case may be easier to bring up than the video decoding
> use case because you don't need to implement a huge amount of
> user space code.

Agree, if you already have such an existing hardware use-case then
please feel free to build up on this patch-set.

-Sumit

>
> Thanks,
>
> Lukas
