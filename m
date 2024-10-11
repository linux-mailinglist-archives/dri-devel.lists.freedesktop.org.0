Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1599A60D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46CF10E044;
	Fri, 11 Oct 2024 14:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mkKWf7c7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD01210E044
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:14:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 69D275C5974;
 Fri, 11 Oct 2024 14:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7E9C4CEC3;
 Fri, 11 Oct 2024 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728656067;
 bh=S2kpBhzA9CT2tk67op8T4/X6KIP8Ece09QFxSl24cf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mkKWf7c7cL5WE1JLcPA5P6+KJ6hRJq+ZtKvd4oUHWuDiKE2gQk6EiAqZV487QgV/0
 5fv95z+lKMlyA5zi0bUHmF7elNYetorKf3Xx0ueHZSrYyJsbLyXZyi8K9qp0fThEQm
 8QduGft4fkhdIup4in0AThMs7vPZ2x6OreAYPRL4RLVFHwcXoKhEw+qO/KYD609Uv7
 kEIpmHSk6N9To8w/0KJh/+KVNKr+a7/T8ZcH8rarQJc7LbiQfJQ6Rub0doJ+b4qBPU
 GkJYHQfuY3cAlHnSaHlOIEC9D1UzaqNQpWkRKRUVeDXQeLgB/EGFYeiOOmA41W/zhe
 hFLKOhnXu+GXg==
Date: Fri, 11 Oct 2024 16:14:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Maira Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org, arthurgrillo@riseup.net,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v12 09/15] drm/vkms: Remove useless drm_rotation_simplify
Message-ID: <20241011-lyrical-rebel-orca-52a60a@houat>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-9-01c1ada6fec8@bootlin.com>
 <Zwjxo2TEAR3PelO9@louis-chauvet-laptop>
 <608074ed-567c-4e6d-b1c2-9e0ecf1d102b@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mh3evp5i7kodpuvy"
Content-Disposition: inline
In-Reply-To: <608074ed-567c-4e6d-b1c2-9e0ecf1d102b@riseup.net>
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


--mh3evp5i7kodpuvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 10:53:52AM GMT, Maira Canal wrote:
> Hi Louis,
>=20
> On 10/11/24 06:36, Louis Chauvet wrote:
> >=20
> > Hi all,
> >=20
> > Until this point, this series has not received any major comments since
> > v9. I will commit patches 1-9 next week if there are no further comment=
s.
> >=20
>=20
> Although we are maintainers of VKMS, it isn't recommended that we push
> our own changes without even the Ack of another person. Please, read the
> "drm-misc Committer Guidelines" [1].

It's not that it's not recommended, it's that you shouldn't, really.

Maxime

--mh3evp5i7kodpuvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwkyuwAKCRAnX84Zoj2+
dtJiAYDYtRU8bOHWuM4htXQzC9QzV5j+6JizmH9edB8kva4xwLN/cpf/iK0j82ov
rdS6u24BgPVlpyT9nYkZN48z0BkjXKcyTetT773goNf/UwDBrMkdymaobdd+NzGM
ab60NUleEQ==
=lGK5
-----END PGP SIGNATURE-----

--mh3evp5i7kodpuvy--
