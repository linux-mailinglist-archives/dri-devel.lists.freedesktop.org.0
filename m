Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9486C628
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B87F10E3D5;
	Thu, 29 Feb 2024 09:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JhuIblFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5A10E3D5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:57:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 936D661087;
 Thu, 29 Feb 2024 09:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5388C433F1;
 Thu, 29 Feb 2024 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709200621;
 bh=iNaRdEVaMHWobztCiAzO/M37ER6KhZR4DFakU8WYEZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JhuIblFQZzcu+2sLNm+9nD3/tRvPDe1ckx8Su0hfHrH/8Mael/sgXoHiKfIWSpkol
 QDk1/zVk2BU6wWlWCv9GQ/HMDWidR8UWAaeoIPcHkwXnz6KoXzzzskHQf06p/aG01Z
 xsvc2aWx2CMAFh8cYPYpov4NuL5tsjzYUZIVIDkanz53ApFeddAR0KWEz3BL4W9RsT
 NLi2oJBz1aJpaQiPJrhrrmy3Y1+1Y6XXKp1i6rC9rE8bvfF7hnAYz/oJumTOajlKd6
 6S9SvQsRB3+MZK3XNnyDF9cZ/VhedN78zFcvdAkApRSuYBRC8GEIN4pvhypsDe236h
 1wYM5lVbFYRTA==
Date: Thu, 29 Feb 2024 10:56:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, kernelci@lists.linux.dev,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20240229-quizzical-persimmon-honeybee-b5db48@houat>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vqbbrit24to5mmpq"
Content-Disposition: inline
In-Reply-To: <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
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


--vqbbrit24to5mmpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, Feb 29, 2024 at 11:23:22AM +0200, Nikolai Kondrashov wrote:
> Hi everyone,
>=20
> On 2/29/24 11:02, Maxime Ripard wrote:
> > On Wed, Feb 28, 2024 at 07:55:25PM -0300, Helen Koike wrote:
> > > Which rating would you select?
> >=20
> > 4.5 :)
> >=20
> > One thing I'm wondering here is how we're going to cope with the
> > different requirements each user / framework has.
> >=20
> > Like, Linus probably want to have a different set of CI before merging a
> > PR than (say) linux-next does, or stable, or before doing an actual
> > release.
> >=20
> > Similarly, DRM probably has a different set of requirements than
> > drm-misc, drm-amd or nouveau.
> >=20
> > I don't see how the current architecture could accomodate for that. I
> > know that Gitlab allows to store issues template in a separate repo,
> > maybe we could ask them to provide a feature where the actions would be
> > separate from the main repo? That way, any gitlab project could provide
> > its own set of tests, without conflicting with each others (and we could
> > still share them if we wanted to)
> >=20
> > I know some of use had good relationship with Gitlab, so maybe it would
> > be worth asking?
>=20
> GitLab already supports getting the CI YAML from other repos. You can cha=
nge
> that in the repo settings.

I'm interested but couldn't find it in the doc, do you have a link to
the right section?

> However, I think a better approach would be *not* to add the .gitlab-ci.y=
aml
> file in the root of the source tree, but instead change the very same repo
> setting to point to a particular entry YAML, *inside* the repo (somewhere
> under "ci" directory) instead.
>=20
> This way all the different subtrees can have completely different setup, =
but
> some could still use Helen's work and employ the "scenarios" she
> implemented.

I'm worried that this kind of setup will just create duplicated YAML
that will be developped in complete silos and will become difficult to
maintain. But that's definitely an opinion :)

Maxime

--vqbbrit24to5mmpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeBU6QAKCRDj7w1vZxhR
xQ7BAP409AbFcwBdoKD+HMuHlPoXehR+KqHJiC/xTs+iNzmyNwEAkcokR20iK1ta
dDEJ7oinWP3ncejFNUuTUwCM09uQGw0=
=Y3AM
-----END PGP SIGNATURE-----

--vqbbrit24to5mmpq--
