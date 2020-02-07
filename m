Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181B515593C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0776FCC7;
	Fri,  7 Feb 2020 14:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDC86FCC7;
 Fri,  7 Feb 2020 14:25:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C667CAD8E;
 Fri,  7 Feb 2020 14:25:19 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] drm: Validate encoder->possible_clones
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-6-ville.syrjala@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <81fe6f54-1811-bd6c-550e-1428227c89ad@suse.de>
Date: Fri, 7 Feb 2020 15:25:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207135950.6655-6-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0033638602=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0033638602==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="v7RW2DcsCGLUOIVDolces6GxYPPcHkN57"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--v7RW2DcsCGLUOIVDolces6GxYPPcHkN57
Content-Type: multipart/mixed; boundary="tPb9yrDQOs5P1ebC5zddAkxb8haPmMQjP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <81fe6f54-1811-bd6c-550e-1428227c89ad@suse.de>
Subject: Re: [PATCH v2 5/6] drm: Validate encoder->possible_clones
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20200207135950.6655-6-ville.syrjala@linux.intel.com>

--tPb9yrDQOs5P1ebC5zddAkxb8haPmMQjP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.02.20 um 14:59 schrieb Ville Syrjala:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Many drivers are populating encoder->possible_clones wrong. Let's
> persuade them to get it right by adding some loud WARNs.
>=20
> We'll cross check the bits between any two encoders. So either
> both encoders can clone with the other, or neither can.
>=20
> We'll also complain about effectively empty possible_clones, and
> possible_clones containing bits for encoders that don't exist.
>=20
> TODO: Or should we just silently filter out any bits for non-existing
> encoders?

Please be noisy. Setting these masks incorrectly could be a bug.

>=20
> v2: encoder->possible_clones now includes the encoder itelf
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_encoder.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encode=
r.c
> index f761d9306028..bc2246f27e0d 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -79,6 +79,34 @@ static void fixup_possible_clones(struct drm_device =
*dev)
>  		encoder->possible_clones |=3D drm_encoder_mask(encoder);
>  }
> =20
> +static void validate_possible_clones(struct drm_encoder *encoder)
> +{
> +	struct drm_device *dev =3D encoder->dev;
> +	struct drm_encoder *other;
> +	u32 encoder_mask =3D 0;
> +
> +	drm_for_each_encoder(other, dev) {
> +		encoder_mask |=3D drm_encoder_mask(other);
> +
> +		WARN(!(encoder->possible_clones & drm_encoder_mask(other)) !=3D
> +		     !(other->possible_clones & drm_encoder_mask(encoder)),
> +		     "possible_clones mismatch: "
> +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x vs. "
> +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x\n",
> +		     encoder->base.id, encoder->name,
> +		     drm_encoder_mask(encoder), encoder->possible_clones,
> +		     other->base.id, other->name,
> +		     drm_encoder_mask(other), other->possible_clones);
> +	}
> +
> +	WARN((encoder->possible_clones & drm_encoder_mask(encoder)) =3D=3D 0 =
||
> +	     (encoder->possible_clones & ~encoder_mask) !=3D 0,
> +	     "Bogus possible_clones: "
> +	     "[ENCODER:%d:%s] possible_clones=3D0x%x (full encoder mask=3D0x%=
x)\n",
> +	     encoder->base.id, encoder->name,
> +	     encoder->possible_clones, encoder_mask);
> +}
> +
>  int drm_encoder_register_all(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
> @@ -87,6 +115,8 @@ int drm_encoder_register_all(struct drm_device *dev)=

>  	fixup_possible_clones(dev);
> =20
>  	drm_for_each_encoder(encoder, dev) {
> +		validate_possible_clones(encoder);
> +
>  		if (encoder->funcs->late_register)
>  			ret =3D encoder->funcs->late_register(encoder);
>  		if (ret)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--tPb9yrDQOs5P1ebC5zddAkxb8haPmMQjP--

--v7RW2DcsCGLUOIVDolces6GxYPPcHkN57
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl49c08ACgkQaA3BHVML
eiObHQgAm2tyxmwM7jK8Lw1kLceaz9A5To1GTqMULczTe/WZxjyTB8iTRrVlNooq
hXTCZEWb6It85RuA48yZAAY0jBHE9aBVqAIC/V7O4E8hsaSbxgDHPa1K/Q7qVINq
PHEpXOvR9KDiJPTWIqdgiAAtSgz4nG5NTqmV/kQ5Dml6sp7dM940v5BQzkHC6+J5
UG7UBA0HkinWK9xWb3sEu1ZLsQBCGPgvVrJRCQNotClPngJFK6287aENu6SKCXJ3
3Uv19M+0V7q6T1asOCJVgjMTpv61T3AnY7cXQdtjK8ebMlPXa82wyo+8E4LGQUOO
3cugYFDJvBz9sOBqLyW3jhshD1Uqnw==
=lQiv
-----END PGP SIGNATURE-----

--v7RW2DcsCGLUOIVDolces6GxYPPcHkN57--

--===============0033638602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0033638602==--
