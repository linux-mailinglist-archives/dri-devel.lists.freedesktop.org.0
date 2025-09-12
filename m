Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126EBB54928
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B9710EBF4;
	Fri, 12 Sep 2025 10:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Id8F2NyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E41310EBF4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:16:50 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-61e73b1544fso692064eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757672209; x=1758277009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=np92MCLMIpSqqXYurAjsStWUduzDAztZdMghYtL+tng=;
 b=Id8F2NyPMg13Sp2u4Y9W4biwqEmIewb8FOKYTtZSibdaxwqZkKhH4PuFGAjd+tV3Cx
 DFs9AiDyD8xEy75UVbuaPJ1NqkgRaPoGKqMawTm2Vq+2EmC29R6N6cX4d49zwBOjMmX5
 QwSbBArqE/ykoWIhNzyPpUZVx4thYTYeapTy4fQNpQCy2vW4M/pptHIgoA8LPvv0EHUg
 fHTifbc3Hwnp4xJIwQthB4uk7UuTbAPq5Ro00CB6gnMGHJ7UW4CklDqtvm0EVQ6p7jzx
 S/MT0scz/QoFLuol0X0Vm8VqCgEdnYgwerP2xCFJvY4d89lsSZAS/FiSqg1+sCCiXEWg
 rVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757672209; x=1758277009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=np92MCLMIpSqqXYurAjsStWUduzDAztZdMghYtL+tng=;
 b=cahQT3LD7hM0Del6TUL/NhckJ+mhoVDR6nNpsTxrbsOWv1yKZvk/icPAdxU9Q4SnVw
 D1nwP9zYjI0/0VtQZFhzmC8YC3B9R1TLHfjxRq5ZohLyGsuoccvB5yO18ujI/12iQ8Fm
 ayKWKaK33dg2gnPe4ZG4xDS3aFM1wLxfxYx6fivF4n6z0wqaItWbd8Wg7e0GdVU8xo7t
 yQjlNHXdZt3FaE6PTxwhP5utXKMDNVvYQ1J0T6LZkg37/CwV8MjWxymvwxIqNCYThWla
 Oq2UVLdPBAgtPr0s/lTDz1XusFgmXhvUw0q+CrGiPLBVzvcB25rA7gZeLUKYQ0Z3e09q
 Hp7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcVOmUULQruYr8EPXitnWvMsZzWpqwjt+prn41Hu3FmnxS8C+i9lNpv2Y9Np5shHh8stUxFPdidaw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0m8MjbCQbpExPpDebY41nQCS1kHzgPhBP6YBiAwbzii+LLgjD
 wZPqyzN65ZTGJ9x/RgSV+DyXWZvj6slbEdEVMSEDLPLT/O1LdY+cFZR7oFtmaRi96iE6gGNzUl+
 4CmocMIh16pMibbhtFGK2QtGnFczowttd0+dhumvMWg==
X-Gm-Gg: ASbGncv1J+JtFLTzClusvtPCpNdxzG2syQTBAi9RZjiqYp5fmYDR6jDJUjsaBwTYD58
 rFMTSbPPHWXv6mH0Xdm+j3E3G9Ri8q6ruVHYQE7gm1bfjE/guPmtccYJeMuhcHWp/tZZy8g0PeX
 dZd16rcAtStjMzdDCpYRlMev+tqjivtL1KH4wpTm7dB7JVksgPiOTsvuW628o3YnpQQJObVAv3x
 O0U6hvFzk3zT2fbFrg=
X-Google-Smtp-Source: AGHT+IGS5N1UmLdsuE07lZ/S7H/uqY8ApRRdv9LIa7w7dmIh048yBoif8PGNnuNQoEwhkyX8AMx/1GhdEocCaUPJzjc=
X-Received: by 2002:a05:6820:1508:b0:621:860f:fe6f with SMTP id
 006d021491bc7-621bed6ed43mr1199525eaf.6.1757672209301; Fri, 12 Sep 2025
 03:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 12 Sep 2025 12:16:37 +0200
X-Gm-Features: Ac12FXxeSzrBj0Om7A_DbdAZW0T_dZoOlSetiIHXJL2m-uuUM4A3nBgvnyjvK2w
Message-ID: <CAHUa44H-CrwawWzMMGTG6qndK7iYnHK57ONYbJqMjOE=eiAsqQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/9] TEE subsystem for protected dma-buf allocations
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
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

On Thu, Sep 11, 2025 at 3:50=E2=80=AFPM Jens Wiklander
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

After the small update from v11, I'm picking up this and aiming for
the next merge window.

Thanks,
Jens

>
> This can be tested on a RockPi 4B+ with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml=
 \
>         -b prototype/sdp-v12
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
>         -b prototype/sdp-v12
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
> Changes since V11:
> * In "dma-buf: dma-heap: export declared functions":
>   - use EXPORT_SYMBOL_NS_GPL()
>   - Added TJ's R-B and Sumit's Ack
> * In "tee: implement protected DMA-heap", import the namespaces "DMA_BUF"
>   and "DMA_BUF_HEAP" as needed.
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
>  drivers/dma-buf/dma-heap.c        |   4 +
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
>  drivers/tee/tee_core.c            | 158 +++++++---
>  drivers/tee/tee_heap.c            | 500 ++++++++++++++++++++++++++++++
>  drivers/tee/tee_private.h         |  14 +
>  drivers/tee/tee_shm.c             | 157 +++++++++-
>  include/linux/tee_core.h          |  59 ++++
>  include/linux/tee_drv.h           |  10 +
>  include/uapi/linux/tee.h          |  31 ++
>  20 files changed, 1670 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/tee/optee/protmem.c
>  create mode 100644 drivers/tee/tee_heap.c
>
>
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> --
> 2.43.0
>
