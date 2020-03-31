Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBF198C1D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 08:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFBB6E267;
	Tue, 31 Mar 2020 06:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C139A6E267
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 06:14:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DE29AB76;
 Tue, 31 Mar 2020 06:14:20 +0000 (UTC)
Subject: Re: [PATCH v2 1/6] drm/vblank: Add intro to documentation
To: Lyude Paul <lyude@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-2-sam@ravnborg.org>
 <20200330185746.GB7594@ravnborg.org>
 <1a22bece197d382206f7943f82dd1250afe32ba0.camel@redhat.com>
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
Message-ID: <a856d1be-fde9-3b5a-e617-8a99e5d00673@suse.de>
Date: Tue, 31 Mar 2020 08:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1a22bece197d382206f7943f82dd1250afe32ba0.camel@redhat.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mikita Lipski <mikita.lipski@amd.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0550833542=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0550833542==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3lcqFTZezVlO1YNF20mx9rJ80n2BPBgXe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3lcqFTZezVlO1YNF20mx9rJ80n2BPBgXe
Content-Type: multipart/mixed; boundary="1lTR1PUCiVHfTlSu0t4QumrAijgRBsilC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lyude Paul <lyude@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 David Francis <David.Francis@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Nirmoy Das <nirmoy.das@amd.com>
Message-ID: <a856d1be-fde9-3b5a-e617-8a99e5d00673@suse.de>
Subject: Re: [PATCH v2 1/6] drm/vblank: Add intro to documentation
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-2-sam@ravnborg.org>
 <20200330185746.GB7594@ravnborg.org>
 <1a22bece197d382206f7943f82dd1250afe32ba0.camel@redhat.com>
In-Reply-To: <1a22bece197d382206f7943f82dd1250afe32ba0.camel@redhat.com>

--1lTR1PUCiVHfTlSu0t4QumrAijgRBsilC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

just a few more nits below.

Am 30.03.20 um 23:51 schrieb Lyude Paul:
> I am glad that my explanation of vblanks made sense! Some comments belo=
w on
> things I think we could improve here
>=20
> On Mon, 2020-03-30 at 20:57 +0200, Sam Ravnborg wrote:
>> Lyude Paul wrote a very good intro to vblank here:
>>
> https://lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf0=
85f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27
>>
>> Add this to the intro chapter in drm_vblank.c so others
>> can benefit from it too.
>>
>> v2:
>>   - Reworded to improve readability (Thomas)
>>
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Co-developed-by: Lyude Paul <lyude@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@linux.ie>
>> ---
>>  drivers/gpu/drm/drm_vblank.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index bcf346b3e486..ec2c2083b186 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -41,6 +41,23 @@
>>  /**
>>   * DOC: vblank handling
>>   *
>> + * From the computer's perspective, every time the monitor displays
>> + * a new frame the scanout engine have "scanned out" the display imag=
e
>> + * from top to bottom, one row of pixels at a time.
>> + * The current row of pixels is referred to as the current scanline.
>> + *
>> + * In addition to the display's visible area, there's usually a coupl=
e of
>> + * extra scanlines which aren't actually displayed on the screen
>> + * (the extra scanlines are sometimes used by HDMI audio and friends)=
=2E
>> + * The period where the extra scanlines are "scanned out" is referred=

>> + * to as the vertical blanking period (vblank for short).
>=20
> I'd reword this, starting from "(the extra scanlines=E2=80=A6" (I'd als=
o remove the
> paranthesis):
>=20
>     These extra scanlines don't contain image data, and are occasionall=
y used
>     for features like audio and infoframes. The region made up of these=

>     scanlines is referred to as the vertical blanking region, or vblank=
 for
>     short.
>=20
> I'd also add a simple ascii-art diagram here, since this might make a l=
ot more
> sense to some people if there's a visual reference. Probably something =
like
> this (feel free to get a little creative)
>=20
>      =E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD
>     |                                                |
>     |                                                |
>     |                   New frame                    |
>     |                                                |
>     |=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=
=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=
=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=
=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93|
>     |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| =E2=86=90 Scanli=
ne, updates the
>     |=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=
=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=
=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=
=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93|   fra=
me as it travels
>     |                                                |   down (AKA "sca=
ns out")
>     |                                                |
>     |                                                |
>     |                   Old frame                    |
>     |                                                |
>     |                                                |
>     |                                                |
>     |                                                |
>     |                                                |   physical botto=
m of
>     |=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD| =E2=86=
=90 display
>     =E2=94=86xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=E2=94=86
>     =E2=94=86xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=E2=94=86 =
=E2=86=90 vertical blanking
>     =E2=94=86xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=E2=94=86 =
  region
>      ------------------------------------------------
>> + *
>> + * On a lot of display hardware, programming needs to take effect dur=
ing
>> the
>> + * vertical blanking period so that settings like gamma, what frame b=
eing
>=20
> s/what frame being/which frame is being/

I still had read it twice in either variant. Maybe:

s/what frame being scanned out/the displayed image buffer

>=20
>> + * scanned out, etc. can be safely changed without showing visual tea=
ring

I think tearing refers specifically to mid-frame buffer flips. Maybe

s/tearing/artifacts

or

s/tearing/distortion

Best regards
Thomas

>> + * on the screen. In some unforgiving hardware, some of this programm=
ing
>> has
>> + * to both start and end in the same vblank - vertical blanking perio=
d.
>=20
> You can just say vblank here, since we already explained what the verti=
cal
> blanking period is up above.
>=20
> Alex Deucher pointed out to me that it's probably also worth mentioning=
 that not
> all hardware actually fires off the vblank interrupt at the start of th=
e
> vertical blank, depending on the hardware the interrupt could also happ=
en a few
> scanlines after the start of vblank, a few scanlines before the start, =
somewhere
> in the middle, at the end of the vblank, etc.
>=20
> Other then that, this looks great so far! Feel free to cc me in the res=
pin for
> this patch and I'll be happy to give my r-b.
>=20
>> + *
>>   * Vertical blanking plays a major role in graphics rendering. To ach=
ieve
>>   * tear-free display, users must synchronize page flips and/or render=
ing to
>>   * vertical blanking. The DRM API offers ioctls to perform page flips=


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1lTR1PUCiVHfTlSu0t4QumrAijgRBsilC--

--3lcqFTZezVlO1YNF20mx9rJ80n2BPBgXe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6C37kACgkQaA3BHVML
eiOruAf/dfaR51EjYoxW7Kob8aKbMDv1VkQzRicqc2pxO7pwpU9Kt4eYCx5OsEzD
8VDed0qlcq8YwGhLTNtPXbnKLStOrHsgnWrZsLb3UzLQ8+J46PmzGrtpi7vg1wgr
LCTQMxRjyeRn4jd6kHODR4UOfEQ9TVQtFoaptQfrHOc0XJkKdfirdsFVd7oVD1Il
kDnb4/h1D/tqcM9rrj3Erg2iDeZs2Z3vts6AOlF0woyHh6psP4hHguJVdCLASrXf
YJmZCsJzue8H+RIDz5QrMZjITboU5sRA8gierETU+f56PjVn7gOWC0aca3K1TqcJ
4CSNu6HqMK44nMdjO1P0IKjlJMV7ow==
=+Ohd
-----END PGP SIGNATURE-----

--3lcqFTZezVlO1YNF20mx9rJ80n2BPBgXe--

--===============0550833542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0550833542==--
