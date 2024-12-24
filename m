Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A80D9FB9E2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 07:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8081B10E170;
	Tue, 24 Dec 2024 06:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n3Kirano";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2887310E170
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 06:36:31 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4afdf8520c2so1307385137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 22:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735022130; x=1735626930; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Zq9pXWdMCIiKRm78Fz0nKGiQDNXa8eZUXqOAkcmGfs=;
 b=n3Kiranokpd35pnJH4Y5ooDiBkiBTiXuKazVo/8wvafJkvmW7eKVqKYOSovwByyR12
 bFNJuUXwTHZKCL5n+UGbVcDQirJxRcpLjwY/MIYsAMUDTghwhYC84CK9f4W2ha3XuJR+
 VrnaUNyWMLaNVEiFJoSP77bEPJIVbyJ2zaNHaMS+hDIeKx+NtDZYGy2cIGg1S2PT2tnD
 EjPDOrNWvApmu15UTBtBgqXX4Jg/oX9rKLMNLOIif55og35Eoh9xWdeAn766EA7JV5N3
 /MZPySI2SFiPWdPMajyUAwxSznb9NK7bUMBVFFmJ27SrETO69xIoEEIeCtcrNQIkm2tX
 5fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735022130; x=1735626930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Zq9pXWdMCIiKRm78Fz0nKGiQDNXa8eZUXqOAkcmGfs=;
 b=XLLi90H1BGM2OINoh9N6afF1uTPzcn7Ll3xDO6vAX3uthhKiVKYXr2BoFXF0jLDhJk
 EQAbsZu7a6+xaSD3AJ+B+QnafOpAzNkN36nfBj8vMKhluPNrjr0jSr8O+LBNXlC6HmCw
 HakLuUfT0m2isy1YZL/hHSh/pZsi4btNxSgjokJhs2iI8e8v9G67GAlIa/ZGEpGACx4b
 MNHdWtV4naC68CGZdXXNhcEcnIIgOYune2KJ5+KEhsioNZBUIRGOIRyi04ugzTE5rRqB
 XwA9NPj4TBaiVR5rGgUZrZdai2bMTayuqv3s86jDsjxA0kzQcI5l97wknpi+YQSUyc9M
 EXBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBNw+iKI19h5poLB8JrKduUfi/Um5ConYil9uH/CtPIiujPQgfeYza9GaY2lB36gOBR3ReTNYsxZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyynzioEUc6PQRuMD+oeMtbauw5VX3WWzertZHmMEh7Ux7GtqAA
 UOQ+3uiZX3eyYvv0dNGH9Zw2PzLltUi0TzVHbsOjdxrZwQyWU/vPOepEodFIUwiJUM0Ftso4SbJ
 TKYSd6Q3uFMkGPeFJTYr+I4raKtWIVTFjfXnWjA==
X-Gm-Gg: ASbGnctE14WhabMJ9eo6WmsYrkfhlmCqrd9mF2dkcNyt9JMGZak5WEUGC8QtpFJ4J+5
 sVB7d/ipm1TOaSGLDvbeO7SG0F0ZC5bdqQS9yYQg=
X-Google-Smtp-Source: AGHT+IHBGEiDjz6Xi6bSRilLnhrvDUnZnjwDfKo+IRnWMREtwJZQeqlx3d2SsFhIQvcJWIOsMS/OGGYp9Fswz+6EXrA=
X-Received: by 2002:a05:6102:1629:b0:4b2:5d16:f75 with SMTP id
 ada2fe7eead31-4b2cc31c5e0mr12719925137.4.1735022130097; Mon, 23 Dec 2024
 22:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
In-Reply-To: <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 24 Dec 2024 12:05:19 +0530
Message-ID: <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
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

Hi Simona,

On Wed, 18 Dec 2024 at 16:36, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> > Hi,
> >
> > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> >
> > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > restrictions for the memory used for the DMA-bufs.
> >
> > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > how to allocate the restricted physical memory.
> >
> > TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> > a use-case parameter. This is used by the backend TEE driver to decide on
> > allocation policy and which devices should be able to access the memory.
> >
> > Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> > Recording) has been identified so far to serve as examples of what can be
> > expected. More use-cases can be added in userspace ABI, but it's up to the
> > backend TEE drivers to provide the implementation.
> >
> > Each use-case has it's own restricted memory pool since different use-cases
> > requires isolation from different parts of the system. A restricted memory
> > pool can be based on a static carveout instantiated while probing the TEE
> > backend driver, or dynamically allocated from CMA and made restricted as
> > needed by the TEE.
> >
> > This can be tested on QEMU with the following steps:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> >         -b prototype/sdp-v4
> > repo sync -j8
> > cd build
> > make toolchains -j$(nproc)
> > make SPMC_AT_EL=1 all -j$(nproc)
> > make SPMC_AT_EL=1 run-only
> > # login and at the prompt:
> > xtest --sdp-basic
> >
> > The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> > S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> > without FF-A using the original SMC ABI instead. Please remember to do
> > %rm -rf ../trusted-firmware-a/build/qemu
> > for TF-A to be rebuilt properly using the new configuration.
> >
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > list dependencies needed to build the above.
> >
> > The tests are pretty basic, mostly checking that a Trusted Application in
> > the secure world can access and manipulate the memory. There are also some
> > negative tests for out of bounds buffers etc.
>
> I think I've dropped this on earlier encrypted dma-buf discussions for
> TEE, but can't find one right now ...

Thanks for raising this query.

>
> Do we have some open source userspace for this? To my knowledge we have
> two implementations of encrypted/content protected dma-buf in upstream
> right now in the amd and intel gpu drivers, and unless I'm mistaken they
> both have some minimal userspace supporting EXT_protected_textures:

First of all to clarify the support Jens is adding here for allocating
restricted shared memory allocation in TEE subsystem is meant to be
generic and not specific to only secure media pipeline use-case. Then
here we not only have open source test applications but rather open
source firmware too (OP-TEE as a Trusted OS) [1] supporting this as a
core feature where we maintain a stable and extensible ABI among the
kernel and the OP-TEE core.

Restricted memory is a feature enforced by hardware specific firewalls
where a particular TEE implementation governs which particular block
of memory is accessible to a particular peripheral or a CPU running in
a higher privileged mode than the Linux kernel. There can be numeric
use-cases surrounding that as follows:

- Secure media pipeline where the contents gets decrypted and stored
in a restricted buffer which are then accessible only to media display
pipeline peripherals.
- Trusted user interface where a peripheral takes input from the user
and stores it in a restricted buffer which then is accessible to TEE
implementation only.
- Another possible use-case can be for the TEE implementation to store
key material in a restricted buffer which is only accessible to the
hardware crypto accelerator.

I am sure there will be more use-cases related to this feature but
those will only be possible once we provide a stable and extensible
restricted memory interface among the Linux user-space and the secure
world user-space (normally referred to as Trusted Applications).

[1] https://github.com/OP-TEE/optee_os/pull/7159

>
> https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt
>
> It's not great, but it does just barely clear the bar in my opinion. I
> guess something in gstreamer or similar video pipeline framework would
> also do the job.
>
> Especially with the context of the uapi discussion in the v1/RFC thread I
> think we need more than a bare-bones testcase to make sure this works in
> actual use.

Currently the TEE subsystem already supports a stable ABI for shared
memory allocator among Linux user-space and secure world user-space
here [2]. And the stable ABI for restricted memory is also along the
same lines meant to be a vendor neutral abstraction for the user-space
access. The current test cases not only test the interface but also
perform regression tests too.

I am also in favour of end to end open source use-cases. But I fear
without progressing in a step wise manner as with this proposal we
would rather force developers to upstream all the software pieces in
one go which will be kind of a chicken and egg situation. I am sure
once this feature lands Mediatek folks will be interested to port
their secure video playback patchset [3] on top of it. Similarly other
silicon vendors like NXP, Qcom etc. will be motivated to do the same.

[2] https://docs.kernel.org/userspace-api/tee.html
[3] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

-Sumit

>
> Cheers, Sima
>
> >
> > Thanks,
> > Jens
> >
> > Changes since V3:
> > * Make the use_case and flags field in struct tee_shm u32's instead of
> >   u16's
> > * Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
> > * Import namespace DMA_BUF in module tee, reported by lkp@intel.com
> > * Added a note in the commit message for "optee: account for direction
> >   while converting parameters" why it's needed
> > * Factor out dynamic restricted memory allocation from
> >   "optee: support restricted memory allocation" into two new commits
> >   "optee: FF-A: dynamic restricted memory allocation" and
> >   "optee: smc abi: dynamic restricted memory allocation"
> > * Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
> >   restricted memory allocate if CMA isn't configured
> >
> > Changes since the V2 RFC:
> > * Based on v6.12
> > * Replaced the flags for SVP and Trusted UID memory with a u32 field with
> >   unique id for each use case
> > * Added dynamic allocation of restricted memory pools
> > * Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
> > * Added support for FF-A with FFA_LEND
> >
> > Changes since the V1 RFC:
> > * Based on v6.11
> > * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC
> >
> > Changes since Olivier's post [2]:
> > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> >   the generic restricted heap
> > * Simplifications and cleanup
> > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> >   support"
> > * Replaced the word "secure" with "restricted" where applicable
> >
> > Jens Wiklander (6):
> >   tee: add restricted memory allocation
> >   optee: account for direction while converting parameters
> >   optee: sync secure world ABI headers
> >   optee: support restricted memory allocation
> >   optee: FF-A: dynamic restricted memory allocation
> >   optee: smc abi: dynamic restricted memory allocation
> >
> >  drivers/tee/Makefile              |   1 +
> >  drivers/tee/optee/Makefile        |   1 +
> >  drivers/tee/optee/call.c          |  10 +-
> >  drivers/tee/optee/core.c          |   1 +
> >  drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
> >  drivers/tee/optee/optee_ffa.h     |  27 ++-
> >  drivers/tee/optee/optee_msg.h     |  65 ++++-
> >  drivers/tee/optee/optee_private.h |  75 ++++--
> >  drivers/tee/optee/optee_smc.h     |  71 +++++-
> >  drivers/tee/optee/rpc.c           |  31 ++-
> >  drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
> >  drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
> >  drivers/tee/tee_core.c            |  38 ++-
> >  drivers/tee/tee_private.h         |   2 +
> >  drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
> >  drivers/tee/tee_shm.c             |   2 +
> >  drivers/tee/tee_shm_pool.c        |  69 +++++-
> >  include/linux/tee_core.h          |  15 ++
> >  include/linux/tee_drv.h           |   2 +
> >  include/uapi/linux/tee.h          |  44 +++-
> >  20 files changed, 1358 insertions(+), 76 deletions(-)
> >  create mode 100644 drivers/tee/optee/rstmem.c
> >  create mode 100644 drivers/tee/tee_rstmem.c
> >
> >
> > base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> > --
> > 2.43.0
> >
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
