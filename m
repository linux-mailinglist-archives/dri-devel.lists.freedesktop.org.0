Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBFD6527BD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 21:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0714C10E0A2;
	Tue, 20 Dec 2022 20:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DC110E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:17:57 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-417b63464c6so184796697b3.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NHzBJXbgIWw/wWGcHWdSF0SI5gbhzr3z7NYF6z705+Q=;
 b=mKRgZwlk6YDF1Zou3644SGhbWs9JmpVp9Jsp7DutqMWVhTZEgjma0xII0rCXoyasGi
 cz9tbJJ+h8EPTR9Dh9i8AklCWptFIS2psS9onmddyAQJsjAOHaKyCEMfNxUTMm0y8VF3
 0mEbhND3IXgExOarDvETsqjXoqtTqefLJMVqwwZ1aWJlwE1pRwPjhvbORhUfYurPpL6f
 a2EIpINXuLRBYypguGCpWvUNBrIEAdZUxa6g6xHlQ6Wjy6D2Mh3OPlftU7il6FQhD2Ut
 0pozGPiNFFf/IUYHB9Wz0rRLAX8taVBqQPai70TX8Dw9KjU10lLzZ3Pg5pwRqtam/qD4
 hXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NHzBJXbgIWw/wWGcHWdSF0SI5gbhzr3z7NYF6z705+Q=;
 b=0imjOZcgqXw4PtjHEwMFeni+EG7n0piRLJiwICm+TNEWsTNMEB3gGXbeq9jOM61axY
 N/kJrLgDA+W42YJLakx5+1X1fXabJJ1wUiz2hc84mBB24K1myJbXWUTfywcacZaPvWDz
 4pjmTVCVFN4q0bTiqUUP3zf3qKUMQZT9wHKjKEf5U3umbGuOfJGDDN6HZ71tF+uXwmPc
 eWUfq4LxR4mX1HiIY7IB43sRS5yNuzGZU4Hm9z7DLvAkZmtwC6pD/fbcLfL5O1qQ4lk/
 Trp9XptJ54DaiPLiT4tJzgP844aIgnCa8TnT8WthLJbCaDr46x9vI+ccp8NAMNj+MlUD
 Fl+Q==
X-Gm-Message-State: ANoB5pmUBjCtgb1KyNPnymsb7wK/zk5CvTE6wp4IwCoIS5rplK5WVSmC
 M4Tv3el1PUhTYMOOtfG/kaHngXTe9HIONO3GuOY=
X-Google-Smtp-Source: AA0mqf7umUIWnS3c1ltu5P0I295JmbxA1jmdnUgLK+6KF9Fkg1thN5+uRyxmIGbhJ/HgdLlvF/YedPOfU5PVZjiQ35Y=
X-Received: by 2002:a0d:f7c4:0:b0:370:2d8c:8193 with SMTP id
 h187-20020a0df7c4000000b003702d8c8193mr9873106ywf.221.1671567476598; Tue, 20
 Dec 2022 12:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
In-Reply-To: <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 20 Dec 2022 22:17:30 +0200
Message-ID: <CAFCwf12rtUk2qEMRS-awzEzX=eKL8+8v79b7sS_s8pTwetn2SA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 stanislaw.gruszka@linux.intel.com, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 8, 2022 at 1:08 PM Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> VPU stands for Versatile Processing Unit and it's a CPU-integrated
> inference accelerator for Computer Vision and Deep Learning
> applications.
>
> The VPU device consist of following components:
>   - Buttress - provides CPU to VPU integration, interrupt, frequency and
>     power management.
>   - Memory Management Unit (based on ARM MMU-600) - translates VPU to
>     host DMA addresses, isolates user workloads.
>   - RISC based microcontroller - executes firmware that provides job
>     execution API for the kernel-mode driver
>   - Neural Compute Subsystem (NCS) - does the actual work, provides
>     Compute and Copy engines.
>   - Network on Chip (NoC) - network fabric connecting all the components
>
> This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
> client CPUs (14th generation).
>
> Module sources are at drivers/accel/ivpu and module name is
> "intel_vpu.ko".
>
> This patch includes only very besic functionality:
>   - module, PCI device and IRQ initialization
>   - register definitions and low level register manipulation functions
>   - SET/GET_PARAM ioctls
>   - power up without firmware
>
> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  MAINTAINERS                          |    9 +
>  drivers/Makefile                     |    1 +
>  drivers/accel/Kconfig                |    2 +
>  drivers/accel/Makefile               |    3 +
>  drivers/accel/ivpu/Kconfig           |   15 +
>  drivers/accel/ivpu/Makefile          |    8 +
>  drivers/accel/ivpu/TODO              |    7 +
>  drivers/accel/ivpu/ivpu_drv.c        |  359 +++++++++
>  drivers/accel/ivpu/ivpu_drv.h        |  162 ++++
>  drivers/accel/ivpu/ivpu_hw.h         |  170 +++++
>  drivers/accel/ivpu/ivpu_hw_mtl.c     | 1048 ++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_hw_mtl_reg.h |  280 +++++++
>  drivers/accel/ivpu/ivpu_hw_reg_io.h  |  115 +++
>  include/uapi/drm/ivpu_drm.h          |   95 +++
>  14 files changed, 2274 insertions(+)

Another thing I would like to ask you to do is to rename ivpu_drm.h to
ivpu_accel.h to make it clear this is an accel uapi file and not a
classic drm driver uapi file.
i.e. to make it clear it exposes the accel device char nodes, sysfs, etc.

But leave it in include/uapi/drm, because we might still need drm.h
down the road.

Thanks,
Oded
