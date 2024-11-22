Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52779D568D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 01:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625EB10E433;
	Fri, 22 Nov 2024 00:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IU9jlZcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922AA10E433
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 00:08:48 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f53973fdso1400680e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 16:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732234127; x=1732838927; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pb10zmYHQSv3I83zcr7E+6kREcna9ZYNd5sNu4/LV7s=;
 b=IU9jlZcXVXGlhdYYuT/5k2pSK8eWklwsEfdf43pofN/YotlIlbaJGHbKV3iCrwa6+8
 u299PNSA4ambO2FrwUlQ9+ZojgKv2N/ghRHCBdxlaftcIF81VT/z+e5eH9GTF8A8z3dq
 hKUX90mbH5vrHLXcnGsbBTMFEGdb/kUnpDd+lwBcehwGzEvgeoiQxh2vlwjouUYurYWY
 P6QAP9KDlWNwj3c8uCSI5yDP1S7iKWEUDWwh8f2pUQF0k7apGN6qpOJYD3gam0bhDRXo
 oky3W9t0/ejO7LgWPtG4eRZS6LAshECalkTjPb+75CkhIie7Im+gqZZbBq2FyV/1kNP1
 zP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732234127; x=1732838927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pb10zmYHQSv3I83zcr7E+6kREcna9ZYNd5sNu4/LV7s=;
 b=U+VTKUJIWy65vli+E3Fy8oSmSlCTx6FPHznQocV8Tc838LcR/PH2QyMfQq/iP2cG+L
 /SlRaKBR6OMgtD0vPLwTuC9wMao21lF7uKRQhaKEA5CRPNjdLSUHKAmZrtHL51wgAlzG
 2N4fYpP7cVFGmotnOtQZeyrN31TzT6EjtpcVG5HkwVfqYGwlyH95icS2C0aIKsiTnb9W
 BICa1FYyFCmKDuSty1bncCLNbpGG8VPhkwU/xINrHwoiJojg+zhrEyLnlynJ/H13Clho
 LZgI7IJviBvvkxRSva2TJgmtTkX1eHh7W2fiDXP9b4xHFEsyL51XsxLhI/P8ZMu5zPSG
 rAvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHN11ZhYmYcvIuvmMecJmS4chezDrpsSfZ4DiWFU0/zvazC9tDgzEh3MD/BUe8NpAp/cs485UldwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLvY0rOnwbVrWaQkxD7eNGoeRnX+FGjdwiv1wDbWUgnfqimp88
 hP4z7Y0xuBWPHZmkzteITwSPbEiUsjII+DhQe3HRo/8R4dQm1J56QF5G3rT9gsI=
X-Gm-Gg: ASbGncv8O1JW0ef/d5ZBJWLBacxVweeKwWY/ocKeaXUnYdQeq9DtoK6NB2vUMBnbi6V
 qOapExUs732j+ZmyvO4GmYmwM8NqMJZrxOMZStwz/y39DvUUhKThEH73RnbSnkXJ7RrGwFeXfJH
 51yY1HlzHqgwjOpmyHkCHW3PF2tjnytEB6gdMr5Siu2DPR2ZLQYY8FMCkVv3BD4sjmSW5JXaiOl
 qW+qJ+F6KOxhytzGuIwYe5V5LJ9YZIbCeT7LySlITMpH/m+JAyLJJ1wOKOFkpkkdW/9u51O1O4r
 0bvqMUhWwX+3BTTGiSAMdeUSpJgMaw==
X-Google-Smtp-Source: AGHT+IEuYo3TXwIBAta2+QFFKa258N+W0wLgiRkvqaQO6FoTfco4TU0xkpE/1Qfqy0nPr2pRscBPLQ==
X-Received: by 2002:a05:6512:2247:b0:53d:d06c:cdf8 with SMTP id
 2adb3069b0e04-53dd06ccfbamr1006096e87.1.1732234126460; 
 Thu, 21 Nov 2024 16:08:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2489841sm120742e87.178.2024.11.21.16.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 16:08:44 -0800 (PST)
Date: Fri, 22 Nov 2024 02:08:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] drm/vs: Add Base API for VS Mode Configuration
Message-ID: <6nztdhkgx5wm5byq46jbhivws4kvwpnmnc7r5jsqaqm5rlzb2k@dz7ohbcirnd4>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-6-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-6-keith.zhao@starfivetech.com>
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

On Wed, Nov 20, 2024 at 02:18:44PM +0800, keith zhao wrote:
> This commit adds a base API for configuring VS modes,
> which will streamline the setup and management of display modes
> in the VS DRM subsystem.
> 
> In this implementation, we are using drm_atomic_helper_commit_tail_rpm()
> instead of drm_atomic_helper_commit_tail() to ensure that
> we skip planes related to inactive CRTCs.
> 
> This helps to optimize the commit process and reduces unnecessary overhead
> when dealing with inactive display resources.

 * This is an alternative implementation for the
 * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
 * that support runtime_pm or need the CRTC to be enabled to perform a
 * commit. Otherwise, one should use the default implementation
 * drm_atomic_helper_commit_tail().

Neither of the cases seem to apply here. Please use
drm_atomic_helper_commit_tail().

> Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Makefile     |  3 ++-
>  drivers/gpu/drm/verisilicon/vs_modeset.c | 31 ++++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_modeset.h | 10 ++++++++
>  3 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
> 
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> index 7da54b259940..842867dad4cb 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -vs_drm-objs := vs_dc_hw.o
> +vs_drm-objs := vs_dc_hw.o \
> +	       vs_modeset.o
>  
>  obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.c b/drivers/gpu/drm/verisilicon/vs_modeset.c
> new file mode 100644
> index 000000000000..0873a3465143
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) VeriSilicon Holdings Co., Ltd.
> + */
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +
> +#include "vs_modeset.h"
> +
> +static const struct drm_mode_config_funcs vs_mode_config_funcs = {
> +	.fb_create			 = drm_gem_fb_create,
> +	.atomic_check		 = drm_atomic_helper_check,
> +	.atomic_commit		 = drm_atomic_helper_commit,
> +};
> +
> +static struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +void vs_mode_config_init(struct drm_device *dev)
> +{
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return;
> +
> +	dev->mode_config.funcs = &vs_mode_config_funcs;
> +	dev->mode_config.helper_private = &vs_mode_config_helpers;
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.h b/drivers/gpu/drm/verisilicon/vs_modeset.h
> new file mode 100644
> index 000000000000..bd04f81d2ad2
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_MODESET_H__
> +#define __VS_MODESET_H__
> +
> +void vs_mode_config_init(struct drm_device *dev);
> +#endif /* __VS_FB_H__ */

There is no point in having single-function headers, please find
something more global.

> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
