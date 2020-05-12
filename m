Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A81CFDBD
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9BC89DB9;
	Tue, 12 May 2020 18:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFA589DB9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 18:48:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4EAA6ABE6;
 Tue, 12 May 2020 18:48:02 +0000 (UTC)
Subject: Re: [PATCH v2 13/15] drm/mgag200: Use simple-display data structures
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-14-tzimmermann@suse.de>
 <CACvgo52PubG0Qp+9GLYB1A5CfW7j86WmMwfwqbYqTZR186+oGg@mail.gmail.com>
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
Message-ID: <57b4b017-7086-9dd8-3e55-aa92ee40955d@suse.de>
Date: Tue, 12 May 2020 20:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACvgo52PubG0Qp+9GLYB1A5CfW7j86WmMwfwqbYqTZR186+oGg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1374131401=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1374131401==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SMRL2nqhMUgJ6iJLC5ZKUbFoHxljyDmMi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SMRL2nqhMUgJ6iJLC5ZKUbFoHxljyDmMi
Content-Type: multipart/mixed; boundary="rm6G3yRzB5OATyU0IliDZK0O9kFITLcol";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: john.p.donnelly@oracle.com, ML dri-devel
 <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <57b4b017-7086-9dd8-3e55-aa92ee40955d@suse.de>
Subject: Re: [PATCH v2 13/15] drm/mgag200: Use simple-display data structures
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-14-tzimmermann@suse.de>
 <CACvgo52PubG0Qp+9GLYB1A5CfW7j86WmMwfwqbYqTZR186+oGg@mail.gmail.com>
In-Reply-To: <CACvgo52PubG0Qp+9GLYB1A5CfW7j86WmMwfwqbYqTZR186+oGg@mail.gmail.com>

--rm6G3yRzB5OATyU0IliDZK0O9kFITLcol
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.05.20 um 12:16 schrieb Emil Velikov:
> Hi Thomas,
>=20
> On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>=20
>>  static void mga_crtc_init(struct mga_device *mdev)
>>  {
>>         struct drm_device *dev =3D mdev->dev;
>> -       struct mga_crtc *mga_crtc;
>> -
>> -       mga_crtc =3D kzalloc(sizeof(struct mga_crtc) +
>> -                             (MGAG200FB_CONN_LIMIT * sizeof(struct dr=
m_connector *)),
>=20
> The #define MGAG200FB_CONN_LIMIT in mgag200_drv.h is no longer used, co=
rrect?

Good point. I'll remove the define.

Best regards
Thomas

>=20
> -Emil
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


--rm6G3yRzB5OATyU0IliDZK0O9kFITLcol--

--SMRL2nqhMUgJ6iJLC5ZKUbFoHxljyDmMi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl66714ACgkQaA3BHVML
eiNyPAf/dYBeAdbytMj2AJaaVrW5sSnQaUj/Sj6MboYEFanoXwPBI/iuZDL3v8P0
VKfMN4lwOl0gtaGZOJc6AyaFp+Cw63/9Oqkr8ssWuPo8YgxoAo8pd1pOSewiGQX4
1FIgmJOX3OK2v1hUrEQE48t7yKKpdA1cNIhBixg/sWPqwVz737tq8oGSxGNptkdv
5vZP9ogt1trMOUCs4FUtbE/SGWLluMrpXiuKhooopAo9BLOQFaYPkETsLZJt8VvF
sz2V69DOwRfV+q/d3nsirSUVLd7pByyez5hiLYkqcUcAnK1NT7OMHnvYjLAoAzox
q56WoexJ0tbBuVcEbxaI7uBgaLS/rw==
=s8KY
-----END PGP SIGNATURE-----

--SMRL2nqhMUgJ6iJLC5ZKUbFoHxljyDmMi--

--===============1374131401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1374131401==--
