Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1992C98CC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA07C6E4AF;
	Tue,  1 Dec 2020 08:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74EB6E4AF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 08:07:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72398AD21;
 Tue,  1 Dec 2020 08:07:09 +0000 (UTC)
Subject: Re: [PATCH] fbdev: Remove udlfb driver
To: Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
Date: Tue, 1 Dec 2020 09:07:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be,
 linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch, corbet@lwn.net,
 bernie@plugable.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0558263101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0558263101==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m0nXX7s2opZ6pPGdpseWFGDKjZHKL2cuI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m0nXX7s2opZ6pPGdpseWFGDKjZHKL2cuI
Content-Type: multipart/mixed; boundary="vbXNiItjELcPrKi8yrF0Zi8IoCE0p07NW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be, corbet@lwn.net,
 daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Message-ID: <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>

--vbXNiItjELcPrKi8yrF0Zi8IoCE0p07NW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.11.20 um 19:39 schrieb Mikulas Patocka:
>=20
>=20
> On Mon, 30 Nov 2020, Daniel Vetter wrote:
>=20
>> On Mon, Nov 30, 2020 at 09:31:15AM -0500, Mikulas Patocka wrote:
>>>
>>> The framebuffer driver supports programs running full-screen directly=
 on
>>> the framebuffer console, such as web browser "links -g", image viewer=

>>> "fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sdl",=

>>> movie player "mplayer -vo fbdev". The DRM driver doesn't run them.
>>
>> Hm this should in general work on drm drivers. Without that it's clear=
 the
>> switch-over isn't really ready yet.
>=20
> I fixed it with this patch two years ago:
> https://lists.freedesktop.org/archives/dri-devel/2018-June/179023.html
>=20
> But the patch never went through and the fb_defio feature was removed i=
n
> the kernel 5.6 (commit d0c4fc5a4814e431c15272935c8dc973c18073aa).
>=20
>=20
> Without fb_defio, the only other possibility how to update the screen i=
s
> the ioctl DRM_IOCTL_MODE_DIRTYFB. But this ioctl requires master mode, =
so
> user programs like "links -g" can't issue it.

That's confusing. DIRTYFB is only for DRM.

And why can links not run as DRM master mode? If it renders to the=20
terminal, it should act like a composer. In that case it almost=20
certainly wants master status.

Best regards
Thomas

>=20
> Mikulas
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vbXNiItjELcPrKi8yrF0Zi8IoCE0p07NW--

--m0nXX7s2opZ6pPGdpseWFGDKjZHKL2cuI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/F+awFAwAAAAAACgkQlh/E3EQov+DY
bxAAnFIkL+UQXf+grnqvgtdwrOpkbY+Qq3tjYHo3YwzUhMNVBRIZLLg2O8fWtKtYlNXFV6K9FQso
umaZoSfS0S8SldWnM8KoyZzFgpWGNJZuPVeLulMAPEHgDMMRzsLBOofFhS2T04KowRPq3RpKgtKK
dwjuRQmnJArS3n3TQB4WyAfxpjNo/rkeWrk2MRJUPzVNSzMFgO4VLgFGFF5tcJ1+MEwKWvI1+QVb
LiWhTwQugcxDI0kU6x0ud71/SrHog2mfK8Dm1kwbZyLV+PusC/Dkr3lXefLnULHcDF5+haohQFPs
uSllb8H0TOhGT2VIisukXjf3yZoQ4wP+EIbIS5zXhO/BzyxvE/aeATzii9bmnv5dxqap4OSKoZpI
uXhwPP4XRTdCwfMrEJgFodMgh0p+THhHYS75BhyyLmFogXpsWP+tx7db6x6qwOMNuK7YgwNJkVB7
oNmvjwloZQ3pm0FlP9tG7peKj7ulW4PDPp9IYpaSCp2FF3PDXWeq5Bz3ahnhY6YXeG/OGMMYcfb+
ydw/DWgD2TqfH/rvCCG6Ly6Pe3+Rw6lgjNZuWfwfw6qkf5Rn4PhOe7YtdgxvCdv6/+7gJhPSWyzf
UyemQG86/QeGbXaXL0wp8dbBaGrd+GsFpWYZ4GYNw3IdAqF5c6TcQfRGgOtodhAFKMrxNkkxmKeI
SY0=
=B23t
-----END PGP SIGNATURE-----

--m0nXX7s2opZ6pPGdpseWFGDKjZHKL2cuI--

--===============0558263101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0558263101==--
