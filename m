Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F764CF53
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE28E10E440;
	Wed, 14 Dec 2022 18:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2186F10E440
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 18:22:25 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3b56782b3f6so8551187b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j3+GTwYDWJ/3PlfYsimRgmW2ke2rIT/TCuBtafZoMY0=;
 b=MsC5m3WitBCZJocyzada5dOoFNtW05MxUn9oID62vLI0Oz0ZEQx78Izt+1gL+QF28X
 lrFIcriL0xlGLxvNDviNyGNAXL2IDJ5/u/6KYcYbbcZAxEV+F5XlqXEarmuLNymqyMGz
 AwafRX2jPuP8IGKUff7x/x4kcdyDihdvjLJcA+DCFS50OgUco9o9LqwLllv3PEUn7E4X
 jwbS6A+3icoQzfdi3DjLtY+B10f0zgHbkWnqaYqXVu9/okiEScnU7K8Az7yVJG4qDEOW
 VNEl9eMIIL2soTK7MLDDjo2I9XjiYBrn0ANqsOtQcnwvTtqwoJnxofNKV1DiL/TlPALf
 9i2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j3+GTwYDWJ/3PlfYsimRgmW2ke2rIT/TCuBtafZoMY0=;
 b=V4FOeLg/giagU1GS0nXd9uygk6aQqsrhW44kLMjIQoSQ73yILvlGXlqEsCkZdsvf21
 VpzB4IYqBBShlSWx7D95SW79MzLJSOnevIkdtS6TG3+K0kHLp34kqR6wW7vV1a2eF0f6
 aJUCKYwYFWH1Ft6Q/uikZksB83Si5PSVKCs3MawqvTfoU5iosUCkX8ZVCFTz31DwbUgH
 Y+JUIxioTgBXj1LTHx4bKCMsybgLS8pidKACbpsdta6VA01zhC8CAWEd4hqW44znmk4g
 +h/JjyVftACtzJ9qpajXPfIwEochaF6tJWa6kXe1h5t/w4SNQarzYHwFa3tFly+0BIqc
 6EgA==
X-Gm-Message-State: ANoB5pnc8+/eJkMevp1WBCbbFsFTaewCirqYyWhfYUYWSUfVkostXgWg
 yrre2tnl5W2GAJTZLkyLG17BTq2gCPTE2wl7wII=
X-Google-Smtp-Source: AA0mqf6j9qbfVa9sBQFMYC4EyrWavEkdG7h4qFUCt0QtxwxatNXkDU5Ox0f4bkdDrDDvZUDLZbU/yc4CLNDJPOYARVg=
X-Received: by 2002:a0d:f7c4:0:b0:370:2d8c:8193 with SMTP id
 h187-20020a0df7c4000000b003702d8c8193mr7916134ywf.221.1671042144145; Wed, 14
 Dec 2022 10:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf12MLFaVU_GsxA_=ko_YMGEjDZbvTSGL=ueiq3=XMT61og@mail.gmail.com>
 <d7ab7c6b-cbeb-b140-ac7a-0209fa627308@quicinc.com>
In-Reply-To: <d7ab7c6b-cbeb-b140-ac7a-0209fa627308@quicinc.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 14 Dec 2022 20:21:57 +0200
Message-ID: <CAFCwf12owW9r6ePPEcTxAt_W1H3UW35gpM-r0KqGrMSDUQs9uw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 stanislaw.gruszka@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 5:07 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 12/14/2022 6:57 AM, Oded Gabbay wrote:
> > On Thu, Dec 8, 2022 at 1:08 PM Jacek Lawrynowicz
> > <jacek.lawrynowicz@linux.intel.com> wrote:
> >> +
> >> +static inline int ivpu_hw_info_init(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->info_init(vdev);
> >> +};
> >> +
> >> +static inline int ivpu_hw_power_up(struct ivpu_device *vdev)
> >> +{
> >> +       ivpu_dbg(vdev, PM, "HW power up\n");
> >> +
> >> +       return vdev->hw->ops->power_up(vdev);
> >> +};
> >> +
> >> +static inline int ivpu_hw_boot_fw(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->boot_fw(vdev);
> >> +};
> >> +
> >> +static inline bool ivpu_hw_is_idle(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->is_idle(vdev);
> >> +};
> >> +
> >> +static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
> >> +{
> >> +       ivpu_dbg(vdev, PM, "HW power down\n");
> >> +
> >> +       return vdev->hw->ops->power_down(vdev);
> >> +};
> >> +
> >> +static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
> >> +{
> >> +       vdev->hw->ops->wdt_disable(vdev);
> >> +};
> >> +
> >> +/* Register indirect accesses */
> >> +static inline u32 ivpu_hw_reg_pll_freq_get(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->reg_pll_freq_get(vdev);
> >> +};
> >> +
> >> +static inline u32 ivpu_hw_reg_telemetry_offset_get(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->reg_telemetry_offset_get(vdev);
> >> +};
> >> +
> >> +static inline u32 ivpu_hw_reg_telemetry_size_get(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->reg_telemetry_size_get(vdev);
> >> +};
> >> +
> >> +static inline u32 ivpu_hw_reg_telemetry_enable_get(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->reg_telemetry_enable_get(vdev);
> >> +};
> >> +
> >> +static inline void ivpu_hw_reg_db_set(struct ivpu_device *vdev, u32 db_id)
> >> +{
> >> +       vdev->hw->ops->reg_db_set(vdev, db_id);
> >> +};
> >> +
> >> +static inline u32 ivpu_hw_reg_ipc_rx_addr_get(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->reg_ipc_rx_addr_get(vdev);
> >> +};
> >> +
> >> +static inline u32 ivpu_hw_reg_ipc_rx_count_get(struct ivpu_device *vdev)
> >> +{
> >> +       return vdev->hw->ops->reg_ipc_rx_count_get(vdev);
> >> +};
> >> +
> >> +static inline void ivpu_hw_reg_ipc_tx_set(struct ivpu_device *vdev, u32 vpu_addr)
> >> +{
> >> +       vdev->hw->ops->reg_ipc_tx_set(vdev, vpu_addr);
> >> +};
> >> +
> >> +static inline void ivpu_hw_irq_clear(struct ivpu_device *vdev)
> >> +{
> >> +       vdev->hw->ops->irq_clear(vdev);
> >> +};
> >> +
> >> +static inline void ivpu_hw_irq_enable(struct ivpu_device *vdev)
> >> +{
> >> +       vdev->hw->ops->irq_enable(vdev);
> >> +};
> >> +
> >> +static inline void ivpu_hw_irq_disable(struct ivpu_device *vdev)
> >> +{
> >> +       vdev->hw->ops->irq_disable(vdev);
> >> +};
> > Why hide all the calls to the hw ops functions inside inline functions ?
> > I mean, it just makes it one step longer to read the code...
> > Why not directly call vdev->hw->ops->operation ?
> >
> >> diff --git a/include/uapi/drm/ivpu_drm.h b/include/uapi/drm/ivpu_drm.h
> >> new file mode 100644
> >> index 000000000000..922cbf30ce34
> >> --- /dev/null
> >> +++ b/include/uapi/drm/ivpu_drm.h
> >> @@ -0,0 +1,95 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (C) 2020-2022 Intel Corporation
> >> + */
> >> +
> >> +#ifndef __UAPI_IVPU_DRM_H__
> >> +#define __UAPI_IVPU_DRM_H__
> >> +
> >> +#include "drm.h"
> >> +
> >> +#if defined(__cplusplus)
> >> +extern "C" {
> >> +#endif
> >> +
> >> +#define DRM_IVPU_DRIVER_MAJOR 1
> >> +#define DRM_IVPU_DRIVER_MINOR 0
> > I would prefer not to define versions for the driver. Don't get in
> > this trap of trying to keep a version
> > number updated over time.  It breaks down the moment you get the code
> > merged into the kernel tree as the driver is what is in the kernel, not
> > separate from it.
> >
> > Also think of the stable kernels, you will backport fixes to those for
> > the driver as part of the development process.  So what "version" are
> > they now?  They are some mis-match of the old one with new fixes, and as
> > such, the version number now means nothing.
> >
> > Just stick to the version number of the kernel itself, that's the only
> > sane way.
>
> This seems to assume that the user is running whole kernels and not a
> backport of the driver (similar to the backports project that is popular
> with net).
That's what the kernel upstream community usually assumes ;)
>
> Lets assume this gets merged into 6.3.  End user is on say Ubuntu 20.04
> which GA'd with a 5.4 kernel and is maintaining that.  Intel here
> backports the 6.3 driver to 5.4 to support this end user and tries to do
> the "right thing" by using the upstream code instead of some downstream
> fork.  Now the kernel version is meaningless because 5.4 never had this
If you use some kind of get_cap ioctl in your driver, your userspace
can inquire about supported features, without need for driver version.
This can also allow you to take-out certain features from specific versions.

> driver.  Of course if the user reports an issue to Intel, it would be
> handy to know exactly what version of the driver the user has.
Assuming you install your driver as out-of-tree, you could keep
numbering in the dkms package.

>
> The src version hash that modinfo provides is meaningless because it
> changes based on the entirety of the build, which includes things like
> the compiler used.
>
> If there is an alternative solution for this, I'd love to hear it.
What I said above.
Having said that, I'm not going to insist on this, it's bike-shedding
