Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3C67342B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 10:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CC410E8ED;
	Thu, 19 Jan 2023 09:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AD510E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:07:13 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id mg12so3913630ejc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9IunT9nvfaAxSpvtIIUZcx1+8Qsc1iVgEmknoL+26Z0=;
 b=iPnOSELPUqrKV1n1uSbVEHSnbndAILRLuq4Op5CZKWN3h56zSAQtAkZO3kY5KinDd0
 7EilTGQ9iBkRImOk2boFrw9Pwp0cv2/hUsQpk9nsKAQdDcadFGFc7IBrxfpsBK3ZGGv5
 wxd8QpB8og+d+iYDhcGc+K0R3XH32H9h74l8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9IunT9nvfaAxSpvtIIUZcx1+8Qsc1iVgEmknoL+26Z0=;
 b=pM+JaOJD1QpNESv0l4zZo/Z96R7qVVAO4XiDgV3jHqekfc3Xy6m09h0gVvvR3c3Gp3
 zOc8kpCL/YzwTQUvgotwrsGoqsJgTbzrQltcJ7oL6McsfKf13JmmT8euESMGkOhgzX+0
 P8nOYuGCvRG/0M/k00GuORIoWHdpGRzGXpNC3FRydYdV+3VjG1aXS4d8J9/6ebOFjM5W
 zzDgdlHEz2yVJ6pnxSO61b1GRTze9ftXAKQO7Xqk6aal5aJXcT1NqXssS5WjFMjLQdrY
 Dd7pA3+LpaWTzg0nCoTqyDo/VjJsMnN1pXe/94kbBcBDa7DanQ2Njm0PNKOiYkaPuLFy
 6BYw==
X-Gm-Message-State: AFqh2krcYT8E2+TfwqjOoDfFs/88HwhlBqcfnEGJxXxm8rT6VAYmr9Sa
 BtSjJ7+J34N5uZ8d/XeT1GVCowZ5S17mQqx2
X-Google-Smtp-Source: AMrXdXugomwVRY5cQ2Pw96i8hxQhmVPydc+CiqSS+3T0ohv+Uiw25OZvFms08Lw/HhFZFWwH3gECWA==
X-Received: by 2002:a17:907:c70f:b0:871:d04e:1df with SMTP id
 ty15-20020a170907c70f00b00871d04e01dfmr11039768ejc.29.1674119232432; 
 Thu, 19 Jan 2023 01:07:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170906538c00b00869f2ca6a87sm8179372ejo.135.2023.01.19.01.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 01:07:11 -0800 (PST)
Date: Thu, 19 Jan 2023 10:07:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v5 0/7] New DRM accel driver for Intel VPU
Message-ID: <Y8kIPSNus5fcmJmd@phenom.ffwll.local>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf12AT4qwdHhKpqYhYCpRKvfbjximF7V-frWedUU0=VvFbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf12AT4qwdHhKpqYhYCpRKvfbjximF7V-frWedUU0=VvFbg@mail.gmail.com>
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
Cc: quic_jhugo@quicinc.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, stanislaw.gruszka@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 09:34:00PM +0200, Oded Gabbay wrote:
> On Mon, Jan 9, 2023 at 2:23 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
> >
> > Hi,
> >
> > This patchset contains a new Linux* Kernel Driver for Intel® VPUs.
> >
> > VPU stands for Versatile Processing Unit and it is an AI inference accelerator
> > integrated with Intel non-server CPUs starting from 14th generation.
> > VPU enables efficient execution of Deep Learning applications
> > like object detection, classification etc.
> >
> > The whole driver is licensed under GPL-2.0-only except for two headers imported
> > from the firmware that are MIT licensed.
> >
> > User mode driver was open sourced in December 2022 and it is available at:
> > https://github.com/intel/linux-vpu-driver
> >
> > The firmware for the VPU will be distributed as a closed source binary.
> >
> > There are no major chcnages in this version of the patchset.
> > Detailed changes are listed below.
> >
> > Regards,
> > Jacek
> 
> Hi Jacek,
> For patches 1-4 and 6 (assuming you fix the small issue in patch 3) you can add
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> 
> For patch 5 I had a comment/question, please reply to it. Once we sort
> that thing that patch is also r-b by me.
> 
> Patch 7 - I prefer someone else who knows about PM to look at it. In
> habana we don't support power management (in the driver) so I have
> never dealt with that and therefore I have no idea if you use the kapi
> correctly.

Usually the hard part is deadlocks between runtime_resume calls and the
rpm suspend callback. I'm not sure whether lockdep catches these I'm not
sure whether lockdep catches these.

From a very quick look it looks reasonable.
-Daniel

> 
> Thanks,
> Oded
> 
> 
> >
> > Changelog
> >
> > v5:
> > - Rename ivpu_drm.h to ivpu_accel.h
> > - Cleanup ivpu_mmu_config_check()
> > - Optimize locking in ivpu_mmu_cd_add()
> > - Invalidate user context if it has MMU faults
> > - Move ivpu_ipc_match_consumer() outside ivpu_ipc_dispatch()
> >
> > v4: https://lore.kernel.org/all/20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com/
> > - Switch to the accel framework (DRIVER_COMPUTE_ACCEL)
> > - Move the driver from drivers/gpu/drm to drivers/accel
> > - Rename kconfig DRM_IVPU option to DRM_ACCEL_IVPU and update dependencies
> > - Create context on open() instead of lazy allocating it
> > - Remove status_offset from submit ioctl, as status is now reported in bo_wait ioctl
> > - Use managed resources in ivpu_drv.c
> > - Optimize locking in ivpu_ipc.c - add new rx_msg_lock for consumer msg list
> > - Refactor vpu_hw_mtl_reg.h to use BIT_MASK() and GENMASK() macros
> > - Use module_pci_driver() for mudule init
> > - Remove mutex from "struct ivpu_pm_info"
> > - Add explicit "vdev" arg to ivpu_dbg()
> > - Use drm_WARN_ON() instead of WARN_ON() where possible
> > - Add comments for boot related functions
> > - Update firmware API headers
> >
> > v3: https://lore.kernel.org/all/20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com/
> > - Fixed alignment warning in ivpu_ipc.c when building with W=1
> >
> > v2: https://lore.kernel.org/all/20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com/
> > - Rename the driver from "drm/vpu" to "drm/ivpu"
> > - Add a TODO file
> > - Add support for WC buffers
> >
> > v1: https://lore.kernel.org/all/20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com/
> >
> > Jacek Lawrynowicz (7):
> >   accel/ivpu: Introduce a new DRM driver for Intel VPU
> >   accel/ivpu: Add Intel VPU MMU support
> >   accel/ivpu: Add GEM buffer object management
> >   accel/ivpu: Add IPC driver and JSM messages
> >   accel/ivpu: Implement firmware parsing and booting
> >   accel/ivpu: Add command buffer submission logic
> >   accel/ivpu: Add PM support
> >
> >  MAINTAINERS                           |    9 +
> >  drivers/Makefile                      |    1 +
> >  drivers/accel/Kconfig                 |    2 +
> >  drivers/accel/Makefile                |    3 +
> >  drivers/accel/ivpu/Kconfig            |   15 +
> >  drivers/accel/ivpu/Makefile           |   16 +
> >  drivers/accel/ivpu/TODO               |    9 +
> >  drivers/accel/ivpu/ivpu_drv.c         |  661 +++++++++++++++
> >  drivers/accel/ivpu/ivpu_drv.h         |  190 +++++
> >  drivers/accel/ivpu/ivpu_fw.c          |  423 ++++++++++
> >  drivers/accel/ivpu/ivpu_fw.h          |   38 +
> >  drivers/accel/ivpu/ivpu_gem.c         |  846 +++++++++++++++++++
> >  drivers/accel/ivpu/ivpu_gem.h         |  129 +++
> >  drivers/accel/ivpu/ivpu_hw.h          |  170 ++++
> >  drivers/accel/ivpu/ivpu_hw_mtl.c      | 1084 +++++++++++++++++++++++++
> >  drivers/accel/ivpu/ivpu_hw_mtl_reg.h  |  280 +++++++
> >  drivers/accel/ivpu/ivpu_hw_reg_io.h   |  115 +++
> >  drivers/accel/ivpu/ivpu_ipc.c         |  508 ++++++++++++
> >  drivers/accel/ivpu/ivpu_ipc.h         |   93 +++
> >  drivers/accel/ivpu/ivpu_job.c         |  614 ++++++++++++++
> >  drivers/accel/ivpu/ivpu_job.h         |   67 ++
> >  drivers/accel/ivpu/ivpu_jsm_msg.c     |  170 ++++
> >  drivers/accel/ivpu/ivpu_jsm_msg.h     |   23 +
> >  drivers/accel/ivpu/ivpu_mmu.c         |  883 ++++++++++++++++++++
> >  drivers/accel/ivpu/ivpu_mmu.h         |   50 ++
> >  drivers/accel/ivpu/ivpu_mmu_context.c |  398 +++++++++
> >  drivers/accel/ivpu/ivpu_mmu_context.h |   50 ++
> >  drivers/accel/ivpu/ivpu_pm.c          |  329 ++++++++
> >  drivers/accel/ivpu/ivpu_pm.h          |   38 +
> >  drivers/accel/ivpu/vpu_boot_api.h     |  349 ++++++++
> >  drivers/accel/ivpu/vpu_jsm_api.h      |  999 +++++++++++++++++++++++
> >  include/uapi/drm/ivpu_accel.h         |  339 ++++++++
> >  32 files changed, 8901 insertions(+)
> >  create mode 100644 drivers/accel/Makefile
> >  create mode 100644 drivers/accel/ivpu/Kconfig
> >  create mode 100644 drivers/accel/ivpu/Makefile
> >  create mode 100644 drivers/accel/ivpu/TODO
> >  create mode 100644 drivers/accel/ivpu/ivpu_drv.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_drv.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_fw.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_fw.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_gem.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_gem.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_hw.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl_reg.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_hw_reg_io.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_ipc.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_ipc.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_job.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_job.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_mmu.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_mmu.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.h
> >  create mode 100644 drivers/accel/ivpu/ivpu_pm.c
> >  create mode 100644 drivers/accel/ivpu/ivpu_pm.h
> >  create mode 100644 drivers/accel/ivpu/vpu_boot_api.h
> >  create mode 100644 drivers/accel/ivpu/vpu_jsm_api.h
> >  create mode 100644 include/uapi/drm/ivpu_accel.h
> >
> >
> > base-commit: 03a0a1040895711e12c15ab28d4d1812928e171d
> > prerequisite-patch-id: 1283b537f4791511769ad3446d0eafd98193e86f
> > --
> > 2.34.1

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
