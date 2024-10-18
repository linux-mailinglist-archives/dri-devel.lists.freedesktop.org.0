Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDDA9A374C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3313210E8B5;
	Fri, 18 Oct 2024 07:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="MTogEdOF";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="C/9tldq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1062C10E8B5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1729236941; x=1760772941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=walgQrYsx2K6SNbX75Alxg4lonGvdunLhiFtANmzpEQ=;
 b=MTogEdOF25eRzS17bATtckzRdBXcf36yySGX3EjIzLNWlrh4AViIiJVg
 1uBi9WbmvS0vQiWW2Wy8kCa4ECWV8rH8H9VeCBcsUEoB48lU4vvunvJnu
 KByIX++MTUi5KM2REbQSm6CMXYX3H81NX21SaA8GKoaBkJKaVgNvqukTT
 L+SwRKshHwdqz82J3rN6Mrs7uhg1wxF7KMemebyZBPN92RzhIPWofighD
 bt2Nh4ZWbPR35xRK+ZmLjcwNtaNOFf4Kagl+EIO1LdUL5cvi/ywSnsfZC
 X9bOoTAUwxOjYmhIsB2ekxe7TP2Z0IfAh4v7NblXoZUYiGrJ2GejpPlDY g==;
X-CSE-ConnectionGUID: wxo6vh60TouhDoUSUNpA6A==
X-CSE-MsgGUID: nV5Wt5n6SmGCjoyB3TasyQ==
X-IronPort-AV: E=Sophos;i="6.11,213,1725314400"; d="scan'208";a="39534896"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 18 Oct 2024 09:35:39 +0200
X-CheckPoint: {67120FCB-18-65F98A6A-FADAF7F3}
X-MAIL-CPID: BB5A6EDFDA6ADCB51361E5462E0B8185_5
X-Control-Analysis: str=0001.0A682F1B.67120FCB.00B7, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DFBB71702C7; Fri, 18 Oct 2024 09:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1729236934;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=walgQrYsx2K6SNbX75Alxg4lonGvdunLhiFtANmzpEQ=;
 b=C/9tldq+9xAXRIoLZuR2V0irNPBk2bsUudeYYOnz+Jg0Hcbgr0qm88dyMzfBpmn7udO1qD
 +FMgw4mnYvM9Ngv49Kr6wGfYvE7ag+8x02V4uOg/F+w1YluIER4C9XNCE0VQ9ua0AIX5fP
 sLDtoOatpD+5CGXrgL0c5XwYLG6YVqQpxo3vRxVwm3o24UrhCWQZxGWH1Zvp9aMMy81e0c
 zHI7RJ9xQfw1OuuglzgGkHQ+ip08XXjxHsvcoXd76pKAW89VBZJ/VK4AuoknflTJOOBmPt
 cFDlY/vRDeYtMZ43n8lrTPQGhlm8E5bZ1gXxvV3hNq+iR5oEQFuWs0qMXbzvNQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 marex@denx.de, stefan@agner.ch, dmitry.baryshkov@linaro.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
Date: Fri, 18 Oct 2024 09:35:32 +0200
Message-ID: <2486359.jE0xQCEvom@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241018064813.2750016-6-victor.liu@nxp.com>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Freitag, 18. Oktober 2024, 08:48:13 CEST schrieb Liu Ying:
> Initialize a connector by calling drm_bridge_connector_init() for
> each encoder so that down stream bridge drivers don't need to create
> connectors any more.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

I've tested this using HDMI output. HPD and CEC is still working.
Also output using a DSI->DP bridge (tc358767) also works.
My platform: imx8mp-tqma8mpql-mba8mpxl.dts

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 264e74f45554..06c95e556380 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX_LCDIF
>  	depends on DRM && OF
>  	depends on COMMON_CLK
>  	depends on ARCH_MXC || COMPILE_TEST
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index 58ccad9c425d..d4521da6675e 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -16,7 +16,9 @@
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_client_setup.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -56,6 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private=
 *lcdif)
>  		struct device_node *remote;
>  		struct of_endpoint of_ep;
>  		struct drm_encoder *encoder;
> +		struct drm_connector *connector;
> =20
>  		remote =3D of_graph_get_remote_port_parent(ep);
>  		if (!of_device_is_available(remote)) {
> @@ -97,13 +100,25 @@ static int lcdif_attach_bridge(struct lcdif_drm_priv=
ate *lcdif)
>  			return ret;
>  		}
> =20
> -		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> +		ret =3D drm_bridge_attach(encoder, bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			of_node_put(ep);
>  			return dev_err_probe(dev, ret,
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
>  		}
> +
> +		connector =3D drm_bridge_connector_init(lcdif->drm, encoder);
> +		if (IS_ERR(connector)) {
> +			ret =3D PTR_ERR(connector);
> +			dev_err(dev, "Failed to initialize bridge connector: %d\n",
> +				ret);
> +			of_node_put(ep);
> +			return ret;
> +		}
> +
> +		drm_connector_attach_encoder(connector, encoder);
>  	}
> =20
>  	return 0;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


