Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4609BED39
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683610E1F0;
	Wed,  6 Nov 2024 13:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="LkuJUNU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279A310E1F0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:10:12 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1730898609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mqH/9btvqwX3RdcLHRb09L6d7Cq1aZ/kH5G2l32Sges=;
 b=LkuJUNU78bIk0+BAeK4MxgN59BaYxOyzLuk75rbocDpCPlA5UyoZ3S0X379tEPyOXh6eq1
 A7pnrO43z5yWKoskI/7yIutQJ0sdzksW6YP3TWmVTzbqrwFnMRIe4xlS7Cjc+ZtcrY4oOI
 oWt3Hp2Nmf1F1VFJs9/sew/v4EsYNGBY5p2D3OzjV4tcU3c+2f+SPq3Mwba271qCdqiWEX
 kEq8Ix+UBq3zEcwmbb4qlu8ZzLldNAUYANIBRJA8delJKr92HFFeRW+Z/+w3gv44krsHyS
 +Dn+m4MMnp8MOSOITunVsO9jebmSi0FVvT5hwQe+89pwLyn1T42l+Agrp063Sw==
Content-Type: multipart/signed;
 boundary=873c8ffaadf467f71a296828b2ff627c9b24ebf6d8e6d5229ed746de4cfd;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 06 Nov 2024 14:09:56 +0100
Message-Id: <D5F4CDTI0BHA.3MIQH9MJ4OY3K@cknow.org>
Cc: <andy.yan@rock-chips.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <quentin.schulz@cherry.de>, "Heiko Stuebner" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/3] drm/bridge/synopsys: Add MIPI DSI2 host controller
 bridge
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Heiko Stuebner" <heiko@sntech.de>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-2-heiko@sntech.de>
In-Reply-To: <20241106123304.422854-2-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
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

--873c8ffaadf467f71a296828b2ff627c9b24ebf6d8e6d5229ed746de4cfd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 6, 2024 at 1:33 PM CET, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>
> Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
> DSI2 host controller, based on the Rockchip version from the driver
> rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.
>
> While the driver is heavily modelled after the previous IP, the register
> set of this DSI2 controller is completely different and there are also
> additional properties like the variable-width phy interface.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  drivers/gpu/drm/bridge/synopsys/Kconfig       |    6 +
>  drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
>  .../gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1034 +++++++++++++++++
>  include/drm/bridge/dw_mipi_dsi2.h             |   94 ++
>  4 files changed, 1135 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
>  create mode 100644 include/drm/bridge/dw_mipi_dsi2.h
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/br=
idge/synopsys/Kconfig
> index ca416dab156d..f3ab2f985f8c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> @@ -59,3 +59,9 @@ config DRM_DW_MIPI_DSI
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL_BRIDGE
> +
> +config DRM_DW_MIPI_DSI2
> +	tristate
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/b=
ridge/synopsys/Makefile
> index 9869d9651ed1..9dc376d220ad 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Makefile
> +++ b/drivers/gpu/drm/bridge/synopsys/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_DW_HDMI_CEC) +=3D dw-hdmi-cec.o
>  obj-$(CONFIG_DRM_DW_HDMI_QP) +=3D dw-hdmi-qp.o
> =20
>  obj-$(CONFIG_DRM_DW_MIPI_DSI) +=3D dw-mipi-dsi.o
> +obj-$(CONFIG_DRM_DW_MIPI_DSI2) +=3D dw-mipi-dsi2.o
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu=
/drm/bridge/synopsys/dw-mipi-dsi2.c
> new file mode 100644
> index 000000000000..43738fe3cb93
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> @@ -0,0 +1,1034 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2024, Fuzhou Rockchip Electronics Co., Ltd
> + *
> + * Modified by Heiko Stuebner <heiko.stuebner@cherry.de>
> + * This generic Synopsys DesignWare MIPI DSI2 host driver is based on th=
e
> + * Rockchip version from rockchip/dw-mipi-dsi2.c converted to use bridge=
 APIs.
> + */
> +
> +#include <linux/clk.h>
> ...
> +#include <drm/drm_print.h>
> +
> +#define UPDATE(v, h, l)			(((v) << (l)) & GENMASK((h), (l)))
> +
> +#define DSI2_PWR_UP			0x000c
> ...
> +#define DSI2_MAX_REGISGER		DSI2_INT_FORCE_CRI
> +
> +#define MODE_STATUS_TIMEOUT_US		10000
> +#define CMD_PKT_STATUS_TIMEOUT_US	20000
> +
> +enum vid_mode_type {
> +	VID_MODE_TYPE_NON_BURST_SYNC_PULSES,
> +	VID_MODE_TYPE_NON_BURST_SYNC_EVENTS,
> +	VID_MODE_TYPE_BURST,
> +};
> +
> +enum mode_ctrl {
> +	IDLE_MODE,
> +	AUTOCALC_MODE,
> +	COMMAND_MODE,
> +	VIDEO_MODE,
> +	DATA_STREAM_MODE,
> +	VIDE_TEST_MODE,

VIDEO_TEST_MODE ?

> +	DATA_STREAM_TEST_MODE,
> +};

Cheers,
  Diederik

--873c8ffaadf467f71a296828b2ff627c9b24ebf6d8e6d5229ed746de4cfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZytqqwAKCRDXblvOeH7b
bjmoAP9MLtB4FYAubhN6YhCwXOuRPEOkgaaAYMSx9yyaDve7AQD/ZW+XkKIpIBLO
zh+URJXh2/F28IGFhm1AJitdlC6rFQg=
=9ZqU
-----END PGP SIGNATURE-----

--873c8ffaadf467f71a296828b2ff627c9b24ebf6d8e6d5229ed746de4cfd--
