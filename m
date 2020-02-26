Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFE016F743
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 06:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CAB6E0EB;
	Wed, 26 Feb 2020 05:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A626E0EA;
 Wed, 26 Feb 2020 05:28:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77661AE41;
 Wed, 26 Feb 2020 05:28:20 +0000 (UTC)
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
 <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A@mail.gmail.com>
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
Message-ID: <d64d2de7-8c0d-ca32-e9a3-706b98019c46@suse.de>
Date: Wed, 26 Feb 2020 06:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A@mail.gmail.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0531127162=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0531127162==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl
Content-Type: multipart/mixed; boundary="CDRuovX7jI9aChelSbkaae7Qnej5MM0rK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <d64d2de7-8c0d-ca32-e9a3-706b98019c46@suse.de>
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
 <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A@mail.gmail.com>
In-Reply-To: <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A@mail.gmail.com>

--CDRuovX7jI9aChelSbkaae7Qnej5MM0rK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 25.02.20 um 18:37 schrieb Emil Velikov:
> Hi Thomas,
>=20
> On Tuesday, 25 February 2020, Thomas Zimmermann <tzimmermann@suse.de
> <mailto:tzimmermann@suse.de>> wrote:
>=20
>     Non-KMS drivers store state in struct drm_driver. This bloats the
>     structure for KMS drivers and prevents it from being declared with
>     'static const' qualifiers. Moving the non-KMS state into a separate=

>     data structure resolves this.
>=20
>=20
> Have you considered subclassing the const drm_driver for legacy drivers=
=2E
> This way the legacy (pointer) data does not need to be exposed to
> non-legacy drivers.

I didn't want to do an upcast each time the legacy data is required. I
know that subclassing is closer to the style of current DRM, but given
the current code base, the additional legacy pointer seemed like the
lesser evil.

Best regards
Thomas

>=20
> Not to mention that const data (drm_driver), which has (const) pointer
> to mutable data (legacy bits) is a trap IMHO
>=20
> Emil

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CDRuovX7jI9aChelSbkaae7Qnej5MM0rK--

--Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5WAfMACgkQaA3BHVML
eiPooggAnxmtcTkZSlg/VKh8bBT+rcT3+1L9bVvmSY71wBKeFJATIQWIFiceXENW
3qjpSIl9NI7A4L2j7oO7pdbQCI0onxzGYdPl3ua59ys28zoUCJ+W0pnrJgD6Zxdl
euXiOJR7g8PdvpMMtaVPe0zCQhGFMN4+Z8HT+EmuxMdoz0JT4aaqpA2/8nHXNEYl
d+0QFHqNPA9rp1+sdVe+mrR148adaC+0bqHs3k8L9CxMacERjyj0ozHj0EhHrSbU
6rV5Pp/x9HxBdMKhA1BQlOy8G0PCbsETNsoFPVJ18IM1H+UlcXVDVZq1mpvLM6sm
GyHYmIK55k/Dk6OlamduDiGXci1stw==
=E9s1
-----END PGP SIGNATURE-----

--Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl--

--===============0531127162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0531127162==--
