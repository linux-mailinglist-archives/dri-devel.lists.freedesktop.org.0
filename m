Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD0673664
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 12:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6765010E906;
	Thu, 19 Jan 2023 11:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235BE10E906
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 11:11:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id az20so4771684ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 03:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j5fZdyZRmfqbji6GqX0rI3dFOfprZ3ZDRbCelPA+PdA=;
 b=Ekgpmg80uIyBfn3wMazFBnhxMEzr7rzr2D0YipVy9bV1gLrmo72BZBACLt9HIebDmQ
 8+HyoX1oOhgGY2Cr6Dy+Ysnd2EjO9haYziJlIjCOA9ZAtkS3Z6mOwvM2IPsOYe52ZUFn
 ccjIkJUaWV9EfCDs9/h5+gl/uFuRWQcfZ5Lj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j5fZdyZRmfqbji6GqX0rI3dFOfprZ3ZDRbCelPA+PdA=;
 b=IwjwoQ36VYlKYXkzh2molteZUuRuLa0Ya5Fzl4GNqmjtMNx4bSPHpoHHPkdOex5lc+
 29TmF93ciijve9k7jCLPwxu7ip+UEIDn7gZl9FR7vCNI7z6k+hdqpEiCOTeW/nytthie
 hRrp6gTR4eTr2kJSF8JiHHW+6y+TVBX7C0EVAWd4wL2S0aXbSAA/rzTfX26l0AKd1jES
 9dZNj8PB5sU96mjcd/+Q4gz6KSnptlSLocTCKUiisNaXyPD83dGFDrNte8MF/bVttumM
 ds3O6hbUhPaDERZATQ7P9sSUQbdvtEykliscOJBy72nH7Gpn3dP8vBkGcCyHgLNTrmjJ
 TXdw==
X-Gm-Message-State: AFqh2kpt1uae5L6nBI6BXHUybsnb9y0NQh4qQzKlVLR+2mRTuV9tUgXw
 l+3GIQX4WWWpsOU00LhPdJQJog==
X-Google-Smtp-Source: AMrXdXu4+M2zVi+aTpJDSh7cQfXQCuxVwVmIf6TgV+L+pHolQaqgkWKDN11TZUoGaM/vE8Ws512nqw==
X-Received: by 2002:a17:907:1b0f:b0:86b:93ea:3366 with SMTP id
 mp15-20020a1709071b0f00b0086b93ea3366mr16130568ejc.3.1674126664615; 
 Thu, 19 Jan 2023 03:11:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ss5-20020a170907038500b00856ad9108e7sm11900810ejb.70.2023.01.19.03.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:11:04 -0800 (PST)
Date: Thu, 19 Jan 2023 12:11:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: Re: [PATCH v6 0/7] New DRM accel driver for Intel VPU
Message-ID: <Y8klRchivhW/Mki8@phenom.ffwll.local>
References: <20230117092723.60441-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230117092723.60441-1-jacek.lawrynowicz@linux.intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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

On Tue, Jan 17, 2023 at 10:27:16AM +0100, Jacek Lawrynowicz wrote:
> Hi,
> 
> This patchset contains a new Linux* Kernel Driver for Intel® VPUs.
> 
> VPU stands for Versatile Processing Unit and it is an AI inference accelerator
> integrated with Intel non-server CPUs starting from 14th generation.
> VPU enables efficient execution of Deep Learning applications
> like object detection, classification etc.
> 
> The whole driver is licensed under GPL-2.0-only except for two headers imported
> from the firmware that are MIT licensed.
> 
> User space stack is open source and available at:
>   - UMD driver: https://github.com/intel/linux-vpu-driver
>   - Compiler and OpenVINO plugin: https://github.com/openvinotoolkit/vpux-plugin
> 
> The firmware for the VPU will be distributed as a closed source binary in
> the UMD driver repo.
> 
> This is hopefully the last revision of the patchset with minor changes outlined
> below.

Entire series pushed to drm-misc-next, thanks a lot and apologies that
this all got hold up for longer than usual with the drivers/accel
transition. But hopefully bright future ahead!

Cheers, Daniel

> 
> Regards,
> Jacek
> 
> Changelog
> 
> v6:
> - Remove userptr ioctl as it will be probably replaced with dma-buf heaps
> - Added dependency on !UML
> - Simplify struct file_operations ivpu_fops definition
> - Fixed compilation issues in patch 4 and 6
> - Updated TODO
> 
> v5: https://lore.kernel.org/all/20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com/
> - Rename ivpu_drm.h to ivpu_accel.h
> - Cleanup ivpu_mmu_config_check()
> - Optimize locking in ivpu_mmu_cd_add()
> - Invalidate user context if it has MMU faults
> - Move ivpu_ipc_match_consumer() outside ivpu_ipc_dispatch()
> 
> v4: https://lore.kernel.org/all/20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com/
> - Switch to the accel framework (DRIVER_COMPUTE_ACCEL)
> - Move the driver from drivers/gpu/drm to drivers/accel
> - Rename kconfig DRM_IVPU option to DRM_ACCEL_IVPU and update dependencies
> - Create context on open() instead of lazy allocating it
> - Remove status_offset from submit ioctl, as status is now reported in bo_wait ioctl
> - Use managed resources in ivpu_drv.c
> - Optimize locking in ivpu_ipc.c - add new rx_msg_lock for consumer msg list
> - Refactor vpu_hw_mtl_reg.h to use BIT_MASK() and GENMASK() macros
> - Use module_pci_driver() for mudule init
> - Remove mutex from "struct ivpu_pm_info"
> - Add explicit "vdev" arg to ivpu_dbg()
> - Use drm_WARN_ON() instead of WARN_ON() where possible
> - Add comments for boot related functions
> - Update firmware API headers
> 
> v3: https://lore.kernel.org/all/20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com/
> - Fixed alignment warning in ivpu_ipc.c when building with W=1
> 
> v2: https://lore.kernel.org/all/20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com/
> - Rename the driver from "drm/vpu" to "drm/ivpu"
> - Add a TODO file
> - Add support for WC buffers
> 
> v1: https://lore.kernel.org/all/20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com/
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
>  drivers/accel/ivpu/TODO               |   11 +
>  drivers/accel/ivpu/ivpu_drv.c         |  654 +++++++++++++++
>  drivers/accel/ivpu/ivpu_drv.h         |  190 +++++
>  drivers/accel/ivpu/ivpu_fw.c          |  423 ++++++++++
>  drivers/accel/ivpu/ivpu_fw.h          |   38 +
>  drivers/accel/ivpu/ivpu_gem.c         |  753 +++++++++++++++++
>  drivers/accel/ivpu/ivpu_gem.h         |  127 +++
>  drivers/accel/ivpu/ivpu_hw.h          |  170 ++++
>  drivers/accel/ivpu/ivpu_hw_mtl.c      | 1084 +++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_hw_mtl_reg.h  |  280 +++++++
>  drivers/accel/ivpu/ivpu_hw_reg_io.h   |  115 +++
>  drivers/accel/ivpu/ivpu_ipc.c         |  510 ++++++++++++
>  drivers/accel/ivpu/ivpu_ipc.h         |   93 +++
>  drivers/accel/ivpu/ivpu_job.c         |  614 ++++++++++++++
>  drivers/accel/ivpu/ivpu_job.h         |   67 ++
>  drivers/accel/ivpu/ivpu_jsm_msg.c     |  169 ++++
>  drivers/accel/ivpu/ivpu_jsm_msg.h     |   23 +
>  drivers/accel/ivpu/ivpu_mmu.c         |  883 ++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_mmu.h         |   50 ++
>  drivers/accel/ivpu/ivpu_mmu_context.c |  398 +++++++++
>  drivers/accel/ivpu/ivpu_mmu_context.h |   50 ++
>  drivers/accel/ivpu/ivpu_pm.c          |  329 ++++++++
>  drivers/accel/ivpu/ivpu_pm.h          |   38 +
>  drivers/accel/ivpu/vpu_boot_api.h     |  349 ++++++++
>  drivers/accel/ivpu/vpu_jsm_api.h      |  999 +++++++++++++++++++++++
>  include/uapi/drm/ivpu_accel.h         |  306 +++++++
>  32 files changed, 8769 insertions(+)
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
> --
> 2.34.1

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
