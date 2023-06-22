Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B32A739E3B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4189010E528;
	Thu, 22 Jun 2023 10:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAE310E528
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:17:09 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687429027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9aUItMReoPpYIK/wz4UleCRCSlHvAr+ArgPv0wraAc=;
 b=eUTMI/SAS2r/dpn4tNDOyXzSr/TQco8LvrghB2kuadPJPCl1TGXnGk51h6BjxCEhtwjvaR
 OrFR50zRmdVnHxmPzXi4fJMY2JwYBgSVPioRASOm4h+i8mWqnK8z3gTBEbmEyrd4qHqA4R
 4RuUYE6g2jCdzOfOyzoGNEdpARgEBZbU0DayIiknDT8uCILP8qmjhY1n0WYUfFY/OKnVPK
 bSSdbtn0uEn+O+xVIo2ulCoiYyNnoOhRfxUt+mvhhGZTUFeIIAxRar/wyayUp+VmoM5qgr
 GVcqIwwlZIRp1kerv8cOGayM7WveYvhhWifvyzKszlxeZLjiHUK3P0156lGD+g==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2500FF80C;
 Thu, 22 Jun 2023 10:17:05 +0000 (UTC)
Date: Thu, 22 Jun 2023 12:17:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add support for Mitsubishi
 AA084XE01
Message-ID: <20230622121705.32dc3924@xps-13>
In-Reply-To: <20230619074348.2893701-2-miquel.raynal@bootlin.com>
References: <20230619074348.2893701-1-miquel.raynal@bootlin.com>
 <20230619074348.2893701-2-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Weber <thomas.weber@corscience.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

miquel.raynal@bootlin.com wrote on Mon, 19 Jun 2023 09:43:48 +0200:

> From: Thomas Weber <thomas.weber@corscience.de>
>=20
> Add support for the Mitsubishi AA084XE01 panel which is an 8.4 inch XGA
> TFT-LCD module for industrial use.
>=20
> Link: https://www.mouser.fr/datasheet/2/274/aa084xe01_e-364171.pdf
> Signed-off-by: Thomas Weber <thomas.weber@corscience.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>=20
> Changes in v2:
> * Lowered the clock to match the typical 65MHz frequency.
> * Added the connector type and the missing bus flags.
> * Collected an A-by tag.
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 8a3b685c2fcc..963f3223c985 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2670,6 +2670,32 @@ static const struct panel_desc mitsubishi_aa070mc0=
1 =3D {
>  	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
>  };
> =20
> +static const struct drm_display_mode mitsubishi_aa084xe01_mode =3D {
> +	.clock =3D 56234,
> +	.hdisplay =3D 1024,
> +	.hsync_start =3D 1024 + 24,
> +	.hsync_end =3D 1024 + 24 + 63,
> +	.htotal =3D 1024 + 24 + 63 + 1,
> +	.vdisplay =3D 768,
> +	.vsync_start =3D 768 + 3,
> +	.vsync_end =3D 768 + 3 + 6,
> +	.vtotal =3D 768 + 3 + 6 + 1,
> +	.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc mitsubishi_aa084xe01 =3D {
> +	.modes =3D &mitsubishi_aa084xe01_mode,
> +	.num_modes =3D 1,
> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 1024,
> +		.height =3D 768,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB565_1X16,
> +	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,

I've got confused, the connector is a DPI connector. On my board there
are two RGB-LVDS and LVDS-RGB connectors, but this is not relevant
here. I'll send an update using the right connector type.

> +	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGED=
GE,
> +};
> +
>  static const struct display_timing multi_inno_mi0700s4t_6_timing =3D {
>  	.pixelclock =3D { 29000000, 33000000, 38000000 },
>  	.hactive =3D { 800, 800, 800 },
> @@ -4158,6 +4184,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>  	}, {
>  		.compatible =3D "mitsubishi,aa070mc01-ca1",
>  		.data =3D &mitsubishi_aa070mc01,
> +	}, {
> +		.compatible =3D "mitsubishi,aa084xe01",
> +		.data =3D &mitsubishi_aa084xe01,
>  	}, {
>  		.compatible =3D "multi-inno,mi0700s4t-6",
>  		.data =3D &multi_inno_mi0700s4t_6,


Thanks,
Miqu=C3=A8l
