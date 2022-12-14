Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D109664CBB6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D151C10E411;
	Wed, 14 Dec 2022 13:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DA210E028
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 13:58:22 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id y135so21447638yby.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gu+mZ7KeWNoHK7/r3i3q1sWuqvAKTUPXFuQ+g+cEmYE=;
 b=fcCZiCGXJWIpxVDzqwiTYcWDIa6zVIvMXvU/82X8hb8M6cEo1GQxIe39p7UyXfwwWT
 xClQ/CJVaY5UKQJ1TpOI1sxF+00XmRCzzDDaQ0L5nTqkMIfR+d27SXGDmrb+h9zpcyAg
 jLpYWpMe4qGdXf1j2ae1Jjyk77zM3uwi50b+KFvtNvA1exmydH5fmpOkuTp4gYinmEGe
 aasMoJtmCju0eHZ2meyM9OETb7UBkM15dj6ge0QljEuuRl9oVodqpQS6mDd5wDgrVjul
 AuYQyEEvOENZE7isRAhpQXS1DjO1K5n42jd/EAA8r+MgcGyNda7xtVbgdfynPKO9g1nl
 MX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gu+mZ7KeWNoHK7/r3i3q1sWuqvAKTUPXFuQ+g+cEmYE=;
 b=ggE9Tk+hMBta4B+hc3cTi2ReXjHJWqCkdsYKWimmh6iuJbI5RLlF97ds14Tjc/wNC5
 suq7hn/fa4bNeniGoRWILx4I9wifuq0K+X6WcCNOq8bkxSeHEY8lhtpoLntli34mDHD7
 HGOj8uua2smNHTkxSrNt+S+n0t1ybAkIMUDAu2zWwA9WYeqqkboXBI5EAfJVcS0ZOn1w
 catjAqCriuYR84Ym8uqBlcbMtHKgZz/qi5lJMjNdhDJRWmDo245oRFG4ZGLRgBSoZlWe
 PSWERMBSe7GVNeXU1apyy5RL4I+s8wmfmQdfLuGV34p3ULWR53E8VyB8g75cV3SwvpHo
 N8qQ==
X-Gm-Message-State: ANoB5pnnsrPGyUTIpcWxBx0Gf6Rcnyi6PoE79pBCZIf6OGDI1Hh/uaOQ
 XrBN3gOZXUCOXuBXF7CE8r7UXTryRb/7H5ImA6k=
X-Google-Smtp-Source: AA0mqf7jLhSTVS+fvss1sMJkKq9s/6bAyhCm729tc+gBpGG3BrMan+L1DVTZrZKbO5tUY/PPolo3dIl54GLllRgJ5pk=
X-Received: by 2002:a5b:650:0:b0:70b:87c6:4fe with SMTP id
 o16-20020a5b0650000000b0070b87c604femr7032017ybq.550.1671026301077; 
 Wed, 14 Dec 2022 05:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
In-Reply-To: <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 14 Dec 2022 15:57:54 +0200
Message-ID: <CAFCwf12MLFaVU_GsxA_=ko_YMGEjDZbvTSGL=ueiq3=XMT61og@mail.gmail.com>
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
> +
> +static inline int ivpu_hw_info_init(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->info_init(vdev);
> +};
> +
> +static inline int ivpu_hw_power_up(struct ivpu_device *vdev)
> +{
> +       ivpu_dbg(vdev, PM, "HW power up\n");
> +
> +       return vdev->hw->ops->power_up(vdev);
> +};
> +
> +static inline int ivpu_hw_boot_fw(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->boot_fw(vdev);
> +};
> +
> +static inline bool ivpu_hw_is_idle(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->is_idle(vdev);
> +};
> +
> +static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
> +{
> +       ivpu_dbg(vdev, PM, "HW power down\n");
> +
> +       return vdev->hw->ops->power_down(vdev);
> +};
> +
> +static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
> +{
> +       vdev->hw->ops->wdt_disable(vdev);
> +};
> +
> +/* Register indirect accesses */
> +static inline u32 ivpu_hw_reg_pll_freq_get(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->reg_pll_freq_get(vdev);
> +};
> +
> +static inline u32 ivpu_hw_reg_telemetry_offset_get(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->reg_telemetry_offset_get(vdev);
> +};
> +
> +static inline u32 ivpu_hw_reg_telemetry_size_get(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->reg_telemetry_size_get(vdev);
> +};
> +
> +static inline u32 ivpu_hw_reg_telemetry_enable_get(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->reg_telemetry_enable_get(vdev);
> +};
> +
> +static inline void ivpu_hw_reg_db_set(struct ivpu_device *vdev, u32 db_id)
> +{
> +       vdev->hw->ops->reg_db_set(vdev, db_id);
> +};
> +
> +static inline u32 ivpu_hw_reg_ipc_rx_addr_get(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->reg_ipc_rx_addr_get(vdev);
> +};
> +
> +static inline u32 ivpu_hw_reg_ipc_rx_count_get(struct ivpu_device *vdev)
> +{
> +       return vdev->hw->ops->reg_ipc_rx_count_get(vdev);
> +};
> +
> +static inline void ivpu_hw_reg_ipc_tx_set(struct ivpu_device *vdev, u32 vpu_addr)
> +{
> +       vdev->hw->ops->reg_ipc_tx_set(vdev, vpu_addr);
> +};
> +
> +static inline void ivpu_hw_irq_clear(struct ivpu_device *vdev)
> +{
> +       vdev->hw->ops->irq_clear(vdev);
> +};
> +
> +static inline void ivpu_hw_irq_enable(struct ivpu_device *vdev)
> +{
> +       vdev->hw->ops->irq_enable(vdev);
> +};
> +
> +static inline void ivpu_hw_irq_disable(struct ivpu_device *vdev)
> +{
> +       vdev->hw->ops->irq_disable(vdev);
> +};
Why hide all the calls to the hw ops functions inside inline functions ?
I mean, it just makes it one step longer to read the code...
Why not directly call vdev->hw->ops->operation ?

> diff --git a/include/uapi/drm/ivpu_drm.h b/include/uapi/drm/ivpu_drm.h
> new file mode 100644
> index 000000000000..922cbf30ce34
> --- /dev/null
> +++ b/include/uapi/drm/ivpu_drm.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2020-2022 Intel Corporation
> + */
> +
> +#ifndef __UAPI_IVPU_DRM_H__
> +#define __UAPI_IVPU_DRM_H__
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +#define DRM_IVPU_DRIVER_MAJOR 1
> +#define DRM_IVPU_DRIVER_MINOR 0
I would prefer not to define versions for the driver. Don't get in
this trap of trying to keep a version
number updated over time.  It breaks down the moment you get the code
merged into the kernel tree as the driver is what is in the kernel, not
separate from it.

Also think of the stable kernels, you will backport fixes to those for
the driver as part of the development process.  So what "version" are
they now?  They are some mis-match of the old one with new fixes, and as
such, the version number now means nothing.

Just stick to the version number of the kernel itself, that's the only
sane way.

btw, I talked to Daniel about this and he told me this
major/minor/patchlevel is legacy in drm and should be deprecated, so
I'm going to send a patch to document that it is deprecated and how to
use getcap ioctl to find out the features the driver support.

Thanks,
Oded
