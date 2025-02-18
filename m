Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B493A39FFC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1992C10E3F5;
	Tue, 18 Feb 2025 14:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VzPXM+EG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FC010E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 14:35:37 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3061513d353so58972741fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 06:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739889336; x=1740494136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MWFT9m6GN4GxrZYX8Rpent2wFQfA0PjR3otNOfevNYU=;
 b=VzPXM+EGkVQrS3UPb49TfAB/hSYbzP3W+dQ9kyce6d0oFN7GIGs0kfcQb3mZlNZZkC
 V7I8GqXLQj3O3Wl6oAnujcEFe4Q3ID6EIdECBih6vRkLk4/0Nw4xSN1X9SA6Cw2CX9A1
 WDiTmqm/ALgdSr8QLl+SJjzU54oow4AXf1aFIWIBCOrdStC+KBhLnwIHjYUm+4C2A6JL
 LW8CWFJ9m32aermcP2krSvi3j00aMmMkXK2GRIN2UFH7S85xN5ZZ0d7Px1WDgjN6oEOj
 Qsa79GNc+oMYLBGw+Sy8I8VGr9DHjzFQmBcYl7S9101TEOGf3HDpPOggQ6uU3nMnURRP
 8uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739889336; x=1740494136;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MWFT9m6GN4GxrZYX8Rpent2wFQfA0PjR3otNOfevNYU=;
 b=O9zq2pTBwxYhtRt46fK5zag3DAXUz+bziNvK7QoSAtLhdi7oOscwIcNaRB2aH8gse1
 qRsREOW7WopelA3IF2GzBb+rYW14CllfXRSyF+34w2F2ytjAVaqNxhusAdjvYdh9MZHP
 HRfSR5y2o2vWj0iNFxi95ZQpF7yn64T39+hiVG7ZbBAQ1Hc/Mil04jZXLInb5MwwGpUI
 zb+GUpbbJongJ3AXVR812TGv9bELb2cxz3vJlycs3j+1f52QgvCXpB1J7v3TYpEuXHtP
 Gi7hflS4qNNLdU7x96QkXqE4ORkZBhwcN1Iv9zDl61lXqBAkhhwu8H45Gl3eHK58UupY
 Ht8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFpuqBjHB9nGT/XY/RWOHmjiF6f4IyiOEMFHyQx6YuK2LIK8sQ6eIV2x/jSwJSWwFOMkrMLpeoLpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8DIGkPpZaR38rAM6+6n9r9ooX98kAwg9yPuylzx8Sx+aAOEdE
 RUaVOmdRMIYN3BZdTQ7ImTxZTcU4+ruaK2VZlqQsS5KuPTFe2vx5asOST9HLCOU=
X-Gm-Gg: ASbGnctlNzdw/748RtnJmb8ar8T7Ime5Gke73SY/ein3uhge6zRZTonNvYI8oA8hl7u
 Mm/zxcFGxIlwUd8mhFNBI70Q7dezZCi+3RMSYv4cMzBvuMfKP/wpQsuDOTypfhM+HRYMTErniXS
 +xN8JShEWHurWhC3zUAuMWVAOfCDfOl1DE28+aWl27sY5zkLDeAFuzX7eI1rKmw2TYHAtgv+cV+
 y96Ct+MMvdKy6U/hNvJgJ/E6VYc4VABblBPYMktBs2WEDKds+Ko2X7i06qNrViQcEhydqRuETdv
 VkSskqgplnfGI7aPOW4fqwHF8Blz9s0/Oe278/4lzr7AlGZ7BS0QQ0SNNc5QuXYoFaQC
X-Google-Smtp-Source: AGHT+IGRQRyenVlztaodJXNdRWoqSHnEiV6CAyLZN/0VHpW+LYtybqKnx2XoHGvKGUJTmzr2eF8qRg==
X-Received: by 2002:a2e:885a:0:b0:309:251a:df12 with SMTP id
 38308e7fff4ca-30927aa59ecmr37278251fa.19.1739889336018; 
 Tue, 18 Feb 2025 06:35:36 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:35:34 -0800 (PST)
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
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 0/7] TEE subsystem for restricted dma-buf allocations
Date: Tue, 18 Feb 2025 15:34:49 +0100
Message-ID: <20250218143527.1236668-1-jens.wiklander@linaro.org>
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

[Now with a Gstreamer demo, see below.]

This patch set allocates the restricted DMA-bufs via the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
restrictions for the memory used for the DMA-bufs.

I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
how to allocate the restricted physical memory.

TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
a use-case parameter. This is used by the backend TEE driver to decide on
allocation policy and which devices should be able to access the memory.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. More use-cases can be added in userspace ABI, but it's up to the
backend TEE drivers to provide the implementation.

Each use-case has it's own restricted memory pool since different use-cases
requires isolation from different parts of the system. A restricted memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made restricted as
needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v5
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
into restricted DMA-bufs which are consumed by the kmssink.

The primitive QEMU tests from previous patch set can be tested on RockPi
in the same way with:
xtest --sdp-basic

The primitive test are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v5
repo sync -j8
cd build
make toolchains -j$(nproc)
make SPMC_AT_EL=1 all -j$(nproc)
make SPMC_AT_EL=1 run-only
# login and at the prompt:
xtest --sdp-basic

The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
without FF-A using the original SMC ABI instead. Please remember to do
%rm -rf ../trusted-firmware-a/build/qemu
for TF-A to be rebuilt properly using the new configuration.

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory. There are also some
negative tests for out of bounds buffers etc.

Thanks,
Jens

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

Jens Wiklander (7):
  tee: add restricted memory allocation
  tee: add TEE_IOC_RSTMEM_FD_INFO
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation
  optee: FF-A: dynamic restricted memory allocation
  optee: smc abi: dynamic restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 179 +++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 ++-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  75 ++++--
 drivers/tee/optee/optee_smc.h     |  71 +++++-
 drivers/tee/optee/rpc.c           |  31 ++-
 drivers/tee/optee/rstmem.c        | 389 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 215 +++++++++++++++--
 drivers/tee/tee_core.c            |  69 +++++-
 drivers/tee/tee_private.h         |   4 +
 drivers/tee/tee_rstmem.c          | 188 +++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   2 +
 include/uapi/linux/tee.h          |  71 +++++-
 20 files changed, 1409 insertions(+), 76 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.43.0

