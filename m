Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4E86FD4E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BAA10FEA5;
	Mon,  4 Mar 2024 09:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUN3Uv2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4991F10FEA5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:24:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7649A603F3;
 Mon,  4 Mar 2024 09:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1142C433F1;
 Mon,  4 Mar 2024 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709544268;
 bh=2LUWxPJ7TW2497VxW5UD93DyOzb9O1yBr/n7hITwxXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UUN3Uv2ohBF0nigVndee0ggA14YMMczpQ7F3iOFVhYuYbc8xV6OO9M6Nn8/geoJKb
 Btcj7Xn+oQrE7zE2OXXdbEu0A6Ou4x+rng9Td62lSu6Lrge08xAEAKJrnDCLWq+pp8
 +TH57z4SUlAqzeBwYpLJWPAWtod47r7CeauBjcvaQ/wl7IIeLsK17iyqOsF78gZDS+
 u6s8tReOw6SzxE5z1eOc0XXXNL4MIxbNFbGLaxotNz9rX5BBFRuc01793LTKQsJFKo
 txXGW1rHDuKLwovhicWMhmtnIwy0qalyU64C+pO9MmmOWWC443fVQIoRGSgi7y8+V9
 h8N1T2uD2GSsA==
Date: Mon, 4 Mar 2024 10:24:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, 
 Nikolai Kondrashov <spbnick@gmail.com>, Helen Koike <helen.koike@collabora.com>,
 linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, kernelci@lists.linux.dev,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l5cpxnrigz7aanzy"
Content-Disposition: inline
In-Reply-To: <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
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


--l5cpxnrigz7aanzy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2024 at 02:10:51PM -0800, Guenter Roeck wrote:
> On Thu, Feb 29, 2024 at 12:21=E2=80=AFPM Linus Torvalds
> <torvalds@linuxfoundation.org> wrote:
> >
> > On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wr=
ote:
> > >
> > > However, I think a better approach would be *not* to add the .gitlab-=
ci.yaml
> > > file in the root of the source tree, but instead change the very same=
 repo
> > > setting to point to a particular entry YAML, *inside* the repo (somew=
here
> > > under "ci" directory) instead.
> >
> > I really don't want some kind of top-level CI for the base kernel proje=
ct.
> >
> > We already have the situation that the drm people have their own ci
> > model. II'm ok with that, partly because then at least the maintainers
> > of that subsystem can agree on the rules for that one subsystem.
> >
> > I'm not at all interested in having something that people will then
> > either fight about, or - more likely - ignore, at the top level
> > because there isn't some global agreement about what the rules are.
> >
> > For example, even just running checkpatch is often a stylistic thing,
> > and not everybody agrees about all the checkpatch warnings.
> >
>=20
> While checkpatch is indeed of arguable value, I think it would help a
> lot not having to bother about the persistent _build_ failures on
> 32-bit systems. You mentioned the fancy drm CI system above, but they
> don't run tests and not even test builds on 32-bit targets, which has
> repeatedly caused (and currently does cause) build failures in drm
> code when trying to build, say, arm:allmodconfig in linux-next. Most
> trivial build failures in linux-next (and, yes, sometimes mainline)
> could be prevented with a simple generic CI.

Ultimately, the question here is about funding. Can we expect DRM CI to
pay for builders out of the X.org foundation pocket to build kernel
configurations that are seeing close to no development (arm), or not
having any driver for (xtensa, m68k)?

And if we would turn the argument around, I don't really expect, say,
the clock framework, to validate that all DRM kunit tests pass for each
commit they merge, even though one of them could totally break some of
the DRM tests.

If anything, it's more of a side-effect to the push for COMPILE_TEST
than anything.

Maxime

--l5cpxnrigz7aanzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeWTSAAKCRDj7w1vZxhR
xSj8AQCyTpMIin/6c/epWht/ByNq3x6vRhuDVJRVpgfH+Z8JzQD+I1wZvDEqG4mJ
wgANqDrqoOloQd0b2wGJOBYmNB1fCw0=
=KEqD
-----END PGP SIGNATURE-----

--l5cpxnrigz7aanzy--
