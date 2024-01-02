Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F678821960
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 11:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8A210E097;
	Tue,  2 Jan 2024 10:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231AB10E097
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 10:03:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 508FEB80C76;
 Tue,  2 Jan 2024 10:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582D6C433C7;
 Tue,  2 Jan 2024 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704189796;
 bh=kvhok5amWEoPSUDsQnbuW+Vlx8sXWn4IzXLP657J1Z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eCH4HkmRr2B4/GO5janpGeQ5EYA8G3R+dKHFBykBGigbwOPWHcpd0GbZhfTKxC37h
 +FYEFEc/mzFAjghzxgSXZjBfw2iqFN9SFMIBGiGhiv2CjIFs8nRoxbxf/aDS3KqFhe
 t4xKrhEE43msKjYIvh0LkjedA7NGdXFaQkPfMbkOKQQpIpjfDRtD3GtMi07Zf0Q22H
 mKUYTz5TuoOYqne9N+GLBZsDlpf99Qf2u3j7HiLoqjLv+fW63EUNOmGMo45k1PXk+/
 TpRZMxU2WpIyKNFSa63mrjUt+pw245t3UHm/qTtJZALNoa3h2kgaTSHl8Kr18XpVWz
 Gv5iC4YY4X1sw==
Date: Tue, 2 Jan 2024 11:03:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: AL13N <alien@rmail.be>
Subject: Re: RPI4B: what is needed for /dev/video10 to work ( v4l_m2m )
Message-ID: <pvdyykhzadinp67zppew25zekdy3pinvhton3okdex3gsvq7ex@lp7uz7dxd3rc>
References: <7dc14b52e065177eee044348599b8b33@rmail.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a4dvi5v75lv7bk6b"
Content-Disposition: inline
In-Reply-To: <7dc14b52e065177eee044348599b8b33@rmail.be>
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
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--a4dvi5v75lv7bk6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 27, 2023 at 04:19:19PM +0100, AL13N wrote:
> I have a RPI4B with upstream kernel 6.1 64bit and there is no /dev/video10
> present. I thought if I waited a bit more, it would appear in the kernel,
> but that was folly on my part.
>=20
> Currently, watching a movie is painful since the software decoding is way
> too slow and it has very low fps on 1080p (or even 720p or even 480p)
>=20
> IIRC, someone told me something else has to be fixed before the codecs can
> be done, but I don't remember what it was, or i didn't find it in my
> email/the archives.
>=20
> Can someone tell me what exactly needs to be done (in kernel) so that I c=
an
> take a crack at it, (hopefully with some help)?
>=20
> I don't remember if this was relevant, but there was some talk of needing=
 to
> use opengl output with a specific texture format for it to work? or is th=
at
> seperate?

That's something for linux-media. The hardware codec isn't part of vc4
or v3d, it's a separate controller that requires a separate driver (in
v4l2).

That driver isn't upstream, and that would need the first thing to
tackle.

Maxime

--a4dvi5v75lv7bk6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZPfYQAKCRDj7w1vZxhR
xe27AQC12uS4qIE1T46PYr+EaUbJdYoQp1l1p+vxwDdJ6Tj76wEA03VwcOK9Leif
PPav+2Q7yZ34SFGjAIPK1uFshGo5pgg=
=Gx2k
-----END PGP SIGNATURE-----

--a4dvi5v75lv7bk6b--
