Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B85F99E392
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 12:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88510E08D;
	Tue, 15 Oct 2024 10:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MVOgN/jr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57F910E08D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 10:17:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso7867294a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 03:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728987453; x=1729592253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/vsiyFH7AdAG35W+mWfukPu7OxX/u28De0FB1ag7l3I=;
 b=MVOgN/jrtIjqVT4Xk/IQOPB3qYkXTJrcxRp7lz6fBSdiTlsmuigbp4qzKsguTa5dwX
 Bu8jVe/gFQ6YsQEzKC7rz7iWIoJZwVrv7u7wr/ok8MtYri+FbzN+LrtynGbuHe4DvsQa
 b4kASHIOekxWZP53rIfjYzZfeQ73+mpFHBTN8aHv29DFTTC7qMguKL50l+l59WlX+YjW
 TpMflN6rrsWrnGz+/UFQ8DvMA35aQz6nZXLLF0+7gUV6xtaXCP/7G9yBblztxV4rUod5
 Y3PEF92nDBXE3crbq2FMtRckTWWWDLziDnxtfp8VYMVhhbqYg4GiNF37yO+Jy0Y3yHVv
 JHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728987453; x=1729592253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/vsiyFH7AdAG35W+mWfukPu7OxX/u28De0FB1ag7l3I=;
 b=UU9p+rWn6LzyqoCnLPiba4QXaO0Om0X3wZREI7QsWrxZod4sV6lNTPmi/pQY8AabUg
 kVyARlnxJqLlVhEAO0i4rcKs7oSbFkn9Ya1o85omCydHw37AAkl/5h/b2v7T/58Tw2hj
 Ycdx/GbNCqzuRvPNQAMhi/4cJG6cE5/ZbVmMIxCwPDWUrkR4laRYykYL23r2ra2430jp
 Qxv7YWHHVvDr0+QnoUm3vCg9nF8HoikwhjGauqIZrwJFYeSMzst7r7xDmGB+bjU/8+JD
 SQOh1I2U9BlowzZSxt4aWCa++IBtnVLjGGsWtPSeTjmyFl7R1Dr/YyW64CJD3bKfcQlA
 ygPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXtJS3XNVf4Wl5SffCBLsnytFiGTU5faq8G5uUAGc1EQ2mt05TUQoEg8guDVpWC6CBOb9EFTbpTqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgg0TIEWRsi+zDp4RwU4rpJgBCJal8n/boooDCgCeNK4wYxhRQ
 N043eOFaOCyWfulkddWPS9T4z/rNfVT1Skzv+Dim+WJPYnUNiAzVCaNpU2klTFI=
X-Google-Smtp-Source: AGHT+IFoSBcZrkiChgB4pqL7tE0eZfJ4KXAE8/CROlLVwwwfJ7xMioU8E2x8rJrk0YsmPXDwWauSdg==
X-Received: by 2002:a05:6402:43ce:b0:5c4:1320:e5a3 with SMTP id
 4fb4d7f45d1cf-5c948cd8df1mr11041123a12.16.1728987452987; 
 Tue, 15 Oct 2024 03:17:32 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d778b80sm519581a12.78.2024.10.15.03.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 03:17:32 -0700 (PDT)
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
Subject: [RFC PATCH v2 0/2] TEE subsystem for restricted dma-buf allocations
Date: Tue, 15 Oct 2024 12:15:32 +0200
Message-ID: <20241015101716.740829-1-jens.wiklander@linaro.org>
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
This a complete rewrite compared to the previous patch set [1], and other
earlier proposals [2] and [3] with a separate restricted heap.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or a future QTEE) which sets up the restrictions
for the memory used for the DMA-bufs.

I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
DMA-bufs. This new IOCTL reaches the backend TEE driver, allowing it to
choose how to allocate the restricted physical memory.

TEE_IOC_RSTMEM_ALLOC is quite similar to TEE_IOC_SHM_ALLOC so it's tempting
to extend TEE_IOC_SHM_ALLOC with two new flags
TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI for
the same feature. However, it might be a bit confusing since
TEE_IOC_SHM_ALLOC only returns an anonymous file descriptor, but
TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI would
return a DMA-buf file descriptor instead. What do others think?

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v2
repo sync -j8
cd build
make toolchains -j4
make all -j$(nproc)
make run-only
# login and at the prompt:
xtest --sdp-basic

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory. There are also some
negative tests for out of bounds buffers etc.

Thanks,
Jens

[1] https://lore.kernel.org/lkml/20240830070351.2855919-1-jens.wiklander@linaro.org/
[2] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
[3] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/

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

Jens Wiklander (2):
  tee: add restricted memory allocation
  optee: support restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/core.c          |  21 ++++
 drivers/tee/optee/optee_private.h |   6 +
 drivers/tee/optee/optee_smc.h     |  35 ++++++
 drivers/tee/optee/smc_abi.c       |  45 ++++++-
 drivers/tee/tee_core.c            |  33 ++++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 200 ++++++++++++++++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 ++++++++++-
 include/linux/tee_core.h          |   6 +
 include/linux/tee_drv.h           |   9 ++
 include/uapi/linux/tee.h          |  33 ++++-
 13 files changed, 455 insertions(+), 7 deletions(-)
 create mode 100644 drivers/tee/tee_rstmem.c

-- 
2.43.0

