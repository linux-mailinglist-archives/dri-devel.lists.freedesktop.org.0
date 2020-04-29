Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9021BE1DA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B486EEC4;
	Wed, 29 Apr 2020 14:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965886EF20
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:57:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 622A8ABD7;
 Wed, 29 Apr 2020 14:57:47 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: remove duplicate assignment of ast_crtc_funcs
 member
To: Jason Yan <yanaijie@huawei.com>, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200429141010.8445-1-yanaijie@huawei.com>
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
Message-ID: <43183725-a490-611d-bf4d-fc23cfca44d9@suse.de>
Date: Wed, 29 Apr 2020 16:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200429141010.8445-1-yanaijie@huawei.com>
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
Content-Type: multipart/mixed; boundary="===============0393803478=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0393803478==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="q3NSRBFoOQ5Q44HGU4NspjrfPrqs2jjCe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--q3NSRBFoOQ5Q44HGU4NspjrfPrqs2jjCe
Content-Type: multipart/mixed; boundary="PdHyAhPwIUQwBcMYmwi3tyjBpfBzIKV1b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jason Yan <yanaijie@huawei.com>, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <43183725-a490-611d-bf4d-fc23cfca44d9@suse.de>
Subject: Re: [PATCH] drm/ast: remove duplicate assignment of ast_crtc_funcs
 member
References: <20200429141010.8445-1-yanaijie@huawei.com>
In-Reply-To: <20200429141010.8445-1-yanaijie@huawei.com>

--PdHyAhPwIUQwBcMYmwi3tyjBpfBzIKV1b
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.04.20 um 16:10 schrieb Jason Yan:
> The struct member 'set_config' was assigned twice:
>=20
> static const struct drm_crtc_funcs ast_crtc_funcs =3D {
> 	.reset =3D ast_crtc_reset,
> 	.set_config =3D drm_crtc_helper_set_config,
> 	......
> 	.set_config =3D drm_atomic_helper_set_config,
> 	......
> };
>=20
> Since the second one is which we use now in fact, we can remove the
> first one.
>=20
> This fixes the following coccicheck warning:
>=20
> drivers/gpu/drm/ast/ast_mode.c:932:50-51: set_config: first occurrence
> line 934, second occurrence line 937
>=20
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! I'll apply the patch to drm-misc-next soonish.

Best regards
Thomas

> ---
>  drivers/gpu/drm/ast/ast_mode.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index d2ab81f9c498..7062bcd78740 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -931,7 +931,6 @@ static void ast_crtc_atomic_destroy_state(struct dr=
m_crtc *crtc,
> =20
>  static const struct drm_crtc_funcs ast_crtc_funcs =3D {
>  	.reset =3D ast_crtc_reset,
> -	.set_config =3D drm_crtc_helper_set_config,
>  	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
>  	.destroy =3D ast_crtc_destroy,
>  	.set_config =3D drm_atomic_helper_set_config,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PdHyAhPwIUQwBcMYmwi3tyjBpfBzIKV1b--

--q3NSRBFoOQ5Q44HGU4NspjrfPrqs2jjCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6plegACgkQaA3BHVML
eiNUrwf7BzNxEOCYMo4loRRgbH3ob+BUDTqm98C5VqTDbVmHz+XnRQ56D6b72ic0
JRBWAxfjOKPAQOAmA8+qKFKFCeQ16wvnYD1n4E+OHfoBd53iHDqHkkSd99ll0Erf
76IlFp1PQ3WgjCC56BjbqbKYX3VbvD7fjarFRrRfK4tzEp5+B31WdHzsMGoRcopU
Q3ac8fzAXEhLlLM6AOnhtEovYvVz4YVqVXQEgvEwI1GLbUDu78TeJc1FQckcL9Am
4ogiZ4oAtTt5nQYKq6zDtlD5jI3hnIoIlTj8KHX/m5BNEIQXN2LM+Iq1mG7n3Gag
9V9n6YX0md0K365JIjrNxo93uyVNPQ==
=ciLe
-----END PGP SIGNATURE-----

--q3NSRBFoOQ5Q44HGU4NspjrfPrqs2jjCe--

--===============0393803478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0393803478==--
