Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81E9A2048
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 12:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03BE10E318;
	Thu, 17 Oct 2024 10:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D27bsabX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A8E10E318
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 10:46:32 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-85019a60523so268092241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729161992; x=1729766792; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5iLc9AQWQ9bPZ9PdWCnYLRDGxR6aVrX6pCcUlaC2gXg=;
 b=D27bsabXAePg3/TwqFvkVf8BMi8ng5OxANeqPoBEeZ6fX7opF67UrqKtZRsfDaWc0+
 dsnBfs6vYkaijVslwIaHM2HAnJ9qZuuxwmvNYbQiq6TWoxeXyU0MJ40+ij2eGo3gGX+i
 YeUNdxrHlEC4etn+tSczDygEvpH84YB11uYJhNtIx4uH+KhCiDYtSym6uOcsU3pslqTk
 yzXbqAv8NCDKPLDfBaUL21T+VgKHT7eZV6dVJhuEWOydBCJ9me9n+gyZ4MD3iok8gs/t
 NCmH0dcwDL32qPxCjj16gBj57KFr3/g9BDYcIWN4fRRDHJ6jtq6IqN/1qeAvpp74bQxQ
 VoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729161992; x=1729766792;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5iLc9AQWQ9bPZ9PdWCnYLRDGxR6aVrX6pCcUlaC2gXg=;
 b=X9XRlVmC+2BG247Pkv47RHGIReA+xqTwEYRPM/PgXTxQNENwZx349ubGy4WrzMK6L4
 Xks82lZ4P+tc3wbvwXLKDKAoB097OtYhfrUu+sQvbfAp1goICESALrUVgXue1WrdZRUR
 ub2s6kh1Rj8sjKw3Lv4hpzcyu+Vog70tdaakOiXGj/BGzQkG6fjtCTXgifUxGpCD5b4H
 /qGUvov1TIh4gUDdagMQrPmvrUXV0UFLgPYYY16lJuRPTk9HupdcOLbLw8Xkvsku+vWV
 fTs+0eIoiF++H2usqFeGihyloRD6N8eEQmypUX4MA+hOZo5WqroN/FlAjh5fYUkzwxQZ
 Opng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxmKQtMvPUjaq+EgNCN32Est+K7684z5evk0cMPNarT8Y2W0Jueoe8A2BQqf7jjQDz6+q9BZRfq5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr84aku4tqjtANPf2vUDHkDR68NFtgaP1CndAGCoVv+pv8FkTm
 Du7nNgwCjYPctrRRlPsV7n+cnoZe90QSTEte4j+/UzVMeETffLPR9WNcFQMbSgkxyAOKcCv4JBs
 RIys73dVyw5LC1XM9kLOyoMEPkl409cfbuB0nUw==
X-Google-Smtp-Source: AGHT+IEhuubEp1XFMcAt1Qdpoup5VxogAcu1pC1JHif0I5jEeCDESB436aTA1yUdhOINM3pMJD6rd6T5GIpOG8DyYOM=
X-Received: by 2002:a05:6102:26c2:b0:4a4:8ef0:25ba with SMTP id
 ada2fe7eead31-4a5b5a3f858mr5284146137.21.1729161991842; Thu, 17 Oct 2024
 03:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241015101716.740829-1-jens.wiklander@linaro.org>
In-Reply-To: <20241015101716.740829-1-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 17 Oct 2024 16:16:20 +0530
Message-ID: <CAFA6WYOCDf6RqHr7E9nN7DQdoq+ZDwFO=Y0yB+fzit2GwzDkGg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] TEE subsystem for restricted dma-buf
 allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
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

Hi Jens,

On Tue, 15 Oct 2024 at 15:47, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Hi,
>
> This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> This a complete rewrite compared to the previous patch set [1], and other
> earlier proposals [2] and [3] with a separate restricted heap.
>
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or a future QTEE) which sets up the restrictions
> for the memory used for the DMA-bufs.

Thanks for proposing this interface. IMHO, this solution will address
many concerns raised for the prior vendor specific DMA heaps approach
[1] as follows:

1. User-space interacting with the TEE subsystem for restricted memory
allocation makes it obvious that the returned DMA buf can't be
directly mapped by the CPU.

2. All the low level platform details gets abstracted out for
user-space regarding how the platform specific memory restriction
comes into play.

3. User-space doesn't have to deal with holding 2 DMA buffer
references, one after allocation from DMA heap and other for
communication with the TEE subsystem.

4. Allows for better co-ordination with other kernel subsystems
dealing with restricted DMA-bufs.

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

>
> I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> DMA-bufs. This new IOCTL reaches the backend TEE driver, allowing it to
> choose how to allocate the restricted physical memory.
>
> TEE_IOC_RSTMEM_ALLOC is quite similar to TEE_IOC_SHM_ALLOC so it's tempting
> to extend TEE_IOC_SHM_ALLOC with two new flags
> TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI for
> the same feature. However, it might be a bit confusing since
> TEE_IOC_SHM_ALLOC only returns an anonymous file descriptor, but
> TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI would
> return a DMA-buf file descriptor instead. What do others think?

I think it's better to keep it as a separate IOCTL given the primary
objective of buffer allocation and it's usage.

-Sumit

>
> This can be tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
>         -b prototype/sdp-v2
> repo sync -j8
> cd build
> make toolchains -j4
> make all -j$(nproc)
> make run-only
> # login and at the prompt:
> xtest --sdp-basic
>
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
>
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory. There are also some
> negative tests for out of bounds buffers etc.
>
> Thanks,
> Jens
>
> [1] https://lore.kernel.org/lkml/20240830070351.2855919-1-jens.wiklander@linaro.org/
> [2] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> [3] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
>
> Changes since the V1 RFC:
> * Based on v6.11
> * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC
>
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
>
> Jens Wiklander (2):
>   tee: add restricted memory allocation
>   optee: support restricted memory allocation
>
>  drivers/tee/Makefile              |   1 +
>  drivers/tee/optee/core.c          |  21 ++++
>  drivers/tee/optee/optee_private.h |   6 +
>  drivers/tee/optee/optee_smc.h     |  35 ++++++
>  drivers/tee/optee/smc_abi.c       |  45 ++++++-
>  drivers/tee/tee_core.c            |  33 ++++-
>  drivers/tee/tee_private.h         |   2 +
>  drivers/tee/tee_rstmem.c          | 200 ++++++++++++++++++++++++++++++
>  drivers/tee/tee_shm.c             |   2 +
>  drivers/tee/tee_shm_pool.c        |  69 ++++++++++-
>  include/linux/tee_core.h          |   6 +
>  include/linux/tee_drv.h           |   9 ++
>  include/uapi/linux/tee.h          |  33 ++++-
>  13 files changed, 455 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/tee/tee_rstmem.c
>
> --
> 2.43.0
>
