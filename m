Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7867C9A4218
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808C310E078;
	Fri, 18 Oct 2024 15:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qlQUVIsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C26A10E95D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:16:49 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2689e7a941fso1151935fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729264608; x=1729869408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jAytm+vTrrtYhXgD+UllQFjS/zTHJKwJ78TI6ibsmew=;
 b=qlQUVIsDQbpNsT/N5N3fJnGZDDMELjFXfYFvoO4vAh3Ipu3hiUhJxgSHymaLzHfsDj
 sxp7tVvmyg1e3UPmBxgTm9mD9+gXgdXypIVyKl+DDYlOSn0WchzozeDeVEwq9j7mG+ep
 OUwcWIm0DKsftb9QC5+WAA35rDMbs+pHL+92GpgqtmCPQcy10TGAqbIlPNW6tkxeTnq7
 cEW7G6oB42HGUdR/EKLb9Q45wysE1nkS+FoL3mtN4wWlV74z3Dap89NlH7aAYB9GcynB
 rALZFvBuUVUJvcZ6pfIVsNgwMBGM1y1NH28DDs3qBdAxbErh+bQWroM4uDlY/G7cPlYj
 9x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729264608; x=1729869408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jAytm+vTrrtYhXgD+UllQFjS/zTHJKwJ78TI6ibsmew=;
 b=HX3J3IFCcXSCqe8aUQUqEe2pHVE4EpBJtpwnYK02PXVP5AWEzYAj5bH4HY0IdpIUDK
 gtTTLvo7xj0CLErpljPbqblWwF141AtOBNn/0pC1S9CTZEWi8zWip6kLkyiCXzXJIHgk
 pksHlVWI+XrMgFllelEOECvkWCQtLqvNBFQZ27eWC8cOt/5Vt3vsUmZl6FKebmRqTIWZ
 O9KMft034Fmzkx6quTeg1St1Uc9GhxwO4DBtSapbEIlGSao6asQm4MkOmTr4b6MWCQt9
 +3zeziU2vQqQCyPUXtAiSVCMbfWFVWOn1EcEoSnAqm3VEU98Slmk1T6qahJIiJ34xyOh
 Ut/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2qNObAj04SJbJ+xikDurcBVoG/elIJ5vDoK3cJcT5F3+DSX3SOOSCWuIH556zoO2C32dRTx/KIWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxxKPD1zmNn/D4PvNWmpJoFd46LosilXFiGn9iHeEB5KNLghwl
 +jDiG89Sj2yuZt84gXKuv0vHCQ3Cktq/7GreCi81BssSpH8fqw3hwv5T0DuGFErl+F2uF7tI2qB
 4myJMw1Et0184v2EBb2SG6Xf1HGjVCO+4Im10nQ==
X-Google-Smtp-Source: AGHT+IGolIsaMF++Cy6m1kdkSWxRaRgoSmJ+SJAAIuYVSNeW7g86RMg1ygCv7BHSNEhaFysoGwUOjmgwMXq354t4fEo=
X-Received: by 2002:a05:6870:1594:b0:288:2906:6877 with SMTP id
 586e51a60fabf-2892c5b26d6mr2532230fac.45.1729264608454; Fri, 18 Oct 2024
 08:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241015101716.740829-1-jens.wiklander@linaro.org>
 <CAFA6WYOCDf6RqHr7E9nN7DQdoq+ZDwFO=Y0yB+fzit2GwzDkGg@mail.gmail.com>
In-Reply-To: <CAFA6WYOCDf6RqHr7E9nN7DQdoq+ZDwFO=Y0yB+fzit2GwzDkGg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 18 Oct 2024 17:16:36 +0200
Message-ID: <CAHUa44Fonf1RdEJ-_SmBS_9+QZmhJ-O0UCi_FNm1xs655oM2Tw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] TEE subsystem for restricted dma-buf
 allocations
To: Sumit Garg <sumit.garg@linaro.org>
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

On Thu, Oct 17, 2024 at 12:46=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org>=
 wrote:
>
> Hi Jens,
>
> On Tue, 15 Oct 2024 at 15:47, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > Hi,
> >
> > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > This a complete rewrite compared to the previous patch set [1], and oth=
er
> > earlier proposals [2] and [3] with a separate restricted heap.
> >
> > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > (OP-TEE, AMD-TEE, TS-TEE, or a future QTEE) which sets up the restricti=
ons
> > for the memory used for the DMA-bufs.
>
> Thanks for proposing this interface. IMHO, this solution will address
> many concerns raised for the prior vendor specific DMA heaps approach
> [1] as follows:
>
> 1. User-space interacting with the TEE subsystem for restricted memory
> allocation makes it obvious that the returned DMA buf can't be
> directly mapped by the CPU.
>
> 2. All the low level platform details gets abstracted out for
> user-space regarding how the platform specific memory restriction
> comes into play.
>
> 3. User-space doesn't have to deal with holding 2 DMA buffer
> references, one after allocation from DMA heap and other for
> communication with the TEE subsystem.
>
> 4. Allows for better co-ordination with other kernel subsystems
> dealing with restricted DMA-bufs.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.=
wu@mediatek.com/
>
> >
> > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricte=
d
> > DMA-bufs. This new IOCTL reaches the backend TEE driver, allowing it to
> > choose how to allocate the restricted physical memory.
> >
> > TEE_IOC_RSTMEM_ALLOC is quite similar to TEE_IOC_SHM_ALLOC so it's temp=
ting
> > to extend TEE_IOC_SHM_ALLOC with two new flags
> > TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI fo=
r
> > the same feature. However, it might be a bit confusing since
> > TEE_IOC_SHM_ALLOC only returns an anonymous file descriptor, but
> > TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI wo=
uld
> > return a DMA-buf file descriptor instead. What do others think?
>
> I think it's better to keep it as a separate IOCTL given the primary
> objective of buffer allocation and it's usage.

Agreed.

Thanks,
Jens

>
> -Sumit
>
> >
> > This can be tested on QEMU with the following steps:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.x=
ml \
> >         -b prototype/sdp-v2
> > repo sync -j8
> > cd build
> > make toolchains -j4
> > make all -j$(nproc)
> > make run-only
> > # login and at the prompt:
> > xtest --sdp-basic
> >
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > list dependencies needed to build the above.
> >
> > The tests are pretty basic, mostly checking that a Trusted Application =
in
> > the secure world can access and manipulate the memory. There are also s=
ome
> > negative tests for out of bounds buffers etc.
> >
> > Thanks,
> > Jens
> >
> > [1] https://lore.kernel.org/lkml/20240830070351.2855919-1-jens.wiklande=
r@linaro.org/
> > [2] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@me=
diatek.com/
> > [3] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp=
.com/
> >
> > Changes since the V1 RFC:
> > * Based on v6.11
> > * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_A=
LLOC
> >
> > Changes since Olivier's post [2]:
> > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> >   the generic restricted heap
> > * Simplifications and cleanup
> > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf =
heap
> >   support"
> > * Replaced the word "secure" with "restricted" where applicable
> >
> > Jens Wiklander (2):
> >   tee: add restricted memory allocation
> >   optee: support restricted memory allocation
> >
> >  drivers/tee/Makefile              |   1 +
> >  drivers/tee/optee/core.c          |  21 ++++
> >  drivers/tee/optee/optee_private.h |   6 +
> >  drivers/tee/optee/optee_smc.h     |  35 ++++++
> >  drivers/tee/optee/smc_abi.c       |  45 ++++++-
> >  drivers/tee/tee_core.c            |  33 ++++-
> >  drivers/tee/tee_private.h         |   2 +
> >  drivers/tee/tee_rstmem.c          | 200 ++++++++++++++++++++++++++++++
> >  drivers/tee/tee_shm.c             |   2 +
> >  drivers/tee/tee_shm_pool.c        |  69 ++++++++++-
> >  include/linux/tee_core.h          |   6 +
> >  include/linux/tee_drv.h           |   9 ++
> >  include/uapi/linux/tee.h          |  33 ++++-
> >  13 files changed, 455 insertions(+), 7 deletions(-)
> >  create mode 100644 drivers/tee/tee_rstmem.c
> >
> > --
> > 2.43.0
> >
