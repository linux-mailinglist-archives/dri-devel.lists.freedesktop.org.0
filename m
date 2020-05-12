Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79441CFD5C
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BC86E118;
	Tue, 12 May 2020 18:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE646E118
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 18:34:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0C35ADE3;
 Tue, 12 May 2020 18:34:38 +0000 (UTC)
Subject: Re: [PATCH v2 07/15] drm/mgag200: Set pitch in a separate helper
 function
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-8-tzimmermann@suse.de>
 <CACvgo51jGbEwSOMv=fpWtsBJ9v5j0EZtX=iN9y0DfyHqoVXa-w@mail.gmail.com>
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
Message-ID: <60ba1692-b517-4eeb-d1c9-368a7616e5c9@suse.de>
Date: Tue, 12 May 2020 20:34:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACvgo51jGbEwSOMv=fpWtsBJ9v5j0EZtX=iN9y0DfyHqoVXa-w@mail.gmail.com>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============1637511505=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1637511505==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h7wvBPe5E32a0aGBZ2cD1yGvl40jcGEx6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h7wvBPe5E32a0aGBZ2cD1yGvl40jcGEx6
Content-Type: multipart/mixed; boundary="h9kfY513VOzeVDfKaVbrPMmuXQxKPTO38";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>, john.p.donnelly@oracle.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <60ba1692-b517-4eeb-d1c9-368a7616e5c9@suse.de>
Subject: Re: [PATCH v2 07/15] drm/mgag200: Set pitch in a separate helper
 function
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-8-tzimmermann@suse.de>
 <CACvgo51jGbEwSOMv=fpWtsBJ9v5j0EZtX=iN9y0DfyHqoVXa-w@mail.gmail.com>
In-Reply-To: <CACvgo51jGbEwSOMv=fpWtsBJ9v5j0EZtX=iN9y0DfyHqoVXa-w@mail.gmail.com>

--h9kfY513VOzeVDfKaVbrPMmuXQxKPTO38
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 12.05.20 um 12:27 schrieb Emil Velikov:
> Hi Thomas,
>=20
> On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>=20
>> @@ -1143,20 +1178,15 @@ static int mga_crtc_mode_set(struct drm_crtc *=
crtc,
>>         WREG_CRT(13, 0);
>>         WREG_CRT(14, 0);
>>         WREG_CRT(15, 0);
>> -       WREG_CRT(19, pitch & 0xFF);
>> -
> This write has disappeared without an equivalent or a comment.
> Is that intentional?

It's still there. It's now located in mgag200_set_offset() and 19 is
written as 0x13. :) I try to follow the naming style of the MGA
programming manual, which prefers hexadecimal numbers.

Best regards
Thomas

>=20
>=20
> -Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--h9kfY513VOzeVDfKaVbrPMmuXQxKPTO38--

--h7wvBPe5E32a0aGBZ2cD1yGvl40jcGEx6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl667DsACgkQaA3BHVML
eiMI5AgAsMzCgrSmazL8saYcPm7GLWhlh+fnm7Ueuw26cXQW5F9BhqRSaldB7gHw
9GzOsvjpU7FEphi9sPWQbFMUQdjKBfgxV9ID54ECWVKaVULPuh/xkG82g0MYISy3
e7QIUNiFczKW8tU8O/IqEnbqHeiIiM+96Xi+u4RiKuE1QyRr0acH7YNiA5Clhpou
grZXVGMl0/StG08b7waIZ9KmA5Te7lnYewvfICXNP5hDzHtiGfpos7mQEq9NfeCC
05K+IGF2xw747qMaZAdW3LJpE2tXb0xQ/idAPAlAoWyYhGKIB7FbCs4r1DnD/l1u
GrMkZLfVcwOpNx+02UgyD4pY4hG9mg==
=MVwf
-----END PGP SIGNATURE-----

--h7wvBPe5E32a0aGBZ2cD1yGvl40jcGEx6--

--===============1637511505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1637511505==--
