Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30315703B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A9B6E908;
	Mon, 10 Feb 2020 08:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625DB6E908
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 08:10:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9E069B05D;
 Mon, 10 Feb 2020 08:10:01 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/udl: Clear struct drm_connector_funcs.dpms
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200207141602.4760-1-tzimmermann@suse.de>
 <20200207141602.4760-2-tzimmermann@suse.de>
 <20200207164147.GP43062@phenom.ffwll.local>
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
Message-ID: <1cfe7ae4-0ea9-d2f6-6c7b-4a4714519702@suse.de>
Date: Mon, 10 Feb 2020 09:09:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207164147.GP43062@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sam@ravnborg.org, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============2122178384=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2122178384==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2CRefXC7p3wvPBA9bNpPcCw2yeTnn0ZXP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2CRefXC7p3wvPBA9bNpPcCw2yeTnn0ZXP
Content-Type: multipart/mixed; boundary="fA7kc4duF7fstk0zV5oFGxhwRDkZX4zWJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, sam@ravnborg.org, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Message-ID: <1cfe7ae4-0ea9-d2f6-6c7b-4a4714519702@suse.de>
Subject: Re: [PATCH 2/2] drm/udl: Clear struct drm_connector_funcs.dpms
References: <20200207141602.4760-1-tzimmermann@suse.de>
 <20200207141602.4760-2-tzimmermann@suse.de>
 <20200207164147.GP43062@phenom.ffwll.local>
In-Reply-To: <20200207164147.GP43062@phenom.ffwll.local>

--fA7kc4duF7fstk0zV5oFGxhwRDkZX4zWJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.02.20 um 17:41 schrieb Daniel Vetter:
> On Fri, Feb 07, 2020 at 03:16:02PM +0100, Thomas Zimmermann wrote:
>> Atomic modesetting doesn't use struct drm_connector_funcs.dpms and
>> the set function, drm_helper_connector_dpms(), wouldn't support it
>> anyway. So keep the pointer to NULL.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> On both patches:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> I just suggested a drm_mode_config_validate() to Ville in his patch
> series, which runs in drm_dev_register(). Maybe we could add a check fo=
r
> that for atomic drivers? It's a bit a game of whack-a-mole otherwise :-=
)

=46rom the 'git grep' I'd say those where the only atomic drivers to set
the callback. The others where non-atomic ones. OTOH, I recently thought
on several occasions that this or that behaviour should be enforced at
least by WARN_ON.

Best regards
Thomas

> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/udl/udl_connector.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl=
/udl_connector.c
>> index e9671d38b4a0..0afdfb0d1fe1 100644
>> --- a/drivers/gpu/drm/udl/udl_connector.c
>> +++ b/drivers/gpu/drm/udl/udl_connector.c
>> @@ -109,7 +109,6 @@ static const struct drm_connector_helper_funcs udl=
_connector_helper_funcs =3D {
>>  };
>> =20
>>  static const struct drm_connector_funcs udl_connector_funcs =3D {
>> -	.dpms =3D drm_helper_connector_dpms,
>>  	.reset =3D drm_atomic_helper_connector_reset,
>>  	.detect =3D udl_detect,
>>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>> --=20
>> 2.25.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--fA7kc4duF7fstk0zV5oFGxhwRDkZX4zWJ--

--2CRefXC7p3wvPBA9bNpPcCw2yeTnn0ZXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5BD9cACgkQaA3BHVML
eiNO7Af+KW3Awb0DegbAlCMtYMcsp/Dz1EArz7A10LPOyBEaQ9e85uAX02vzx7eN
uBiwZWK7KahNgLuFencQL7TJmr+I4jxl2y5CdrfwdIUl+GeRsbpZanYUxTSMytk6
F0UaFZdPiF08/IeIjDgXDdU8ouBCkbq+rYFbib/XhvRZHBW3GoGBx3cmlb8K0yi6
chlyugE2GRmicZIkp3QEsCpORgvp0IJ1zq+q2hQGS9NKNRZDwwVbK7SOMXQK7pX7
gPDIQORD0t8GRy1xZaabNbPctsrYfoaMCBoZw5fzIINZPxm58aWoMxNISppoR+VJ
3ZrqILx5daiNNW6KI/7x3eiCW95qBA==
=tVhx
-----END PGP SIGNATURE-----

--2CRefXC7p3wvPBA9bNpPcCw2yeTnn0ZXP--

--===============2122178384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2122178384==--
