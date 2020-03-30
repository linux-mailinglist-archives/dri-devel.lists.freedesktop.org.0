Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FF8197AAC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 13:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041FA6E22C;
	Mon, 30 Mar 2020 11:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37696E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 11:29:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A112AC24;
 Mon, 30 Mar 2020 11:29:22 +0000 (UTC)
Subject: Re: [PATCH v1 1/6] drm/vblank: Add intro to documentation
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-2-sam@ravnborg.org>
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
Message-ID: <b1347cb6-0116-16de-1602-d57c6069b7ea@suse.de>
Date: Mon, 30 Mar 2020 13:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200328132025.19910-2-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============0882339539=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0882339539==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6RBehuJGZSBYLpLgdtORKuvisoAfjA3Gx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6RBehuJGZSBYLpLgdtORKuvisoAfjA3Gx
Content-Type: multipart/mixed; boundary="VV86p8EbfCkZyBYN7pYMKR3gqVGVlFZaL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
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
Message-ID: <b1347cb6-0116-16de-1602-d57c6069b7ea@suse.de>
Subject: Re: [PATCH v1 1/6] drm/vblank: Add intro to documentation
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-2-sam@ravnborg.org>
In-Reply-To: <20200328132025.19910-2-sam@ravnborg.org>

--VV86p8EbfCkZyBYN7pYMKR3gqVGVlFZaL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam and Lyude,

thanks for improving the documentation. Below are a few points that I'd
found more understandable. I'm no native speaker, though.

Am 28.03.20 um 14:20 schrieb Sam Ravnborg:
> Lyude Paul wrote a very good intro to vblank here:
> https://lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf0=
85f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27
>=20
> Add this to the intro chapter in drm_vblank.c so others
> can benefit from it too.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Co-developed-by: Lyude Paul <lyude@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> ---
>  drivers/gpu/drm/drm_vblank.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.=
c
> index bcf346b3e486..95cac22d59d1 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -41,6 +41,21 @@
>  /**
>   * DOC: vblank handling
>   *
> + * From the perspective of a computer, every time a computer monitor d=
isplays

Possibly change from dative case to genitive:

"From the computer's perspective," ...

> + * a new frame it's done by "scanning out" the display image from top =
to
> + * bottom, one row of pixels at a time. which row of pixels we're on i=
s

s/which/Which

The text changes from third person (the computer) to first person
(we're). Makes it harder to read. I'd remove both, "we" and "computer",
and speak of display hardware or scanout engine.

> + * referred to as the scanline.

I'd say a scanline is any of them. Maybe say "current scanline"?

> + * Additionally, there's usually a couple of extra scanlines which we

"In addition to the display's visible area, there's usually a couple of
extra scanlines that" ...

> + * scan out, but aren't actually displayed on the screen (these someti=
mes
> + * get used by HDMI audio and friends, but that's another story).
> + * The period where we're on these scanlines is referred to as the vbl=
ank.

I'd replace vblank with "vertical blanking period." That term is
required in the next paragraph.

The time when the hardware operates on these invisible scanlines is
referred to as vertical blanking period, or simply vblank.

> + *
> + * On a lot of display hardware, programming needs to take effect duri=
ng the
> + * vertical blanking period so that settings like gamma, what frame we=
're

"we" again

> + * scanning out, etc. can be safely changed without showing visual tea=
ring
> + * on the screen. In some unforgiving hardware, some of this programmi=
ng has
> + * to both start and end in the same vblank - vertical blanking.
> + *
>   * Vertical blanking plays a major role in graphics rendering. To achi=
eve
>   * tear-free display, users must synchronize page flips and/or renderi=
ng to
>   * vertical blanking. The DRM API offers ioctls to perform page flips
>=20

In any case

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VV86p8EbfCkZyBYN7pYMKR3gqVGVlFZaL--

--6RBehuJGZSBYLpLgdtORKuvisoAfjA3Gx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6B2BAACgkQaA3BHVML
eiPT0Qf+PswvvsIk51VTu81b1R8Z+lbcqLSk1fRfPYq7vgSud+HiZunh8R6ZXdlO
0/XSQVscFC79SgzfD+R52/HIhqOIkm34Dk37gv+aEpHe/xsZgFtrSGxf/BccVPSt
BYeMnWWzlpn/YZ4d25VAQOXSC8PBWFnmMfeMtdYNwJ49lZF2uO+/AQeQGQmF1o7q
KDd4o9fPjUy3ZTxTtb1QA3FkzgIqQo6uBcNn2meW0QjW+9onHA85HCQJZUMI6nZg
D/d3hfAnzQxoHJYR5YA+MJCnM98PUktKc+qBwBGqfMhj3sT2iFlt8n+t1DRarPgQ
Wq6YlLwZOP/+XewbfTTjl7wZiVchYg==
=V1DB
-----END PGP SIGNATURE-----

--6RBehuJGZSBYLpLgdtORKuvisoAfjA3Gx--

--===============0882339539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0882339539==--
