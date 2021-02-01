Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867630A9D4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47F36E5C8;
	Mon,  1 Feb 2021 14:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA5E6E5C8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:34:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EAE1AC45;
 Mon,  1 Feb 2021 14:34:47 +0000 (UTC)
Subject: Re: [PATCH 1/6] drm/gma500/cdv: Remove unused code for crt init
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6789c501-ba09-a095-f715-494a13a0402b@suse.de>
Date: Mon, 1 Feb 2021 15:34:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie
Content-Type: multipart/mixed; boundary="===============0220111818=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0220111818==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NGOKdfJ5LtxuH5Mt0oL5BkcD0cXNShy1k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NGOKdfJ5LtxuH5Mt0oL5BkcD0cXNShy1k
Content-Type: multipart/mixed; boundary="wYzCpw0eFdDW2rQuF0xIymwAYz6lrmKLz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie
Message-ID: <6789c501-ba09-a095-f715-494a13a0402b@suse.de>
Subject: Re: [PATCH 1/6] drm/gma500/cdv: Remove unused code for crt init
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>

--wYzCpw0eFdDW2rQuF0xIymwAYz6lrmKLz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 01.02.21 um 14:26 schrieb Patrik Jakobsson:
> Clearly never been used so just remove it.
>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/gma500/cdv_intel_crt.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/g=
ma500/cdv_intel_crt.c
> index c48c9d322dfb..4a9bb4994a26 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
> @@ -248,8 +248,6 @@ void cdv_intel_crt_init(struct drm_device *dev,
>   	struct drm_connector *connector;
>   	struct drm_encoder *encoder;
>  =20
> -	u32 i2c_reg;
> -
>   	gma_encoder =3D kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
>   	if (!gma_encoder)
>   		return;
> @@ -269,24 +267,13 @@ void cdv_intel_crt_init(struct drm_device *dev,
>   	gma_connector_attach_encoder(gma_connector, gma_encoder);
>  =20
>   	/* Set up the DDC bus. */
> -	i2c_reg =3D GPIOA;
> -	/* Remove the following code for CDV */
> -	/*
> -	if (dev_priv->crt_ddc_bus !=3D 0)
> -		i2c_reg =3D dev_priv->crt_ddc_bus;
> -	}*/
> -	gma_encoder->ddc_bus =3D psb_intel_i2c_create(dev,
> -							  i2c_reg, "CRTDDC_A");
> +	gma_encoder->ddc_bus =3D psb_intel_i2c_create(dev, GPIOA, "CRTDDC_A")=
;
>   	if (!gma_encoder->ddc_bus) {
>   		dev_printk(KERN_ERR, dev->dev, "DDC bus registration failed.\n");
>   		goto failed_ddc;
>   	}
>  =20
>   	gma_encoder->type =3D INTEL_OUTPUT_ANALOG;
> -	/*
> -	psb_intel_output->clone_mask =3D (1 << INTEL_ANALOG_CLONE_BIT);
> -	psb_intel_output->crtc_mask =3D (1 << 0) | (1 << 1);
> -	*/
>   	connector->interlace_allowed =3D 0;
>   	connector->doublescan_allowed =3D 0;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--wYzCpw0eFdDW2rQuF0xIymwAYz6lrmKLz--

--NGOKdfJ5LtxuH5Mt0oL5BkcD0cXNShy1k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAYEYYFAwAAAAAACgkQlh/E3EQov+B4
Vw/+PPIMIsDDo+oHm3QqKZiNq7aB2ujZ5m/O1hTbb5t9mep5JlDeUW0L8HnOXljixVW55twBGX9o
TRepeMUME9ra2AFG5SQAvOlRvZ+M2bbBgBsscFr5lCUTb+pObZc6+ml4yXRuHO0GiOJ/z2+iuwEu
QInVojz6cI9wlbudT844wY/+G/wk+lYPwQMMUJxdlIrF6c6nCXg78pvr8WaHlB3YdLTO0ShxNp76
SjIAatKjQrvNuBd4SM1CjtZOg0V6r+aZ2okHIERCkbJwQuvydsrI+0XGgrOd1HWFIIZ4diGnw0TY
SbScnSVKqn81l9LZVspGvkkhUWIOXSbtVS1RK/HtROGzJbRDXi/8p5Adl9MkTwzRSHuAkbyeyUQs
NVpNJTTXKl5PkpX8FTiQZ05i0Lyuw2EFChiP0Qsh+Y7xSYj98M1izP3fRkfhN60Q7DlRcBGm+ggU
Pc+OFA8Yf4KSM08uEOej8QlEcWmii4NGEZrQcDiO12KDmUT2fegoVHNEc9FnAcREmsk2MgxfFJks
Y57bnoc89Nm1d07Vz9YxuvGWx7NMSTpKR527ZZo0NmbcnSgwVyrhnF8VqqNCHQdhAXxldg2cd7nc
vrD1KtakkrK0PMmDuJFQ0STALg5inGnZWR4Jy3vQZQMLVAD/9RMIiwH+CYtzJ6I0tcz57i1xAhWm
G/s=
=lnon
-----END PGP SIGNATURE-----

--NGOKdfJ5LtxuH5Mt0oL5BkcD0cXNShy1k--

--===============0220111818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0220111818==--
