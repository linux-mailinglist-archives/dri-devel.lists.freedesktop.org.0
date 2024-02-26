Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6035867632
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 14:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B5310E751;
	Mon, 26 Feb 2024 13:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dBtusWKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4616B10E751
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 13:14:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4915ACE17F2;
 Mon, 26 Feb 2024 13:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AA6C43390;
 Mon, 26 Feb 2024 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708953264;
 bh=/KVyfR44LpY76KNFlBTKKR9kocGGFw2IRhn/+TN3Z2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dBtusWKD7cpWoUMRxUBBqtPgpkeBecwy3NuCffBqTKe9V0NOxG+tYtI1VZYwCZwUZ
 eNyoso7yGo0mv/XJvEFg0ndJ0M6kXNFk/n6eA1xqN9TnRmZskE6A0eFpudrqiK71vs
 BEmSiZRiwvNrTNN4ZrsDMNVWSEooBtK5ubsMT/xIMvgTZJwRTDbBN8/TcH31rNe0Ej
 +wNFhEeSRo9/9Zsx6D2iwukOCgizeU+8z3y9xdSHSdHMDsRI6vFk4kxFgIT3bRkSdL
 l6XesIzSMDDe5YpaTDodicgP0KlM5Td1cBoEJMCqPMB4OCZG8BQBqFTWo5hujZfnqc
 DZlRlIEyi2o4w==
Date: Mon, 26 Feb 2024 14:14:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <rplx6pyvb6uj7iloxp7jfecbbxoguh3am5vexakogpddkgfjd4@uuhygvjf7x3m>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <87bk83o3y3.fsf@intel.com>
 <oazstrooilko4tfmead3b4l32tmz3szqpwgzy3kyga3xahjjfw@cbosrrwaul77>
 <871q8zo2tn.fsf@intel.com>
 <CAPj87rPB9+o1g8gJyZk3m2DLhW=FC+3m5Nrm=Mxq3SwqxX3KCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="awtqhqvetd5t4pov"
Content-Disposition: inline
In-Reply-To: <CAPj87rPB9+o1g8gJyZk3m2DLhW=FC+3m5Nrm=Mxq3SwqxX3KCg@mail.gmail.com>
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


--awtqhqvetd5t4pov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 12:00:15PM +0000, Daniel Stone wrote:
> On Mon, 26 Feb 2024 at 11:57, Jani Nikula <jani.nikula@linux.intel.com> w=
rote:
> > On Mon, 26 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > > For the recent-ish subscriptions, it's possible since we've required =
to
> > > open a Gitlab issue for a while, so we have the association between t=
he
> > > Gitlab account and the SSH account already.
> > >
> > > During the Gitlab setup, the groups were also created already with the
> > > people that had an SSH account at the time, and Gitlab account.
> > >
> > > But for the rest, yeah, I had to ping Daniel S. about it. He could fi=
nd
> > > a few matches, but there's some where we just don't know if or what t=
he
> > > Gitlab account is.
> > >
> > > Generally speaking, we've been conservative about it, and only added
> > > accounts we were sure of.
> >
> > Ah, I didn't make myself clear. I'm more interested in the process going
> > forward, for new access requests. Anyone can create an account and
> > request access; how does a maintainer verify the request? For our
> > purposes it's basically just matching againt the email addresses in
> > existing commits in the repo.
>=20
> It's a fair question. If you want to verify that someone is
> @intel.com, maybe get them to email you out-of-band to check it. If
> you want to check something else, just ask an admin I suppose.

It looks like we can make the email verification mandatory:
https://docs.gitlab.com/ee/security/email_verification.html

And we can have a public email on the profile. I guess requesting the
public email of a profile to match their contribution and be verified
would be enough?

Maxime

--awtqhqvetd5t4pov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdyOrQAKCRDj7w1vZxhR
xc6rAQD91/yevWg/u19Bm1qC3pkVYk4A23+5oxKe+BVesd9D5gD+MNq1+dYFnPHP
q3acEe0fFj2wsp0Hk7oSTFJQe4kBAgo=
=RrgK
-----END PGP SIGNATURE-----

--awtqhqvetd5t4pov--
