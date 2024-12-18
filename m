Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34899F644A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F1010E1F9;
	Wed, 18 Dec 2024 11:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="X/XVwi5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B2010E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:06:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so3458066f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734519995; x=1735124795; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVmmteTH5HJmiV06ONEEcP4hGxtq/aqul7G3lNsssoY=;
 b=X/XVwi5JC3OZrLTw7m7wD/lXghFLbQnEUMT8pcHc7Kmr+T043U8goGPkkrdnrjXWPZ
 5z6WQMa8alL027Ub5S7+LkaoA6tiANSZIksfCS2Un7tuhgV10Nt75djztmPoOgCuuB7U
 X/pgPwcjW4H62Dc5VIYUGhNtH7ht8rj81ZDUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734519995; x=1735124795;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVmmteTH5HJmiV06ONEEcP4hGxtq/aqul7G3lNsssoY=;
 b=Kj3JhbH2U028XMbBwZO16orZL0JdZhJTK0xnWnKmzaQGEhmHqbMbJ62lV95rFTxf8x
 zyWgE0OFeOXWekNY70CCBO6YeGaCjdXPr/S3zXOoOllhe0Vd5U3z9yknDIep/QNYMNx/
 kmfxUgyjgiR/Xw1LC04ileT1de0Tr6rVCuc39PjMHFeHmwCFt446mhpAq8O+r3ZCf5iw
 OOj7N1uEv5SfOfPoeFc6dGnGKoRs1XDaU/eqhsOW72KIwtxjxw9lSRi8LQxyNfAuycZ1
 G7kcnm/3tLYKADQy7G3ozxORC/+k1xfVdHlsoKUpqpQP722Kp5qZtJ0+/1bEp1LPeWb/
 3z2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFPC8pWRbviRqRHXTepZ42x3pM9OUY8nZztZGfavbxchehHrFS7z6mu26tXZ8GqNrPfcih3Kzzmwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhOGH5opBj9dbNVHteUAjw8AcxUN4L+JFagQB/tcFN6/G5oOjw
 rb+Z8HfJYxxEB1KVn1hbChnS3EtLEZD6PlKkJQ21kU9zCGT9O6lj2Uqmvpz7Ao39Nh/sYV3gT2U
 2ycs=
X-Gm-Gg: ASbGnctaZigikuI6NV7L/X0xq1Y1ptbNoR6ZPBFLDyxAQ9w+U3TgR6I7eZrf8kDGwhS
 cMyG+WwQiY/X9XyedWRBYmiJu0Gyca1TyHfv/Pp7rMujQo5e1jHTM5jL+MH/yK3HoVvOTS3GZ5k
 ULK7q2O+X++zxWscxzDaywagjkzt0OyqYbro0s+Fiac4AWo0TVrTNN29AG38XyV/4NOxo2yPFm3
 zf3lMwdRnd6JB6e8krYJpUpiz7OMzNlW6tycB9WTk2I2MQZ9dwGUBI/fq43EJNeeARM
X-Google-Smtp-Source: AGHT+IGO+lveh3Jbb8AZu1Ge8phdM2oV+2GRJ4PUelkWtjliAilPaysJVfHfANDTcu/J9rlhBMtD5Q==
X-Received: by 2002:a05:6000:1ac8:b0:385:f9db:3c4b with SMTP id
 ffacd0b85a97d-388e4d2df3cmr2192735f8f.10.1734519995037; 
 Wed, 18 Dec 2024 03:06:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120dcsm14048491f8f.8.2024.12.18.03.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:06:34 -0800 (PST)
Date: Wed, 18 Dec 2024 12:06:32 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
Mail-Followup-To: Jens Wiklander <jens.wiklander@linaro.org>,
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
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217100809.3962439-1-jens.wiklander@linaro.org>
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

On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> Hi,
> 
> This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> 
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> restrictions for the memory used for the DMA-bufs.
> 
> I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> how to allocate the restricted physical memory.
> 
> TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> a use-case parameter. This is used by the backend TEE driver to decide on
> allocation policy and which devices should be able to access the memory.
> 
> Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> Recording) has been identified so far to serve as examples of what can be
> expected. More use-cases can be added in userspace ABI, but it's up to the
> backend TEE drivers to provide the implementation.
> 
> Each use-case has it's own restricted memory pool since different use-cases
> requires isolation from different parts of the system. A restricted memory
> pool can be based on a static carveout instantiated while probing the TEE
> backend driver, or dynamically allocated from CMA and made restricted as
> needed by the TEE.
> 
> This can be tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
>         -b prototype/sdp-v4
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make SPMC_AT_EL=1 all -j$(nproc)
> make SPMC_AT_EL=1 run-only
> # login and at the prompt:
> xtest --sdp-basic
> 
> The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> without FF-A using the original SMC ABI instead. Please remember to do
> %rm -rf ../trusted-firmware-a/build/qemu
> for TF-A to be rebuilt properly using the new configuration.
> 
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
> 
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory. There are also some
> negative tests for out of bounds buffers etc.

I think I've dropped this on earlier encrypted dma-buf discussions for
TEE, but can't find one right now ...

Do we have some open source userspace for this? To my knowledge we have
two implementations of encrypted/content protected dma-buf in upstream
right now in the amd and intel gpu drivers, and unless I'm mistaken they
both have some minimal userspace supporting EXT_protected_textures:

https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt

It's not great, but it does just barely clear the bar in my opinion. I
guess something in gstreamer or similar video pipeline framework would
also do the job.

Especially with the context of the uapi discussion in the v1/RFC thread I
think we need more than a bare-bones testcase to make sure this works in
actual use.

Cheers, Sima

> 
> Thanks,
> Jens
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
> * Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
> * Added support for FF-A with FFA_LEND
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
> Jens Wiklander (6):
>   tee: add restricted memory allocation
>   optee: account for direction while converting parameters
>   optee: sync secure world ABI headers
>   optee: support restricted memory allocation
>   optee: FF-A: dynamic restricted memory allocation
>   optee: smc abi: dynamic restricted memory allocation
> 
>  drivers/tee/Makefile              |   1 +
>  drivers/tee/optee/Makefile        |   1 +
>  drivers/tee/optee/call.c          |  10 +-
>  drivers/tee/optee/core.c          |   1 +
>  drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
>  drivers/tee/optee/optee_ffa.h     |  27 ++-
>  drivers/tee/optee/optee_msg.h     |  65 ++++-
>  drivers/tee/optee/optee_private.h |  75 ++++--
>  drivers/tee/optee/optee_smc.h     |  71 +++++-
>  drivers/tee/optee/rpc.c           |  31 ++-
>  drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
>  drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
>  drivers/tee/tee_core.c            |  38 ++-
>  drivers/tee/tee_private.h         |   2 +
>  drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
>  drivers/tee/tee_shm.c             |   2 +
>  drivers/tee/tee_shm_pool.c        |  69 +++++-
>  include/linux/tee_core.h          |  15 ++
>  include/linux/tee_drv.h           |   2 +
>  include/uapi/linux/tee.h          |  44 +++-
>  20 files changed, 1358 insertions(+), 76 deletions(-)
>  create mode 100644 drivers/tee/optee/rstmem.c
>  create mode 100644 drivers/tee/tee_rstmem.c
> 
> 
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> -- 
> 2.43.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
