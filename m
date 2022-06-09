Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF06A544663
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 10:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DF510F51A;
	Thu,  9 Jun 2022 08:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3110F51A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 08:51:31 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5369A1C0014;
 Thu,  9 Jun 2022 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654764686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGAoCbJ4PnmE24cZUZISnYlS07hy6YazH5G/uIXRRic=;
 b=Qjp86WVnTKo1thidhbUOr0nDlG6oGL1CQsMi20safYxb3vqF+sGwAHufD1f2YqEzlgHfP3
 9prCXrSTZt6Msfq9WQ9YMhIIKANs8DbMqTw5xmPolWE1UfMHd6CDHsf3UUvV3dgVOrQO6b
 /UwONL+Hv/OgmPMekzap6m1ExNbmsLHOtTp4h67mjs6ZY9W0zt9mieKtiUYqwUKIQXLEAr
 /eJwaSkGp96sMCAnvMQ68ZN7EutTVURigaXgHz9t7++OvUbmyHnRfHC9CG8IK/kRY4m/Nw
 SOIb318E0xBMkhiyE/Kzz+gfyio1uNuGoAAywcRVIYep/F9o7D+46jjZmCPmlg==
Date: Thu, 9 Jun 2022 10:51:22 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH 2/3] drm/panel: ltk050h3146w: add support for Leadtek
 LTK050H3148W-CTA6 variant
Message-ID: <YqG0igbIyfXBX4aa@aptenodytes>
References: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
 <20220131164723.714836-2-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OTiA3IFaAUn6WzOQ"
Content-Disposition: inline
In-Reply-To: <20220131164723.714836-2-quentin.schulz@theobroma-systems.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Quentin Schulz <foss+kernel@0leil.net>,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 Klaus Goger <klaus.goger@theobroma-systems.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--OTiA3IFaAUn6WzOQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 31 Jan 22, 17:47, quentin.schulz@theobroma-systems.com wrote:
> From: Klaus Goger <klaus.goger@theobroma-systems.com>
>=20
> The LTK050H3148W-CTA6 is a 5.0" 720x1280 DSI display, whose driving
> controller is a Himax HX8394-F, slightly different from LTK050H3146W by
> its init sequence, mode details and mode flags.
>=20
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Klaus Goger <klaus.goger@theobroma-systems.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  .../drm/panel/panel-leadtek-ltk050h3146w.c    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers=
/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index 67eb474e28c6..3be815c3be68 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -253,6 +253,89 @@ struct ltk050h3146w *panel_to_ltk050h3146w(struct dr=
m_panel *panel)
>  			return ret;					\
>  	} while (0)
> =20
> +static int ltk050h3148w_init_sequence(struct ltk050h3146w *ctx)
> +{
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor without much
> +	 * documentation.
> +	 */
> +	dsi_dcs_write_seq(dsi, 0xb9, 0xff, 0x83, 0x94);
> +	dsi_dcs_write_seq(dsi, 0xb1, 0x50, 0x15, 0x75, 0x09, 0x32, 0x44, 0x71,
> +			  0x31, 0x55, 0x2f);
> +	dsi_dcs_write_seq(dsi, 0xba, 0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
> +	dsi_dcs_write_seq(dsi, 0xd2, 0x88);
> +	dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x80, 0x64, 0x10, 0x07);
> +	dsi_dcs_write_seq(dsi, 0xb4, 0x05, 0x70, 0x05, 0x70, 0x01, 0x70, 0x01,
> +			  0x0c, 0x86, 0x75, 0x00, 0x3f, 0x01, 0x74, 0x01, 0x74,
> +			  0x01, 0x74, 0x01, 0x0c, 0x86);
> +	dsi_dcs_write_seq(dsi, 0xd3, 0x00, 0x00, 0x07, 0x07, 0x40, 0x1e, 0x08,
> +			  0x00, 0x32, 0x10, 0x08, 0x00, 0x08, 0x54, 0x15, 0x10,
> +			  0x05, 0x04, 0x02, 0x12, 0x10, 0x05, 0x07, 0x33, 0x34,
> +			  0x0c, 0x0c, 0x37, 0x10, 0x07, 0x17, 0x11, 0x40);
> +	dsi_dcs_write_seq(dsi, 0xd5, 0x19, 0x19, 0x18, 0x18, 0x1b, 0x1b, 0x1a,
> +			  0x1a, 0x04, 0x05, 0x06, 0x07, 0x00, 0x01, 0x02, 0x03,
> +			  0x20, 0x21, 0x18, 0x18, 0x22, 0x23, 0x18, 0x18, 0x18,
> +			  0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			  0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			  0x18);
> +	 dsi_dcs_write_seq(dsi, 0xd6, 0x18, 0x18, 0x19, 0x19, 0x1b, 0x1b, 0x1a,
> +			   0x1a, 0x03, 0x02, 0x01, 0x00, 0x07, 0x06, 0x05, 0x04,
> +			   0x23, 0x22, 0x18, 0x18, 0x21, 0x20, 0x18, 0x18, 0x18,
> +			   0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			   0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			   0x18);
> +	dsi_dcs_write_seq(dsi, 0xe0, 0x00, 0x03, 0x09, 0x11, 0x11, 0x14, 0x18,
> +			  0x16, 0x2e, 0x3d, 0x4d, 0x4d, 0x58, 0x6c, 0x72, 0x78,
> +			  0x88, 0x8b, 0x86, 0xa4, 0xb2, 0x58, 0x55, 0x59, 0x5b,
> +			  0x5d, 0x60, 0x64, 0x7f, 0x00, 0x03, 0x09, 0x0f, 0x11,
> +			  0x14, 0x18, 0x16, 0x2e, 0x3d, 0x4d, 0x4d, 0x58, 0x6d,
> +			  0x73, 0x78, 0x88, 0x8b, 0x87, 0xa5, 0xb2, 0x58, 0x55,
> +			  0x58, 0x5b, 0x5d, 0x61, 0x65, 0x7f);
> +	dsi_dcs_write_seq(dsi, 0xcc, 0x0b);
> +	dsi_dcs_write_seq(dsi, 0xc0, 0x1f, 0x31);
> +	dsi_dcs_write_seq(dsi, 0xb6, 0xc4, 0xc4);
> +	dsi_dcs_write_seq(dsi, 0xbd, 0x01);
> +	dsi_dcs_write_seq(dsi, 0xb1, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xbd, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xc6, 0xef);
> +	dsi_dcs_write_seq(dsi, 0xd4, 0x02);
> +	dsi_dcs_write_seq(dsi, 0x11);
> +	dsi_dcs_write_seq(dsi, 0x29);
> +
> +	ret =3D mipi_dsi_dcs_set_tear_on(dsi, 1);
> +	if (ret < 0) {
> +		dev_err(ctx->dev, "failed to set tear on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(60);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode ltk050h3148w_mode =3D {
> +	.hdisplay	=3D 720,
> +	.hsync_start	=3D 720 + 12,
> +	.hsync_end	=3D 720 + 12 + 6,
> +	.htotal		=3D 720 + 12 + 6 + 24,
> +	.vdisplay	=3D 1280,
> +	.vsync_start	=3D 1280 + 9,
> +	.vsync_end	=3D 1280 + 9 + 2,
> +	.vtotal		=3D 1280 + 9 + 2 + 16,
> +	.clock		=3D 59756,
> +	.width_mm	=3D 62,
> +	.height_mm	=3D 110,
> +};
> +
> +static const struct ltk050h3146w_desc ltk050h3148w_data =3D {
> +	.mode =3D &ltk050h3148w_mode,
> +	.init =3D ltk050h3148w_init_sequence,
> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +};
> +
>  static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
>  {
>  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> @@ -657,6 +740,10 @@ static const struct of_device_id ltk050h3146w_of_mat=
ch[] =3D {
>  		.compatible =3D "leadtek,ltk050h3146w-a2",
>  		.data =3D &ltk050h3146w_a2_data,
>  	},
> +	{
> +		.compatible =3D "leadtek,ltk050h3148w",
> +		.data =3D &ltk050h3148w_data,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ltk050h3146w_of_match);
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--OTiA3IFaAUn6WzOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmKhtIoACgkQ3cLmz3+f
v9Gx7QgAlaGFmBwB+ZLCmWi0R/kG5uQ7wj3COrZJFXl7/B+F3Y4Vo7JQtDB9Gcze
qNRkW6SjmXQakCiMXPaEDvjepj45YmF7pAl01Q2y8zhAJLhiDEC9F89zv+D4+9Tz
IgrwtZhj/nrbWcu+Jra87cb4PgSu96xxMfGF3pKtPCFl8PAU3+HQNlRhtngS8+pQ
2pd0PB0tX2osaqnosfqk5dfE2Cz0e/1IKtPL1larvBYUffbVsjZ1TI5VAPqeOgu4
zlIx5x4Hwn/Jk45MRHLWc9L1gipWIDr8jvrP2rWOYr7WZtqQmaDQWGBPfhVbQDeS
i6sqZ/EmBxlu3cPwP5MQpMD/mxqK+A==
=0zYL
-----END PGP SIGNATURE-----

--OTiA3IFaAUn6WzOQ--
