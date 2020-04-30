Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181061BF461
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 11:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C00A6E1BE;
	Thu, 30 Apr 2020 09:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A0E6E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 09:44:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9C52FAE12;
 Thu, 30 Apr 2020 09:44:13 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200430091330.9824-1-tzimmermann@suse.de>
 <20200430092229.GB15077@ravnborg.org>
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
Message-ID: <197de4db-5926-bb4f-c29a-fc5d1c062c92@suse.de>
Date: Thu, 30 Apr 2020 11:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200430092229.GB15077@ravnborg.org>
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
Cc: airlied@redhat.com, emil.velikov@collabora.com, cogarre@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0220164858=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0220164858==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="d5maLDK9iFXPdXTYJM8DjzH6QIb7ujV8p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--d5maLDK9iFXPdXTYJM8DjzH6QIb7ujV8p
Content-Type: multipart/mixed; boundary="MM7BEqSKuF0WuGyUqJIXXSrv7bQxZTrzu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, emil.velikov@collabora.com
Message-ID: <197de4db-5926-bb4f-c29a-fc5d1c062c92@suse.de>
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
References: <20200430091330.9824-1-tzimmermann@suse.de>
 <20200430092229.GB15077@ravnborg.org>
In-Reply-To: <20200430092229.GB15077@ravnborg.org>

--MM7BEqSKuF0WuGyUqJIXXSrv7bQxZTrzu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.04.20 um 11:22 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Thu, Apr 30, 2020 at 11:13:30AM +0200, Thomas Zimmermann wrote:
>> Suspending failed because there's no mode if the CRTC is being
>> disabled. Early-out in this case. This fixes runtime PM for ast.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Don't you miss:
>=20
> Reported-by:
> Tested-by:

Waiting for the reporter's ok.

> Fixes:

Indeed. :(

Best regards
Thomas

> ???
>=20
> 	Sam
>=20
>> ---
>>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index 7a9f20a2fd303..089b7d9a0cf3f 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct drm=
_crtc *crtc,
>>  		return -EINVAL;
>>  	}
>> =20
>> +	if (!state->enable)
>> +		return 0; /* no checks required if CRTC is being disabled */
>> +
>>  	ast_state =3D to_ast_crtc_state(state);
>> =20
>>  	format =3D ast_state->format;
>> --=20
>> 2.26.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--MM7BEqSKuF0WuGyUqJIXXSrv7bQxZTrzu--

--d5maLDK9iFXPdXTYJM8DjzH6QIb7ujV8p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6qneoACgkQaA3BHVML
eiN1TwgAkw37OIsV2Y5VZHa/AomeBiXOldWiGcXb6VQNmKsBsUzE1NwRuSpSUTM0
v93mMuWZ9Sr/i5r3dWODUYhEv6I5vLNxbqz7I+7TxqE+5ORRVqwq3HDhXqh8ZE8G
pYRATYG7fExmgjzGAtrmWGOJqrTmOFh2iMeNlZ8DQcrR5qJhosQA1oYakOM27ujl
fGlRssixPWPWESqY60dXlDlpF9ckl//wKXUqoEidWVIw5gnSFI252QBYLzMyEOUP
SxF5MHmIL+5CwXY7585SdjQwhcK/kd/J6KlFBI7S/NW502UlrIIxT3lzNgjDCOUd
QNGIM969GRDXzHPDy/Xn2/eXsizvtg==
=KK73
-----END PGP SIGNATURE-----

--d5maLDK9iFXPdXTYJM8DjzH6QIb7ujV8p--

--===============0220164858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0220164858==--
