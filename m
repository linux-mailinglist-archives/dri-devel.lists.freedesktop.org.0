Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F380E1A1324
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 19:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4F06E8BD;
	Tue,  7 Apr 2020 17:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259C66E8BD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 17:52:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A11CA804F2;
 Tue,  7 Apr 2020 19:52:00 +0200 (CEST)
Date: Tue, 7 Apr 2020 19:51:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Subject: Re: [PATCH v2 3/4] drm: ipk: Add extensions for DW MIPI DSI Host
 driver
Message-ID: <20200407175159.GB6356@ravnborg.org>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
 <8b63a8390bbc0e81d01540648da7e6b03b8577fa.1586174459.git.angelo.ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b63a8390bbc0e81d01540648da7e6b03b8577fa.1586174459.git.angelo.ribeiro@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=NYW8XwYh3pstn-W6v_UA:9
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Lf5xNeLK5dgiOs8hzIjU:22
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
Cc: devicetree@vger.kernel.org, Joao.Pinto@synopsys.com, airlied@linux.ie,
 Gustavo.Pimentel@synopsys.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo.

One nit below.

	Sam

On Mon, Apr 06, 2020 at 03:24:13PM +0200, Angelo Ribeiro wrote:
> Add Synopsys DesignWare IPK specific extensions for Synopsys DesignWare
> MIPI DSI Host driver.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>  drivers/gpu/drm/ipk/Kconfig           |   9 +
>  drivers/gpu/drm/ipk/Makefile          |   2 +
>  drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c | 556 ++++++++++++++++++++++++++++++++++
>  3 files changed, 567 insertions(+)
>  create mode 100644 drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> 
> diff --git a/drivers/gpu/drm/ipk/Kconfig b/drivers/gpu/drm/ipk/Kconfig
> index 1f87444..49819e5 100644
> --- a/drivers/gpu/drm/ipk/Kconfig
> +++ b/drivers/gpu/drm/ipk/Kconfig
> @@ -11,3 +11,12 @@ config DRM_IPK
>  	  Enable support for the Synopsys DesignWare DRM DSI.
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called ipk-drm.
> +
> +config DRM_IPK_DSI
> +	tristate "Synopsys DesignWare IPK specific extensions for MIPI DSI"
> +	depends on DRM_IPK
> +	select DRM_DW_MIPI_DSI
> +	help
> +	  Choose this option for Synopsys DesignWare IPK MIPI DSI support.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called dw-mipi-dsi-ipk.
> diff --git a/drivers/gpu/drm/ipk/Makefile b/drivers/gpu/drm/ipk/Makefile
> index 51d2774..c80503f 100644
> --- a/drivers/gpu/drm/ipk/Makefile
> +++ b/drivers/gpu/drm/ipk/Makefile
> @@ -4,3 +4,5 @@ ipk-drm-y := \
>  	dw-vpg.o
>  
>  obj-$(CONFIG_DRM_IPK) += ipk-drm.o
> +
> +obj-$(CONFIG_DRM_IPK_DSI) += dw-mipi-dsi-ipk.o
> diff --git a/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c b/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> new file mode 100644
> index 0000000..070eccb
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> + * Synopsys DesignWare MIPI DSI solution driver
> + *
> + * Author: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> + * Author: Luis Oliveira <luis.oliveira@synopsys.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/bridge/dw_mipi_dsi.h>
> +#include <video/mipi_display.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
Same rant as in previous mail about include file.


Rest of the driver looked good while quickly browsing the code.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
