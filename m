Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D57BF73F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2810E130;
	Tue, 10 Oct 2023 09:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10DA10E130
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:25:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FAF961554;
 Tue, 10 Oct 2023 09:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7188BC433C7;
 Tue, 10 Oct 2023 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696929945;
 bh=BSeu8Gc8VhoMdfwjmsyAhazs4HI6gfcxwN3wmeX6TWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5BiqczMCJu+bwtkdid0mcdVRaPa83WRi0zbpFhpmuVQ8yQhObCut3hsqvHKv+B7o
 nEYvKl3X9Vps7HVScHZiXhlY4/TmncM3swRmhBa2K20caJBwcHgJIcc8AWd0DMNkF3
 fxTc/vZ3FiUT52k0wb2XXYgLQwyTtKplwY83V4ZCwt/xs0pxW6uuasZUzNDBQ0w5HO
 8yla4X7Zlg2h8U1nASrbHFjPsXJK4BNhcUD3r7bP65r9LTtfOXcbI3/ukq4FuQk3st
 85peu7JBttFNxiAs/up6ubR2z8wJbXSRLm05Git5UzD4d5KK3xC4jbKAGpVKYXFSr9
 xecsUhpWKGeMw==
Date: Tue, 10 Oct 2023 11:25:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
References: <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ysgobmdhxg3dxq5p"
Content-Disposition: inline
In-Reply-To: <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ysgobmdhxg3dxq5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



On Tue, Oct 10, 2023 at 10:55:09AM +0200, Thomas Zimmermann wrote:
> > > So if I understand correctly, drm_panic would pre-allocate a plane/co=
mmit,
> > > and use that when a panic occurs ?
> >=20
> > And have it checked already, yes. We would only wait for a panic to
> > happen to pull the trigger on the commit.
> >=20
> > > I have two concern about this approach:
> > > - How much memory would be allocated for this ? a whole framebuffer c=
an be
> > > big for just this use case.
>=20
> As I outlined in my email at [1], there are a number of different scenari=
os.
> The question of atomic state and commits is entirely separate from the DRM
> panic handler. We should not throw them together. Whatever is necessary is
> get a scanout buffer, should happen on the driver side of
> get_scanout_buffer, not on the drm_panic side.
>=20
> [1] https://lore.kernel.org/dri-devel/39bd4c35-8a61-42ee-8675-ccea4f5d4ac=
6@suse.de/T/#m22f116e9438e00a5f0a9dc43987d4153424f8be1
>=20
> >=20
> > I'dd expect a whole framebuffer for the current
> > configuration/resolution. It would be typically 4MB for a full-HD system
> > which isn't a lot really and I guess we can always add an option to
> > disable the mechanism if needed.
> >=20
> > > - I find it risky to completely reconfigure the hardware in a panic h=
andler.
> >=20
> > I would expect to only change the format and base address of the
> > framebuffer. I guess it can fail, but it doesn't seem that different to
> > the async plane update we already have and works well.
>=20
> The one thing I don't understand is: Why should we use atomic commits in =
the
> first place? It doesn't make sense for firmware-based drivers.

Because this is generic infrastructure that is valuable for any drivers
and not only firmware-based drivers?

> In some drivers, even the simple ast, we hold locks during the regular
> commit. Trying to run the panic commit concurrently will likely give a
> deadlock.

You're in the middle of a panic. Don't take any locks and you won't deadloc=
k.

> In the end it's a per-driver decision, but in most cases, the driver can
> easily switch to a default mode with some ad-hoc code.

When was the last time a per-driver decision has been a good thing? I'm
sorry, but the get_scanout_buffer approach buffer won't work for any
driver out there.

I'm fine with discussing alternatives if you don't like the ones I
suggested, but they must allow the panic handler infrastructure to work
with any driver we have, not just 4.

Maxime

--ysgobmdhxg3dxq5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSUYlgAKCRDj7w1vZxhR
xXudAP955KA0jLjNVAkSri47aIOlsnQ86ZjFCH/ruCETM9iCoAD+M1IFJpCFppKM
G61/+M5pZ6ht98F81Lpm0otJayxrFgA=
=Yno5
-----END PGP SIGNATURE-----

--ysgobmdhxg3dxq5p--
