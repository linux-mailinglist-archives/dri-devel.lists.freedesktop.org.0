Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9779DBA25
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 16:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597910E325;
	Thu, 28 Nov 2024 15:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fk77QVzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35A510E081
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 15:09:40 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aa52bb7beceso94863866b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732806579; x=1733411379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lx8FUbil1lq4BtoAebbj8qif3q0b2Rsp7fvYReP+0O4=;
 b=fk77QVzvn/4Guv6sgU2SJppeLcUlJ7O+3sZsQEMHYnUqWJ85pbq6y9EtkViisIxWRV
 KZOp9Td0lxMqUh4BpVIYmVYmuJ2qHeDvQyWqDAmkZCgCZiP5yqbpiQAyOl6FZ0kL1ilS
 C43wTpS/wu9KJIC7OKtkTQpnBN9ZknYi6UeJzXVo/SrSFtcnK+1nZqWkRS8FFWmKfA2i
 Zezq1IP31Mjw/4n0PNCQ+w0a5f09jwqbJiEHv3Rl7AFRhrRcx2SmQ7rm2LPutGENNnjP
 CrZEhkyV8bFlKMPDCxKd4lwHspGs86a8O+VNpGACXJibgAjDISu2e9we4NNBJDMNEyKW
 jcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732806579; x=1733411379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lx8FUbil1lq4BtoAebbj8qif3q0b2Rsp7fvYReP+0O4=;
 b=SsOQMu7fUFSovRxtj4ALbp6l8aphUAQWC9qurC6p6PjlaBGPOuY4gOeStutTCSS9vc
 6vn7O7VGRszgf3yFKHnR+pkEKshDgmFUU7Q16CerGl9EkKoTrUkTuJNftmLpqzgzGwLW
 9yPtruS0WjS/LEixPKO5zIlVrP8xtF3MAbcWIE8+BwTbHRoGNlpxiS93JqvtlYeeYNhO
 hL5nJhftkIBxbNdSX2DQiqWytJLbQUEHL2I7WUvfBjiuBKWwtCedOWAjp8grfcZ+1URy
 eMGCNGSLdk1xjFzNdLNPAjG81Iu8IhfyAHawD5GTc3G0lhGPzNMb9pNmyDm5QeCa0S8c
 921A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUObwCh66wLqBjau/YfBH0YKV6K5/d0YKZUhSWpxJPbUnobcSy2Q7hgfX4v2Ctjwungr1vaw29civg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqETKtqXBh/ApmINyji40cj8r1J00ueCHh36iJO4wKVRbTEJtw
 Li1RdYgBC/FtbR72UBfk5sS57CbLPg22seAH13xiR8e5Kh0JR3rLBk84En4AoqQ=
X-Gm-Gg: ASbGncvESKmwFULSFrvgdRq2SSr2cNGGwfF9AHSFiK9QR/a9mxvWT+I/Of4qlSAzKhC
 CpqvR+zyvP0zLywQ9F7pUDkk9fRAKNnakifuIrH7xhQPasC978mSkger2XkbqCHC5OHtV2Bxi59
 GxM8RH/BmibkhoKBu5iNwgWzFfcKRrcMYQu8/wr2rqMqP0KgSEv5a5/L9GMWgYswGWbVQbonPw5
 z/wBIMgMK1aJyfzo50Qtp2bGkHopq/0Y2eSGHx8K8XpVBnO9iXvMVq7iqp/fFOJH/M7qhCU8YE7
 jvKBQNLfTqSs7XBp/u1KDx9n
X-Google-Smtp-Source: AGHT+IErM6pO63m4fDk26WsSCnoRuNdeklZdOejyiYshrc8elr0SpIMuHzrJ+hXYJB8Y4wtZl7A20A==
X-Received: by 2002:a17:906:3d22:b0:aa5:50b6:a600 with SMTP id
 a640c23a62f3a-aa581028af3mr520735266b.44.1732806578748; 
 Thu, 28 Nov 2024 07:09:38 -0800 (PST)
Received: from rayden.urgonet (h-79-136-84-141.A175.priv.bahnhof.se.
 [79.136.84.141]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59990a78esm75711366b.163.2024.11.28.07.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 07:09:38 -0800 (PST)
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
 azarrabi@qti.qualcomm.com, Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v3 0/4] TEE subsystem for restricted dma-buf allocations
Date: Thu, 28 Nov 2024 16:09:00 +0100
Message-ID: <20241128150927.1377981-1-jens.wiklander@linaro.org>
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

This patch set allocates the restricted DMA-bufs via the TEE subsystem.
This a big update compared to the previous patch set [1].

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
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

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v3
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

[1] https://lore.kernel.org/lkml/20241015101716.740829-1-jens.wiklander@linaro.org/

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

Jens Wiklander (4):
  tee: add restricted memory allocation
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 ++-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  75 ++++--
 drivers/tee/optee/optee_smc.h     |  71 +++++-
 drivers/tee/optee/rpc.c           |  31 ++-
 drivers/tee/optee/rstmem.c        | 380 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 214 +++++++++++++++--
 drivers/tee/tee_core.c            |  37 ++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   4 +-
 include/uapi/linux/tee.h          |  37 ++-
 20 files changed, 1344 insertions(+), 77 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c

-- 
2.43.0

