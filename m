Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05DC1A0732
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 08:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1BD6E2EF;
	Tue,  7 Apr 2020 06:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3016E2EF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 06:24:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4444AAD2C;
 Tue,  7 Apr 2020 06:24:48 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] drm/vblank: Add intro to documentation
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
References: <20200406194746.26433-1-sam@ravnborg.org>
 <20200406194746.26433-2-sam@ravnborg.org>
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
Message-ID: <6d3b507a-7e43-2143-ca21-b5f2fb1e8710@suse.de>
Date: Tue, 7 Apr 2020 08:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406194746.26433-2-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Content-Type: multipart/mixed; boundary="===============0911196216=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0911196216==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ss3EdxF6798JldTGZOhRF7jAdfz0qp0MJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ss3EdxF6798JldTGZOhRF7jAdfz0qp0MJ
Content-Type: multipart/mixed; boundary="eVqYiUFoStd88MLe6vyrZdUeil69fQhiw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>
Message-ID: <6d3b507a-7e43-2143-ca21-b5f2fb1e8710@suse.de>
Subject: Re: [PATCH v2 1/3] drm/vblank: Add intro to documentation
References: <20200406194746.26433-1-sam@ravnborg.org>
 <20200406194746.26433-2-sam@ravnborg.org>
In-Reply-To: <20200406194746.26433-2-sam@ravnborg.org>

--eVqYiUFoStd88MLe6vyrZdUeil69fQhiw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.04.20 um 21:47 schrieb Sam Ravnborg:
> Lyude Paul wrote a very good intro to vblank here:
> https://lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf0=
85f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27
>=20
> Add this to the intro chapter in drm_vblank.c so others
> can benefit from it too.
>=20
> v2:
>   - Reworded to improve readability (Thomas)
>=20
> v3:
>   - Added nice ascii drawing from Lyude (Lyude)
>   - Added referende to high-precision timestamp (Daniel)
>   - Improved grammar (Thomas)
>   - Combined it all and made kernel-doc happy
>   - Dropped any a-b, r-b do to the amount of changes
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Co-developed-by: Lyude Paul <lyude@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_vblank.c | 53 ++++++++++++++++++++++++++++++++++++=

>  1 file changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.=
c
> index bcf346b3e486..9633092c9ad5 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -41,6 +41,59 @@
>  /**
>   * DOC: vblank handling
>   *
> + * From the computer's perspective, every time the monitor displays
> + * a new frame the scanout engine have "scanned out" the display image=

> + * from top to bottom, one row of pixels at a time.
> + * The current row of pixels is referred to as the current scanline.
> + *
> + * In addition to the display's visible area, there's usually a couple=
 of
> + * extra scanlines which aren't actually displayed on the screen.
> + * These extra scanlines don't contain image data and are occasionally=
 used
> + * for features like audio and infoframes. The region made up of these=

> + * scanlines is referred to as the vertical blanking region, or vblank=
 for
> + * short.
> + *
> + * ::
> + *
> + *
> + *    physical =E2=86=92   =E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD
> + *    top of      |                                        |
> + *    display     |                                        |
> + *                |               New frame                |
> + *                |                                        |
> + *                |=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=
=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=
=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=
=E2=86=93|
> + *                |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| =E2=86=90=
 Scanline, updates
> + *                |=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=
=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=
=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=
=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=E2=86=93=
=E2=86=93|   the frame as it
> + *                |                                        |   travels=
 down
> + *                |                                        |   ("scan =
out")
> + *                |                                        |
> + *                |               Old frame                |
> + *                |                                        |
> + *                |                                        |
> + *                |                                        |
> + *                |                                        |   physica=
l
> + *                |                                        |   bottom =
of
> + *    vertical    |=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD| =E2=86=90 display
> + *    blanking    =E2=94=86xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=E2=
=94=86
> + *    region   =E2=86=92  =E2=94=86xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxx=E2=94=86
> + *                =E2=94=86xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=E2=
=94=86
> + *    start of =E2=86=92   =E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD
> + *    new frame
> + *
> + * "Physical top of display" is the reference point for the high-preci=
sion/
> + * corrected timestamp.
> + *
> + * On a lot of display hardware, programming needs to take effect duri=
ng the
> + * vertical blanking period so that settings like gamma, the image buf=
fer
> + * buffer to be scanned out, etc. can safely be changed without showin=
g
> + * any visual artifacts on the screen. In some unforgiving hardware, s=
ome of
> + * this programming has to both start and end in the same vblank.
> + *
> + * The vblank interrupt may be fired at different points depending on =
the
> + * hardware. Some hardware implementations will fire the interrupt whe=
n the
> + * new frame start, other implementations will fire the interrupt at d=
ifferent
> + * points in time.
> + *
>   * Vertical blanking plays a major role in graphics rendering. To achi=
eve
>   * tear-free display, users must synchronize page flips and/or renderi=
ng to
>   * vertical blanking. The DRM API offers ioctls to perform page flips
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eVqYiUFoStd88MLe6vyrZdUeil69fQhiw--

--ss3EdxF6798JldTGZOhRF7jAdfz0qp0MJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6MHK4ACgkQaA3BHVML
eiNLJQf+KxoM4QBncEpG1DYmHsQnnUsHq1HEn26BsHc6FUsG/ehIPi0aFMKbRDGO
2UeLZYb1y5oHEIJa5YzvPAHt001nZ25JuiWSfI0dhzBAzgVEYohhq+8lXbaBEeHl
epHUP19lDggCQvBDGYEz0aYlOa39H1JPJaae3XCMDr5JgA7wbnibEIM0UEMnSJSC
qCJdZniOOGTy5ZphpsUToMHRIKS2ha41cqTswPtLfTK2rYPyg2l3gTHdFWHvkV+L
0I0qzg2B7fe7UbaK3Q6vA7kZ3tWysdEVLvDPLpLn0xaA/ZGL8B7GKNsnvqKwfyyV
trFMXeu3QwI0Sw0Q3PcEiJgI1MzrVA==
=lQBr
-----END PGP SIGNATURE-----

--ss3EdxF6798JldTGZOhRF7jAdfz0qp0MJ--

--===============0911196216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0911196216==--
