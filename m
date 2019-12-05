Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E626113CBD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2EA6F5B9;
	Thu,  5 Dec 2019 08:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE5C6F5B3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:05:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4EF5FB282;
 Thu,  5 Dec 2019 08:05:34 +0000 (UTC)
Subject: Re: [PATCH] drm/mgag200: Debug-print unique revisions id on G200 SE
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20191204133435.17462-1-tzimmermann@suse.de>
 <20191205080302.4oswszd3znca3xh7@sirius.home.kraxel.org>
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
Message-ID: <711e8df6-f10e-209e-fd07-f6a8d90e6824@suse.de>
Date: Thu, 5 Dec 2019 09:05:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191205080302.4oswszd3znca3xh7@sirius.home.kraxel.org>
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
Cc: airlied@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 john.p.donnelly@oracle.com
Content-Type: multipart/mixed; boundary="===============0836347327=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0836347327==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QjCWFBLNwmNldBqFGOPRRwrk6A5sPZB1C"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QjCWFBLNwmNldBqFGOPRRwrk6A5sPZB1C
Content-Type: multipart/mixed; boundary="Hbu7AlRHe4a3yidJtrLXkmJTHXgxmrTP9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org
Message-ID: <711e8df6-f10e-209e-fd07-f6a8d90e6824@suse.de>
Subject: Re: [PATCH] drm/mgag200: Debug-print unique revisions id on G200 SE
References: <20191204133435.17462-1-tzimmermann@suse.de>
 <20191205080302.4oswszd3znca3xh7@sirius.home.kraxel.org>
In-Reply-To: <20191205080302.4oswszd3znca3xh7@sirius.home.kraxel.org>

--Hbu7AlRHe4a3yidJtrLXkmJTHXgxmrTP9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.12.19 um 09:03 schrieb Gerd Hoffmann:
> On Wed, Dec 04, 2019 at 02:34:35PM +0100, Thomas Zimmermann wrote:
>> The behavior of MGA G200 SE depends on the rev id. Print the id when
>> debugging is enabled.
>=20
> That is the one where some need a workaround, right?

Yes. Hopefully this ID helps with figuring out the broken ones.

>=20
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_main.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>> index e1bc5b0aa774..aeb7c10ded0d 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -118,8 +118,11 @@ static int mgag200_device_init(struct drm_device =
*dev,
>>  		return -ENOMEM;
>> =20
>>  	/* stash G200 SE model number for later use */
>> -	if (IS_G200_SE(mdev))
>> +	if (IS_G200_SE(mdev)) {
>>  		mdev->unique_rev_id =3D RREG32(0x1e24);
>> +		DRM_DEBUG("G200 SE unique revision id is 0x%x\n",
>> +			  mdev->unique_rev_id);
>=20
> Maybe use DRM_INFO here?  Temporarily for a few kernel revisions, until=

> things are settled?
>=20
> (just a suggestion, your choice).
>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks.

Best regards
Thomas

>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Hbu7AlRHe4a3yidJtrLXkmJTHXgxmrTP9--

--QjCWFBLNwmNldBqFGOPRRwrk6A5sPZB1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3ouk0ACgkQaA3BHVML
eiM50Qf+KIRCPWm6G3zbwzyvWqCVHXw+3RryI1M+L4PT8GxG+aZycKwRo9K0BE1v
9tWhdW+cxdFt/dmshHQWTULjs86fAu9nDtoA5m22qhISMbE1+ia5tAl+1kxX37ai
h+TClmaVG60Jqo5aoqIWMNKCJfVdZIsD1BkhKd3nWSufZhMDJ+c1wAbqGbTsm4XK
AhIR5osulTbDw2ed5tF+GiA4KADS/XFUMN/mQG3iytDslBIJ7rV2ZtzsoBgn9saM
FJj1Zw3oSPiOnjWCsZoOyel2cOZcz30jwqp9e5X2ekzQ2rm5QJuNx6iiG8jyK1NP
K8eHIIgsktFXWaUm6hWK5LfRLbSenQ==
=T0dp
-----END PGP SIGNATURE-----

--QjCWFBLNwmNldBqFGOPRRwrk6A5sPZB1C--

--===============0836347327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0836347327==--
