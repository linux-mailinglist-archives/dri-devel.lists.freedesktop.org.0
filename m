Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3934118D3F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 17:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E461F6E12A;
	Tue, 10 Dec 2019 16:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BED6E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 16:08:08 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id t12so13402054vso.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rd/M1jiw0bt7SsTtI3ZjdMOpbgNyyyrt/v3LP3zJjyA=;
 b=LXhUHm6ees0V0daVV3GQg9YAcoUDnJGJR5XPnfgQTLm7CmZ0Okb7xp1ztsvHD7ZbIv
 ExwTnZquC2H2l8T0Am5u0xrerj9gjBxgEcYku5ZL2brd0iY3ErVBqq3K7+tErHtH/n+8
 YOxAcV64D4NP87dYnMko+2GcXDHaGESpDGDsyn15tyiyFgNyQt5jb2qvECazs3RC8ITr
 f8JhZe414FVdLb2sU00OqyPe+TM3vNpwgsBgDWzN43Lb1Bqj9gnqR0Xn+zEo5A/dhz4m
 V/l8DQJaaBTQFmnFWE0rZGFkeTbOdTky8VSpJKeF04+15zWxiJrNdxIlIQmFKeHieKm4
 SrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rd/M1jiw0bt7SsTtI3ZjdMOpbgNyyyrt/v3LP3zJjyA=;
 b=S/CXoosMu1ZMNqY+EftvMSO3RpDGgMKGaTY4cw8jheIst+YKBm/dt16HECin4zy0gG
 q+7Q0KB6nyy/n+D+f5X+R+2vmSnltkZyUm28lrR9Kq+l3d8Tym0YoPKnBlW9VpZj4Crb
 YVVomV+tA8YiogaN99KYZbJF0utRDmU3/eWQTtS/11E1MUuazCZN/qQFFzBrGobkEWsH
 dpqaLufx7/OlfksXKYRnE+Mua2HlLr7vIU1B05nPEPSusupYZafq1XIWXrz+lztx+Q/J
 MR564+MDSjGsKP8F5om76P8vUZOpcGmwIH0KSEQaRfk7b6vfBx6srZY0DhzYnrs80fbN
 zz1A==
X-Gm-Message-State: APjAAAVWx2vU10wBWkPALgEXphT7FVS/z4gGzl2fGx/x+Z5pPybt5Udr
 1EgAqr7a7uEOS6xF6W1jH9U4Fnx3/XF6wEGDB0U=
X-Google-Smtp-Source: APXvYqzXUcVL7ay7dzMEdK34LEth1oxt2wC88iEyUDWeYkDCjpAhFxfaBz0vmF+f9wnrE9NhZohviL0n9DQi6jo5fz4=
X-Received: by 2002:a67:e205:: with SMTP id g5mr16607588vsa.186.1575994087596; 
 Tue, 10 Dec 2019 08:08:07 -0800 (PST)
MIME-Version: 1.0
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 10 Dec 2019 16:06:53 +0000
Message-ID: <CACvgo50K=43OHW33i8ZsMG3QvuVxLZSo0iBMSt0Z-X4N2eTObw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/8] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: baolin.wang@linaro.org, David Airlie <airlied@linux.ie>,
 zhang.lyra@gmail.com,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Welcome to DRM Kevin,

On Tue, 10 Dec 2019 at 08:40, Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> From: Kevin Tang <kevin.tang@unisoc.com>
>
> Adds drm support for the Unisoc's display subsystem.
>
> This is drm device and gem driver. This driver provides support for the
> Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>
Did you use XFree86 or Xorg to test this? The XFree86 codebase have been
missing for years.

Out of curiosity - did you try any Wayland, or bare-metal compositor?

>  source "drivers/gpu/drm/mcde/Kconfig"
>
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
>
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 9f1c7c4..85ca211 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  += lima/
>  obj-$(CONFIG_DRM_PANFROST) += panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
> +obj-$(CONFIG_DRM_SPRD) += sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 0000000..79f286b
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,14 @@
> +config DRM_SPRD
> +       tristate "DRM Support for Unisoc SoCs Platform"
> +       depends on ARCH_SPRD
> +       depends on DRM && OF
> +       select DRM_KMS_HELPER
> +       select DRM_GEM_CMA_HELPER
> +       select DRM_KMS_CMA_HELPER
> +       select DRM_MIPI_DSI
> +       select DRM_PANEL
> +       select VIDEOMODE_HELPERS
> +       select BACKLIGHT_CLASS_DEVICE
> +       help
> +         Choose this option if you have a Unisoc chipsets.
s/chipsets/chipset/ ?


> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-y += -Iinclude/drm
> +
> +subdir-ccflags-y += -I$(src)
> +
I think we can drop the includes here, unless there's a specific error
message that you're setting.


> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c

> +#define DRIVER_NAME    "sprd"
> +#define DRIVER_DESC    "Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE    "20180501"
The date is mostly for cosmetic purposes. Yet we're nearly 2020 and
this reads 2018 - update?

<snip>

> +static struct drm_driver sprd_drm_drv = {
> +       .driver_features        = DRIVER_GEM | DRIVER_MODESET |
> +                                 DRIVER_ATOMIC | DRIVER_HAVE_IRQ,
There is no modeset exposed by the driver, let alone an atomic one.

Thus I would drop the following code from this patch and add it with a
patch that uses it.
 - tokens - DRIVER_MODESET, DRIVER_ATOMIC)
 - no-op modeset/atomic functions just above, and
 - vblank/kms code (further down) in bind/unbind


<snip>

> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +
> +       ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
> +       if (ret)
> +               DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
> +
Is the hardware going to work correctly the dma call fails? Should we
use "return ret;" here?

> +       return sprd_drm_component_probe(&pdev->dev, &sprd_drm_component_ops);
> +}
> +
> +static int sprd_drm_remove(struct platform_device *pdev)
> +{
> +       component_master_del(&pdev->dev, &sprd_drm_component_ops);
> +       return 0;
> +}
> +
> +static void sprd_drm_shutdown(struct platform_device *pdev)
> +{
> +       struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +       if (!drm) {
Can this happen in reality?

<snip>

> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef _SPRD_DRM_H_
> +#define _SPRD_DRM_H_
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_print.h>
> +
> +struct sprd_drm {
> +       struct drm_device *drm;

> +       struct drm_atomic_state *state;
> +       struct device *dpu_dev;
> +       struct device *gsp_dev;
These three are unused. Please add alongside the code which is using them.


> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_gem.c

As Thomas pointed out, this is effectively a copy of drm_gem_cma_helper.c
Please drop this file and use the respective CMA functions, instead.


> diff --git a/drivers/gpu/drm/sprd/sprd_gem.h b/drivers/gpu/drm/sprd/sprd_gem.h
> new file mode 100644
> index 0000000..4c10d8a
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_gem.h
Just like the C file - this is effectively a copy of the existing CMA codebase.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
