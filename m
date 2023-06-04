Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FE72176F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 15:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8160910E134;
	Sun,  4 Jun 2023 13:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F3910E134
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 13:30:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126166129043.28.openmobile.ne.jp
 [126.166.129.43])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C8302CF;
 Sun,  4 Jun 2023 15:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685885376;
 bh=5IMZwnE0fr+/3IOAAjQBKuiQU9Gi7L3Wp+xMB7mcWzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iv5+EmBWCAJxeF/pQvQefzgBjo1jk9vTRoUaZbMA8kRGCQjOYsHDwUFxroGwTNhpv
 PECa5fH4KQEeOQSI0a3ww+MaWKpxpr+2+7RTURg62LtbSRV+j5KnNfaCAUDlpV8Jgb
 TAU1HFyPVWazJU30zCAe4Z8X+1ULz0YsEjFccvbQ=
Date: Sun, 4 Jun 2023 16:29:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: imx: turn imx8{qm,qxp}-ldb into
 single-object modules
Message-ID: <20230604132957.GC7754@pendragon.ideasonboard.com>
References: <20230604075713.1027261-1-masahiroy@kernel.org>
 <20230604075713.1027261-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230604075713.1027261-2-masahiroy@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yamada-san,

Thank you for the patch.

On Sun, Jun 04, 2023 at 04:57:13PM +0900, Masahiro Yamada wrote:
> With the previous fix, these modules are built from a single C file.
> 
> Rename the source files so they match the module names.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/imx/Makefile                           | 4 ----
>  drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c} | 0
>  .../gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c}   | 0
>  3 files changed, 4 deletions(-)
>  rename drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c} (100%)
>  rename drivers/gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c} (100%)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 5fc821278693..8e2ebf3399a1 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,10 +1,6 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
> -imx8qm-ldb-objs := imx8qm-ldb-drv.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
> -
> -imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
> -
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> similarity index 100%
> rename from drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
> rename to drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> similarity index 100%
> rename from drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> rename to drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c

-- 
Regards,

Laurent Pinchart
