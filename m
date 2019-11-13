Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFEEFABD8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 09:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FD96E083;
	Wed, 13 Nov 2019 08:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468E26E083
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:17:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74EA5B46A;
 Wed, 13 Nov 2019 08:17:15 +0000 (UTC)
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
To: John Donnelly <john.p.donnelly@oracle.com>
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
 <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
 <43822B6A-45CB-4158-A52F-03F4669FAC5C@oracle.com>
 <B044F752-0120-484C-9C12-5A6FBD64B753@oracle.com>
 <c8999224-f585-e3fe-ec60-63632f005fc9@suse.de>
 <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
 <819f97a5-fcbe-7e8e-4b10-a09e838a69e6@suse.de>
 <3E3FE3C2-AD75-4F21-A73B-A69A652BC46D@oracle.com>
 <41394290-cc37-07b6-72cd-ea0ef41f2d7f@suse.de>
 <339CFF4F-7128-4749-9673-16518161E09F@oracle.com>
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
Message-ID: <d448d263-aa5e-35ec-df7c-69cc4828a318@suse.de>
Date: Wed, 13 Nov 2019 09:17:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <339CFF4F-7128-4749-9673-16518161E09F@oracle.com>
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
Cc: dri-devel@lists.freedesktop.org, allen <allen.pais@oracle.com>
Content-Type: multipart/mixed; boundary="===============1976787035=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1976787035==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2Cj4Q2HK6olOnbyKIZpr5SaBY0XpOy3rq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2Cj4Q2HK6olOnbyKIZpr5SaBY0XpOy3rq
Content-Type: multipart/mixed; boundary="AZ6jiktsIXxteF1sp3ddw2p6PDpGJjJXq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <john.p.donnelly@oracle.com>
Cc: dri-devel@lists.freedesktop.org, allen <allen.pais@oracle.com>
Message-ID: <d448d263-aa5e-35ec-df7c-69cc4828a318@suse.de>
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
 <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
 <43822B6A-45CB-4158-A52F-03F4669FAC5C@oracle.com>
 <B044F752-0120-484C-9C12-5A6FBD64B753@oracle.com>
 <c8999224-f585-e3fe-ec60-63632f005fc9@suse.de>
 <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
 <819f97a5-fcbe-7e8e-4b10-a09e838a69e6@suse.de>
 <3E3FE3C2-AD75-4F21-A73B-A69A652BC46D@oracle.com>
 <41394290-cc37-07b6-72cd-ea0ef41f2d7f@suse.de>
 <339CFF4F-7128-4749-9673-16518161E09F@oracle.com>
In-Reply-To: <339CFF4F-7128-4749-9673-16518161E09F@oracle.com>

--AZ6jiktsIXxteF1sp3ddw2p6PDpGJjJXq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi John

Am 12.11.19 um 20:13 schrieb John Donnelly:
>=20
> In short .  I started   with :
>=20
> git bisect start=20
>=20
> git bisect bad be8454afc50f
>=20
>  git bisect good fec88ab0af97
>=20
> And at the  the end of   bisects  showed this was the offending commit =
:
>=20
> c0a74c732568=20
>=20
> commit c0a74c732568ad347f7b3de281922808dab30504 (refs/bisect/bad)
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Fri May 24 20:35:22 2019 +0300
>=20
>     drm/i915: Update DRIVER_DATE to 20190524
>    =20
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> That does not have any real relevance

No, that doesn't look right. The other bad commits you list below also
don't seem to be related.

You could also bisect between your original working commit (v4.18?) and
the one you want to upgrade to (v5.3?). It's only a few more builds but
might be might give better results.

BTW, are you also converting Gnome from X11 to Wayland. I found that
Gnome's Wayland code is so slow on mgag200 that it's unusable. They
recently added a shadow FB [1] to improve performance, but it won't be
available before Gnome 3.36.

Best regards
Thomas

[1] https://gitlab.gnome.org/GNOME/mutter/merge_requests/877/diffs

>=20
>=20
> I am not sure if I did  the  bisects correctly .   After each test I di=
d :
> =20
>=20
> #1  git bisect bad 827440a90146
>=20
> #2  git bisect bad f5b07b04e5f0
>=20
> #3  git bisect bad c0a74c732568
>=20
> #4  git bisect good 818f5cb3e8fb
>=20
> #5  git bisect good 6cfe7ec02e85
>=20
> #6 git bisect good f71e01a78bee
>=20
> #7  git bisect good 09a93ef3d60f
>=20
> #8  git bisect good f1e6b336bafa
>=20
> #9 git bisect good eaf20e6933dc
>=20
> #10  git bisect good 63e8dcdb4f8e
>=20
> #11  git bisect good 397049a03022
>=20
> I=E2=80=99ve restarted the bisect without appending the  <commit-id> af=
ter a  the =E2=80=9Cbad|good =E2=80=9C  ,  and so far git  is showing the=
 same selections.=20
>=20
>=20
>=20
>=20
>=20
>=20
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


--AZ6jiktsIXxteF1sp3ddw2p6PDpGJjJXq--

--2Cj4Q2HK6olOnbyKIZpr5SaBY0XpOy3rq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3LvAoACgkQaA3BHVML
eiNznwgAvcMQMty9DAhPzV/gqNhW0sZmeWyPoQa6iT123PCOx+dlNMkeRRoyloeO
06uXPaWscFWoq4aNFrAPHjgp7RknC1mHYNKpBz9NN8eLTJc8yKjpVBLviSzV4AtE
aH2tpDvQF8qpw1Xco7px6NapP+jQ7UnhBxQjtrhyvJRj6h+7JPwds6zPSTCZ/jRR
3oA121xTdWdDcnCN73GoOC9tnfZ2RV1pDll/I4deQMsKYlDFzoAWYIKISnlr+pgw
xE0CKGQzWotk4l1ZL08STwrVHI3EfvpDx4EVpwlZJzyy0HUnQSemv+rpOYoiHi5c
60E6EX2Y4bJDs1bQENEQtaqt+snfnQ==
=Sr+v
-----END PGP SIGNATURE-----

--2Cj4Q2HK6olOnbyKIZpr5SaBY0XpOy3rq--

--===============1976787035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1976787035==--
