Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CEBB3D9FF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 08:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1471710E371;
	Mon,  1 Sep 2025 06:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RlyJMav+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA2E10E2AC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 06:33:36 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7456b27fac1so1495508a34.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 23:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756708415; x=1757313215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d63K7XgJLStqHBkCXJov9ds+/KtdkB+0f/lWfkHrdc0=;
 b=RlyJMav+a1EnsxKfDKAQ4z9PAZNMTpeKHpZ7HzaRHUdfQhsQfHBOTLsGAd5CgQZKU9
 NArfQ1C2cypdq6F5qEBDSkeilu0aDQPy4RBRmHcYlBhNu9Kj5AZew4C4BTq1YMM0zYIw
 pyz9wJXBq8evGcs+FyZCWXuK7/i7BfGerry1p2UyPPnvxgFYBMbHStfg3MzOYGfB0sYf
 BGqHXv6KEK6XSflpBgCSUl3oFgRFGPR6w6fH6NiCEOm9a7NBEs0q529a7tastUJa3rDS
 h6QCdBnHlNFSAickMxnw7/Ne0IdkaJ9RooTnJVPSf3rBITkJbzpwmDtfu3BBxGSz/M+0
 p0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756708415; x=1757313215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d63K7XgJLStqHBkCXJov9ds+/KtdkB+0f/lWfkHrdc0=;
 b=hf5kKDRyQHQX70afTixuB4sUFkAlokkgQCG65+rSBYGaFgZJtDTzJAWuydL3g3rElu
 UtS2seN5IpQa3SIugd4tke+KpKwknuD6lNBK5yicPFLiux2LYLkMVR92udGVcCSrX7F2
 996DKC18REVwegq3U9Dme6EtBHOwDXs/m5R4TU1ERkxk6qhMg53damMCOVJWjM+DioRZ
 bzZ7FMEdfXs4R8ZYWvthCzXVW73cPwhMid7ESfOu64LrvJPgTHXtm38osW8c+NKqFnth
 LCIQgHxvSvtohnaBZeWxaCTNWMJ+/cksRVW1xZMQj4dmm4Xb8DehAvrDQTqGLjNyGE4t
 dZeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaGT/h7uNRillimNRnIHH3np416IpFcrQ7dSwp4nKtDRvkZp1A0oHZy5evK6sDqkYY+n9u2BCjDjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOy8wMtMENFvtVidxHA0W9Ze5uF6dzWe2po9muIwqN8SEJVPvH
 QRwvNXG+dtHVtt2PsXgOL86AcCUDHxoxg3a82meyPrgIE0GU+erdFayKERRXHQmKFMXK9Ejp9/p
 9DZE+fmjCQ3veU2SelOEpRSrtT+N9Gvz9Q1nmiUuC+Q==
X-Gm-Gg: ASbGnctjTLKWd1akEYvM3JN32aDKjjPNOt5eDCmoH4C70AalmBODL/lIUeg2LmoNidp
 q/EjP8hCKAGAHj5TBGO2D+1W3Y4jjRVPZl93kxSEgNZ4PZ8cllsEebPoDe+45mZwuMV3LsEwNKK
 LXtblnC21JshyR0b/Q/8pv/JZh4UXNfO5QRXaLSLsnNr9w+xh2g11/Fvv6kVXhH2ClBwsf6cqNq
 3Xk4oYRP0HCEVPBMRI=
X-Google-Smtp-Source: AGHT+IGvK8UHszhPVcTQDm4PYPeHKoM8Xc6DU6kEPwujbuVG97/aq3T0q92Sw2QRqj3+fHA/py0znAHyw/IOtESFYaE=
X-Received: by 2002:a05:6808:4a4c:10b0:437:75ea:6c6a with SMTP id
 5614622812f47-437f7db934cmr3281100b6e.45.1756708415476; Sun, 31 Aug 2025
 23:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 1 Sep 2025 08:33:24 +0200
X-Gm-Features: Ac12FXxQzc53bIvBXHa9YRffmUij0YGcmyZEnStV0BX1gqYTdbY2BHTJlmPBFDU
Message-ID: <CAHUa44Gy62JK-zsw=C92_8rybfDG98WQjkpimzvi1Z45Nu8xCA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] TEE subsystem for protected dma-buf allocations
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
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

Hi,

On Wed, Aug 13, 2025 at 8:03=E2=80=AFAM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hi,
>
> This patch set allocates the protected DMA-bufs from a DMA-heap
> instantiated from the TEE subsystem.
>
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
> protection for the memory used for the DMA-bufs.
>
> The DMA-heap uses a protected memory pool provided by the backend TEE
> driver, allowing it to choose how to allocate the protected physical
> memory.
>
> The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_F=
D
> before they can be passed as arguments when requesting services from the
> secure world.
>
> Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> Recording) have been identified so far to serve as examples of what can b=
e
> expected. The use-cases have predefined DMA-heap names,
> "protected,secure-video", "protected,trusted-ui", and
> "protected,secure-video-record". The backend driver registers protected
> memory pools for the use-cases it supports.
>
> Each use-case has its own protected memory pool since different use-cases
> require isolation from different parts of the system. A protected memory
> pool can be based on a static carveout instantiated while probing the TEE
> backend driver, or dynamically allocated from CMA (dma_alloc_pages()) and
> made protected as needed by the TEE.

All the patches in this patchset have now been reviewed, and I believe
I've addressed all comments from the reviews.
I'm adding these patches to my next branch and am aiming to get them
merged in the next merge window.

All patches but one, "dma-buf: dma-heap: export declared functions"
are within the TEE subsystem. Sumit Semwal, is it OK to take that
patch via my tree since some of the patches here depend on it?

Thanks,
Jens


>
> This can be tested on a RockPi 4B+ with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml=
 \
>         -b prototype/sdp-v11
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make all -j$(nproc)
> # Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
> # Connect a monitor to the RockPi
> # login and at the prompt:
> gst-launch-1.0 videotestsrc ! \
>         aesenc key=3D1f9423681beb9a79215820f6bda73d0f \
>                 iv=3De9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=3Dtrue=
 ! \
>         aesdec key=3D1f9423681beb9a79215820f6bda73d0f ! \
>         kmssink
>
> The aesdec module has been hacked to use an OP-TEE TA to decrypt the stre=
am
> into protected DMA-bufs which are consumed by the kmssink.
>
> The primitive QEMU tests from previous patch sets can be tested on RockPi
> in the same way using:
> xtest --sdp-basic
>
> The primitive tests are tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml=
 \
>         -b prototype/sdp-v11
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make SPMC_AT_EL=3D1 all -j$(nproc)
> make SPMC_AT_EL=3D1 run-only
> # login and at the prompt:
> xtest --sdp-basic
>
> The SPMC_AT_EL=3D1 parameter configures the build with FF-A and an SPMC a=
t
> S-EL1 inside OP-TEE. The parameter can be changed to SPMC_AT_EL=3Dn to te=
st
> without FF-A using the original SMC ABI instead. Please remember to do
> %make arm-tf-clean
> for TF-A to be rebuilt properly using the new configuration.
>
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies required to build the above.
>
> The primitive tests are pretty basic, mostly checking that a Trusted
> Application in the secure world can access and manipulate the memory. The=
re
> are also some negative tests for out of bounds buffers, etc.
>
> Thanks,
> Jens
>
> Changes since V10:
> * Changed the new ABI OPTEE_MSG_CMD_GET_PROTMEM_CONFIG to report a list
>   of u32 memory attributes instead of u16 endpoints to make room for both
>   endpoint and access permissions in each entry.
> * In "tee: new ioctl to a register tee_shm from a dmabuf file descriptor"=
,
>   remove the unused path for DMA-bufs allocated by other means than the o=
n
>   in the TEE SS.
> * In "tee: implement protected DMA-heap", handle unloading of the
>   backend driver module implementing the heap. The heap is reference
>   counted and also calls tee_device_get() to guarantee that the module
>   remains available while the heap is instantiated.
> * In "optee: support protected memory allocation", use
>   dma_coerce_mask_and_coherent() instead of open-coding the function.
> * Added Sumit's R-B to
>   - "optee: smc abi: dynamic protected memory allocation"
>   - "optee: FF-A: dynamic protected memory allocation"
>   - "optee: support protected memory allocation"
>   - "tee: implement protected DMA-heap"
>   - "dma-buf: dma-heap: export declared functions"
>
> Changes since V9:
> * Adding Sumit's R-B to "optee: sync secure world ABI headers"
> * Update commit message as requested for "dma-buf: dma-heap: export
>   declared functions".
> * In "tee: implement protected DMA-heap":
>   - add the hidden config option TEE_DMABUF_HEAPS to tell if the TEE
>     subsystem can support DMA heaps
>   - add a pfn_valid() to check that the passed physical address can be
>     used by __pfn_to_page() and friends
>   - remove the memremap() call, the caller is should do that instead if
>     needed
> * In "tee: add tee_shm_alloc_dma_mem()" guard the calls to
>   dma_alloc_pages() and dma_free_pages() with TEE_DMABUF_HEAPS to avoid
>   linking errors in some configurations
> * In "optee: support protected memory allocation":
>   - add the hidden config option OPTEE_STATIC_PROTMEM_POOL to tell if the
>     driver can support a static protected memory pool
>   - optee_protmem_pool_init() is slightly refactored to make the patches
>     that follow easier
>   - Call devm_memremap() before calling tee_protmem_static_pool_alloc()
>
> Changes since V8:
> * Using dma_alloc_pages() instead of cma_alloc() so the direct dependency=
 on
>   CMA can be removed together with the patches
>   "cma: export cma_alloc() and cma_release()" and
>   "dma-contiguous: export dma_contiguous_default_area". The patch
> * Renaming the patch "tee: add tee_shm_alloc_cma_phys_mem()" to
>   "tee: add tee_shm_alloc_dma_mem()"
> * Setting DMA mask for the OP-TEE TEE device based on input from the secu=
re
>   world instead of relying on the parent device so following patches are
>   removed: "tee: tee_device_alloc(): copy dma_mask from parent device" an=
d
>   "optee: pass parent device to tee_device_alloc()".
> * Adding Sumit Garg's R-B to "tee: refactor params_from_user()"
> * In the patch "tee: implement protected DMA-heap", map the physical memo=
ry
>   passed to tee_protmem_static_pool_alloc().
>
> Changes since V7:
> * Adding "dma-buf: dma-heap: export declared functions",
>   "cma: export cma_alloc() and cma_release()", and
>   "dma-contiguous: export dma_contiguous_default_area" to export the symb=
ols
>   needed to keep the TEE subsystem as a load module.
> * Removing CONFIG_TEE_DMABUF_HEAP and CONFIG_TEE_CMA since they aren't
>   needed any longer.
> * Addressing review comments in "optee: sync secure world ABI headers"
> * Better align protected memory pool initialization between the smc-abi a=
nd
>   ffa-abi parts of the optee driver.
> * Removing the patch "optee: account for direction while converting param=
eters"
>
> Changes since V6:
> * Restricted memory is now known as protected memory since to use the sam=
e
>   term as https://docs.vulkan.org/guide/latest/protected.html. Update all
>   patches to consistently use protected memory.
> * In "tee: implement protected DMA-heap" add the hidden config option
>   TEE_DMABUF_HEAP to tell if the DMABUF_HEAPS functions are available
>   for the TEE subsystem
> * Adding "tee: refactor params_from_user()", broken out from the patch
>   "tee: new ioctl to a register tee_shm from a dmabuf file descriptor"
> * For "tee: new ioctl to a register tee_shm from a dmabuf file descriptor=
":
>   - Update commit message to mention protected memory
>   - Remove and open code tee_shm_get_parent_shm() in param_from_user_memr=
ef()
> * In "tee: add tee_shm_alloc_cma_phys_mem" add the hidden config option
>   TEE_CMA to tell if the CMA functions are available for the TEE subsyste=
m
> * For "tee: tee_device_alloc(): copy dma_mask from parent device" and
>   "optee: pass parent device to tee_device_alloc", added
>   Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
>
> Changes since V5:
> * Removing "tee: add restricted memory allocation" and
>   "tee: add TEE_IOC_RSTMEM_FD_INFO"
> * Adding "tee: implement restricted DMA-heap",
>   "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
>   "tee: add tee_shm_alloc_cma_phys_mem()",
>   "optee: pass parent device to tee_device_alloc()", and
>   "tee: tee_device_alloc(): copy dma_mask from parent device"
> * The two TEE driver OPs "rstmem_alloc()" and "rstmem_free()" are replace=
d
>   with a struct tee_rstmem_pool abstraction.
> * Replaced the the TEE_IOC_RSTMEM_ALLOC user space API with the DMA-heap =
API
>
> Changes since V4:
> * Adding the patch "tee: add TEE_IOC_RSTMEM_FD_INFO" needed by the
>   GStreamer demo
> * Removing the dummy CPU access and mmap functions from the dma_buf_ops
> * Fixing a compile error in "optee: FF-A: dynamic restricted memory alloc=
ation"
>   reported by kernel test robot <lkp@intel.com>
>
> Changes since V3:
> * Make the use_case and flags field in struct tee_shm u32's instead of
>   u16's
> * Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
> * Import namespace DMA_BUF in module tee, reported by lkp@intel.com
> * Added a note in the commit message for "optee: account for direction
>   while converting parameters" why it's needed
> * Factor out dynamic restricted memory allocation from
>   "optee: support restricted memory allocation" into two new commits
>   "optee: FF-A: dynamic restricted memory allocation" and
>   "optee: smc abi: dynamic restricted memory allocation"
> * Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
>   restricted memory allocate if CMA isn't configured
>
> Changes since the V2 RFC:
> * Based on v6.12
> * Replaced the flags for SVP and Trusted UID memory with a u32 field with
>   unique id for each use case
> * Added dynamic allocation of restricted memory pools
> * Added OP-TEE ABI both with and without FF-A for dynamic restricted memo=
ry
> * Added support for FF-A with FFA_LEND
>
> Changes since the V1 RFC:
> * Based on v6.11
> * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALL=
OC
>
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf he=
ap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
>
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>
> Jens Wiklander (8):
>   optee: sync secure world ABI headers
>   dma-buf: dma-heap: export declared functions
>   tee: implement protected DMA-heap
>   tee: refactor params_from_user()
>   tee: add tee_shm_alloc_dma_mem()
>   optee: support protected memory allocation
>   optee: FF-A: dynamic protected memory allocation
>   optee: smc abi: dynamic protected memory allocation
>
>  drivers/dma-buf/dma-heap.c        |   3 +
>  drivers/tee/Kconfig               |   5 +
>  drivers/tee/Makefile              |   1 +
>  drivers/tee/optee/Kconfig         |   5 +
>  drivers/tee/optee/Makefile        |   1 +
>  drivers/tee/optee/core.c          |   7 +
>  drivers/tee/optee/ffa_abi.c       | 146 ++++++++-
>  drivers/tee/optee/optee_ffa.h     |  27 +-
>  drivers/tee/optee/optee_msg.h     |  84 ++++-
>  drivers/tee/optee/optee_private.h |  15 +-
>  drivers/tee/optee/optee_smc.h     |  37 ++-
>  drivers/tee/optee/protmem.c       | 335 ++++++++++++++++++++
>  drivers/tee/optee/smc_abi.c       | 141 ++++++++-
>  drivers/tee/tee_core.c            | 157 +++++++---
>  drivers/tee/tee_heap.c            | 500 ++++++++++++++++++++++++++++++
>  drivers/tee/tee_private.h         |  14 +
>  drivers/tee/tee_shm.c             | 157 +++++++++-
>  include/linux/tee_core.h          |  59 ++++
>  include/linux/tee_drv.h           |  10 +
>  include/uapi/linux/tee.h          |  31 ++
>  20 files changed, 1668 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/tee/optee/protmem.c
>  create mode 100644 drivers/tee/tee_heap.c
>
>
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> --
> 2.43.0
>
