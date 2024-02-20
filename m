Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DAF85B696
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62C510E119;
	Tue, 20 Feb 2024 09:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FspT3go6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A6010E053
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:05:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B401760EA5;
 Tue, 20 Feb 2024 09:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148CAC433C7;
 Tue, 20 Feb 2024 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708419902;
 bh=LMW7TlLG0s5wKFmG6PyCeqxZi9xS0W7G/QcMeCka+88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FspT3go6negbATHJUND2SkYm4KkCgQdClVvAWyGXZZDClAw7UXzKfdTtdZxAP/fqc
 dQxBQivfyCUSnCY/dBN381Dq9bl8OfwXVAX98MwO/4KOJLf2vxjs61+iRa1diG94Z4
 1KZ9aEpzEIZM/JQLJPwQpWSZ30TaD/dQ2hUzvOIbZ+8O+ktKm2TmVdtlehFPC+xrfP
 uXVdh/7EYDrVuj0LjqBb3gcFuCIhJpzUMan0GnkC2EUJK8xKAbLf49K1YqBD13n3Dw
 GLuWLaZJt6U3hRTdBOLNZqIJJlhohp1g7VvdGeG81T3kKoS5mUjdV7xgMRz6c0OXmv
 LrNBiT5NAfaDA==
Date: Tue, 20 Feb 2024 10:04:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xejs4gylk6djubqj"
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


--xejs4gylk6djubqj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:
> Hi,
>=20
> As you might have noticed in your mails, Daniel Stone and I have been
> working on adding all the drm-misc maintainers and committers to Gitlab.
>=20
> The current repository was still in the cgit instance and was creating
> an unnecessary burden on the admins.
>=20
> For example, any new user had to create an issue and go through Daniel
> to create an cgit account, even though that user already needed to have
> a gitlab account to create the issue in the first place. Adding an SSH
> key was a similar story. By moving to Gitlab, we'll remove most of that
> burden.
>=20
> This will be mostly transparent to current committers and users: we'll
> still use dim, in the exact same way, the only change will be the URL of
> the repo. This will also be transparent to linux-next, since the
> linux-next branch lives in its own repo and is pushed by dim when
> pushing a branch.

Actually, I double-checked and linux-next pulls our branches directly,
so once the transition is over we'll have to notify them too.

Maxime

--xejs4gylk6djubqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdRrOwAKCRDj7w1vZxhR
xeZoAP42FSqRUUEYmD5ORmM+yIDxy/uF/XWkWyqcDaIF8RJPwQD8DVLJdOSPppWV
BZ0hcQarlKY+IUdO7mPb3jDT8BgT2AM=
=60o7
-----END PGP SIGNATURE-----

--xejs4gylk6djubqj--
