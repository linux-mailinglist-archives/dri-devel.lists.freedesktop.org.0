Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81999C4A2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A0210E3E6;
	Mon, 14 Oct 2024 09:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b8twdiBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8412010E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 538AC5C59A1;
 Mon, 14 Oct 2024 09:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACB4C4CEC3;
 Mon, 14 Oct 2024 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728896673;
 bh=D7pzpmtRku9kVKi0BIWuLpRY1+VRB0PYNkEA2GQugVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b8twdiBUCi3NxOAmULGgO/9zPnQIuyqn89po64RDuIuLWhHs1oHqyRx7gkwf9TdCI
 KPUN89aJqwCsPV3zsi/x26YYeIzu8yUPli/HDBuy6HyE0bTVfnuUwef48AW9Grr3Ci
 7ljBcIfMjJU3UHKe+o6xQ7l3iFFxAtKoOL7uNcjL+aolA98rLMNg09ALRwB1jL93lu
 OV5ke3dRCIi0lOChvov26zAfMHt5k1k9AIqsxqF0yU2V6PVmThpQvWDZY0WYKRaY0x
 /BZbMKYwj2IHljqvflFmmWCBbhChXiyMZxAdJDJdQWe0zMmEUM8H/Gyfjatz78iitv
 gDccXaR6zkz+A==
Date: Mon, 14 Oct 2024 11:04:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
Message-ID: <20241014-warm-savvy-wrasse-ed984e@houat>
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dknokeuqumfqwopv"
Content-Disposition: inline
In-Reply-To: <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dknokeuqumfqwopv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
> Am 13.10.24 um 21:11 schrieb Dave Stevenson:
> > Hi Stefan.
> >=20
> > On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
> >=20
> >     Hi,
> >=20
> >     i recently switch for my suspend2idle tests from Raspberry Pi Bulls=
eye
> >     to Bookworm. After that testing suspend2idle shows a new warning
> >     which i
> >     never saw before:
> >=20
> >     HDMI Sink doesn't support RGB, something's wrong.
> >=20
> >=20
> > Can you provide the edid of your display please?
>=20
> Sure
>=20
> [=A0=A0=A0 27.145] (II) modeset(0): Monitor name: HP ZR2440w
> [=A0=A0=A0 27.145] (II) modeset(0): Serial No: CN423402RL
>=20
> ...
>=20
> [=A0=A0=A0 27.146] (II) modeset(0): EDID (in hex):
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 00ffffffffffff0022f05629010=
10101
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 22160103803420782afc81a4554=
d9d25
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 125054210800d1c081c08140818=
09500
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 a940b3000101283c80a070b0234=
03020
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 360006442100001a000000fd001=
83c18
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 5011000a202020202020000000f=
c0048
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 50205a5232343430770a2020000=
000ff
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 00434e343233343032524c0a202=
0015b
> [=A0=A0=A0 27.146] (II) modeset(0): =A0=A0=A0 02031ff14c901f0514041303020=
70612
> [=A0=A0=A0 27.147] (II) modeset(0): =A0=A0=A0 0165030c0010002309070783010=
00002
> [=A0=A0=A0 27.147] (II) modeset(0): =A0=A0=A0 3a801871382d40582c450006442=
10000
> [=A0=A0=A0 27.147] (II) modeset(0): =A0=A0=A0 1e023a80d072382d40102c45800=
64421
> [=A0=A0=A0 27.147] (II) modeset(0): =A0=A0=A0 00001e011d007251d01e206e285=
50006
> [=A0=A0=A0 27.147] (II) modeset(0): =A0=A0=A0 442100001e011d00bc52d01e20b=
82855
> [=A0=A0=A0 27.147] (II) modeset(0): =A0=A0=A0 4006442100001e8c0ad08a20e02=
d1010
> [=A0=A0=A0 27.147] (II) modeset(0): =A0=A0=A0 3e9600064421000018000000000=
000c1

It's a bit hard to extract, could you provide the output of

cat /sys/class/drm/card/cardX-HDMI-A-X/edid | edid-decode --check

Thanks!
Maxime

--dknokeuqumfqwopv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwzelwAKCRAnX84Zoj2+
dgCkAX4toEIDWnZ2mX+r6YKU1DEtTctA/g2HjNhkum7Yt+BNVF6Lif0awo0zjErV
F+071S0BgJdEiy08d9pbJXwERu/+F++PLzJ3LUtKusnEpL+PxKC8C3QL3m41Wijz
B8NpRl+A2A==
=aaTv
-----END PGP SIGNATURE-----

--dknokeuqumfqwopv--
