Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF6A06E22
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 07:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8BF10ECF8;
	Thu,  9 Jan 2025 06:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PAMtX1Os";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6428B10ECF5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 06:16:55 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3ebb2d8dac4so299216b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 22:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736403354; x=1737008154; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vC9nJtt9rRq/geCAGZDFx6gLFWekfxOk8FhgpKUHqfQ=;
 b=PAMtX1OsiZ6iKb37enCJ1+vqlCLbsSUro6FNyCxJ7GZtJ/sR795oAmLmiUx2kJqmgq
 338NXgNw+ewLIljoL5gp2KIGE/OLhzcgdooaOKfn162/VHAglgWprPdqRRgEQCu5qG2P
 YywS+Jww6Vbjz5ttl4/cixqkw4AKAz1aX8v0SzpfbKUSwngfUsq7IsxRUXVm2hz1VJqu
 1SrdPo+weir5tRRQCemazFqhjaDCH3WP64mVUHXXTca8mPgmN8MemFtoU+mgS/KmsGCN
 TB85wSikGPGsmu7YhxfyOBtw8/N5JcQTZQjsZkEjx8/MQwYXQxBoIdk0TGdvI2VX22X3
 EmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736403354; x=1737008154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vC9nJtt9rRq/geCAGZDFx6gLFWekfxOk8FhgpKUHqfQ=;
 b=TcV3qTunuaVAv6gQowSuU5ffWuWlLsTxP4iNhKMMg0cBbDTZ7WFquAf6audJeG/Tni
 eAMrqtD2PhDTq85zTmCoq+8ejrkXfDgycNCp6DzuqPpgy/ffq/MllREIY73Vd6RAHcVP
 9xgaH48FrL9wEuXIXASoaFkxFX8km+YenYiRPuI6hIV8WTJuvDVGi9Cu1/S76dIvq9UF
 UEJ1WGPPn6L7Il02I7mMGDcuCTJXwLR5QLRYrdYynBy0ZyJRp6avDM7Rd7ZECOvpnZtx
 OvEVVRqvhYlLioJUAurnvbBwtiHRAzTW37lrEGXi1suYN3Re3ofk/nhkmiMyd0KPQ0AC
 aoXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWM2cjP7y1VdRj3eCN230R2+N8uy+urfH09IW5tdZhWjCY0KwXK6mzNQQEaF5uicII0dJkDcGL8A4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWrH2TggjJfAPwSOORBjSoQ9NPzTTUPOSJL5J+45c4YULqNyas
 Or66LLgwAxAClPPQ8eSVJN96Y6J1gPTS0ubx/n4dDuPrcFyHK20OhJW4SeXYe0QtHOH3baI+N+w
 rOnRsGViHcI8XDceGB2LPsX65/cXu8ejwa8TS3xRvcAOv+mtX4AE=
X-Gm-Gg: ASbGncsJmo76W7mNvmlNGnYaTrzxn7DRkJUFC4jemT9MI4zuV4Joov7+olOKHu53dhZ
 DgpuJXZbW5fTVefKICZZHIUEmBW7hcxTHjjIkM7R7
X-Google-Smtp-Source: AGHT+IFkDZGBtCpO5FflLFvbdwmJ3sWoUbJtvuojzOG7I1CBRhorYbwloT2u1hpJHzN4tOBjlfcQFIZrLZuRC0Ec89I=
X-Received: by 2002:a05:6102:c8b:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4b3d0fb1764mr3879731137.21.1736402941990; Wed, 08 Jan 2025
 22:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
In-Reply-To: <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 9 Jan 2025 11:38:50 +0530
X-Gm-Features: AbW1kvZpkNiFcSMyeI-DgMLrpBLgsFpc30qEZPbPGQ78luMHwy5kGq6PCahL58k
Message-ID: <CAFA6WYPXxUQYe9TF3PB9C0NwCz1eceCdYNa1yoKpv320M20qDw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: simona.vetter@ffwll.ch
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

On Wed, 8 Jan 2025 at 22:27, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> > Hi Simona,
> >
> > On Wed, 18 Dec 2024 at 16:36, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > >
> > > On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> > > > Hi,
> > > >
> > > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > > >
> > > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > > restrictions for the memory used for the DMA-bufs.
> > > >
> > > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > > how to allocate the restricted physical memory.
> > > >
> > > > TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> > > > a use-case parameter. This is used by the backend TEE driver to decide on
> > > > allocation policy and which devices should be able to access the memory.
> > > >
> > > > Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> > > > Recording) has been identified so far to serve as examples of what can be
> > > > expected. More use-cases can be added in userspace ABI, but it's up to the
> > > > backend TEE drivers to provide the implementation.
> > > >
> > > > Each use-case has it's own restricted memory pool since different use-cases
> > > > requires isolation from different parts of the system. A restricted memory
> > > > pool can be based on a static carveout instantiated while probing the TEE
> > > > backend driver, or dynamically allocated from CMA and made restricted as
> > > > needed by the TEE.
> > > >
> > > > This can be tested on QEMU with the following steps:
> > > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > > >         -b prototype/sdp-v4
> > > > repo sync -j8
> > > > cd build
> > > > make toolchains -j$(nproc)
> > > > make SPMC_AT_EL=1 all -j$(nproc)
> > > > make SPMC_AT_EL=1 run-only
> > > > # login and at the prompt:
> > > > xtest --sdp-basic
> > > >
> > > > The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> > > > S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> > > > without FF-A using the original SMC ABI instead. Please remember to do
> > > > %rm -rf ../trusted-firmware-a/build/qemu
> > > > for TF-A to be rebuilt properly using the new configuration.
> > > >
> > > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > > list dependencies needed to build the above.
> > > >
> > > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > > the secure world can access and manipulate the memory. There are also some
> > > > negative tests for out of bounds buffers etc.
> > >
> > > I think I've dropped this on earlier encrypted dma-buf discussions for
> > > TEE, but can't find one right now ...
> >
> > Thanks for raising this query.
> >
> > >
> > > Do we have some open source userspace for this? To my knowledge we have
> > > two implementations of encrypted/content protected dma-buf in upstream
> > > right now in the amd and intel gpu drivers, and unless I'm mistaken they
> > > both have some minimal userspace supporting EXT_protected_textures:
> >
> > First of all to clarify the support Jens is adding here for allocating
> > restricted shared memory allocation in TEE subsystem is meant to be
> > generic and not specific to only secure media pipeline use-case. Then
> > here we not only have open source test applications but rather open
> > source firmware too (OP-TEE as a Trusted OS) [1] supporting this as a
> > core feature where we maintain a stable and extensible ABI among the
> > kernel and the OP-TEE core.
> >
> > Restricted memory is a feature enforced by hardware specific firewalls
> > where a particular TEE implementation governs which particular block
> > of memory is accessible to a particular peripheral or a CPU running in
> > a higher privileged mode than the Linux kernel. There can be numeric
> > use-cases surrounding that as follows:
> >
> > - Secure media pipeline where the contents gets decrypted and stored
> > in a restricted buffer which are then accessible only to media display
> > pipeline peripherals.
> > - Trusted user interface where a peripheral takes input from the user
> > and stores it in a restricted buffer which then is accessible to TEE
> > implementation only.
> > - Another possible use-case can be for the TEE implementation to store
> > key material in a restricted buffer which is only accessible to the
> > hardware crypto accelerator.
> >
> > I am sure there will be more use-cases related to this feature but
> > those will only be possible once we provide a stable and extensible
> > restricted memory interface among the Linux user-space and the secure
> > world user-space (normally referred to as Trusted Applications).
> >
> > [1] https://github.com/OP-TEE/optee_os/pull/7159
> >
> > >
> > > https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt
> > >
> > > It's not great, but it does just barely clear the bar in my opinion. I
> > > guess something in gstreamer or similar video pipeline framework would
> > > also do the job.
> > >
> > > Especially with the context of the uapi discussion in the v1/RFC thread I
> > > think we need more than a bare-bones testcase to make sure this works in
> > > actual use.
> >
> > Currently the TEE subsystem already supports a stable ABI for shared
> > memory allocator among Linux user-space and secure world user-space
> > here [2]. And the stable ABI for restricted memory is also along the
> > same lines meant to be a vendor neutral abstraction for the user-space
> > access. The current test cases not only test the interface but also
> > perform regression tests too.
> >
> > I am also in favour of end to end open source use-cases. But I fear
> > without progressing in a step wise manner as with this proposal we
> > would rather force developers to upstream all the software pieces in
> > one go which will be kind of a chicken and egg situation. I am sure
> > once this feature lands Mediatek folks will be interested to port
> > their secure video playback patchset [3] on top of it. Similarly other
> > silicon vendors like NXP, Qcom etc. will be motivated to do the same.
> >
> > [2] https://docs.kernel.org/userspace-api/tee.html
> > [3] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/
>
> We get entire opengl/vulkan driver stacks ready before we merge new drm
> drivers, I really don't think this is too hard from a technical pov. And I
> think the mediatek patches had the same issue of lacking userspace for it,
> so that's not moving things forward.
> -Sima
>

Okay fair enough, I think I get your point. Currently we are missing
at least one peripheral support being the consumer for these
restricted DMA-bufs. So I discussed with Jens offline that we can try
with a crypto peripheral use-case first which can simply be
demonstrated using the current OP-TEE client user-space.

Also, in crypto peripheral use-case we can target the symmetric crypto
use-case first which already has a concept of hardware backed
symmetric key [1]. IOW, we should be able to come up with a generic
symmetric crypto algorithm which can be supported by different crypto
accelerators using a TEE backed restricted key DMA buffer.

[1] https://www.youtube.com/watch?v=GbcpwUBFGDw

-Sumit
