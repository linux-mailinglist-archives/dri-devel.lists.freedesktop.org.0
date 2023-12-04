Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CA803C79
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3415610E3DA;
	Mon,  4 Dec 2023 18:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1A710E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:10:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso1947545e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701713407; x=1702318207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOs32YqB//YFUNyE8/Hyu1lCHWNQRPq6bkBebbJmgLE=;
 b=DHM+dBN89BWnFkvPDVhdmtD25tTf9S/UqjHHPnCSquDbmf+5sttqWJeAIU26csemMo
 GQ8VnN/jJp/TPMc/LspEvC/rXuSViZq0Vtf2dcA3eMNYEuuCL+eN6KVi/ay1sYuLDkyf
 o1wNPJmIA4rtzDGojcBlf+faYPBrCy/HgIe2IfLoJLinbg28hfs+P6dh+aa8NiUvzPCr
 kAA6MzzX+mMiqpLA3crjMtGSX7t1thkX8nq02WP7m5BAAyzzTq8btsl+d1vTbQUmddn7
 QZ/Wt2CKyUNow4jx8KZSW17zRhUjMwh2TdP1nC1/LsqOa3op6SjW/u2wFnyWW6UsXOv2
 tA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701713407; x=1702318207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOs32YqB//YFUNyE8/Hyu1lCHWNQRPq6bkBebbJmgLE=;
 b=GI7N65eNgtInu7VNkZLuVEfmKaXHk91oqtNNDWDr4XZXBnKzJJj3qsbv80xNwAWA5L
 i+5H/LGqQjMOT98abxHjwij5W7JH3ZMLepbEzJZ8T3qcCUuYcNdfz/CPofiuKdCe8ZcO
 xzGxH0VYYiK4HjZL/du45egkDdnFyDiA8edoo7oFKG/El6C0Lu8QdONx+06UqSriTGjj
 kq7D1tPU4d9z8Ny+wS/UU/s6C/1FpIz/p8sqJawldcUB/fl2F6f/HUe3bPctAgtAhGjN
 ll6w9Ad3YOWIH0BcNpMlkiEC5ydlvqo0BY8pjHDJ+DtKwQFLr9NnwMeyw2y5Z6ad7pW6
 Nhng==
X-Gm-Message-State: AOJu0YzoFbvWhEIvoHCDjiEUwcs1gTPBtQT1jBTwL/IdG9PgPULRRc5P
 xMeBsqseMU2c3oSpc7d6uhF04CjB/J3K2o/eQ/2tlhJbDi4=
X-Google-Smtp-Source: AGHT+IHcJyfzuCqCLdJ4G5pswtmcCesOX54PivEUGOkWwXRf0dn1i8CzerWIjcGC4PsQZ8P+oTljf73DGY2CodLUarE=
X-Received: by 2002:a05:6512:3692:b0:50b:f006:3f92 with SMTP id
 d18-20020a056512369200b0050bf0063f92mr1279405lfs.134.1701713407226; Mon, 04
 Dec 2023 10:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
In-Reply-To: <20231204173313.2098733-1-boris.brezillon@collabora.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 4 Dec 2023 19:09:54 +0100
Message-ID: <CAJiuCcfMCd4s0XjngrEfy84Ybff7T7bYVHVNhNHYu-bSHcfGiQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] drm: Add a driver for CSF-based Mali GPUs
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On Mon, 4 Dec 2023 at 18:33, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hello,
>
> This is the 3rd version of the kernel driver for Mali CSF-based GPUs.
>
> With all the DRM dependencies being merged (drm-sched single entity and
> drm_gpuvm), I thought now was a good time to post a new version. Note
> that the iommu series we depend on [1] has been merged recently. The
> only remaining dependency that hasn't been merged yet is this rather
> trival drm_gpuvm [2] patch.
>
> As for v2, I pushed a branch based on drm-misc-next and containing
> all the dependencies that are not yet available in drm-misc-next
> here[3], and another [4] containing extra patches to have things
> working on rk3588. The CSF firmware binary can be found here[5], and
> should be placed under /lib/firmware/arm/mali/arch10.8/mali_csffw.bin.
>
> The mesa MR adding v10 support on top of panthor is available here [6].
>
> Regarding the GPL2+MIT relicensing, Liviu did an audit and found two
> more people that I didn't spot initially: Cl=C3=A9ment P=C3=A9ron for the=
 devfreq
> code, and Alexey Sheplyakov for some bits in panthor_gpu.c. Both are
> Cc-ed on the relevant patches. The rest of the code is either new, or
> covered by the Linaro, Arm and Collabora acks.

I only did some trivial cleaning, the relicensing is fine for me.
Do you need me to ack some patches?

Regards,
Clement

>
> And here is a non-exhaustive changelog, check each commit for a detailed
> changelog.
>
> v3;
> - Quite a few changes at the MMU/sched level to make the fix some
>   race conditions and deadlocks
> - Addition of the a sync-only VM_BIND operation (to support
>   vkQueueSparseBind with zero commands).
> - Addition of a VM_GET_STATE ioctl
> - Various cosmetic changes (see the commit changelogs for more details)
> - Various fixes (see the commit changelogs for more details)
>
> v2:
> - Rename the driver (pancsf -> panthor)
> - Split the commit adding the driver to ease review
> - Use drm_sched for dependency tracking/job submission
> - Add a VM_BIND ioctl
> - Add the concept of exclusive VM for BOs that are only ever mapped to a
>   single VM
> - Document the code and uAPI
> - Add a DT binding doc
>
> Regards,
>
> Boris
>
> [1]https://lore.kernel.org/linux-arm-kernel/20231124142434.1577550-1-bori=
s.brezillon@collabora.com/T/
> [2]https://patchwork.freedesktop.org/patch/570380/
> [3]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3
> [4]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3+rk3588
> [5]https://gitlab.com/firefly-linux/external/libmali/-/raw/firefly/firmwa=
re/g610/mali_csffw.bin
> [6]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358
>
> Boris Brezillon (13):
>   drm/panthor: Add uAPI
>   drm/panthor: Add GPU register definitions
>   drm/panthor: Add the device logical block
>   drm/panthor: Add the GPU logical block
>   drm/panthor: Add GEM logical block
>   drm/panthor: Add the devfreq logical block
>   drm/panthor: Add the MMU/VM logical block
>   drm/panthor: Add the FW logical block
>   drm/panthor: Add the heap logical block
>   drm/panthor: Add the scheduler logical block
>   drm/panthor: Add the driver frontend block
>   drm/panthor: Allow driver compilation
>   drm/panthor: Add an entry to MAINTAINERS
>
> Liviu Dudau (1):
>   dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs
>
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  147 +
>  Documentation/gpu/driver-uapi.rst             |    5 +
>  MAINTAINERS                                   |   11 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/panthor/Kconfig               |   23 +
>  drivers/gpu/drm/panthor/Makefile              |   15 +
>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  283 ++
>  drivers/gpu/drm/panthor/panthor_devfreq.h     |   25 +
>  drivers/gpu/drm/panthor/panthor_device.c      |  497 +++
>  drivers/gpu/drm/panthor/panthor_device.h      |  381 ++
>  drivers/gpu/drm/panthor/panthor_drv.c         | 1454 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.c          | 1332 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.h          |  504 +++
>  drivers/gpu/drm/panthor/panthor_gem.c         |  227 ++
>  drivers/gpu/drm/panthor/panthor_gem.h         |  144 +
>  drivers/gpu/drm/panthor/panthor_gpu.c         |  481 +++
>  drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
>  drivers/gpu/drm/panthor/panthor_heap.c        |  517 +++
>  drivers/gpu/drm/panthor/panthor_heap.h        |   36 +
>  drivers/gpu/drm/panthor/panthor_mmu.c         | 2653 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h         |  101 +
>  drivers/gpu/drm/panthor/panthor_regs.h        |  237 ++
>  drivers/gpu/drm/panthor/panthor_sched.c       | 3410 +++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h       |   48 +
>  include/uapi/drm/panthor_drm.h                |  892 +++++
>  26 files changed, 13478 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhal=
l-csf.yaml
>  create mode 100644 drivers/gpu/drm/panthor/Kconfig
>  create mode 100644 drivers/gpu/drm/panthor/Makefile
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
>  create mode 100644 include/uapi/drm/panthor_drm.h
>
> --
> 2.43.0
>
