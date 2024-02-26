Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714EC86738C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8500D10E6BD;
	Mon, 26 Feb 2024 11:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WgDj6wdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3238610E6BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:41:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6B0F5CE172A;
 Mon, 26 Feb 2024 11:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D3EC433F1;
 Mon, 26 Feb 2024 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708947665;
 bh=JIBFjlyzbBLDb0iX6p70cfAkvi8H+VL+liziBs3MaXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WgDj6wdopy4vRWepKoCCct74Gom09R3NxjP9Syr4wLD3eQU8e2mEHuJc2XpLekmHB
 f71cpVZT4Z73pteKsmavYazJfrwuBQFDV/ZtoGqFlpoXhMsqaCKKieICasQOVFSYYu
 vPByLBAgYvb79iA6c39TF24XhMsy/aJsZLNAu8g6hSdNIJgX2NUaOhIvKlydYH+dh1
 93AKFfJlyNIzdndQ0hcVEM8xNkBQm6Uhg714F4wOpxXS9DJkcFndmlCvOXjmyG/gBV
 5UV61F5AKV725JIJpSBYnsvG7fa/qkTsZ1M9EihTfv6B/geSngZzbwiDsUKbEyW9zj
 gMvcYKnPSmUEg==
Date: Mon, 26 Feb 2024 12:41:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <oazstrooilko4tfmead3b4l32tmz3szqpwgzy3kyga3xahjjfw@cbosrrwaul77>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <87bk83o3y3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dkwkgqso6pkhal2c"
Content-Disposition: inline
In-Reply-To: <87bk83o3y3.fsf@intel.com>
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


--dkwkgqso6pkhal2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 01:33:24PM +0200, Jani Nikula wrote:
> On Tue, 20 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > ## Adding the a remaining users
> >
> > I was able to identify most of the users with an account on the old git
> > server. However, there's a few I couldn't match with certainty to a
> > gitlab account:
> >
> > * andr2000
> > * jsarha
> >
> > Please let me know your Gitlab user so I can add them to the group.
>=20
> Is there no way for project owners/maintainers to see the email
> addresses for members or access requests?
>=20
> We've been pretty lax with giving reporter role to deal with issues, but
> it's quite a different thing to give developer role with push access,
> and feels like you'll need a side channel to match usernames with email
> addresses.

For the recent-ish subscriptions, it's possible since we've required to
open a Gitlab issue for a while, so we have the association between the
Gitlab account and the SSH account already.

During the Gitlab setup, the groups were also created already with the
people that had an SSH account at the time, and Gitlab account.

But for the rest, yeah, I had to ping Daniel S. about it. He could find
a few matches, but there's some where we just don't know if or what the
Gitlab account is.

Generally speaking, we've been conservative about it, and only added
accounts we were sure of.

Maxime

--dkwkgqso6pkhal2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdx4zgAKCRDj7w1vZxhR
xenjAPwMGiuaFcj1SGZocv/kL13QZ8uXOx78ImlSrcCxZKXVdAD9E2INlZwnsSxS
ZdIL5YY5weG2xtLaKj7ahQFouVkoWQU=
=X2GG
-----END PGP SIGNATURE-----

--dkwkgqso6pkhal2c--
