Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2895C914FBA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7354A10E252;
	Mon, 24 Jun 2024 14:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lFAvlC5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16BF10E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:19:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 054EBCE11BD;
 Mon, 24 Jun 2024 14:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D33C2BBFC;
 Mon, 24 Jun 2024 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719238764;
 bh=8RocPs5qRQ+NJ/ne+6rxeA+5cbWW+t4MnAi3bEOK5vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFAvlC5HJuJMNdfjTs85rGZHOzq5L4q9zYVmyxLcMPL1GlGVaSYHFYEu0kAhZ3FrJ
 2Ya4hg5fckHHzxUtufoCGBcwvBKVYT1YhUiSRaOyDqHQ77pcSUUgFYa1oKMNKcXegM
 9VWszZOn9Ml+EVtpHk76THN/tkKoKw1kScH4uQngZGVn/zWFk2R/YIOX2u1cI94cBb
 6Jy/T+wc33uEZkcLiiqgfiXs9mYq1agAs+uTyXVSD8FHbqDVLtsm/+ZUbTPjUdf7F5
 hIK6WQrbIt7Qgyx5zu5DmguEjJMCp0VuBchrI3IymwHjfvAQtHLWcdDOmFlmHE0FZC
 vj0yu8x8SJFpA==
Date: Mon, 24 Jun 2024 16:19:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/31] Preparatory patches for BCM2712 (Pi5) support
Message-ID: <20240624-mighty-fantastic-swine-9c4b98@houat>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
 <20240621-determined-venomous-partridge-eddeb9@houat>
 <CAPY8ntAbaxr-SnqyVR3Drnq-v5Q7ND7tSNzB+pLFFX0wssBAxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aip3t2eg6qxzifew"
Content-Disposition: inline
In-Reply-To: <CAPY8ntAbaxr-SnqyVR3Drnq-v5Q7ND7tSNzB+pLFFX0wssBAxw@mail.gmail.com>
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


--aip3t2eg6qxzifew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 21, 2024 at 11:16:20AM GMT, Dave Stevenson wrote:
> Morning Maxime
>=20
> On Fri, 21 Jun 2024 at 09:55, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi Dave,
> >
> > Thanks for taking the time to send this.
> >
> > I've gone through most of the patches and it looks pretty good already,
> > but I have a few general remarks:
> >
> >   - We merged in drm-misc-next the new HDMI infrastructure recently and
> >     it will heavily conflict with some of these patches, so you need to
> >     rebase against either linux-next or drm-misc-next.
>=20
> Unless I've really messed up, this is already against drm-misc-next -
> sorry for not stating that.
> I've just pulled and rebased again, but I believe the top commit from
> the tree I created the patches against was
> c1391205754f drm/tests: add drm_hdmi_state_helper_test MODULE_DESCRIPTION=
()
> merged yesterday. I certainly had my VEC patches in the tree.

Sorry, that must be my fault then :)

I saw some patches had what I thought was vc4 prior refactoring, but if
you're on top of current drm-misc-next, it's all good.

> >   - The author and SoB fields for my patches don't match anymore,
> >     possibly due to mailmap doing its magic.
>=20
> Too much magic in git :-(
> I went through and updated all your SoB fields, but mailmap appears to
> mean that the author shown by git log is not the same as the patches
> created by git format-patch. Never believe what you see. (That feels
> like a bug in git format-patch).

The duality of a bug/feature :)

> >     You can fix this by using, for the SoB:
> >     git filter-branch --msg-filter 'sed -i s/maxime@cerno.tech/mripard@=
kernel.org/' drm-misc-next..
> >
> >     And for the authorship:
> >     git commit --amend --author=3D"Maxime Ripard <mripard@kernel.org>"
> >     for each commit.
> >
> >   - All of the fixes need Fixes that are currently missing on most tags
>=20
> Just as long as no one tries pulling them all back to stable. The
> number of dependencies would be huge in many cases.

This will probably happen still due to AUTOSEL. Is there any fix that
shouldn't be backported?

Maxime

--aip3t2eg6qxzifew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnmAaAAKCRDj7w1vZxhR
xYDgAQCvvI/nXyZ8CzRjddmg68GpUkMGYFvNpr5ZxloawShSNgEAu4oX8cMLJJat
hdaCFkhWDu+4xtxv5LB+ZhilPGSymQA=
=Wk7N
-----END PGP SIGNATURE-----

--aip3t2eg6qxzifew--
