Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D667287956B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729E2112E4D;
	Tue, 12 Mar 2024 13:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DE/pJhMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927B10FCB7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:56:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0AA27CE179C;
 Tue, 12 Mar 2024 13:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69B9C433C7;
 Tue, 12 Mar 2024 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710251774;
 bh=hVb8Y2eIB802NelGnAKJd/0W/p+2nTO+EVq+IbJY2v0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DE/pJhMVFqknis4xB/swMJUiWn0yiXKQv+OXLGMf1r0m0l80aAd8oa4nHAQBfCqGr
 ZyRxv+gqBKsAIzcTL8xviQnLfBDPU5V3FUlEOWL+NYOHQXRGpL+ZsUZiwlV72wVqw3
 jw6r4jJGd03Zb4cfHOALrlAjyaeV4w0bj8F9EXNAkc7veAc13ywJIYAxL/57TWocGP
 DuX2wD0YvjAweboelXKdU+9BraBcwx8T2TBaWK96XT6qXxWvTMjmZk69qsLbP6Ylfl
 ycCXyuNQerqutM13FSt1rZjHPhO391pRqBH5RoTN53CmSGeYrrkCNqrrsxh7odGO3m
 l0v+tzCc/iOfA==
Date: Tue, 12 Mar 2024 14:56:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <20240312-bizarre-rational-sawfish-ccee0a@houat>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="azxu6poczpikkxtd"
Content-Disposition: inline
In-Reply-To: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
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


--azxu6poczpikkxtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:
> ## Changing the default location repo
>=20
> Dim gets its repos list in the drm-rerere nightly.conf file. We will
> need to change that file to match the gitlab repo, and drop the old cgit
> URLs to avoid people pushing to the wrong place once the transition is
> made.
>=20
> I guess the next merge window is a good time to do so, it's usually a
> quiet time for us and a small disruption would be easier to handle. I'll
> be off-duty during that time too, so I'll have time to handle any
> complication.
>=20
> ## Updating the documentation
>=20
> The documentation currently mentions the old process to request a
> drm-misc access. It will all go through Gitlab now, so it will change a
> few things. We will also need to update and move the issue template to
> the new repo to maintain consistency.
>=20
> I would expect the transition (if everything goes smoothly) to occur in
> the merge-window time frame (11/03 -> 24/03).

The transition just happened. The main drm-misc repo is now on gitlab,
with the old cgit repo being setup as a mirror.

If there's any issue accessing that gitlab repo, please let me know.

Maxime

--azxu6poczpikkxtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfBe+gAKCRDj7w1vZxhR
xbLeAP9MXo8lxHPXb/lVfntD9/TkhcOkFYKQUq7c3OlNYjOcPAD+MJXzRmqgVv3z
WvEdOEEKs0dGheumReB/ljQo5DhuvA0=
=rjPb
-----END PGP SIGNATURE-----

--azxu6poczpikkxtd--
