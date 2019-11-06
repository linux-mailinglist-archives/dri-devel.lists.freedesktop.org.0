Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A6F10FC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 09:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517B86EC40;
	Wed,  6 Nov 2019 08:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6CF6EC40
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 08:24:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A67FAF62;
 Wed,  6 Nov 2019 08:24:47 +0000 (UTC)
Subject: Re: [PATCH 6/9] drm/ast: Add primary plane
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-7-tzimmermann@suse.de>
 <20191105095102.qjqgh3ghx7tctk43@sirius.home.kraxel.org>
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
Message-ID: <66b81e8e-65f9-8657-31c6-8225132f2322@suse.de>
Date: Wed, 6 Nov 2019 09:24:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105095102.qjqgh3ghx7tctk43@sirius.home.kraxel.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@redhat.com, chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0532360099=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0532360099==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LzfqNm7szLjJfJ9rIcacHMNnpr9DdUr6x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LzfqNm7szLjJfJ9rIcacHMNnpr9DdUr6x
Content-Type: multipart/mixed; boundary="77fQnirq3sP2mEMJoPr2HCAgVGjnVXUeF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 chen@aspeedtech.com, dri-devel@lists.freedesktop.org
Message-ID: <66b81e8e-65f9-8657-31c6-8225132f2322@suse.de>
Subject: Re: [PATCH 6/9] drm/ast: Add primary plane
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-7-tzimmermann@suse.de>
 <20191105095102.qjqgh3ghx7tctk43@sirius.home.kraxel.org>
In-Reply-To: <20191105095102.qjqgh3ghx7tctk43@sirius.home.kraxel.org>

--77fQnirq3sP2mEMJoPr2HCAgVGjnVXUeF
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.11.19 um 10:51 schrieb Gerd Hoffmann:
>> +static const struct drm_plane_funcs ast_primary_plane_funcs =3D {
>> +	.update_plane =3D drm_atomic_helper_update_plane,
>> +	.disable_plane =3D drm_atomic_helper_disable_plane,
>> +	.destroy =3D drm_plane_cleanup,
>> +	.reset =3D drm_atomic_helper_plane_reset,
>> +	.set_property =3D NULL,
>> +	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_state,=

>> +	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
>> +	.atomic_set_property =3D NULL,
>> +	.atomic_get_property =3D NULL,
>=20
> It's not needed to explicitly set optional function pointers to NULL.

Sure. These NULL assignments helped me with keeping track of the work
during the conversion. I forgot to remove them here and in the other patc=
h.

Best regards
Thomas

>=20
>>  static const struct drm_encoder_helper_funcs ast_enc_helper_funcs =3D=
 {
>>  	.dpms =3D ast_encoder_dpms,
>>  	.prepare =3D ast_encoder_prepare,
>> @@ -976,10 +1045,33 @@ static void ast_cursor_fini(struct drm_device *=
dev)
>> =20
>>  int ast_mode_init(struct drm_device *dev)
>>  {
>> +	static const uint32_t primary_plane_formats[] =3D {
>> +		DRM_FORMAT_XRGB8888,
>> +		DRM_FORMAT_RGB565,
>> +		DRM_FORMAT_C8,
>> +	};
>=20
> I'd suggest to move this out of the function.
>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--77fQnirq3sP2mEMJoPr2HCAgVGjnVXUeF--

--LzfqNm7szLjJfJ9rIcacHMNnpr9DdUr6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3Cg04ACgkQaA3BHVML
eiMt4AgAjEmeyMLVUw4fzEfbLL3k4o+yZuVqNFu0wf/oxP4l65JDZqCaLhCgPSeQ
O5G/q0YKZnO18TrTC7AKTy99hyFTdZo39YcTS9OjC8d8iRu5Sw6hCk29tpOwN4Oj
2zAjPCvBoLPLeyNLRVky4k6CYBMCC1Z/USEPS1sqbq0KEZHjpXJWDdglKa14Vv/P
IqsxNaXamD9acqp5DoN5Gr/qApP4OcvlJafru/jNFWLmy2tuQ3B5qv3Tzq7J7oa9
Yczg0xOy45nJ58czuZIZ2SBWP4n9opQmXU4UXdd8uiHwc++LPjxEq4CaRvGfNeXM
/24eY4lgWiD/c6brLecwIkGS3xRhgQ==
=PhJA
-----END PGP SIGNATURE-----

--LzfqNm7szLjJfJ9rIcacHMNnpr9DdUr6x--

--===============0532360099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0532360099==--
