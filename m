Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D280B8E6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 05:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155B10E055;
	Sun, 10 Dec 2023 04:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC1C10E055
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 04:59:08 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-286f3e0d010so1004920a91.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 20:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702184347; x=1702789147; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqoJeWjs7zQicPHHHCe0LPchwZXHr0xYsAf5/PLFBe4=;
 b=A/NL40hAuZfshxXCSsZnXqXWsk5GrGvGOcHPKw+BnOUeyqPIezTwEcupoLKIJNNUC6
 ZRNuJOSAvh3XtAopcY2uue8h/5lt9iw0wIGGzr5Av9/FRekonWr9Ir8fOf0zE+Qcg1Gu
 XQziKsTVHY6uODCCfjAO08QsXyutVjC6VMjsmSm8E/+4YRBd+oJRyVWyayDjz1oelyjQ
 HUlv3QDrKY/Oq5J5iJ2UHkGXAzsIJXb7TIGDdwz6J6Q0SAJdNLXS7bRqMtZ84j6LQNck
 npAB2k9WlyWsVTKPwkWyOh4/LwY3/D9DQc7wdGLrNOXYkhfnO3EAr7XsgyBp3G/LIHM1
 MVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702184347; x=1702789147;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqoJeWjs7zQicPHHHCe0LPchwZXHr0xYsAf5/PLFBe4=;
 b=StFJ/2wl+Z0QVt1Z2WZdFl9t+A277bXTYa9Nexoz6jr7wARxyexnqVdaIFufj/QpSK
 +rTG813OwWP4V82HjwhbzYpgbEdi4FCNgGjMwXv6fAfKL76oSSt+yFyt1fmK51VcJ2CU
 FXk/tP1AVEH0hsExyUCrB7/12yS6rKvXL2/SMAiia0UCqW2YWIVWEM2qKZuUThInUQxR
 UuI6mKSGa8doV3UpP8SMnxVjiINX5HdAf5y5EWPpxI2Mh4boZSQGNv7oAsZFCs4AXlXq
 UfyiEYYCEQuuofSvH9oZgnaBC1uGyQmzIjPqoM9ZuNmLt/eS5S1Kw1WBM9sWxCCQ6CjG
 y/SA==
X-Gm-Message-State: AOJu0YzWGEHZT+agOx4LmgcneNyLbnOpefLOZyctbfcCNIcdMKaJDgAO
 rHgGOjs4Td4Ae8zUPG4Mg+Rtj0abkVsYIbz5
X-Google-Smtp-Source: AGHT+IE5d7Rs+q3jQxNtlwqnCuyh+MsnEmwydgVkGkfkkoRWUiU4x+zvFkHKpL7OD6qvFS90UtyHog==
X-Received: by 2002:a17:902:d48b:b0:1d0:73ca:660 with SMTP id
 c11-20020a170902d48b00b001d073ca0660mr4877930plg.4.1702184347343; 
 Sat, 09 Dec 2023 20:59:07 -0800 (PST)
Received: from smtpclient.apple (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 x24-20020a170902821800b001d0c418174fsm4139657pln.117.2023.12.09.20.59.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 09 Dec 2023 20:59:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH v3 00/14] drm: Add a driver for CSF-based Mali GPUs
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
In-Reply-To: <20231204173313.2098733-1-boris.brezillon@collabora.com>
Date: Sun, 10 Dec 2023 13:58:51 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <08C0F75B-292B-444D-A509-1451B08D0059@gmail.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Dec 5, 2023, at 2:32, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> Hello,
>=20
> This is the 3rd version of the kernel driver for Mali CSF-based GPUs.
>=20
> With all the DRM dependencies being merged (drm-sched single entity =
and
> drm_gpuvm), I thought now was a good time to post a new version. Note
> that the iommu series we depend on [1] has been merged recently. The
> only remaining dependency that hasn't been merged yet is this rather
> trival drm_gpuvm [2] patch.
>=20
> As for v2, I pushed a branch based on drm-misc-next and containing
> all the dependencies that are not yet available in drm-misc-next
> here[3], and another [4] containing extra patches to have things
> working on rk3588. The CSF firmware binary can be found here[5], and
> should be placed under /lib/firmware/arm/mali/arch10.8/mali_csffw.bin.
>=20
> The mesa MR adding v10 support on top of panthor is available here =
[6].
>=20
> Regarding the GPL2+MIT relicensing, Liviu did an audit and found two
> more people that I didn't spot initially: Cl=C3=A9ment P=C3=A9ron for =
the devfreq
> code, and Alexey Sheplyakov for some bits in panthor_gpu.c. Both are
> Cc-ed on the relevant patches. The rest of the code is either new, or
> covered by the Linaro, Arm and Collabora acks.
>=20
> And here is a non-exhaustive changelog, check each commit for a =
detailed
> changelog.
>=20
> v3;
> - Quite a few changes at the MMU/sched level to make the fix some
>  race conditions and deadlocks
> - Addition of the a sync-only VM_BIND operation (to support
>  vkQueueSparseBind with zero commands).

Hi Boris,

Just wanted to point out that vkQueueBindSparse's semantics is rather =
different
from vkQueueSubmit when it comes to synchronization.  In short,
vkQueueBindSparse does not operate on a particular timeline (aka =
scheduling
queue / drm_sched_entity).  The property of following a timeline order =
is known
as =E2=80=9Csubmission order=E2=80=9D [1] in Vulkan, and applies to =
vkQueueSubmit only and not
vkQueueBindSparse.

Hence, an implementation that takes full advantage of Vulkan semantics =
would
essentially have an infinite amount of VM_BIND contexts.  It would also =
not need
sync-only VM_BIND submissions, assuming that drmSyncobjTransfer works.

I=E2=80=99m not saying that the driver should always be implemented that =
way; in
particular, app developers are also confused by the semantics and native =
Vulkan
games can be terribly wrong [2].  D3D12 has serializing semantics for
UpdateTileMappings, so for D3D12 emulation one timeline is fine also.

Tatsuyuki.

[1]: =
https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#=
synchronization-submission-order
[2]: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10234

> - Addition of a VM_GET_STATE ioctl
> - Various cosmetic changes (see the commit changelogs for more =
details)
> - Various fixes (see the commit changelogs for more details)
>=20
> v2:
> - Rename the driver (pancsf -> panthor)
> - Split the commit adding the driver to ease review
> - Use drm_sched for dependency tracking/job submission
> - Add a VM_BIND ioctl
> - Add the concept of exclusive VM for BOs that are only ever mapped to =
a
>  single VM
> - Document the code and uAPI
> - Add a DT binding doc
>=20
> Regards,
>=20
> Boris
>=20
> =
[1]https://lore.kernel.org/linux-arm-kernel/20231124142434.1577550-1-boris=
.brezillon@collabora.com/T/
> [2]https://patchwork.freedesktop.org/patch/570380/
> [3]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3
> =
[4]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3+rk3588
> =
[5]https://gitlab.com/firefly-linux/external/libmali/-/raw/firefly/firmwar=
e/g610/mali_csffw.bin
> [6]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358
>=20
> Boris Brezillon (13):
>  drm/panthor: Add uAPI
>  drm/panthor: Add GPU register definitions
>  drm/panthor: Add the device logical block
>  drm/panthor: Add the GPU logical block
>  drm/panthor: Add GEM logical block
>  drm/panthor: Add the devfreq logical block
>  drm/panthor: Add the MMU/VM logical block
>  drm/panthor: Add the FW logical block
>  drm/panthor: Add the heap logical block
>  drm/panthor: Add the scheduler logical block
>  drm/panthor: Add the driver frontend block
>  drm/panthor: Allow driver compilation
>  drm/panthor: Add an entry to MAINTAINERS
>=20
> Liviu Dudau (1):
>  dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs
>=20
> .../bindings/gpu/arm,mali-valhall-csf.yaml    |  147 +
> Documentation/gpu/driver-uapi.rst             |    5 +
> MAINTAINERS                                   |   11 +
> drivers/gpu/drm/Kconfig                       |    2 +
> drivers/gpu/drm/Makefile                      |    1 +
> drivers/gpu/drm/panthor/Kconfig               |   23 +
> drivers/gpu/drm/panthor/Makefile              |   15 +
> drivers/gpu/drm/panthor/panthor_devfreq.c     |  283 ++
> drivers/gpu/drm/panthor/panthor_devfreq.h     |   25 +
> drivers/gpu/drm/panthor/panthor_device.c      |  497 +++
> drivers/gpu/drm/panthor/panthor_device.h      |  381 ++
> drivers/gpu/drm/panthor/panthor_drv.c         | 1454 +++++++
> drivers/gpu/drm/panthor/panthor_fw.c          | 1332 +++++++
> drivers/gpu/drm/panthor/panthor_fw.h          |  504 +++
> drivers/gpu/drm/panthor/panthor_gem.c         |  227 ++
> drivers/gpu/drm/panthor/panthor_gem.h         |  144 +
> drivers/gpu/drm/panthor/panthor_gpu.c         |  481 +++
> drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
> drivers/gpu/drm/panthor/panthor_heap.c        |  517 +++
> drivers/gpu/drm/panthor/panthor_heap.h        |   36 +
> drivers/gpu/drm/panthor/panthor_mmu.c         | 2653 +++++++++++++
> drivers/gpu/drm/panthor/panthor_mmu.h         |  101 +
> drivers/gpu/drm/panthor/panthor_regs.h        |  237 ++
> drivers/gpu/drm/panthor/panthor_sched.c       | 3410 +++++++++++++++++
> drivers/gpu/drm/panthor/panthor_sched.h       |   48 +
> include/uapi/drm/panthor_drm.h                |  892 +++++
> 26 files changed, 13478 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> create mode 100644 drivers/gpu/drm/panthor/Kconfig
> create mode 100644 drivers/gpu/drm/panthor/Makefile
> create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
> create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
> create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
> create mode 100644 include/uapi/drm/panthor_drm.h
>=20
> --=20
> 2.43.0
>=20
>=20

