Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E62664C8F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 20:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A2F10E650;
	Tue, 10 Jan 2023 19:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217F510E650
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 19:34:28 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-4d4303c9de6so16848707b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 11:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6E3eASnKrqnVu49X6bMihyMddM8z9hQR7RQozaaLyNg=;
 b=jX2CiXudcBCAsuiFx+a/ZLCVNJDd+ztYzY9vK/q6zQE8GhU3pPgft8lkahZwNCtxkl
 /KBG6TOgQX1RAVPAmrJ/zSz/Rg/l8Fk11aHYPqjcLHwnzQY9zqowZZ2TFgkvrbrsLuJm
 P8nLD3R2lVyXjt+McW623kLVnU26809t0ZlUollLG5UGk+2zJdEd7mk+NGnA0YGwTElB
 m5xtUijpCLTMtc09Qx9hl7XPTp5xB4feZ0B5kgYdxGyPKU2VokgfD2sI/AU3AYojX7aC
 WsA6O7Ki6TfCbDBLg+XQT7haZB1H4jZQIgnExtaCxunZ1uylXce4FC1uLxwsbwaulP87
 EWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6E3eASnKrqnVu49X6bMihyMddM8z9hQR7RQozaaLyNg=;
 b=zb1frM7aIfJwqz86s+C7ljHCzTB2WCU2HEi5f1RW3/mAAr72AKenOEMdi+vSIhh6UG
 l4hcdUCGn8bIyBI3lfn1mHWvi3ObVvw2mwt3ILASi+SqUcULUHl2pIbslGyecOu4UjCk
 o73E306sCl4CAf8mikt5uClQ/yyN0/OOyytfzDYgFml2+PC11eCxlZYbTpPHHZ8WLaHc
 5XfrDDR03+thfsoi/XKAPqapUTKRYsiZne4hb/sMxBmKtHgxMgaKNFT9nNyjHJ7ileMF
 14Tf8lH2t1q7hgbuZha+bsHbX7Cp0lbgzpha8UD7Z6F+8QRR8cM0RsY2WNROJjzThlUl
 mSEw==
X-Gm-Message-State: AFqh2kqcrnyQQ7lW8ZoA3cTdj/9wIZrD0NPB5IOYwA/ovAz9jM7wDpZR
 XOuuolhZ8RzM+VRU0MoTnhBxXQueaEqQLIom6XtSUWMdAE1q1g==
X-Google-Smtp-Source: AMrXdXtPh7Z3Zw43bvRSVWjpKGdfS8Ehs6+6aM8z5VaP1zR6XxV19Cd+9IiMHKsDYV8eaMRPhQzFwVyjh2MVXdj+VGo=
X-Received: by 2002:a05:690c:299:b0:370:2d8c:8193 with SMTP id
 bf25-20020a05690c029900b003702d8c8193mr1592006ywb.221.1673379267102; Tue, 10
 Jan 2023 11:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
In-Reply-To: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 10 Jan 2023 21:34:00 +0200
Message-ID: <CAFCwf12AT4qwdHhKpqYhYCpRKvfbjximF7V-frWedUU0=VvFbg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] New DRM accel driver for Intel VPU
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 stanislaw.gruszka@linux.intel.com, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 2:23 PM Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Hi,
>
> This patchset contains a new Linux* Kernel Driver for Intel=C2=AE VPUs.
>
> VPU stands for Versatile Processing Unit and it is an AI inference accele=
rator
> integrated with Intel non-server CPUs starting from 14th generation.
> VPU enables efficient execution of Deep Learning applications
> like object detection, classification etc.
>
> The whole driver is licensed under GPL-2.0-only except for two headers im=
ported
> from the firmware that are MIT licensed.
>
> User mode driver was open sourced in December 2022 and it is available at=
:
> https://github.com/intel/linux-vpu-driver
>
> The firmware for the VPU will be distributed as a closed source binary.
>
> There are no major chcnages in this version of the patchset.
> Detailed changes are listed below.
>
> Regards,
> Jacek

Hi Jacek,
For patches 1-4 and 6 (assuming you fix the small issue in patch 3) you can=
 add
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>

For patch 5 I had a comment/question, please reply to it. Once we sort
that thing that patch is also r-b by me.

Patch 7 - I prefer someone else who knows about PM to look at it. In
habana we don't support power management (in the driver) so I have
never dealt with that and therefore I have no idea if you use the kapi
correctly.

Thanks,
Oded


>
> Changelog
>
> v5:
> - Rename ivpu_drm.h to ivpu_accel.h
> - Cleanup ivpu_mmu_config_check()
> - Optimize locking in ivpu_mmu_cd_add()
> - Invalidate user context if it has MMU faults
> - Move ivpu_ipc_match_consumer() outside ivpu_ipc_dispatch()
>
> v4: https://lore.kernel.org/all/20221208110733.5498-1-jacek.lawrynowicz@l=
inux.intel.com/
> - Switch to the accel framework (DRIVER_COMPUTE_ACCEL)
> - Move the driver from drivers/gpu/drm to drivers/accel
> - Rename kconfig DRM_IVPU option to DRM_ACCEL_IVPU and update dependencie=
s
> - Create context on open() instead of lazy allocating it
> - Remove status_offset from submit ioctl, as status is now reported in bo=
_wait ioctl
> - Use managed resources in ivpu_drv.c
> - Optimize locking in ivpu_ipc.c - add new rx_msg_lock for consumer msg l=
ist
> - Refactor vpu_hw_mtl_reg.h to use BIT_MASK() and GENMASK() macros
> - Use module_pci_driver() for mudule init
> - Remove mutex from "struct ivpu_pm_info"
> - Add explicit "vdev" arg to ivpu_dbg()
> - Use drm_WARN_ON() instead of WARN_ON() where possible
> - Add comments for boot related functions
> - Update firmware API headers
>
> v3: https://lore.kernel.org/all/20220924151149.323622-1-jacek.lawrynowicz=
@linux.intel.com/
> - Fixed alignment warning in ivpu_ipc.c when building with W=3D1
>
> v2: https://lore.kernel.org/all/20220913121017.993825-1-jacek.lawrynowicz=
@linux.intel.com/
> - Rename the driver from "drm/vpu" to "drm/ivpu"
> - Add a TODO file
> - Add support for WC buffers
>
> v1: https://lore.kernel.org/all/20220728131709.1087188-1-jacek.lawrynowic=
z@linux.intel.com/
>
> Jacek Lawrynowicz (7):
>   accel/ivpu: Introduce a new DRM driver for Intel VPU
>   accel/ivpu: Add Intel VPU MMU support
>   accel/ivpu: Add GEM buffer object management
>   accel/ivpu: Add IPC driver and JSM messages
>   accel/ivpu: Implement firmware parsing and booting
>   accel/ivpu: Add command buffer submission logic
>   accel/ivpu: Add PM support
>
>  MAINTAINERS                           |    9 +
>  drivers/Makefile                      |    1 +
>  drivers/accel/Kconfig                 |    2 +
>  drivers/accel/Makefile                |    3 +
>  drivers/accel/ivpu/Kconfig            |   15 +
>  drivers/accel/ivpu/Makefile           |   16 +
>  drivers/accel/ivpu/TODO               |    9 +
>  drivers/accel/ivpu/ivpu_drv.c         |  661 +++++++++++++++
>  drivers/accel/ivpu/ivpu_drv.h         |  190 +++++
>  drivers/accel/ivpu/ivpu_fw.c          |  423 ++++++++++
>  drivers/accel/ivpu/ivpu_fw.h          |   38 +
>  drivers/accel/ivpu/ivpu_gem.c         |  846 +++++++++++++++++++
>  drivers/accel/ivpu/ivpu_gem.h         |  129 +++
>  drivers/accel/ivpu/ivpu_hw.h          |  170 ++++
>  drivers/accel/ivpu/ivpu_hw_mtl.c      | 1084 +++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_hw_mtl_reg.h  |  280 +++++++
>  drivers/accel/ivpu/ivpu_hw_reg_io.h   |  115 +++
>  drivers/accel/ivpu/ivpu_ipc.c         |  508 ++++++++++++
>  drivers/accel/ivpu/ivpu_ipc.h         |   93 +++
>  drivers/accel/ivpu/ivpu_job.c         |  614 ++++++++++++++
>  drivers/accel/ivpu/ivpu_job.h         |   67 ++
>  drivers/accel/ivpu/ivpu_jsm_msg.c     |  170 ++++
>  drivers/accel/ivpu/ivpu_jsm_msg.h     |   23 +
>  drivers/accel/ivpu/ivpu_mmu.c         |  883 ++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_mmu.h         |   50 ++
>  drivers/accel/ivpu/ivpu_mmu_context.c |  398 +++++++++
>  drivers/accel/ivpu/ivpu_mmu_context.h |   50 ++
>  drivers/accel/ivpu/ivpu_pm.c          |  329 ++++++++
>  drivers/accel/ivpu/ivpu_pm.h          |   38 +
>  drivers/accel/ivpu/vpu_boot_api.h     |  349 ++++++++
>  drivers/accel/ivpu/vpu_jsm_api.h      |  999 +++++++++++++++++++++++
>  include/uapi/drm/ivpu_accel.h         |  339 ++++++++
>  32 files changed, 8901 insertions(+)
>  create mode 100644 drivers/accel/Makefile
>  create mode 100644 drivers/accel/ivpu/Kconfig
>  create mode 100644 drivers/accel/ivpu/Makefile
>  create mode 100644 drivers/accel/ivpu/TODO
>  create mode 100644 drivers/accel/ivpu/ivpu_drv.c
>  create mode 100644 drivers/accel/ivpu/ivpu_drv.h
>  create mode 100644 drivers/accel/ivpu/ivpu_fw.c
>  create mode 100644 drivers/accel/ivpu/ivpu_fw.h
>  create mode 100644 drivers/accel/ivpu/ivpu_gem.c
>  create mode 100644 drivers/accel/ivpu/ivpu_gem.h
>  create mode 100644 drivers/accel/ivpu/ivpu_hw.h
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl.c
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl_reg.h
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_reg_io.h
>  create mode 100644 drivers/accel/ivpu/ivpu_ipc.c
>  create mode 100644 drivers/accel/ivpu/ivpu_ipc.h
>  create mode 100644 drivers/accel/ivpu/ivpu_job.c
>  create mode 100644 drivers/accel/ivpu/ivpu_job.h
>  create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.c
>  create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.h
>  create mode 100644 drivers/accel/ivpu/ivpu_mmu.c
>  create mode 100644 drivers/accel/ivpu/ivpu_mmu.h
>  create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.c
>  create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.h
>  create mode 100644 drivers/accel/ivpu/ivpu_pm.c
>  create mode 100644 drivers/accel/ivpu/ivpu_pm.h
>  create mode 100644 drivers/accel/ivpu/vpu_boot_api.h
>  create mode 100644 drivers/accel/ivpu/vpu_jsm_api.h
>  create mode 100644 include/uapi/drm/ivpu_accel.h
>
>
> base-commit: 03a0a1040895711e12c15ab28d4d1812928e171d
> prerequisite-patch-id: 1283b537f4791511769ad3446d0eafd98193e86f
> --
> 2.34.1
