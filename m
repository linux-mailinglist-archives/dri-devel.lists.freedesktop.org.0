Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2884977AE4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6179E10ECBF;
	Fri, 13 Sep 2024 08:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ONEv73v0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C4410ECBF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:25:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at
 [213.229.8.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87B4DE0D;
 Fri, 13 Sep 2024 10:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1726215823;
 bh=IGixnfdrtM96Y/tsNdOUAmAVRyYFEROZcvXjurzboIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONEv73v0A491tYyU13aAREpWFVU7bPQnobUEvyq8FyfGR+po3RhpgnJKwI+Ze6f/C
 NKN2Nn2Ecgf2wdOuBTPnt0a9dWh9XRa3gOlwWUF7mJvxkQmqTMKTasn9zg9vb/wpJw
 wLnRxKEwDW98riDTubIghCeYbq3UA5zvwX83mYqc=
Date: Fri, 13 Sep 2024 11:24:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, r-ravikumar@ti.com,
 j-choudhary@ti.com, grandmaster@al2klimov.de, caihuoqing@baidu.com,
 ahalaney@redhat.com, cai.huoqing@linux.dev, colin.i.king@gmail.com,
 javierm@redhat.com, dmitry.baryshkov@linaro.org,
 geert+renesas@glider.be, dakr@redhat.com,
 u.kleine-koenig@pengutronix.de, robh@kernel.org, sam@ravnborg.org,
 simona.vetter@ffwll.ch, ville.syrjala@linux.intel.com,
 wangxiaojun11@huawei.com, yuanjilin@cdjrlc.com, yuehaibing@huawei.com
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
Message-ID: <20240913082428.GD25276@pendragon.ideasonboard.com>
References: <20240912171142.3241719-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240912171142.3241719-1-devarsht@ti.com>
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

Hi Devarsh,

On Thu, Sep 12, 2024 at 10:41:42PM +0530, Devarsh Thakkar wrote:
> Modify license to include dual licensing as GPL-2.0-only OR MIT license for
> tidss display driver. This allows other operating system ecosystems such as
> Zephyr and also the commercial firmwares to refer and derive code from this

GPL-2.0 isn't incompatible with "commercial". I think you mean
"proprietary" here.

> display driver in a more permissive manner.

How do you envision that to work ? Zephyr doesn't have KMS, so you can't
use the driver as-is. What exactly would TI want to use from the Linux
kernel driver ?

Personally, there's a reason why I contribute code to the kernel under
the GPL-2.0 license, it is to make sure the code will remain open. While
I can accept other licenses on a case-by-case basis, I don't like the
casual approach of this patch that seem (to me) to imply that the
license is a mere detail. For a start I would like to know what
"commercial firmwares" you're thinking about.

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  drivers/gpu/drm/tidss/Makefile            | 2 +-
>  drivers/gpu/drm/tidss/tidss_crtc.c        | 2 +-
>  drivers/gpu/drm/tidss/tidss_crtc.h        | 2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c       | 2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.h       | 2 +-
>  drivers/gpu/drm/tidss/tidss_dispc_regs.h  | 2 +-
>  drivers/gpu/drm/tidss/tidss_drv.c         | 2 +-
>  drivers/gpu/drm/tidss/tidss_drv.h         | 2 +-
>  drivers/gpu/drm/tidss/tidss_encoder.c     | 2 +-
>  drivers/gpu/drm/tidss/tidss_encoder.h     | 2 +-
>  drivers/gpu/drm/tidss/tidss_irq.c         | 2 +-
>  drivers/gpu/drm/tidss/tidss_irq.h         | 2 +-
>  drivers/gpu/drm/tidss/tidss_kms.c         | 2 +-
>  drivers/gpu/drm/tidss/tidss_kms.h         | 2 +-
>  drivers/gpu/drm/tidss/tidss_plane.c       | 2 +-
>  drivers/gpu/drm/tidss/tidss_plane.h       | 2 +-
>  drivers/gpu/drm/tidss/tidss_scale_coefs.c | 2 +-
>  drivers/gpu/drm/tidss/tidss_scale_coefs.h | 2 +-
>  18 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/Makefile b/drivers/gpu/drm/tidss/Makefile
> index 312645271014..c67ff32d02e1 100644
> --- a/drivers/gpu/drm/tidss/Makefile
> +++ b/drivers/gpu/drm/tidss/Makefile
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: GPL-2.0
> +# SPDX-License-Identifier: GPL-2.0 OR MIT
>  
>  tidss-y := tidss_crtc.o \
>  	tidss_drv.o \
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index 94f8e3178df5..43dfbead9fa9 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.h b/drivers/gpu/drm/tidss/tidss_crtc.h
> index 040d1205496b..da03873e2ef0 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.h
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 1ad711f8d2a8..3321a1c731b1 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2016-2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Jyri Sarha <jsarha@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 086327d51a90..e6e4396a0d63 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> index 13feedfe5d6d..6e27b6d444ab 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2016-2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Jyri Sarha <jsarha@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index d15f836dca95..b060e420ddec 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index d7f27b0b0315..d4209234f59c 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index 17a86bed8054..9749fbc0e056 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
> index 3e561d6b1e83..85db3835a335 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.h
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
> index 604334ef526a..51939744695a 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.c
> +++ b/drivers/gpu/drm/tidss/tidss_irq.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
> index b512614d5863..cbfd684ecd26 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.h
> +++ b/drivers/gpu/drm/tidss/tidss_irq.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index f371518f8697..05afd57b9128 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.h b/drivers/gpu/drm/tidss/tidss_kms.h
> index 632d79f5983f..69b6bca14550 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.h
> +++ b/drivers/gpu/drm/tidss/tidss_kms.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index a5d86822c9e3..37ffaea15c73 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.h b/drivers/gpu/drm/tidss/tidss_plane.h
> index e933e158b617..3e00bc853813 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.h
> +++ b/drivers/gpu/drm/tidss/tidss_plane.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_scale_coefs.c b/drivers/gpu/drm/tidss/tidss_scale_coefs.c
> index c2b84fea89a5..686ea63e0f45 100644
> --- a/drivers/gpu/drm/tidss/tidss_scale_coefs.c
> +++ b/drivers/gpu/drm/tidss/tidss_scale_coefs.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Jyri Sarha <jsarha@ti.com>
> diff --git a/drivers/gpu/drm/tidss/tidss_scale_coefs.h b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
> index 9c560d0fdac0..4689109fe560 100644
> --- a/drivers/gpu/drm/tidss/tidss_scale_coefs.h
> +++ b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Jyri Sarha <jsarha@ti.com>

-- 
Regards,

Laurent Pinchart
