Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A59EABDED2
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B535410E663;
	Tue, 20 May 2025 15:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m+a3RwQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D32010E650
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 15:24:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ad52dfe06ceso458539466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747754681; x=1748359481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Gx+0GKtuZ3GYJAvYOnfIUtCau4b3x5OyuIdeQR0KSM=;
 b=m+a3RwQEpGQHh/yqcaujLRX3Z39kUYcjZpwbPfMgr/y1o9JEoNtWsGMs6+rBvjP0fM
 3jdSP+qFsf5BL4iTELlTRAOrNA+8h2BncVToTW/1mEBv01p9YsBYmVlqjHyZehwcZdvi
 BXwG+0R5AfTlBHNBk8jl8HE6fyRxeMN07+9BeQM0mEof++BiK7yN+iLB+vqouoIf3QxU
 QZFRhrCZ4DgfLQXiSBbFsNO1SU5Zv+uGb7GPfJ6bTeEN0ZwSJHYqPTTZa8BLP7M+MaxI
 rtGKoeYKIRWpjyBAE6txKxxm6oJfr61IL0dGFhiBhpnnnY6yMOI/0GpFRlG9GidBMP9K
 +OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747754681; x=1748359481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Gx+0GKtuZ3GYJAvYOnfIUtCau4b3x5OyuIdeQR0KSM=;
 b=POdRqr52SOj4dK7/xnQKwInCpVmjbbF3yQcQxzrsFJi8n9iB4C2S9dunr0RZHpxLNI
 +tS0wxOvBO3Rx9ARxaoLaZFqTCk9dvZsoBH4ZqzgagDKiB6sasn+YQct0A/slzgMZ0KJ
 3T7PdVl+Lvv427a8PsY87kSFLSU8+Ni+sFqSjc4zLxnC87gUmiWCUvpxJgcwXEHZozBB
 0BXU31UO+yt9dV2d7LFmPOuMWfwPe+4OTLQiLLHClZdojZCdTio+wcN63PBfeVy6XnKk
 qBDyxAq3SzatRMJQtu+Pfps1CpY15yuGaQGkh+PapIdVw57jT7n8k8kuqMocS6p0h2+q
 PtXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPZn/jC7kbhQmlMOXIvY2ivsxgIcXfwcQckHAjiYu1DyBamG1l8z6UgI/FbQUpc/zNSyruXtXnUF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKQ/oBvD8ZV7J/TJQAdAj4tS0V7p0K7c++Kx9Equ1yApd9vhEi
 skRwAJpGbbRIfYfc/nKSB8t95bpZSVySwstX+mp5XAPUswUhgP5LRNBouJsd/LKOyQ0=
X-Gm-Gg: ASbGnctaY5FtJjxImw9l0xansf3uWK3whURCLb33GlFuknyQUReJ/chdwTnmTrCFB1H
 dt0l3fQeifSJ9fkH+5W1Qf7HGeHBYq8KEfKgepJODCQkBwiBnPoPEGbOY72vDeLYnNUrR9SK9IO
 iE53kzq4dICUothsk4Y18YVR1yl3wn1XiRIUbPNAncOG5b42CGf2sxN85371tXReQFHmsCP5QrI
 /RQ0jTwkCwX0Eg7pkkgiuY+j6Ys7DXPBLa9le91fUcGrvCgQ9ImHx67/KQ+uM6ShC+A1oxTrpPR
 VIwuTbyWK8A86SDsGtVhcyCVcol3evsOaKZ33esSiItaslj8ggKxMBzisJiK+58GiCfB+OgO1bO
 oLFfCehPqs8lb2hnU4j2+rMBpBAXq
X-Google-Smtp-Source: AGHT+IGiBtB/yBrwdOUmv7Ytg8eiZmw9nJDvhkMV2QRZvjED6NikmzozZ3tfcWJyGNkfRcLUty/3Kg==
X-Received: by 2002:a17:907:3fa1:b0:ad5:5198:b2ae with SMTP id
 a640c23a62f3a-ad55198bc5emr1017407066b.52.1747754680675; 
 Tue, 20 May 2025 08:24:40 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 08:24:40 -0700 (PDT)
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 0/9] TEE subsystem for protected dma-buf allocations
Date: Tue, 20 May 2025 17:16:43 +0200
Message-ID: <20250520152436.474778-1-jens.wiklander@linaro.org>
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
        -b prototype/sdp-v9
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
        -b prototype/sdp-v9
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
 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/core.c          |  10 +
 drivers/tee/optee/ffa_abi.c       | 147 ++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  84 +++++-
 drivers/tee/optee/optee_private.h |  15 +-
 drivers/tee/optee/optee_smc.h     |  37 ++-
 drivers/tee/optee/protmem.c       | 332 ++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 113 ++++++-
 drivers/tee/tee_core.c            | 155 +++++++---
 drivers/tee/tee_heap.c            | 487 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |  16 +
 drivers/tee/tee_shm.c             | 183 ++++++++++-
 include/linux/tee_core.h          |  71 +++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  31 ++
 18 files changed, 1655 insertions(+), 68 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.43.0

