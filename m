Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299DA062C4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58D710E905;
	Wed,  8 Jan 2025 16:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="N+ODcAwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA3210E905
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:58:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3862b364538so676619f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736355473; x=1736960273; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tPGYymga8OEn8r1EYBnLXSbNhvYtLaDM3m4Rxn8+bY=;
 b=N+ODcAwqK2IGq6l370K/Tq/anEZlSg4TXB2txbUw1uvTH+7qITZJSsFQRQOGuAb/Vb
 8XHR9+4QfRJlfAa1PlU2gDCyGIYZ+EWgjnzWD4Gojs7AyQGRrAkr215layP/zux846uP
 FMAI9+cPtYbVrwg5i59xgZQ329ygMQscVQE/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736355473; x=1736960273;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0tPGYymga8OEn8r1EYBnLXSbNhvYtLaDM3m4Rxn8+bY=;
 b=fmOpT3YzSkDQLvcLflX/4zHcnfu5KkTupivhFmqO7ezoYwlndCcqRDbcW/bqHFX0Ye
 7m8KNMDOHsMzfyqYmCe/m6hqeQgiYhlD7N9GCrTSbL3grU+vdnUXlALI8p/leDTD9Iff
 gwFa6BP/tSu2xRdbOq9Bi1U6F2fjTM81bHj9mWD5tXtczQynHzF/FGusoMo8Mv3qSYYM
 5bx1oo/l7xR+39U3Aq01nj64dg10nnQn26oB5LRxI3eX32gtZBi4pyoK1GeAzCwph6Hx
 CjGjPUP9dGKce6s826ese5szwlvcI7TI0hWhJ/JFlsBNDJQsWVMl70eBTrPVkmdUGlSY
 8Hcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9QkUXIBL9KZOcgiEfxClsrNR1Km0aGDWvtY3FajWAMlRxntumTeG5GByT0Pfsd07pjtPJR+L+cTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqC0REuDC3bjsdtLAFBwUZgDJdDhPXgb1Mu8sheESC5Cs8y91E
 wiVOEOtFt8GVY2z7u4IGRG/25eKejuBksVr9Bm/FrKuhgt9rJfkDxWrdEc00xS4=
X-Gm-Gg: ASbGncs9d51yRPQ677I2SF7QQjgxmb4GbeUIO0cO4N7liThUehyLbEit7AkeLXexPgr
 ODs3WGb7cb9WlJYmNr4X/bU2QOXQKnT/5qrzB+AjoZVK0L+zdacw5qCUaJhoERRDswnLENgu0yF
 WbCoolAj9z4IRo7sawcuOTtLm4NKTKYT6ugl5Gpxa2OC5QVF7/scxlYi6k/V++KQCmZMugfv/qe
 FtujBQV6IDJTKNA52tbWkBI9S4El86CWJCbakXflBVH675b6PzPag4oSDOyTfdCbjUl
X-Google-Smtp-Source: AGHT+IFKluDkp2P67lSFAn3UYumWfOOrcVKXJ4s1cpAviNR0WHIQ3RR5NqVHBYruKqlZTt7rmVNo3Q==
X-Received: by 2002:a05:6000:1fa5:b0:38a:88ac:ee69 with SMTP id
 ffacd0b85a97d-38a8b0d5bb4mr18015f8f.13.1736355473070; 
 Wed, 08 Jan 2025 08:57:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832e69sm52800921f8f.35.2025.01.08.08.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:57:52 -0800 (PST)
Date: Wed, 8 Jan 2025 17:57:50 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
Mail-Followup-To: Sumit Garg <sumit.garg@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> Hi Simona,
> 
> On Wed, 18 Dec 2024 at 16:36, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> >
> > On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> > > Hi,
> > >
> > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > >
> > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > restrictions for the memory used for the DMA-bufs.
> > >
> > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > how to allocate the restricted physical memory.
> > >
> > > TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> > > a use-case parameter. This is used by the backend TEE driver to decide on
> > > allocation policy and which devices should be able to access the memory.
> > >
> > > Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> > > Recording) has been identified so far to serve as examples of what can be
> > > expected. More use-cases can be added in userspace ABI, but it's up to the
> > > backend TEE drivers to provide the implementation.
> > >
> > > Each use-case has it's own restricted memory pool since different use-cases
> > > requires isolation from different parts of the system. A restricted memory
> > > pool can be based on a static carveout instantiated while probing the TEE
> > > backend driver, or dynamically allocated from CMA and made restricted as
> > > needed by the TEE.
> > >
> > > This can be tested on QEMU with the following steps:
> > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > >         -b prototype/sdp-v4
> > > repo sync -j8
> > > cd build
> > > make toolchains -j$(nproc)
> > > make SPMC_AT_EL=1 all -j$(nproc)
> > > make SPMC_AT_EL=1 run-only
> > > # login and at the prompt:
> > > xtest --sdp-basic
> > >
> > > The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> > > S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> > > without FF-A using the original SMC ABI instead. Please remember to do
> > > %rm -rf ../trusted-firmware-a/build/qemu
> > > for TF-A to be rebuilt properly using the new configuration.
> > >
> > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > list dependencies needed to build the above.
> > >
> > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > the secure world can access and manipulate the memory. There are also some
> > > negative tests for out of bounds buffers etc.
> >
> > I think I've dropped this on earlier encrypted dma-buf discussions for
> > TEE, but can't find one right now ...
> 
> Thanks for raising this query.
> 
> >
> > Do we have some open source userspace for this? To my knowledge we have
> > two implementations of encrypted/content protected dma-buf in upstream
> > right now in the amd and intel gpu drivers, and unless I'm mistaken they
> > both have some minimal userspace supporting EXT_protected_textures:
> 
> First of all to clarify the support Jens is adding here for allocating
> restricted shared memory allocation in TEE subsystem is meant to be
> generic and not specific to only secure media pipeline use-case. Then
> here we not only have open source test applications but rather open
> source firmware too (OP-TEE as a Trusted OS) [1] supporting this as a
> core feature where we maintain a stable and extensible ABI among the
> kernel and the OP-TEE core.
> 
> Restricted memory is a feature enforced by hardware specific firewalls
> where a particular TEE implementation governs which particular block
> of memory is accessible to a particular peripheral or a CPU running in
> a higher privileged mode than the Linux kernel. There can be numeric
> use-cases surrounding that as follows:
> 
> - Secure media pipeline where the contents gets decrypted and stored
> in a restricted buffer which are then accessible only to media display
> pipeline peripherals.
> - Trusted user interface where a peripheral takes input from the user
> and stores it in a restricted buffer which then is accessible to TEE
> implementation only.
> - Another possible use-case can be for the TEE implementation to store
> key material in a restricted buffer which is only accessible to the
> hardware crypto accelerator.
> 
> I am sure there will be more use-cases related to this feature but
> those will only be possible once we provide a stable and extensible
> restricted memory interface among the Linux user-space and the secure
> world user-space (normally referred to as Trusted Applications).
> 
> [1] https://github.com/OP-TEE/optee_os/pull/7159
> 
> >
> > https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt
> >
> > It's not great, but it does just barely clear the bar in my opinion. I
> > guess something in gstreamer or similar video pipeline framework would
> > also do the job.
> >
> > Especially with the context of the uapi discussion in the v1/RFC thread I
> > think we need more than a bare-bones testcase to make sure this works in
> > actual use.
> 
> Currently the TEE subsystem already supports a stable ABI for shared
> memory allocator among Linux user-space and secure world user-space
> here [2]. And the stable ABI for restricted memory is also along the
> same lines meant to be a vendor neutral abstraction for the user-space
> access. The current test cases not only test the interface but also
> perform regression tests too.
> 
> I am also in favour of end to end open source use-cases. But I fear
> without progressing in a step wise manner as with this proposal we
> would rather force developers to upstream all the software pieces in
> one go which will be kind of a chicken and egg situation. I am sure
> once this feature lands Mediatek folks will be interested to port
> their secure video playback patchset [3] on top of it. Similarly other
> silicon vendors like NXP, Qcom etc. will be motivated to do the same.
> 
> [2] https://docs.kernel.org/userspace-api/tee.html
> [3] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

We get entire opengl/vulkan driver stacks ready before we merge new drm
drivers, I really don't think this is too hard from a technical pov. And I
think the mediatek patches had the same issue of lacking userspace for it,
so that's not moving things forward.
-Sima

> 
> -Sumit
> 
> >
> > Cheers, Sima
> >
> > >
> > > Thanks,
> > > Jens
> > >
> > > Changes since V3:
> > > * Make the use_case and flags field in struct tee_shm u32's instead of
> > >   u16's
> > > * Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
> > > * Import namespace DMA_BUF in module tee, reported by lkp@intel.com
> > > * Added a note in the commit message for "optee: account for direction
> > >   while converting parameters" why it's needed
> > > * Factor out dynamic restricted memory allocation from
> > >   "optee: support restricted memory allocation" into two new commits
> > >   "optee: FF-A: dynamic restricted memory allocation" and
> > >   "optee: smc abi: dynamic restricted memory allocation"
> > > * Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
> > >   restricted memory allocate if CMA isn't configured
> > >
> > > Changes since the V2 RFC:
> > > * Based on v6.12
> > > * Replaced the flags for SVP and Trusted UID memory with a u32 field with
> > >   unique id for each use case
> > > * Added dynamic allocation of restricted memory pools
> > > * Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
> > > * Added support for FF-A with FFA_LEND
> > >
> > > Changes since the V1 RFC:
> > > * Based on v6.11
> > > * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC
> > >
> > > Changes since Olivier's post [2]:
> > > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> > >   the generic restricted heap
> > > * Simplifications and cleanup
> > > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> > >   support"
> > > * Replaced the word "secure" with "restricted" where applicable
> > >
> > > Jens Wiklander (6):
> > >   tee: add restricted memory allocation
> > >   optee: account for direction while converting parameters
> > >   optee: sync secure world ABI headers
> > >   optee: support restricted memory allocation
> > >   optee: FF-A: dynamic restricted memory allocation
> > >   optee: smc abi: dynamic restricted memory allocation
> > >
> > >  drivers/tee/Makefile              |   1 +
> > >  drivers/tee/optee/Makefile        |   1 +
> > >  drivers/tee/optee/call.c          |  10 +-
> > >  drivers/tee/optee/core.c          |   1 +
> > >  drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
> > >  drivers/tee/optee/optee_ffa.h     |  27 ++-
> > >  drivers/tee/optee/optee_msg.h     |  65 ++++-
> > >  drivers/tee/optee/optee_private.h |  75 ++++--
> > >  drivers/tee/optee/optee_smc.h     |  71 +++++-
> > >  drivers/tee/optee/rpc.c           |  31 ++-
> > >  drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
> > >  drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
> > >  drivers/tee/tee_core.c            |  38 ++-
> > >  drivers/tee/tee_private.h         |   2 +
> > >  drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
> > >  drivers/tee/tee_shm.c             |   2 +
> > >  drivers/tee/tee_shm_pool.c        |  69 +++++-
> > >  include/linux/tee_core.h          |  15 ++
> > >  include/linux/tee_drv.h           |   2 +
> > >  include/uapi/linux/tee.h          |  44 +++-
> > >  20 files changed, 1358 insertions(+), 76 deletions(-)
> > >  create mode 100644 drivers/tee/optee/rstmem.c
> > >  create mode 100644 drivers/tee/tee_rstmem.c
> > >
> > >
> > > base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
