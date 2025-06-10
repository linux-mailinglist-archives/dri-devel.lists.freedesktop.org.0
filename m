Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB8AD389C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827D910E0B5;
	Tue, 10 Jun 2025 13:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="auLl8yy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB92910E0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:16:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-606c5c9438fso10323415a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749561369; x=1750166169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ri4++88KyCAFFBsQpRdzKdsThABD6WsDtwqnK7XpHl8=;
 b=auLl8yy/6KwPnU5uqaF1oRrlRsZ7YfjagSc8j+kzSEw0XF4sAZB9vC/KBpYu3wirpG
 owAGX7VRnG5xLUv3TbUaoPD2qiHCS8B0/m0RgANVKp1XEw1ke770c69N2ngDav96eX4L
 cfruOigJf10QEQTQmWWgWoqBN2yKjxwIYdPxV4oltNgSQaX8/DiWs4PZ1mxdIPaHQgZq
 uvFSAyqLr3CRGMgJ7OrWIkVmx/OR8x//0VON9u6XimSUHQ6IrhUZt4KZehHxj97iME+2
 /DRQFuCT0RiL0xsNPinf/L8rxdI3VI7IgGMG8CENpm7tDREyL1JmxUP3KneOBEYYjlgU
 sFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561369; x=1750166169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ri4++88KyCAFFBsQpRdzKdsThABD6WsDtwqnK7XpHl8=;
 b=RbAv3D0S8v/LQcKfvP7dPeJOKaRGj8IC2QajBheOzo77Y095kLOh+3qEzu0kmxu5hR
 1nm36NuSolcL4S9u8zwYM/LWGq6uKxUYgM/qkSirWtes9qT6XKw7NCBs8Q1maJJTNQni
 /JOcg6AzcwrzF7w+uRcLBUOrHiYN5u2sskZEdETsi6EgqlT+eS27944fKNraEagsoh+y
 RuiLeTWw15ED6aShAJCB1i7gMZ2nBFEQ0ZpjhXidWxYlSyOm9+QZPO/2MVLwcHUcfs2b
 StEE9/L8HXwssmFbNdLDjBeH8qdAsHE2z/dY5toqOhpQ1JptedflLfI6HMteeF4vqqPn
 0zGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ96FhVb3xOYYhnKR6HIocieB32RaEe/qHRJOxg2vsR2rEXqv6TpTb3hZogrsIRKqnDfJIV8svqSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsjjVYlT14CBzf+6bY4dyNRoOfPJyIZIib4B+6tiyfEr1RGpcF
 kntFpqve6Go+QcoG+5vL/JbrTnjcKx9SaQwqjonHUIQEiohuSqNF5PrRJuYLmus8N2I=
X-Gm-Gg: ASbGncv5hGbSdNc6hA6a/0DNxF4gE5BPuolwqUh7v9z7H47DOI+A2DlJIDEuG0QlBB5
 kyfwolVQBstUsBgBfE3fGDCJLmtNPwIXYxQFTjMuI9rbOyiPD6epgySMpwyqi8Qt2ogH0xX+jvT
 COADa8SP+EdqGwlkc8FLvUJ5rG5U33FCwEP6NGh3BRWyZWRjBCEJa/i+R1p86m/ERowa/s5AaqI
 OfOuRJ5V2mFlyCxnVHn+lPpD8jRa1EOxmz1pmzBfmDqVLnUeE0sBUSyOxpt6NrsXZGPfj+f3uXH
 q+KoylB9vPRKcLV/MSX1U5u+wui4DT6STtXUF9lhKnt/Ge2Kf7zMPMjk4I4fnUatZtG/ZLlDdTD
 TVFDXekqac2C9uIfc3/LT04KAK5OMcKgrcsHJV2o=
X-Google-Smtp-Source: AGHT+IH+NqfO0eRJpBwx+OETPzlNHnv9dU7aYJP1gt7nx8Svz410+PQMt4+K+Y+L3GHIBYSzGjaBVg==
X-Received: by 2002:a17:907:60d1:b0:adb:2462:d921 with SMTP id
 a640c23a62f3a-ade1a9160c3mr1613066266b.5.1749561369005; 
 Tue, 10 Jun 2025 06:16:09 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:16:08 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 0/9] TEE subsystem for protected dma-buf allocations
Date: Tue, 10 Jun 2025 15:13:44 +0200
Message-ID: <20250610131600.2972232-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch set allocates the protected DMA-bufs from a DMA-heap
instantiated from the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
protection for the memory used for the DMA-bufs.

The DMA-heap uses a protected memory pool provided by the backend TEE
driver, allowing it to choose how to allocate the protected physical
memory.

The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_FD
before they can be passed as arguments when requesting services from the
secure world.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) have been identified so far to serve as examples of what can be
expected. The use-cases have predefined DMA-heap names,
"protected,secure-video", "protected,trusted-ui", and
"protected,secure-video-record". The backend driver registers protected
memory pools for the use-cases it supports.

Each use-case has its own protected memory pool since different use-cases
require isolation from different parts of the system. A protected memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA (dma_alloc_pages()) and
made protected as needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v10
repo sync -j8
cd build
make toolchains -j$(nproc)
make all -j$(nproc)
# Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
# Connect a monitor to the RockPi
# login and at the prompt:
gst-launch-1.0 videotestsrc ! \
        aesenc key=1f9423681beb9a79215820f6bda73d0f \
                iv=e9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=true ! \
        aesdec key=1f9423681beb9a79215820f6bda73d0f ! \
        kmssink

The aesdec module has been hacked to use an OP-TEE TA to decrypt the stream
into protected DMA-bufs which are consumed by the kmssink.

The primitive QEMU tests from previous patch sets can be tested on RockPi
in the same way using:
xtest --sdp-basic

The primitive tests are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v10
repo sync -j8
cd build
make toolchains -j$(nproc)
make SPMC_AT_EL=1 all -j$(nproc)
make SPMC_AT_EL=1 run-only
# login and at the prompt:
xtest --sdp-basic

The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
S-EL1 inside OP-TEE. The parameter can be changed to SPMC_AT_EL=n to test
without FF-A using the original SMC ABI instead. Please remember to do
%make arm-tf-clean
for TF-A to be rebuilt properly using the new configuration.

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies required to build the above.

The primitive tests are pretty basic, mostly checking that a Trusted
Application in the secure world can access and manipulate the memory. There
are also some negative tests for out of bounds buffers, etc.

Thanks,
Jens

Changes since V9:
* Adding Sumit's R-B to "optee: sync secure world ABI headers"
* Update commit message as requested for "dma-buf: dma-heap: export
  declared functions".
* In "tee: implement protected DMA-heap":
  - add the hidden config option TEE_DMABUF_HEAPS to tell if the TEE
    subsystem can support DMA heaps
  - add a pfn_valid() to check that the passed physical address can be
    used by __pfn_to_page() and friends
  - remove the memremap() call, the caller is should do that instead if
    needed
* In "tee: add tee_shm_alloc_dma_mem()" guard the calls to
  dma_alloc_pages() and dma_free_pages() with TEE_DMABUF_HEAPS to avoid
  linking errors in some configurations
* In "optee: support protected memory allocation":
  - add the hidden config option OPTEE_STATIC_PROTMEM_POOL to tell if the
    driver can support a static protected memory pool
  - optee_protmem_pool_init() is slightly refactored to make the patches
    that follow easier
  - Call devm_memremap() before calling tee_protmem_static_pool_alloc()

Changes since V8:
* Using dma_alloc_pages() instead of cma_alloc() so the direct dependency on
  CMA can be removed together with the patches
  "cma: export cma_alloc() and cma_release()" and
  "dma-contiguous: export dma_contiguous_default_area". The patch
* Renaming the patch "tee: add tee_shm_alloc_cma_phys_mem()" to
  "tee: add tee_shm_alloc_dma_mem()"
* Setting DMA mask for the OP-TEE TEE device based on input from the secure
  world instead of relying on the parent device so following patches are
  removed: "tee: tee_device_alloc(): copy dma_mask from parent device" and
  "optee: pass parent device to tee_device_alloc()".
* Adding Sumit Garg's R-B to "tee: refactor params_from_user()"
* In the patch "tee: implement protected DMA-heap", map the physical memory
  passed to tee_protmem_static_pool_alloc().

Changes since V7:
* Adding "dma-buf: dma-heap: export declared functions",
  "cma: export cma_alloc() and cma_release()", and
  "dma-contiguous: export dma_contiguous_default_area" to export the symbols
  needed to keep the TEE subsystem as a load module.
* Removing CONFIG_TEE_DMABUF_HEAP and CONFIG_TEE_CMA since they aren't
  needed any longer.
* Addressing review comments in "optee: sync secure world ABI headers"
* Better align protected memory pool initialization between the smc-abi and
  ffa-abi parts of the optee driver.
* Removing the patch "optee: account for direction while converting parameters"

Changes since V6:
* Restricted memory is now known as protected memory since to use the same
  term as https://docs.vulkan.org/guide/latest/protected.html. Update all
  patches to consistently use protected memory.
* In "tee: implement protected DMA-heap" add the hidden config option
  TEE_DMABUF_HEAP to tell if the DMABUF_HEAPS functions are available
  for the TEE subsystem
* Adding "tee: refactor params_from_user()", broken out from the patch
  "tee: new ioctl to a register tee_shm from a dmabuf file descriptor"
* For "tee: new ioctl to a register tee_shm from a dmabuf file descriptor":
  - Update commit message to mention protected memory
  - Remove and open code tee_shm_get_parent_shm() in param_from_user_memref()
* In "tee: add tee_shm_alloc_cma_phys_mem" add the hidden config option
  TEE_CMA to tell if the CMA functions are available for the TEE subsystem
* For "tee: tee_device_alloc(): copy dma_mask from parent device" and
  "optee: pass parent device to tee_device_alloc", added
  Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

Changes since V5:
* Removing "tee: add restricted memory allocation" and
  "tee: add TEE_IOC_RSTMEM_FD_INFO"
* Adding "tee: implement restricted DMA-heap",
  "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
  "tee: add tee_shm_alloc_cma_phys_mem()",
  "optee: pass parent device to tee_device_alloc()", and
  "tee: tee_device_alloc(): copy dma_mask from parent device"
* The two TEE driver OPs "rstmem_alloc()" and "rstmem_free()" are replaced
  with a struct tee_rstmem_pool abstraction.
* Replaced the the TEE_IOC_RSTMEM_ALLOC user space API with the DMA-heap API

Changes since V4:
* Adding the patch "tee: add TEE_IOC_RSTMEM_FD_INFO" needed by the
  GStreamer demo
* Removing the dummy CPU access and mmap functions from the dma_buf_ops
* Fixing a compile error in "optee: FF-A: dynamic restricted memory allocation"
  reported by kernel test robot <lkp@intel.com>

Changes since V3:
* Make the use_case and flags field in struct tee_shm u32's instead of
  u16's
* Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
* Import namespace DMA_BUF in module tee, reported by lkp@intel.com
* Added a note in the commit message for "optee: account for direction
  while converting parameters" why it's needed
* Factor out dynamic restricted memory allocation from
  "optee: support restricted memory allocation" into two new commits
  "optee: FF-A: dynamic restricted memory allocation" and
  "optee: smc abi: dynamic restricted memory allocation"
* Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
  restricted memory allocate if CMA isn't configured

Changes since the V2 RFC:
* Based on v6.12
* Replaced the flags for SVP and Trusted UID memory with a u32 field with
  unique id for each use case
* Added dynamic allocation of restricted memory pools
* Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
* Added support for FF-A with FFA_LEND

Changes since the V1 RFC:
* Based on v6.11
* Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC

Changes since Olivier's post [2]:
* Based on Yong Wu's post [1] where much of dma-buf handling is done in
  the generic restricted heap
* Simplifications and cleanup
* New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
  support"
* Replaced the word "secure" with "restricted" where applicable




Etienne Carriere (1):
  tee: new ioctl to a register tee_shm from a dmabuf file descriptor

Jens Wiklander (8):
  optee: sync secure world ABI headers
  dma-buf: dma-heap: export declared functions
  tee: implement protected DMA-heap
  tee: refactor params_from_user()
  tee: add tee_shm_alloc_dma_mem()
  optee: support protected memory allocation
  optee: FF-A: dynamic protected memory allocation
  optee: smc abi: dynamic protected memory allocation

 drivers/dma-buf/dma-heap.c        |   3 +
 drivers/tee/Kconfig               |   5 +
 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Kconfig         |   5 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/core.c          |  10 +
 drivers/tee/optee/ffa_abi.c       | 147 +++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  84 +++++-
 drivers/tee/optee/optee_private.h |  15 +-
 drivers/tee/optee/optee_smc.h     |  37 ++-
 drivers/tee/optee/protmem.c       | 335 +++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 142 ++++++++-
 drivers/tee/tee_core.c            | 155 +++++++---
 drivers/tee/tee_heap.c            | 472 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |  16 +
 drivers/tee/tee_shm.c             | 189 +++++++++++-
 include/linux/tee_core.h          |  71 +++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  31 ++
 20 files changed, 1689 insertions(+), 67 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.43.0

